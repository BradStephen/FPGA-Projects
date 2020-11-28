//--------------------------------------------------------------------------------
// Engineer: Brad Stephen
// Module Name: LED
// Project Name: servo_project_verilog
//
// Additional Comments:
//--------------------------------------------------------------------------------
module LED(
    input i_Clk,
    input [3:0] i_LED_Value,
    output reg [0:15] o_LED        
    );
    
    always @(posedge i_Clk)
    begin
        
        o_LED <= 0;
        o_LED[i_LED_Value] <= 1;
        
    end
endmodule