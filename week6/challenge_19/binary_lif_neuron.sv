module binary_lif_neuron #(
    parameter int WIDTH = 16,
    parameter int FRACTIONAL = 8  // Q8.8 fixed-point format
)(
    input  logic clk,
    input  logic rst,
    input  logic input_spike,                         // I(t): binary input (0 or 1)
    input  logic [WIDTH-1:0] leak_factor,             // ?: leak (0 < ? < 1)
    input  logic [WIDTH-1:0] threshold,               // ?: threshold
    input  logic [WIDTH-1:0] reset_value,             // Reset value after spike
    output logic spike_out                            // S(t): output spike
);

    logic [WIDTH-1:0] potential, next_potential;
    logic [WIDTH*2-1:0] mult_result;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            potential <= 0;
            spike_out <= 0;
        end else begin
            // Apply leak: potential = (potential * leak_factor) >> FRACTIONAL
            mult_result = potential * leak_factor;
            next_potential = mult_result[WIDTH+FRACTIONAL-1:FRACTIONAL];

            // Add input spike if any (1.0 in Q format is 1 << FRACTIONAL)
            if (input_spike)
                next_potential = next_potential + (1 << FRACTIONAL);

            // Check for threshold
            if (next_potential >= threshold) begin
                spike_out <= 1;
                potential <= reset_value;
            end else begin
                spike_out <= 0;
                potential <= next_potential;
            end
        end
    end

endmodule

