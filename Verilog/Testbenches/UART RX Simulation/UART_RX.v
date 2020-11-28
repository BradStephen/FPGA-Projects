//--------------------------------------------------------------------------------
// Engineer: Brad Stephen
// Module Name: UART_RX
// Project Name: UART_RX_verilog
// Credit: UART_RX Module based on nandland.com framework
// Additional Comments: 
//--------------------------------------------------------------------------------
module UART_RX
    #(parameter g_System_Clk = 100_000_000,
    parameter g_Baud_Rate = 9600)
    (input        i_Clk,
    input        i_RX,
    output       o_RX_DV,
    output [7:0] o_RX_Byte);
    
    parameter c_Sampling_Limit = ((g_System_Clk/g_Baud_Rate) - 1);
    
    
    parameter s_Idle         = 2'b00;
    parameter s_Start        = 2'b01;
    parameter s_Read_Data    = 2'b10;
    parameter s_Stop         = 2'b11;
    
    reg [1:0]     r_State            = 2'b00;
    reg [15:0]    r_Sampling_Counter = 0;
    reg [2:0]     r_Byte_Index       = 0;
    reg [7:0]     r_RX_Byte          = 0;
    reg           r_RX_DV            = 0;
    
    reg           r_RX_Data         = 1'b1;
    reg           r_RX              = 1'b1;
    
    always @(posedge i_Clk)
    begin
        r_RX_Data <= i_RX;
        r_RX   <= r_RX_Data;
    end
    
    always @(posedge i_Clk)
    begin
        case (r_State)
            
            s_Idle :
            begin
                r_Byte_Index <= 0;
                r_Sampling_Counter   <= 0;
                r_RX_DV       <= 1'b0;
                
                if (r_RX == 1'b0)        
                r_State <= s_Start;
                else
                r_State <= s_Idle;
            end
            
            s_Start :
            begin
                if (r_Sampling_Counter < (c_Sampling_Limit/2)) 
                begin
                    r_Sampling_Counter <= r_Sampling_Counter + 1;
                    r_State            <= s_Start;
                end
                else if (r_Sampling_Counter == (c_Sampling_Limit/2)) 
                begin
                    if (r_RX == 1'b0)
                    begin
                        r_Sampling_Counter <= 0;
                        r_State            <= s_Read_Data;
                    end
                    else
                    r_State <= s_Idle;
                end
            end
            
            s_Read_Data :
            begin
                if (r_Sampling_Counter < c_Sampling_Limit) 
                begin
                    r_Sampling_Counter <= r_Sampling_Counter + 1;
                    r_State            <= s_Read_Data;
                end
                else if (r_Sampling_Counter == c_Sampling_Limit) 
                begin
                    r_Sampling_Counter      <= 0;
                    r_RX_Byte[r_Byte_Index] <= r_RX;
                    
                    if (r_Byte_Index < 7) 
                    begin
                        r_Byte_Index <= r_Byte_Index + 1;
                        r_State      <= s_Read_Data;
                    end
                    else
                    begin
                        r_Byte_Index <= 0;
                        r_State      <= s_Stop;
                    end
                end
            end
            
            s_Stop :
            begin
                if (r_Sampling_Counter < c_Sampling_Limit) 
                begin
                    r_Sampling_Counter <= r_Sampling_Counter + 1;
                    r_State            <= s_Stop;
                    r_RX_DV            <= 1'b1;
                end
                else
                r_State <= s_Idle;
            end 
            
            default :
            r_State <= s_Idle;
            
        endcase
    end
    
    assign o_RX_DV   = r_RX_DV;
    assign o_RX_Byte = r_RX_Byte;
    
endmodule