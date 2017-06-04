//数据处理后发送给数码管显示的模块
module GPU(
input clk3hz,
input clr,
output [15:0]dataBus
    );
    
    reg[31:0] msgArray;
    parameter NUMBER = 32'h41524119;
    assign dataBus = msgArray[31:16];
    always@(posedge clk3hz or posedge clr)
        if(!clr)
          msgArray<=NUMBER;
        else begin
           msgArray[3:0]<= msgArray[31:28];
           msgArray[31:4]<= msgArray[27:0];
        end
endmodule