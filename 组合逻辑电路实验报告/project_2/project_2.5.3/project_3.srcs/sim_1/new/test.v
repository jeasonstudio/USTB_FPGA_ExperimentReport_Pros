module test;
  reg [7:0] a;
  reg [7:0] b;
  reg cin;
  wire [7:0] sum;
  wire cout;
  max_speed U1(a,b,cin,sum,cout);
  initial
    begin   
      a=0;b=1;cin=1;
    end
  always
    begin
      #20 a=2;b=3;
      #20 a=20;b=44; 
      #20 a=25;b=55;
      #20 a=30;b=66;
      #20 a=35;b=77;    
    end  
  always #22 cin=~cin;
endmodule
