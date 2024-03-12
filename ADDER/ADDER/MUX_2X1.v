module MUX_2X1 #(parameter N = 8)(
input       wire       [N-1:0]       A,
input       wire       [N-1:0]       B,
input       wire                     sel,
output      reg        [N-1:0]       OUT
);



always@(*)
begin
	if(sel)
		begin
			OUT = B;
		end
	else
		begin
			OUT = A;
		end
end







endmodule