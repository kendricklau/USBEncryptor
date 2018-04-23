// $Id: $
// File name:   encryptor_core.sv
// Created:     4/17/2018
// Author:      Kendrick Lau
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Top-level Encryptor Core Block

module encryptor_core
(
	input wire clk,
	input wire n_rst,
	input wire rcv_data_ready,
	input wire encrypt,
	input wire handshake_ack,
	input wire [63:0] rcv_data,
	output wire [63:0] trans_data,
	output wire trans_data_ready
);
	wire [63:0] des_curr, des_in;
	wire des_start, reverse, cnt_rollover, key_rollover, count_enable, encrypt_sync, des_enable;
	wire [4:0] round_count;
	wire [1:0] key_count;
	wire [47:0] subkey;


	permutation PERMUTATION (
		.rcv_data(rcv_data), 
		.des_curr(des_curr), 
		.tx_data(trans_data),
		.des_in(des_in));
	
	des_round_computations DES_COMP (
		.clk(clk),
		.n_rst(n_rst),
		.des_start(des_start),
		.des_in(des_in),
		.subkey(subkey),
		.des_curr(des_curr),
		.des_enable(des_enable));
	
	key_generator KEYGEN (
		.clk(clk),
		.n_rst(n_rst),
		.reverse(reverse),
		.cnt_rollover(cnt_rollover),
		.key_rollover(key_rollover),
		.round_count(round_count),
		.key_count(key_count),
		.subkey(subkey));

	key_counter KEYCNTR (
		.clk(clk),
		.n_rst(n_rst),
		.count_enable(cnt_rollover),
		.key_count(key_count),
		.key_rollover(key_rollover));

	round_counter RNDCNTR (
		.clk(clk),
		.n_rst(n_rst),
		.count_enable(count_enable),
		.round_count(round_count),
		.cnt_rollover(cnt_rollover));

	des_controller DES_CONTROLLER (
		.clk(clk),
		.n_rst(n_rst),
		.receive(rcv_data_ready),
		.empty(handshake_ack),
		.encrypt_sync(encrypt_sync),
		.count_enable(count_enable),
		.reverse(reverse),
		.des_start(des_start),
		.data_out(trans_data_ready),
		.des_enable(des_enable));

	sync_high ENCRYPT_SYNC (
		.clk(clk),
		.n_rst(n_rst),
		.async_in(encrypt),
		.sync_out(encrypt_sync));

endmodule

























	
