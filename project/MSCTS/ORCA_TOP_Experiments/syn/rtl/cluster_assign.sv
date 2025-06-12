module cluster_assign #(
    parameter WIDTH = 32,
    parameter NUM_CLUSTERS = 8,
    parameter NUM_POINTS = 128
)(
    input  logic clk,
    input  logic rst,
    input  logic start,
    input var  logic [WIDTH-1:0] points_x[NUM_POINTS],
    input var  logic [WIDTH-1:0] points_y[NUM_POINTS],
    input var  logic [WIDTH-1:0] centers_x[NUM_CLUSTERS],
    input var  logic [WIDTH-1:0] centers_y[NUM_CLUSTERS],
    output logic [$clog2(NUM_CLUSTERS)-1:0] assignments[NUM_POINTS],
    output logic done
);

    typedef enum logic [1:0] {IDLE, COMPUTE, DONE} state_t;
    state_t state, next_state;

    logic [$clog2(NUM_POINTS)-1:0] p_idx;
    logic [$clog2(NUM_CLUSTERS)-1:0] c_idx;
    logic [WIDTH-1:0] min_distance, curr_distance;
    logic [$clog2(NUM_CLUSTERS)-1:0] min_index;

    function [WIDTH-1:0] abs_diff(input [WIDTH-1:0] a, b);
        abs_diff = (a > b) ? (a - b) : (b - a);
    endfunction

    function [WIDTH-1:0] distance_sq(input [WIDTH-1:0] x1, y1, x2, y2);
        logic [WIDTH-1:0] dx, dy;
        dx = abs_diff(x1, x2);
        dy = abs_diff(y1, y2);
        distance_sq = dx * dx + dy * dy;
    endfunction

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            p_idx <= 0;
            c_idx <= 0;
            done <= 0;
        end else begin
            state <= next_state;

            case (state)
                IDLE: begin
                    if (start) begin
                        p_idx <= 0;
                        done <= 0;
                    end
                end
                COMPUTE: begin
                    min_distance <= '1;  // max value
                    for (c_idx = 0; c_idx < NUM_CLUSTERS; c_idx++) begin
                        curr_distance = distance_sq(points_x[p_idx], points_y[p_idx], centers_x[c_idx], centers_y[c_idx]);
                        if (curr_distance < min_distance) begin
                            min_distance <= curr_distance;
                            min_index <= c_idx;
                        end
                    end
                    assignments[p_idx] <= min_index;
                    p_idx <= p_idx + 1;
                end
                DONE: begin
                    done <= 1;
                end
            endcase
        end
    end

    always_comb begin
        case (state)
            IDLE:    next_state = start ? COMPUTE : IDLE;
            COMPUTE: next_state = (p_idx == NUM_POINTS) ? DONE : COMPUTE;
            DONE:    next_state = IDLE;
            default: next_state = IDLE;
        endcase
    end

endmodule

