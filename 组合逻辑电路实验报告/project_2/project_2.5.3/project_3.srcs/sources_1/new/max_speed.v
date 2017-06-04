module max_speed(a,b,cin,sum,cout);
  input [7:0]a,b;
  input cin;
  output [7:0]sum;
  output cout;
  wire cout1;
      add u0(a[3:0],b[3:0],cin,sum[3:0],cout1);
      add u1(a[7:4],b[7:4],cout1,sum[7:4],cout);
endmodule

module add(a,b,ci,s,co);  
  input [3:0]a,b;
  input ci;
  output [3:0]s;
  output co;
  wire [3:0]c_tmp;
  wire [3:0]g;
  wire [3:0]p;
      assign co=c_tmp[3];
      assign g[0]=a[0]&b[0],g[1]=a[1]&b[1], g[2]=a[2]&b[2], g[3]=a[3]&b[3];
      assign p[0]=a[0]|b[0],p[1]=a[1]|b[1], p[2]=a[2]|b[2], p[3]=a[3]|b[3];
      assign c_tmp[0]=g[0]|(p[0]&ci);
      assign c_tmp[1]=g[1]|(p[1]&g[0])|(p[1]&p[0]&ci);
      assign c_tmp[2]=g[2]|(p[2]&g[1])|(p[2]&p[1]&g[0])|(p[2]&p[1]&p[0]&ci);
      assign c_tmp[3]=g[3]|(p[3]&g[2])|(p[3]&p[2]&g[1])|(p[3]&p[2]&p[1]&g[0])|(p[3]&p[2]&p[1]&p[0]&ci);
      assign s[3:0]=a[3:0]^b[3:0]^{c_tmp[2:0],ci};
endmodule
