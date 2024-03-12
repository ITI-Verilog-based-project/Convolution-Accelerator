module top_tb();
    
    
    reg             control;    
    reg [127:0]     data_in;
    reg             clk;
    reg             rst;
    wire            done;
    wire            valid;
    wire [31:0]     data_out;

 reg [127:0]data [10:0];
 reg [127:0]Data_out [8:0];

integration  Int(


    .control             (control),
    .data_in             (data_in),
    .clk                 (clk),
    .rst                 (rst),
    .done                (done),
    .valid               (valid),
    .data_out            (data_out)
);



always #5 clk = ~ clk;

integer i;
real Success_Count ;
integer Fail_Count ;
integer Total_Count;





/// TEST CASE 1 ------------- KERNEL 3X3   INPUT 5X5 STRID 1 -------------


initial begin
$display("TEST CASE 1 ------------- KERNEL 3X3   INPUT 5X5 STRID 1 -------------");

 Success_Count = 0;
 Fail_Count = 0;
 Total_Count = 0;

rst= 0;
clk = 1; 
control = 0;
#10

rst = 1;
#10

control = 1;

$readmemh("Test1_Input.txt",data);
data_in = data[0];
#30
data_in = data[1];
#20
for(i=2 ; i<11 ; i=i+1)
begin
data_in = data[i];
@(posedge clk);
end


$readmemh("Test1_Output.txt",Data_out);

@(data_out)
@(posedge clk);
for(i =0 ; i<9 ; i=i+1)
begin
if (data_out == Data_out[i])begin
$display("\nActual : %h  Expected : %h  >>>>  Success !!",data_out,Data_out[i]);
 $display("Time : %t " , $time);
Success_Count = Success_Count +1; 
end else begin
$display("\nActual : %h  Expected : %h  >>>> Fail !!",data_out,Data_out[i]);
$display("Time : %t " , $time);
Fail_Count = Fail_Count +1;
end
Total_Count = Total_Count +1;

@(posedge clk);
end


$display("\nTotal Test Cases >>%0d\nTest Cases Succeeded  >>%0d\nTest Cases Failed  >>%d\nSuccess Percentage >> %0f\n",
Total_Count,Success_Count,Fail_Count,(Success_Count/Total_Count)*100);


#10
$stop;





/// TEST CASE 2 ------------- KERNEL 2X2   INPUT 3X3 STRID 1 -------------

$display("TEST CASE  ------------- KERNEL 2X2   INPUT 3X3 STRID 1 -------------");

 Success_Count = 0;
 Fail_Count = 0;
 Total_Count= 0;

rst= 0; 
control = 0;
#10

rst = 1;
#10

control = 1;

$readmemh("Test2_Input.txt",data);
data_in = data[0];
#30
data_in = data[1];
#20
for(i=2 ; i<8 ; i=i+1)
begin
data_in = data[i];
@(posedge clk);
end


$readmemh("Test2_Output.txt",Data_out);

@(data_out)
@(posedge clk);

for(i =0 ; i<4 ; i=i+1)
begin
if (data_out == Data_out[i])begin
$display("\nActual : %h  Expected : %h  >>>>  Success !!",data_out,Data_out[i]);
$display("Time : %t " , $time);
Success_Count = Success_Count +1; 
end else begin
$display("\nActual : %h  Expected : %h  >>>> Fail !!",data_out,Data_out[i]);
$display("Time : %t " , $time);
Fail_Count = Fail_Count +1;
end
Total_Count = Total_Count +1;

@(posedge clk);

end


$display("\nTotal Test Cases >>%0d\nTest Cases Succeeded  >>%0d\nTest Cases Failed  >>%d\nSuccess Percentage >> %0f\n",
Total_Count,Success_Count,Fail_Count,(Success_Count/Total_Count)*100);


#10
$stop;
/// TEST CASE 3 ------------- KERNEL 3X3   INPUT 5X5 STRID 1 -------------
$display("TEST CASE  ------------- KERNEL 3X3   INPUT 5X5 STRID 1 -------------");
Success_Count = 0;
 Fail_Count = 0;
 Total_Count= 0;

rst= 0; 
control = 0;
#10

rst = 1;
#10

control = 1;

$readmemh("Test3_Input.txt",data);
data_in = data[0];
#30
data_in = data[1];
#20
for(i=2 ; i<11 ; i=i+1)
begin
data_in = data[i];
@(posedge clk);
end


$readmemh("Test3_Output.txt",Data_out);

@(data_out)
@(posedge clk);

for(i =0 ; i<9 ; i=i+1)
begin
if (data_out == Data_out[i])begin
$display("\nActual : %h  Expected : %h  >>>>  Success !!",data_out,Data_out[i]);
$display("Time : %t " , $time);
Success_Count = Success_Count +1; 
end else begin
$display("\nActual : %h  Expected : %h  >>>> Fail !!",data_out,Data_out[i]);
$display("Time : %t " , $time);
Fail_Count = Fail_Count +1;
end
Total_Count = Total_Count +1;

@(posedge clk);

end


$display("\nTotal Test Cases >>%0d\nTest Cases Succeeded  >>%0d\nTest Cases Failed  >>%d\nSuccess Percentage >> %0f\n",
Total_Count,Success_Count,Fail_Count,(Success_Count/Total_Count)*100);



#10
$stop;
/// TEST CASE 4 ------------- KERNEL 3X3   INPUT 5X5  STRID 2 -------------
$display("TEST CASE  ------------- KERNEL 3X3   INPUT 5X5 STRID 2 -------------");
Success_Count = 0;
 Fail_Count = 0;
 Total_Count= 0;

rst= 0;

control = 0;
#10

rst = 1;
#10

control = 1;

$readmemh("Test4_Input.txt",data);
data_in = data[0];
#30
data_in = data[1];
#20
for(i=2 ; i<11 ; i=i+1)
begin
data_in = data[i];
@(posedge clk);
end


$readmemh("Test4_Output.txt",Data_out);

@(data_out)
@(posedge clk);

for(i =0 ; i<4 ; i=i+1)
begin
if (data_out == Data_out[i])begin
$display("\nActual : %h  Expected : %h  >>>>  Success !!",data_out,Data_out[i]);
$display("Time : %t " , $time);
Success_Count = Success_Count +1; 
end else begin
$display("\nActual : %h  Expected : %h  >>>> Fail !!",data_out,Data_out[i]);
 $display("Time : %t " , $time);
Fail_Count = Fail_Count +1;
end
Total_Count = Total_Count +1;

@(posedge clk);

end


$display("\nTotal Test Cases >>%0d\nTest Cases Succeeded  >>%0d\nTest Cases Failed  >>%d\nSuccess Percentage >> %0f\n",
Total_Count,Success_Count,Fail_Count,(Success_Count/Total_Count)*100);



#10


$finish;

end





endmodule