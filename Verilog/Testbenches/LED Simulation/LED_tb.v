//--------------------------------------------------------------------------------
// Engineer: Brad Stephen
// Module Name: LED_tb
// Project Name: LED_verilog
//
// Additional Comments: Testbench for LED Module
//--------------------------------------------------------------------------------
`timescale 1ns / 1ps
module LED_tb ();
    
    // 1/100,000,000 = 10ns
    parameter c_Clk_Period = 10;
    
    reg r_Clk = 0;
    reg [3:0] r_LED_Value = 0;
    wire [15:0] w_LED; 
    
    // create system clock
    always
    #(c_Clk_Period/2) r_Clk <= !r_Clk;
    
    initial
    begin
        
        // input stimulus
        r_LED_Value <= 7;
        #20;
        
        // check
        if (w_LED == 16'h0080)
        $display("Test Passed");
        else
        $display("Test Failed");
        
        // stop simulation
        $finish();
        
    end
    
    LED LED_Inst
    (
    .i_Clk(r_Clk),
    .i_LED_Value(r_LED_Value),
    .o_LED(w_LED)
    );
    
endmodule
