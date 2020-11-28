//--------------------------------------------------------------------------------
// Engineer: Brad Stephen
// Module Name: Seven_Seg
// Project Name: Seven_Seg_verilog
//
// Additional Comments:
//--------------------------------------------------------------------------------
module Seven_Seg(
    input i_Clk,
    input [3:0] i_Digit_1,
    input [3:0] i_Digit_2,
    input [3:0] i_Digit_3,
    input [3:0] i_Digit_4,
    output reg [3:0] o_Anode,
    output reg [7:0] o_Segment
    );
    
    parameter c_Refresh_Limit = 5000;
    
    reg [15:0] r_Refresh_Counter = 0; 
    reg [1:0] r_Refresh = 0;
    reg [3:0] r_Digit = 0;
    
    always @(posedge i_Clk)
    begin
        
        case (r_Digit)
            
            4'b0000 : o_Segment <= 8'b11000000; // "0" 
            4'b0001 : o_Segment <= 8'b11111001; // "1"
            4'b0010 : o_Segment <= 8'b10100100; // "2"
            4'b0011 : o_Segment <= 8'b10110000; // "3"
            4'b0100 : o_Segment <= 8'b10011001; // "4"
            4'b0101 : o_Segment <= 8'b10010010; // "5"
            4'b0110 : o_Segment <= 8'b10000010; // "6"
            4'b0111 : o_Segment <= 8'b11111000; // "7"
            4'b1000 : o_Segment <= 8'b10000000; // "8" 
            4'b1001 : o_Segment <= 8'b10010000; // "9"
            
            4'b1010 : o_Segment <= 8'b10100000; // a
            4'b1011 : o_Segment <= 8'b10000011; // b
            4'b1100 : o_Segment <= 8'b11000110; // C
            4'b1101 : o_Segment <= 8'b10100001; // d
            4'b1110 : o_Segment <= 8'b10000110; // E
            4'b1111 : o_Segment <= 8'b10001110; // F
            
            default : o_Segment <= 8'b11000000;
            
        endcase
        
        if (r_Refresh_Counter < c_Refresh_Limit)
        r_Refresh_Counter <= r_Refresh_Counter + 1;
        
        else if (r_Refresh_Counter == c_Refresh_Limit)
        
        begin
            r_Refresh_Counter <= 0;
            
            case (r_Refresh)
                
                2'b00 :
                begin
                    o_Anode <= 4'b1110;
                    r_Digit <= i_Digit_1;
                end
                
                2'b01 :
                begin
                    o_Anode <= 4'b1101;
                    r_Digit <= i_Digit_2;
                end
                
                2'b10 :
                begin
                    o_Anode <= 4'b1011;
                    r_Digit <= i_Digit_3;
                end
                
                2'b11 :                
                begin
                    o_Anode <= 4'b0111;
                    r_Digit <= i_Digit_4;
                end
                
                default :
                o_Anode <= 4'b1111;
                
            endcase
            
            r_Refresh <= r_Refresh + 2'b01;
        end
    end
endmodule