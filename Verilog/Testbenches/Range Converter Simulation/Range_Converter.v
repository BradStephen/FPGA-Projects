//--------------------------------------------------------------------------------
// Engineer: Brad Stephen
// Module Name: Range_Converter
// Project Name: Range_Converter_verilog
//
// Additional Comments: Use with Divider module
//--------------------------------------------------------------------------------
module Range_Converter
    #(parameter g_Old_Max = 100,
    parameter g_Old_Min = 10,
    parameter g_New_Max = 15,
    parameter g_New_Min = 0)
    (input i_Clk,
    input [7:0] i_Old_Value,
    input  [11:0] i_From_Divider,
    output [11:0] o_To_Divider,
    output [3:0] o_New_Value);
    
    parameter c_Old_Range = (g_Old_Max - g_Old_Min);
    parameter c_New_Range = (g_New_Max - g_New_Min);
    
    reg [11:0] reg1 = 0;
    reg [11:0] reg2 = 0;
    reg [11:0] reg3 = 0;
    
    always @(posedge i_Clk)
    begin
        
        reg1 <= i_Old_Value - g_Old_Min;
        reg2 <= reg1 * c_New_Range;
        // Goes to divider module         
        // reg2 is divided by c_Old_Range 
        // Comes back from divder module  
        reg3 <= i_From_Divider + g_New_Min;
        
    end
    
    assign o_To_Divider = reg2;
    assign o_New_Value = reg3;
    
endmodule