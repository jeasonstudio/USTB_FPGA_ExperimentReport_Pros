`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/25 09:49:49
// Design Name: 
// Module Name: fsm_mealy_tb
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


module fsm_mealy_tb( );
reg clk;
reg clr;
reg din;
wire dout;
 parameter PERIOD=40;
 fsm_mealy U1(clk,clr,din,dout);
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
     #350
      din=0;
      #50
      din=1;
      #100
      din=0;
      #50
      din=1;
    end
    
   
   
 
endmodule
