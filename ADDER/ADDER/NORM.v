module NORM(
input          wire         [23:0]       result,
input          wire         [7:0]        exponent,
input          wire                      carry,
input          wire         [4:0]        NUM_LEAD_ZERO,   
output         reg          [23:0]       n_result,
output         reg          [7:0]        n_exponent
);


//internal wires
wire           [24:0]      mantissa; 


assign mantissa = {carry,result};

always@(*)
begin
	if(carry)
		begin
			n_result = mantissa >> 1;
			n_exponent = exponent + 1'b1;
		end
	else
		begin
			n_result = mantissa << NUM_LEAD_ZERO;
			n_exponent = exponent - NUM_LEAD_ZERO;
		end

end

endmodule