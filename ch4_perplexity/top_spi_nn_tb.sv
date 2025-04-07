module top_spi_nn_tb;

    // Parameters
    localparam NUM_NEURONS = 4;
    localparam SPI_DATA_WIDTH = 32;
    
    // Signals
    logic sclk = 0;
    logic ss_n = 1;
    logic mosi = 0;
    logic miso;
    logic [NUM_NEURONS-1:0] monitor_spikes;

    // Clock generation
    always #5 sclk = ~sclk;

    // Instantiate DUT
    top_spi_nn #(
        .NUM_NEURONS(NUM_NEURONS)
    ) dut (
        .sclk(sclk),
        .ss_n(ss_n),
        .mosi(mosi),
        .miso(miso),
        .monitor_spikes(monitor_spikes)
    );

    // SPI Transaction Task
    task spi_transaction(input logic [6:0] addr, input logic [23:0] data, input logic rw);
        logic [31:0] packet = {rw, addr, data};
        
        ss_n = 0;
        for (int i = 31; i >= 0; i--) begin
            mosi = packet[i];
            #10; // 2 clock cycles per bit
        end
        ss_n = 1;
        #20;
    endtask

    // Test sequence
    initial begin
        // Reset sequence
        #20;
        spi_transaction(7'h00, 24'h0, 0); // Assert reset
        #100;
        spi_transaction(7'h00, 24'h1, 0); // Deassert reset
        
        // Program weights
        for (int i = 16; i < 32; i++) begin
            spi_transaction(i[6:0], $urandom(), 0);
        end
        
        // Inject input spikes
        spi_transaction(7'h01, 24'h3, 0); // Fire neurons 0 and 1
        #200;
        
        // Read output status
        spi_transaction(7'h02, 24'h0, 1);
        #100;
        
        $finish;
    end

    // Monitoring
    initial begin
        $timeformat(-9, 2, " ns", 10);
        $monitor("At %t: Output spikes = %b", $time, monitor_spikes);
    end

    // VCD dump
    initial begin
        $dumpfile("top_spi_nn.vcd");
        $dumpvars(0, top_spi_nn_tb);
    end

endmodule

