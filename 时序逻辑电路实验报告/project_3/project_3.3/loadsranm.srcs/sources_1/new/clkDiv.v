`timescale 1ns / 1ps
module clkDiv(
input clk100mhz,
output clk190hz,
output clk6hz,
output clk3hz
);
    reg [25:0] count = 0;
    assign clk190hz =count[18];
    assign clk3hz =count[25];
    assign clk6hz =count[24];
    always@(posedge clk100mhz)
            count <= count + 1;
endmodule
