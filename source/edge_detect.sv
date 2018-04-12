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
	reg d_prev;
	reg d_current;

	always_ff @ (posedge clk, negedge n_rst)
	begin
		if (!n_rst)
		begin
			d_prev <= 1;
			d_current <= 1;
		end else begin
			d_current <= d_plus;
			d_prev <= d_current;
		end
	end
	
	assign d_edge = (!d_prev & d_current) | (d_prev & !d_current);

endmodule
	
	


