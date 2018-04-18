// $Id: $
// File name:   t_shift_register.sv
// Created:     4/14/2018
// Author:      Kendrick Lau
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Shift Register Block

module t_shift_register
(
	input logic clk,
	input logic n_rst,
	input logic sync_shift_enable,
	input logic pid_shift_enable,
	input logic crc5_shift_enable,
	input logic crc16_shift_enable,
	input logic data_shift_enable,
	input logic sync_load_enable,
	input logic pid_load_enable,
	input logic crc5_load_enable,
	input logic crc16_load_enable,
	input logic data_load_enable,
	input logic [7:0] trans_sync,
	input logic [7:0] trans_pid,
	input logic [4:0] trans_crc5,
	input logic [15:0] trans_crc16,
	input logic [63:0] trans_data,
	input logic sync_transmitting,
	input logic pid_transmitting,
	input logic crc5_transmitting,
	input logic crc16_transmitting,
	input logic data_transmitting,
	input logic eop_transmitting,
	output logic d_orig
);
	logic sync_serial_out;
	logic pid_serial_out;
	logic crc5_serial_out;
	logic crc16_serial_out;
	logic data_serial_out;

	always_ff @ (posedge clk, negedge n_rst)
	begin
		if(!n_rst)
		begin
			d_orig <= 1'b1;
		end else if (sync_transmitting) begin
			d_orig <= sync_serial_out;
		end else if (pid_transmitting) begin
			d_orig <= pid_serial_out;
		end else if (crc5_transmitting) begin
			d_orig <= crc5_serial_out;
		end else if (crc16_transmitting) begin
			d_orig <= crc16_serial_out;
		end else if (data_transmitting) begin
			d_orig <= data_serial_out;
		end
	end
	flex_pts_sr #(.NUM_BITS(8), .SHIFT_MSB(0)) sync_shift_reg (.clk(clk), .n_rst(n_rst), .load_enable(sync_load_enable), .shift_enable(sync_shift_enable), .parallel_in(trans_sync), .serial_out(sync_serial_out));
	flex_pts_sr #(.NUM_BITS(8), .SHIFT_MSB(0)) pid_shift_reg (.clk(clk), .n_rst(n_rst), .load_enable(pid_load_enable), .shift_enable(pid_shift_enable), .parallel_in(trans_pid), .serial_out(pid_serial_out));
	flex_pts_sr #(.NUM_BITS(5), .SHIFT_MSB(0)) crc5_shift_reg (.clk(clk), .n_rst(n_rst), .load_enable(crc5_load_enable), .shift_enable(crc5_shift_enable), .parallel_in(trans_crc5), .serial_out(crc5_serial_out));
	flex_pts_sr #(.NUM_BITS(16), .SHIFT_MSB(0)) crc16_shift_reg (.clk(clk), .n_rst(n_rst), .load_enable(crc16_load_enable), .shift_enable(crc16_shift_enable), .parallel_in(trans_crc16), .serial_out(crc16_serial_out));
	flex_pts_sr #(.NUM_BITS(64), .SHIFT_MSB(0)) data_shift_reg (.clk(clk), .n_rst(n_rst), .load_enable(data_load_enable), .shift_enable(data_shift_enable), .parallel_in(trans_data), .serial_out(data_serial_out));

endmodule
