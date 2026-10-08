module cpu_tb;

    logic clk;
    logic reset;
    logic [7:0] output_data;

    cpu dut (
        .clk(clk),
        .reset(reset),
        .output_data(output_data)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin

        reset = 1;

        @(posedge clk);
        #1;

        reset = 0;


        // LOADI R1, 10
        @(posedge clk);
        #1;

        if (dut.register_file_unit.registers[1] != 8'd10)
            $display("R1 TEST FAILED");
        else
            $display("R1 TEST PASSED");


        // LOADI R2, 20
        @(posedge clk);
        #1;

        if (dut.register_file_unit.registers[2] != 8'd20)
            $display("R2 TEST FAILED");
        else
            $display("R2 TEST PASSED");


        // ADD R3, R1, R2
        @(posedge clk);
        #1;

        if (dut.register_file_unit.registers[3] != 8'd30)
            $display("R3 TEST FAILED");
        else
            $display("R3 TEST PASSED");


        // STORE R3, [100]
        @(posedge clk);
        #1;

        if (dut.data_memory_unit.memory[100] != 8'd30)
            $display("STORE TEST FAILED");
        else
            $display("STORE TEST PASSED");


        // LOAD R4, [100]
        @(posedge clk);
        #1;

        if (dut.register_file_unit.registers[4] != 8'd30)
            $display("LOAD TEST FAILED");
        else
            $display("LOAD TEST PASSED");


        // OUT R4
        #1;

        if (output_data != 8'd30)
            $display("OUT TEST FAILED");
        else
            $display("OUT TEST PASSED");


        $stop;

    end

endmodule