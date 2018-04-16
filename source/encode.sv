// $Id: $
// File name:   encode.sv
// Created:     2/19/2018
// Author:      Kendrick Lau
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Decode from NRZI encoding

module encode
(
	input wire clk,
	input wire n_rst,
	input wire d_orig,
	input wire idle,
	input wire eop,
	input wire sync_shift_enable,
	input wire pid_shift_enable,
	input wire crc5_shift_enable,
	input wire crc16_shift_enable,
	input wire data_shift_enable,
	output wire d_plus,
	output wire d_minus
);
	reg old_bit;
	reg new_bit;
	reg next_d_plus;
	reg next_d_minus;


	always_ff @ (posedge clk, negedge n_rst)
	begin
		if (!n_rst)
		begin
			old_bit <= 1'b1;
			new_bit <= 1'b1;
			d_plus <= 1'b1;
			d_minus <= 1'b0;
		end else begin
			old_bit <= new_bit;
			new_bit <= d_orig;
			d_plus <= next_d_plus;
			d_minus <= next_d_minus;
		end
	end
	
	always_comb
	begin
		if (eop)
		begin
			next_d_plus = 1'b0;
			next_d_minus = 1'b0;
		end else if (sync_shift_enable | pid_shift_enable | crc5_shift_enable | crc16_shift_enable | data_shift_enable) begin
			next_d_plus = (old_bit != new_bit) ? ~(d_plus) : d_plus;
			next_d_minus = ~(next_d_plus);
		end else begin
			next_d_plus = 1'b1;
			next_d_plus = ~(next_d_plus);
		end
	end
endmodule
			

