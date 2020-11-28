//--------------------------------------------------------------------------------
// Engineer: Brad Stephen
// Module Name: Top
// Project Name: dc_motor_project_verilog
//
// Additional Comments: 
//--------------------------------------------------------------------------------
module Top 
    (input i_RX,
    input i_Clk,
    output o_Clockwise,
    output o_Counterclockwise,
    output [3:0] o_Anode,
    output [7:0] o_Segment,
    output [15:0] o_LED);
    
    parameter c_PWM_Freq_Clks = 3333333;
    parameter c_Multiply_By = 33003;
    parameter c_PWM_Start_Clks = 0;
    
    reg [23:0] r_Control_Range1 = 0;
    reg [23:0] r_Control_Range2 = 0;
    reg [23:0] r_Control_Range3 = 0;
    
    reg [7:0] r_Input_Hex = 0;
    reg [7:0] r_Old_Value = 10;
    
    wire w_RX_DV;           
    wire [7:0] w_RX_Byte;  
    wire [11:0] w_Output_Dec;
    wire [3:0] w_New_Value;
    
    wire [11:0] w_Dividend;
    wire [11:0] w_Quotient;
    
    always @(posedge i_Clk)
    begin
        
        if (w_RX_DV == 1)
        begin 
            r_Control_Range1 <= w_RX_Byte;
            r_Control_Range2 <= c_Multiply_By * r_Control_Range1;
            r_Control_Range3 <= r_Control_Range2;
            
            if (w_RX_Byte > 9) 
            begin
                r_Old_Value <= w_RX_Byte;
                r_Input_Hex <= w_RX_Byte;
            end
        end   
    end
    
    DC_Motor_Control DC_Motor_Control_Inst
    (
    .i_Clk(i_Clk),
    .i_Control_Range(r_Control_Range3),
    .o_Clockwise(o_Clockwise),
    .o_Counterclockwise(o_Counterclockwise)
    );
    
    UART_RX UART_RX_Inst
    (
    .i_Clk(i_Clk),
    .i_RX(i_RX),
    .o_RX_DV(w_RX_DV),
    .o_RX_Byte(w_RX_Byte)
    );
    
    Seven_Seg Seven_Seg_Inst
    (
    .i_Clk(i_Clk),
    .i_Digit_1(w_Output_Dec [3:0]),
    .i_Digit_2(w_Output_Dec [7:4]),
    .i_Digit_3(w_Output_Dec [11:8]),
    .i_Digit_4(0),
    .o_Anode(o_Anode),
    .o_Segment(o_Segment)
    );
    
    Hex_To_Decimal Hex_To_Decimal_Inst
    (
    .i_Clk(i_Clk),
    .i_Input_Hex(r_Input_Hex),
    .o_Output_Dec(w_Output_Dec)
    );
    
    Range_Converter #(.g_Old_Max(100),
    .g_Old_Min(10),
    .g_New_Max(15),
    .g_New_Min(0)) Range_Converter_Inst
    (
    .i_Clk(i_Clk),
    .i_Old_Value(r_Old_Value),
    .i_From_Divider(w_Quotient),
    .o_To_Divider(w_Dividend),
    .o_New_Value(w_New_Value)
    );
    
    Divider #(.g_Width(11)) 
    Divider_Inst
    (
    .i_Clk(i_Clk),
    .i_Dividend(w_Dividend),
    .i_Divisor(90),
    .o_Quotient(w_Quotient)
    );
    
    LED LED_Inst
    (
    .i_Clk(i_Clk),
    .i_LED_Value(w_New_Value),
    .o_LED(o_LED)
    );
    
endmodule