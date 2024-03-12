module Multiplier_tb;

  
  parameter CLOCK_PERIOD = 10; 

  
  reg [31:0] A, B;
  reg       En;
  wire [31:0] Out;
  wire Invalid_Num;
  reg[31:0] Expected [2:0]; 
  
  
  Multiplier uut (
    .A,
    .B,
    .En,
    .Out,
    .Invalid_Num
  );

  
  

  
  initial begin


  En=1;
  Expected[2] =32'h420AB852;
  Expected[1] = 32'h41A08312;
  Expected[0] = 32'hC16E147B;
  
    // $dumpfile("Multiplier_tb.vcd");
    // $dumpvars(0, Multiplier_tb);

// Test case 1


    A = 32'h40D9999A; 
    B = 32'h40A33333; 
    #10; 

$display(">> Expected : %h",Expected[2]);
$display(">> Actual : %h",Out);
if (Invalid_Num)
$display("Invalid Number");
else
$display(">> Valid Number");


    if (Out == Expected[2])
    $display(">> Testcase Succeded");
    else
    $display(">> Testcase Failed");





// Test case 2



    A = 32'h4105C28F; 
    B = 32'h4019999A; 
    #10; 


$display("\n>> Expected : %h",Expected[1]);
$display(">> Actual : %h",Out);
if (Invalid_Num)
$display("Invalid Number");
else
$display(">> Valid Number"); 

if (Out == Expected[1])
    $display(">> Testcase Succeded");
else
$display(">> Testcase Failed");

  


// Test case 3
    A = 32'hC0C66666; 
    B = 32'h4019999A; 
    #10; 

$display("\n>> Expected : %h",Expected[0]);
$display(">> Actual : %h",Out);
if (Invalid_Num)
$display("Invalid Number");
else
$display(">> Valid Number");


if (Out == Expected[0])
    $display(">> Testcase Succeded");
else
$display(">> Testcase Failed");







// Test Case 4       -- A is NAN -- 

   A = 32'hffc00000;
   B = 32'h40A33333 ; 
   #10; 

$display("\n\\\  Nan Testcase");
$display("\n>> Expected : %h",A);
$display(">> Actual : %h",Out);
if (Invalid_Num)
$display("Invalid Number");
else
$display(">> Valid Number");

if (Out == A)
$display(">> Testcase Succeded");
else
$display(">> Testcase Failed");





// Test Case 5      -- B is NAN -- 


   A = 32'h40A33333;
   B = 32'hffc00000; 
   #10; 

$display("\n\\\  Nan Testcase");
$display("\n>> Expected : %h",B);
$display(">> Actual : %h",Out);
if (Invalid_Num)
$display("Invalid Number");
else
$display(">> Valid Number");


if (Out == B)
$display(">> Testcase Succeded");
else
$display(">> Testcase Failed");




//Test Case 6      --- A is Positive Infinity -- 

 A = 32'h7F800000;
 B = 32'hC0C66666;
 #10; 

$display("\n\\\ Infinity Testcase");
$display("\n>> Expected : %h",A);
$display(">> Actual : %h",Out);
if (Invalid_Num)
$display("Invalid Number");
else
$display(">> Valid Number");

if (Out == A)
$display(">> Testcase Succeded");
else
$display(">> Testcase Failed");



//Test Case 7     ----- B is Negative Infinity -- 

A = 32'hC0C66666;
B = 32'hFF800000;
#10; 

$display("\n\\\ Infinity Testcase");
$display("\n>> Expected : %h",B);
$display(">> Actual : %h",Out);
if (Invalid_Num)
$display("Invalid Number");
else
$display(">> Valid Number");


if (Out == B)
$display(">> Testcase Succeded");
else
$display(">> Testcase Failed");



//Test Case 8    ----- B is Zero -- 

A = 32'h40A33333;
B = 32'h00000000;
#10; 

$display("\n\\\ Zero Testcase");
$display("\n>> Expected : %h",B);
$display(">> Actual : %h",Out);
if (Invalid_Num)
$display("INvalid Number");
else
$display(">> Valid Number");


if (Out == B)
$display(">> Testcase Succeded\n");
else
$display(">> Testcase Failed\n");

#10
En=0;
    $finish;
  end

  
  

endmodule