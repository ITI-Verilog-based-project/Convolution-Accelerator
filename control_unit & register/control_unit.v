module controller (
    input           clk ,
    input           rst ,
    input           control,
    input           valid,
    input [5:0]     kernal_counter,
    input [9:0]     input_counter,
    input [9:0]     output_counter,
    output reg      en_in_mem,
    output reg      rw_in_mem,
    output reg      num_in_addr,
    output reg      en_kr_mem,
    output reg      rw_kr_mem,
    output reg      num_kr_addr,
    output reg      en_reg,
    output reg      rw_reg,
    output reg      en_out_mem,
    output reg      rw_out_mem,
    output reg      en_mult,
    output reg      en_accuml,
    output reg      rst_accuml,
    output reg      done


);

localparam IDLE           = 3'b000,
           Load_confg     = 3'b001,
           Load_input     = 3'b010,
           Load_kernal    = 3'b011,
           Convelution    = 3'b100,
           Load_output    = 3'b101,
           Read_output    = 3'b110;

reg        [2:0]Present_state;
reg        [2:0]Next_state;
reg signed [9:0]reg_input_counter;
reg        [9:0]reg_output_counter;
reg signed [7:0]reg_kernal_counter;
reg        [7:0]reg_conv_counter;
reg        [9:0]count;


always @(posedge clk or negedge rst) begin
    if(!rst) begin
        Present_state <= IDLE;
    end
    else begin
        Present_state <= Next_state;
    end

end
always @(posedge clk) begin
    if (Next_state == Load_input)begin
        reg_input_counter <= (reg_input_counter - 4); // 4 or 1 depend on adddress
    end
    else if(Next_state == Load_kernal)begin
        reg_kernal_counter = (reg_kernal_counter - 4); // 4 or 1 depend on adddress
        
    end
    else if (Next_state == Convelution)begin
        reg_conv_counter = (reg_conv_counter - 1);
    end
    else if (Next_state == Load_output)begin
        reg_conv_counter = kernal_counter;
        reg_output_counter = reg_output_counter - 1 ;
        count      = count + 1 ; 
    end
    else if (Next_state == Read_output)begin
        count      = count - 1 ; 
    end
    else begin
        reg_input_counter = reg_input_counter ;
        reg_kernal_counter = reg_kernal_counter;
        count = count;
    end

end
 


