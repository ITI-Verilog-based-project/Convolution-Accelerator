
module ADDER_tb();



reg             [31:0]           OP_A_tb;  
reg             [31:0]           OP_B_tb;
reg                              OP_tb;
wire            [31:0]           IEEE_FORMAT_tb;

wire [31:0] Expected_value10 , Expected_value11 , Expected_value14 , Expected_value15 ;
wire [31:0] Expected_value20 , Expected_value21 , Expected_value24 , Expected_value25 ;
wire [31:0] Expected_value30 , Expected_value31 , Expected_value34 , Expected_value35 ;
integer pass_count = 0 ;
integer fail_count = 0 ;

assign Expected_value10 =32'b00111111011000000000000000000000;
assign Expected_value11 =32'b00000000000000000000000000000000;
assign Expected_value14 =32'b00000000000000000000000000000000;
assign Expected_value15 =32'b10111111011000000000000000000000;

assign Expected_value20 =32'b00111111011100000000000000000000;
assign Expected_value21 =32'b00111101100000000000000000000000;
assign Expected_value24 =32'b10111101100000000000000000000000;
assign Expected_value25 =32'b10111111011100000000000000000000;

assign Expected_value30 =32'b00111111011100000000000000000000;
assign Expected_value31 =32'b10111101100000000000000000000000;
assign Expected_value34 =32'b00111101100000000000000000000000;
assign Expected_value35 =32'b10111111011100000000000000000000;



initial
begin

///////////////////////////////// if op_a = op_b ////////////////////////////////
// + + +
OP_A_tb = 32'b00111110111000000000000000000000;
OP_tb = 1'b0;
OP_B_tb = 32'b00111110111000000000000000000000;
#3
if (IEEE_FORMAT_tb == Expected_value10 )begin
pass_count = pass_count+1;
$display("Test Passed : expected output = %0h ,  Actual output = %0h ",Expected_value10, IEEE_FORMAT_tb);
end
else
begin
    fail_count = fail_count +1;
$display("Test Failsd : expected output = %0b ,  Actual output = %0b,time = %t ",Expected_value10, IEEE_FORMAT_tb,$time);
end
#3
// + + -
OP_A_tb = 32'b00111110111000000000000000000000;
OP_tb = 1'b0;
OP_B_tb = 32'b10111110111000000000000000000000;
#3
if (IEEE_FORMAT_tb == Expected_value11 )begin
    pass_count = pass_count+1;
    $display("Test Passed : expected output = %0h ,  Actual output = %0h ",Expected_value11, IEEE_FORMAT_tb);
    end
else
    begin
        fail_count = fail_count +1;
    $display("Test Failsd : expected output = %0b ,  Actual output = %0b,time = %t",Expected_value11, IEEE_FORMAT_tb,$time );
    end

#3

// - + +
OP_A_tb = 32'b10111110111000000000000000000000;
OP_tb = 1'b0;
OP_B_tb = 32'b00111110111000000000000000000000;
#3
if (IEEE_FORMAT_tb == Expected_value14 )begin
    pass_count = pass_count+1;
    $display("Test Passed : expected output = %0h ,  Actual output = %0h ",Expected_value14, IEEE_FORMAT_tb);
    end
else
    begin
        fail_count = fail_count +1;
    $display("Test Failsd : expected output = %0b ,  Actual output = %0b,time = %t",Expected_value14, IEEE_FORMAT_tb,$time );
    end

#3
// - + -
OP_A_tb = 32'b10111110111000000000000000000000;
OP_tb = 1'b0;
OP_B_tb = 32'b10111110111000000000000000000000;
#3
if (IEEE_FORMAT_tb == Expected_value15 )begin
    pass_count = pass_count+1;
    $display("Test Passed : expected output = %0h ,  Actual output = %0h ",Expected_value15, IEEE_FORMAT_tb);
    end
else
    begin
        fail_count = fail_count +1;
    $display("Test Failsd : expected output = %0b ,  Actual output = %0b,time = %t",Expected_value15, IEEE_FORMAT_tb,$time );
    end
#3

///////////////////////////////// if op_a > op_b ////////////////////////////////

// + + +
OP_A_tb = 32'b00111111000000000000000000000000;
OP_tb = 1'b0;
OP_B_tb = 32'b00111110111000000000000000000000;
#3
if (IEEE_FORMAT_tb == Expected_value20 )begin
    pass_count = pass_count+1;
    $display("Test Passed : expected output = %0h ,  Actual output = %0h ",Expected_value20, IEEE_FORMAT_tb);
    end
else
    begin
        fail_count = fail_count +1;
    $display("Test Failsd : expected output = %0b ,  Actual output = %0b,time = %t",Expected_value20, IEEE_FORMAT_tb,$time );
    end
#3


