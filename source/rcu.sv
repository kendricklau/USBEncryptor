// $Id: $
// File name:   rcu.sv
// Created:     2/20/2018
// Author:      Kendrick Lau
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Receiver Control Unit Block

module rcu
(
	input wire clk,
	input wire n_rst,
	input wire d_edge,
	input wire eop,
	input wire shift_enable,
	input wire [7:0] rcv_data,
	input wire byte_received,
	output reg sync_rcving,
	output reg pid_rcving,
	output reg data_rcving,
	output reg eop_rcving,
	output reg w_enable,
	output reg r_error
);

	typedef enum logic [4:0] {IDLE, RECEIVE_SYNC, COMPARE_SYNC, EIDLE, EIDLE_WAIT, EIDLE_WAIT2, RECEIVE_BITS, RECEIVED_BYTE, RECEIVED_BYTE_EOP, EDGE_DELAY, EOP_DELAY, EOP_WAIT} state_type;	
	state_type state;
	state_type nextstate;

	always_ff @ (posedge clk, negedge n_rst)
	begin
		if (!n_rst)
		begin
			state <= IDLE;
		end else begin
			state <= nextstate;
		end
	end

	always_comb 
	begin : next_state
		nextstate = state;
		sync_rcving = 0;
		pid_rcving = 0;
		crc5_rcving = 0;
		crc16_rcving = 0;
		data_rcving = 0;
		eop_rcving = 0;
		w_enable = 0;
		r_error = 0;
		case (state)
			// Start receiving Token packet
			TOKEN_IDLE: begin
				sync_rcving = 0;
				w_enable = 0;
				r_error = 0;
				if (d_edge)
				begin
					nextstate = RECEIVE_TOKEN_SYNC;
				end else begin
					nextstate = TOKEN_IDLE;
				end
			end
			RECEIVE_TOKEN_SYNC: begin
				sync_rcving = 1;
				w_enable = 0;
				r_error = 0;
				if (byte_received)
				begin
					nextstate = COMPARE_TOKEN_SYNC;
				end else begin
					nextstate = RECEIVE_TOKEN_SYNC;
				end
			end
			COMPARE_TOKEN_SYNC: begin
				sync_rcving = 1;
				w_enable = 0;
				r_error = 0;
				if (rcv_data == 8'b10000000)
				begin
					nextstate = RECEIVE_TOKEN_PID;
				end else begin
					nextstate = EIDLE;
				end
			end
			RECEIVE_TOKEN_PID: begin
				rcving = 1;
				w_enable = 0;
				r_error = 0;
				if (byte_received)
				begin
					nextstate = COMPARE_TOKEN_PID;
				end else begin
					nextstate = RECEIVE_TOKEN_PID;
				end
			end
			COMPARE_TOKEN_PID: begin
				rcving = 1;
				w_enable = 0;
				r_error = 0;
				if (rcv_data == 8'b10010110)
				begin
					nextstate = RECEIVE_TOKEN_EOP;
				end else begin
					nextstate = EIDLE;
				end
			end
			RECEIVE_TOKEN_CRC5: begin
				rcving = 1;
				w_enable = 0;
				r_error = 0;
				if (crc5_received)
				begin
					nextstate = COMPARE_TOKEN_CRC5;
				end else begin
					nextstate = RECEIVE_TOKEN_CRC5;
				end
			end
			COMPARE_TOKEN_CRC5: begin
				rcving = 1;
				w_enable = 0;
				r_error = 0;
				if (crc5_valid)
				begin
					nextstate = RECEIVE_TOKEN_EOP;
				end else begin
					nextstate = EIDLE;
				end
			end
			RECEIVE_TOKEN_EOP: begin
				rcving = 1;
				w_enable = 0;
				r_error = 0;
				if (eop & shift_enable)
				begin
					nextstate = EOP_TOKEN_DELAY;
				end else begin
					nextstate = RECEIVE_TOKEN_EOP;
				end
			end
			EOP_TOKEN_DELAY: begin
				rcving = 0;
				w_enable = 0;
				r_error = 0;
				if (d_edge)
				begin
					nextstate = DATA_IDLE;
				end else begin
					nextstate = EOP_TOKEN_DELAY;
				end
			end

			// Start receiving of Data Packet
			DATA_IDLE: begin
				rcving = 0;
				w_enable = 0;
				r_error = 0;
				if (d_edge)
				begin
					nextstate = RECEIVE_DATA_SYNC;
				end else begin
					nextstate = DATA_IDLE;
				end
			end
			RECEIVE_DATA_SYNC: begin
				rcving = 1;
				w_enable = 0;
				r_error = 0;
				if (byte_received)
				begin
					nextstate = COMPARE_DATA_SYNC;
				end else begin
					nextstate = RECEIVE_DATA_SYNC;
				end
			end
			COMPARE_DATA_SYNC: begin
				rcving = 1;
				w_enable = 0;
				r_error = 0;
				if (rcv_data == 8'b10000000)
				begin
					nextstate = RECEIVE_DATA_PID;
				end else begin
					nextstate = EIDLE;
				end
			end
			RECEIVE_DATA_PID: begin
				rcving = 1;
				w_enable = 0;
				r_error = 0;
				if (byte_received)
				begin
					nextstate = COMPARE_DATA_PID;
				end else begin
					nextstate = RECEIVE_DATA_PID;
				end
			end
			COMPARE_DATA_PID: begin
				rcving = 1;
				w_enable = 0;
				r_error = 0;
				if (rcv_data == 8'b00111100)
				begin
					nextstate = RECEIVE_DATA_BITS;
				end else begin
					nextstate = EIDLE;
				end
			end
			RECEIVE_DATA_BITS: begin
				rcving = 1;
				w_enable = 0;
				r_error = 0;
				if (byte_8_received)
				begin
					nextstate = COMPARE_DATA_BITS;
				end else begin
					nextstate = RECEIVE_DATA_BITS;
				end
			end
			COMPARE_DATA_BITS: begin
				rcving = 1;
				w_enable = 0;
				r_error = 0;
				if (data_valid)
				begin
					nextstate = RECEIVE_DATA_EOP;
				end else begin
					nextstate = EIDLE;
				end
			end
			RECEIVE_TOKEN_CRC16: begin
				rcving = 1;
				w_enable = 0;
				r_error = 0;
				if (crc16_received)
				begin
					nextstate = COMPARE_TOKEN_CRC5;
				end else begin
					nextstate = RECEIVE_TOKEN_CRC5;
				end
			end
			COMPARE_TOKEN_CRC16: begin
				rcving = 1;
				w_enable = 0;
				r_error = 0;
				if (crc16_valid)
				begin
					nextstate = RECEIVE_TOKEN_EOP;
				end else begin
					nextstate = EIDLE;
				end
			end
			RECEIVE_DATA_EOP: begin
				rcving = 1;
				w_enable = 0;
				r_error = 0;
				if (eop & shift_enable)
				begin
					nextstate = EOP_DATA_DELAY;
				end else begin
					nextstate = RECEIVE_DATA_EOP;
				end
			end
			EOP_DATA_DELAY: begin
				rcving = 0;
				w_enable = 0;
				r_error = 0;
				if (d_edge)
				begin
					nextstate = HANDSHAKE_IDLE;
				end else begin
					nextstate = EOP_TOKEN_DELAY;
				end
			end

			// Start receiving of Handshake Packet
			HANDSHAKE_IDLE: begin
				rcving = 0;
				w_enable = 0;
				r_error = 0;
				if (d_edge)
				begin
					nextstate = RECEIVE_HANDSHAKE_SYNC;
				end else begin
					nextstate = HANDSHAKE_IDLE;
				end
			end
			RECEIVE_HANDSHAKE_SYNC: begin
				rcving = 1;
				w_enable = 0;
				r_error = 0;
				if (byte_received)
				begin
					nextstate = COMPARE_HANDSHAKE_SYNC;
				end else begin
					nextstate = RECEIVE_HANDSHAKE_SYNC;
				end
			end
			COMPARE_HANDSHAKE_SYNC: begin
				rcving = 1;
				w_enable = 0;
				r_error = 0;
				if (rcv_HANDSHAKE == 8'b10000000)
				begin
					nextstate = RECEIVE_HANDSHAKE_PID;
				end else begin
					nextstate = EIDLE;
				end
			end
			RECEIVE_HANDSHAKE_PID: begin
				rcving = 1;
				w_enable = 0;
				r_error = 0;
				if (byte_received)
				begin
					nextstate = COMPARE_HANDSHAKE_PID;
				end else begin
					nextstate = RECEIVE_HANDSHAKE_PID;
				end
			end
			COMPARE_HANDSHAKE_PID: begin
				rcving = 1;
				w_enable = 0;
				r_error = 0;
				if (rcv_HANDSHAKE == 8'b00101101)
				begin
					nextstate = RECEIVE_HANDSHAKE_BITS;
				end else begin
					nextstate = EIDLE;
				end
			end
			RECEIVE_HANDSHAKE_EOP: begin
				rcving = 1;
				w_enable = 0;
				r_error = 0;
				if (eop & shift_enable)
				begin
					nextstate = EOP_HANDSHAKE_DELAY;
				end else begin
					nextstate = RECEIVE_HANDSHAKE_EOP;
				end
			end
			EOP_HANDSHAKE_DELAY: begin
				rcving = 0;
				w_enable = 0;
				r_error = 0;
				if (d_edge)
				begin
					nextstate = TOKEN_IDLE;
				end else begin
					nextstate = EOP_HANDSHAKE_DELAY;
				end
			end
		endcase
	end
endmodule
