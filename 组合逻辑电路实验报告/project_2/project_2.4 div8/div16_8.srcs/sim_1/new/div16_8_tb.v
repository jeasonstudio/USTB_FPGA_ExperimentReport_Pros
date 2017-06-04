`timescale 1ns / 1ps

module div16_8_tb(

    );
     reg [15:0] numerator;
           reg [7:0] denominator;
           wire [15:0]  quotient;
           wire [7:0]  remainder;
           initial
            begin
            numerator=0;
            denominator=1;         repeat(10)
            begin
             #10
             numerator={$random}%16+15;
             denominator={$random}%15;
             #10
             numerator={$random}%10+15;
             denominator={$random}%7;
             #10
             numerator={$random}%5+15;
             denominator={$random}%3;
             
             end

             end
             div16_8 U1(. numerator( numerator),.denominator(denominator),. quotient( quotient),.remainder(remainder));
            
endmodule
