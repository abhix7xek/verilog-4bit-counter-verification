`timescale 1ns/1ps
module tb_counter;
    reg clk, rst, up_down;
    wire [3:0] count;
    counter_4bit dut (.clk(clk), .rst(rst), .up_down(up_down), .count(count));
    always #5 clk = ~clk;
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_counter);
        clk = 0; rst = 1; up_down = 1;
        #20 rst = 0;
        #100 up_down = 0;
        #100 up_down = 1;
        #100 $finish;
    end
    initial begin
        $monitor("Time=%0t rst=%b up_down=%b count=%d", $time, rst, up_down, count);
    end
endmodule