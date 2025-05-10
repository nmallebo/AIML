module isodata_cluster #(
    parameter int N_SINKS     = 128,
    parameter int MAX_CLUSTERS = 16,
    parameter int INIT_K      = 4,
    parameter int WIDTH       = 16,  // Fixed-point Q8.8
    parameter int MAX_ITER    = 10,
    parameter int SPREAD_THRESH = 32,  // Example threshold
    parameter int MERGE_THRESH  = 16
)(
    input  logic clk,
    input  logic rst,
    input  logic start,

    input  logic signed [WIDTH-1:0] sink_x [N_SINKS],
    input  logic signed [WIDTH-1:0] sink_y [N_SINKS],

    output logic signed [WIDTH-1:0] centroid_x [MAX_CLUSTERS],
    output logic signed [WIDTH-1:0] centroid_y [MAX_CLUSTERS],
    output logic [$clog2(MAX_CLUSTERS)-1:0] assignments [N_SINKS],
    output logic done
);

    typedef enum logic [2:0] {
        IDLE, INIT, ASSIGN, ACCUM, UPDATE, SPREAD, SPLIT, MERGE, DONE
    } state_t;

    state_t state;
    int iter = 0;
    int num_clusters = INIT_K;

    // Internal buffers
    logic signed [WIDTH+7:0] sum_x [MAX_CLUSTERS];
    logic signed [WIDTH+7:0] sum_y [MAX_CLUSTERS];
    logic [$clog2(N_SINKS):0] count [MAX_CLUSTERS];

    logic [2*WIDTH-1:0] spread [MAX_CLUSTERS];

    // === FSM Control ===
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            iter <= 0;
            done <= 0;
        end else begin
            case (state)
                IDLE: begin
                    if (start) begin
                        num_clusters <= INIT_K;
                        iter <= 0;
                        state <= INIT;
                    end
                end

                INIT: begin
                    for (int k = 0; k < INIT_K; k++) begin
                        centroid_x[k] <= sink_x[k];
                        centroid_y[k] <= sink_y[k];
                    end
                    state <= ASSIGN;
                end

                ASSIGN: begin
                    for (int i = 0; i < N_SINKS; i++) begin
                        logic [2*WIDTH-1:0] best_dist = 32'hFFFF;
                        logic [$clog2(MAX_CLUSTERS)-1:0] best_k = 0;
                        for (int k = 0; k < num_clusters; k++) begin
                            logic signed [WIDTH:0] dx = sink_x[i] - centroid_x[k];
                            logic signed [WIDTH:0] dy = sink_y[i] - centroid_y[k];
                            logic [2*WIDTH-1:0] dist = dx*dx + dy*dy;
                            if (dist < best_dist) begin
                                best_dist = dist;
                                best_k = k;
                            end
                        end
                        assignments[i] <= best_k;
                    end
                    state <= ACCUM;
                end

                ACCUM: begin
                    for (int k = 0; k < MAX_CLUSTERS; k++) begin
                        sum_x[k] = 0;
                        sum_y[k] = 0;
                        count[k] = 0;
                    end
                    for (int i = 0; i < N_SINKS; i++) begin
                        int cid = assignments[i];
                        sum_x[cid] += sink_x[i];
                        sum_y[cid] += sink_y[i];
                        count[cid]++;
                    end
                    state <= UPDATE;
                end

                UPDATE: begin
                    for (int k = 0; k < num_clusters; k++) begin
                        if (count[k] > 0) begin
                            centroid_x[k] <= sum_x[k] / count[k];
                            centroid_y[k] <= sum_y[k] / count[k];
                        end
                    end
                    state <= SPREAD;
                end

                SPREAD: begin
                    for (int k = 0; k < num_clusters; k++) begin
                        logic [2*WIDTH-1:0] acc = 0;
                        for (int i = 0; i < N_SINKS; i++) begin
                            if (assignments[i] == k) begin
                                logic signed [WIDTH:0] dx = sink_x[i] - centroid_x[k];
                                logic signed [WIDTH:0] dy = sink_y[i] - centroid_y[k];
                                acc += dx*dx + dy*dy;
                            end
                        end
                        spread[k] = (count[k] > 0) ? (acc / count[k]) : 0;
                    end
                    state <= SPLIT;
                end

                SPLIT: begin
                    for (int k = 0; k < num_clusters; k++) begin
                        if (spread[k] > SPREAD_THRESH && count[k] > 10 && num_clusters < MAX_CLUSTERS - 1) begin
                            centroid_x[num_clusters] = centroid_x[k] + 5;
                            centroid_y[num_clusters] = centroid_y[k] - 5;
                            num_clusters++;
                        end
                    end
                    state <= MERGE;
                end

                MERGE: begin
                    for (int i = 0; i < num_clusters; i++) begin
                        for (int j = i+1; j < num_clusters; j++) begin
                            logic signed [WIDTH:0] dx = centroid_x[i] - centroid_x[j];
                            logic signed [WIDTH:0] dy = centroid_y[i] - centroid_y[j];
                            logic [2*WIDTH-1:0] dist = dx*dx + dy*dy;
                            if (dist < MERGE_THRESH && num_clusters > INIT_K) begin
                                centroid_x[i] = (centroid_x[i] + centroid_x[j]) >> 1;
                                centroid_y[i] = (centroid_y[i] + centroid_y[j]) >> 1;
                                for (int m = j; m < num_clusters-1; m++) begin
                                    centroid_x[m] = centroid_x[m+1];
                                    centroid_y[m] = centroid_y[m+1];
                                end
                                num_clusters--;
                            end
                        end
                    end
                    iter <= iter + 1;
                    if (iter >= MAX_ITER)
                        state <= DONE;
                    else
                        state <= ASSIGN;
                end

                DONE: begin
                    done <= 1;
                end
            endcase
        end
    end

endmodule

