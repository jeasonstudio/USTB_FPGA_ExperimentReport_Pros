`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/27 10:53:26
// Design Name: 
// Module Name: GPU_tb
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


module GPU_tb();
reg clk;
reg clr;
wire[15:0]dataBus;
   initial begin 
      clk=0;
      clr=0;
      #100 clr=1;
   end
   always #5 clk=~clk;
   GPU tb1(clk,clr,dataBus);
endmodule
