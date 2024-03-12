module LZCE(
input       wire       [5:0]        a,
output      reg        [2:0]        q
);


always@(*)
begin
	casex(a)
		6'b0xxxxx:begin
			q = 3'b000;
		end
		
		6'b10xxxx:begin
			q = 3'b001;
		end
		
		6'b110xxx:begin
			q = 3'b010;
		end
		
		6'b1110xx:begin
			q = 3'b011 ;
		end
		
		6'b11110x:begin
			q = 3'b100;
		end
		
		6'b111110:begin
			q = 3'b101;
		end
		
		default:begin
			q = 3'b000;	
		end	
		
	endcase

end



endmodule