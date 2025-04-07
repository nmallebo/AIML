module lif_neuron #(
    parameter int CURRENT_WIDTH = 8,
    parameter int MEMBRANE_WIDTH = 16,
    parameter real TAU = 10.0,         // Membrane time constant
    parameter real V_THRESH = 1.0,     // Threshold voltage
    parameter real V_RESET = 0.0,      // Reset voltage
    parameter real V_LEAK = 0.0,       // Leak voltage
    parameter real REFRACTORY_PERIOD = 5.0  // in clock cycles
)(
    input logic clk,
    input logic rst_n,
    input logic signed [CURRENT_WIDTH-1:0] current_in,
    output logic spike_out
);

    // Internal variables
    real v_membrane;
    real v_next;
    int refractory_counter;
    logic in_refractory;

    // Convert current input to real value (scaled)
    real current_real;
    assign current_real = $itor(current_in) / (2.0**(CURRENT_WIDTH-1));

    // Membrane potential update
    always_comb begin
        if (in_refractory) begin
            v_next = V_RESET;
        end else if (v_membrane >= V_THRESH) begin
            v_next = V_RESET;
        end else begin
            // LIF equation: dv/dt = (-(v - V_LEAK) + R*I)/?
            v_next = v_membrane + ((-(v_membrane - V_LEAK) + current_real) / TAU);
        end
    end

    // Sequential logic
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            v_membrane <= V_RESET;
            spike_out <= 0;
            refractory_counter <= 0;
            in_refractory <= 0;
        end else begin
            // Update membrane potential
            v_membrane <= v_next;

            // Spike generation
            spike_out <= (v_membrane >= V_THRESH) && !in_refractory;

            // Refractory period handling
            if (v_membrane >= V_THRESH) begin
                refractory_counter <= REFRACTORY_PERIOD;
                in_refractory <= 1;
            end else if (refractory_counter > 0) begin
                refractory_counter <= refractory_counter - 1;
            end else begin
                in_refractory <= 0;
            end
        end
    end

endmodule

