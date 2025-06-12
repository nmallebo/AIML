module volume_estimation_unit #(
    parameter WIDTH = 32,
    parameter MAX_POINTS = 128
)(
    input  logic clk,
    input  logic rst,
    input  logic start,
    input  logic [$clog2(MAX_POINTS)-1:0] num_points,
    input  logic [WIDTH-1:0] center_x,
    input  logic [WIDTH-1:0] center_y,
    input  logic [WIDTH-1:0] points_x[MAX_POINTS],
    input  logic [WIDTH-1:0] points_y[MAX_POINTS],
    output logic [WIDTH-1:0] volume,
    output logic done
);

    logic [$clog2(MAX_POINTS)-1:0] idx;
    logic [WIDTH-1:0] dx, dy, dist_sq;
    logic [WIDTH-1:0] dist_sum;
    logic sqrt_start, sqrt_done;
    logic [WIDTH-1:0] sqrt_input, sqrt_output;

    sqrt_newton sqrt_inst (
        .clk(clk), .rst(rst), .start(sqrt_start), .x(sqrt_input),
        .done(sqrt_done), .root(sqrt_output)
    );

    typedef enum logic [1:0] {IDLE, CALC, SQRT, DONE} state_t;
    state_t state, next_state;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            idx <= 0;
            dist_sum <= 0;
            done <= 0;
            state <= IDLE;
        end else begin
            state <= next_state;
            case (state)
                IDLE: if (start) begin
                    idx <= 0;
                    dist_sum <= 0;
                    done <= 0;
                end
                CALC: begin
                    dx <= (points_x[idx] > center_x) ? (points_x[idx] - center_x) : (center_x - points_x[idx]);
                    dy <= (points_y[idx] > center_y) ? (points_y[idx] - center_y) : (center_y - points_y[idx]);
                    dist_sq <= dx * dx + dy * dy;
                    sqrt_start <= 1;
                    sqrt_input <= dist_sq;
                end
                SQRT: if (sqrt_done) begin
                    dist_sum <= dist_sum + sqrt_output;
                    idx <= idx + 1;
                    sqrt_start <= 0;
                end
                DONE: begin
                    volume <= dist_sum / num_points;
                    done <= 1;
                end
            endcase
        end
    end

    always_comb begin
        case (state)
            IDLE:    next_state = start ? CALC : IDLE;
            CALC:    next_state = SQRT;
            SQRT:    next_state = (idx == num_points - 1 && sqrt_done) ? DONE : CALC;
            DONE:    next_state = IDLE;
            default: next_state = IDLE;
        endcase
    end

endmodule

