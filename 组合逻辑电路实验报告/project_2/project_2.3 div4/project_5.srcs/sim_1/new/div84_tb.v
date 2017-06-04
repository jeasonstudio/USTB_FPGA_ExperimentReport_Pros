`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/07 18:34:11
// Design Name: 
// Module Name: div84_tb
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


module div84_tb(

    );
        reg [7:0] numerator;
        reg [3:0] denominator;
        wire [7:0]  quotient;
        wire [3:0]  remainder;
        initial
         begin
         numerator=0;
         denominator=1;         
         repeat(10)
         begin
          #10
          numerator={$random}%10+7;
          denominator={$random}%7;
          end
          #10 
           numerator={$random}%16+6;
           denominator={$random}%6;
          end
          div84 U1(. numerator( numerator),.denominator(denominator),. quotient( quotient),.remainder(remainder));
         
    
     
endmodule
