`timescale 1ns / 1ps
module div84(
    input [7:0] numerator,
    input [3:0] denominator,
    output [7:0] quotient,
    output [3:0] remainder
    );
    wire[7:0] numerator;
    wire[3:0] denominator;
    reg[7:0]  quotient;
    reg [3:0]  remainder;
    reg[3:0] remH;
    reg[3:0] remL;
    reg[3:0] quotH;
    reg[3:0] quotL;
       always@(*)
         begin
             div4({1'b0,numerator[7:4]},denominator,quotH,remH);
             div4({remH,numerator[3:0]},denominator,quotL,remL);
             quotient[7:4]=quotH;
             quotient[3:0]=quotL;
             remainder=remL;
         end
          
          task div4(
          input[7:0] numer,
          input[3:0] denom,
          output[3:0] quot,
          output[3:0] rem);
          begin : D4
          reg[4:0] d;
          reg[4:0] n1;
          reg[3:0] n2;
              d={1'b0,denom};
              n2=numer[3:0];
              n1={1'b0,numer[7:4]};
          repeat(4)
          begin
              n1={n1[3:0],n2[3]};
              n2={n2[2:0],1'b0};
           if(n1>=d)
           begin
           n1=n1-d;
           n2[0]=1;
           end
           end
               quot=n2;
               rem=n1[3:0];
           end
           endtask
 endmodule
          
       
       
       
       
       
       
       
       
    
    
    
    
    
    
    
    
    
    