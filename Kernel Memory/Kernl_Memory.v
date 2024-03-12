module Kernl_memory #(parameter DATA_WIDTH=128,ADDRESS_WIDTH=6,DATA_WIDTH2=32)
(
	input      [DATA_WIDTH-1:0] Data_In,
	input      [(ADDRESS_WIDTH-1):0] Address, 
	input                         Last_Address,
	input                         Write_En,En,clk,
	output reg [DATA_WIDTH2-1:0] Data_out
);
 
	// Declare the RAM variable
	reg [DATA_WIDTH2-1:0] Mem [2**(ADDRESS_WIDTH)-1:0];

    reg [(ADDRESS_WIDTH-1):0] ADDRESS_In ;
	

// Writing 

	always @ (posedge clk)
	begin
		if (En && Write_En)
		  begin
		    if(Last_Address) 
		      begin
		        Mem[ADDRESS_In] <= Data_In[31:0];
		        Mem[ADDRESS_In+1] <= Data_In[63:32];
		        Mem[ADDRESS_In+2] <= Data_In[95:64];
		        Mem[ADDRESS_In+3] <= Data_In[127:96];
            ADDRESS_In=ADDRESS_In+4;
		      end
		    else
		       Mem[ADDRESS_In] <= Data_In[31:0];
		   end
     else if (~En)
        ADDRESS_In = 0;
		end

//Reading


		always@(*)
		begin
		  if(En & ~Write_En)
		    Data_out = Mem[Address];
		  else
		    Data_out=32'b0;
		end


endmodule
