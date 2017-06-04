module Snake_one(
	
	input clk,
	input reset,

	input left_press,
	input right_press,
	input up_press,
	input down_press,

	input [9:0] x_pos,
	input [9:0] y_pos,

	input add_cube,
	
	input [1:0] game_status,
	input die_flash,

	output reg [1:0] snake,
	output reg [6:0] cube_num,

	output [5:0] head_x,
	output [5:0] head_y,
	
	output reg hit_body,
	output reg hit_wall);
	
	localparam UP = 2'b00;
	localparam DOWN = 2'b01;
	localparam LEFT = 2'b10;
	localparam RIGHT = 2'b11;

	localparam NONE = 2'b00;
	localparam HEAD = 2'b01;
	localparam BODY = 2'b10;
	localparam WALL = 2'b11;
	
	localparam PLAY = 2'b10;
	
	reg [31:0] cnt;

	wire [1:0] direct; 
	reg  [1:0] direct_r;
	assign direct=direct_r;
	reg [1:0] direct_next;

	reg change_to_left;
	reg change_to_right;
	reg change_to_up;
	reg change_to_down;

 	reg [5:0] cube_x[15:0];
	reg [5:0] cube_y[15:0];
	reg [15:0] is_exist;

	reg [2:0] color;

	assign head_x = cube_x[0];
	assign head_y = cube_y[0];



	always @( posedge clk or negedge reset  )  //初始化刚开始时我们设定蛇向右运动
		
		if( !reset)
			direct_r<=RIGHT ;
		else
			direct_r<=direct_next;


	always @( posedge clk or negedge reset  )
	begin
		if(!reset ) 
		     begin            //设定初始化后刚开始三个蛇块的位置

			cnt <= 0;

			cube_x[0] <= 10;
			cube_y[0] <= 5;

			cube_x[1] <= 9;
			cube_y[1] <= 5;
			
			cube_x[2] <= 8;
			cube_y[2] <= 5;
			
			hit_wall <= 0;
			hit_body <= 0;
					
		    end

		else 
		    begin
		
			cnt <= cnt + 1;
		
			if( cnt == 12500000 ) begin
				cnt <= 0;
				
			if( game_status == PLAY ) begin  //在play过程中判断是否hit_wall
		
					if( ( direct == UP && cube_y[0] == 1 )  
							| ( direct == DOWN && cube_y[0] == 28 )
							| ( direct == LEFT && cube_x[0] == 1 )
							| ( direct == RIGHT && cube_x[0] == 38 ) )
						hit_wall <= 1;
				//下边判断是否hit_dody
else if( ( cube_y[0] == cube_y[1] && cube_x[0] == cube_x[1] && is_exist[1] == 1 )
	| ( cube_y[0] == cube_y[2] && cube_x[0] == cube_x[2] && is_exist[2] == 1 )
	| ( cube_y[0] == cube_y[3] && cube_x[0] == cube_x[3] && is_exist[3] == 1 )
	| ( cube_y[0] == cube_y[4] && cube_x[0] == cube_x[4] && is_exist[4] == 1 )
	| ( cube_y[0] == cube_y[5] && cube_x[0] == cube_x[5] && is_exist[5] == 1 )
	| ( cube_y[0] == cube_y[6] && cube_x[0] == cube_x[6] && is_exist[6] == 1 )
	| ( cube_y[0] == cube_y[7] && cube_x[0] == cube_x[7] && is_exist[7] == 1 )
	| ( cube_y[0] == cube_y[8] && cube_x[0] == cube_x[8] && is_exist[8] == 1 )
	| ( cube_y[0] == cube_y[9] && cube_x[0] == cube_x[9] && is_exist[9] == 1 )
| ( cube_y[0] == cube_y[10] && cube_x[0] == cube_x[10] && is_exist[10] == 1 )
| ( cube_y[0] == cube_y[11] && cube_x[0] == cube_x[11] && is_exist[11] == 1 )
| ( cube_y[0] == cube_y[12] && cube_x[0] == cube_x[12] && is_exist[12] == 1 )
| ( cube_y[0] == cube_y[13] && cube_x[0] == cube_x[13] && is_exist[13] == 1 )
| ( cube_y[0] == cube_y[14] && cube_x[0] == cube_x[14] && is_exist[14] == 1 )
| ( cube_y[0] == cube_y[15] && cube_x[0] == cube_x[15] && is_exist[15] == 1 ) )
							
							 hit_body<=1;
						
		else           //蛇运动过程中相邻模块之间坐标存在联系,依次代替
		        begin
						cube_x[1] <= cube_x[0];
						cube_y[1] <= cube_y[0];
		
						cube_x[2] <= cube_x[1];
						cube_y[2] <= cube_y[1];
		
						cube_x[3] <= cube_x[2];
						cube_y[3] <= cube_y[2];
		
						cube_x[4] <= cube_x[3];
						cube_y[4] <= cube_y[3];
		
						cube_x[5] <= cube_x[4];
						cube_y[5] <= cube_y[4];
		
						cube_x[6] <= cube_x[5];
						cube_y[6] <= cube_y[5];
		
						cube_x[7] <= cube_x[6];
						cube_y[7] <= cube_y[6];
		
						cube_x[8] <= cube_x[7];
						cube_y[8] <= cube_y[7];
		
						cube_x[9] <= cube_x[8];
						cube_y[9] <= cube_y[8];
		
						cube_x[10] <= cube_x[9];
						cube_y[10] <= cube_y[9];
		
						cube_x[11] <= cube_x[10];
						cube_y[11] <= cube_y[10];
		
						cube_x[12] <= cube_x[11];
						cube_y[12] <= cube_y[11];
		
						cube_x[13] <= cube_x[12];
						cube_y[13] <= cube_y[12];
		
						cube_x[14] <= cube_x[13];
						cube_y[14] <= cube_y[13];
		
						cube_x[15] <= cube_x[14];
						cube_y[15] <= cube_y[14];
						
						
		
						case( direct )        //根据运动方向来决定蛇头的坐标
		
						UP:begin
							if( cube_y[0] == 1 )
								hit_wall <= 1;
							else 
								cube_y[0] <= cube_y[0] - 1;
						end
						
						DOWN: begin
							if( cube_y[0] == 28 )
								hit_wall <= 1;
							else
								cube_y[0] <= cube_y[0] + 1;
						end
						
						LEFT:begin
							if( cube_x[0] == 1 )
								hit_wall <= 1;
							else 
								cube_x[0] <= cube_x[0] - 1;
						end
						
						RIGHT: begin
							if( cube_x[0] == 38 )
								hit_wall <= 1;
							else
								cube_x[0] <= cube_x[0] + 1;
						end
						
						endcase
					
					end
			
				end
				
			end
			
		end
