module test;
  reg [7:0] a;
  reg [7:0] b;
  wire [7:0] sum;
  wire cout;
  add_mux4 U1(a,b,sum,cout);
  initial
    begin   
      a=0;b=1;
    end
  always
    begin
      #20 a=2;b=3;
      #20 a=20;b=44; 
      #20 a=25;b=55;
      #20 a=30;b=66;
      #20 a=35;b=77;    
    end  
endmodule
