module nn_spi_controller #(
    parameter int NUM_NEURONS = 4,
    parameter int SYNAPSE_WIDTH = 8,
    parameter int PARAM_WIDTH = 16,
    parameter int SPI_ADDR_WIDTH = 7,
    parameter int SPI_DATA_WIDTH = 32
)(
    // SPI Interface
    input logic sclk,
    input logic ss_n,
    input logic mosi,
    output logic miso,
    
    // Neural Network Control Interface
    output logic nn_reset_n,
    output logic [NUM_NEURONS-1:0] nn_input_spikes,
    input logic [NUM_NEURONS-1:0] nn_output_spikes,
    
    // Register File Interface
    output logic reg_prog_en,
    output logic [SPI_ADDR_WIDTH-1:0] reg_prog_addr,
    output logic [SPI_DATA_WIDTH-1:0] reg_prog_data
);

    // SPI Receiver Logic
    logic [SPI_ADDR_WIDTH+SPI_DATA_WIDTH:0] shift_reg;
    logic [3:0] bit_counter;
    logic spi_active;
    
    always_ff @(posedge sclk or negedge ss_n) begin
        if (!ss_n) begin
            shift_reg <= 0;
            bit_counter <= 0;
            spi_active <= 1;
        end else if (spi_active) begin
            shift_reg <= {shift_reg[SPI_ADDR_WIDTH+SPI_DATA_WIDTH-1:0], mosi};
            bit_counter <= bit_counter + 1;
            
            if (bit_counter == SPI_ADDR_WIDTH+SPI_DATA_WIDTH) begin
                spi_active <= 0;
            end
        end
    end

    // Command Decoding
    logic write_op;
    logic [SPI_ADDR_WIDTH-1:0] cmd_addr;
    logic [SPI_DATA_WIDTH-1:0] cmd_data;
    
    assign write_op = ~shift_reg[SPI_ADDR_WIDTH+SPI_DATA_WIDTH];
    assign cmd_addr = shift_reg[SPI_ADDR_WIDTH+SPI_DATA_WIDTH-1:SPI_DATA_WIDTH];
    assign cmd_data = shift_reg[SPI_DATA_WIDTH-1:0];

    // Register Programming Interface
    always_ff @(negedge ss_n) begin
        reg_prog_en <= spi_active && (bit_counter == SPI_ADDR_WIDTH+SPI_DATA_WIDTH);
        reg_prog_addr <= cmd_addr;
        reg_prog_data <= cmd_data;
    end

    // Neural Network Control Mapping
    always_comb begin
        nn_reset_n = 1'b1;
        nn_input_spikes = 0;
        
        // Special addresses for control
        if (reg_prog_en) begin
            case (cmd_addr)
                'h00: nn_reset_n = cmd_data[0];
                'h01: nn_input_spikes = cmd_data[NUM_NEURONS-1:0];
            endcase
        end
    end

    // SPI Transmitter Logic
    logic [SPI_DATA_WIDTH-1:0] read_data;
    
    always_comb begin
        case (cmd_addr)
            // Output spike status register
            'h02: read_data = {{(SPI_DATA_WIDTH-NUM_NEURONS){1'b0}}, nn_output_spikes};
            default: read_data = 0;
        endcase
    end

    assign miso = (spi_active && write_op && bit_counter >= SPI_ADDR_WIDTH) ? 
                 read_data[SPI_DATA_WIDTH-1 - (bit_counter - SPI_ADDR_WIDTH)] : 1'bz;

endmodule

