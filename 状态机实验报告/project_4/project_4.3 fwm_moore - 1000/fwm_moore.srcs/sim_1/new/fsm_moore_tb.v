`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/25 10:14:59
// Design Name: 
// Module Name: fsm_moore_tb
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


module fsm_moore_tb(

    );
    reg clk;
    reg clr;
    reg din;
    wire dout;
     parameter PERIOD=40;
     fsm_moore U1(clk,clr,din,dout);
     initial 
       begin
         clk=0;
         forever
          begin
          #(PERIOD/2) clk=1;
          #(PERIOD/2) clk=0;
          end
          
         end
     initial
       begin 
        clr=1;
        forever
         #50 clr=0;
       end
       initial
        begin
         din=1;
         #400
          din=0;
          #50
          din=1;
          #100
          din=0;
          #50
          din=1;
        end
endmodule
