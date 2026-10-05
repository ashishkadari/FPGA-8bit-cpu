module writeback_mux(
	input logic [7:0] alu_result,
	input logic [7:0] memory_data,
	input logic [7:0] immediate,
	input logic immediate_to_reg,
	input logic mem_to_reg,
	output logic [7:0] writeback_data
);

	always_comb begin
		case({immediate_to_reg, mem_to_reg})
			2'b00: writeback_data = alu_result;
			2'b01: writeback_data = memory_data;
			2'b10: writeback_data = immediate;
			2'b11: writeback_data = 8'b0;
		endcase
	end
endmodule
	