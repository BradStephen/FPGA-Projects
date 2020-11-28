//--------------------------------------------------------------------------------
// Engineer: Brad Stephen
// Module Name: DC_Motor_Control
// Project Name: DC_Motor_Control_verilog
//
// Additional Comments: 
//--------------------------------------------------------------------------------
module DC_Motor_Control
    (
    input i_Clk, 
    input [23:0] i_Control_Range,
    output o_Clockwise,
    output o_Counterclockwise
    );
    
    parameter c_PWM_Freq_Clks = 3333333;
    parameter c_Multiply_By = 33003;
    parameter c_PWM_Start_Clks = 0;
    
    reg [23:0] r_Freq_Counter  = 0;
    reg [23:0] r_Control_Direction = 0;
    reg [23:0] r_Control_Range = 10 * c_Multiply_By;
    reg [3:0] r_Select = 0;
    reg r_PWM = 0;
    
    always @(posedge i_Clk)
    begin
        
        if (r_Freq_Counter < c_PWM_Freq_Clks - 1) 
        r_Freq_Counter <= r_Freq_Counter + 1;
        
        else if (r_Freq_Counter == c_PWM_Freq_Clks - 1) 
        r_Freq_Counter <= 0;
        ///////////////////////////
        
        if (i_Control_Range < 10 * c_Multiply_By) 
        r_Control_Direction <= i_Control_Range;
        else
        r_Control_Range <= i_Control_Range;
        ///////////////////////////
        
        if (r_Control_Direction == 0 * c_Multiply_By)  // 0 OFF
        r_Select <= 0;
        
        else if (r_Control_Direction == 1 * c_Multiply_By)  // 1 Clockwise
        r_Select <= 1;
        
        else if (r_Control_Direction == 2 * c_Multiply_By)  // 2 Counterclockwise
        r_Select <= 2;
        ///////////////////////////
        
        if (r_Freq_Counter < (c_PWM_Start_Clks + r_Control_Range)) 
        r_PWM <= 1'b1;
        else
        r_PWM <= 1'b0;
        
    end
    
    assign o_Clockwise = ( r_Select == 0 ) ?0 :
    ( r_Select == 1 ) ?0 :
    ( r_Select == 2 ) ?r_PWM : 0; 
    
    assign o_Counterclockwise = ( r_Select == 0 ) ?0 :
    ( r_Select == 1 ) ?r_PWM :
    ( r_Select == 2 ) ?0 : 0; 
    
endmodule