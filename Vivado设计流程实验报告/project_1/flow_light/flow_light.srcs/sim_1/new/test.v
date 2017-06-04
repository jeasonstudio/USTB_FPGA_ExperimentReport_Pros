`timescale 1ns / 1ps


`timescale 1ns / 1ps
module test( );
reg clk;
reg rst;
wire [3 : 0] led;
flowing_light u0(
.clk(clk),
.rst(rst),
.led(led) );
parameter PERIOD = 10;
always begin
clk = 1'b0;
#(PERIOD/2) clk = 1'b1;
#(PERIOD/2);
end
initial begin
clk = 1'b0;
rst = 1'b0;
#100;
 rst = 1'b1;
 #100;
rst = 1'b0;
end
endmodule
