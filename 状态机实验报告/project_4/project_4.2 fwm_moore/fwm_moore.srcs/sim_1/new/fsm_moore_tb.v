`timescale 1ns / 1ps
module fsm_moore_tb();
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
