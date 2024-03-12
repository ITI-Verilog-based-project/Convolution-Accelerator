module register (
    input clk, rst, en, r_w,
    input [127:0] in,
    output reg [4:0] mul_shift, accu_shift ,
    output reg [5:0] kirnal_shift, kernal_counter,
    output reg [9:0] input_counter,out_counter,
    output reg valid

);
reg [4:0] L, row_shift, column, row ;
reg [3:0] m, s ;
reg [7:0] eliment ;



    always @(posedge clk   ) begin
        if (! rst) begin
            L               <= 0;    //// row of input
            m               <= 0;    //// row of kirnal
            s               <= 0;    //// strride
            mul_shift       <= 0; 
            accu_shift      <= 0;
            kirnal_shift    <= 0;
            eliment         <= 0;
            column          <= 1;
            row             <= 1;
            row_shift       <= 0;
            kernal_counter  <= 0;
            valid          <= 0;
            input_counter   <= 0;
            out_counter     <= 0;

        end
        else begin
            if (en)begin
                if (r_w) begin
                    L               = in[4:0];    //// row of input
                    m               = in[8:5];    //// row of kirnal
                    s               = in[12:9];    //// strride
                    row_shift       = (L-m) + 1;
                    kernal_counter  = m * m;  
                    input_counter   = L * L;
                    out_counter     = ((L-m) + 1) * ((L-m) + 1);
                    if((L-m)%s == 0)
                        valid       = 1;
                     else   
                        valid       = 0;
                    mul_shift       = 0; 
                    accu_shift      = 0;
                    kirnal_shift    = 0;
                    eliment         = 0;
                    column          = 1;
                    row             = 1;

                end
                else begin
                    valid = 0;

                        eliment = eliment + 1; 
                        column  = column  + s;
                        row     = row     + s;
                        if (row <= row_shift || column  <= row_shift || eliment < kernal_counter) begin
                            row     = row     - s;
                            if (column  <= row_shift || eliment < kernal_counter) begin
                                column  = column  - s;
                                accu_shift  = (L * row ) - (L + 1 - column ) ;
                                
                                
                                
                                if (eliment < kernal_counter) begin
                                    if((eliment ) % m == 0)begin
                                        mul_shift <= mul_shift + row_shift  ; 
                                        
                                        kirnal_shift <= eliment   ;    
                                    end
                                    else begin 
                                        mul_shift <= mul_shift + 1; 
                                        
                                        kirnal_shift <= eliment  ;
                                    end
                                end
                                else begin
                                    eliment = 0;
                                    column  = column  + s;
                                    accu_shift  = (L * row ) - (L + 1 - column ) ;
                                    
                                    kirnal_shift = 0  ;
                                    mul_shift = 0  ;  
                                end
                            end
                            else begin
                                column  = 1;
                                row = row + s;
                                eliment = 0;
                                accu_shift  = (L * row ) - (L + 1 - column ) ;
                                
                                kirnal_shift = 0  ;
                                mul_shift = 0  ;                    
                            end
                        end
                        else begin
                            kirnal_shift = 0  ;
                            mul_shift = 0  ; 
                            accu_shift = 0 ;
                        end
                        
                    
                end
            end    
            else
                begin
                   
                    mul_shift  = mul_shift ; 
                    accu_shift = accu_shift;
                    kirnal_shift = kirnal_shift ;
            
                end 
                
            
            
        end
        
    end

endmodule

