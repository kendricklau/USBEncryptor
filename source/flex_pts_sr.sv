// $Id: $
// File name:   flex_stp_sr.sv
// Created:     1/23/2018
// Author:      Kendrick Lau
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: N-bit Serial to Parallel Shift Register Design

module flex_pts_sr
#(
	parameter NUM_BITS = 4,
	parameter SHIFT_MSB = 0
)
(
	input wire clk,
	input wire n_rst,
	input wire load_enable,
	input wire shift_enable,
	input reg [NUM_BITS-1:0] parallel_in,
	output reg serial_out
);
	reg [NUM_BITS-1:0] parallel_in_tmp;

	always_ff @ (posedge clk, negedge n_rst)
	begin
		if(n_rst == 1'b0)
		begin
			serial_out <= 1;
			parallel_in_tmp <= '1;
		end else if ((load_enable == 1'b1) & (shift_enable == 1'b1) & (SHIFT_MSB == 1))
		begin
			parallel_in_tmp <= parallel_in;
			serial_out <= parallel_in[NUM_BITS-1];
			parallel_in_tmp <= {parallel_in_tmp[NUM_BITS-2:0], 1'b1};
		end else if ((load_enable == 1'b1) & (shift_enable == 1'b1) & (SHIFT_MSB == 0))
		begin
			parallel_in_tmp <= parallel_in;
			serial_out <= parallel_in[0];
			parallel_in_tmp <= {1'b1, parallel_in_tmp[NUM_BITS-1:1]};
		end else if (load_enable == 1'b1)
		begin
			parallel_in_tmp <= parallel_in;
		end else if ((shift_enable == 1'b1) & (load_enable == 1'b0) & (SHIFT_MSB == 1))	
		begin
			serial_out <= parallel_in_tmp[NUM_BITS-1];
			parallel_in_tmp <= {parallel_in_tmp[NUM_BITS-2:0], 1'b1};
		end else if ((shift_enable == 1'b1) & (load_enable == 1'b0) & (SHIFT_MSB == 0))	
		begin
			serial_out <= parallel_in_tmp[0];
			parallel_in_tmp <= {1'b1, parallel_in_tmp[NUM_BITS-1:1]};
		end	
	end
endmodule
