// 337 Lab 6 Testbench EOP Detect
// This code serves as a starer test bench for the synchronizer design

`timescale 1ns / 10ps

module tb_decode();

	// Define local parameters used by the test bench
	localparam	CLK_PERIOD	= 10.5;
	localparam	CHECK_DELAY = 1;

	// Declare DUT portmap signals
	reg tb_clk;
	reg tb_n_rst;
	reg tb_d_plus;
	reg tb_shift_enable;
	reg tb_eop;
	reg tb_d_orig;

	// Clock generation block
	always
	begin
		tb_clk = 1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD/2.0);
	end
	
	// DUT Port map
	decode DUT(.clk(tb_clk), .n_rst(tb_n_rst), .d_plus(tb_d_plus), .shift_enable(tb_shift_enable), .eop(tb_eop), .d_orig(tb_d_orig));
	
	// Test bench main process
	initial
	begin
		// initialize
		tb_d_plus = 0;
		tb_shift_enable = 0;
		tb_eop = 0;
		tb_n_rst = 1;
	
		// do asynch reset
		@(negedge tb_clk);
		tb_n_rst = 0;
		@(posedge tb_clk);
		tb_n_rst = 1;

		//capture matching 1-1
		@(posedge tb_clk);
		tb_d_plus = 1;
		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_shift_enable = 1;
		@(posedge tb_clk);
		tb_shift_enable = 0;

		//capture not matching 0-1
		@(posedge tb_clk);
		tb_d_plus = 0;

		//capture matching 0-0
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_shift_enable = 1;
		@(posedge tb_clk);
		tb_shift_enable = 0;

		// capture not matching 1-0
		@(posedge tb_clk);
		tb_d_plus = 0;


		// with eop at every shift enable
		//capture matching 1-1
		@(posedge tb_clk);
		tb_d_plus = 1;
		@(posedge tb_clk);
		tb_shift_enable = 1;
		tb_eop = 1;
		@(posedge tb_clk);
		tb_shift_enable = 0;
		tb_eop = 0;

		//capture not matching 0-1
		@(posedge tb_clk);
		tb_d_plus = 0;

		//capture matching 0-0
		@(posedge tb_clk);
		tb_shift_enable = 1;
		tb_eop = 1;
		@(posedge tb_clk);
		tb_shift_enable = 0;
		tb_eop = 0;

		// capture not matching 1-0
		@(posedge tb_clk);
		tb_d_plus = 0;



	end
endmodule
