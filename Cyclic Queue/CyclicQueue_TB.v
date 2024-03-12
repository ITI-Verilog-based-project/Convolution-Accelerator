`timescale 1ns/1ps  // Adjust the timescale as needed
 
module tb_CyclicQueue;
 
  // Inputs
  reg [31:0] tb_Data_In;
  reg tb_clk, tb_En, tb_rst, tb_mode;
  reg [8:0] i;
  reg [1:0] j;
  // Outputs
  wire [31:0] tb_Data_Out;
// signal
reg [31:0] Stored_data [63:0];
  // Instantiate the module
  CyclicQueue uut (
    .Data_In(tb_Data_In),
    .Data_Out(tb_Data_Out),
    .clk(tb_clk),
    .En(tb_En),
    .rst(tb_rst),
    .mode(tb_mode)
  );
 
  // Clock generation
  initial begin
    tb_clk = 0;
    forever #5 tb_clk = ~tb_clk;
  end
 
  // Initial values
  initial begin
    tb_En =0;
    tb_rst=1;
    @(posedge tb_clk);
    tb_rst=0;

 
    // Test Scenario 1: Write some data
    @(posedge tb_clk);

    tb_rst = 1;
    
    for (i =0; i<12; i= i+1)begin
    tb_En = ~ tb_En;
    tb_mode = 1;
    tb_Data_In = $random;
    Stored_data[i] =  tb_Data_In;
    @(posedge tb_clk);
    tb_En = ~ tb_En;
    @(posedge tb_clk);
    @(posedge tb_clk);
    end

   for(j=0; j<1 ; j=j+1) begin
     tb_mode = 0;  // Read mode
     tb_En =1;
     @(posedge tb_clk);
     for (i =0; i<12; i= i+1)begin
     @(posedge tb_clk);
      if (tb_Data_Out == Stored_data[i])begin
        $display(">> Testcase[%d] Succeded >> value of data_out = %h",i+1,tb_Data_Out);
        $display("Time : %t " , $time);
        end else begin
        $display(">> Testcase[%d] Failed >> expected value = %h",i+1,Stored_data[i]);
        $display("Time : %t " , $time);
      end
    end 
   
   end 
    // Add more test scenarios as needed...
tb_En = ~ tb_En;
@(posedge tb_clk);

for (i =0; i<12; i= i+1)begin
    tb_En = ~ tb_En;
    tb_mode = 1;
    tb_Data_In = $random;
   
    @(posedge tb_clk);
    tb_En = ~ tb_En;
    @(posedge tb_clk);
    @(posedge tb_clk);
    end
 
    #100;
    $finish;  // Stop simulation
  end
 
endmodule
 