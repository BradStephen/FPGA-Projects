## Config setup
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

## Clock signal
set_property PACKAGE_PIN W5 [get_ports {i_Clk}]							
	set_property IOSTANDARD LVCMOS33 [get_ports {i_Clk}]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {i_Clk}]
 
## Switches
#set_property PACKAGE_PIN V17 [get_ports {i_Sw_0}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {i_Sw_0}]
#set_property PACKAGE_PIN V16 [get_ports {i_Sw_1}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {i_Sw_1}]
#set_property PACKAGE_PIN W16 [get_ports {i_Sw_2}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {i_Sw_2}]
#set_property PACKAGE_PIN W17 [get_ports {i_Sw_3}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {i_Sw_3}]
#set_property PACKAGE_PIN W15 [get_ports {i_Sw_4}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {i_Sw_4}]
#set_property PACKAGE_PIN V15 [get_ports {i_Sw_5}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {i_Sw_5}]
#set_property PACKAGE_PIN W14 [get_ports {i_Sw_6}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {i_Sw_6}]
#set_property PACKAGE_PIN W13 [get_ports {i_Sw_7}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {i_Sw_7}]
#set_property PACKAGE_PIN V2 [get_ports {i_Sw_8}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {i_Sw_8}]
#set_property PACKAGE_PIN T3 [get_ports {i_Sw_9}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {i_Sw_9}]
#set_property PACKAGE_PIN T2 [get_ports {i_Sw_10}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {i_Sw_10}]
#set_property PACKAGE_PIN R3 [get_ports {i_Sw_11}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {i_Sw_11}]
#set_property PACKAGE_PIN W2 [get_ports {i_Sw_12}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {i_Sw_12}]
#set_property PACKAGE_PIN U1 [get_ports {i_Sw_13}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {i_Sw_13}]
#set_property PACKAGE_PIN T1 [get_ports {i_Sw_14}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {i_Sw_14}]
#set_property PACKAGE_PIN R2 [get_ports {i_Sw_15}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {i_Sw_15}]
 

