// $Id: $
// File name:   edge_detect.sv
// Created:     2/19/2018
// Author:      Kendrick Lau
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Edge Detector Module

module edge_detect
(
	input wire clk,
	input wire n_rst,
	input wire d_plus,
	input wire d_minus,
	output wire d_edge
);
	reg d_prev_plus;
	reg d_current_plus;
	reg d_prev_minus;
	reg d_current_minus;

	always_ff @ (posedge clk, negedge n_rst)
	begin
		if (!n_rst)
		begin
			d_prev_plus <= 1;
			d_current_plus <= 1;
			d_prev_minus <= 1;
			d_current_minus <= 1;
		end else begin
			d_current_plus <= d_plus;
			d_prev_plus <= d_current_plus;
			d_current_minus <= d_minus;
			d_prev_minus <= d_current_minus;
		end
	end
	
	assign d_edge = ((!d_prev_plus & d_current_plus) & (!d_prev_minus & d_current_minus)) | ((d_prev_plus & !d_current_plus) & (d_prev_minus & !d_current_minus));

endmodule
	
	


