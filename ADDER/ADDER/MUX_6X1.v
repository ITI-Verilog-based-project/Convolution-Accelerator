module MUX_6X1(
input         wire     [1:0]       z0,
input         wire     [1:0]       z1,
input         wire     [1:0]       z2,
input         wire     [1:0]       z3,
input         wire     [1:0]       z4,
input         wire     [1:0]       z5,
input         wire     [2:0]       sel,
output        reg      [1:0]       out
);


always@(*)
begin
	case(sel)
	
		3'b000:begin
			out = z0;
		end
	
		3'b001:begin
			out = z1;
		end
	
		3'b010:begin
			out = z2;
		end
		
		3'b011:begin
			out = z3;
		end
		
		3'b100:begin
			out = z4;
		end
		
		3'b101:begin
			out = z5;
		end
      
		default:begin
                       out = 2'b00;
                end
	endcase
end

endmodule