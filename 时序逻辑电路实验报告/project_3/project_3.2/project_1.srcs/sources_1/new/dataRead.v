`timescale 1ns / 1ps

module dataRead(
    input clk190hz,
    input rst,
    input leftMove,
    input rightMove,
    input inc,
    output [3:0] pos,
    output [7:0] seg,
    output [31:0] myID,
    output [2:0] temp
    );
    
    reg [31:0] msgArray = 0;
    reg [2:0] cur = 7;
    reg [15:0] dataBus;
    reg lmv_delay = 0, rmv_delay = 0, inc_delay = 0;
    
    assign myID = msgArray;
    assign temp = cur;
    
    always @(posedge clk190hz)
    begin
        if (!rst) begin
            msgArray = 0;
            cur = 7;
            lmv_delay = 0;
            rmv_delay = 0;
            inc_delay = 0;
        end
        else begin
            if (leftMove == 1 && lmv_delay == 0) cur = cur + 1;
            else if (rightMove == 1 && rmv_delay == 0) cur = cur - 1;
            else if (inc == 1 && inc_delay == 0) begin
                msgArray = msgArray + (4'b0001 << (4*cur));
                if (((msgArray >> (4*cur)) & 4'b1111) == 10)
                    msgArray = msgArray - (4'b1010 << (4*cur));
            end
            lmv_delay = leftMove;
            rmv_delay = rightMove;
            inc_delay = inc;
        end
        
        if (cur<4) dataBus = msgArray[15:0];
            else dataBus = msgArray[31:16];
    end
    
    segMsg2 u(clk190hz, rst, dataBus, cur[1:0], pos, seg);
endmodule
