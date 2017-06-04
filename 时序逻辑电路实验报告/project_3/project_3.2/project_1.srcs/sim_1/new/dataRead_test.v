`timescale 1ns / 1ps


module dataRead_test();
    reg clk190hz, rst, leftMove, rightMove, inc;
    wire [31:0] myID;
    wire [15:0] dataBus;
    
    dataRead u1(clk190hz, rst, leftMove, rightMove, inc, myID, dataBus);
    
    initial begin
        clk190hz = 0;
        rst = 0;
        leftMove = 0;
        rightMove = 0;
        inc = 0;
        #10 rst = 1;
        #5 leftMove = 1;
        #3 leftMove = 0;
        #7 inc = 1;
    end
    
    always #5 clk190hz = ~clk190hz;
    
endmodule
