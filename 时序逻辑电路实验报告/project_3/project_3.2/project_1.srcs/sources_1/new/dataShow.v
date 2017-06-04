`timescale 1ns / 1ps

module dataShow(
    input clk190hz,
    input clk3hz,
    input rst,
    input [31:0] myID,
    output [3:0] pos,
    output [7:0] seg
    );
    
    wire [15:0] dataBus;
    GPU     u1(clk3hz, rst, myID, dataBus);
    segMsg1 u2(clk190hz, rst, dataBus, pos, seg);
endmodule
