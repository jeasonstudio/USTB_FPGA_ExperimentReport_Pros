module mult4(
    input [3:0] a,
    input [3:0] b,
    output reg [7:0] p
    );
    reg[7:0] pv;
    reg[7:0] ap;
    integer i;
    
    always@(*)
       begin
          pv=8'b00000000;
          ap={4'b0000,a};
          for(i=0;i<=3;i=i+1)
             begin
                if(b[i]==1)
                   pv=pv+ap;
                   ap={ap[6:0],1'b0};
             end
          p=pv;
      end
endmodule

