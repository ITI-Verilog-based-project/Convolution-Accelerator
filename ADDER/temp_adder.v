module temp_adder (
        
    input        wire         [31:0]          IEEE_FORMAT,
    input                                     en,
    input                                     rst,
    input                                     clk,
    output        reg         [31:0]          out,
    output        reg         [31:0]          OP_A  
 

);



reg [31:0] temp;


always @(posedge clk)begin

if(~en & ~rst)begin
    temp = 0;
    OP_A = temp;
end
else if (en & ~rst)begin
    temp = IEEE_FORMAT;
    OP_A = temp; 
    out = IEEE_FORMAT;  
     
end
else 
begin 
    out = temp;
    temp = 0;
    OP_A = 0;
    
end


end

endmodule