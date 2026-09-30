module program_counter (
	input logic clk,
	input logic reset,
	output logic [7:0] pc
);

	always_ff @(posedge clk) begin
		if (reset) begin
			pc <= 8'd0;
		end
		else begin
			pc <= pc + 8'd1;
		end
	end
endmodule
			
		