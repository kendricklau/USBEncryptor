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
	input wire [7:0] rcv_data,
	input logic data_ready,
	output logic [4:0] trans_crc
);
	logic [7:0] rcv_data_temp;
	logic [5:0] crc_poly = 6'b100101;
	reg [12:0] data_rcv = '0;
  	logic [4:0] next_crc;
	integer i;


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
		if (data_ready) 
		begin
			rcv_data_temp = rcv_data;
			data_rcv = {rcv_data_temp, 5'b0};
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
				if(data_rcv[12:5] == 8'b00000000)
				begin
					i=8;
				end
			end
		end
		next_crc = data_rcv[4:0];
  	end
endmodule
			

