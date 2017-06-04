`timescale 1ns / 1ps
module sram(
input clk,clr,rEn,
input [31:0] iDataBus,
inout [15:0] dataBus,
output reg[18:0] addrBus,
output ce,ub,lb,
output reg oe,w,
output reg [31:0]oDataBus
);

reg [15:0] tDataBus;
reg [31:0] rDataBus;
reg [3:0] countR ;
reg [3:0] countW ;

assign dataBus  = w ? 16'hzzzz : tDataBus;
assign ce = 0;
assign ub = 0;
assign lb = 0;

always @(posedge clk or posedge clr)
    if(!clr)begin
        countW <= 0;
        countR <= 0;
    end
    else begin
        case(countW)
            2:begin
                 w <= 1'b0; 
                 oe <= 1'b1;    
                 tDataBus <= iDataBus[15:0];                     
                 addrBus <= 19'd100_000; 
              end
            4:begin
                 w <= 1'b0; 
                 oe <= 1'b1;     
                 tDataBus <= iDataBus[31:16];
                 addrBus <= 19'd100_001;    
             end
            default:begin
                 w <= 1'b1; 
                 oe <= 1'b0; 
            end
         endcase
         case(countR)
            2:begin
                w <= 1'b1;    
                addrBus<= 19'd100_000;  
                rDataBus[15:0] <= dataBus;        
              end
            4:begin
                 w <= 1'b1;  
                 addrBus<= 19'd100_001;           
                 rDataBus[31:16] <= dataBus;  
              end 
            8:begin
                oDataBus = rDataBus;
            end
         endcase
        if((countW<8)&&(rEn==0))
            countW <= countW + 1;
        if((countR<12)&&(rEn==1))
            countR <= countR + 1; 
    end 
endmodule