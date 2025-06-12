module euclidean_distance #(
    parameter WIDTH = 32,
    parameter FRAC = 16
)(
    input  logic [WIDTH-1:0] x1, y1, x2, y2,
    output logic [WIDTH-1:0] distance
);
    logic [WIDTH-1:0] dx, dy, dx2, dy2, sum;

    assign dx = (x2 > x1) ? (x2 - x1) : (x1 - x2);
    assign dy = (y2 > y1) ? (y2 - y1) : (y1 - y2);
    assign dx2 = (dx * dx) >> FRAC;
    assign dy2 = (dy * dy) >> FRAC;
    assign sum = dx2 + dy2;

    sqrt_newton #(.WIDTH(WIDTH), .FRACTIONAL_BITS(FRAC)) sqrt_inst (
        .clk(clk), .rst(rst), .start(1'b1), .x(sum),
        .done(), .root(distance)
    );
endmodule

