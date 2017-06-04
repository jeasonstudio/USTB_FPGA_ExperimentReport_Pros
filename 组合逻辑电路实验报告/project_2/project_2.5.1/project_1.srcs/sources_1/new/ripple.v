module ripple(ain,bin,cin,sum,cout);
  input [7:0] ain,bin;
  input cin;
  output [7:0] sum;
  wire [6:0] cy;
  output cout;

    FullAdder	uo(ain[0], bin[0], cin, sum[0], cy[0]); 
    FullAdder	u1(ain[1], bin[1], cy[0], sum[1], cy[1]);
    FullAdder	u2(ain[2], bin[2], cy[1], sum[2], cy[2]);
    FullAdder	u3(ain[3], bin[3], cy[2], sum[3], cy[3]);  
    FullAdder	u4(ain[4], bin[4], cy[3], sum[4], cy[4]);
    FullAdder	u5(ain[5], bin[5], cy[4], sum[5], cy[5]);
    FullAdder	u6(ain[6], bin[6], cy[5], sum[6], cy[6]);
    FullAdder	u7(ain[7], bin[7], cy[6], sum[7], cout);
endmodule 


