module Seg_display(
	
	input clk,
	input reset,
	
	input add_cube,
	
	output reg [7:0] seg_out,
	output reg [3:0] sel);

	reg [15:0] point;
	reg [31:0] clk_cnt;
	
	always @(posedge clk or negedge reset ) begin
	
		if( !reset  ) begin
		
			seg_out <= 0;
		   clk_cnt <= 0;
			sel <= 0;
			
		end
		
		else begin
		
			if( clk_cnt <= 200000 ) 
			
			     begin
				
				clk_cnt <= clk_cnt + 1;
				
				if( clk_cnt == 50000 ) begin
				
					sel <= 4'b0001;
					
					case( point[3:0] )
					
                    0:seg_out =8'b0011_1111;
                    1:seg_out =8'b0000_0110;
                    2:seg_out =8'b0101_1011;   
                    3:seg_out =8'b0100_1111;
                    4:seg_out =8'b0110_0110;
                    5:seg_out =8'b0110_1101;
                    6:seg_out =8'b0111_1101;
                    7:seg_out =8'b0000_0111;
                    8:seg_out =8'b0111_1111;
                    9:seg_out =8'b0110_1111;
					default;
					endcase  
					
					
				end
				
				else if( clk_cnt == 100000 ) begin
				
					sel <= 4'b0010;
					
					case( point[7:4] )
					
                    0:seg_out =8'b0011_1111;
                    1:seg_out =8'b0000_0110;
                    2:seg_out =8'b0101_1011;   
                    3:seg_out =8'b0100_1111;
                    4:seg_out =8'b0110_0110;
                    5:seg_out =8'b0110_1101;
                    6:seg_out =8'b0111_1101;
                    7:seg_out =8'b0000_0111;
                    8:seg_out =8'b0111_1111;
                    9:seg_out =8'b0110_1111;
					default;

					
					endcase 
				end
				
				else if( clk_cnt == 150000 ) begin
				
					sel <= 4'b0100;
					
					case( point[11:8] )
					
                    0:seg_out =8'b0011_1111;
                    1:seg_out =8'b0000_0110;
                    2:seg_out =8'b0101_1011;   
                    3:seg_out =8'b0100_1111;
                    4:seg_out =8'b0110_0110;
                    5:seg_out =8'b0110_1101;
                    6:seg_out =8'b0111_1101;
                    7:seg_out =8'b0000_0111;
                    8:seg_out =8'b0111_1111;
                    9:seg_out =8'b0110_1111;
					default;

					
					endcase 
					
				end
				
				else if( clk_cnt == 200000 ) begin
				
					sel <= 4'b1000;
					
		   		case( point[15:12] )
					
                   0:seg_out =8'b0011_1111;
                   1:seg_out =8'b0000_0110;
                   2:seg_out =8'b0101_1011;   
                   3:seg_out =8'b0100_1111;
                   4:seg_out =8'b0110_0110;
                   5:seg_out =8'b0110_1101;
                   6:seg_out =8'b0111_1101;
                   7:seg_out =8'b0000_0111;
                   8:seg_out =8'b0111_1111;
                   9:seg_out =8'b0110_1111;
					default;

				endcase  
					
				end
					
			end
			
			else 
				clk_cnt <= 0;
		
		end 
		
	end
	
	reg addcube_state;
	
	always @( posedge clk or negedge reset  ) begin
		
		if( reset == 0 ) begin

			point <= 0;
			addcube_state <= 0;
			
		end
		
		else begin
		
			case( addcube_state )
		
			0: begin
				if( add_cube ) begin
				
					if( point[3:0] < 9 )
						point[3:0] <= point[3:0] + 1;
					else begin
						point[3:0] <= 0;
						if( point[7:4] < 9 )
							point[7:4] <= point[7:4] + 1;
						else begin
							point[7:4] <= 0;
							if( point[11:8] < 9 ) 
								point[11:8] <= point[11:8] + 1;
							else begin
								point[11:8] <= 0;
								point[15:12] <= point[15:12] + 1;
							end
						end
					end
					
					addcube_state <= 1;
					
				end
			end
			
			1: begin
			
				if(!add_cube)
					addcube_state <= 0;
					
			end
			
			endcase
			
		end
		
	end
	
endmodule
