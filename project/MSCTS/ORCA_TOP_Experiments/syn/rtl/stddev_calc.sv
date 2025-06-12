module stddev_calc #(
    parameter DATA_WIDTH = 32,
    parameter NUM_POINTS = 64,
    parameter FRACTIONAL_BITS = 16
)(
    input  logic                     clk,
    input  logic                     rst,
    input  logic                     start,
    input  logic [DATA_WIDTH-1:0]   points_x [NUM_POINTS],
    input  logic [DATA_WIDTH-1:0]   points_y [NUM_POINTS],
    input  logic [DATA_WIDTH-1:0]   center_x,
    input  logic [DATA_WIDTH-1:0]   center_y,
    input  logic [$clog2(NUM_POINTS)-1:0] num_valid_points,

    output logic                    done,
    output logic [DATA_WIDTH-1:0]  stddev_x,
    output logic [DATA_WIDTH-1:0]  stddev_y
);

    typedef enum logic [1:0] {IDLE, ACCUMULATE, SQRT_X, SQRT_Y} state_t;
    state_t state, next_state;

    logic [DATA_WIDTH-1:0] sum_x, sum_y;
    logic [$clog2(NUM_POINTS):0] count;

    logic [DATA_WIDTH-1:0] diff_x, diff_y;
    logic [DATA_WIDTH-1:0] sq_diff_x, sq_diff_y;

    logic sqrt_start;
    logic sqrt_done;
    logic [DATA_WIDTH-1:0] sqrt_input;
    logic [DATA_WIDTH-1:0] sqrt_output;

    // Instantiate pipelined sqrt
    sqrt_newton #(
        .WIDTH(DATA_WIDTH),
        .FRACTIONAL_BITS(FRACTIONAL_BITS)
    ) sqrt_unit (
        .clk(clk),
        .rst(rst),
        .start(sqrt_start),
        .x(sqrt_input),
        .done(sqrt_done),
        .root(sqrt_output)
    );

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            state    <= IDLE;
            sum_x    <= 0;
            sum_y    <= 0;
            count    <= 0;
            done     <= 0;
            stddev_x <= 0;
            stddev_y <= 0;
        end else begin
            state <= next_state;

            case (state)
                IDLE: begin
                    done  <= 0;
                    if (start) begin
                        sum_x <= 0;
                        sum_y <= 0;
                        count <= 0;
                    end
                end
                ACCUMULATE: begin
                    if (count < num_valid_points) begin
                        diff_x    <= points_x[count] - center_x;
                        sq_diff_x <= (points_x[count] - center_x) * (points_x[count] - center_x);
                        sum_x     <= sum_x + sq_diff_x;

                        diff_y    <= points_y[count] - center_y;
                        sq_diff_y <= (points_y[count] - center_y) * (points_y[count] - center_y);
                        sum_y     <= sum_y + sq_diff_y;

                        count <= count + 1;
                    end
                end
                SQRT_X: begin
                    if (sqrt_done) begin
                        stddev_x <= sqrt_output;
                    end
                end
                SQRT_Y: begin
                    if (sqrt_done) begin
                        stddev_y <= sqrt_output;
                        done     <= 1;
                    end
                end
            endcase
        end
    end

    always_comb begin
        next_state  = state;
        sqrt_start  = 0;
        sqrt_input  = 0;

        case (state)
            IDLE:
                if (start)
                    next_state = ACCUMULATE;

            ACCUMULATE:
                if (count == num_valid_points)
                    next_state = SQRT_X;

            SQRT_X: begin
                sqrt_input = sum_x / num_valid_points;
                sqrt_start = 1;
                if (sqrt_done)
                    next_state = SQRT_Y;
            end

            SQRT_Y: begin
                sqrt_input = sum_y / num_valid_points;
                sqrt_start = 1;
                if (sqrt_done)
                    next_state = IDLE;
            end
        endcase
    end

endmodule

