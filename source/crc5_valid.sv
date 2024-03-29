// $Id: $
// File name:   crc5_valid.sv
// Created:     2/19/2018
// Author:      Kendrick Lau
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Decode from NRZI encoding

module crc5_valid
(
	input logic clk,
	input logic n_rst,
	input wire [7:0] rcv_data,
	input wire [4:0] rcv_crc,
	input logic data_ready,
	output logic crc_valid
);
	logic [5:0] crc_poly = 6'b100101;
	reg [12:0] data_rcv = '0;
  	logic [4:0] next_crc;
	integer i;
	reg next_crc_valid = 0;

	always_ff @ (posedge clk, negedge n_rst)
	begin
		if (!n_rst)
		begin
			crc_valid <= 1'b0;
		end else begin
			crc_valid <= next_crc_valid;
		end
	end

	always_comb
	begin
		if (data_ready) 
		begin
			data_rcv = {rcv_data, rcv_crc};
	    		for(i=0; i<8; i++) begin
				if(data_rcv[12-i] == 1'b1)
				begin
					data_rcv[12-i] = data_rcv[12-i] ^ crc_poly[5];
					data_rcv[12-i-1] = data_rcv[12-i-1] ^ crc_poly[4];
					data_rcv[12-i-2] = data_rcv[12-i-2] ^ crc_poly[3];
					data_rcv[12-i-3] = data_rcv[12-i-3] ^ crc_poly[2];
					data_rcv[12-i-4] = data_rcv[12-i-4] ^ crc_poly[1];
					data_rcv[12-i-5] = data_rcv[12-i-5] ^ crc_poly[0];
				end
			end
			if (data_rcv[4:0] == 5'b00000)
			begin
				next_crc_valid = 1'b1;
			end else begin
				next_crc_valid = 1'b0;
			end
		end
  	end
endmodule
			

