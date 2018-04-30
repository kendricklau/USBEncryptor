// $Id: $
// File name:   rcu.sv
// Created:     2/20/2018
// Author:      Kendrick Lau
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Receiver Control Unit Block

module rcu
(
	input logic clk,
	input logic n_rst,
	input logic d_edge,
	input logic eop,
	input logic sync_shift_enable,
	input logic pid_shift_enable,
	input logic crc5_shift_enable,
	input logic crc16_shift_enable,
	input logic data_shift_enable,
	input logic [7:0] rcv_sync,
	input logic [7:0] rcv_pid,
	input logic [4:0] rcv_crc5,
	input logic [15:0] rcv_crc16,
	input logic [63:0] rcv_data,
	input logic sync_bits_received,
	input logic pid_bits_received,
	input logic crc5_bits_received,
	input logic crc16_bits_received,
	input logic data_bits_received,
	output logic sync_rcving,
	output logic pid_rcving,
	output logic crc5_rcving,
	output logic crc16_rcving,
	output logic data_rcving,
	output logic rcv_data_ready
);

	typedef enum logic [4:0] {TOKEN_IDLE, RECEIVE_TOKEN_SYNC, COMPARE_TOKEN_SYNC, RECEIVE_TOKEN_PID, COMPARE_TOKEN_PID, RECEIVE_TOKEN_CRC5, COMPARE_TOKEN_CRC5_1, COMPARE_TOKEN_CRC5_2, RECEIVE_TOKEN_EOP, EOP_TOKEN_DELAY, DATA_IDLE, RECEIVE_DATA_SYNC, COMPARE_DATA_SYNC, RECEIVE_DATA_PID, COMPARE_DATA_PID, RECEIVE_DATA_BITS, COMPARE_DATA_BITS, RECEIVE_DATA_CRC16, COMPARE_DATA_CRC16_1, COMPARE_DATA_CRC16_2, RECEIVE_DATA_EOP, EOP_DATA_DELAY, HANDSHAKE_IDLE, RECEIVE_HANDSHAKE_SYNC, COMPARE_HANDSHAKE_SYNC, RECEIVE_HANDSHAKE_PID, COMPARE_HANDSHAKE_PID, RECEIVE_HANDSHAKE_EOP, EOP_HANDSHAKE_DELAY, EIDLE1, EIDLE2
} state_type;	
	state_type state;
	state_type nextstate;
	logic crc5_compare_enable;
	logic crc5_valid;
	logic crc16_compare_enable;
	logic crc16_valid;

	always_ff @ (posedge clk, negedge n_rst)
	begin
		if (!n_rst)
		begin
			state <= TOKEN_IDLE;
		end else begin
			state <= nextstate;
		end
	end
	
	always_comb 
	begin : next_state
		nextstate = state;
		case (state)
			// Start receiving Token packet
			TOKEN_IDLE: begin
				if (d_edge)
				begin
					nextstate = RECEIVE_TOKEN_SYNC;
				end else begin
					nextstate = TOKEN_IDLE;
				end
			end
			RECEIVE_TOKEN_SYNC: begin
				if (sync_bits_received)
				begin
					nextstate = COMPARE_TOKEN_SYNC;
				end else begin
					nextstate = RECEIVE_TOKEN_SYNC;
				end
			end
			COMPARE_TOKEN_SYNC: begin
				if (rcv_sync == 8'b10000000)
				begin
					nextstate = RECEIVE_TOKEN_PID;
				end else begin
					nextstate = EIDLE1;
				end
			end
			RECEIVE_TOKEN_PID: begin
				if (pid_bits_received)
				begin
					nextstate = COMPARE_TOKEN_PID;
				end else begin
					nextstate = RECEIVE_TOKEN_PID;
				end
			end
			COMPARE_TOKEN_PID: begin
				if (rcv_pid == 8'b10010110)
				begin
					nextstate = RECEIVE_TOKEN_CRC5;
				end else begin
					nextstate = EIDLE1;
				end
			end
			RECEIVE_TOKEN_CRC5: begin
				if (crc5_bits_received)
				begin
					nextstate = COMPARE_TOKEN_CRC5_1;
				end else begin
					nextstate = RECEIVE_TOKEN_CRC5;
				end
			end
			COMPARE_TOKEN_CRC5_1: begin
				nextstate = COMPARE_TOKEN_CRC5_2;
			end
			COMPARE_TOKEN_CRC5_2: begin
				if (1)
				begin
					nextstate = RECEIVE_TOKEN_EOP;
				end else begin
					nextstate = EIDLE1;
				end
			end
			RECEIVE_TOKEN_EOP: begin
				if (eop)
				begin
					nextstate = EOP_TOKEN_DELAY;
				end else begin
					nextstate = RECEIVE_TOKEN_EOP;
				end
			end
			EOP_TOKEN_DELAY: begin
				if (d_edge)
				begin
					nextstate = DATA_IDLE;
				end else begin
					nextstate = EOP_TOKEN_DELAY;
				end
			end

			// Start receiving of Data Packet
			DATA_IDLE: begin
				if (d_edge)
				begin
					nextstate = RECEIVE_DATA_SYNC;
				end else begin
					nextstate = DATA_IDLE;
				end
			end
			RECEIVE_DATA_SYNC: begin
				if (sync_bits_received)
				begin
					nextstate = COMPARE_DATA_SYNC;
				end else begin
					nextstate = RECEIVE_DATA_SYNC;
				end
			end
			COMPARE_DATA_SYNC: begin
				if (rcv_sync == 8'b10000000)
				begin
					nextstate = RECEIVE_DATA_PID;
				end else begin
					nextstate = EIDLE1;
				end
			end
			RECEIVE_DATA_PID: begin
				if (pid_bits_received)
				begin
					nextstate = COMPARE_DATA_PID;
				end else begin
					nextstate = RECEIVE_DATA_PID;
				end
			end
			COMPARE_DATA_PID: begin
				if (rcv_pid == 8'b00111100)
				begin
					nextstate = RECEIVE_DATA_BITS;
				end else begin
					nextstate = EIDLE1;
				end
			end
			RECEIVE_DATA_BITS: begin
				if (data_bits_received)
				begin
					nextstate = COMPARE_DATA_BITS;
				end else begin
					nextstate = RECEIVE_DATA_BITS;
				end
			end
			COMPARE_DATA_BITS: begin
				if (1)
				begin
					nextstate = RECEIVE_DATA_CRC16;
				end else begin
					nextstate = EIDLE1;
				end
			end
			RECEIVE_DATA_CRC16: begin
				if (crc16_bits_received)
				begin
					nextstate = COMPARE_DATA_CRC16_1;
				end else begin
					nextstate = RECEIVE_DATA_CRC16;
				end
			end
			COMPARE_DATA_CRC16_1: begin
				nextstate = COMPARE_DATA_CRC16_2;
			end
			COMPARE_DATA_CRC16_2: begin
				if (1)
				begin
					nextstate = RECEIVE_DATA_EOP;
				end else begin
					nextstate = EIDLE1;
				end
			end
			RECEIVE_DATA_EOP: begin
				if (eop)
				begin
					nextstate = EOP_DATA_DELAY;
				end else begin
					nextstate = RECEIVE_DATA_EOP;
				end
			end
			EOP_DATA_DELAY: begin
				if (d_edge)
				begin
					nextstate = HANDSHAKE_IDLE;
				end else begin
					nextstate = EOP_DATA_DELAY;
				end
			end

			// Start receiving of Handshake Packet
			HANDSHAKE_IDLE: begin
				if (d_edge)
				begin
					nextstate = RECEIVE_HANDSHAKE_SYNC;
				end else begin
					nextstate = HANDSHAKE_IDLE;
				end
			end
			RECEIVE_HANDSHAKE_SYNC: begin
				if (sync_bits_received)
				begin
					nextstate = COMPARE_HANDSHAKE_SYNC;
				end else begin
					nextstate = RECEIVE_HANDSHAKE_SYNC;
				end
			end
			COMPARE_HANDSHAKE_SYNC: begin
				if (rcv_sync == 8'b10000000)
				begin
					nextstate = RECEIVE_HANDSHAKE_PID;
				end else begin
					nextstate = EIDLE1;
				end
			end
			RECEIVE_HANDSHAKE_PID: begin
				if (pid_bits_received)
				begin
					nextstate = COMPARE_HANDSHAKE_PID;
				end else begin
					nextstate = RECEIVE_HANDSHAKE_PID;
				end
			end
			COMPARE_HANDSHAKE_PID: begin
				if (rcv_pid == 8'b00101101)
				begin
					nextstate = RECEIVE_HANDSHAKE_EOP;
				end else begin
					nextstate = EIDLE1;
				end
			end
			RECEIVE_HANDSHAKE_EOP: begin
				if (eop)
				begin
					nextstate = EOP_HANDSHAKE_DELAY;
				end else begin
					nextstate = RECEIVE_HANDSHAKE_EOP;
				end
			end
			EOP_HANDSHAKE_DELAY: begin
				if (d_edge)
				begin
					nextstate = TOKEN_IDLE;
				end else begin
					nextstate = EOP_HANDSHAKE_DELAY;
				end
			end
			EIDLE1: begin
				nextstate = EIDLE2;
			end
			EIDLE2: begin
				nextstate = TOKEN_IDLE;
			end
		endcase
	end

	assign sync_rcving = ((state == RECEIVE_TOKEN_SYNC) | (state == COMPARE_TOKEN_SYNC) | (state == RECEIVE_DATA_SYNC) | (state == COMPARE_DATA_SYNC) | (state == RECEIVE_HANDSHAKE_SYNC) | (state == COMPARE_HANDSHAKE_SYNC)) ? 1 : 0;
	assign pid_rcving = ((state == RECEIVE_TOKEN_PID) | (state == COMPARE_TOKEN_PID) | (state == RECEIVE_DATA_PID) | (state == COMPARE_DATA_PID) | (state == RECEIVE_HANDSHAKE_PID) | (state == COMPARE_HANDSHAKE_PID)) ? 1 : 0;
	assign crc5_rcving = ((state == RECEIVE_TOKEN_CRC5) | (state == COMPARE_TOKEN_CRC5_2)) ? 1 : 0;
	assign crc16_rcving = ((state == RECEIVE_DATA_CRC16) | (state == COMPARE_DATA_CRC16_2)) ? 1 : 0;
	assign data_rcving = ((state == RECEIVE_DATA_BITS) | (state == COMPARE_DATA_BITS)) ? 1 : 0;
	
	assign rcv_data_ready = ((state == EOP_HANDSHAKE_DELAY)) ? 1 : 0;
	assign crc5_compare_enable = ((state == COMPARE_TOKEN_CRC5_1)) ? 1 : 0;
	assign crc16_compare_enable = ((state == COMPARE_DATA_CRC16_1)) ? 1 : 0;

	//crc5_valid crc5_comp (.clk(clk), .n_rst(n_rst), .rcv_data(rcv_pid), .rcv_crc(rcv_crc5), .data_ready(crc5_compare_enable), .crc_valid(crc5_valid));
	//crc16_valid crc16_comp (.clk(clk), .n_rst(n_rst), .rcv_data(rcv_data), .rcv_crc(rcv_crc16), .data_ready(crc16_compare_enable), .crc_valid(crc16_valid));
	
endmodule
