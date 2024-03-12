module sign_logic(
input           wire              op,
input           wire              OP_A_S,
input           wire              OP_B_S,
input           wire              swap,
input           wire              equal,
output          reg               sign
);


always@(*)
begin
	if(equal)
		begin
			sign = (OP_A_S & op & ~OP_B_S) | (OP_A_S & ~op & OP_B_S) ;
		end
	else
		begin
			sign = (~swap & OP_A_S) | (swap & ~op & OP_B_S) | (swap & op & ~OP_B_S);                        // this logic is optmized by using k-map
		end


end

endmodule