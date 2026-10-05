module writeback_mux_tb;

    logic [7:0] alu_result;
    logic [7:0] memory_data;
    logic [7:0] immediate;
    logic immediate_to_reg;
    logic mem_to_reg;
    logic [7:0] writeback_data;

    writeback_mux dut (
        .alu_result(alu_result),
        .memory_data(memory_data),
        .immediate(immediate),
        .immediate_to_reg(immediate_to_reg),
        .mem_to_reg(mem_to_reg),
        .writeback_data(writeback_data)
    );

    initial begin

        alu_result = 8'd30;
        memory_data = 8'd42;
        immediate = 8'd10;

        immediate_to_reg = 0;
        mem_to_reg = 0;
        #10;

        if (writeback_data != 8'd30)
            $display("ALU TEST FAILED");
        else
            $display("ALU TEST PASSED");


        immediate_to_reg = 0;
        mem_to_reg = 1;
        #10;

        if (writeback_data != 8'd42)
            $display("MEMORY TEST FAILED");
        else
            $display("MEMORY TEST PASSED");


        immediate_to_reg = 1;
        mem_to_reg = 0;
        #10;

        if (writeback_data != 8'd10)
            $display("IMMEDIATE TEST FAILED");
        else
            $display("IMMEDIATE TEST PASSED");


        immediate_to_reg = 1;
        mem_to_reg = 1;
        #10;

        if (writeback_data != 8'd0)
            $display("INVALID TEST FAILED");
        else
            $display("INVALID TEST PASSED");


        $stop;

    end

endmodule