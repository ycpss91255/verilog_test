// --------------------------------------------------------------------
// Copyright (c) 2009 by Terasic Technologies Inc.
// --------------------------------------------------------------------
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development
//   Kits made by Terasic.  Other use of this code, including the selling
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use
//   or functionality of this code.
//
// --------------------------------------------------------------------
//
//                     Terasic Technologies Inc
//                     356 Fu-Shin E. Rd Sec. 1. JhuBei City,
//                     HsinChu County, Taiwan
//                     302
//
//                     web: http://www.terasic.com/
//                     email: support@terasic.com
//
// --------------------------------------------------------------------
//
// Major Functions:	DE0 TOP
//
// --------------------------------------------------------------------
//
// Revision History :
// --------------------------------------------------------------------
//   Ver  :| Author            :| Mod. Date :| Changes Made:

// --------------------------------------------------------------------


module DE0_TOP
    (
        ////////////////////	Clock Input	 	////////////////////
        CLOCK_50,						//	50 MHz
        CLOCK_50_2,						//	50 MHz
        ////////////////////	Push Button		////////////////////
        ORG_BUTTON,						//	Pushbutton[2:0]
        ////////////////////	DPDT Switch		////////////////////
        SW,								//	Toggle Switch[9:0]
        ////////////////////	7-SEG Dispaly	////////////////////
        HEX0_D,							//	Seven Segment Digit 0
        HEX0_DP,						//	Seven Segment Digit DP 0
        HEX1_D,							//	Seven Segment Digit 1
        HEX1_DP,						//	Seven Segment Digit DP 1
        HEX2_D,							//	Seven Segment Digit 2
        HEX2_DP,						//	Seven Segment Digit DP 2
        HEX3_D,							//	Seven Segment Digit 3
        HEX3_DP,						//	Seven Segment Digit DP 3
        ////////////////////////	LED		////////////////////////
        LEDG,							//	LED Green[9:0]
        ////////////////////////	UART	////////////////////////
        UART_TXD,						//	UART Transmitter
        UART_RXD,						//	UART Receiver
        UART_CTS,						//	UART Clear To Send
        UART_RTS,						//	UART Request To Send
        /////////////////////	SDRAM Interface		////////////////
        DRAM_DQ,						//	SDRAM Data bus 16 Bits
        DRAM_ADDR,						//	SDRAM Address bus 13 Bits
        DRAM_LDQM,						//	SDRAM Low-byte Data Mask
        DRAM_UDQM,						//	SDRAM High-byte Data Mask
        DRAM_WE_N,						//	SDRAM Write Enable
        DRAM_CAS_N,						//	SDRAM Column Address Strobe
        DRAM_RAS_N,						//	SDRAM Row Address Strobe
        DRAM_CS_N,						//	SDRAM Chip Select
        DRAM_BA_0,						//	SDRAM Bank Address 0
        DRAM_BA_1,						//	SDRAM Bank Address 1
        DRAM_CLK,						//	SDRAM Clock
        DRAM_CKE,						//	SDRAM Clock Enable
        ////////////////////	Flash Interface		////////////////
        FL_DQ,							//	FLASH Data bus 15 Bits
        FL_DQ15_AM1,					//	FLASH Data bus Bit 15 or Address A-1
        FL_ADDR,						//	FLASH Address bus 22 Bits
        FL_WE_N,						//	FLASH Write Enable
        FL_RST_N,						//	FLASH Reset
        FL_OE_N,						//	FLASH Output Enable
        FL_CE_N,						//	FLASH Chip Enable
        FL_WP_N,						//	FLASH Hardware Write Protect
        FL_BYTE_N,						//	FLASH Selects 8/16-bit mode
        FL_RY,							//	FLASH Ready/Busy
        ////////////////////	LCD Module 16X2		////////////////
        LCD_BLON,						//	LCD Back Light ON/OFF
        LCD_RW,							//	LCD Read/Write Select, 0 = Write, 1 = Read
        LCD_EN,							//	LCD Enable
        LCD_RS,							//	LCD Command/Data Select, 0 = Command, 1 = Data
        LCD_DATA,						//	LCD Data bus 8 bits
        ////////////////////	SD_Card Interface	////////////////
        SD_DAT0,						//	SD Card Data 0
        SD_DAT3,						//	SD Card Data 3
        SD_CMD,							//	SD Card Command Signal
        SD_CLK,							//	SD Card Clock
        SD_WP_N,						//	SD Card Write Protect
        ////////////////////	PS2		////////////////////////////
        PS2_KBDAT,						//	PS2 Keyboard Data
        PS2_KBCLK,						//	PS2 Keyboard Clock
        PS2_MSDAT,						//	PS2 Mouse Data
        PS2_MSCLK,						//	PS2 Mouse Clock
        ////////////////////	VGA		////////////////////////////
        VGA_HS,							//	VGA H_SYNC
        VGA_VS,							//	VGA V_SYNC
        VGA_R,   						//	VGA Red[3:0]
        VGA_G,	 						//	VGA Green[3:0]
        VGA_B,  						//	VGA Blue[3:0]
        ////////////////////	GPIO	////////////////////////////
        GPIO0_CLKIN,					//	GPIO Connection 0 Clock In Bus
        GPIO0_CLKOUT,					//	GPIO Connection 0 Clock Out Bus
        GPIO0_D,						//	GPIO Connection 0 Data Bus
        GPIO1_CLKIN,					//	GPIO Connection 1 Clock In Bus
        GPIO1_CLKOUT,					//	GPIO Connection 1 Clock Out Bus
        GPIO1_D							//	GPIO Connection 1 Data Bus
    );

