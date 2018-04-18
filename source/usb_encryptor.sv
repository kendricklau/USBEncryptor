// $Id: $
// File name:   usb_encryptor.sv
// Created:     2/21/2018
// Author:      Kendrick Lau
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Top-level USB Block for Encryption/Decryption

module usb_encryptor
(
	input wire clk,
	input wire n_rst,
	input wire encrypt,
	inout d_plus,
	inout d_minus
	
);
	reg rcv_data_ready;
	reg trans_data_ready;
	reg [63:0] rcv_data;
	reg [63:0] trans_data;

	reg handshake_ack;

	usb_receiver A1 (.clk(clk), .n_rst(n_rst), .d_plus(d_plus), .d_minus(d_minus), .rcv_data_ready(rcv_data_ready), .rcv_data(rcv_data));
	
	encryptor_core B1 (.clk(clk), .n_rst(n_rst), .rcv_data_ready(rcv_data_ready), .encrypt(encrypt), .handshake_ack(handshake_ack), .rcv_data(rcv_data), .trans_data(trans_data), .trans_data_ready(trans_data_ready));

	usb_transmitter C1 (.clk(clk), .n_rst(n_rst), .trans_data_ready(trans_data_ready), .trans_data(trans_data), .d_plus(d_plus), .d_minus(d_minus), .handshake_ack(handshake_ack));

endmodule

























	
