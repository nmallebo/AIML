
module sqrt_tb();

    parameter CLK_PERIOD = 10;
    parameter WIDTH = 32;
    parameter FBITS = 16;
    parameter SF = 2.0**-16.0;  // Q8.8 scaling factor is 2^-8

    logic clk;
    logic start;             // start signal
    logic busy;              // calculation in progress
    logic valid;             // root and rem are valid
    logic [WIDTH-1:0] rad;   // radicand
    logic [WIDTH-1:0] root;  // root
    logic [WIDTH-1:0] rem;   // remainder
	
	integer infile, outfile;
	real result;
	real float_val;
	int status;

    sqrt #(.WIDTH(WIDTH), .FBITS(FBITS)) sqrt_inst (.*);

    always #(CLK_PERIOD / 2) clk = ~clk;

   /* initial begin
        $monitor("\t%d:\tsqrt(%f) = %b (%f) (rem = %b) (V=%b)",
                    $time, $itor(rad*SF), root, $itor(root*SF), rem, valid);
    end*/

   initial begin
                clk = 1;
				end
				
	initial begin
    // Open input and output files
    infile = $fopen("sqrt_input.txt", "r");
    if (infile == 0) begin
      $display("ERROR: Could not open input.txt");
      $finish;
    end

    outfile = $fopen("sqrt_output.txt", "w");
    if (outfile == 0) begin
      $display("ERROR: Could not open output.txt");
      $finish;
    end

    while (!$feof(infile)) begin
      status = $fscanf(infile, "%f\n", float_val);
      if (status == 1) begin
        rad = $rtoi(float_val * 2**16);
		$display(rad);
		start = 1;
        
		@(posedge clk); start = 0;
		
		repeat(11) @(posedge clk);
		wait(valid);
		result = $itor(root*SF);
		
        $fwrite(outfile, "%f -> %f\n", float_val, result);
		@(posedge clk);
		

      end
    end

    $fclose(infile);
    $fclose(outfile);
    $display("Finished processing inputs. Results in output.txt");
    $finish;
  end

      /*  #100    rad = 16'b1110_1000_1001_0000;  // 232.56250000
                start = 1;
        #10     start = 0;

        #120    rad = 16'b0000_0000_0100_0000;  // 0.25
                start = 1;
        #10     start = 0;

        #120    rad = 16'b0000_0010_0000_0000;  // 2.0
                start = 1;
        #10     start = 0;
        #120    $finish;*/
    //end
endmodule
/*
module sqrt_tb();

    parameter CLK_PERIOD = 10;
    parameter WIDTH = 16;
    parameter FBITS = 8;
    parameter SF = 2.0**-8.0;  // Q8.8 scaling factor is 2^-8

    logic clk;
    logic start;             // start signal
    logic busy;              // calculation in progress
    logic valid;             // root and rem are valid
    logic [WIDTH-1:0] rad;   // radicand
    logic [WIDTH-1:0] root;  // root
    logic [WIDTH-1:0] rem;   // remainder

    sqrt #(.WIDTH(WIDTH), .FBITS(FBITS)) sqrt_inst (.*);

    always #(CLK_PERIOD / 2) clk = ~clk;

    initial begin
        $monitor("\t%d:\tsqrt(%f) = %b (%f) (rem = %b) (V=%b)",
                    $time, $itor(rad*SF), root, $itor(root*SF), rem, valid);
    end

    initial begin
                clk = 1;

        #100    rad = 16'b1110_1000_1001_0000;  // 232.56250000
                start = 1;
        #10     start = 0;

        #120    rad = 16'b0000_0000_0100_0000;  // 0.25
                start = 1;
        #10     start = 0;

        #120    rad = 16'b0000_0010_0000_0000;  // 2.0
                start = 1;
        #10     start = 0;
        #120    $finish;
    end
endmodule
*/