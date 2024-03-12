module SLZC(
input        wire      b0,
input        wire      b1,
input        wire      b2,
input        wire      b3,
output       wire	   a,
output       wire      q0,
output       wire      q1
);


assign a =  ~(b0 | b1 | b2 | b3) ;

assign q0 = ((~b3) & b2) | ((~b3) & (~b1));

assign q1 = (~b2) & (~b3);








endmodule