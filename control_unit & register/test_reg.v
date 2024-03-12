module register_tb();
    
        reg clk, rst, en, r_w ;
        reg [127:0] in ; 
        wire [4:0] mul_shift, accu_shift ;
        wire [5:0] kirnal_shift, kernal_counter ;
        wire [9:0] reg_counter,out_counter ;
        wire valid ;
    
   


    register  Reg_inst (

            .clk                   (clk), 
            .rst                   (rst), 
            .en                    (en), 
            .r_w                   (r_w),
            .in                    (in),
            .mul_shift             (mul_shift), 
            .accu_shift            (accu_shift),
            .kirnal_shift          (kirnal_shift), 
            .kernal_counter        (kernal_counter),
            .input_counter         (input_counter),
            .out_counter           (out_counter),
            .valid                 (valid)
        
        );


        always #5 clk = ~clk;

        initial begin
            $display("TEST CASE 1 ------------- KERNEL 3X3   INPUT 5X5 STRID 1 -------------");
            clk = 1;
            rst = 0;
            en  = 0;
            r_w = 0;
            #10
            rst = 1; 
            #10
            en  = 1;
            r_w = 1;
            in = 128'h00000000000000000000000000000265;
            #10 
            r_w =0;

            #10000
                        $display("TEST CASE 2 ------------- KERNEL 3X3   INPUT 5X5 STRID 2 -------------");
            r_w = 1;
            in = 128'h00000000000000000000000000000465;
            #10
            r_w = 0;
            #10000
                        $display("TEST CASE 3 ------------- KERNEL 3X3   INPUT 5X5 STRID 3 -------------");
            r_w = 1;
            in = 128'h00000000000000000000000000000665;
            #30
            r_w = 0;
            #10000
            $finish;
            



        end

    endmodule