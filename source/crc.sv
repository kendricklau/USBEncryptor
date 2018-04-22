// $Id: $
// File name:   crc.sv
// Created:     2/19/2018
// Author:      Kendrick Lau
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Decode from NRZI encoding

module crc
#(
	CRC_BITS = 5;
	DATA_BITS = 8;
)
(
	input logic clk,
	input logic n_rst,
	input logic [CRC_BITS-1:0] rcv_crc,
	input logic [DATA_BITS-1:0] rcv_data,
	output logic crc_valid
	
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
	assign d_orig = d_line ? ((!stored_bit & current_bit) | (stored_bit & !current_bit)) : 1'bz;
endmodule
			

