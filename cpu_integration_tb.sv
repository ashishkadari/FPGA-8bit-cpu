module cpu_integration_tb;

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

        @(posedge clk);
        #1;

        if (dut.register_file_unit.registers[1] != 8'd10)
            $display("LOADI R1 TEST FAILED");
        else
            $display("LOADI R1 TEST PASSED");

        @(posedge clk);
        #1;

        if (dut.register_file_unit.registers[2] != 8'd20)
            $display("LOADI R2 TEST FAILED");
        else
            $display("LOADI R2 TEST PASSED");

        @(posedge clk);
        #1;

        if (dut.register_file_unit.registers[3] != 8'd30)
            $display("ADD TEST FAILED");
        else
            $display("ADD TEST PASSED");

        @(posedge clk);
        #1;

        if (dut.data_memory_unit.memory[100] != 8'd30)
            $display("STORE TEST FAILED");
        else
            $display("STORE TEST PASSED");

        @(posedge clk);
        #1;

        if (dut.register_file_unit.registers[4] != 8'd30)
            $display("LOAD TEST FAILED");
        else
            $display("LOAD TEST PASSED");

        @(posedge clk);
        #1;

        if (dut.pc != 8'd7)
            $display("BEQ TEST FAILED");
        else
            $display("BEQ TEST PASSED");

        @(posedge clk);
        #1;

        if (dut.pc != 8'd9)
            $display("JUMP TEST FAILED");
        else
            $display("JUMP TEST PASSED");

        if (output_data != 8'd30)
            $display("OUT TEST FAILED");
        else
            $display("OUT TEST PASSED");

        $display("CPU INTEGRATION TEST COMPLETE");

        $stop;
    end

endmodule