module program_counter (
	input logic clk,
	input logic reset,
	input logic jump_enable,
	input logic branch_taken,
	input logic [7:0] jump_address,
	input logic [5:0] branch_offset,
	output logic [7:0] pc
);

	always_ff @(posedge clk) begin
		if (reset) begin
			pc <= 8'd0;
		end
		else if (jump_enable) begin
			pc <= jump_address;
		end
		else if (branch_taken) begin
			pc <= pc + {{2{branch_offset[5]}}, branch_offset};
		end
		else begin
			pc <= pc + 8'd1;
		end
	end
endmodule
			
		