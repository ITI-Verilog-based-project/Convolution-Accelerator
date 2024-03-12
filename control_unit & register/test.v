module test_top ();


    reg           clk;
    reg           rst;
    reg  [127:0]  data_in;
    reg           control;
    wire          done;
    wire [4:0]    mul_shift;
    wire [4:0]    accu_shift;
    wire [5:0]    kirnal_shift;
    wire          rw_kr_mem;
    wire          en_kr_mem;
    wire          rw_in_mem; 
    wire          en_in_mem;
    wire          en_out_mem;
    wire          rw_out_mem;
    wire          en_mult;
    wire          en_accuml;
    wire          rst_accuml;
    wire          valid;
    wire          num_in_addr;
    wire          num_kr_addr;



    top uut(
    
        .clk                     (clk),
        .rst                     (rst),
        .data_in                 (data_in),
        .control                 (control),
        .done                    (done),
        .mul_shift               (mul_shift),
        .accu_shift              (accu_shift),
        .kirnal_shift            (kirnal_shift),
        .rw_kr_mem               (rw_kr_mem),
        .en_kr_mem               (en_kr_mem),
        .rw_in_mem               (rw_in_mem), 
        .en_in_mem               (en_in_mem),
        .en_out_mem              (en_out_mem),
        .rw_out_mem              (rw_out_mem),
        .en_mult                 (en_mult),
        .en_accuml               (en_accuml),
        .rst_accuml              (rst_accuml),
        .num_in_addr             (num_in_addr),
        .num_kr_addr             (num_kr_addr),
        .valid                   (valid)
    );



    always #20 clk = ~clk;


     initial begin

        clk = 0 ;
        rst = 0;
        control = 0;
        data_in = 128'b0001001100101;

        #40
        rst = 1;
        control = 1 ;

        #6000
        $finish;
        
     end


    
        
    
    
endmodule