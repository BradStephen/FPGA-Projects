//--------------------------------------------------------------------------------
// Engineer: Brad Stephen
// Module Name: Divider_tb
// Project Name: Divider_verilog
//
// Additional Comments: Testbench for Divider Module
//--------------------------------------------------------------------------------
`timescale 1ns / 1ps
module Divider_tb();
    
    // 1/100,000,000 = 10ns
    parameter c_Clk_Period = 10;
    
    reg r_Clk = 0;
    reg [11:0] r_Dividend = 0;
    reg [11:0] r_Divisor = 0;
    wire [11:0] w_Quotient;
    
    // create system clock
    always
    #(c_Clk_Period/2) r_Clk <= !r_Clk;
    
    initial
    begin
        
        // input stimulus
        r_Dividend <= 1350;
        r_Divisor <= 90;
        #150;
        
        // check
        if (w_Quotient == 4'b1111)
        $display("Test Passed");
        else
        $display("Test Failed");
        
        // stop simulation
        $finish();
        
    end
    
    Divider Divider_Inst
    (
    .i_Clk(r_Clk),
    .i_Dividend(r_Dividend),
    .i_Divisor(r_Divisor),
    .o_Quotient(w_Quotient)
    );
    
endmodule