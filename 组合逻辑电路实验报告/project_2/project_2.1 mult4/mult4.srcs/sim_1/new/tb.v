module mult4_tb;
  reg[3:0] a;
  reg[3:0] b;
  wire[7:0] p;
  
  mult4 U1(.a(a),.b(b),.p(p));
  
  initial
     begin
       a=0;
       b=0;
     repeat(8)
       begin
              #10 a={$random}%5;
                  b={$random}%5;
              #10 a={$random}%10;
                  b={$random}%10;
              #10 a={$random}%15;
                  b={$random}%15;
                  
       end
       end

endmodule
