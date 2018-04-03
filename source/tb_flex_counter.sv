// $Id: $
// File name:   tb_flex_stp_sr.sv
// Created:     9/2/2013
// Author:      foo
// Lab Section: 99
// Version:     1.0  Initial Design Entry
// Description: Flexible Serial to Parallel Shift register test bench

`timescale 1ns / 10ps

module tb_flex_counter 
#(
	parameter NUM_CNT_BITS = 4
);

	// Define parameters
	// basic test bench parameters
	localparam	CLK_PERIOD	= 2.5;
	localparam	CHECK_DELAY = 1; // Check 1ns after the rising edge to allow for propagation delay
	
	// Shared Test Variables
	reg tb_clk;

	// Clock generation block
	always
	begin
		tb_clk = 1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD/2.0);
	end

	tb_flex_counter_DUT #(.NUM_CNT_BITS(4), .NAME("default"))  counter_default(.tb_clk);
	tb_flex_counter_DUT #(.NUM_CNT_BITS(8), .NAME("config1")) stp_config1(.tb_clk);
endmodule

module tb_flex_counter_DUT
	#(parameter NUM_CNT_BITS = 4, NAME = "default")
	(input wire tb_clk);

	// Default Config Test Variables & constants
	
	integer tb_test_num;
	reg tb_n_rst;
	reg tb_clear;
	reg tb_count_enable;
	reg [NUM_CNT_BITS-1:0] tb_rollover_val;
	reg [NUM_CNT_BITS-1:0] tb_count_out;
	reg tb_rollover_flag;
	
	generate
	if(NAME == "default")
	begin
		flex_counter DUT
		(
			.clk(tb_clk),
			.n_rst(tb_n_rst),
			.clear(tb_clear),
			.count_enable(tb_count_enable),
			.rollover_val(tb_rollover_val),
			.count_out(tb_count_out),
			.rollover_flag(tb_rollover_flag)
		);
	end 
	//else if(NAME == "config1")
	//begin
	//	flex_8_counter DUT
	//	(
	//		.clk(tb_clk),
	//		.n_rst(tb_n_rst),
	//		.clear(tb_clear),
	//		.count_enable(tb_count_enable),
	//		.rollover_val(tb_rollover_val),
	//		.count_out(tb_count_out),
	//		.rollover_flag(tb_rollover_flag)
	//	);
	//end
	endgenerate
	clocking cb @(posedge tb_clk);
 		// 1step means 1 time precision unit, 10ps for this module. We assume the hold time is less than 200ps.
		default input #1step output #100ps; // Setup time (01CLK -> 10D) is 94 ps
		output #800ps n_rst = tb_n_rst;
		output #800ps clear = tb_clear;
		output count_enable = tb_count_enable;
		output rollover_val = tb_rollover_val;
		input count_out = tb_count_out;
		input rollover_flag = tb_rollover_flag;
	endclocking
	
	// Default Configuration Test bench main process
	initial
	begin
		// Initialize all of the test inputs
		tb_n_rst		= 1'b1;		// Initialize to be inactive
		tb_clear		= 1'b0;		// Initialize to be idle
		tb_count_enable		= 1'b0;		// Initialize to be inactive
		tb_rollover_val 	= 4;
		
		// Power-on Reset of the DUT
		// Assume we start at negative edge. Immediately assert reset at first negative edge
		// without using clocking block in order to avoid metastable value warnings
		@(negedge tb_clk);
		tb_n_rst	<= 1'b0; 	// Need to actually toggle this in order for it to actually run dependent always blocks
		@cb;
		cb.n_rst	<= 1'b1; 	// Deactivate the chip reset
		
		// Wait for a while to see normal operation
		@cb;
		@cb;
		
		// Test 1: Check count enable
		cb.count_enable <= 1'b1;
		@cb;
		@cb;
		@cb;
		
		// Test 2: Check for clear
		cb.count_enable <= 1'b0;
		@cb;
		@cb;
		cb.clear	<= 1'b1;
		@cb;
		@cb;
		cb.clear	<= 1'b0;
		@cb;
		@cb;

		// Test 3: Check for rollover flag
		cb.count_enable <= 1'b1;
		@cb;
		@cb;
		@cb;
		@cb;
		@cb;
		@cb;
		cb.count_enable <= 1'b0;

		// Test 4: Check clear during count_enable
		@cb;
		@cb;
		cb.count_enable <= 1'b1;
		@cb;
		@cb;
		@cb;
		@cb;
		cb.clear <= 1'b1;
		@cb;
		cb.clear <= 1'b0;
		@cb;
		@cb;
		@cb;
		@cb;
		cb.count_enable <= 1'b0;
		@cb;
		@cb;
		@cb;
		@cb;
		cb.n_rst <= 1'b0;
		@cb;
		cb.n_rst <= 1'b1;
		@cb;
		@cb;
		cb.count_enable <= 1'b1;
		@cb;
		@cb;
		@cb;
		@cb;
		cb.n_rst <= 1'b0;
		@cb;
		cb.n_rst <= 1'b1;
		@cb;
		@cb;
		@cb;
		@cb;
		cb.count_enable <= 1'b1;
		tb_rollover_val 	<= 33;
		
		
	end

	task automatic run_reset_DUT();
		cb.n_rst	<= 1'b0;

		@(cb);
		cb.n_rst	<= 1'b1;	// Deactivate the chip reset
	endtask
	
endmodule
