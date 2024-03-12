module integration (


    input  wire       control,
    input [127:0]     data_in,
    input  wire       clk,
    input  wire       rst,
    output wire       done,
    output wire       valid,
    output [31:0]     data_out
);




wire [4:0] mul_shift , accu_shift;
wire [5:0]kirnal_shift;
wire rw_kr_mem , en_kr_mem , rw_in_mem , en_in_mem , en_out_mem , rw_out_mem , en_mult , en_accuml , rst_accuml , num_in_addr ,num_kr_addr;
wire [31:0] input_mult1 , input_mult2 , accu_output , accu_input2 ;

 top  control_register(
    
    .clk                  (clk),
    .rst                  (rst),
    .data_in              (data_in),
    .control              (control),
    .done                 (done),
    .mul_shift            (mul_shift),
    .accu_shift           (accu_shift),
    .kirnal_shift         (kirnal_shift),
    .rw_kr_mem            (rw_kr_mem),
    .en_kr_mem            (en_kr_mem),
    .num_kr_addr          (num_kr_addr),
    .num_in_addr          (num_in_addr),
    .rw_in_mem            (rw_in_mem), 
    .en_in_mem            (en_in_mem),
    .en_out_mem           (en_out_mem),
    .rw_out_mem           (rw_out_mem),
    .en_mult              (en_mult ),
    .en_accuml            (en_accuml),
    .rst_accuml           (rst_accuml),
    .valid                (valid)
);
    
Input_Memory In_Mem
    (
       .Data_In            (data_in),
       .mul_shift          (mul_shift),
       .accu_shift         (accu_shift),
       .Write_En           (rw_in_mem),
       .Last_Address       (num_in_addr), 
       .En                 (en_in_mem),
       .clk                (clk),
       .Data_out           (input_mult1)
    );
  

Kernl_memory Kr_Mem
        (
            .Data_In          (data_in),
            .Address          (kirnal_shift), 
            .Write_En         (rw_kr_mem),
            .En               (en_kr_mem),
            .Last_Address     (num_kr_addr),
            .clk              (clk),
            .Data_out         (input_mult2)
        );

CyclicQueue Out_Mem
     (
     
     .Data_In                 (accu_output), 
     .Data_Out                (data_out),
     .clk                     (clk),
     .En                      (en_out_mem), 
     .rst                     (rst), 
     .mode                    (rw_out_mem)
     
     );

Multiplier  Multi
       (
        
       .A                     (input_mult1),
       .B                     (input_mult2),
       .En                    (en_mult),
       .Out                   (accu_input2),
       .Invalid_Num           ()
       
       );


top_adder adder

        (

            .OP_B              (accu_input2),
            .en                (en_accuml),
            .rst               (rst_accuml),
            .clk               (clk),
            .out               (accu_output)
        
        );

endmodule