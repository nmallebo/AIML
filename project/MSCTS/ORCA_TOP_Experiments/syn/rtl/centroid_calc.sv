module centroid_calc #(
    parameter WIDTH = 32,
    parameter FRAC = 16,
    parameter MAX_POINTS = 256
)(
    input  logic clk,
    input  logic rst,
    input  logic start,
    input  logic [WIDTH-1:0] x_in, y_in,
    input  logic valid,
    input  logic [$clog2(MAX_POINTS)-1:0] total_points,
    output logic done,
    output logic [WIDTH-1:0] cx, cy
);
    logic [WIDTH-1:0] sum_x, sum_y;
    logic [$clog2(MAX_POINTS):0] count;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            sum_x <= 0; sum_y <= 0; count <= 0;
            done <= 0;
        end else if (start) begin
            if (valid) begin
                sum_x <= sum_x + x_in;
                sum_y <= sum_y + y_in;
                count <= count + 1;
                if (count == total_points - 1) begin
                    cx <= (sum_x + x_in) / total_points;
                    cy <= (sum_y + y_in) / total_points;
                    done <= 1;
                end
            end
        end
    end
endmodule