////////////////////////	Clock Input	 	////////////////////////
input			CLOCK_50;				//	50 MHz
input			CLOCK_50_2;				//	50 MHz
////////////////////////	Push Button		////////////////////////
input	[2:0]	ORG_BUTTON;				//	Pushbutton[2:0]
////////////////////////	DPDT Switch		////////////////////////
input	[9:0]	SW;						//	Toggle Switch[9:0]
////////////////////////	7-SEG Dispaly	////////////////////////
output	[6:0]	HEX0_D;					//	Seven Segment Digit 0
output			HEX0_DP;				//	Seven Segment Digit DP 0
output	[6:0]	HEX1_D;					//	Seven Segment Digit 1
output			HEX1_DP;				//	Seven Segment Digit DP 1
output	[6:0]	HEX2_D;					//	Seven Segment Digit 2
output			HEX2_DP;				//	Seven Segment Digit DP 2
output	[6:0]	HEX3_D;					//	Seven Segment Digit 3
output			HEX3_DP;				//	Seven Segment Digit DP 3
////////////////////////////	LED		////////////////////////////
output 	[9:0]	LEDG;					//	LED Green[9:0]
////////////////////////////	UART	////////////////////////////
output			UART_TXD;				//	UART Transmitter
input			UART_RXD;				//	UART Receiver
output			UART_CTS;				//	UART Clear To Send
input			UART_RTS;				//	UART Request To Send
///////////////////////		SDRAM Interface	////////////////////////
inout	[15:0]	DRAM_DQ;				//	SDRAM Data bus 16 Bits
output	[12:0]	DRAM_ADDR;				//	SDRAM Address bus 13 Bits
output			DRAM_LDQM;				//	SDRAM Low-byte Data Mask
output			DRAM_UDQM;				//	SDRAM High-byte Data Mask
output			DRAM_WE_N;				//	SDRAM Write Enable
output			DRAM_CAS_N;				//	SDRAM Column Address Strobe
output			DRAM_RAS_N;				//	SDRAM Row Address Strobe
output			DRAM_CS_N;				//	SDRAM Chip Select
output			DRAM_BA_0;				//	SDRAM Bank Address 0
output			DRAM_BA_1;				//	SDRAM Bank Address 1
output			DRAM_CLK;				//	SDRAM Clock
output			DRAM_CKE;				//	SDRAM Clock Enable
////////////////////////	Flash Interface	////////////////////////
inout	[14:0]	FL_DQ;					//	FLASH Data bus 15 Bits
inout			FL_DQ15_AM1;			//	FLASH Data bus Bit 15 or Address A-1
output	[21:0]	FL_ADDR;				//	FLASH Address bus 22 Bits
output			FL_WE_N;				//	FLASH Write Enable
output			FL_RST_N;				//	FLASH Reset
output			FL_OE_N;				//	FLASH Output Enable
output			FL_CE_N;				//	FLASH Chip Enable
output			FL_WP_N;				//	FLASH Hardware Write Protect
output			FL_BYTE_N;				//	FLASH Selects 8/16-bit mode
input			FL_RY;					//	FLASH Ready/Busy
////////////////////	LCD Module 16X2	////////////////////////////
inout	[7:0]	LCD_DATA;				//	LCD Data bus 8 bits
output			LCD_BLON;				//	LCD Back Light ON/OFF
output			LCD_RW;					//	LCD Read/Write Select, 0 = Write, 1 = Read
output			LCD_EN;					//	LCD Enable
output			LCD_RS;					//	LCD Command/Data Select, 0 = Command, 1 = Data
////////////////////	SD Card Interface	////////////////////////
inout			SD_DAT0;				//	SD Card Data 0
inout			SD_DAT3;				//	SD Card Data 3
inout			SD_CMD;					//	SD Card Command Signal
output			SD_CLK;					//	SD Card Clock
input			SD_WP_N;				//	SD Card Write Protect
////////////////////////	PS2		////////////////////////////////
inout		 	PS2_KBDAT;				//	PS2 Keyboard Data
inout			PS2_KBCLK;				//	PS2 Keyboard Clock
inout		 	PS2_MSDAT;				//	PS2 Mouse Data
inout			PS2_MSCLK;				//	PS2 Mouse Clock
////////////////////////	VGA			////////////////////////////
output			VGA_HS;					//	VGA H_SYNC
output			VGA_VS;					//	VGA V_SYNC
output	[3:0]	VGA_R;   				//	VGA Red[3:0]
output	[3:0]	VGA_G;	 				//	VGA Green[3:0]
output	[3:0]	VGA_B;   				//	VGA Blue[3:0]
////////////////////////	GPIO	////////////////////////////////
input	[1:0]	GPIO0_CLKIN;			//	GPIO Connection 0 Clock In Bus
output	[1:0]	GPIO0_CLKOUT;			//	GPIO Connection 0 Clock Out Bus
inout	[31:0]	GPIO0_D;				//	GPIO Connection 0 Data Bus
input	[1:0]	GPIO1_CLKIN;			//	GPIO Connection 1 Clock In Bus
output	[1:0]	GPIO1_CLKOUT;			//	GPIO Connection 1 Clock Out Bus
inout	[31:0]	GPIO1_D;				//	GPIO Connection 1 Data Bus

