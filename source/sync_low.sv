// $Id: $
// File name:   sync_low.sv
// Created:     1/16/2018
// Author:      Kendrick Lau
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Reset to Logic Low 

module sync_low
(
	input wire clk,
	input wire n_rst,
	input wire async_in,
	output reg sync_out
);
	reg q;

	always_ff @ (posedge clk, negedge n_rst)
	begin
		if(1'b0 == n_rst)
		begin
			q <= 0;
		end
		else
		begin
			q <= async_in;
		end
	end

	always_ff @ (posedge clk, negedge n_rst)
	begin
		if(1'b0 == n_rst)
		begin
			sync_out <= 0;
		end
		else
		begin
			if(q == 0 || q == 1)
			begin
				sync_out <= q;
			end
			else
			begin
				sync_out <= 0;
			end
		end
	end

endmodule
