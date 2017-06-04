`timescale 1ns / 1ps
module segMsg(
input start,
input clk190hz,
input [15:0] dataBus,
input [15:0] dataBus1,
output reg [3:0] pos,
output reg [3:0] pos1,
output reg [7:0] seg,
output reg [7:0] seg1
);
reg	[1:0]	posC;
reg	[1:0]	posC1;
reg	[3:0]	dataP;
reg	[3:0]	dataP1;
always @(posedge clk190hz )begin
    case(posC1)
        0:begin
        pos1	<=	4'b0001;
            if(start) dataP1	<=	dataBus1[3:0];
            else dataP1<= 10;
        end
        1:begin
        pos1	<=	4'b0010;
        if(start)  dataP1    <=    dataBus1[7:4];
        else dataP1<= 10;
        end
        2:begin
        pos1	<=4'b0100;
        if(start) dataP1    <=    dataBus1[11:8];
        else dataP1<= 10;
        end
        3:begin
        pos1	<=	4'b1000;
        if(start) dataP1    <=    dataBus1[15:12];
        else dataP1<= 10;
        end
	endcase
	posC1 = posC1	+ 1;
	case(posC)
            0:begin
            pos    <=    4'b0001;
            if(start==0) dataP    <=    dataBus[3:0];
            else dataP<= 10;
            end    
            1:begin
            pos    <=    4'b0010;
            if(start==0) dataP    <=    dataBus[7:4];
            else dataP<= 10;
            end
            2:begin
            pos    <=4'b0100;
            if(start==0) dataP    <=    dataBus[11:8];
            else dataP<= 10;
            end
            3:begin
            pos    <=    4'b1000;
            if(start==0) dataP    <=    dataBus[15:12];
            else dataP<= 10;
            end
        endcase
        posC = posC    + 1;
	end
	always@(dataP1 or dataP) begin
	case(dataP1)
	0: seg1 = 8'b0011_1111;
	1: seg1 = 8'b0000_0110;
	2: seg1 = 8'b0101_1011;
	3: seg1 = 8'b0100_1111;
	4: seg1 = 8'b0110_0110;
	5: seg1 = 8'b0110_1101;
	6: seg1 = 8'b0111_1101;
	7: seg1 = 8'b0000_0111;
	8: seg1 = 8'b0111_1111;
	9: seg1 = 8'b0110_1111;
	10:seg1 = 8'b0100_0000;
	11:seg1 = 8'b0000_0000;
	default: seg1 = 8'b0000_1000;
	endcase
        case(dataP)
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
        end
endmodule
	
