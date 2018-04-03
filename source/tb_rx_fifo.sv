// 337 Lab 6 Testbench EOP Detect
// This code serves as a starer test bench for the synchronizer design

`timescale 1ns / 10ps

module tb_rx_fifo();

	// Define local parameters used by the test bench
	localparam	CLK_PERIOD	= 10.5;
	localparam	CHECK_DELAY = 1;

	// Declare DUT portmap signals
	reg tb_clk;
	reg tb_n_rst;
	reg tb_r_enable;
	reg tb_w_enable;
	reg [7:0] tb_w_data;
	reg [7:0] tb_r_data;
	reg tb_empty;
	reg tb_full;

	// Clock generation block
	always
	begin
		tb_clk = 1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD/2.0);
	end
	
	// DUT Port map
	rx_fifo DUT(.clk(tb_clk), .n_rst(tb_n_rst), .r_enable(tb_r_enable), .w_enable(tb_w_enable), .w_data(tb_w_data), .r_data(tb_r_data), .empty(tb_empty), .full(tb_full));
	
	// Test bench main process
	initial
	begin
		int i;
		// initialize
		tb_n_rst = 1;
		tb_r_enable = 0;
		tb_w_enable = 0;
		tb_w_data = 0;

		// do asynch reset
		@(negedge tb_clk);
		tb_n_rst = 0;
		@(posedge tb_clk);
		tb_n_rst = 1;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);

		//capture r_enable/w_enable
		@(posedge tb_clk);
		tb_w_enable = 1;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_w_enable = 0;
		tb_r_enable = 1;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(negedge tb_clk);
		tb_n_rst = 0;
		@(posedge tb_clk);
		tb_n_rst = 1;

		for(i = 0; i < 256; i=i+3)
		begin
			tb_w_data = i;
			@(posedge tb_clk);
			tb_w_enable = 1;
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			tb_w_enable = 0;
			tb_r_enable = 1;
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
		end
	end
endmodule
