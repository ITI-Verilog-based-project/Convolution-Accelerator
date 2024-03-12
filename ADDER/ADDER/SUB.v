module SUB(

input      wire       [7:0]         exponent_A,
input      wire       [7:0]         exponent_B,
output     wire       [7:0]         exponents_diffrence

);


assign exponents_diffrence = exponent_A - exponent_B ;



endmodule