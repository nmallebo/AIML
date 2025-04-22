module nn_register_file #(
    parameter int NUM_NEURONS = 4,          // Number of neurons per layer
    parameter int SYNAPSE_WIDTH = 8,        // Synaptic weight bit width
    parameter int PARAM_WIDTH = 16,         // Neuron parameter bit width
    parameter int NUM_PARAM_REGS = 32       // Total number of parameter registers
)(
    input logic clk,
    input logic rst_n,
    // Programming interface
    input logic prog_en,
    input logic [$clog2(NUM_PARAM_REGS)-1:0] prog_addr,
    input logic [31:0] prog_data,
    // Network parameter outputs
    output logic signed [SYNAPSE_WIDTH-1:0] weights [0:NUM_NEURONS-1][0:NUM_NEURONS-1],
    output logic [PARAM_WIDTH-1:0] thresholds [0:NUM_NEURONS-1],
    output logic [PARAM_WIDTH-1:0] resets [0:NUM_NEURONS-1],
    output logic [PARAM_WIDTH-1:0] leaks [0:NUM_NEURONS-1],
    output logic [PARAM_WIDTH-1:0] taus [0:NUM_NEURONS-1],
    output logic [PARAM_WIDTH-1:0] refractory_periods [0:NUM_NEURONS-1]
);

    // Memory array for all parameters
    logic [31:0] param_regs [0:NUM_PARAM_REGS-1];

    // Write operation
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            for (int i = 0; i < NUM_PARAM_REGS; i++) begin
                param_regs[i] <= '0;
            end
        end else if (prog_en) begin
            param_regs[prog_addr] <= prog_data;
        end
    end

    // Parameter mapping - defines how register values map to network parameters
    always_comb begin
        // Default values
        for (int i = 0; i < NUM_NEURONS; i++) begin
            thresholds[i] = PARAM_WIDTH'(param_regs[0][PARAM_WIDTH-1:0]);
            resets[i] = PARAM_WIDTH'(param_regs[1][PARAM_WIDTH-1:0]);
            leaks[i] = PARAM_WIDTH'(param_regs[2][PARAM_WIDTH-1:0]);
            taus[i] = PARAM_WIDTH'(param_regs[3][PARAM_WIDTH-1:0]);
            refractory_periods[i] = PARAM_WIDTH'(param_regs[4][PARAM_WIDTH-1:0]);
        end

        // Weight matrix mapping (uses registers 16-31 in this example)
        for (int i = 0; i < NUM_NEURONS; i++) begin
            for (int j = 0; j < NUM_NEURONS; j++) begin
                int reg_idx = 16 + (i * NUM_NEURONS + j) / 4;
                int pos = (i * NUM_NEURONS + j) % 4;
                weights[i][j] = SYNAPSE_WIDTH'(param_regs[reg_idx][(pos+1)*SYNAPSE_WIDTH-1:pos*SYNAPSE_WIDTH]);
            end
        end
    end

endmodule

