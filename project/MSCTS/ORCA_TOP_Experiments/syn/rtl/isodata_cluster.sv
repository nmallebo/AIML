
module isodata_cluster #(parameter N = 5196, parameter Q = 16, parameter K = 10, parameter MAX_ITER = 10)(
    input logic clk,
    input logic rst,
    input logic start,
    input logic [Q-1:0] x[N],
    input logic [Q-1:0] y[N],
    output logic done,
    output logic [Q-1:0] centroid_x[K],
    output logic [Q-1:0] centroid_y[K]
);
    typedef enum logic [1:0] {
        IDLE, INIT, COMPUTE, UPDATE
    } state_t;

    state_t state;
    logic [Q-1:0] cx[K], cy[K];
    logic [Q-1:0] prev_cx[K], prev_cy[K];
    int cluster_sum_x[K], cluster_sum_y[K], cluster_count[K];
    int i, j, dx, dy, distance, iter;
    int min_idx, min_dist;
    logic converged;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            done <= 0;
        end else begin
            case (state)
                IDLE: begin
                    if (start) begin
                        for (j = 0; j < K; j++) begin
                            cx[j] <= x[j];
                            cy[j] <= y[j];
                        end
                        iter <= 0;
                        done <= 0;
                        state <= INIT;
                    end
                end

                INIT: begin
                    for (j = 0; j < K; j++) begin
                        cluster_sum_x[j] = 0;
                        cluster_sum_y[j] = 0;
                        cluster_count[j] = 0;
                        prev_cx[j] <= cx[j];
                        prev_cy[j] <= cy[j];
                    end
                    i = 0;
                    state <= COMPUTE;
                end

                COMPUTE: begin
                    if (i < N) begin
                        min_idx = 0;
                        min_dist = 32'h7FFFFFFF;
                        for (j = 0; j < K; j++) begin
                            dx = $signed(x[i]) - $signed(cx[j]);
                            dy = $signed(y[i]) - $signed(cy[j]);
                            distance = dx*dx + dy*dy;
                            if (distance < min_dist) begin
                                min_dist = distance;
                                min_idx = j;
                            end
                        end
                        cluster_sum_x[min_idx] += x[i];
                        cluster_sum_y[min_idx] += y[i];
                        cluster_count[min_idx]++;
                        i++;
                    end else begin
                        state <= UPDATE;
                    end
                end

                UPDATE: begin
                    converged = 1;
                    for (j = 0; j < K; j++) begin
                        if (cluster_count[j] != 0) begin
                            cx[j] <= cluster_sum_x[j] / cluster_count[j];
                            cy[j] <= cluster_sum_y[j] / cluster_count[j];
                        end
                        if (cx[j] != prev_cx[j] || cy[j] != prev_cy[j]) begin
                            converged = 0;
                        end
                    end
                    iter <= iter + 1;
                    if (converged || iter >= MAX_ITER) begin
                        for (j = 0; j < K; j++) begin
                            centroid_x[j] <= cx[j];
                            centroid_y[j] <= cy[j];
                        end
                        done <= 1;
                        state <= IDLE;
                    end else begin
                        state <= INIT;
                    end
                end
            endcase
        end
    end
endmodule
