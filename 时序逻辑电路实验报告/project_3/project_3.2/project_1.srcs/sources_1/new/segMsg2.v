`timescale 1ns / 1ps

module segMsg2(
    input clk190hz,
    input rst,
    input [15:0] dataBus,
    input [1:0] decimalPoint,
    output reg [3:0] pos,
    output reg [7:0] seg
    );
    
    reg [1:0] posC;
    reg [3:0] dataP;
    
    always @(posedge clk190hz) 
    begin
        if (!rst) 
        begin
            pos = 4'b0000;
            posC = 3;
        end
        else begin
            posC = posC + 1;
            case (posC)
                0: begin
                    pos   <= 4'b0001;
                    dataP <= dataBus[3:0];
                end
                1: begin
                    pos   <= 4'b0010;
                    dataP <= dataBus[7:4];            
                end
                2: begin
                    pos   <= 4'b0100;
                    dataP <= dataBus[11:8];
                end
                3: begin
                    pos   <= 4'b1000;
                    dataP <= dataBus[15:12];
                end
            endcase
        end
    end
    
    always @(posC)
    begin
        case (dataP)
            0: seg = 8'b0011_1111;
            1: seg = 8'b0000_0110;
            2: seg = 8'b0101_1011;
            3: seg = 8'b0100_1111;
            4: seg = 8'b0110_0110;
            5: seg = 8'b0110_1101;
            6: seg = 8'b0111_1101;
            7: seg = 8'b0000_0111;
            8: seg = 8'b0111_1111;
            9: seg = 8'b0110_1111;
            10:seg = 8'b0100_0000;
            11:seg = 8'b0000_0000;
            default: seg = 8'b0000_1000;
        endcase
        
        if (posC == decimalPoint) seg = seg | 8'b1000_0000;
    end
endmodule
