//��Ƶģ��
module clkDiv(
input clk100mhz,
output clk190hz,
output clk3hz
  );
   reg[25:0] count =0;
   assign clk190hz = count[18];
   assign clk3hz =count[25];
   always@(posedge clk100mhz)
       count<= count+1;
endmodule