//--------------------------------------------------------------------------------
// Engineer: Brad Stephen
// Module Name: Divider
// Project Name: Divider_verilog
//
// Additional Comments:
//--------------------------------------------------------------------------------
module Divider
    #(parameter g_Width = 11) //subract 1
    (input i_Clk,
    input [g_Width:0] i_Dividend,
    input [g_Width:0] i_Divisor,
    output [g_Width:0] o_Quotient);
    
    parameter [g_Width:0] c_Count_Limit = g_Width;
    parameter s_1            = 2'b00;
    parameter s_2            = 2'b01;
    
    reg [1:0] r_State    = 2'b00;
    reg [g_Width:0] r_Count = 1;
    reg [g_Width:0] r_Quotient = 0;
    reg [g_Width:0] r_Remainder = 0;
    
    always @(posedge i_Clk)
    begin
        
        case (r_State)
            s_1 :
            begin
                
                if (i_Divisor > i_Dividend[g_Width]) begin
                    r_Quotient[g_Width] <= 0;
                    r_Remainder <= (((i_Dividend[g_Width] - 0) << 1) + i_Dividend[g_Width-1]); 
                end 
                
                else begin
                    r_Quotient[g_Width] <= 1;
                    r_Remainder <= (((i_Dividend[g_Width] - i_Divisor) << 1) + i_Dividend[g_Width-1]); 
                end
                
                r_State <= s_2;
            end
            s_2 :
            begin   
                
                if (i_Divisor > r_Remainder) begin
                    r_Quotient[g_Width - r_Count] <= 0;
                    r_Remainder <= (((r_Remainder - 0) << 1) + i_Dividend[g_Width-1 - r_Count]); 
                end
                
                else begin
                    r_Quotient[g_Width - r_Count] <= 1;
                    r_Remainder <= (((r_Remainder - i_Divisor) << 1) + i_Dividend[g_Width-1 - r_Count]); 
                end
                
                if (r_Count < c_Count_Limit) begin
                    r_Count <= r_Count + 1;
                    r_State <= s_2; 
                end
                else begin
                    r_Count <= 1;
                    r_State <= s_1; 
                end
            end
        endcase
    end 
    
    assign o_Quotient = r_Quotient;
    
endmodule