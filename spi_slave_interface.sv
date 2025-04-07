module spi_slave_interface #(
    parameter integer WIDTH = 16
)(
    input  logic clk,               // System clock
    input  logic rst,               // Reset

    // SPI lines
    input  logic sclk,             // SPI clock
    input  logic cs_n,             // Active-low chip select
    input  logic mosi,             // Master out, slave in
    output logic miso,             // Master in, slave out

    // Register interface
    output logic wr_en,                            // Write enable (1 cycle pulse)
    output logic [15:0] addr,                      // Address
    output logic signed [WIDTH-1:0] wr_data,       // Write data
    input  logic signed [WIDTH-1:0] rd_data        // Read data (from register file)
);

    typedef enum logic [1:0] {
        IDLE,
        SHIFT_IN,
        SHIFT_OUT
    } spi_state_t;

    spi_state_t state, next_state;

    logic [5:0] bit_count;
    logic [31:0] shift_reg;          // Shift register for input
    logic [WIDTH-1:0] read_buffer;   // Output shift register for reads
    logic spi_done;

    logic sclk_prev;
    logic sclk_rising;
    logic sclk_falling;

    // Edge detection on SCLK (for sysclk domain logic)
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            sclk_prev <= 0;
        end else begin
            sclk_prev <= sclk;
        end
    end

    assign sclk_rising  = (sclk == 1) && (sclk_prev == 0);
    assign sclk_falling = (sclk == 0) && (sclk_prev == 1);

    // FSM
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
        end else begin
            state <= next_state;
        end
    end

    always_comb begin
        next_state = state;
        case (state)
            IDLE: if (!cs_n) next_state = SHIFT_IN;
            SHIFT_IN: if (bit_count == 32) next_state = SHIFT_OUT;
            SHIFT_OUT: if (cs_n) next_state = IDLE;
        endcase
    end

    // Shift in bits from MOSI on rising edge of SCLK
    always_ff @(posedge clk or posedge rst) begin
        if (rst || cs_n) begin
            shift_reg <= 0;
            bit_count <= 0;
        end else if (state == SHIFT_IN && sclk_rising) begin
            shift_reg <= {shift_reg[30:0], mosi};
            bit_count <= bit_count + 1;
        end
    end

    // Write logic
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            wr_en <= 0;
        end else begin
            wr_en <= 0;  // Default
            if (state == SHIFT_IN && bit_count == 32) begin
                addr    <= shift_reg[30:16];
                wr_data <= shift_reg[15:0];
                if (!shift_reg[31]) begin  // Write command
                    wr_en <= 1;
                end
            end
        end
    end

    // Load read data for shift-out
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            read_buffer <= 0;
        end else if (state == SHIFT_IN && bit_count == 32 && shift_reg[31]) begin
            read_buffer <= rd_data;  // Load output if it's a read
        end else if (state == SHIFT_OUT && sclk_falling) begin
            read_buffer <= {read_buffer[WIDTH-2:0], 1'b0};
        end
    end

    // Drive MISO
    assign miso = (state == SHIFT_OUT && shift_reg[31]) ? read_buffer[WIDTH-1] : 1'bZ;

endmodule

