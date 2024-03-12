module detect_large(
input         wire          [31:0]           A,
input         wire          [31:0]           B,
output        reg                            equal,                      
output        reg           [7:0]            s_exponent,           
output        reg           [7:0]            l_exponent,           
output        reg           [22:0]           l_mantissa,           
output        reg           [22:0]           s_mantissa,
output        reg                            swap           
);



always@(*)
begin
	if(A[30:23] > B[30:23])
		begin
			equal = 1'b0;
			l_exponent = A[30:23];
			s_exponent = B[30:23];
			l_mantissa = A[22:0];
			s_mantissa = B[22:0];
			swap = 1'b0;
		end
	else if (A[30:23] < B[30:23])
		begin
			equal = 1'b0;
			l_exponent = B[30:23];
			s_exponent = A[30:23];
			l_mantissa = B[22:0];
			s_mantissa = A[22:0] ;
			swap = 1'b1;
		end
	else
		begin
			if(A[22:0] > B[22:0]) begin
			equal = 1'b0;
			l_exponent = A[30:23];
			s_exponent = B[30:23];
			l_mantissa = A[22:0];
			s_mantissa = B[22:0] ;
			swap = 1'b0;
			end
			else if(A[22:0] < B[22:0]) begin
			equal = 1'b0;
			l_exponent = B[30:23];
			s_exponent = A[30:23];
			l_mantissa = B[22:0];
			s_mantissa = A[22:0] ;
			swap = 1'b1;
		    end
			else
			begin
			equal = 1'b1;
			l_exponent = A[30:23];
			s_exponent = B[30:23];
			l_mantissa = A[22:0];
			s_mantissa = B[22:0] ;
			swap = 1'b0;
			end
		end

end


endmodule