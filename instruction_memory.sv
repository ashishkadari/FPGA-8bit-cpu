module instruction_memory(
	input logic [7:0] address,
	output logic [15:0] instruction
);

	logic [15:0] memory [0:255];
	
	initial begin
		memory[0] = 16'b0001_001_00001010_0; // LOADI R1, 10
		memory[1] = 16'b0001_010_00010100_0; // LOADI R2, 20
		memory[2] = 16'b0010_011_001_010_000; // ADD R3, R1, R2
		memory[3] = 16'b1000_011_01100100_0; // STORE R3, [100]
		memory[4] = 16'b0111_100_01100100_0; // LOAD R4, [100]
		memory[5] = 16'b1011_100_000000000; // OUT R
	end
	assign instruction = memory[address];
	
endmodule