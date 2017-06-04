module Greedy_Snake (
input clk0,
input reset,

input left,
input right,
input up,
input down,

output h_sync,
output v_sync,
output [2:0] color_out,
output [7:0] seg_out,
output [3:0] sel
);

	
wire left_key_press,right_key_press, up_key_press, down_key_press;
wire [1:0] snake;
wire [9:0] x_pos;
wire [9:0] y_pos;
wire [5:0] apple_x;
wire [4:0] apple_y;
wire [5:0] head_x;
wire [5:0] head_y;
wire add_cube;
wire [1:0] game_status;
wire hit_wall;
wire hit_body;
wire die_flash;
wire restart;
wire [6:0] cube_num;

clk4to1 clk4to1(clk0,reset,clk);

Snake_one snake1(.clk(clk),.reset(reset),
.left_press(left_key_press),
.right_press(right_key_press),
.up_press(up_key_press),
.down_press(down_key_press),
.snake(snake),
.x_pos(x_pos),
.y_pos(y_pos),
.head_x(head_x),
.head_y(head_y),
.add_cube(add_cube),
.game_status(game_status),
.cube_num(cube_num),
.hit_body(hit_body),
.hit_wall(hit_wall),
.die_flash(die_flash) );

Game_ctrl_unit game_ctrl_unit1( .clk(clk),
.reset(reset),
.key1_press(left_key_press),
.key2_press(right_key_press),
.key3_press(up_key_press),
.key4_press(down_key_press),
.game_status(game_status),
.hit_wall(hit_wall),
.hit_body(hit_body),
.die_flash(die_flash),
.restart(restart) ); 

	
Snake_eating_apple snake_eating_apple1( .clk(clk),
.reset(reset),
.apple_x(apple_x),
.apple_y(apple_y),
.head_x(head_x),
.head_y(head_y),
.add_cube(add_cube) );


VGA_control  vga_control(.clk(clk),
.reset(reset),
.h_sync(h_sync),
 .v_sync(v_sync), 
.snake(snake),
.color_out(color_out),
.x_pos(x_pos), 
.y_pos(y_pos),
.apple_x(apple_x),
.apple_y(apple_y) );

Key key1( .clk(clk),
.reset(reset),.left(left),
.right(right),
.up(up),
.down(down),
.left_key_press(left_key_press), 
.right_key_press(right_key_press),
.up_key_press(up_key_press),
.down_key_press(down_key_press) );
 	 	
Seg_display Seg_display1( .clk(clk),
.reset(reset),
.add_cube(add_cube),
.seg_out(seg_out),
.sel(sel) );
			
endmodule
