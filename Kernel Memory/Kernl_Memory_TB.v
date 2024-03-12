module kernel_memory_tb;
 

  parameter DATA_WIDTH=128;
   parameter DATA_WIDTH2=32;
  parameter ADDRESS_WIDTH=6;

  reg  [DATA_WIDTH-1:0] Data_In_tb;
  reg    [(ADDRESS_WIDTH-1):0] Address_tb;
  reg [3:0] mul_shift_tb,accu_shift_tb;
  reg Write_En_tb,en_tb, clk_tb;
  reg Last_Address_tb;
  wire [DATA_WIDTH2-1:0] Data_out_tb; 
  reg [31:0] stored_data [63:0];  
  reg [5:0] i;
   Kernl_memory Dut (
    .Data_In(Data_In_tb),
    .Last_Address(Last_Address_tb),
    .Address(Address_tb),
    .Write_En(Write_En_tb),
    .En(en_tb),
    .clk(clk_tb),
    .Data_out(Data_out_tb)
  );
 
// Clock Generator  
  always #5 clk_tb = ~clk_tb ;
 
  initial begin
    // $dumpfile(" memory_input.vcd") ;
    // $dumpvars ;
    //initial values
    clk_tb=0;
    en_tb=0;
    Write_En_tb=0; 
    Address_tb=0;
  
   @(posedge clk_tb);
    write();
    read();
    read();
    read();
    read();
    read();
    read();
    read();
    read();
    read();
    #100
 
    $stop;
  end
   task write();
    begin
       for(i=0 ; i<9 ; i=i+4)begin
       @(posedge clk_tb);
      en_tb=1;
      Last_Address_tb=1;
      Write_En_tb=1;
      Data_In_tb = $random;
      if(i != 8)
        begin
          stored_data[i]=Data_In_tb[31:0];
          stored_data[i+1] = Data_In_tb[63:32];
		      stored_data[i+2]= Data_In_tb[95:64];
		      stored_data[i+3]= Data_In_tb[127:96];
		    end
		  else
		    begin
		     Last_Address_tb=0; 
		     stored_data[i]=Data_In_tb[31:0];
		     end
     
       end
  
       @(posedge clk_tb);
       en_tb=0;
       repeat(2) @(posedge clk_tb);
    end
  endtask

  task read();
    begin
          Address_tb=0;
          en_tb=1;
          Write_En_tb=0;
          for(i=0 ; i<9 ; i=i+1)
            begin
              @(posedge clk_tb);
              if (Data_out_tb == stored_data[i])begin
                $display(">> Testcase[%d] Succeded >> value of data_out = %h",i+1,Data_out_tb);
                $display("Time : %t " , $time);
              end else begin
                $display(">> Testcase[%d] Failed >> expected value = %h",i+1,stored_data[i]);
             $display("Time : %t " , $time);
             end
               Address_tb= Address_tb+1;
              @(posedge clk_tb);
             
            end

      @(posedge clk_tb);
       en_tb=0;
      repeat(2) @(posedge clk_tb);
      end
  endtask
 
endmodule
