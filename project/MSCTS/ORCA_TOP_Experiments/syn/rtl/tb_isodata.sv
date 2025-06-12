module tb_isodata;

    parameter DATA_WIDTH = 32;
    parameter FRACTIONAL_BITS = 16;
    parameter NUM_POINTS = 128;
    parameter NUM_CLUSTERS = 8;

    logic clk = 0;
    logic rst = 1;
    logic start = 0;

    logic [DATA_WIDTH-1:0] points_x [NUM_POINTS];
    logic [DATA_WIDTH-1:0] points_y [NUM_POINTS];
    logic [DATA_WIDTH-1:0] init_centers_x [NUM_CLUSTERS];
    logic [DATA_WIDTH-1:0] init_centers_y [NUM_CLUSTERS];

    logic done;
    logic [DATA_WIDTH-1:0] new_centers_x [NUM_CLUSTERS];
    logic [DATA_WIDTH-1:0] new_centers_y [NUM_CLUSTERS];
    logic [$clog2(NUM_CLUSTERS)-1:0] assignments [NUM_POINTS];

    isodata_accelerator #(
        .DATA_WIDTH(DATA_WIDTH),
        .FRACTIONAL_BITS(FRACTIONAL_BITS),
        .NUM_POINTS(NUM_POINTS),
        .NUM_CLUSTERS(NUM_CLUSTERS)
    ) dut (
        .clk, .rst, .start,
        .points_x, .points_y,
        .init_centers_x, .init_centers_y,
        .done,
        .new_centers_x, .new_centers_y,
        .assignments
    );

    // Clock generation
    always #5 clk = ~clk;

    // Helper: Convert real to fixed-point
    function automatic logic signed [DATA_WIDTH-1:0] to_fixed(input real val);
        return $rtoi(val * (1 << FRACTIONAL_BITS));
    endfunction

    // Read sink coordinates from file
    initial begin
        real x, y;
        integer i = 0;
        integer file = $fopen("seq_loc.txt", "r");

        if (file == 0) begin
            $fatal("Failed to open input file.");
        end

        while (!$feof(file) && i < NUM_POINTS) begin
            void'($fscanf(file, "%f %f\n", x, y));
            points_x[i] = to_fixed(x);
            points_y[i] = to_fixed(y);
            i++;
        end

        $fclose(file);

        // Initialize cluster centers (could be random or first few points)
        for (int j = 0; j < NUM_CLUSTERS; j++) begin
            init_centers_x[j] = points_x[j];
            init_centers_y[j] = points_y[j];
        end

        rst = 1;
        #20;
        rst = 0;
        #10;
        start = 1;
        #10;
        start = 0;

        // Wait until done
        wait (done);
        $display("---- FINAL CLUSTER CENTERS ----");
        for (int j = 0; j < NUM_CLUSTERS; j++) begin
            $display("Center %0d: X = %f, Y = %f",
                j,
                $itor(new_centers_x[j]) / (1 << FRACTIONAL_BITS),
                $itor(new_centers_y[j]) / (1 << FRACTIONAL_BITS));
        end

        $display("---- POINT ASSIGNMENTS ----");
        for (int i = 0; i < NUM_POINTS; i++) begin
            $display("Point %0d assigned to cluster %0d", i, assignments[i]);
        end

        $finish;
    end
endmodule

