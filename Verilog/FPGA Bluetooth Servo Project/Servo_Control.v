//--------------------------------------------------------------------------------
// Engineer: Brad Stephen
// Module Name: Servo_Control
// Project Name: servo_project_verilog 
//
// Additional Comments: 
//--------------------------------------------------------------------------------
module Servo_Control
    (
    input i_Clk, 
    input [23:0] i_Control_Range,
    output o_Servo
    );
    
    parameter c_PWM_Freq_Clks = 303_030;
    parameter c_Multiply_By = 753;
    parameter c_PWM_Start_Clks = 50_000;
    
    reg [23:0] r_Freq_Counter  = 0;
    reg r_PWM = 0;
    
    always @(posedge i_Clk)
    begin
        
        if (r_Freq_Counter < c_PWM_Freq_Clks - 1) 
        r_Freq_Counter <= r_Freq_Counter + 1;
        
        else if (r_Freq_Counter == c_PWM_Freq_Clks - 1) 
        r_Freq_Counter <= 0;
        
        ///////////////////////////
        
        if (r_Freq_Counter < (c_PWM_Start_Clks + i_Control_Range)) 
        r_PWM <= 1'b1;
        else
        r_PWM <= 1'b0;
        
    end
    
    assign o_Servo = r_PWM;
    
endmodule