//=======================================================
//  REG/WIRE declarations
//=======================================================
wire  [2:0] BUTTON; // Button after debounce
wire wClk;
wire [3:0] wDispaly_num;
//=======================================================
//  Button Debounce Circit
//=======================================================

// This is BUTTON[0] Debounce Circuit //
button_debouncer	button_debouncer_inst0(
    .clk(CLOCK_50),
    .rst_n(1'b1),
    .data_in(ORG_BUTTON[0]),
    .data_out(BUTTON[0])
    );

// This is BUTTON[1] Debounce Circuit //
button_debouncer	button_debouncer_inst1(
    .clk(CLOCK_50),
    .rst_n(1'b1),
    .data_in(ORG_BUTTON[1]),
    .data_out(BUTTON[1])
    );

// This is BUTTON[2] Debounce Circuit //
button_debouncer	button_debouncer_inst2(
    .clk(CLOCK_50),
    .rst_n(1'b1),
    .data_in(ORG_BUTTON[2]),
    .data_out(BUTTON[2])
    );

//=======================================================
//  Structural coding
//=======================================================

/* Work 1 */
//eazy_led led(
//  .iSW(SW),
//  .oLED(LEDG)
//);

/* Work 2 */
//divisor #( .Threshold(12500000)
//  )
//  time_0P5s (
//  .iClk(CLOCK_50),
//  .iRst_n(BUTTON[0]),
//  .oClk(wClk)
//);
//
//LED led_controller (
//  .iClk(wClk),
//  .iRst_n(BUTTON[0]),
//  .iSW(SW[1:0]),
//  .oLED(LEDG[9:0])
//);

/* Work 3 */
//hex_count (
//  .iClk(wClk),
//  .iRst_n(BUTTON[0]),
//  .oNum(wDispaly_num)
//);
//
//hex_num (
//  .iSW (wDispaly_num),
//  .oHEX(HEX0_D),
//  .oHEX_DP(HEX0_DP)
//);
//
//assign LEDG[0] = wClk;


/* work 4 */
//divisor #( .Threshold(500000)
//  )
//  time_0P02s (
//  .iClk(CLOCK_50),
//  .iRst_n(BUTTON[0]),
//  .oClk(wClk)
//);
//
//LED_matrix matrix_5x5 (
//  .iClk(wClk),
//  .iRst_n(BUTTON[0]),
//  .iRow(SW[4:0]),
//  .iCol(SW[9:5]),
//);
//
//assign LEDG[0] = wClk;

/* midterm exam 01 */
//divisor #( .Threshold(12500000)
//  )
//  time_0P5s (
//  .iClk(CLOCK_50),
//  .iRst_n(BUTTON[0]),
//  .oClk(wClk)
//);
//
//assign LEDG[3] = wClk;

/* midterm exam 02 */
//hex_num (
//  .iSW(SW[3:0]),
//  .oHEX(HEX0_D),
//  .oHEX_DP(HEX0_DP)
//  );
  
/* midterm exam 03 */
//divisor #( .Threshold(12500000)
//  )
//  time_0P5s (
//  .iClk(CLOCK_50),
//  .iRst_n(BUTTON[0]),
//  .oClk(wClk)
//);
//
//LED_matrix matrix_5x5 (
//  .iClk(BUTTON[2]),
//  .iRst_n(BUTTON[0]),
//  .iRow(SW[4:0]),
//  .iCol(SW[9:5]),
//);

// ----
wire wClk_1hz;
wire wClk_2hz;
wire wClk_4hz;
wire [3:0] hex_num;

divisor #( .Threshold(25000000)
  )
  time_1Hz (
  .iClk(CLOCK_50),
  .iRst_n(BUTTON[0]),
  .oClk(wClk_1hz)
);

divisor #( .Threshold(12500000)
  )
  time_2Hz (
  .iClk(CLOCK_50),
  .iRst_n(BUTTON[0]),
  .oClk(wClk_2hz)
);

divisor #( .Threshold(6250000)
  )
  time_4Hz (
  .iClk(CLOCK_50),  
  .iRst_n(BUTTON[0]),
  .oClk(wClk_4hz)
);
assign LEDG[0] = wClk_1hz;
assign LEDG[1] = wClk_2hz;
assign LEDG[2] = wClk_4hz;

hex_count_RL hex_count_RL(
  .iClk({wClk_4hz, wClk_2hz, wClk_1hz}),
  .iSW(SW[2:0]),
  .iRst_n(BUTTON[0]),
  .oNum(hex_num)
);

assign LEDG[9:6] = hex_num;

hex_num dispaly_hex (
  .iSW(hex_num),
  .oHEX(HEX0_D),
  .oHEX_DP(HEX0_DP)
);

endmodule
