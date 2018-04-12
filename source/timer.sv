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
	input wire rcving,
	output wire shift_enable,
	output wire byte_received,
	output wire byte_8_received
);
	reg [31:0] count_out;
	reg async_byte_received;
	reg current_byte_received;
	reg prev_byte_received;
	reg async_byte_8_received;
	reg current_byte_8_received;
	reg prev_byte_8_received;

	always_ff @ (posedge clk, negedge n_rst)
	begin
		if (!n_rst)
		begin
			current_byte_received <= 0;
			prev_byte_received <= 0;
			current_byte_8_received <= 0;
			prev_byte_8_received <= 0;
		end else begin
			prev_byte_received <= current_byte_received;
			current_byte_received <= async_byte_received;
			prev_byte_8_received <= current_byte_8_received;
			current_byte_8_received <= async_byte_8_received;
		end
	end

	assign byte_received = (current_byte_received & !prev_byte_received);
	assign byte_8_received = (current_byte_8_received & !prev_byte_8_received);

	flex_counter #(.NUM_CNT_BITS(32)) bit_shift (.clk(clk), .n_rst(n_rst), .clear(d_edge), .count_enable(rcving), .rollover_val(8), .count_out(count_out));

	assign shift_enable = (count_out == 4'b0011);

	flex_counter #(.NUM_CNT_BITS(32)) byte_receive (.clk(clk), .n_rst(n_rst), .clear(!rcving), .count_enable(shift_enable), .rollover_val(8), .rollover_flag(async_byte_received));

	flex_counter #(.NUM_CNT_BITS(32)) byte_8_receive (.clk(clk), .n_rst(n_rst), .clear(!rcving), .count_enable(byte_received), .rollover_val(8), .rollover_flag(async_byte_8_received));

endmodule
