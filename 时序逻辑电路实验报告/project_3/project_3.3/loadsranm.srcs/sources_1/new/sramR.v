`timescale 1ns / 1ps
module sramR(
input clk100mhz,
input w,ce,
input [15:0] dataBus,
output [15:0]LED
    );
    reg [15:0]data;
    always@(posedge clk100mhz)
    begin
    if(w&&(ce==0))begin
    data <= dataBus;
    end
    end
    /*if(changeaddr==0) addrBus= addrBus1;
    else if(changeaddr)  addrBus= addrBus1;*/
    assign LED=data;
endmodule