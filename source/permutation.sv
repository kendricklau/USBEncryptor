// $Id: $
// File name:   permutation.sv
// Created:     4/12/2018
// Author:      Jonathan Reitz
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Feistel Permutation
// 


module permutation 
(
	input wire [63:0] rcv_data,
	input wire [63:0] des_curr,
	output wire [63:0] tx_data,
	output wire [63:0] des_in
);
	assign des_in = {rcv_data[6],rcv_data[14],rcv_data[22],rcv_data[30],rcv_data[38],rcv_data[46],rcv_data[54],rcv_data[62],
					rcv_data[4],rcv_data[12],rcv_data[20],rcv_data[28],rcv_data[36],rcv_data[44],rcv_data[52],rcv_data[60],
					rcv_data[2],rcv_data[10],rcv_data[18],rcv_data[26],rcv_data[34],rcv_data[42],rcv_data[50],rcv_data[58],
					rcv_data[0],rcv_data[8],rcv_data[16],rcv_data[24],rcv_data[32],rcv_data[40],rcv_data[48],rcv_data[56],
					rcv_data[7],rcv_data[15],rcv_data[23],rcv_data[31],rcv_data[39],rcv_data[47],rcv_data[55],rcv_data[63],
					rcv_data[5],rcv_data[13],rcv_data[21],rcv_data[29],rcv_data[37],rcv_data[45],rcv_data[53],rcv_data[61],
					rcv_data[3],rcv_data[11],rcv_data[19],rcv_data[27],rcv_data[35],rcv_data[43],rcv_data[51],rcv_data[59],
					rcv_data[1],rcv_data[9],rcv_data[17],rcv_data[25],rcv_data[33],rcv_data[41],rcv_data[49],rcv_data[57]};

	assign tx_data = {des_curr[24],des_curr[56],des_curr[16],des_curr[48],des_curr[8],des_curr[40],des_curr[0],des_curr[32],
					des_curr[25],des_curr[57],des_curr[17],des_curr[49],des_curr[9],des_curr[41],des_curr[1],des_curr[33],
					des_curr[26],des_curr[58],des_curr[18],des_curr[50],des_curr[10],des_curr[42],des_curr[2],des_curr[34],
					des_curr[27],des_curr[59],des_curr[19],des_curr[51],des_curr[11],des_curr[43],des_curr[3],des_curr[35],
					des_curr[28],des_curr[60],des_curr[20],des_curr[52],des_curr[12],des_curr[44],des_curr[4],des_curr[36],
					des_curr[29],des_curr[61],des_curr[21],des_curr[53],des_curr[13],des_curr[45],des_curr[5],des_curr[37],
					des_curr[30],des_curr[62],des_curr[22],des_curr[54],des_curr[14],des_curr[46],des_curr[6],des_curr[38],
					des_curr[31],des_curr[63],des_curr[23],des_curr[55],des_curr[15],des_curr[47],des_curr[7],des_curr[39]};
endmodule
