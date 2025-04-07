module neural_network #(
    parameter int NEURONS_PER_LAYER = 4,
    parameter int SYNAPSE_WIDTH = 8,
    parameter int CURRENT_WIDTH = 8,
    parameter int MEMBRANE_WIDTH = 16,
    parameter real TAU = 10.0,
    parameter real V_THRESH = 1.0,
    parameter real V_RESET = 0.0,
    parameter real REFRACTORY_PERIOD = 5.0
)(
    input logic clk,
    input logic rst_n,
    input logic [NEURONS_PER_LAYER-1:0] input_spikes,
    output logic [NEURONS_PER_LAYER-1:0] output_spikes,
    // Synapse programming interface
    input logic synapse_prog_en,
    input logic [$clog2(NEURONS_PER_LAYER*NEURONS_PER_LAYER)-1:0] synapse_addr,
    input logic signed [SYNAPSE_WIDTH-1:0] synapse_data
);

    // Synaptic weight memory
    logic signed [SYNAPSE_WIDTH-1:0] synaptic_weights [0:NEURONS_PER_LAYER-1][0:NEURONS_PER_LAYER-1];
    
    // Layer connections
    logic signed [CURRENT_WIDTH-1:0] layer_currents [0:NEURONS_PER_LAYER-1];
    logic [NEURONS_PER_LAYER-1:0] hidden_spikes;

    // Synapse programming
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            for (int i = 0; i < NEURONS_PER_LAYER; i++) begin
                for (int j = 0; j < NEURONS_PER_LAYER; j++) begin
                    synaptic_weights[i][j] <= 0;
                end
            end
        end else if (synapse_prog_en) begin
            synaptic_weights[synapse_addr / NEURONS_PER_LAYER][synapse_addr % NEURONS_PER_LAYER] <= synapse_data;
        end
    end

    // First layer: Input to Hidden
    generate
        for (genvar i = 0; i < NEURONS_PER_LAYER; i++) begin : hidden_layer
            // Convert input spikes to currents
            always_comb begin
                layer_currents[i] = 0;
                for (int j = 0; j < NEURONS_PER_LAYER; j++) begin
                    if (input_spikes[j]) begin
                        layer_currents[i] += synaptic_weights[j][i];
                    end
                end
            end

            // Instantiate hidden layer neuron
            lif_neuron #(
                .CURRENT_WIDTH(CURRENT_WIDTH),
                .MEMBRANE_WIDTH(MEMBRANE_WIDTH),
                .TAU(TAU),
                .V_THRESH(V_THRESH),
                .V_RESET(V_RESET),
                .REFRACTORY_PERIOD(REFRACTORY_PERIOD)
            ) hidden_neuron (
                .clk(clk),
                .rst_n(rst_n),
                .current_in(layer_currents[i]),
                .spike_out(hidden_spikes[i])
            );
        end
    endgenerate

    // Second layer: Hidden to Output
    generate
        for (genvar i = 0; i < NEURONS_PER_LAYER; i++) begin : output_layer
            // Convert hidden spikes to currents
            always_comb begin
                layer_currents[i] = 0;
                for (int j = 0; j < NEURONS_PER_LAYER; j++) begin
                    if (hidden_spikes[j]) begin
                        layer_currents[i] += synaptic_weights[j][i];
                    end
                end
            end

            // Instantiate output layer neuron
            lif_neuron #(
                .CURRENT_WIDTH(CURRENT_WIDTH),
                .MEMBRANE_WIDTH(MEMBRANE_WIDTH),
                .TAU(TAU),
                .V_THRESH(V_THRESH),
                .V_RESET(V_RESET),
                .REFRACTORY_PERIOD(REFRACTORY_PERIOD)
            ) output_neuron (
                .clk(clk),
                .rst_n(rst_n),
                .current_in(layer_currents[i]),
                .spike_out(output_spikes[i])
            );
        end
    endgenerate

endmodule

