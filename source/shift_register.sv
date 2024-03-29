// $Id: $
// File name:   shift_register.sv
// Created:     2/21/2018
// Author:      Kendrick Lau
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Shift Register Block

module shift_register
(
	input wire clk,
	input wire n_rst,
	input wire sync_shift_enable,
	input wire pid_shift_enable,
	input wire crc5_shift_enable,
	input wire crc16_shift_enable,
	input wire data_shift_enable,
	input wire d_orig,
	output wire [7:0] rcv_sync,
	output wire [7:0] rcv_pid,
	output wire [4:0] rcv_crc5,
	output wire [15:0] rcv_crc16,
	output wire [63:0] rcv_data
);

	flex_stp_sr #(.NUM_BITS(8), .SHIFT_MSB(0)) sync_shift_reg (.clk(clk), .n_rst(n_rst), .shift_enable(sync_shift_enable), .serial_in(d_orig), .parallel_out(rcv_sync));
	flex_stp_sr #(.NUM_BITS(8), .SHIFT_MSB(0)) pid_shift_reg (.clk(clk), .n_rst(n_rst), .shift_enable(pid_shift_enable), .serial_in(d_orig), .parallel_out(rcv_pid));
	flex_stp_sr #(.NUM_BITS(5), .SHIFT_MSB(0)) crc5_shift_reg (.clk(clk), .n_rst(n_rst), .shift_enable(crc5_shift_enable), .serial_in(d_orig), .parallel_out(rcv_crc5));
	flex_stp_sr #(.NUM_BITS(16), .SHIFT_MSB(0)) crc16_shift_reg (.clk(clk), .n_rst(n_rst), .shift_enable(crc16_shift_enable), .serial_in(d_orig), .parallel_out(rcv_crc16));
	flex_stp_sr #(.NUM_BITS(64), .SHIFT_MSB(0)) data_shift_reg (.clk(clk), .n_rst(n_rst), .shift_enable(data_shift_enable), .serial_in(d_orig), .parallel_out(rcv_data));

endmodule
