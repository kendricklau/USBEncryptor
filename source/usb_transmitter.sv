// $Id: $
// File name:   usb_receiver.sv
// Created:     2/21/2018
// Author:      Kendrick Lau
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Top-level USB Block

module usb_receiver
(
	input wire clk,
	input wire n_rst,
	input wire [4:0] status,
	input wire [63:0] trans_data,
	output wire d_plus,
	output wire d_minus
);
	reg d_orig,
	reg idle,
	reg eop,
	reg sync_shift_enable,
	reg pid_shift_enable,
	reg crc5_shift_enable,g
	reg crc16_shift_enable,
	reg data_shift_enable,
	reg sync_load_enable,
	reg pid_load_enable,
	reg crc5_load_enable,
	reg crc16_load_enable,
	reg data_load_enable,
	reg d_edge, // do i need this?
	reg sync_transmitting,
	reg pid_transmitting,
	reg crc5_transmitting,
	reg crc16_transmitting,
	reg data_transmitting,
	reg sync_bits_transmitted,
	reg pid_bits_transmitted,
	reg crc5_bits_transmitted,
	reg crc16_bits_transmitted,
	reg data_bits_transmitted
	reg [7:0] trans_sync,
	reg [7:0] trans_pid,
	reg [4:0] trans_crc5,
	reg [15:0] trans_crc16,
	reg [63:0] trans_data,

	encode encode1 (
		.clk(clk), 
		.n_rst(n_rst), 
		.d_orig(d_orig), 
		.idle(idle), 
		.eop(eop), 
		.sync_shift_enable(sync_shift_enable), 
		.pid_shift_enable(pid_shift_enable), 
		.crc5_shift_enable(crc5_shift_enable), 
		.crc16_shift_enable(crc16_shift_enable), 
		.data_shift_enable(data_shift_enable), 
		.d_plus(d_plus), 
		.d_minus(d_minus)
		);

	t_shift_register t_shift_register1 (
		.clk(clk),
		.n_rst(n_rst),
		.sync_shift_enable(sync_shift_enable),
		.pid_shift_enable(pid_shift_enable),
		.crc5_shift_enable(crc5_shift_enable),
		.crc16_shift_enable(crc16_shift_enable),
		.data_shift_enable(data_shift_enable),
		.sync_load_enable(sync_load_enable),
		.pid_load_enable(pid_load_enable),
		.crc5_load_enable(crc5_load_enable),
		.crc16_load_enable(crc16_load_enable),
		.data_load_enable(data_load_enable),
		.trans_sync(trans_sync),
		.trans_pid(trans_pid),
		.trans_crc5(trans_crc5),
		.trans_crc16(trans_crc16),
		.trans_data(trans_data),
		.d_orig(d_orig)
		);

	t_timer t_timer1 (
		.clk(clk),
		.n_rst(n_rst),
		.d_edge(d_edge),
		.sync_transmitting(sync_transmitting),
		.pid_transmitting(pid_transmitting),
		.crc5_transmitting(crc5_transmitting),
		.crc16_transmitting(crc16_transmitting),
		.data_transmitting(data_transmitting),
		.sync_shift_enable(sync_shift_enable),
		.pid_shift_enable(pid_shift_enable),
		.crc5_shift_enable(crc5_shift_enable),
		.crc16_shift_enable(crc16_shift_enable),
		.data_shift_enable(data_shift_enable),
		.sync_bits_transmitted(sync_bits_transmitted),
		.pid_bits_transmitted(pid_bits_transmitted),
		.crc5_bits_transmitted(crc5_bits_transmitted),
		.crc16_bits_transmitted(crc16_bits_transmitted),
		.data_bits_transmitted(data_bits_transmitted)
		);

	tcu tcu1 (
		.clk(clk),
		.n_rst(n_rst),
		.status(status),
		.sync_bits_transmitted(sync_bits_transmitted),
		.pid_bits_transmitted(pid_bits_transmitted),
		.crc5_bits_transmitted(crc5_bits_transmitted),
		.crc16_bits_transmitted(crc16_bits_transmitted),
		.data_bits_transmitted(data_bits_transmitted),
		.eop_bits_transmitted(eop_bits_transmitted),
		.sync_transmitting(sync_transmitting),
		.pid_transmitting(pid_transmitting),
		.crc5_transmitting(crc5_transmitting),
		.crc16_transmitting(crc16_transmitting),
		.data_transmitting(data_transmitting),
		.eop_transmitting(eop_transmitting),
		.sync_load_enable(sync_load_enable),
		.pid_load_enable(pid_load_enable),
		.crc5_load_enable(crc5_load_enable),
		.crc16_load_enable(crc16_load_enable),
		.data_load_enable(data_load_enable),
		.eop_load_enable(eop_load_enable),
		.trans_sync(trans_sync),
		.trans_pid(trans_pid),
		.trans_crc5(trans_crc5),
		.trans_crc16(trans_crc16),
		.trans_data(trans_data)
		);

endmodule

























	
