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
	input wire shift_enable,
	input wire d_orig,
	output wire [7:0] rcv_data
);

	flex_stp_sr #(.NUM_BITS(8), .SHIFT_MSB(0)) shift_reg (.clk(clk), .n_rst(n_rst), .shift_enable(shift_enable), .serial_in(d_orig), .parallel_out(rcv_data));

endmodule
