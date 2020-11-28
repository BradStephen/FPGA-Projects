//--------------------------------------------------------------------------------
// Engineer: Brad Stephen
// Module Name: UART_RX_tb
// Project Name: UART_RX_verilog
//
// Additional Comments: Testbench for UART_RX Module
//--------------------------------------------------------------------------------
`timescale 1ns / 1ps
module UART_RX_tb();
    
    // 1/100,000,000 = 10ns
    // 1/9600 = 104167ns
    parameter c_Clk_Period = 10;
    parameter c_Baud_Period = 104167;
    
    parameter  c_RX_Test = 8'hAA;
    
    reg r_Clk = 1;
    reg r_RX = 0;
    wire w_RX_DV;
    wire [7:0] w_RX_Byte;
    integer i;
    
    // create system clock
    always
    begin
        #(c_Clk_Period/2) r_Clk <= !r_Clk;
    end
    
    initial
    begin
        
        // Send Start Bit
        r_RX <= 1'b0;
        #(c_Baud_Period);
        
        // Send Data Byte
        for (i=0; i<8; i=i+1) 
        begin
            r_RX <= c_RX_Test[i];
            #(c_Baud_Period);
        end
        
        // Send Stop Bit
        r_RX <= 1'b1;
        #(c_Baud_Period);
        
        // check
        if (w_RX_Byte == 8'hAA)
        begin
            $display("-------------");
            $display("Test Passed");
            $display("-------------");
        end
        else
        begin
            $display("-------------");
            $display("Test Failed");
            $display("-------------");
        end
        
        //stop simulation
        $finish();
    end
    
    UART_RX #(.g_System_Clk(100_000_000),
    .g_Baud_Rate(9600))UART_RX_Inst
    (
    .i_Clk(r_Clk),
    .i_RX(r_RX),
    .o_RX_DV(w_RX_DV),
    .o_RX_Byte(w_RX_Byte)
    );
    
endmodule