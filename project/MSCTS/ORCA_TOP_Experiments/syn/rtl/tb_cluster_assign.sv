`timescale 1ns / 1ps

module tb_cluster_assign;

    parameter WIDTH = 32;
    parameter NUM_CLUSTERS = 2;
    parameter NUM_POINTS = 4;

    logic clk;
    logic rst;
    logic start;
    logic [WIDTH-1:0] points_x[NUM_POINTS];
    logic [WIDTH-1:0] points_y[NUM_POINTS];
    logic [WIDTH-1:0] centers_x[NUM_CLUSTERS];
    logic [WIDTH-1:0] centers_y[NUM_CLUSTERS];
    logic [$clog2(NUM_CLUSTERS)-1:0] assignments[NUM_POINTS];
    logic done;

    // Instantiate the module
    cluster_assign #(
        .WIDTH(WIDTH),
        .NUM_CLUSTERS(NUM_CLUSTERS),
        .NUM_POINTS(NUM_POINTS)
    ) dut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .points_x(points_x),
        .points_y(points_y),
        .centers_x(centers_x),
        .centers_y(centers_y),
        .assignments(assignments),
        .done(done)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        rst = 1;
        start = 0;

        // Reset pulse
        #10;
        rst = 0;

        // Initialize test data
        // Points: (1,1), (2,2), (10,10), (11,11)
        points_x[0] = 1;  points_y[0] = 1;
        points_x[1] = 2;  points_y[1] = 2;
        points_x[2] = 10; points_y[2] = 10;
        points_x[3] = 11; points_y[3] = 11;

        // Cluster centers: (0,0) and (10,10)
        centers_x[0] = 0;  centers_y[0] = 0;
        centers_x[1] = 10; centers_y[1] = 10;

        // Start clustering
        #10;
        start = 1;
        #10;
        start = 0;

        // Wait for done
        wait (done);

        // Display results
        $display("Assignments:");
        for (int i = 0; i < NUM_POINTS; i++) begin
            $display("Point %0d -> Cluster %0d", i, assignments[i]);
        end

        // Finish simulation
        #20;
        $finish;
    end

endmodule

