module cpu_beq_tb;

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


    @(posedge clk);
    #1;

    if (dut.register_file_unit.registers[3] != 8'd99)
        $display("BEQ NOT TAKEN TEST FAILED");
    else
        $display("BEQ NOT TAKEN TEST PASSED");

    $stop;
end

endmodule