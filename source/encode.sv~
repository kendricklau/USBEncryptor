// $Id: $
// File name:   encode.sv
// Created:     2/19/2018
// Author:      Kendrick Lau
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Decode from NRZI encoding

module encode
(
	input logic clk,
	input logic n_rst,
	input logic d_orig,
	input logic idle_transmitting,
	input logic eop_transmitting,
	input logic sync_shift_enable,
	input logic pid_shift_enable,
	input logic crc5_shift_enable,
	input logic crc16_shift_enable,
	input logic data_shift_enable,
	output logic d_plus,
	output logic d_minus
);


	always_ff @ (posedge clk, negedge n_rst)
	begin
		if (!n_rst)
		begin
			d_plus <= 1'b1;
			d_minus <= 1'b0;
		end else if (idle_transmitting) begin
			d_plus <= 1'b1;
			d_minus <= 1'b0;
		end else if (eop_transmitting) begin
			d_plus <= 1'b0;
			d_minus <= 1'b0;
		end else if (sync_shift_enable | pid_shift_enable | crc5_shift_enable | crc16_shift_enable | data_shift_enable) begin
			if (d_orig)
			begin
				d_plus <= !d_plus;
				d_minus <= !d_minus;
			end
		end
	end
endmodule
			

