// Top level for the Terasic DE0-Nano board.
// KEY[0] = reset (hold for about a second), LED[7:0] = last value output by the CPU.
module de0nano_top #(
    parameter int DIV_BIT = 24   // 24 = ~1.5 Hz on the board; testbench sets this small
) (
    input  logic       CLOCK_50,
    input  logic [1:0] KEY,
    output logic [7:0] LED
);

    // Slow the 50 MHz clock to about 1.5 Hz so you can watch it run
    logic [DIV_BIT:0] divider = '0;
    always_ff @(posedge CLOCK_50)
        divider <= divider + 1'b1;

    logic slow_clk;
    assign slow_clk = divider[DIV_BIT];

    logic reset;
    assign reset = ~KEY[0];   // KEY buttons are active low

    logic [7:0] output_data;

    cpu cpu_unit (
        .clk(slow_clk),
        .reset(reset),
        .output_data(output_data)
    );

    // output_data is only non-zero during an OUT instruction,
    // so hold the last non-zero value on the LEDs
    always_ff @(posedge slow_clk) begin
        if (reset)
            LED <= 8'd0;
        else if (output_data != 8'd0)
            LED <= output_data;
    end

endmodule
