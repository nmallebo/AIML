module top_spi_nn #(
    parameter NUM_NEURONS = 4,
    parameter SYNAPSE_WIDTH = 8,
    parameter PARAM_WIDTH = 16,
    parameter SPI_ADDR_WIDTH = 7,
    parameter SPI_DATA_WIDTH = 32,
    // Default neural parameters
    parameter real TAU = 10.0,
    parameter real V_THRESH = 1.0,
    parameter real V_RESET = 0.0,
    parameter real V_LEAK = 0.0,
    parameter real REFRACTORY_PERIOD = 5.0
)(
    // SPI Interface
    input logic sclk,
    input logic ss_n,
    input logic mosi,
    output logic miso,
    
    // Monitoring outputs
    output logic [NUM_NEURONS-1:0] monitor_spikes
);

    // Internal signals
    logic nn_reset_n;
    logic [NUM_NEURONS-1:0] input_spikes;
    logic [NUM_NEURONS-1:0] output_spikes;
    
    // Register file interface signals
    logic reg_prog_en;
    logic [SPI_ADDR_WIDTH-1:0] reg_prog_addr;
    logic [SPI_DATA_WIDTH-1:0] reg_prog_data;
    
    // Neural network parameters
    logic signed [SYNAPSE_WIDTH-1:0] weights_layer1 [0:NUM_NEURONS-1][0:NUM_NEURONS-1];
    logic signed [SYNAPSE_WIDTH-1:0] weights_layer2 [0:NUM_NEURONS-1][0:NUM_NEURONS-1];
    logic [PARAM_WIDTH-1:0] thresholds[NUM_NEURONS];
    logic [PARAM_WIDTH-1:0] resets[NUM_NEURONS];
    logic [PARAM_WIDTH-1:0] leaks[NUM_NEURONS];
    logic [PARAM_WIDTH-1:0] taus[NUM_NEURONS];
    logic [PARAM_WIDTH-1:0] refractory_periods[NUM_NEURONS];

    // Instantiate SPI Controller
    nn_spi_controller #(
        .NUM_NEURONS(NUM_NEURONS),
        .SYNAPSE_WIDTH(SYNAPSE_WIDTH),
        .PARAM_WIDTH(PARAM_WIDTH),
        .SPI_ADDR_WIDTH(SPI_ADDR_WIDTH),
        .SPI_DATA_WIDTH(SPI_DATA_WIDTH)
    ) spi_controller (
        .sclk(sclk),
        .ss_n(ss_n),
        .mosi(mosi),
        .miso(miso),
        .nn_reset_n(nn_reset_n),
        .nn_input_spikes(input_spikes),
        .nn_output_spikes(output_spikes),
        .reg_prog_en(reg_prog_en),
        .reg_prog_addr(reg_prog_addr),
        .reg_prog_data(reg_prog_data)
    );

    // Instantiate Register File
    nn_register_file #(
        .NUM_NEURONS(NUM_NEURONS),
        .SYNAPSE_WIDTH(SYNAPSE_WIDTH),
        .PARAM_WIDTH(PARAM_WIDTH)
    ) reg_file (
        .clk(sclk),
        .rst_n(nn_reset_n),
        .prog_en(reg_prog_en),
        .prog_addr(reg_prog_addr),
        .prog_data(reg_prog_data),
        .weights(weights_layer1), // Layer 1 weights
        .thresholds(thresholds),
        .resets(resets),
        .leaks(leaks),
        .taus(taus),
        .refractory_periods(refractory_periods)
    );

    // Instantiate Neural Network
    neural_network #(
        .NEURONS_PER_LAYER(NUM_NEURONS),
        .SYNAPSE_WIDTH(SYNAPSE_WIDTH),
        .CURRENT_WIDTH(SYNAPSE_WIDTH),
        .MEMBRANE_WIDTH(PARAM_WIDTH),
        .TAU(TAU),
        .V_THRESH(V_THRESH),
        .V_RESET(V_RESET),
        .V_LEAK(V_LEAK),
        .REFRACTORY_PERIOD(REFRACTORY_PERIOD),
        .L1_WEIGHTS(weights_layer1),
        .L2_WEIGHTS(weights_layer2)
    ) nn_core (
        .clk(sclk),
        .rst_n(nn_reset_n),
        .input_spikes(input_spikes),
        .output_spikes(output_spikes)
    );

    // Assign monitoring outputs
    assign monitor_spikes = output_spikes;

    // Synchronize weights for layer 2 (optional: can be configured separately)
    always_ff @(posedge sclk) begin
        for (int i = 0; i < NUM_NEURONS; i++) begin
            for (int j = 0; j < NUM_NEURONS; j++) begin
                weights_layer2[i][j] <= weights_layer1[i][j];
            end
        end
    end

endmodule

