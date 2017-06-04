`timescale 1ns / 1ps
module sramWR(
input clk100mhz,
input  w,ce,changeaddr,
input [15:0]number, 
inout [15:0] dataBus,
output reg[15:0]LED,
output oe,lb,ub,
output reg[ 18:0]addrBus
    );
    reg [15:0] tDataBus;
    assign oe=0;assign lb =0;assign ub =0; 
    assign dataBus  = w ? 16'hzzzz : tDataBus; 
    always@(posedge clk100mhz)begin
        if(w==0&&ce==0)begin     
          tDataBus <= number;
        end
        else if(w&&(ce==0))begin 
        LED <= dataBus;
        end
        case(changeaddr)
        1: addrBus= 19'b100_0000_0000_0000_0000;
        0: addrBus= 19'b100_0000_0000_0000_0001; 
        endcase
        end
endmodule
