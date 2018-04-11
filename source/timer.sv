// $Id: $
// File name:   timer.sv
// Created:     2/21/2018
// Author:      Kendrick Lau
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: USB Timer Block
// 


module timer
(
	input wire clk,
	input wire n_rst,
	input wire d_edge,
	input wire sync_rcving,

	output wire sync_shift_enable,
	output wire pid_shift_enable,
	output wire crc5_shift_enable,
	output wire crc16_shift_enable,
	output wire data_shift_enable,

	output wire sync_bits_received,
	output wire pid_bits_received,
	output wire crc5_bits_received,
	output wire crc16_bits_received,
	output wire data_bits_received,
);
	reg [31:0] sync_count_out;
	reg [31:0] pid_count_out;
	reg [31:0] crc5_count_out;
	reg [31:0] crc16_count_out;
	reg [31:0] data_count_out;

	reg async_sync_bits_received = 0;
	reg current_sync_bits_received;
	reg prev_sync_bits_received;

	reg async_pid_bits_received = 0;
	reg current_pid_bits_received;
	reg prev_pid_bits_received;

	reg async_crc5_bits_received = 0;
	reg current_crc5_bits_received;
	reg prev_crc5_bits_received;

	reg async_crc16_bits_received = 0;
	reg current_crc16_bits_received;
	reg prev_crc16_bits_received;

	reg async_data_bits_received = 0;
	reg current_data_bits_received;
	reg prev_data_bits_received;

	always_ff @ (posedge clk, negedge n_rst)
	begin
		if (!n_rst)
		begin
			current_sync_bits_received <= 0;
			prev_sync_bits_received <= 0;
			async_sync_bits_received <= 0;
			current_pid_bits_received <= 0;
			prev_pid_bits_received <= 0;
			async_pid_bits_received <= 0;
			current_crc5_bits_received <= 0;
			prev_crc5_bits_received <= 0;
			async_crc5_bits_received <= 0;
			current_crc16_bits_received <= 0;
			prev_crc16_bits_received <= 0;
			async_crc16_bits_received <= 0;
			current_data_bits_received <= 0;
			prev_data_bits_received <= 0;
			async_data_bits_received <= 0;
		end else begin
			prev_sync_bits_received <= current_sync_bits_received;
			current_sync_bits_received <= async_sync_bits_received;
			prev_pid_bits_received <= current_pid_bits_received;
			current_pid_bits_received <= async_pid_bits_received;
			prev_crc5_bits_received <= current_crc5_bits_received;
			current_crc5_bits_received <= async_crc5_bits_received;
			prev_crc16_bits_received <= current_crc16_bits_received;
			current_crc16_bits_received <= async_crc16_bits_received;
			prev_data_bits_received <= current_data_bits_received;
			current_data_bits_received <= async_data_bits_received;
		end
	end

	assign sync_bits_received = (current_sync_bits_received & !prev_sync_bits_received);
	assign pid_bits_received = (current_pid_bits_received & !prev_pid_bits_received);
	assign crc5_bits_received = (current_crc5_bits_received & !prev_crc5_bits_received);
	assign crc16_bits_received = (current_crc16_bits_received & !prev_crc16_bits_received);
	assign data_bits_received = (current_data_bits_received & !prev_data_bits_received);

	flex_counter #(.NUM_CNT_BITS(32)) sync_bit_shift (.clk(clk), .n_rst(n_rst), .clear(d_edge), .count_enable(sync_rcving), .rollover_val(8), .count_out(sync_count_out));
	flex_counter #(.NUM_CNT_BITS(32)) pid_bit_shift (.clk(clk), .n_rst(n_rst), .clear(d_edge), .count_enable(pid_rcving), .rollover_val(8), .count_out(pid_count_out));
	flex_counter #(.NUM_CNT_BITS(32)) crc5_bit_shift (.clk(clk), .n_rst(n_rst), .clear(d_edge), .count_enable(crc5_rcving), .rollover_val(8), .count_out(crc5_count_out));
	flex_counter #(.NUM_CNT_BITS(32)) crc16_bit_shift (.clk(clk), .n_rst(n_rst), .clear(d_edge), .count_enable(crc16_rcving), .rollover_val(8), .count_out(crc16_count_out));
	flex_counter #(.NUM_CNT_BITS(32)) data_bit_shift (.clk(clk), .n_rst(n_rst), .clear(d_edge), .count_enable(data_rcving), .rollover_val(8), .count_out(data_count_out));

	assign sync_shift_enable = (count_out == 4'b0100);
	assign pid_shift_enable = (count_out == 4'b0100);
	assign crc5_shift_enable = (count_out == 4'b0100);
	assign crc16_shift_enable = (count_out == 4'b0100);
	assign data_shift_enable = (count_out == 4'b0100);

	flex_counter #(.NUM_CNT_BITS(32)) sync_bits_receive (.clk(clk), .n_rst(n_rst), .clear(!sync_rcving), .count_enable(sync_shift_enable), .rollover_val(8), .rollover_flag(async_sync_bits_received));
	flex_counter #(.NUM_CNT_BITS(32)) pid_bits_receive (.clk(clk), .n_rst(n_rst), .clear(!pid_rcving), .count_enable(pid_shift_enable), .rollover_val(8), .rollover_flag(async_pid_bits_received));
	flex_counter #(.NUM_CNT_BITS(32)) crc5_bits_receive (.clk(clk), .n_rst(n_rst), .clear(!crc5_rcving), .count_enable(crc5_shift_enable), .rollover_val(5), .rollover_flag(async_crc5_bits_received));
	flex_counter #(.NUM_CNT_BITS(32)) crc16_bits_receive (.clk(clk), .n_rst(n_rst), .clear(!crc16_rcving), .count_enable(crc16_shift_enable), .rollover_val(16), .rollover_flag(async_crc16_bits_received));
	flex_counter #(.NUM_CNT_BITS(32)) data_bits_receive (.clk(clk), .n_rst(n_rst), .clear(!data_rcving), .count_enable(data_shift_enable), .rollover_val(64), .rollover_flag(async_data_bits_received));

endmodule
