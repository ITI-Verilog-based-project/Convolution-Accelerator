module CyclicQueue (input [31:0] Data_In, output reg [31:0] Data_Out,input clk ,input En, input rst , input mode);
parameter Width = 32;
parameter Depth = 256;
reg [Width-1:0] Queue [Depth-1:0] ;
reg signed[Depth-1:0] Write;
reg signed[Depth-1:0] Read;

always@(posedge clk or negedge rst) begin
if(!rst)begin
Read <=-1;
Write <=-1;
end
end

always@(*)begin

 if (Write == -1 && Read == -1 )begin
@(negedge clk)
Write = 0;
end
end

always @(posedge clk)
begin
  if(mode && En) // Write
   begin
    if((Write +1)%Depth  == Read)begin
    
    Queue[Write] <= Data_In;


   end else if (Write == 0 && Read == -1 )
    begin
      Read <= 0;
      Write <=1;
      Queue[Write] <= Data_In;
      
 
     end
     
      else  
      begin
        Write <= (Write+1)%Depth;
        Queue[Write]<=Data_In;
        
   end
   end
else if (~mode && En)begin   // Read
    if(Write == -1 && Read == -1)begin
    

end else if (Read == Write)// 1 element in the queue
      begin
       

      Data_Out <= Queue[Read];
      Read <= -1;
      Write <= -1;
      end
      else
      begin
      Data_Out<=Queue[Read];
      Read <= (Read+1)%Depth;
        
      end
    end  

else if ( Read == Write  )begin
Read <= -1;
Write <= -1;
end
end



endmodule