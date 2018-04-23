// $Id: $
// File name:   decode.sv
// Created:     2/19/2018
// Author:      Kendrick Lau
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Decode from NRZI encoding

module decode
(
	input wire clk,
	input wire n_rst,
	input wire d_plus,
	input wire d_minus,
	input wire sync_shift_enable,
	input wire pid_shift_enable,
	input wire crc5_shift_enable,
	input wire crc16_shift_enable,
	input wire data_shift_enable,
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
	always_comb
	begin
		if(eop)
		begin
			next_stored_bit = 1'b1;
		end else if (sync_shift_enable | pid_shift_enable | crc5_shift_enable | crc16_shift_enable | data_shift_enable) begin
			next_stored_bit = d_plus;
		end else begin
			next_stored_bit = stored_bit;
		end
	end
	assign d_line = (d_plus & !d_minus) | (!d_plus & d_minus) | (!d_plus & !d_minus);
	// assign next_stored_bit = ((sync_shift_enable | pid_shift_enable | crc5_shift_enable | crc16_shift_enable | data_shift_enable) ? (d_plus | eop) : stored_bit) | (eop ?;
	assign next_current_bit = d_plus;

	//NRZI encoding
	assign d_orig = d_line ? (((!stored_bit & !current_bit) | (stored_bit & current_bit)) ? 1 : 0) : 1'bz;
endmodule
			

