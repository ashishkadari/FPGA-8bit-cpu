module program_counter_tb;
	logic clk;
	logic reset;
	logic [7:0] pc;
	
program_counter dut (
	.clk(clk),
	.reset(reset),
	.pc(pc)
);

	always #5 clk = ~clk;
	initial begin
		clk = 0;
		reset = 0;
		#20;
		if (pc != 8'd2)
			$display("PROGRAM COUNTER INCREMENT FAILED");
		else
			$display("PROGRAM COUNTER INCREMENT PASSED");
		reset = 1;
		#10;
		if (pc != 0)
			$display("RESET FAILED");
		else 
			$display("RESET PASSED");
			
		$stop;
	end
endmodule
		
			
		