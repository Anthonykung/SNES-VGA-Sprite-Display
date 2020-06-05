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
// CREATED		"Fri Jun 05 03:00:32 2020"

module VGA_Display(
	reset_n,
	A,
	B,
	X,
	Y,
	Select,
	Start,
	Up,
	Down,
	Left,
	Right,
	Clock_50MHz,
	h_sync,
	v_sync,
	blue_display,
	green_display,
	red_display
);


input wire	reset_n;
input wire	A;
input wire	B;
input wire	X;
input wire	Y;
input wire	Select;
input wire	Start;
input wire	Up;
input wire	Down;
input wire	Left;
input wire	Right;
input wire	Clock_50MHz;
output wire	h_sync;
output wire	v_sync;
output wire	[3:0] blue_display;
output wire	[3:0] green_display;
output wire	[3:0] red_display;

wire	[3:0] BLUE;
wire	Clock_25MHz;
wire	[9:0] Display_Col;
wire	[9:0] Display_Row;
wire	[3:0] GREEN;
wire	H_Display;
wire	HSYNC;
wire	[3:0] RED;
wire	[11:0] RGB;
wire	V_Display;
wire	VSYNC;
wire	[11:0] SYNTHESIZED_WIRE_0;
wire	[9:0] SYNTHESIZED_WIRE_1;
wire	[9:0] SYNTHESIZED_WIRE_2;
wire	[0:3] SYNTHESIZED_WIRE_3;
wire	[0:3] SYNTHESIZED_WIRE_4;
wire	[0:3] SYNTHESIZED_WIRE_5;

assign	SYNTHESIZED_WIRE_3 = 0;
assign	SYNTHESIZED_WIRE_4 = 0;
assign	SYNTHESIZED_WIRE_5 = 0;




VGA_SYNC_Block	b2v_inst(
	.Clock_25MHz(Clock_25MHz),
	.reset_n(reset_n),
	.HSYNC(HSYNC),
	.VSYNC(VSYNC),
	.H_Display(H_Display),
	.V_Display(V_Display),
	.Display_Col(Display_Col),
	.Display_Row(Display_Row));


x2_Clock_Divider	b2v_inst1(
	.clock(Clock_50MHz),
	.reset(reset_n),
	.out_clock(Clock_25MHz));


SNES_VGA_Movement_Decoder	b2v_inst10(
	.Up(Up),
	.Down(Down),
	.Left(Left),
	.Right(Right),
	.Col(Display_Col),
	.Row(Display_Row),
	.Col_out(SYNTHESIZED_WIRE_2),
	.Row_out(SYNTHESIZED_WIRE_1));
	defparam	b2v_inst10.hPx = 16;
	defparam	b2v_inst10.wPx = 16;


SNES_VGA_Button_Decoder	b2v_inst11(
	.Select(Select),
	.Start(Start),
	.A(A),
	.B(B),
	.X(X),
	.Y(Y),
	.BLUE(BLUE),
	.GREEN(GREEN),
	.RED(RED));


ROM1	b2v_inst2(
	.clock(Clock_50MHz),
	.address(SYNTHESIZED_WIRE_0)
	);


Memory_Processor	b2v_inst3(
	.Col(SYNTHESIZED_WIRE_1),
	.Row(SYNTHESIZED_WIRE_2),
	.Address(SYNTHESIZED_WIRE_0));
	defparam	b2v_inst3.N = 12;
	defparam	b2v_inst3.Size = 16;


RGB_Generator	b2v_inst4(
	.H_Display(H_Display),
	.V_Display(V_Display),
	.GND(SYNTHESIZED_WIRE_3),
	.RGB(RED),
	.out_RGB(red_display));



RGB_Generator	b2v_inst6(
	.H_Display(H_Display),
	.V_Display(V_Display),
	.GND(SYNTHESIZED_WIRE_4),
	.RGB(GREEN),
	.out_RGB(green_display));



RGB_Generator	b2v_inst8(
	.H_Display(H_Display),
	.V_Display(V_Display),
	.GND(SYNTHESIZED_WIRE_5),
	.RGB(BLUE),
	.out_RGB(blue_display));


assign	h_sync = HSYNC;
assign	v_sync = VSYNC;

endmodule
