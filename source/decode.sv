// $Id: $
// File name:   decode.sv
// Created:     2/19/2018
// Author:      Kendrick Lau
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Decode from NRZ encoding

module decode
(
	input wire clk,
	input wire n_rst,
	input wire d_plus,
	input wire d_minus,
	input wire shift_enable,
	input wire eop,
	output wire d_orig
);
	reg stored_bit;
	reg next_stored_bit;
	reg current_bit;
	reg next_current_bit;
	reg d_line;


	always_ff @ (posedge clk, negedge n_rst)
	begin
		if (!n_rst)
		begin
			stored_bit <= 1;
			current_bit <= 1;
		end else begin
			stored_bit <= next_stored_bit;
			current_bit <= next_current_bit;
		end
	end
	assign d_line = (d_plus & !d_minus) ? 1 : (!d_plus & d_minus) ? 0 : 1'bz;
	assign next_stored_bit = shift_enable ? (d_line | eop) : stored_bit;
	assign next_current_bit = d_line;

	assign d_orig = (!stored_bit & !current_bit) | (stored_bit & current_bit);
endmodule
			

