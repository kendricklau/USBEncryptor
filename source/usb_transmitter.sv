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
	input wire [4:0] status,
	input wire [63:0] rcv_data,
	output wire d_plus,
	output wire d_minus
);
	
	encode encode1 (.clk(clk), .n_rst(n_rst), .d_plus(d_plus_sync), .d_minus(d_minus_sync), .sync_shift_enable(sync_shift_enable), .pid_shift_enable(pid_shift_enable), .crc5_shift_enable(crc5_shift_enable), .crc16_shift_enable(crc16_shift_enable), .data_shift_enable(data_shift_enable), .eop(eop), .d_orig(d_orig));

	t_shift_register t_shift_register1 (.clk(clk), .n_rst(n_rst), .d_plus(d_plus_sync), .d_minus(d_minus_sync), .d_edge(d_edge));

	t_timer t_timer1 (.clk(clk), .n_rst(n_rst), .d_edge(d_edge), .sync_rcving(sync_rcving),  .pid_rcving(pid_rcving), .crc5_rcving(crc5_rcving), .crc16_rcving(crc16_rcving), .data_rcving(data_rcving), .sync_shift_enable(sync_shift_enable), .pid_shift_enable(pid_shift_enable), .crc5_shift_enable(crc5_shift_enable), .crc16_shift_enable(crc16_shift_enable), .data_shift_enable(data_shift_enable), .sync_bits_received(sync_bits_received), .pid_bits_received(pid_bits_received), .crc5_bits_received(crc5_bits_received), .crc16_bits_received(crc16_bits_received), .data_bits_received(data_bits_received));

	tcu tcu1 (.clk(clk), .n_rst(n_rst), .d_edge(d_edge), .eop(eop), .sync_shift_enable(sync_shift_enable), .pid_shift_enable(pid_shift_enable), .crc5_shift_enable(crc5_shift_enable), .crc16_shift_enable(crc16_shift_enable), .data_shift_enable(data_shift_enable), .rcv_sync(rcv_sync), .rcv_pid(rcv_pid), .rcv_crc5(rcv_crc5), .rcv_crc16(rcv_crc16), .rcv_data(rcv_data), .sync_bits_received(sync_bits_received), .pid_bits_received(pid_bits_received), .crc5_bits_received(crc5_bits_received), .crc16_bits_received(crc16_bits_received), .data_bits_received(data_bits_received), .sync_rcving(sync_rcving), .pid_rcving(pid_rcving), .crc5_rcving(crc5_rcving), .crc16_rcving(crc16_rcving), .data_rcving(data_rcving), .w_enable(w_enable), .r_error(r_error));

endmodule

























	
