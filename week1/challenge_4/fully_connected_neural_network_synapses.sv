module fully_connected_neural_network #(
    parameter integer WIDTH = 16,                     // Bit-width of each neuron's potential
    parameter integer NUM_NEURONS_LAYER_1 = 4,        // Number of neurons in layer 1
    parameter integer NUM_NEURONS_LAYER_2 = 3,        // Number of neurons in layer 2
    parameter integer THRESHOLD = 1000,               // Spike threshold
    parameter integer LEAK = 10,                      // Membrane potential leak
    parameter integer RESET_POTENTIAL = 0,            // Reset potential after spike
    parameter integer REFRACTORY_CYCLES = 10          // Refractory period
)(
    input  logic clk,
    input  logic rst,
    input  logic signed [WIDTH-1:0] input_current,     // External input to all Layer 1 neurons
    output logic [NUM_NEURONS_LAYER_2-1:0] spikes_layer_2
);

    // Layer 1: spikes only
    logic spike_layer_1 [NUM_NEURONS_LAYER_1-1:0];

    // Layer 2: spike outputs and inputs from synapses
    logic signed [WIDTH-1:0] input_current_layer_2 [NUM_NEURONS_LAYER_2-1:0];
    logic spike_layer_2_int [NUM_NEURONS_LAYER_2-1:0];

    // Synaptic weights: programmable
    // Format: weights[from_layer_1][to_layer_2]
    logic signed [WIDTH-1:0] synaptic_weights [NUM_NEURONS_LAYER_1-1:0][NUM_NEURONS_LAYER_2-1:0];

    // Initialize synaptic weights (you could replace this with an input interface)
    initial begin : init_weights
        integer i, j;
        for (i = 0; i < NUM_NEURONS_LAYER_1; i = i + 1) begin
            for (j = 0; j < NUM_NEURONS_LAYER_2; j = j + 1) begin
                synaptic_weights[i][j] = (i + j + 1) * 10; // Example pattern
            end
        end
    end

    // Instantiate Layer 1 Neurons
    genvar i;
    generate
        for (i = 0; i < NUM_NEURONS_LAYER_1; i++) begin : layer_1_neurons
            lif_neuron #(
                .WIDTH(WIDTH),
                .THRESHOLD(THRESHOLD),
                .LEAK(LEAK),
                .RESET_POTENTIAL(RESET_POTENTIAL),
                .REFRACTORY_CYCLES(REFRACTORY_CYCLES)
            ) neuron_layer_1 (
                .clk(clk),
                .rst(rst),
                .input_current(input_current), // All receive same input
                .spike(spike_layer_1[i])
            );
        end
    endgenerate

    // Compute Layer 2 input currents based on synaptic inputs
    always_comb begin
        integer j, k;
        for (j = 0; j < NUM_NEURONS_LAYER_2; j = j + 1) begin
            input_current_layer_2[j] = 0;
            for (k = 0; k < NUM_NEURONS_LAYER_1; k = k + 1) begin
                if (spike_layer_1[k]) begin
                    input_current_layer_2[j] += synaptic_weights[k][j];
                end
            end
        end
    end

    // Instantiate Layer 2 Neurons with summed synaptic input
    generate
        for (i = 0; i < NUM_NEURONS_LAYER_2; i++) begin : layer_2_neurons
            lif_neuron #(
                .WIDTH(WIDTH),
                .THRESHOLD(THRESHOLD),
                .LEAK(LEAK),
                .RESET_POTENTIAL(RESET_POTENTIAL),
                .REFRACTORY_CYCLES(REFRACTORY_CYCLES)
            ) neuron_layer_2 (
                .clk(clk),
                .rst(rst),
                .input_current(input_current_layer_2[i]),
                .spike(spike_layer_2_int[i])
            );
        end
    endgenerate

    // Pack Layer 2 spikes for output
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            spikes_layer_2 <= '0;
        end else begin
            spikes_layer_2 <= {spike_layer_2_int[NUM_NEURONS_LAYER_2-1:0]};
        end
    end

endmodule

