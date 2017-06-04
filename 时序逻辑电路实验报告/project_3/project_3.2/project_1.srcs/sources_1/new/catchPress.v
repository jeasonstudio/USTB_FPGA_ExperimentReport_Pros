`timescale 1ns / 1ps

module catchPress(input clk190hz, input press, output signal);
    reg delay1, delay2, delay3, delay4, delay5;
    
    always @(posedge clk190hz)
    begin
        delay5 = delay4;
        delay4 = delay3;
        delay3 = delay2; 
        delay2 = delay1;  
        delay1 = press;
    end
    
    assign signal = delay1 & delay2 & delay3 & delay4 & delay5;
endmodule
