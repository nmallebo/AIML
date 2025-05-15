module tb_binary_lif_neuron;

    parameter int WIDTH = 16;
    parameter int FRACTIONAL = 8;

    logic clk, rst;
    logic input_spike;
    logic spike_out;
    logic [WIDTH-1:0] leak_factor, threshold, reset_value;

    binary_lif_neuron #(
        .WIDTH(WIDTH),
        .FRACTIONAL(FRACTIONAL)
    ) dut (
        .clk(clk),
        .rst(rst),
        .input_spike(input_spike),
        .leak_factor(leak_factor),
        .threshold(threshold),
        .reset_value(reset_value),
        .spike_out(spike_out)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Convert real number to fixed-point Qm.n
    function logic [WIDTH-1:0] to_fixed(input real val);
        return val * (1 << FRACTIONAL);
    endfunction

    initial begin
        $display("Time\tIn\tPotential\tSpike");
        $monitor("%0t\t%b\t%d\t\t%b", $time, input_spike, dut.potential, spike_out);

        // Initialization
        clk = 0;
        rst = 1;
        input_spike = 0;
        leak_factor = to_fixed(0.9);         // ? = 0.9
        threshold = to_fixed(3.0);           // ? = 3.0
        reset_value = to_fixed(0.5);         // Reset to 0.5

        #10 rst = 0;

        // Scenario 1: Constant input below threshold
        $display("\n-- Scenario 1: Constant input below threshold --");
        repeat (5) begin
            input_spike = 1;
            #10;
        end

        // Scenario 2: Leakage with no input
        $display("\n-- Scenario 2: Leakage with no input --");
        input_spike = 0;
        repeat (10) #10;

        // Scenario 3: Input accumulates to threshold
        $display("\n-- Scenario 3: Accumulation to threshold --");
        repeat (15) begin
            input_spike = 1;
            #10;
        end

        // Scenario 4: Immediate spike from strong input
        $display("\n-- Scenario 4: Immediate spike from strong input --");
        threshold = to_fixed(1.0);
        input_spike = 1;
        #10;

        $finish;
    end

endmodule

