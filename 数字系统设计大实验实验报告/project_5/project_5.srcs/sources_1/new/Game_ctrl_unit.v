module Game_ctrl_unit(input clk,
input reset,
input key1_press,
input key2_press,
input key3_press,
input key4_press,
input hit_wall,
input hit_body,
output reg [1:0] game_status,
output reg die_flash,
output reg restart);
localparam RESTART = 2'b00;
localparam START = 2'b01;	
localparam PLAY = 2'b10;	
localparam DIE = 2'b11;
reg [31:0] clk_cnt;	
always @( posedge clk or negedge reset ) 
 begin		
  if( !reset  ) 
   begin		
    game_status <= START;		
    clk_cnt <= 0;	
    die_flash <= 1;			
    restart <= 0;				
   end				
else begin						
     case( game_status )					
  RESTART:begin				
       if( clk_cnt <= 5 ) 
             begin						
        clk_cnt <= clk_cnt + 1;					
        restart <= 1;			
             end								
      else begin					
        game_status <= START;					
        clk_cnt <= 0;					
        restart <= 0;				
            end								
	end						
  START: begin			
  if( key1_press | key2_press | key3_press | key4_press ) 
           begin				
	game_status <= PLAY;			
            end	
        end				
   PLAY:begin			
   if( hit_wall | hit_body ) 		

	game_status <= DIE;
	end			
  DIE:begin		
       if( clk_cnt <= 200000000 ) begin					
         clk_cnt <= clk_cnt + 1;				
       if( clk_cnt == 25000000 )						
         die_flash <= 0;					
       else if( clk_cnt == 50000000 )					
           die_flash <= 1;				
       else if( clk_cnt == 75000000 )				
	die_flash <= 0;					
       else if( clk_cnt == 100000000 )					
	die_flash <= 1;				
       else if( clk_cnt == 125000000 )					
	die_flash <= 0;					
       else if( clk_cnt == 150000000 )					
	die_flash <= 1;		
         end				
       else 
        begin				
        die_flash <= 1;				
        clk_cnt <= 0;				
        game_status <= RESTART;				
        end  				
      end				
  endcase			
end	
end
endmodule
