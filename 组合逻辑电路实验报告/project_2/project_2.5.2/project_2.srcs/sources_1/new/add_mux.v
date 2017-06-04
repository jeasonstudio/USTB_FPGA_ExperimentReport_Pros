module add_mux(A,B,cin,s,cout);
input [1:0]A;
input [1:0]B;
input cin;
output reg [1:0]s;
output reg cout;
reg sel;
reg [3:0]temp;
always @(*)
    begin
    fork
    s[0]=A[0]^B[0]^cin;
    sel=(A[0]&B[0])|(A[0]^B[0])&cin;
    
    temp[1:0]=A[1]+B[1];
    temp[3:2]=A[1]+B[1]+1;
    join
    if(sel)
    {cout,s[1]}=temp[3:2];
    else
    {cout,s[1]}=temp[1:0];
    end


endmodule
