`timescale 1ns / 1ps
module loadsram(click,clk100mhz,clr,clt,changeaddr,control,res,start,dataBus1,pos,pos1,seg,seg1,addrBus,ce,ub,lb,w,oe,changeaddr1);

input [4:0]click;
input clk100mhz;
input clr; 
input clt;  
input changeaddr;
input control;   
input res;       
input start;     
output [3:0] pos; 
output [3:0]pos1;
output [7:0]seg;    
output [7:0]seg1;
inout [15:0] dataBus1;      
output [18:0]addrBus;     
output w,oe,ce,ub,lb;         
output changeaddr1;
wire clk190hz, clk3hz,clk6hz; 
wire [15:0]dataBus; 
reg [1:0]condition;             
reg [31:0]number;         
wire up,down,left,right,confirm;   
wire [15:0]LED;
wire [15:0]wireR,wireW;
assign changeaddr1 = changeaddr;
always @(posedge clk6hz) begin
  if(control&&clt==0)begin
  number[15:0]=LED;
  end
  else if(confirm)begin      
  number[31:16]=number[15:0];
  number[15:0]=0;
  end
  else if(res ==0) begin  
  number =0;
  condition =0;
  end
  else if(left) begin   
  if(start)
  condition =condition+1;
  end
  else if (right) begin 
  if(start)
  condition =condition-1;
  end
  else if(up) begin   
  if(start)
  case(condition)
  0: number[3:0]=(number[3:0]==9)?0:(number[3:0]+1);
  1: number[7:4]=(number[7:4]==9)?0:(number[7:4]+1);
  2: number[11:8]=(number[11:8]==9)?0:(number[11:8]+1);
  3: number[15:12]=(number[15:12]==9)?0:(number[15:12]+1);
  default: number=2'bz; 
  endcase
  end
  else if(down) begin   
  if(start)
  case(condition)
  0: number[3:0]=(number[3:0]==0)?9:(number[3:0]-1);
  1: number[7:4]=(number[7:4]==0)?9:(number[7:4]-1);
  2: number[11:8]=(number[11:8]==0)?9:(number[11:8]-1);
  3: number[15:12]=(number[15:12]==0)?9:(number[15:12]-1);
  default: number=2'bz; 
  endcase
  end
end
assign w = control;assign ce = clt;
clkDiv U1(clk100mhz, clk190hz, clk6hz, clk3hz); 
GPU U2(number,clk3hz, clr, dataBus); 
segMsg U3(start,clk190hz, dataBus, number[15:0],pos,pos1, seg,seg1); 
xiaodou v1(clk190hz,click[0],up);            
xiaodou v2(clk190hz,click[1],down);
xiaodou v3(clk190hz,click[2],left);
xiaodou v4(clk190hz,click[3],right);
xiaodou v5(clk190hz,click[4],confirm);
sramWR u2(clk100mhz,w,ce,changeaddr,number[15:0],dataBus1,LED,oe,lb,ub,addrBus);
endmodule