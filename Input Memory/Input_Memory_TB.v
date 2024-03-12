module memory_tb;
 

  parameter DATA_WIDTH=128;
   parameter DATA_WIDTH2=32;
  parameter ADDRESS_WIDTH=8;

  reg  [DATA_WIDTH-1:0] Data_In_tb;
  reg [3:0]           mul_shift_tb,accu_shift_tb;
  reg                 Write_En_tb,en_tb, clk_tb;
  reg  Last_Address_tb;
  wire [DATA_WIDTH2-1:0] Data_out_tb; 
reg [31:0] stored_data [63:0];  
reg [5:0] i;
reg [5:0] j;
reg [3:0]  Mul_array [8:0];
reg [3:0]  Accu_array [8:0];
reg [4:0] Shift_Address;
  Input_Memory Dut (
    .Data_In(Data_In_tb),
    .mul_shift(mul_shift_tb),
    .accu_shift(accu_shift_tb),
    .Write_En(Write_En_tb),
    .Last_Address(Last_Address_tb),
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
    Mul_array[0]=4'd0;
    Mul_array[1]=4'd1;
    Mul_array[2]=4'd2;
    Mul_array[3]=4'd5;
    Mul_array[4]=4'd6;
    Mul_array[5]=4'd7;
    Mul_array[6]=4'd10;
    Mul_array[7]=4'd11;
    Mul_array[8]=4'd12;
    
    Accu_array[0]=4'd0;
    Accu_array[1]=4'd1;
    Accu_array[2]=4'd2;
    Accu_array[3]=4'd5;
    Accu_array[4]=4'd6;
    Accu_array[5]=4'd7;
    Accu_array[6]=4'd10;
    Accu_array[7]=4'd11;
    Accu_array[8]=4'd12;
    
  
   @(posedge clk_tb);
    write();
    read();
    #100
 
    $stop;
  end
   task write();
    begin
       for(i=0 ; i<25 ; i=i+4)begin
       @(posedge clk_tb);
      en_tb=1;
      Write_En_tb=1;
      Last_Address_tb=1;
      Data_In_tb = $random;
       if(i != 24)
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
     
      for(j=0 ; j <9 ; j=j+1)
        begin
          en_tb=1;
          Write_En_tb=0;
          accu_shift_tb=Accu_array[j];
          for(i=0 ; i<9 ; i=i+1)
            begin
              mul_shift_tb=Mul_array[i];
              @(posedge clk_tb);
              Shift_Address = mul_shift_tb+accu_shift_tb;
              if (Data_out_tb == stored_data[Shift_Address])begin
                $display(">> Testcase[%d] Succeded >> value of data_out = %h",i+1,Data_out_tb);
                $display("Time : %t " , $time);
              end else begin
                $display(">> Testcase[%d] Failed >> expected value = %h",i+1,stored_data[Shift_Address]);
             $display("Time : %t " , $time);
             end
              @(posedge clk_tb);
             
            end
            
           en_tb=0;
           @(posedge clk_tb);
           @(posedge clk_tb);   
        end

      repeat(2) @(posedge clk_tb);
      end
  endtask
 
endmodule