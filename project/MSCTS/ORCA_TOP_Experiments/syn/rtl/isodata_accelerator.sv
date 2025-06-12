`include "../rtl/cluster_assign.sv"
`include "../rtl/centroid_calc.sv"
`include "../rtl/stddev_calc.sv"
`include "../rtl/volume_estimation_unit.sv"
`include "../rtl/sqrt_newton.sv"
`include "../rtl/euclidean_distance.sv"

// isodata_accelerator.sv

module isodata_accelerator #(
    parameter DATA_WIDTH       = 32,
    parameter FRACTIONAL_BITS  = 16,
    parameter NUM_POINTS       = 128,
    parameter NUM_CLUSTERS     = 8
)(
    input  logic                          clk,
    input  logic                          rst,
    input  logic                          start,
    input  logic [DATA_WIDTH-1:0]        points_x [NUM_POINTS],
    input  logic [DATA_WIDTH-1:0]        points_y [NUM_POINTS],
    input  logic [DATA_WIDTH-1:0]        init_centers_x [NUM_CLUSTERS],
    input  logic [DATA_WIDTH-1:0]        init_centers_y [NUM_CLUSTERS],

    output logic                         done,
    output logic [DATA_WIDTH-1:0]        new_centers_x [NUM_CLUSTERS],
    output logic [DATA_WIDTH-1:0]        new_centers_y [NUM_CLUSTERS],
    output logic [$clog2(NUM_CLUSTERS)-1:0] assignments [NUM_POINTS]
);

    // Internal registers and signals
    logic [DATA_WIDTH-1:0] cluster_centers_x [NUM_CLUSTERS];
    logic [DATA_WIDTH-1:0] cluster_centers_y [NUM_CLUSTERS];

    logic cluster_calc_start, cluster_calc_done;
    logic stddev_start, stddev_done;
    logic volume_start, volume_done;

    logic [$clog2(NUM_CLUSTERS)-1:0] cluster_idx;

    // Intermediate wires for output ports from submodules
    logic [DATA_WIDTH-1:0] cx_temp, cy_temp;
    logic [DATA_WIDTH-1:0] stddev_x_temp, stddev_y_temp;
    logic [DATA_WIDTH-1:0] volume_temp;

    // Example assignments for cluster centers (initialize with input centers)
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            cluster_centers_x <= init_centers_x;
            cluster_centers_y <= init_centers_y;
        end
    end

    // Centroid calculation instance
    centroid_calc #(
        .WIDTH(DATA_WIDTH),
        .FRAC(FRACTIONAL_BITS),
        .MAX_POINTS(NUM_POINTS)
    ) centroid_unit (
        .clk(clk),
        .rst(rst),
        .start(cluster_calc_start),
        .x_in(points_x[cluster_idx]),       // example: one point per cycle, adjust as needed
        .y_in(points_y[cluster_idx]),
        .valid(1'b1),                       // assume always valid for now
        .total_points(NUM_POINTS[$clog2(NUM_POINTS)-1:0]),
        .done(cluster_calc_done),
        .cx(cx_temp),
        .cy(cy_temp)
    );

    // Standard deviation calculation instance
    stddev_calc #(
        .DATA_WIDTH(DATA_WIDTH),
        .NUM_POINTS(NUM_POINTS),
        .FRACTIONAL_BITS(FRACTIONAL_BITS)
    ) stddev_unit (
        .clk(clk),
        .rst(rst),
        .start(stddev_start),
        .points_x(points_x),
        .points_y(points_y),
        .center_x(cx_temp),
        .center_y(cy_temp),
        .num_valid_points(NUM_POINTS[$clog2(NUM_POINTS)-1:0]),
        .done(stddev_done),
        .stddev_x(stddev_x_temp),
        .stddev_y(stddev_y_temp)
    );

    // Volume estimation instance
    volume_estimation_unit #(
        .WIDTH(DATA_WIDTH),
        .MAX_POINTS(NUM_POINTS)
    ) volume_unit (
        .clk(clk),
        .rst(rst),
        .start(volume_start),
        .num_points(NUM_POINTS[$clog2(NUM_POINTS)-1:0]),
        .center_x(cx_temp),
        .center_y(cy_temp),
        .points_x(points_x),
        .points_y(points_y),
        .volume(volume_temp),
        .done(volume_done)
    );

    // Cluster assignment instance
    cluster_assign #(
        .WIDTH(DATA_WIDTH),
        .NUM_CLUSTERS(NUM_CLUSTERS),
        .NUM_POINTS(NUM_POINTS)
    ) assign_unit (
        .clk(clk),
        .rst(rst),
        .start(start),
        .points_x(points_x),
        .points_y(points_y),
        .centers_x(cluster_centers_x),
        .centers_y(cluster_centers_y),
        .assignments(assignments),
        .done(done)
    );

    // sqrt_newton and euclidean_distance can be instantiated similarly if needed
    // Add your logic and control signals for them

endmodule

