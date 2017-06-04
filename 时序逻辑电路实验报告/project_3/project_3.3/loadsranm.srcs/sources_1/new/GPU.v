`timescale 1ns / 1ps
module GPU(
input [31:0]number,
input clk3hz,
input clr,
output [15:0]dataBus
    );
    reg[31:0] msgArray;
    assign dataBus = msgArray[31:16];
    always @ (posedge clk3hz or posedge clr)
            if(!clr )
            msgArray <= number;
            else begin
            msgArray[3:0] <= msgArray[31:28];
            msgArray[31:4]<=msgArray[27:0];
            end
endmodule