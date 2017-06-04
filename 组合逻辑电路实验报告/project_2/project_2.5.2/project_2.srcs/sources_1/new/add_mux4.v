module add_mux4(a,b,sum,ovf);
input [7:0]a;
input [7:0]b;
output [7:0]sum;
output  ovf;
wire [7:0]cin;
wire [7:0]temp1;

    add_mux U1(a[1:0],b[1:0],0,temp1[1:0],cin[0]);
    add_mux U2(a[3:2],b[3:2],cin[0],temp1[3:2],cin[1]);
    add_mux U3(a[5:4],b[5:4],cin[1],temp1[5:4],cin[2]);
    add_mux U4(a[7:6],b[7:6],cin[2],temp1[7:6],cin[3]);
assign {ovf,sum}={cin[3],temp1};

endmodule
