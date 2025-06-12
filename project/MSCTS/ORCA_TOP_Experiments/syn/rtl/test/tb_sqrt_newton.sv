`timescale 1ns / 1ps

module tb_sqrt_newton;

    parameter WIDTH = 32;
    parameter FRACTIONAL_BITS = 16;

    logic clk, rst, start;
    logic [WIDTH-1:0] x;
    logic done;
    logic [WIDTH-1:0] root;

    sqrt_newton #(
        .WIDTH(WIDTH),
        .FRACTIONAL_BITS(FRACTIONAL_BITS)
    ) uut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .x(x),
        .done(done),
        .root(root)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;  // 100MHz

    // File handling
    integer infile, outfile;
    real float_x;
    int fixed_x, fixed_root;

    initial begin
        rst = 1;
        start = 0;
        #20 rst = 0;

        infile = $fopen("sqrt_input.txt", "r");
        outfile = $fopen("sqrt_output.txt", "w");

        if (infile == 0 || outfile == 0) begin
            $display("ERROR opening file.");
            $finish;
        end

        while (!$feof(infile)) begin
            // Read float, convert to fixed
            void'($fscanf(infile, "%f\n", float_x));
            fixed_x = $rtoi(float_x * (1 << FRACTIONAL_BITS));

            // Apply input
            x = fixed_x;
            start = 1;
            @(posedge clk);
            start = 0;

            // Wait for done
            wait (done);
            fixed_root = root;

            // Convert root back to float and write to file
            $fwrite(outfile, "%f -> %f\n", float_x, fixed_root * 1.0 / (1 << FRACTIONAL_BITS));
            @(posedge clk);
        end

        $fclose(infile);
        $fclose(outfile);
        $display("Test complete, output saved in sqrt_output.txt");
        $finish;
    end

endmodule

