// $Id: 
// File name:   crc16_valid.sv
// Created:     2/19/2018
// Author:      Kendrick Lau
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: CRC16 validation

module crc16_valid
(
	input logic clk,
	input logic n_rst,
	input wire [63:0] rcv_data,
	input wire [15:0] rcv_crc,
	input logic data_ready,
	output logic crc_valid
);
	logic [16:0] crc_poly = 17'b11000000000000101;
	reg [79:0] data_rcv = '0;
  	logic [15:0] next_crc;
	integer i;
	reg next_crc_valid = 0;

	always_ff @ (posedge clk, negedge n_rst)
	begin
		if (!n_rst)
		begin
			crc_valid <= '0;
		end else begin
			crc_valid <= next_crc_valid;
		end
	end

	always_comb
	begin
		if (data_ready) 
		begin
			data_rcv = {rcv_data, rcv_crc};
	    		for(i=0; i<64; i++) begin
				if(data_rcv[79-i] == 1'b1)
				begin
					data_rcv[79-i] = data_rcv[79-i] ^ crc_poly[16];
					data_rcv[79-i-1] = data_rcv[79-i-1] ^ crc_poly[15];
					data_rcv[79-i-2] = data_rcv[79-i-2] ^ crc_poly[14];
					data_rcv[79-i-3] = data_rcv[79-i-3] ^ crc_poly[13];
					data_rcv[79-i-4] = data_rcv[79-i-4] ^ crc_poly[12];
					data_rcv[79-i-5] = data_rcv[79-i-5] ^ crc_poly[11];
					data_rcv[79-i-6] = data_rcv[79-i-6] ^ crc_poly[10];
					data_rcv[79-i-7] = data_rcv[79-i-7] ^ crc_poly[9];
					data_rcv[79-i-8] = data_rcv[79-i-8] ^ crc_poly[8];
					data_rcv[79-i-9] = data_rcv[79-i-9] ^ crc_poly[7];
					data_rcv[79-i-10] = data_rcv[79-i-10] ^ crc_poly[6];
					data_rcv[79-i-11] = data_rcv[79-i-11] ^ crc_poly[5];
					data_rcv[79-i-12] = data_rcv[79-i-12] ^ crc_poly[4];
					data_rcv[79-i-13] = data_rcv[79-i-13] ^ crc_poly[3];
					data_rcv[79-i-14] = data_rcv[79-i-14] ^ crc_poly[2];
					data_rcv[79-i-15] = data_rcv[79-i-15] ^ crc_poly[1];
					data_rcv[79-i-16] = data_rcv[79-i-16] ^ crc_poly[0];
				end
			end
			if (data_rcv[15:0] == 16'b0000000000000000)
			begin
				next_crc_valid = 1'b1;
			end else begin
				next_crc_valid = 1'b0;
			end
		end
  	end
endmodule
			

