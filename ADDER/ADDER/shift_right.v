module shift_right(

input     wire      [23:0]         mantissa,
input     wire      [7:0]          N_DIFF,
output    wire      [23:0]         N_mantissa         

);


assign N_mantissa = mantissa >> N_DIFF ;



endmodule