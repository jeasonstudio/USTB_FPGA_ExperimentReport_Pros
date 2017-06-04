`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/25 09:29:30
// Design Name: 
// Module Name: fsm_mealy
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


module fsm_mealy(
   input wire clk,
   input wire clr,
   input wire din,
   output reg dout
    );
    reg [1:0]present_state,next_state;
    parameter S0=3'b00,S1=3'b01,S2=3'b10,S3=3'b11;
    always @(posedge clk or posedge clr)
    begin
     if(clr)
      present_state<=S0;
     else
     present_state<=next_state;
     end
     always @(*)
       begin
        case(present_state)
          S0:if(din)
                 next_state<=S1;
               else
                 next_state<=S0;
          S1:if(din)
                    next_state<=S2;
               else
                      next_state<=S0;
          S2:if(din)
                    next_state<=S2;
              else
                  next_state<=S3;
         S3:if(din)
                      next_state<=S1;
                      else
                      next_state<=S0;
           default: next_state<=S0;        
        endcase
       end
       always@(posedge clk or posedge clr)

         if(clr)
            dout<=0;
         else
            if((present_state==S3)&&din)
             dout<=1;
             else
              dout<=0;
    
endmodule
