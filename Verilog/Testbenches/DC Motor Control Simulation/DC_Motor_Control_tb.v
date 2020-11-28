//--------------------------------------------------------------------------------
// Engineer: Brad Stephen
// Module Name: DC_Motor_Control_tb
// Project Name: DC_Motor_Control_verilog
//
// Additional Comments: Testbench for DC_Motor_Control Module
// Run simulation for 100ms
// Counterclockwise signal should have PWM signal with 50% duty cycle
//--------------------------------------------------------------------------------
`timescale 1ns / 1ps
module DC_Motor_Control_tb();
    
    // 1/100,000,000 = 10ns
    parameter c_Clk_Period = 10;
    parameter c_Multiply_By = 33003;
    
    reg r_Clk = 0;
    reg [23:0] r_Control_Range = 0;
    wire w_Clockwise;
    wire w_Counterclockwise;
    
    // create system clock
    always
    #(c_Clk_Period/2) r_Clk <= !r_Clk;
    
    always @(posedge r_Clk)
    begin
        
        // input stimulus
        r_Control_Range <= 33003;
        #100;
        
        r_Control_Range <= c_Multiply_By * 50;
        #1000;
        
    end
    
    DC_Motor_Control DC_Motor_Control_Inst
    (
    .i_Clk(r_Clk),
    .i_Control_Range(r_Control_Range),
    .o_Clockwise(w_Clockwise),
    .o_Counterclockwise(w_Counterclockwise)
    );
    
endmodule