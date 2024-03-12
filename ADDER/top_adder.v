module top_adder (

    input         wire         [31:0]        OP_B,
    input                                     en,
    input                                     clk,
    input                                     rst,
    output                    [31:0]          out

);


wire [31:0]OP_A , IEEE_FORMAT;

 ADDER add(
    .OP_A               (OP_A),  
    .OP_B               (OP_B),
    .OP                 (1'b0),
    .IEEE_FORMAT        (IEEE_FORMAT)
    );
    
 temp_adder temp (
        
    .IEEE_FORMAT         (IEEE_FORMAT),
    .en                  (en),
    .rst                 (rst),
    .clk                 (clk),
    .out                 (out),
    .OP_A                (OP_A) 
     
    );


    
endmodule