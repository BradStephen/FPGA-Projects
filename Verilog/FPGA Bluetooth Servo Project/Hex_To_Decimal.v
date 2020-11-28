//--------------------------------------------------------------------------------
// Engineer: Brad Stephen
// Module Name: Hex_To_Decimal
// Project Name: servo_project_verilog
//
// Additional Comments:
//--------------------------------------------------------------------------------
module Hex_To_Decimal(
    input i_Clk,
    input [7:0] i_Input_Hex,
    output reg [11:0] o_Output_Dec
    );
    
    reg [11:0] r_Input_Hex_Resize = 0;
    
    always @(posedge i_Clk)
    begin
        
        r_Input_Hex_Resize <= i_Input_Hex;
        
        if (i_Input_Hex > 9 && i_Input_Hex < 20)
        o_Output_Dec <= r_Input_Hex_Resize + (6 * 1);
        
        else if (i_Input_Hex > 19 && i_Input_Hex < 30) 
        o_Output_Dec <= r_Input_Hex_Resize + (6 * 2);
        
        else if (i_Input_Hex > 29 && i_Input_Hex < 40) 
        o_Output_Dec <= r_Input_Hex_Resize + (6 * 3);
        
        else if (i_Input_Hex > 39 && i_Input_Hex < 50) 
        o_Output_Dec <= r_Input_Hex_Resize + (6 * 4);
        
        else if (i_Input_Hex > 49 && i_Input_Hex < 60) 
        o_Output_Dec <= r_Input_Hex_Resize + (6 * 5);
        
        else if (i_Input_Hex > 59 && i_Input_Hex < 70) 
        o_Output_Dec <= r_Input_Hex_Resize + (6 * 6);
        
        else if (i_Input_Hex > 69 && i_Input_Hex < 80) 
        o_Output_Dec <= r_Input_Hex_Resize + (6 * 7);
        
        else if (i_Input_Hex > 79 && i_Input_Hex < 90) 
        o_Output_Dec <= r_Input_Hex_Resize + (6 * 8);
        
        else if (i_Input_Hex > 89 && i_Input_Hex < 100) 
        o_Output_Dec <= r_Input_Hex_Resize + (6 * 9);
        
        else if (i_Input_Hex > 99 && i_Input_Hex < 110) 
        o_Output_Dec <= r_Input_Hex_Resize + (156);
        
        else if (i_Input_Hex > 109 && i_Input_Hex < 120) 
        o_Output_Dec <= r_Input_Hex_Resize + (156 + 6 * 1);
        
        else if (i_Input_Hex > 119 && i_Input_Hex < 130) 
        o_Output_Dec <= r_Input_Hex_Resize + (156 + 6 * 2);
        
        else if (i_Input_Hex > 129 && i_Input_Hex < 140) 
        o_Output_Dec <= r_Input_Hex_Resize + (156 + 6 * 3);
        
        else if (i_Input_Hex > 139 && i_Input_Hex < 150) 
        o_Output_Dec <= r_Input_Hex_Resize + (156 + 6 * 4);
        
        else if (i_Input_Hex > 149 && i_Input_Hex < 160) 
        o_Output_Dec <= r_Input_Hex_Resize + (156 + 6 * 5);
        
        else if (i_Input_Hex > 159 && i_Input_Hex < 170) 
        o_Output_Dec <= r_Input_Hex_Resize + (156 + 6 * 6);
        
        else if (i_Input_Hex > 169 && i_Input_Hex < 180) 
        o_Output_Dec <= r_Input_Hex_Resize + (156 + 6 * 7);
        
        else if (i_Input_Hex > 179 && i_Input_Hex < 190) 
        o_Output_Dec <= r_Input_Hex_Resize + (156 + 6 * 8);
        
        else if (i_Input_Hex > 189 && i_Input_Hex < 200) 
        o_Output_Dec <= r_Input_Hex_Resize + (156 + 6 * 9);
        
        else
        o_Output_Dec <= r_Input_Hex_Resize;
        
    end
endmodule