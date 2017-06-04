`timescale 1ns / 1ps
module dianti(
input clk1s,
input clk190hz,
input clk200ms,
input reset,
input up1,input up2,input up3,input dn2,input dn3,input dn4,
input d1,input d2,input d3,input d4,
output reg [7:0]seg,      
output reg [3:0]pos
 );
parameter idle_state = 3'b001;    //无命令状态
parameter up_state = 3'b010; //上行状态
parameter down_state=3'b011;//下行状态
parameter open_state=3'b100;//开门状态
parameter close_state=3'b101;//关门状态
parameter f1=4'b0001;//一楼
parameter f2=4'b0010;//二楼
parameter f3=4'b0100;//三楼
parameter f4=4'b1000;//四楼
parameter up_f=2'b01;//上行
parameter dn_f=2'b10;//下行
parameter idle=2'b00;//不动
reg [1:0]ud_f;//电梯运行状态
reg [3:0]count;
reg [3:0] led;
reg [3:0] dataP;
reg [2:0] state;
reg [3:0] next_state; 
reg [3:0] now_f;
reg [3:0] up,dn,d;
reg [2:0] posC;
reg up1_f,up2_f,up3_f,dn2_f,dn3_f,dn4_f,
d1_f,d2_f,d3_f,d4_f;
always @(posedge clk1s or posedge reset)      
    if(reset)          
            begin             
                  state<=idle_state;            
            end       
    else            
    state<=next_state; 
    always @(*)       
    case(state)       
    open_state:   
             begin 
             if(count<10) 
               next_state=open_state;  
             else 
               next_state=close_state;   
             end         
    idle_state: 
            begin 
              if(d>0) 
                begin 
                  if((d&now_f)>0) 
                    next_state=open_state; 
                  else if(d>now_f) 
                    next_state=up_state; 
                  else 
                        next_state=down_state; 
                      end
    else if((up&now_f)||(dn&now_f)) 
                    next_state=open_state; 
                 else if((up>now_f)||(dn>now_f)) 
                    next_state=up_state; 
                 else if(up||dn) 
                     next_state=down_state; 
                  else 
                     next_state=idle_state; 
                end 
         
    up_state: 
               begin 
                 if((d&now_f)||(up&now_f)) 
                   next_state=open_state; 
                 else if((d>now_f)||(up>now_f)) 
                   next_state=up_state; 
                 else if(d||up) 
                   next_state=down_state; 
                 else if(dn>0) 
                    begin 
                      if(dn>now_f) 
                        next_state=up_state; 
                      else if((dn&now_f)||(now_f<f4))  
                        next_state=open_state; 
                      else if((dn&now_f)&&(now_f==f4)) 
                        next_state=open_state; 
                      else 
                        next_state=down_state; 
                     end 
                   else 
                     next_state=idle_state; 
                 end 
    
     down_state: 
                begin 
                  if((d&now_f)||(dn&now_f)) 
                    next_state=open_state; 
                  else if(((d<now_f)&&(d!=4'b0001))||((dn<now_f)&&(dn!=4'b0001))) 
                    next_state=down_state; 
                  else if((d>now_f)||(dn>now_f)) 
                     next_state=up_state;
                  else if(up>0) 
                       begin 
                         if(up<now_f)            
                           next_state=down_state; 
                         else if((up&now_f)&&(now_f>f1))  
                           next_state=down_state; 
                         else if((up&now_f)&&(now_f==f1)) 
                           next_state=open_state; 
                          else 
                           next_state=up_state; 
                        end 
                      else 
                        next_state=idle_state; 
                   end 
               
    close_state: 
                   begin 
                     if(ud_f==up_f) 
                       begin 
                         if((d&now_f)||(up&now_f)) 
                           next_state=open_state; 
                         else if((d>now_f)||(up>now_f)) 
                           next_state=up_state; 
                         else if(d||up) 
                           next_state=down_state; 
                          else if(dn>0) 
                            begin 
                              if(dn>now_f) 
                                next_state=up_state; 
                              else if((dn&now_f)>0) 
                                next_state=open_state; 
                               else 
                                next_state=down_state; 
                            end 
                           else 
                            next_state=idle_state; 
                           end 
                        else if(ud_f==dn_f) 
                       begin 
                            if((d&now_f)||(dn&now_f)) 
                              next_state=open_state; 
                            else if(((d<now_f)&&(d!=4'b0000))||((dn<now_f)&&(dn!=4'b0000))) 
                              next_state=down_state; 
                            else if(d||dn) 
                                next_state=up_state; 
                            else if(up>0)            
                            begin 
                                if(up<now_f) 
                                  next_state=down_state; 
                                else if((up&now_f)>0) 
                                  next_state=open_state; 
                                else 
                                  next_state=up_state; 
                            end 
                           else 
                             next_state=idle_state; 
                      end 
                    else  
                      begin 
                        if(d>0) 
                         begin 
                           if((d&now_f)>0) 
                             next_state=open_state; 
                           else if(d>now_f) 
                             next_state=up_state; 
                           else  
                             next_state=down_state; 
                          end 
                        else if((up&now_f)||(dn&now_f)) 
                          next_state=open_state; 
                        else if((up>now_f)||(dn>now_f)) 
                          next_state=up_state; 
                        else if(up||dn) 
                          next_state=down_state;                            
                        else 
                          next_state=idle_state; 
                      end 
                  end 
    
     default: 
              next_state=idle_state; 
    
    endcase 
    
    always @(posedge clk1s or posedge reset)  
    if(reset) 
      begin 
        now_f<=f1; 
        ud_f<=idle; 
          led<=1; 
        end 
     else     
        begin 
         now_f<=now_f; 
         case(next_state) 
           idle_state: 
             begin 
               now_f<=now_f; 
               ud_f<=idle; 
               led<=led; 
             end 
           up_state: 
              begin 
                now_f<=now_f<<1; 
                ud_f<=up_f; 
                led<=led+1;
              end 
            down_state: 
              begin 
                now_f<=now_f>>1; 
                ud_f<=dn_f; 
                led<=led-1;
              end 
            open_state: 
              begin 
                now_f<=now_f; 
                ud_f<=ud_f; 
                led<=led; 
              end 
            close_state: 
              begin 
                now_f<=now_f; 
                ud_f<=ud_f; 
                led<=led; 
              end 
            default: 
              begin 
                now_f<=f1; 
                ud_f<=idle; 
                led<=led; 
              end  
     endcase 
    end 
    always@(dataP)
      case(dataP)
        0:seg=8'b0011_1111;
        1:seg=8'b0000_0110;
        2:seg=8'b0101_1011;
        3:seg=8'b0100_1111;
        4:seg=8'b0110_0110;
        5:seg=8'b0110_1101;
        6:seg=8'b0111_1101;
        7:seg=8'b0000_0111;
        8:seg=8'b0111_1111;
        9:seg=8'b0110_1111;
        10:seg=8'b0100_0000;
        11:seg=8'b0000_0000;
        default:seg = 8'b0000_1000;
      endcase
always @(posedge clk190hz)
            begin
            case(posC)
             0: begin
                pos<=4'b0001;
                dataP<=count;
                end
             1: begin
                pos<=4'b0010;
                /*case(led)
                4'b0001:dataP<=1;
                4'b0010:dataP<=2;
                4'b0100:dataP<=3;
                4'b1000:dataP<=4;
                endcase */
                dataP<=led;
                end
             2: begin
                pos<=4'b0100;
                dataP<=ud_f;
                end
             3: begin
                pos<=4'b1000;
                dataP<=state;
                end
              endcase
              posC = posC+1;
              end
always@(posedge clk1s)
       begin
            up1_f=up1;up2_f=up2;up3_f=up3;dn2_f=dn2;dn3_f=dn3;dn4_f=dn4;
       d1_f=d1;d2_f=d2;d3_f=d3;d4_f=d4;
       end
always @(up1_f or up2_f or up3_f  ) 
       up={1'b0, up3_f, up2_f, up1_f};   
    
    always @(dn2_f or dn3_f or dn4_f ) 
       dn={dn4_f, dn3_f, dn2_f, 1'b0};   
    
    always @(d1_f or d2_f or d3_f or d4_f ) 
       d={d4_f, d3_f, d2_f, d1_f};  
    always @(posedge clk1s or posedge reset) 
             if(reset) 
                 count<=0; 
             else if((next_state==open_state)&&(count<10)) 
                 count<=count+1; 
     else 
                 count<=0; 
endmodule
