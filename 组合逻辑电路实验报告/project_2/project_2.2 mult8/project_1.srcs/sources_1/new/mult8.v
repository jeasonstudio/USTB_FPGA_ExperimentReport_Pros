`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/08 08:38:11
// Design Name: 
// Module Name: mult8
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


module mult8(
    input [7:0] a,
    input [7:0] b,
    output reg[15:0] p
    );
        reg[15:0] pv;
        reg[15:0] ap;
        integer i;
        always@(*)
          begin
          pv=16'b0000000000000000;
          ap={8'b00000000,a};
          for(i=0;i<=7;i=i+1)
             begin 
              if(b[i]==1)
                pv=pv+ap;
                ap={ap[14:0],1'b0};
              end
           p=pv;
          end

    
    
endmodule