end

	always @( * ) begin
		
		direct_next = direct;

		case( direct )

		UP: 
			begin
				if( change_to_left )
					direct_next = LEFT;
				else if( change_to_right )
					direct_next = RIGHT;
				else 
					direct_next = UP;
			end

		DOWN : 
			begin
				if( change_to_left )
					direct_next = LEFT;
				else if( change_to_right )
					direct_next = RIGHT;
				else 
					direct_next = DOWN;
			end

		LEFT : 
			begin
				if( change_to_up )
					direct_next = UP;
				else if( change_to_down )
					direct_next = DOWN;
				else 
					direct_next = LEFT;	
			end

		RIGHT : 
			begin
				if( change_to_up )
					direct_next = UP;
				else if( change_to_down )
					direct_next = DOWN;
				else 
					direct_next = RIGHT;
			end

		endcase

	end


	always @( posedge clk ) begin

		if( left_press == 1 ) begin
			change_to_left <= 1;
		end
			
		else if( right_press == 1 ) begin				
			change_to_right <= 1;	
		end

		else if( up_press == 1 ) begin
			change_to_up <= 1;
		end

		else if( down_press == 1 ) begin
			change_to_down <= 1;
		end

		else begin
			change_to_left <= 0;
			change_to_right <= 0;
			change_to_up <= 0;
			change_to_down <= 0;
		end

	end


	reg addcube_state;
	
	always @( posedge clk or negedge reset ) begin
		
		if( reset == 0 ) begin

			is_exist <= 16'b0000000000000111;

			cube_num <= 3;
			addcube_state <= 0;
			
		end
		
		else begin
		
			case( addcube_state )
		
			0: begin
				if( add_cube ) begin
				
					cube_num <= cube_num + 1;
					is_exist[cube_num] <= 1;
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


	reg [3:0] lox;
	reg [3:0] loy;

	// determine the display
	always @( x_pos or y_pos ) begin
	
		if( x_pos >= 0 && x_pos < 640 && y_pos >= 0 && y_pos < 480 ) begin

	if( ( x_pos[9:4] == 0 | y_pos[9:4] == 0 | x_pos[9:4] == 39 | y_pos[9:4] == 29 ) )
				snake = WALL;

else if( x_pos[9:4] == cube_x[0] && y_pos[9:4] == cube_y[0] && is_exist[0] == 1 ) begin
				snake = ( die_flash == 1 ) ? HEAD : NONE;
			end
else if
( ( x_pos[9:4] == cube_x[1] && y_pos[9:4] == cube_y[1] && is_exist[1] == 1 )
	| ( x_pos[9:4] == cube_x[2] && y_pos[9:4] == cube_y[2] && is_exist[2] == 1 )
	| ( x_pos[9:4] == cube_x[3] && y_pos[9:4] == cube_y[3] && is_exist[3] == 1 )
	| ( x_pos[9:4] == cube_x[4] && y_pos[9:4] == cube_y[4] && is_exist[4] == 1 )
	| ( x_pos[9:4] == cube_x[5] && y_pos[9:4] == cube_y[5] && is_exist[5] == 1 )
	| ( x_pos[9:4] == cube_x[6] && y_pos[9:4] == cube_y[6] && is_exist[6] == 1 )
	| ( x_pos[9:4] == cube_x[7] && y_pos[9:4] == cube_y[7] && is_exist[7] == 1 )
	| ( x_pos[9:4] == cube_x[8] && y_pos[9:4] == cube_y[8] && is_exist[8] == 1 )
	| ( x_pos[9:4] == cube_x[9] && y_pos[9:4] == cube_y[9] && is_exist[9] == 1 )
| ( x_pos[9:4] == cube_x[10] && y_pos[9:4] == cube_y[10] && is_exist[10] == 1 )
| ( x_pos[9:4] == cube_x[11] && y_pos[9:4] == cube_y[11] && is_exist[11] == 1 )
| ( x_pos[9:4] == cube_x[12] && y_pos[9:4] == cube_y[12] && is_exist[12] == 1 )
| ( x_pos[9:4] == cube_x[13] && y_pos[9:4] == cube_y[13] && is_exist[13] == 1 )
| ( x_pos[9:4] == cube_x[14] && y_pos[9:4] == cube_y[14] && is_exist[14] == 1 )
| ( x_pos[9:4] == cube_x[15] && y_pos[9:4] == cube_y[15] && is_exist[15] == 1 ))
				snake = ( die_flash == 1 ) ? BODY : NONE;

			else
				snake = NONE;
		end

	end	 

endmodule
