module LZC(
input          wire        [23:0]      result,
output         wire        [4:0]       NUM_LEAD_ZERO           
);

//internal wires
wire        [5:0]        a;
wire        [2:0]        q;
wire        [1:0]        z0;
wire        [1:0]        z1;
wire        [1:0]        z2;
wire        [1:0]        z3;
wire        [1:0]        z4;
wire   	    [1:0]        z5;
wire        [1:0]        z;                    // output from MUX_6X1;        
wire                     SEL_MUX_2X1_NLZ;


reduction_and reduction_and(
.a(a),
.SEL_MUX_2X1_NLZ(SEL_MUX_2X1_NLZ)
);


LZCE LZCE(
.a(a),
.q(q)
);


MUX_2X1 #(5) MUX_2X1_NLZ(
.A({q,z}),
.B(5'd0),
.sel(SEL_MUX_2X1_NLZ),
.OUT(NUM_LEAD_ZERO)
);


MUX_6X1 MUX_6X1(
.z0(z0),
.z1(z1),
.z2(z2),
.z3(z3),
.z4(z4),
.z5(z5),
.sel(q),
.out(z)
);


SLZC SLZC_0(
.b0(result[20]),
.b1(result[21]),
.b2(result[22]),
.b3(result[23]),
.a(a[5]),
.q0(z0[0]),
.q1(z0[1])
);


SLZC SLZC_1(
.b0(result[16]),
.b1(result[17]),
.b2(result[18]),
.b3(result[19]),
.a(a[4]),
.q0(z1[0]),
.q1(z1[1])
);



SLZC SLZC_2(
.b0(result[12]),
.b1(result[13]),
.b2(result[14]),
.b3(result[15]),
.a(a[3]),
.q0(z2[0]),
.q1(z2[1])
);



SLZC SLZC_3(
.b0(result[8]),
.b1(result[9]),
.b2(result[10]),
.b3(result[11]),
.a(a[2]),
.q0(z3[0]),
.q1(z3[1])
);


SLZC SLZC_4(
.b0(result[4]),
.b1(result[5]),
.b2(result[6]),
.b3(result[7]),
.a(a[1]),
.q0(z4[0]),
.q1(z4[1])
);


SLZC SLZC_5(
.b0(result[0]),
.b1(result[1]),
.b2(result[2]),
.b3(result[3]),
.a(a[0]),
.q0(z5[0]),
.q1(z5[1])
);




endmodule