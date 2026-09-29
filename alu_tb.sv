module alu_tb;

    logic [7:0] a;
    logic [7:0] b;
    logic [2:0] operation;
    logic [7:0] result;

    alu dut (
        .a(a),
        .b(b),
        .operation(operation),
        .result(result)
    );

    initial begin

        // ADD: 5 + 3 = 8
        a = 8'd5;
        b = 8'd3;
        operation = 3'b000;
        #10;

        if (result != 8'd8)
            $display("ADD TEST FAILED");
        else
            $display("ADD TEST PASSED");


        // SUB: 5 - 3 = 2
        operation = 3'b001;
        #10;

        if (result != 8'd2)
            $display("SUB TEST FAILED");
        else
            $display("SUB TEST PASSED");


        // AND: 11001100 & 10101010 = 10001000
        a = 8'b11001100;
        b = 8'b10101010;
        operation = 3'b010;
        #10;

        if (result != 8'b10001000)
            $display("AND TEST FAILED");
        else
            $display("AND TEST PASSED");


        // OR: 11001100 | 10101010 = 11101110
        operation = 3'b011;
        #10;

        if (result != 8'b11101110)
            $display("OR TEST FAILED");
        else
            $display("OR TEST PASSED");


        // XOR: 11001100 ^ 10101010 = 01100110
        operation = 3'b100;
        #10;

        if (result != 8'b01100110)
            $display("XOR TEST FAILED");
        else
            $display("XOR TEST PASSED");

	
        // NOT: ~11001100 = 00110011
        a = 8'b11001100;
        operation = 3'b101;
        #10;

        if (result != 8'b00110011)
            $display("NOT TEST FAILED");
        else
            $display("NOT TEST PASSED");


        $stop;

    end

endmodule