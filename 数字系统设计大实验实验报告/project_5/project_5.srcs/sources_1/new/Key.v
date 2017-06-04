module Key (

	input clk,
	input reset,

	input left,
	input right,
	input up,
	input down,

	output reg left_key_press,
	output reg right_key_press,
	output reg up_key_press,
	output reg down_key_press);

	reg [31:0] clk_cnt;
	reg left_key_last;
	reg right_key_last;
	reg up_key_last;
	reg down_key_last;

	always @( posedge clk or negedge reset  ) begin
		
		if( !reset ) begin

			clk_cnt <= 0;

			left_key_press <= 0;
			right_key_press <= 0;
			up_key_press <= 0;
			down_key_press <= 0;

			left_key_last <= 0;
			right_key_last <= 0;
			up_key_last <= 0;
			right_key_last <= 0;

		end

		else begin
			if( clk_cnt == 50000 ) begin

				clk_cnt <= 0;
				left_key_last <= left;
				right_key_last <= right;
				up_key_last <= up;
				down_key_last <= down;
			
				if( left_key_last == 0 && left == 1 ) begin
					left_key_press <= 1;
				end

				if( right_key_last == 0 && right == 1 ) begin
					right_key_press <= 1;				
				end

				if( up_key_last == 0 && up == 1 ) begin
					up_key_press <= 1;
				end

				if( down_key_last == 0 && down == 1 ) begin
					down_key_press <= 1;
				end

			end

			else begin
				clk_cnt <= clk_cnt + 1;
				left_key_press <= 0;
				right_key_press <= 0;
				up_key_press <= 0;
				down_key_press <= 0;
			end
		
		end

	end

endmodule
