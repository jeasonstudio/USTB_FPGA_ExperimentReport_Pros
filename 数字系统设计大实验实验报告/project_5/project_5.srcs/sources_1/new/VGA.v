module VGA_control (
	
	input clk,
	input reset,

	input [1:0] snake,
	input [5:0] apple_x,
	input [4:0] apple_y,
	
	output reg [9:0] x_pos,
	output reg [9:0] y_pos,

	output reg h_sync,
	output reg v_sync,
	output reg [2:0] color_out);

	reg [19:0] clk_cnt;
	reg [9:0] line_cnt;


	localparam NONE = 2'b00;
	localparam HEAD = 2'b01;
	localparam BODY = 2'b10;
	localparam WALL = 2'b11;
	
	localparam HEAD_COLOR = 3'b010;
	localparam BODY_COLOR = 3'b011;

	reg [3:0] lox;
	reg [3:0] loy;



	// generate display signal
	always @( posedge clk or negedge reset) begin
		
		
		if( reset == 0) begin 

			clk_cnt <= 0;
			line_cnt <= 0;

			h_sync <= 1;
			v_sync <= 1;

		end
		else begin

			x_pos <= clk_cnt - 144;
			y_pos <= line_cnt - 33;

			//产生水平控制信号
			if( clk_cnt == 0 ) begin
				h_sync <= 0;
				clk_cnt <= clk_cnt + 1;
			end
			else if( clk_cnt == 96 ) begin
				h_sync <= 1;
				clk_cnt <= clk_cnt + 1;
			end
			else if( clk_cnt == 799 ) begin
				clk_cnt <= 0;
				line_cnt <= line_cnt + 1;
			end
			else clk_cnt <= clk_cnt + 1;

			// 产生垂直控制信号
			if( line_cnt == 0 ) begin	
				v_sync <= 0;
			end
			else if( line_cnt == 2 ) begin
				v_sync <= 1;
			end
			else if( line_cnt == 521 ) begin
				line_cnt <= 0;
				v_sync <= 0;
			end	
			
if( x_pos >= 0 && x_pos < 640 && y_pos >= 0 && y_pos < 480 )
 begin	
				
				lox = x_pos[3:0];
				loy = y_pos[3:0];
					
				if( x_pos[9:4] == apple_x && y_pos[9:4] == apple_y )
					
					case( {loy, lox} )
					
					8'b0000_0000: color_out = 3'b000;
				    default: color_out = 3'b001;
				    endcase

				else if( snake == NONE )
					color_out = 3'b000;

				else if( snake == WALL )
					color_out = 3'b101;

				else if( snake == HEAD | snake == BODY ) begin	

					case( {lox, loy} )

					8'b0000_0000: color_out = 3'b000;
                    default:color_out = ( snake == HEAD ) ? HEAD_COLOR : BODY_COLOR;

					endcase

				end

			end

			else 
				color_out = 3'b000;

		end

	end	  

endmodule
