module control_unit(
	input logic [3:0] opcode,
	
	output logic reg_write,
	output logic mem_read,
	output logic mem_write,
	output logic mem_to_reg,
	output logic immediate_to_reg,
	output logic [2:0] alu_operation,
	output logic jump_enable,
	output logic branch_enable,
	output logic output_enable
);

	always_comb begin
		reg_write = 0;
		mem_read = 0;
		mem_write = 0;
		mem_to_reg = 0;
		immediate_to_reg = 0;
		alu_operation = 3'b000;
		jump_enable = 0;
		branch_enable = 0;
		output_enable = 0;
		
		case(opcode)
			4'b0000: begin
			end
			4'b0001: begin
				reg_write = 1;
				immediate_to_reg = 1;
			end
			4'b0010: begin
				reg_write = 1;
				alu_operation = 3'b000;
			end
			4'b0011: begin
				reg_write = 1;
				alu_operation = 3'b001;
			end
			4'b0100: begin
				reg_write = 1;
				alu_operation = 3'b010;
			end
			4'b0101: begin
				reg_write = 1;
				alu_operation = 3'b011;
			end
			4'b0110: begin
				reg_write = 1;
				alu_operation = 3'b100;
			end
			4'b0111: begin
				reg_write = 1;
				mem_read = 1;
				mem_to_reg = 1;
			end
			4'b1000: begin
				mem_write = 1;
			end
			4'b1001: begin
				jump_enable = 1;
			end
			4'b1010: begin
				branch_enable = 1;
			end
			4'b1011: begin
				output_enable = 1;
			end
			4'b1100: begin
				reg_write = 1;
				alu_operation = 3'b101;
			end
			4'b1101: begin
				reg_write = 1;
				alu_operation = 3'b110;
			end
			4'b1110: begin
				reg_write = 1;
				alu_operation = 3'b111;
			end
			
			default: begin
			end
		endcase
	end
endmodule
				
			
			
			
		