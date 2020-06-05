// Copyright (C) 2019  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 19.1.0 Build 670 09/22/2019 SJ Lite Edition"
// CREATED		"Fri Jun 05 01:54:15 2020"

module VGA_SYNC_Block(
	Clock_25MHz,
	reset_n,
	HSYNC,
	VSYNC,
	V_Display,
	H_Display,
	Display_Col,
	Display_Row
);


input wire	Clock_25MHz;
input wire	reset_n;
output wire	HSYNC;
output wire	VSYNC;
output wire	V_Display;
output wire	H_Display;
output wire	[9:0] Display_Col;
output wire	[9:0] Display_Row;

wire	[9:0] H_Counts;
wire	HSYNC_ALTERA_SYNTHESIZED;
wire	[9:0] V_Counts;
wire	VSYNC_ALTERA_SYNTHESIZED;





HSYNC	b2v_inst(
	.clock(Clock_25MHz),
	.reset(reset_n),
	.out_clock(HSYNC_ALTERA_SYNTHESIZED),
	.totalCounts(H_Counts));


VSYNC	b2v_inst13(
	.clock(HSYNC_ALTERA_SYNTHESIZED),
	.reset(reset_n),
	.out_clock(VSYNC_ALTERA_SYNTHESIZED),
	.totalCounts(V_Counts));


H_Display	b2v_inst5(
	.HSYNC(HSYNC_ALTERA_SYNTHESIZED),
	.H_Counts(H_Counts),
	.display(H_Display),
	.Display_Col(Display_Col));


V_Display	b2v_inst6(
	.VSYNC(VSYNC_ALTERA_SYNTHESIZED),
	.V_Counts(V_Counts),
	.display(V_Display),
	.Display_Row(Display_Row));

assign	HSYNC = HSYNC_ALTERA_SYNTHESIZED;
assign	VSYNC = VSYNC_ALTERA_SYNTHESIZED;

endmodule
