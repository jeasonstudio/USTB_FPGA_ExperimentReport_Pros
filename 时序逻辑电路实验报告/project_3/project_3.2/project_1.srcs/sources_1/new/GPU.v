`timescale 1ns / 1ps

module GPU(input clk3hz, input rst, input [31:0] myID, output [15:0] dataBus);
    // rst is low-active
    reg[31:0] msgArray;
    assign dataBus = msgArray[31:16];
    always @(posedge clk3hz) 
    begin
        if (!rst) msgArray <= myID;
        else begin
            msgArray[3:0] <= msgArray[31:28];
            msgArray[31:4] <= msgArray[27:0];
        end
    end
endmodule
