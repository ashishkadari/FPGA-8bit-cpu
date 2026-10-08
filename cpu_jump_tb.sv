module cpu_jump_tb;

    logic clk;
    logic reset;
    logic [7:0] output_data;

    cpu dut (
        .clk(clk),
        .reset(reset),
        .output_data(output_data)
    );

    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin

        reset = 1;

        
        @(posedge clk);
        #1;

        reset = 0;

        @(posedge clk);
        #1;

        @(posedge clk);
        #1;

        @(posedge clk);
        #1;

        if (dut.register_file_unit.registers[1] != 8'd42)
            $display("JUMP TEST FAILED");
        else
            $display("JUMP TEST PASSED");

        $stop;
    end

endmodule