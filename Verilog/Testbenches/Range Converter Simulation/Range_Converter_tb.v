//--------------------------------------------------------------------------------
// Engineer: Brad Stephen
// Module Name: Range_Converter_tb
// Project Name: Range_Converter_verilog
//
// Additional Comments: Testbench for Range_Converter Module
//--------------------------------------------------------------------------------
`timescale 1ns / 1ps
module Range_Converter_tb();
    
    // 1/100,000,000 = 10ns
    parameter c_Clk_Period = 10;
    
    reg r_Clk = 0;
    reg [7:0] r_Old_Value = 0;
    wire [3:0] w_New_Value;
    
    wire [11:0] w_Dividend;
    wire [11:0] w_Quotient;
    
    // create system clock
    always
    #(c_Clk_Period/2) r_Clk <= !r_Clk;
    
    // input stimulus
    initial
    begin
        
        r_Old_Value <= 70;
        #1000;
        
        // check
        if (w_New_Value == 10)
        $display("Test Passed");
        else
        $display("Test Failed");
        
        // stop simulation
        $finish();
        
    end
    
    Range_Converter #(.g_Old_Max(100),
    .g_Old_Min(10),
    .g_New_Max(15),
    .g_New_Min(0)) Range_Converter_Inst
    (
    .i_Clk(r_Clk),
    .i_Old_Value(r_Old_Value),
    .i_From_Divider(w_Quotient),
    .o_To_Divider(w_Dividend),
    .o_New_Value(w_New_Value)
    );
    
    Divider #(.g_Width(11)) 
    Divider_Inst
    (
    .i_Clk(r_Clk),
    .i_Dividend(w_Dividend),
    .i_Divisor(90),
    .o_Quotient(w_Quotient)
    );
    
endmodule