always @(*)begin
    case (Present_state)
        IDLE:
          
        if(!control)begin
              en_in_mem  <= 0;
              rw_in_mem  <= 0;
              num_in_addr<= 0;
              num_kr_addr<= 0;
              en_kr_mem  <= 0;
              rw_kr_mem  <= 0;
              en_reg     <= 0;
              rw_reg     <= 0;
              en_out_mem <= 0;
              rw_out_mem <= 0;
              en_mult    <= 0;
              en_accuml  <= 0;
              rst_accuml <= 0;
              count      <= 0;
              done       <= 0;
              Next_state <= IDLE;
        end
        else begin
            done       <= 0;
            Next_state <= Load_confg;  
        end

        Load_confg:
        if (!valid)begin
        en_in_mem  <= 0;
        rw_in_mem  <= 0;
        num_in_addr<= 0;
        num_kr_addr<= 0;
        en_kr_mem  <= 0;
        rw_kr_mem  <= 0;
        en_reg     <= 1;
        rw_reg     <= 1;
        en_out_mem <= 0;
        rw_out_mem <= 0;
        en_mult    <= 0;
        en_accuml  <= 0;
        rst_accuml <= 0;
        done       <= 0;
        Next_state <= Load_confg;
        end
        else begin
            Next_state          <= Load_input;
            reg_input_counter   <=input_counter;
            reg_output_counter  <=output_counter;
            reg_kernal_counter  <=kernal_counter;
            reg_conv_counter    <=kernal_counter;
        end
        Load_input:
        if (reg_input_counter >= 0 )begin
            en_in_mem  <= 1;
            rw_in_mem  <= 1;
            num_in_addr<= 1;
            num_kr_addr<= 0;
            en_kr_mem  <= 0;
            rw_kr_mem  <= 0;
            en_reg     <= 0;
            rw_reg     <= 0;
            en_out_mem <= 0;
            rw_out_mem <= 0;
            en_mult    <= 0;
            en_accuml  <= 0;
            rst_accuml <= 0;
            done       <= 0;
            Next_state <= Load_input;

        end
        else if (reg_input_counter == -3)begin
            en_in_mem  <= 1;
            rw_in_mem  <= 1;
            num_in_addr<= 0;
            num_kr_addr<= 0;
            en_kr_mem  <= 0;
            rw_kr_mem  <= 0;
            en_reg     <= 0;
            rw_reg     <= 0;
            en_out_mem <= 0;
            rw_out_mem <= 0;
            en_mult    <= 0;
            en_accuml  <= 0;
            rst_accuml <= 0;
            done       <= 0;
            Next_state <= Load_kernal;
        end
        else begin
            
            Next_state <= Load_kernal; 
        end
        Load_kernal:
        if (reg_kernal_counter >= 0)begin
            en_in_mem  <= 0;
            rw_in_mem  <= 0;
            num_in_addr<= 0;
            en_kr_mem  <= 1;
            rw_kr_mem  <= 1;
            num_kr_addr<= 1;
            en_reg     <= 0;
            rw_reg     <= 0;
            en_out_mem <= 0;
            rw_out_mem <= 0;
            en_mult    <= 0;
            en_accuml  <= 0;
            rst_accuml <= 0;
            done       <= 0;
            Next_state <= Load_kernal;
            
    
            end
            else if (reg_kernal_counter == -3)begin
                en_in_mem  <= 0;
                rw_in_mem  <= 0;
                num_in_addr<= 0;
                en_kr_mem  <= 1;
                rw_kr_mem  <= 1;
                num_kr_addr<= 0;
                en_reg     <= 0;
                rw_reg     <= 0;
                en_out_mem <= 0;
                rw_out_mem <= 0;
                en_mult    <= 0;
                en_accuml  <= 0;
                rst_accuml <= 0;
                done       <= 0;
                Next_state <= Convelution;
    
                end
            else begin              
            Next_state          <= Convelution; 
            end
        Convelution:
        if (reg_conv_counter && reg_output_counter) begin
            en_in_mem  <= 1;
            rw_in_mem  <= 0;
            num_in_addr<= 0;
            num_kr_addr<= 0;
            en_kr_mem  <= 1;
            rw_kr_mem  <= 0;
            en_reg     <= 1;
            rw_reg     <= 0;
            en_out_mem <= 0;
            rw_out_mem <= 0;
            en_mult    <= 1;
            en_accuml  <= 1;
            rst_accuml <= 0;
            done       <= 0;
            Next_state <= Convelution;

        end
        
        else begin
            Next_state          <= Load_output ;
        end
        Load_output: 
        if (reg_output_counter  ) begin
            en_in_mem  <= 0;
            rw_in_mem  <= 0;
            num_in_addr<= 0;
            num_kr_addr<= 0;
            en_kr_mem  <= 0;
            rw_kr_mem  <= 0;
            en_reg     <= 0;
            rw_reg     <= 0;
            en_out_mem <= 1;
            rw_out_mem <= 1;
            en_mult    <= 0;
            en_accuml  <= 1;
            rst_accuml <= 1; 
            done       <= 0;
            Next_state <= Convelution;     
                 
            
        end
        else begin
            en_in_mem  <= 0;
            rw_in_mem  <= 0;
            num_in_addr<= 0;
            num_kr_addr<= 0;
            en_kr_mem  <= 0;
            rw_kr_mem  <= 0;
            en_reg     <= 0;
            rw_reg     <= 0;
            en_out_mem <= 1;
            rw_out_mem <= 1;
            en_mult    <= 0;
            en_accuml  <= 1;
            rst_accuml <= 1; 
            
            Next_state <= Read_output;

        end
        Read_output:
        if (count) begin            /// state from output memory
            en_in_mem  <= 0;
            rw_in_mem  <= 0;
            num_in_addr<= 0;
            num_kr_addr<= 0;
            en_kr_mem  <= 0;
            rw_kr_mem  <= 0;
            en_reg     <= 0;
            rw_reg     <= 0;
            en_out_mem  = 1;
            rw_out_mem  = 0;
            en_mult    <= 0;
            en_accuml  <= 0;
            rst_accuml <= 0; 
            done       <= 0;
            Next_state <= Read_output;
            ////////
            
        end 
        else begin
            done <= 1;
            Next_state <= IDLE ;
        end 
        
    endcase







end

    
endmodule