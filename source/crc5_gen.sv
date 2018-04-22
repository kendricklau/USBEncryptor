// $Id: $
// File name:   crc5_gen.sv
// Created:     2/19/2018
// Author:      Kendrick Lau
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Decode from NRZI encoding

module crc5_gen
(
	input logic clk,
	input logic n_rst,
	input logic [7:0] rcv_data,
	output logic [4:0] trans_crc
);
	reg [4:0] crc = 5'b10011;
	reg [7:0] d;
    	reg [4:0] c;
    	reg [4:0] new_crc;
	reg [4:0] next_crc;
  	
	always_ff @ (posedge clk, negedge n_rst)
	begin
		if (!n_rst)
		begin
			trans_crc <= '0;
		end else begin
			trans_crc <= next_crc;
		end
	end

	always_comb
	begin
    		d = rcv_data;
    		c = crc;
	        new_crc[0] = d[6] ^ d[5] ^ d[3] ^ d[0] ^ c[0] ^ c[2] ^ c[3];
	        new_crc[1] = d[7] ^ d[6] ^ d[4] ^ d[1] ^ c[1] ^ c[3] ^ c[4];
	        new_crc[2] = d[7] ^ d[6] ^ d[3] ^ d[2] ^ d[0] ^ c[0] ^ c[3] ^ c[4];
	        new_crc[3] = d[7] ^ d[4] ^ d[3] ^ d[1] ^ c[0] ^ c[1] ^ c[4];
	        new_crc[4] = d[5] ^ d[4] ^ d[2] ^ c[1] ^ c[2];
	        next_crc = new_crc;
  	end
endmodule
			

