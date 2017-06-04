`timescale 1ns / 1ps

module clkDiv(input clk100mhz, output clk190hz, output clk3hz);
    reg [25:0] cnt = 0;
    assign clk190hz = cnt[18];
    assign clk3hz = cnt[25];
    always @(posedge clk100mhz)
        cnt = cnt + 1;
endmodule