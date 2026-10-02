module data_memory (
	input logic clk,
	input logic [7:0] address,
	input logic [7:0] write_data,
	input logic write_enable,
	output logic [7:0] read_data
);

	logic [7:0] memory [0:255];
	
	assign read_data = memory[address];
	
	always_ff @(posedge clk) begin
		if (write_enable) begin
			memory[address] <= write_data;
			
		end
	end
endmodule