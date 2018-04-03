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
			IDLE: begin
				rcving = 0;
				w_enable = 0;
				r_error = 0;
				if (d_edge)
				begin
					nextstate = RECEIVE_SYNC;
				end else begin
					nextstate = IDLE;
				end
			end
			RECEIVE_SYNC: begin
				rcving = 1;
				w_enable = 0;
				r_error = 0;
				if (byte_received)
				begin
					nextstate = COMPARE_SYNC;
				end else begin
					nextstate = RECEIVE_SYNC;
				end
			end
			COMPARE_SYNC: begin
				rcving = 1;
				w_enable = 0;
				r_error = 0;
				if (rcv_data == 8'b10000000)
				begin
					nextstate = RECEIVE_BITS;
				end else begin
					nextstate = EIDLE;
				end
			end
			EIDLE: begin
				rcving = 1;
				w_enable = 0;
				r_error = 1;
				if (eop & shift_enable)
				begin
					nextstate = EIDLE_WAIT;
				end else begin
					nextstate = EIDLE;
				end
			end
			EIDLE_WAIT: begin
				rcving = 0;
				w_enable = 0;
				r_error = 1;
				if (d_edge)
				begin
					nextstate = EIDLE_WAIT2;
				end else begin
					nextstate = EIDLE_WAIT;
				end
			end
			EIDLE_WAIT2: begin
				rcving = 0;
				w_enable = 0;
				r_error = 1;
				if (d_edge)
				begin
					nextstate = RECEIVE_SYNC;
				end else begin
					nextstate = EIDLE_WAIT2;
				end
			end
			RECEIVE_BITS: begin
				rcving = 1;
				w_enable = 0;
				r_error = 0;
				if (byte_received)
				begin
					nextstate = RECEIVED_BYTE;
				end else if (eop & shift_enable) begin
					nextstate = EOP_DELAY;
				end else begin
					nextstate = RECEIVE_BITS;
				end
			end
			RECEIVED_BYTE: begin
				rcving = 1;
				w_enable = 1;
				r_error = 0;
				nextstate = RECEIVED_BYTE_EOP;
			end
			RECEIVED_BYTE_EOP: begin
				rcving = 1;
				w_enable = 0;
				r_error = 0;
				if (!eop & shift_enable)
				begin
					nextstate = RECEIVE_BITS;
				end else if (eop & shift_enable) begin
					nextstate = EDGE_DELAY;
				end else begin
					nextstate = RECEIVED_BYTE_EOP;
				end
			end
			EDGE_DELAY: begin
				rcving = 0;
				w_enable = 0;
				r_error = 0;
				if (d_edge)
				begin
					nextstate = IDLE;
				end else begin
					nextstate = EDGE_DELAY;
				end
			end
			EOP_DELAY: begin
				rcving = 0;
				w_enable = 0;
				r_error = 1;
				if (d_edge)
				begin
					nextstate = EOP_WAIT;
				end else begin
					nextstate = EOP_DELAY;
				end
			end
			EOP_WAIT: begin
				rcving = 0;
				w_enable = 0;
				r_error = 1;
				if (d_edge)
				begin
					nextstate = RECEIVE_SYNC;
				end else begin
					nextstate = EOP_WAIT;
				end
			end
		endcase
	end
endmodule
