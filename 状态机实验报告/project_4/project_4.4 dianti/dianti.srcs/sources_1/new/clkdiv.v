`timescale 1ns / 1ps
module clkdiv(
input clk100mhz,
output clk1s,
output clk190hz,
output clk200ms
);
    reg[31:0] count=0;
    assign clk1s = count[26];
    assign clk190hz = count[17];
    assign clk200ms = count[24];
    always @(posedge clk100mhz)
    count<=count+1;
    endmodule
