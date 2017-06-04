`timescale 1ns / 1ps

module div16_8(
    input [15:0] numerator,
    input [7:0] denominator,
    output [15:0] quotient,
    output [7:0] remainder
    );
    wire[15:0] numerator;
        wire[7:0] denominator;
        reg[15:0]  quotient;
        reg [7:0]  remainder;
        reg[7:0] remH;
         reg[7:0] remL;
          reg[7:0] quotH;
           reg[7:0] quotL;
           always@(*)
             begin
              div16_8({1'b0,numerator[15:8]},denominator,quotH,remH);
              div16_8({remH,numerator[7:0]},denominator,quotL,remL);
              quotient[15:8]=quotH;
              quotient[7:0]=quotL;
              remainder=remL;
              end
              task div16_8(
              input[15:0] numer,
              input[7:0] denom,
              output[7:0] quot,
              output[7:0] rem);
              begin : D8
              reg[8:0] d;
              reg[8:0] n1;
              reg[7:0] n2;
              d={1'b0,denom};
              n2=numer[7:0];
              n1={1'b0,numer[15:8]};
              repeat(8)
              begin
               n1={n1[7:0],n2[7]};
               n2={n2[6:0],1'b0};
               if(n1>=d)
               begin
               n1=n1-d;
               n2[0]=1;
               end
               end
               quot=n2;
               rem=n1[7:0];
               end
               endtask
endmodule
