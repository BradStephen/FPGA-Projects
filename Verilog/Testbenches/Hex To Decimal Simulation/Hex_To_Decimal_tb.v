//--------------------------------------------------------------------------------
// Engineer: Brad Stephen
// Module Name: Hex_To_Decimal_tb
// Project Name: Hex_To_Decimal_verilog
//
// Additional Comments: Testbench for Hex_To_Decimal Module
//--------------------------------------------------------------------------------
`timescale 1ns / 1ps
module Hex_To_Decimal_tb();
    
    // 1/100,000,000 = 10ns
    parameter c_Clk_Period = 10;
    
    reg r_Clk = 0;
    reg [7:0] r_Input_Hex = 0;
    wire [11:0] w_Output_Dec;
    
    // create system clock
    always
    #(c_Clk_Period/2) r_Clk <= !r_Clk;
    
    initial
    begin
        
        // input stimulus
        r_Input_Hex <= 57;
        #20;
        
        // check
        if (w_Output_Dec == 87)
        $display("Test Passed");
        else
        $display("Test Failed");
        
        // stop simulation
        $finish();
        
    end
    
    Hex_To_Decimal Hex_To_Decimal_Inst
    (
    .i_Clk(r_Clk),
    .i_Input_Hex(r_Input_Hex),
    .o_Output_Dec(w_Output_Dec)
    );
    
endmodule

