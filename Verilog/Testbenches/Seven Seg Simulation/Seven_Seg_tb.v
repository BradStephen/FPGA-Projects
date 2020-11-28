//--------------------------------------------------------------------------------
// Engineer: Brad Stephen
// Module Name: Seven_Seg_tb
// Project Name: Seven_Seg_verilog
//
// Additional Comments: Testbench for Seven_Seg Module
//--------------------------------------------------------------------------------
`timescale 1ns / 1ps
module Seven_Seg_tb();
    
    // 1/100,000,000 = 10ns
    parameter c_Clk_Period = 10;
    
    reg r_Clk = 0;
    reg [3:0] r_Digit_1 = 0;
    reg [3:0] r_Digit_2 = 0;
    reg [3:0] r_Digit_3 = 0;
    reg [3:0] r_Digit_4 = 0;
    wire [3:0] w_Anode;
    wire [7:0] w_Segment;
    
    // create system clock
    always
    #(c_Clk_Period/2) r_Clk <= !r_Clk;
    
    always @(posedge r_Clk)
    begin
        
        // input stimulus
        if (r_Digit_1 < 4'b1111)
        begin
            r_Digit_1 <= r_Digit_1 + 1;
            r_Digit_2 <= r_Digit_2 + 1;
            r_Digit_3 <= r_Digit_3 + 1;
            r_Digit_4 <= r_Digit_4 + 1;
        end
        else
        begin
            r_Digit_1 <= 0;
            r_Digit_2 <= 0;
            r_Digit_3 <= 0;
            r_Digit_4 <= 0;
        end
        
        #50000;
        
    end
    
    Seven_Seg Seven_Seg_Inst
    (
    .i_Clk(r_Clk),
    .i_Digit_1(r_Digit_1),
    .i_Digit_2(r_Digit_2),
    .i_Digit_3(r_Digit_3),
    .i_Digit_4(r_Digit_4),
    .o_Anode(w_Anode),
    .o_Segment(w_Segment)
    );
    
endmodule