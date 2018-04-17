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
	output wire [7:0] rcv_sync,
	output wire [7:0] rcv_pid,
	output wire [4:0] rcv_crc5,
	output wire [15:0] rcv_crc16,
	output wire [63:0] rcv_data
);
	reg d_plus_sync;
	reg d_minus_sync;
	reg eop;
	reg d_orig;
	reg d_edge;
	reg w_enable;
	reg sync_shift_enable;
	reg pid_shift_enable;
	reg crc5_shift_enable;
	reg crc16_shift_enable;
	reg data_shift_enable;
	reg sync_bits_received;
	reg pid_bits_received;
	reg crc5_bits_received;
	reg crc16_bits_received;
	reg data_bits_received;
	reg sync_rcving;
	reg pid_rcving;
	reg crc5_rcving;
	reg crc16_rcving;
	reg data_rcving;
	reg r_error;

	sync_high sync_high1 (.clk(clk), .n_rst(n_rst), .async_in(d_plus), .sync_out(d_plus_sync));
	sync_low sync_low1 (.clk(clk), .n_rst(n_rst), .async_in(d_minus), .sync_out(d_minus_sync));

	eop_detect eop_detect1 (.d_plus(d_plus_sync), .d_minus(d_minus_sync), .eop(eop));
	
	decode decode1 (.clk(clk), .n_rst(n_rst), .d_plus(d_plus_sync), .d_minus(d_minus_sync), .sync_shift_enable(sync_shift_enable), .pid_shift_enable(pid_shift_enable), .crc5_shift_enable(crc5_shift_enable), .crc16_shift_enable(crc16_shift_enable), .data_shift_enable(data_shift_enable), .eop(eop), .d_orig(d_orig));

	edge_detect edge_detect1 (.clk(clk), .n_rst(n_rst), .d_plus(d_plus_sync), .d_minus(d_minus_sync), .d_edge(d_edge));

	timer timer1 (.clk(clk), .n_rst(n_rst), .d_edge(d_edge), .sync_rcving(sync_rcving),  .pid_rcving(pid_rcving), .crc5_rcving(crc5_rcving), .crc16_rcving(crc16_rcving), .data_rcving(data_rcving), .sync_shift_enable(sync_shift_enable), .pid_shift_enable(pid_shift_enable), .crc5_shift_enable(crc5_shift_enable), .crc16_shift_enable(crc16_shift_enable), .data_shift_enable(data_shift_enable), .sync_bits_received(sync_bits_received), .pid_bits_received(pid_bits_received), .crc5_bits_received(crc5_bits_received), .crc16_bits_received(crc16_bits_received), .data_bits_received(data_bits_received));
		
	shift_register shift_register1 (.clk(clk), .n_rst(n_rst), .sync_shift_enable(sync_shift_enable), .pid_shift_enable(pid_shift_enable), .crc5_shift_enable(crc5_shift_enable), .crc16_shift_enable(crc16_shift_enable), .data_shift_enable(data_shift_enable), .d_orig(d_orig), .rcv_sync(rcv_sync), .rcv_pid(rcv_pid), .rcv_crc5(rcv_crc5), .rcv_crc16(rcv_crc16), .rcv_data(rcv_data));

	rcu rcu1 (.clk(clk), .n_rst(n_rst), .d_edge(d_edge), .eop(eop), .sync_shift_enable(sync_shift_enable), .pid_shift_enable(pid_shift_enable), .crc5_shift_enable(crc5_shift_enable), .crc16_shift_enable(crc16_shift_enable), .data_shift_enable(data_shift_enable), .rcv_sync(rcv_sync), .rcv_pid(rcv_pid), .rcv_crc5(rcv_crc5), .rcv_crc16(rcv_crc16), .rcv_data(rcv_data), .sync_bits_received(sync_bits_received), .pid_bits_received(pid_bits_received), .crc5_bits_received(crc5_bits_received), .crc16_bits_received(crc16_bits_received), .data_bits_received(data_bits_received), .sync_rcving(sync_rcving), .pid_rcving(pid_rcving), .crc5_rcving(crc5_rcving), .crc16_rcving(crc16_rcving), .data_rcving(data_rcving), .w_enable(w_enable), .r_error(r_error));

endmodule

























	
