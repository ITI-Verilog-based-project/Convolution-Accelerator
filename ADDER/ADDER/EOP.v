module EOP(
input          wire          sign_a, 
input          wire          sign_b,
input          wire          op,
output         wire          eop 
 );


assign eop = sign_a ^ op ^ sign_b;                    


endmodule