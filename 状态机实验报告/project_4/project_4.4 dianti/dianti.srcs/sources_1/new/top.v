`timescale 1ns / 1ps
module top(
input clk,
input reset,
input up1,input up2,input up3,input dn2,input dn3,input dn4,
input d1,input d2,input d3,input d4,
output [7:0]seg,      
output [3:0]pos);
wire clk1s,clk190hz,clk200ms;
clkdiv u0( clk, clk1s,clk190hz,clk200ms);
dianti u1(clk1s,clk190hz,clk200ms,reset,up1,up2,up3,dn2,dn3,dn4,d1,d2,d3,d4,seg,pos);
endmodule