// + + -
OP_A_tb = 32'b00111111000000000000000000000000;
OP_tb = 1'b0;
OP_B_tb = 32'b10111110111000000000000000000000;
#3
if (IEEE_FORMAT_tb == Expected_value21 )begin
    pass_count = pass_count+1;
    $display("Test Passed : expected output = %0h ,  Actual output = %0h ",Expected_value21, IEEE_FORMAT_tb);
    end
else
    begin
        fail_count = fail_count +1;
    $display("Test Failsd : expected output = %0b ,  Actual output = %0b,time = %t",Expected_value21, IEEE_FORMAT_tb,$time );
    end
#3


// - + +
OP_A_tb = 32'b10111111000000000000000000000000;
OP_tb = 1'b0;
OP_B_tb = 32'b00111110111000000000000000000000;
#3
if (IEEE_FORMAT_tb == Expected_value24 )begin
    pass_count = pass_count+1;
    $display("Test Passed : expected output = %0h ,  Actual output = %0h ",Expected_value24, IEEE_FORMAT_tb);
    end
else
    begin
        fail_count = fail_count +1;
    $display("Test Failsd : expected output = %0b ,  Actual output = %0b,time = %t",Expected_value24, IEEE_FORMAT_tb,$time );
    end
#3

// - + -
OP_A_tb = 32'b10111111000000000000000000000000;
OP_tb = 1'b0;
OP_B_tb = 32'b10111110111000000000000000000000;
#3
if (IEEE_FORMAT_tb == Expected_value25 )begin
    pass_count = pass_count+1;
    $display("Test Passed : expected output = %0h ,  Actual output = %0h ",Expected_value25, IEEE_FORMAT_tb);
    end
else
    begin
        fail_count = fail_count +1;
    $display("Test Failsd : expected output = %0b ,  Actual output = %0b,time = %t",Expected_value25, IEEE_FORMAT_tb,$time );
    end
#3


//////////////////////////////// if  opb > opa ///////////////////////////////////

// + + +
OP_A_tb = 32'b00111110111000000000000000000000;
OP_tb = 1'b0;
OP_B_tb = 32'b00111111000000000000000000000000;
#3
if (IEEE_FORMAT_tb == Expected_value30 )begin
    pass_count = pass_count+1;
    $display("Test Passed : expected output = %0h ,  Actual output = %0h ",Expected_value30, IEEE_FORMAT_tb);
    end
else
    begin
        fail_count = fail_count +1;
    $display("Test Failsd : expected output = %0b ,  Actual output = %0b,time = %t",Expected_value30, IEEE_FORMAT_tb,$time );
    end
#3

// + + -
OP_A_tb = 32'b00111110111000000000000000000000;
OP_tb = 1'b0;
OP_B_tb = 32'b10111111000000000000000000000000;
#3
if (IEEE_FORMAT_tb == Expected_value31 )begin
    pass_count = pass_count+1;
    $display("Test Passed : expected output = %0h ,  Actual output = %0h ",Expected_value31, IEEE_FORMAT_tb);
    end
else
    begin
        fail_count = fail_count +1;
    $display("Test Failsd : expected output = %0b ,  Actual output = %0b,time = %t",Expected_value31, IEEE_FORMAT_tb,$time );
    end
#3


// - + +
OP_A_tb = 32'b10111110111000000000000000000000;
OP_tb = 1'b0;
OP_B_tb = 32'b00111111000000000000000000000000;
#3
if (IEEE_FORMAT_tb == Expected_value34 )begin
    pass_count = pass_count+1;
    $display("Test Passed : expected output = %0h ,  Actual output = %0h ",Expected_value34, IEEE_FORMAT_tb);
    end
else
    begin
        fail_count = fail_count +1;
    $display("Test Failsd : expected output = %0b ,  Actual output = %0b,time = %t",Expected_value34, IEEE_FORMAT_tb,$time );
    end
#3


// - + -
OP_A_tb = 32'b10111110111000000000000000000000;
OP_tb = 1'b0;
OP_B_tb = 32'b10111111000000000000000000000000;
#3
if (IEEE_FORMAT_tb == Expected_value35 )begin
    pass_count = pass_count+1;
    $display("Test Passed : expected output = %0h ,  Actual output = %0h ",Expected_value35, IEEE_FORMAT_tb);
    end
else
    begin
        fail_count = fail_count +1;
    $display("Test Failsd : expected output = %0b ,  Actual output = %0b,time = %t",Expected_value35, IEEE_FORMAT_tb,$time );
    end
#3

$display("simulation finished");
$display("Passed Tests = %d", pass_count);
$display("Failed Tests = %d", fail_count);
#1000
$stop;

end





ADDER DUT(
.OP_A(OP_A_tb),  
.OP_B(OP_B_tb),
.OP(OP_tb),
.IEEE_FORMAT(IEEE_FORMAT_tb)
);





endmodule