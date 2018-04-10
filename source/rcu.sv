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
	output reg rcving,
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
		rcving = 0;
		w_enable = 0;
		r_error = 0;
		case (state)
			TOKEN_IDLE: begin
				rcving = 0;
				w_enable = 0;
				r_error = 0;
				if (d_edge)
				begin
					nextstate = RECEIVE_SYNC;
				end else begin
					nextstate = TOKEN_IDLE;
				end
			end
			RECEIVE_TOKEN_SYNC: begin
				rcving = 1;
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
				rcving = 1;
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
		endcase
	end
endmodule
