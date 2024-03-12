module ADDER(
input         wire         [31:0]        OP_A,  
input         wire         [31:0]        OP_B,
input         wire                       OP,
output        wire         [31:0]        IEEE_FORMAT
);



//internal signals
wire                           eop;
wire             [23:0]        result;
wire             [7:0]         DIFF;
wire             [23:0]        sr_mantissa;
wire             [4:0]         NUM_LEAD_ZERO;
wire                           sign;

wire             [7:0]         n_exponent;
wire             [23:0]        n_result;
wire                           carry;

wire           [7:0]            cal_exponent;
wire                     	    equal;                 
wire           [7:0]            s_exponent;           
wire           [7:0]            l_exponent;           
wire           [22:0]           l_mantissa;           
wire           [22:0]           s_mantissa;  
wire                            swap;  
wire                            sel_OUT;      





detect_large detect_large(
.A(OP_A),
.B(OP_B),
.equal(equal),                   
.s_exponent(s_exponent),           
.l_exponent(l_exponent),           
.l_mantissa(l_mantissa),           
.s_mantissa(s_mantissa),
.swap(swap)           
);

SUB SUB(
.exponent_A(l_exponent),
.exponent_B(s_exponent),
.exponents_diffrence(DIFF)
);

shift_right shift_right(
.mantissa({1'b1,s_mantissa}),
.N_DIFF(DIFF),
.N_mantissa(sr_mantissa)         
);

ALU ALU(
.eop(eop),
.large_m({1'b1,l_mantissa}),
.small_m(sr_mantissa),
.large_ex(l_exponent),
.small_ex(s_exponent),
.result(result),
.carry(carry)
);


EOP EOP(
.sign_a(OP_A[31]), 
.sign_b(OP_B[31]),
.op(OP),
.eop(eop) 
 );
 
 
sign_logic sign_logic(
.op(OP),
.OP_A_S(OP_A[31]),
.OP_B_S(OP_B[31]),
.equal(equal),
.sign(sign),
.swap(swap)
);

NORM NORM(
.result(result),
.exponent(cal_exponent),
.carry(carry),
.NUM_LEAD_ZERO(NUM_LEAD_ZERO),   
.n_result(n_result),
.n_exponent(n_exponent)
);

LZC LZC(
.result(result),
.NUM_LEAD_ZERO(NUM_LEAD_ZERO)           
);

MUX_2X1 #(8) MUX_2X1_OUT(
.A(l_exponent),
.B(8'd0),
.sel(sel_OUT),
.OUT(cal_exponent)
);

assign sel_OUT = equal & eop;

pack pack(
.sign(sign),
.mantissa(n_result[22:0]),
.exponent(n_exponent),
.IEEE_FORMAT(IEEE_FORMAT)
);



endmodule