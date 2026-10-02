module control_unit_tb;

    logic [3:0] opcode;

    logic reg_write;
    logic mem_read;
    logic mem_write;
    logic mem_to_reg;
    logic immediate_to_reg;
    logic [2:0] alu_operation;
    logic jump_enable;
    logic branch_enable;
    logic output_enable;

    control_unit dut (
        .opcode(opcode),
        .reg_write(reg_write),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .mem_to_reg(mem_to_reg),
        .immediate_to_reg(immediate_to_reg),
        .alu_operation(alu_operation),
        .jump_enable(jump_enable),
        .branch_enable(branch_enable),
        .output_enable(output_enable)
    );

    initial begin

        // NOP
        opcode = 4'b0000;
        #10;

        if (reg_write == 0 && mem_read == 0 && mem_write == 0 &&
            mem_to_reg == 0 && immediate_to_reg == 0 &&
            jump_enable == 0 && branch_enable == 0 &&
            output_enable == 0)
            $display("NOP TEST PASSED");
        else
            $display("NOP TEST FAILED");


        // LOADI
        opcode = 4'b0001;
        #10;

        if (reg_write == 1 && immediate_to_reg == 1 &&
            mem_read == 0 && mem_write == 0 &&
            mem_to_reg == 0)
            $display("LOADI TEST PASSED");
        else
            $display("LOADI TEST FAILED");


        // ADD
        opcode = 4'b0010;
        #10;

        if (reg_write == 1 && alu_operation == 3'b000)
            $display("ADD TEST PASSED");
        else
            $display("ADD TEST FAILED");


        // SUB
        opcode = 4'b0011;
        #10;

        if (reg_write == 1 && alu_operation == 3'b001)
            $display("SUB TEST PASSED");
        else
            $display("SUB TEST FAILED");


        // AND
        opcode = 4'b0100;
        #10;

        if (reg_write == 1 && alu_operation == 3'b010)
            $display("AND TEST PASSED");
        else
            $display("AND TEST FAILED");


        // OR
        opcode = 4'b0101;
        #10;

        if (reg_write == 1 && alu_operation == 3'b011)
            $display("OR TEST PASSED");
        else
            $display("OR TEST FAILED");


        // XOR
        opcode = 4'b0110;
        #10;

        if (reg_write == 1 && alu_operation == 3'b100)
            $display("XOR TEST PASSED");
        else
            $display("XOR TEST FAILED");


        // LOAD
        opcode = 4'b0111;
        #10;

        if (reg_write == 1 && mem_read == 1 &&
            mem_to_reg == 1 && mem_write == 0)
            $display("LOAD TEST PASSED");
        else
            $display("LOAD TEST FAILED");


        // STORE
        opcode = 4'b1000;
        #10;

        if (reg_write == 0 && mem_write == 1 &&
            mem_read == 0)
            $display("STORE TEST PASSED");
        else
            $display("STORE TEST FAILED");


        // JUMP
        opcode = 4'b1001;
        #10;

        if (jump_enable == 1 && branch_enable == 0)
            $display("JUMP TEST PASSED");
        else
            $display("JUMP TEST FAILED");


        // BEQ
        opcode = 4'b1010;
        #10;

        if (branch_enable == 1 && jump_enable == 0)
            $display("BEQ TEST PASSED");
        else
            $display("BEQ TEST FAILED");


        // OUT
        opcode = 4'b1011;
        #10;

        if (output_enable == 1 && reg_write == 0)
            $display("OUT TEST PASSED");
        else
            $display("OUT TEST FAILED");


        // NOT
        opcode = 4'b1100;
        #10;

        if (reg_write == 1 && alu_operation == 3'b101)
            $display("NOT TEST PASSED");
        else
            $display("NOT TEST FAILED");


        // SHL
        opcode = 4'b1101;
        #10;

        if (reg_write == 1 && alu_operation == 3'b110)
            $display("SHL TEST PASSED");
        else
            $display("SHL TEST FAILED");


        // SHR
        opcode = 4'b1110;
        #10;

        if (reg_write == 1 && alu_operation == 3'b111)
            $display("SHR TEST PASSED");
        else
            $display("SHR TEST FAILED");


        $stop;

    end

endmodule