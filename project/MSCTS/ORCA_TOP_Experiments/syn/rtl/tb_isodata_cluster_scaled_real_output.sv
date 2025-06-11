
module tb_isodata_cluster;
    parameter N = 16;
    parameter K = 2;
    parameter Q = 32;

    logic clk, rst, start, done;
    logic [Q-1:0] x[N], y[N];
    logic [Q-1:0] centroid_x[K], centroid_y[K];

    isodata_cluster #(N, Q, K) dut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .x(x),
        .y(y),
        .done(done),
        .centroid_x(centroid_x),
        .centroid_y(centroid_y)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    integer file, r, i;
    real rx, ry;
    int scaled_x, scaled_y;

    initial begin
        file = $fopen("seq_loc.txt", "r");
        if (!file) begin
            $display("ERROR: Cannot open input file seq_loc.txt");
            $finish;
        end

        i = 0;
        while (!$feof(file) && i < N) begin
            r = $fscanf(file, "%f %f\n", rx, ry);
            scaled_x = rx * 1000; // scale to fixed-point
            scaled_y = ry * 1000;
            x[i] = scaled_x;
            y[i] = scaled_y;
            i++;
        end
        $fclose(file);

        rst = 1; start = 0; #20;
        rst = 0; start = 1; #10;
        start = 0;

        wait (done);
        $display("Clustering complete.");
        for (int j = 0; j < K; j++) begin
            $display("Centroid %0d: X = %0f, Y = %0f", j, centroid_x[j]/1000.0, centroid_y[j]/1000.0);
        end
        $finish;
    end
endmodule
