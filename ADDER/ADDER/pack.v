module pack(
input       wire                             sign,
input       wire     [22:0]                  mantissa,
input       wire     [7:0]                   exponent,
output      wire     [31:0]                  IEEE_FORMAT
);


assign IEEE_FORMAT = {sign,exponent,mantissa};





endmodule