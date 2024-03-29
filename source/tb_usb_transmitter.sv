// 337 Lab 6 Testbench EOP Detect
// This code serves as a starer test bench for the synchronizer design

`timescale 1ns / 10ps

module tb_usb_transmitter();

	// Define local parameters used by the test bench
	localparam	CLK_PERIOD	= 10.5;
	localparam	CHECK_DELAY = 1;

	// Declare DUT portmap signals
	reg tb_clk; // input
	reg tb_n_rst; // input
	reg tb_d_plus; // output
	reg tb_d_minus; // output
	reg [63:0] tb_trans_data;
	reg tb_status;
	integer i;

	// Clock generation block
	always
	begin
		tb_clk = 1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD/2.0);
	end
	
	// DUT Port map
	usb_transmitter DUT(.clk(tb_clk), .n_rst(tb_n_rst), .status(tb_status), .trans_data(tb_trans_data), .d_plus(tb_d_plus), .d_minus(tb_d_minus));
	
	// Test bench main process
	initial
	begin
		// initialize
		tb_n_rst = 0;
		tb_trans_data = '0;
		tb_status = 0;
	
		// do asynch reset
		@(negedge tb_clk);
		tb_n_rst = 0;
		@(posedge tb_clk);
		tb_n_rst = 1;

		// Token Packet
		// advance to receive sync
		@(posedge tb_clk);
		tb_status = 1;

		//send sync byte
		tb_trans_data = 64'b1000100010001000100010001000100010001000100010001000100010001000;
		@(posedge tb_clk); // DATA0
	end
endmodule
