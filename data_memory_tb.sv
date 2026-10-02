
module data_memory_tb;

    logic clk;
    logic [7:0] address;
    logic [7:0] write_data;
    logic write_enable;
    logic [7:0] read_data;

    data_memory dut (
        .clk(clk),
        .address(address),
        .write_data(write_data),
        .write_enable(write_enable),
        .read_data(read_data)
    );

    // Generate clock
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        // Test 1: Write 42 to address 100
        address = 8'd100;
        write_data = 8'd42;
        write_enable = 1;

        @(posedge clk);
        #1;

        // Disable writing and check the value
        write_enable = 0;
        #1;

        if (read_data == 8'd42)
            $display("MEMORY READ TEST PASSED");
        else
            $display("MEMORY READ TEST FAILED");

        // Test 2: Overwrite address 100 with 99
        write_data = 8'd99;
        write_enable = 1;

        @(posedge clk);
        #1;

        write_enable = 0;
        #1;

        if (read_data == 8'd99)
            $display("MEMORY OVERWRITE TEST PASSED");
        else
            $display("MEMORY OVERWRITE TEST FAILED");

        // Test 3: Write to a different address
        address = 8'd50;
        write_data = 8'd25;
        write_enable = 1;

        @(posedge clk);
        #1;

        write_enable = 0;
        #1;

        if (read_data == 8'd25)
            $display("SECOND ADDRESS TEST PASSED");
        else
            $display("SECOND ADDRESS TEST FAILED");

        $stop;
    end

endmodule