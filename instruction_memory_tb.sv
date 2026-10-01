module instruction_memory_tb;

	logic [7:0] address;
	logic [15:0] instruction;

	instruction_memory dut (
		.address(address),
		.instruction(instruction)
	);

	initial begin

		address = 8'd0;
		#10;

		if (instruction != 16'b0001_001_00001010_0)
			$display("INSTRUCTION 0 TEST FAILED");
		else
			$display("INSTRUCTION 0 TEST PASSED");


		address = 8'd1;
		#10;

		if (instruction != 16'b0001_010_00010100_0)
			$display("INSTRUCTION 1 TEST FAILED");
		else
			$display("INSTRUCTION 1 TEST PASSED");


		address = 8'd2;
		#10;

		if (instruction != 16'b0010_011_001_010_000)
			$display("INSTRUCTION 2 TEST FAILED");
		else
			$display("INSTRUCTION 2 TEST PASSED");


		address = 8'd3;
		#10;

		if (instruction != 16'b1000_011_01100100_0)
			$display("INSTRUCTION 3 TEST FAILED");
		else
			$display("INSTRUCTION 3 TEST PASSED");


		address = 8'd4;
		#10;

		if (instruction != 16'b0111_100_01100100_0)
			$display("INSTRUCTION 4 TEST FAILED");
		else
			$display("INSTRUCTION 4 TEST PASSED");


		address = 8'd5;
		#10;

		if (instruction != 16'b1011_100_000000000)
			$display("INSTRUCTION 5 TEST FAILED");
		else
			$display("INSTRUCTION 5 TEST PASSED");


		$stop;

	end

endmodule