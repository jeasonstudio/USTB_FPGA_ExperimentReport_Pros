`timescale 1ns / 1ps
module xiaodou(
    input clk_190Hz,
    input btnIn,
    output btnOut
    );
     reg delay1;
     reg delay2;
     reg delay3;
     
        always @(posedge clk_190Hz)begin
             delay3 = delay2; 
             delay2 = delay1;  
             delay1 = btnIn;                    
        end 
        assign btnOut = delay1 & delay2 & delay3;
endmodule