## LEDs
set_property PACKAGE_PIN U16 [get_ports {o_LED[15]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {o_LED[15]}]
set_property PACKAGE_PIN E19 [get_ports {o_LED[14]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {o_LED[14]}]
set_property PACKAGE_PIN U19 [get_ports {o_LED[13]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {o_LED[13]}]
set_property PACKAGE_PIN V19 [get_ports {o_LED[12]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {o_LED[12]}]
set_property PACKAGE_PIN W18 [get_ports {o_LED[11]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {o_LED[11]}]
set_property PACKAGE_PIN U15 [get_ports {o_LED[10]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {o_LED[10]}]
set_property PACKAGE_PIN U14 [get_ports {o_LED[9]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {o_LED[9]}]
set_property PACKAGE_PIN V14 [get_ports {o_LED[8]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {o_LED[8]}]
set_property PACKAGE_PIN V13 [get_ports {o_LED[7]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {o_LED[7]}]
set_property PACKAGE_PIN V3 [get_ports {o_LED[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {o_LED[6]}]
set_property PACKAGE_PIN W3 [get_ports {o_LED[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {o_LED[5]}]
set_property PACKAGE_PIN U3 [get_ports {o_LED[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {o_LED[4]}]
set_property PACKAGE_PIN P3 [get_ports {o_LED[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {o_LED[3]}]
set_property PACKAGE_PIN N3 [get_ports {o_LED[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {o_LED[2]}]
set_property PACKAGE_PIN P1 [get_ports {o_LED[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {o_LED[1]}]
set_property PACKAGE_PIN L1 [get_ports {o_LED[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {o_LED[0]}]
	
	
##7 segment display
set_property PACKAGE_PIN W7 [get_ports {o_Segment[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {o_Segment[0]}]
set_property PACKAGE_PIN W6 [get_ports {o_Segment[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {o_Segment[1]}]
set_property PACKAGE_PIN U8 [get_ports {o_Segment[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {o_Segment[2]}]
set_property PACKAGE_PIN V8 [get_ports {o_Segment[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {o_Segment[3]}]
set_property PACKAGE_PIN U5 [get_ports {o_Segment[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {o_Segment[4]}]
set_property PACKAGE_PIN V5 [get_ports {o_Segment[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {o_Segment[5]}]
set_property PACKAGE_PIN U7 [get_ports {o_Segment[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {o_Segment[6]}]

# decimal point is segment 7
set_property PACKAGE_PIN V7 [get_ports {o_Segment[7]}]							
	set_property IOSTANDARD LVCMOS33 [get_ports {o_Segment[7]}]

set_property PACKAGE_PIN U2 [get_ports {o_Anode[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {o_Anode[0]}]
set_property PACKAGE_PIN U4 [get_ports {o_Anode[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {o_Anode[1]}]
set_property PACKAGE_PIN V4 [get_ports {o_Anode[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {o_Anode[2]}]
set_property PACKAGE_PIN W4 [get_ports {o_Anode[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {o_Anode[3]}]


##Buttons
#set_property PACKAGE_PIN U18 [get_ports {i_Btn_C}]						
	#set_property IOSTANDARD LVCMOS33 [get_ports {i_Btn_C}]
#set_property PACKAGE_PIN T18 [get_ports {i_Btn_U}]						
	#set_property IOSTANDARD LVCMOS33 [get_ports {i_Btn_U}]
#set_property PACKAGE_PIN W19 [get_ports {i_Btn_L}]						
	#set_property IOSTANDARD LVCMOS33 [get_ports {i_Btn_L}]
#set_property PACKAGE_PIN T17 [get_ports {i_Btn_R}]						
	#set_property IOSTANDARD LVCMOS33 [get_ports {i_Btn_R}]
#set_property PACKAGE_PIN U17 [get_ports {i_Btn_D}]						
	#set_property IOSTANDARD LVCMOS33 [get_ports {i_Btn_D}]
 


##Pmod Header JA
##Sch name = JA1
#set_property PACKAGE_PIN J1 [get_ports {JA[0]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JA[0]}]
##Sch name = JA2
#set_property PACKAGE_PIN L2 [get_ports {JA[1]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JA[1]}]
##Sch name = JA3
#set_property PACKAGE_PIN J2 [get_ports {JA[2]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JA[2]}]
##Sch name = JA4
#set_property PACKAGE_PIN G2 [get_ports {JA[3]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JA[3]}]
##Sch name = JA7
#set_property PACKAGE_PIN H1 [get_ports {JA[4]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JA[4]}]
##Sch name = JA8
#set_property PACKAGE_PIN K2 [get_ports {JA[5]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JA[5]}]
##Sch name = JA9
#set_property PACKAGE_PIN H2 [get_ports {JA[6]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JA[6]}]
##Sch name = JA10
#set_property PACKAGE_PIN G3 [get_ports {JA[7]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JA[7]}]



##Pmod Header JB
##Sch name = JB1
#set_property PACKAGE_PIN A14 [get_ports {JB[0]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JB[0]}]
##Sch name = JB2
#set_property PACKAGE_PIN A16 [get_ports {JB[1]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JB[1]}]
##Sch name = JB3
#set_property PACKAGE_PIN B15 [get_ports {JB[2]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JB[2]}]
##Sch name = JB4
#set_property PACKAGE_PIN B16 [get_ports {JB[3]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JB[3]}]
##Sch name = JB7
#set_property PACKAGE_PIN A15 [get_ports {JB[4]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JB[4]}]
##Sch name = JB8
#set_property PACKAGE_PIN A17 [get_ports {JB[5]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JB[5]}]
##Sch name = JB9
#set_property PACKAGE_PIN C15 [get_ports {JB[6]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JB[6]}]
##Sch name = JB10 
#set_property PACKAGE_PIN C16 [get_ports {JB[7]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JB[7]}]
 


##Pmod Header JC
##Sch name = JC1
set_property PACKAGE_PIN K17 [get_ports {i_RX}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {i_RX}]
##Sch name = JC2
#set_property PACKAGE_PIN M18 [get_ports {o_Clockwise}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {o_Clockwise}]
##Sch name = JC3
#set_property PACKAGE_PIN N17 [get_ports {o_Counterclockwise}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {o_Counterclockwise}]
##Sch name = JC4
set_property PACKAGE_PIN P18 [get_ports {o_Servo}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {o_Servo}]
##Sch name = JC7
#set_property PACKAGE_PIN L17 [get_ports {JC[4]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JC[4]}]
##Sch name = JC8
#set_property PACKAGE_PIN M19 [get_ports {JC[5]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JC[5]}]
##Sch name = JC9
#set_property PACKAGE_PIN P17 [get_ports {JC[6]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JC[6]}]
##Sch name = JC10
#set_property PACKAGE_PIN R18 [get_ports {JC[7]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JC[7]}]


##Pmod Header JXADC
##Sch name = XA1_P
#set_property PACKAGE_PIN J3 [get_ports {vauxp6}]				
#	set_property IOSTANDARD LVCMOS33 [get_ports {vauxp6}]
##Sch name = XA2_P
#set_property PACKAGE_PIN L3 [get_ports {vauxp14}]				
#	set_property IOSTANDARD LVCMOS33 [get_ports {vauxp14}]
##Sch name = XA3_P
#set_property PACKAGE_PIN M2 [get_ports {vauxp7}]				
#	set_property IOSTANDARD LVCMOS33 [get_ports {vauxp7}]
##Sch name = XA4_P
#set_property PACKAGE_PIN N2 [get_ports {vauxp15}]				
#	set_property IOSTANDARD LVCMOS33 [get_ports {vauxp15}]
##Sch name = XA1_N
#set_property PACKAGE_PIN K3 [get_ports {vauxn6}]				
#	set_property IOSTANDARD LVCMOS33 [get_ports {vauxn6}]
##Sch name = XA2_N
#set_property PACKAGE_PIN M3 [get_ports {vauxn14}]				
#	set_property IOSTANDARD LVCMOS33 [get_ports {vauxn14}]
##Sch name = XA3_N
#set_property PACKAGE_PIN M1 [get_ports {vauxn7}]				
#	set_property IOSTANDARD LVCMOS33 [get_ports {vauxn7}]
##Sch name = XA4_N
#set_property PACKAGE_PIN N1 [get_ports {vauxn15}]				
#	set_property IOSTANDARD LVCMOS33 [get_ports {vauxn15}]



##VGA Connector
#set_property PACKAGE_PIN G19 [get_ports {o_VGA_Red_0}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {o_VGA_Red_0}]
#set_property PACKAGE_PIN H19 [get_ports {o_VGA_Red_1}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {o_VGA_Red_1}]
#set_property PACKAGE_PIN J19 [get_ports {o_VGA_Red_2}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {o_VGA_Red_2}]
#set_property PACKAGE_PIN N19 [get_ports {o_VGA_Red_3}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {o_VGA_Red_3}]
#set_property PACKAGE_PIN N18 [get_ports {o_VGA_Blu_0}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {o_VGA_Blu_0}]
#set_property PACKAGE_PIN L18 [get_ports {o_VGA_Blu_1}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {o_VGA_Blu_1}]
#set_property PACKAGE_PIN K18 [get_ports {o_VGA_Blu_2}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {o_VGA_Blu_2}]
#set_property PACKAGE_PIN J18 [get_ports {o_VGA_Blu_3}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {o_VGA_Blu_3}]
#set_property PACKAGE_PIN J17 [get_ports {o_VGA_Grn_0}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {o_VGA_Grn_0}]
#set_property PACKAGE_PIN H17 [get_ports {o_VGA_Grn_1}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {o_VGA_Grn_1}]
#set_property PACKAGE_PIN G17 [get_ports {o_VGA_Grn_2}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {o_VGA_Grn_2}]
#set_property PACKAGE_PIN D17 [get_ports {o_VGA_Grn_3}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {o_VGA_Grn_3}]
#set_property PACKAGE_PIN P19 [o_VGA_HSync]						
	#set_property IOSTANDARD LVCMOS33 [o_VGA_HSync]
#set_property PACKAGE_PIN R19 [o_VGA_VSync]						
	#set_property IOSTANDARD LVCMOS33 [o_VGA_VSync]


##USB-RS232 Interface
#set_property PACKAGE_PIN B18 [get_ports {i_UART_RX}]						
#	set_property IOSTANDARD LVCMOS33 [get_ports {i_UART_RX}]
#set_property PACKAGE_PIN A18 [get_ports {o_UART_TX}]						
	#set_property IOSTANDARD LVCMOS33 [get_ports {o_UART_TX}]


##USB HID (PS/2)
#set_property PACKAGE_PIN C17 [get_ports PS2Clk]						
	#set_property IOSTANDARD LVCMOS33 [get_ports PS2Clk]
	#set_property PULLUP true [get_ports PS2Clk]
#set_property PACKAGE_PIN B17 [get_ports PS2Data]					
	#set_property IOSTANDARD LVCMOS33 [get_ports PS2Data]	
	#set_property PULLUP true [get_ports PS2Data]


##Quad SPI Flash
##Note that CCLK_0 cannot be placed in 7 series devices. You can access it using the
##STARTUPE2 primitive.
#set_property PACKAGE_PIN D18 [get_ports {QspiDB[0]}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {QspiDB[0]}]
#set_property PACKAGE_PIN D19 [get_ports {QspiDB[1]}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {QspiDB[1]}]
#set_property PACKAGE_PIN G18 [get_ports {QspiDB[2]}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {QspiDB[2]}]
#set_property PACKAGE_PIN F18 [get_ports {QspiDB[3]}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {QspiDB[3]}]
#set_property PACKAGE_PIN K19 [get_ports QspiCSn]					
	#set_property IOSTANDARD LVCMOS33 [get_ports QspiCSn]