// $Id: $
// File name:   flex_stp_sr.sv
// Created:     1/23/2018
// Author:      Kendrick Lau
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: N-bit Serial to Parallel Shift Register Design

module flex_stp_sr
#(
	parameter NUM_BITS = 4,
	parameter SHIFT_MSB = 0
)
(
	input wire clk,
	input wire n_rst,
	input wire shift_enable,
	input wire serial_in,
	output reg [NUM_BITS-1:0] parallel_out
);
	always_ff @ (posedge clk, negedge n_rst)
	begin
		if(n_rst == 1'b0)
		begin
			parallel_out <= '1;
		end else if ((shift_enable == 1'b1) & (SHIFT_MSB == 1))	
		begin
			parallel_out <= {parallel_out[NUM_BITS-2:0],serial_in};
		end else if ((shift_enable == 1'b1) & (SHIFT_MSB == 0))
		begin
			parallel_out <= {serial_in, parallel_out[NUM_BITS-1:1]};
		end
			
	end
endmodule
