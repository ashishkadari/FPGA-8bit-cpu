module cpu_tb;

    logic clk;
    logic reset;

    cpu dut (
        .clk(clk),
        .reset(reset)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin

        reset = 1;

        @(posedge clk);

        reset = 0;

        @(posedge clk);
        #1;

        if (dut.register_file_unit.registers[1] != 8'd10)
            $display("R1 TEST FAILED");
        else
            $display("R1 TEST PASSED");


        @(posedge clk);
        #1;

        if (dut.register_file_unit.registers[2] != 8'd20)
            $display("R2 TEST FAILED");
        else
            $display("R2 TEST PASSED");


        $stop;

    end

endmodule