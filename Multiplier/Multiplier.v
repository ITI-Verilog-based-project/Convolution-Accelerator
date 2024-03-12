module Multiplier(A, B,En, Out,Invalid_Num);
  input  [31:0] A, B;
  input         En;
  output wire [31:0] Out;
  output reg Invalid_Num;

 
  wire A_Sign;
  wire [7:0] A_Exponent;
  wire [23:0] A_Mantissa;
  wire B_Sign;
  wire [7:0] B_Exponent;
  wire [23:0] B_Mantissa;
 
  reg Result_Sign;
  reg [7:0] Result_Exponent;
  reg [47:0] Result;
  reg [22:0] Result_Mantissa;
  

assign A_Sign = A[31];
assign B_Sign = B[31];
assign A_Exponent = A[30:23];
assign B_Exponent = B[30:23];
assign A_Mantissa = {1'b1,A[22:0]};
assign B_Mantissa = {1'b1,B[22:0]};
 



 




always@(*)begin
     if(En)
       begin
        //If a is NaN 
			   if ((A_Exponent == 255 && A_Mantissa != 0) ) begin

				    Result_Sign = A_Sign;
				    Result_Exponent = A_Exponent;
				    Result_Mantissa = A_Mantissa;
            Invalid_Num = 1;
     
			//If b is NaN 
			   end else if ((B_Exponent == 255 && B_Mantissa  != 0) ) begin
				  Result_Sign = B_Sign;
				  Result_Exponent = B_Exponent;
				  Result_Mantissa = B_Mantissa;
          Invalid_Num = 1;
      
			//if a or b is inf return inf
			   end else if ((A_Exponent == 255) || (B_Exponent == 255)) begin
				  Result_Sign = A_Sign ^ B_Sign;
				  Result_Exponent = 255;
				  Result_Mantissa = 0;
          Invalid_Num = 1;
          end
          else if (((A_Exponent == 0) && (A_Mantissa == {1'b1,23'b0})) || ((B_Exponent == 0) && (B_Mantissa == {1'b1,23'b0}) ))begin
             
            Result_Sign = 0;    
				    Result_Exponent = 0;
				    Result_Mantissa = 0;
				     Invalid_Num = 0;
 

 
          end else begin




 
          Invalid_Num = 0;
          Result_Sign = A_Sign ^ B_Sign;
          Result_Exponent = A_Exponent + B_Exponent - 8'd127;

         Result = A_Mantissa*B_Mantissa;


 
 
         if(Result[47] == 1'b1) begin
  
            Result = Result ;
            Result_Exponent = Result_Exponent + 1;






          end else if (Result[47]== 1'b0) begin

        	   Result = Result << 1 ; 
            Result_Exponent = Result_Exponent  ;





          end if (Result[23] && (Result[22:0] != 0))begin
            Result_Mantissa = Result[46:24]+1'b1;


          end else 
           Result_Mantissa = Result[46:24];
 



          end
          end
        else
          begin
            Result_Sign = 0;    
				    Result_Exponent = 0;
				    Result_Mantissa = 0;
          end

end


assign Out = {Result_Sign,Result_Exponent,Result_Mantissa};


endmodule