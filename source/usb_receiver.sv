// $Id: $
// File name:   usb_receiver.sv
// Created:     2/21/2018
// Author:      Kendrick Lau
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Top-level USB Block

module usb_receiver
(
	input wire clk,
	input wire n_rst,
	input wire d_plus,
	input wire d_minus,
	input wire r_enable,
	output wire [7:0] r_data,
	output wire empty,
	output wire full,
	output wire rcving,
	output wire r_error
);

	reg d_plus_sync;
	reg d_minus_sync;
	reg eop;
	reg shift_enable;
	reg d_orig;
	reg d_edge;
	reg byte_received;
	reg [7:0] rcv_data;
	reg w_enable;

	sync_high sync_high1 (.clk(clk), .n_rst(n_rst), .async_in(d_plus), .sync_out(d_plus_sync));
	sync_low sync_low1 (.clk(clk), .n_rst(n_rst), .async_in(d_minus), .sync_out(d_minus_sync));

	eop_detect eop_detect1 (.d_plus(d_plus_sync), .d_minus(d_minus_sync), .eop(eop));
	
	decode decode1 (.clk(clk), .n_rst(n_rst), .d_plus(d_plus_sync), .shift_enable(shift_enable), .eop(eop), .d_orig(d_orig));

	edge_detect edge_detect1 (.clk(clk), .n_rst(n_rst), .d_plus(d_plus_sync), .d_edge(d_edge));

	timer timer1 (.clk(clk), .n_rst(n_rst), .d_edge(d_edge), .rcving(rcving), .shift_enable(shift_enable), .byte_received(byte_received));
		
	shift_register shift_register1 (.clk(clk), .n_rst(n_rst), .shift_enable(shift_enable), .d_orig(d_orig), .rcv_data(rcv_data));

	rcu rcu1 (.clk(clk), .n_rst(n_rst), .d_edge(d_edge), .eop(eop), .shift_enable(shift_enable), .rcv_data(rcv_data), .byte_received(byte_received), .rcving(rcving), .w_enable(w_enable), .r_error(r_error));

	rx_fifo rx_fifo1 (.clk(clk), .n_rst(n_rst), .r_enable(r_enable), .w_enable(w_enable), .w_data(rcv_data), .r_data(r_data), .empty(empty), .full(full));
	
endmodule

























	
