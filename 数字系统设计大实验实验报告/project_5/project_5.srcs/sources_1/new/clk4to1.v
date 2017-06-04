`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/16 15:21:28
// Design Name: 
// Module Name: clk4to1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module clk4to1(
input clk0,
input reset,
output clk
    );
    reg [2:0]cnt1;
    wire c0;
always @(posedge clk0 or negedge reset )
            if(!reset)
                cnt1<=0;
            else
                cnt1<=cnt1+1;
assign c0=~cnt1[1];
assign clk=~c0;
endmodule
