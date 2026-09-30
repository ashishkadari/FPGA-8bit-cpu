module instruction_decoder_tb;

    logic [15:0] instruction;

    logic [3:0] opcode;
    logic [2:0] rd;
    logic [2:0] rs1;
    logic [2:0] rs2;

    logic [7:0] immediate;
    logic [7:0] address;
    logic [5:0] offset;

    instruction_decoder dut (
        .instruction(instruction),
        .opcode(opcode),
        .rd(rd),
        .rs1(rs1),
        .rs2(rs2),
        .immediate(immediate),
        .address(address),
        .offset(offset)
    );

    initial begin

        instruction = 16'b0001_001_00101010_0;
        #10;
        if (opcode != 4'b0001 || rd != 3'b001 || immediate != 8'd42)
            $display("LOADI TEST FAILED");
        else
            $display("LOADI TEST PASSED");

        instruction = 16'b0010_001_010_011_000;
        #10;
        if (opcode != 4'b0010 || rd != 3'b001 || rs1 != 3'b010 || rs2 != 3'b011)
            $display("ADD TEST FAILED");
        else
            $display("ADD TEST PASSED");

        instruction = 16'b0111_010_01100100_0;
        #10;
        if (opcode != 4'b0111 || rd != 3'b010 || address != 8'd100)
            $display("LOAD TEST FAILED");
        else
            $display("LOAD TEST PASSED");

        instruction = 16'b1000_011_10010110_0;
        #10;
        if (opcode != 4'b1000 || rs1 != 3'b011 || address != 8'd150)
            $display("STORE TEST FAILED");
        else
            $display("STORE TEST PASSED");

        instruction = 16'b1001_01111000_0000;
        #10;
        if (opcode != 4'b1001 || address != 8'd120)
            $display("JUMP TEST FAILED");
        else
            $display("JUMP TEST PASSED");

        instruction = 16'b1010_001_010_010100;
        #10;
        if (opcode != 4'b1010 || rs1 != 3'b001 || rs2 != 3'b010 || offset != 6'd20)
            $display("BEQ TEST FAILED");
        else
            $display("BEQ TEST PASSED");

        instruction = 16'b1011_100_000000000;
        #10;
        if (opcode != 4'b1011 || rs1 != 3'b100)
            $display("OUT TEST FAILED");
        else
            $display("OUT TEST PASSED");

        instruction = 16'b1100_101_110_000_000;
        #10;
        if (opcode != 4'b1100 || rd != 3'b101 || rs1 != 3'b110)
            $display("NOT TEST FAILED");
        else
            $display("NOT TEST PASSED");

        $stop;

    end

endmodule