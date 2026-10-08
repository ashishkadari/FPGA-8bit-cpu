// Simulates the board top level without the board.
// DIV_BIT = 1 makes the CPU clock 4x slower than CLOCK_50 instead of ~33 million x.
module de0nano_top_tb;

    logic       CLOCK_50;
    logic [1:0] KEY;
    logic [7:0] LED;

    de0nano_top #(.DIV_BIT(1)) dut (
        .CLOCK_50(CLOCK_50),
        .KEY(KEY),
        .LED(LED)
    );

    initial begin
        CLOCK_50 = 0;
        forever #10 CLOCK_50 = ~CLOCK_50;   // 50 MHz
    end

    initial begin
        KEY = 2'b11;          // buttons released (active low)

        KEY[0] = 0;           // press reset
        #200;
        KEY[0] = 1;           // release reset

        #2000;                // let the program run well past OUT

        if (LED != 8'd30)
            $display("BOARD TEST FAILED: LED = %0d", LED);
        else
            $display("BOARD TEST PASSED: LED = %0d (%b)", LED, LED);

        $stop;
    end

endmodule
