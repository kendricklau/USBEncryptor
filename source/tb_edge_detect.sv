// 337 Lab 6 Testbench EOP Detect
// This code serves as a starer test bench for the synchronizer design

`timescale 1ns / 10ps

module tb_edge_detect();

	// Define local parameters used by the test bench
	localparam	CLK_PERIOD	= 10.5;
	localparam	CHECK_DELAY = 1;

	// Declare DUT portmap signals
	reg tb_clk;
	reg tb_n_rst;
	reg tb_d_plus;
	reg tb_d_minus;
	reg tb_d_edge;

	// Clock generation block
	always
	begin
		tb_clk = 1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD/2.0);
	end
	
	// DUT Port map
	edge_detect DUT(.clk(tb_clk), .n_rst(tb_n_rst), .d_plus(tb_d_plus), .d_minus(tb_d_minus), .d_edge(tb_d_edge));
	
	// Test bench main process
	initial
	begin
		tb_d_plus = 0;
		tb_n_rst = 1;
		@(negedge tb_clk);
		tb_n_rst = 0;
		@(negedge tb_clk);
		tb_n_rst = 1;
		tb_d_plus = 1;
		@(posedge tb_clk);
		tb_d_plus = 1;
		@(posedge tb_clk);
		tb_d_plus = 0;
		@(posedge tb_clk);
		tb_d_plus = 0;
		@(posedge tb_clk);
		tb_d_plus = 1;
		@(posedge tb_clk);
		tb_d_plus = 0;
		@(posedge tb_clk);

	end
endmodule
