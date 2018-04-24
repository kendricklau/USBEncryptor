// $Id: $
// File name:   tb_flex_stp_sr.sv
// Created:     9/2/2013
// Author:      foo
// Lab Section: 99
// Version:     1.0  Initial Design Entry
// Description: Flexible Serial to Parallel Shift register test bench

`timescale 1ns / 10ps

module tb_key_counter (); 
	// Define parameters
	// basic test bench parameters
	localparam	CLK_PERIOD	= 8.3;
	reg tb_clk;
	reg tb_n_rst;
	reg tb_count_enable;
	reg [1:0] tb_key_count;
	reg tb_rollover_flag;

	// Clock generation block
	always
	begin
		tb_clk = 1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD/2.0);
	end
	
		key_counter DUT
		(
			.clk(tb_clk),
			.n_rst(tb_n_rst),
			.count_enable(tb_count_enable),
			.key_count(tb_key_count),
			.key_rollover(tb_rollover_flag)
		);

	initial
	begin
		// Initialize all of the test inputs
		tb_n_rst		= 1'b1;		// Initialize to be inactive
		tb_count_enable		= 1'b0;		// Initialize to be inactive
		
		// Power-on Reset of the DUT
		// Assume we start at negative edge. Immediately assert reset at first negative edge
		// without using clocking block in order to avoid metastable value warnings
		@(negedge tb_clk);
		tb_n_rst	<= 1'b0; 	// Need to actually toggle this in order for it to actually run dependent always blocks
		
		// Wait for a while to see normal operation
		@(posedge tb_clk);
		tb_n_rst	<= 1'b1; 	
		@(posedge tb_clk);
		
		// Test 1: Check count enable
		tb_count_enable <= 1'b1;
		@(posedge tb_clk);
		tb_count_enable <= 1'b0;
		@(posedge tb_clk);
		@(posedge tb_clk);
		
		// Test 2: Check for clear
		tb_count_enable <= 1'b0;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);

		// Test 3: Check for rollover flag
		tb_count_enable <= 1'b1;
		@(posedge tb_clk);
		tb_count_enable <= 1'b0;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_n_rst	<= 1'b0; 	// Need to actually toggle this in order for it to actually run dependent always blocks
		
		// Wait for a while to see normal operation
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_n_rst	<= 1'b1; 	

		// Test 4: Check clear during count_enable
		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_count_enable <= 1'b1;
		@(posedge tb_clk);
		tb_count_enable <= 1'b0;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_count_enable <= 1'b1;
		@(posedge tb_clk);
		tb_count_enable <= 1'b0;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_count_enable <= 1'b1;
		@(posedge tb_clk);
		tb_count_enable <= 1'b0;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_count_enable <= 1'b1;
		@(posedge tb_clk);
		tb_count_enable <= 1'b0;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		
		
	end

endmodule
