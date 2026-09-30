module register_file_tb; 
	logic clk;
	logic [2:0] read_addr_a;
	logic [7:0] read_data_a;
	logic [2:0] read_addr_b;
	logic [7:0] read_data_b;
	logic [2:0] write_addr;
	logic [7:0] write_data;
	logic	write_enable;
	
register_file dut (
	.clk(clk),
	.read_addr_a(read_addr_a),
	.read_data_a(read_data_a),
	.read_addr_b(read_addr_b),
	.read_data_b(read_data_b),
	.write_addr(write_addr),
	.write_data(write_data),
	.write_enable(write_enable)
	
);
	always #5 clk = ~clk;
	initial begin
		clk = 0;
		write_enable = 1;
		write_addr = 3'b011;
		write_data = 8'd42;
	
		#10;
		write_enable = 1;
		write_addr = 3'b101;
		write_data = 8'd99;
		#10;
		write_enable = 0;
		read_addr_a = 3'b011;
		read_addr_b = 3'b101;
		#10;
		if (read_data_a != 8'd42 || read_data_b != 8'd99)
			$display("READ/WRITE TEST FAILED");
		else
			$display("READ/WRITE TEST PASSED");
		
		
		$stop;
	end
endmodule
	
		
	
