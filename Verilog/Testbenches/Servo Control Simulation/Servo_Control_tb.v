//--------------------------------------------------------------------------------
// Engineer: Brad Stephen
// Module Name: Servo_Control_tb
// Project Name: Servo_Control_verilog
//
// Additional Comments: Testbench for Servo_Control Module
// Run simulation for 10ms
// w_Servo signal should have PWM signal with 50% duty cycle
//--------------------------------------------------------------------------------
`timescale 1ns / 1ps
module Servo_Control_tb();
    
    // 1/100,000,000 = 10ns
    parameter c_Clk_Period = 10;
    parameter c_Multiply_By = 753;
    
    reg r_Clk = 0;
    reg [23:0] r_Control_Range = 0; 
    wire w_Servo;
    
    // create system clock
    always
    #(c_Clk_Period/2) r_Clk <= !r_Clk;
    
    always @(posedge r_Clk)
    begin
        
        // input stimulus
        r_Control_Range <= c_Multiply_By * 133;
        #1000;
        
    end
    
    Servo_Control Servo_Control_Inst
    (
    .i_Clk(r_Clk),
    .i_Control_Range(r_Control_Range),
    .o_Servo(w_Servo)
    );
    
endmodule