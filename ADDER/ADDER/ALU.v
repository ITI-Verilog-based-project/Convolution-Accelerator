module ALU(
input          wire                    eop,
input          wire       [23:0]       large_m,
input          wire       [23:0]       small_m,
input          wire       [7:0]       large_ex,
input          wire       [7:0]       small_ex,
output         reg        [23:0]       result,
output         reg                     carry
);

always@(*)
begin

	case(eop)
		1'b0 : begin
			if(large_m[22:0]==0 && small_m[22:0]==0 && large_ex == 0 && small_ex == 0) begin
				{carry,result} = {1'b0,1'b0,large_m[22:0]} + {1'b0,1'b0,small_m[22:0]};
		end
		else begin
			{carry,result} = {1'b0,large_m} + {1'b0,small_m};
		end
	end
		1'b1 : begin
			if(large_m[22:0]==0 && small_m[22:0]==0 && large_ex == 0 && small_ex == 0) begin
				{carry,result} = {1'b0,1'b0,large_m[22:0]} - {1'b0,1'b0,small_m[22:0]};
		end
		else begin
			{carry,result} = {1'b0,large_m} - {1'b0,small_m};
		end
	end
	endcase
	
end






endmodule