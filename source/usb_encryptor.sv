// $Id: $
// File name:   usb_encryptor.sv
// Created:     2/21/2018
// Author:      Kendrick Lau
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Top-level USB Block for Encryption/Decryption

module usb_encryptor
(
	input logic clk,
	input logic n_rst,
	input logic encrypt,
	input logic d_plus_in,
	input logic d_minus_in,
	output logic d_plus_out,
	output logic d_minus_out
);
	reg rcv_data_ready;
	reg trans_data_ready;
	reg [63:0] rcv_data;
	reg [63:0] trans_data;

	reg handshake_ack;

	usb_receiver A1 (.clk(clk), .n_rst(n_rst), .d_plus(d_plus_in), .d_minus(d_minus_in), .rcv_data_ready(rcv_data_ready), .rcv_data(rcv_data));
	
	encryptor_core B1 (.clk(clk), .n_rst(n_rst), .rcv_data_ready(rcv_data_ready), .encrypt(encrypt), .handshake_ack(handshake_ack), .rcv_data(rcv_data), .trans_data(trans_data), .trans_data_ready(trans_data_ready));

	usb_transmitter C1 (.clk(clk), .n_rst(n_rst), .trans_data_ready(trans_data_ready), .trans_data(trans_data), .d_plus(d_plus_out), .d_minus(d_minus_out), .handshake_ack(handshake_ack));

endmodule

























	
