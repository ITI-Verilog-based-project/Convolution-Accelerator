module reduction_and(
input     wire    [5:0]   a,
output    wire            SEL_MUX_2X1_NLZ
);

assign SEL_MUX_2X1_NLZ = & a;




endmodule