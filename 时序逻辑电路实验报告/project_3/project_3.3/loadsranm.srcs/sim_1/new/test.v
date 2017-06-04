`timescale 1ns / 1ps
module test();
reg clk100mhz;
reg changeaddr;
wire [18:0]addrBus;
reg clt,control;
reg [15:0]number;
wire [15:0]dataBus1;
wire oe,lb,ub;
 loadsram u1(click,clk100mhz,clr,clt,changeaddr,control,res,start,dataBus1,pos,pos1,seg,seg1,addrBus,ce,ub,lb,w,oe,changeaddr1);
initial
begin
clk100mhz = 0;
changeaddr= 0;
clt = 1;
control = 1;
number=0;
# 10 number = 15156;
# 100 number = 56464;
end
always #1 clk100mhz = ~clk100mhz;
always #100 changeaddr = ~changeaddr;
always #50 clt = ~clt;
always #20 control= ~control;
endmodule
