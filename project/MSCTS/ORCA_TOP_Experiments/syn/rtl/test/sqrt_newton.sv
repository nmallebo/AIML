module sqrt_newton #(
    parameter WIDTH = 32,
    parameter FRACTIONAL_BITS = 16,
    parameter TOLERANCE = 1,
    parameter MAX_ITER = 20
)(
    input  logic clk,
    input  logic rst,
    input  logic start,
    input  logic [WIDTH-1:0] x,
    output logic done,
    output logic [WIDTH-1:0] root
);

    typedef enum logic [1:0] {IDLE, INIT, ITERATE, DONE} state_t;
    state_t state, next_state;

    logic [WIDTH-1:0] guess, new_guess;
    logic [WIDTH-1:0] x_div_guess;
    logic [4:0] iter_count;

    // Fixed-point divide: assumed synthesizable on FPGA
    assign x_div_guess = x / guess;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            done <= 0;
            guess <= 0;
            root <= 0;
            iter_count <= 0;
        end else begin
            state <= next_state;
            case (state)
                IDLE: begin
                    done <= 0;
                    if (start) begin
                        guess <= x >> 1;
                        iter_count <= 0;
                    end
                end
                INIT: begin
                    new_guess <= (guess + x_div_guess) >> 1;
                    guess <= new_guess;
                    iter_count <= iter_count + 1;
                end
                ITERATE: begin
                    new_guess <= (guess + x_div_guess) >> 1;
                    if ((guess > new_guess ? guess - new_guess : new_guess - guess) < TOLERANCE || iter_count == MAX_ITER) begin
                        root <= new_guess;
                        done <= 1;
                    end
                    guess <= new_guess;
                    iter_count <= iter_count + 1;
                end
                DONE: begin
                    // Hold final result
                end
            endcase
        end
    end

    always_comb begin
        case (state)
            IDLE:    next_state = start ? INIT : IDLE;
            INIT:    next_state = ITERATE;
            ITERATE: next_state = (done) ? DONE : ITERATE;
            DONE:    next_state = IDLE;
            default: next_state = IDLE;
        endcase
    end

endmodule

