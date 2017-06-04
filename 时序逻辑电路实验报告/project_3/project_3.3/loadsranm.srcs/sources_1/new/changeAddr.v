`timescale 1ns / 1ps
module changeAddr(
input clk100mhz,
input changeaddr,
output reg[18:0]addrBus1
    );
    always@(posedge clk100mhz)begin
    if(changeaddr==0) addrBus1 = 19'b100_0000_0000_0000_0000;
    else if(changeaddr)  addrBus1 = 19'b100_0000_0000_0000_0001;
    end
endmodule
