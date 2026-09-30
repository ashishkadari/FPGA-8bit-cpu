module register_file (
	input logic clk,
	input logic [2:0] read_addr_a,
	output logic [7:0] read_data_a,
	input logic [2:0] read_addr_b,
	output logic [7:0] read_data_b,
	input logic [2:0] write_addr,
	input logic [7:0] write_data,
	input logic	write_enable
	
);
	
	logic [7:0] registers [0:7];
	assign read_data_a = registers[read_addr_a];
	assign read_data_b = registers[read_addr_b];
	
	always_ff @(posedge clk) begin
		if (write_enable) begin
			 registers[write_addr] <= write_data;
		end
	end
	
endmodule
	