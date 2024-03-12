module top (
    
    input           clk,
    input           rst,
    input  [127:0]  data_in,
    input           control,
    output          done,
    output [4:0]    mul_shift,
    output [4:0]    accu_shift,
    output [5:0]    kirnal_shift,
    output          rw_kr_mem,
    output          en_kr_mem,
    output          num_kr_addr,
    output          rw_in_mem, 
    output          en_in_mem,
    output          num_in_addr,
    output          en_out_mem,
    output          rw_out_mem,
    output          en_mult,
    output          en_accuml,
    output          rst_accuml,
    output          valid
);

wire  en_reg  , rw_reg  ;
wire [9:0] input_counter , output_counter  ; 
wire [5:0] kernal_counter;



 register reg1 (
    .clk                     (clk),
    .rst                     (rst),
    .en                      (en_reg),
    .r_w                     (rw_reg),
    .in                      (data_in),
    .mul_shift               (mul_shift),
    .accu_shift              (accu_shift),
    .kirnal_shift            (kirnal_shift), 
    .kernal_counter          (kernal_counter),
    .input_counter           (input_counter),
    .out_counter             (output_counter),
    .valid                  (valid)

);

 controller  Control(
     .clk                    (clk) ,
     .rst                    (rst) ,
     .control                (control),
     .valid                  (valid),
     .kernal_counter         (kernal_counter),
     .input_counter          (input_counter),
     .output_counter         (output_counter),
     .en_in_mem              (en_in_mem),
     .rw_in_mem              (rw_in_mem),
     .num_kr_addr            (num_kr_addr),
     .num_in_addr            (num_in_addr),
     .en_kr_mem              (en_kr_mem),
     .rw_kr_mem              (rw_kr_mem),
     .en_reg                 (en_reg),
     .rw_reg                 (rw_reg),
     .en_out_mem             (en_out_mem),
     .rw_out_mem             (rw_out_mem),
     .en_mult                (en_mult),
     .en_accuml              (en_accuml),
     .rst_accuml             (rst_accuml),
     .done                   (done)


);
    
endmodule