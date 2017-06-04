`timescale 1ns / 1ps

module top(
    input clk100mhz,
    input rst,
    input sel,
    input left_move,
    input right_move,
    input increase,
    output [3:0] pos1,
    output [7:0] seg1,
    output [3:0] pos2,
    output [7:0] seg2,
    output [2:0] temp
    );
    wire clk190hz, clk3hz;
    wire [31:0] myID;
    wire [15:0] dataBus;
    wire leftMove, rightMove, inc;
    
    // rst is low-active
    // sel : read = 0, show = 1 
    
    clkDiv     u1(clk100mhz, clk190hz, clk3hz);
    dataShow   u2(clk190hz, clk3hz, rst & sel, myID, pos1, seg1);
    dataRead   u3(clk190hz, rst & (~sel), leftMove, rightMove, inc, pos2, seg2, myID, temp);
    
    catchPress c1(clk190hz, left_move, leftMove);
    catchPress c2(clk190hz, right_move, rightMove);
    catchPress c3(clk190hz, increase, inc);
endmodule
