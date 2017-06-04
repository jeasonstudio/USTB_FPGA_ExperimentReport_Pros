module mult8_tb();
  reg[7:0] a;
  reg[7:0] b;
  wire[15:0] p;
  initial
     begin
       a=0;
       b=0;
     repeat(10)
       begin
              #10 a={$random}%255;
                  b={$random}%255;
       end
       #10 $stop;
       end
       mult8 U1(.a(a),.b(b),.p(p));
endmodule 
 
