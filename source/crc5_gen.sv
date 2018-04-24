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
	input logic data_ready,
	output logic [4:0] trans_crc
);
	logic [5:0] crc_poly = 6'b100101;
	logic [12:0] data_rcv = {rcv_data, 5'b0};
	reg [3:0] i = 0;

//	always_comb
//	begin
//		if (data_ready) 
//		begin
//		data_rcv = {rcv_data, 5'b0};
//	    		for(i=0; i<8; i++) begin
//				if(data_rcv[12-i] == 1'b1)
//				begin
//					data_rcv[12-i] = data_rcv[12-i] ^ crc_poly[5];
//					data_rcv[12-i-1] = data_rcv[12-i-1] ^ crc_poly[4];
//					data_rcv[12-i-2] = data_rcv[12-i-2] ^ crc_poly[3];
//					data_rcv[12-i-3] = data_rcv[12-i-3] ^ crc_poly[2];
//					data_rcv[12-i-4] = data_rcv[12-i-4] ^ crc_poly[1];
//					data_rcv[12-i-5] = data_rcv[12-i-5] ^ crc_poly[0];
//				end
//			end
//		end
//		trans_crc = data_rcv[4:0];
//	end
	always @ (posedge clk, negedge n_rst)
	begin
		if (data_ready)
		begin
			data_rcv = {rcv_data, 5'b0};
			if(i < 8)
			begin
				if(data_rcv[12-i] == 1'b1)
				begin
					data_rcv[12-i] = data_rcv[12-i] ^ crc_poly[5];
					data_rcv[12-i-1] = data_rcv[12-i-1] ^ crc_poly[4];
					data_rcv[12-i-2] = data_rcv[12-i-2] ^ crc_poly[3];
					data_rcv[12-i-3] = data_rcv[12-i-3] ^ crc_poly[2];
					data_rcv[12-i-4] = data_rcv[12-i-4] ^ crc_poly[1];
					data_rcv[12-i-5] = data_rcv[12-i-5] ^ crc_poly[0];
				end	
				i = i + 1;
			end else begin
				trans_crc = data_rcv[4:0];
			end
		end
	end

	
endmodule
			
