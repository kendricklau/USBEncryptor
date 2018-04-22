// $Id: $
// File name:   tcu.sv
// Created:     2/20/2018
// Author:      Kendrick Lau
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Receiver Control Unit Block

module tcu
(
	input logic clk,
	input logic n_rst,
	input logic trans_data_ready,
	input logic sync_bits_transmitted,
	input logic pid_bits_transmitted,
	input logic crc5_bits_transmitted,
	input logic crc16_bits_transmitted,
	input logic data_bits_transmitted,
	output logic idle_transmitting,
	output logic sync_transmitting,
	output logic pid_transmitting,
	output logic crc5_transmitting,
	output logic crc16_transmitting,
	output logic data_transmitting,
	output logic eop_transmitting,
	output logic sync_load_enable,
	output logic pid_load_enable,
	output logic crc5_load_enable,
	output logic crc16_load_enable,
	output logic data_load_enable,
	output logic [7:0] trans_sync,
	output logic [7:0] trans_pid,
	input logic [63:0] trans_data,
	output logic [4:0] trans_crc5,
	output logic [15:0] trans_crc16,
	output logic handshake_ack
);

	typedef enum logic [4:0] {TOKEN_IDLE,
		LOAD_TOKEN_SYNC,
		TRANSMIT_TOKEN_SYNC,
		LOAD_TOKEN_PID,
		TRANSMIT_TOKEN_PID,
		LOAD_TOKEN_CRC5,
		TRANSMIT_TOKEN_CRC5,
		TRANSMIT_TOKEN_EOP1,
		TRANSMIT_TOKEN_EOP2,
		EOP_TOKEN_DELAY1,
		EOP_TOKEN_DELAY2,
		LOAD_DATA_SYNC,
		TRANSMIT_DATA_SYNC,
		LOAD_DATA_PID,
		TRANSMIT_DATA_PID,
		LOAD_DATA_BITS,
		TRANSMIT_DATA_BITS,
		LOAD_DATA_CRC16,
		TRANSMIT_DATA_CRC16,
		TRANSMIT_DATA_EOP1,
		TRANSMIT_DATA_EOP2,
		EOP_DATA_DELAY1,
		EOP_DATA_DELAY2,
		LOAD_HANDSHAKE_SYNC,
		TRANSMIT_HANDSHAKE_SYNC,
		LOAD_HANDSHAKE_PID,
		TRANSMIT_HANDSHAKE_PID,
		TRANSMIT_HANDSHAKE_EOP1,
		TRANSMIT_HANDSHAKE_EOP2,
		EOP_HANDSHAKE_DELAY1,
		EOP_HANDSHAKE_DELAY2} state_type;	
	state_type state;
	state_type nextstate;

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
				if (trans_data_ready == 1'b1)
				begin
					nextstate = LOAD_TOKEN_SYNC;
				end else begin
					nextstate = TOKEN_IDLE;
				end
			end
			LOAD_TOKEN_SYNC: begin
				trans_sync = 8'b10000000;
				nextstate = TRANSMIT_TOKEN_SYNC;
			end
			TRANSMIT_TOKEN_SYNC: begin
				if (sync_bits_transmitted)
				begin
					nextstate = LOAD_TOKEN_PID;
				end else begin
					nextstate = TRANSMIT_TOKEN_SYNC;
				end
			end
			LOAD_TOKEN_PID: begin
				trans_pid = 8'b00011110;
				nextstate = TRANSMIT_TOKEN_PID;
			end
			TRANSMIT_TOKEN_PID: begin
				if (pid_bits_transmitted)
				begin
					nextstate = LOAD_TOKEN_CRC5;
				end else begin
					nextstate = TRANSMIT_TOKEN_PID;
				end
			end
			LOAD_TOKEN_CRC5: begin
				// trans_crc5 = 5'b11111;
				nextstate = TRANSMIT_TOKEN_CRC5;
			end
			TRANSMIT_TOKEN_CRC5: begin
				if (crc5_bits_transmitted)
				begin
					nextstate = TRANSMIT_TOKEN_EOP1;
				end else begin
					nextstate = TRANSMIT_TOKEN_CRC5;
				end
			end
			TRANSMIT_TOKEN_EOP1: begin
				nextstate = TRANSMIT_TOKEN_EOP2;
			end
			TRANSMIT_TOKEN_EOP2: begin
				nextstate = EOP_TOKEN_DELAY1;
			end
			EOP_TOKEN_DELAY1: begin
				nextstate =  EOP_TOKEN_DELAY2;
			end
			EOP_TOKEN_DELAY2: begin
				nextstate =  LOAD_DATA_SYNC;
			end

			// Start receiving of Data Packet
			LOAD_DATA_SYNC: begin
				trans_sync = 8'b10000000;
				nextstate = TRANSMIT_DATA_SYNC;
			end
			TRANSMIT_DATA_SYNC: begin
				if (sync_bits_transmitted)
				begin
					nextstate = LOAD_DATA_PID;
				end else begin
					nextstate = TRANSMIT_DATA_SYNC;
				end
			end
			LOAD_DATA_PID: begin
				trans_pid = 8'b00111100;
				nextstate = TRANSMIT_DATA_PID;
			end
			TRANSMIT_DATA_PID: begin
				if (pid_bits_transmitted)
				begin
					nextstate = LOAD_DATA_BITS;
				end else begin
					nextstate = TRANSMIT_DATA_PID;
				end
			end
			LOAD_DATA_BITS: begin
				nextstate = TRANSMIT_DATA_BITS;
			end
			TRANSMIT_DATA_BITS: begin
				if (data_bits_transmitted)
				begin
					nextstate = LOAD_DATA_CRC16;
				end else begin
					nextstate = TRANSMIT_DATA_BITS;
				end
			end
			LOAD_DATA_CRC16: begin
				//trans_crc16 = 16'b1111111111111111;
				nextstate = TRANSMIT_DATA_CRC16;
			end
			TRANSMIT_DATA_CRC16: begin
				if (crc16_bits_transmitted)
				begin
					nextstate = TRANSMIT_DATA_EOP1;
				end else begin
					nextstate = TRANSMIT_DATA_CRC16;
				end
			end
			TRANSMIT_DATA_EOP1: begin
				nextstate = TRANSMIT_DATA_EOP2;
			end
			TRANSMIT_DATA_EOP2: begin
				nextstate = EOP_DATA_DELAY1;
			end
			EOP_DATA_DELAY1: begin
				nextstate =  EOP_DATA_DELAY2;
			end
			EOP_DATA_DELAY2: begin
				nextstate =  LOAD_HANDSHAKE_SYNC;
			end

			// Start receiving of Handshake Packet
			LOAD_HANDSHAKE_SYNC: begin
				trans_sync = 8'b10000000;
				nextstate = TRANSMIT_HANDSHAKE_SYNC;
			end
			TRANSMIT_HANDSHAKE_SYNC: begin
				if (sync_bits_transmitted)
				begin
					nextstate = LOAD_HANDSHAKE_PID;
				end else begin
					nextstate = TRANSMIT_HANDSHAKE_SYNC;
				end
			end
			LOAD_HANDSHAKE_PID: begin
				trans_pid = 8'b00101101;
				nextstate = TRANSMIT_HANDSHAKE_PID;
			end
			TRANSMIT_HANDSHAKE_PID: begin
				if (pid_bits_transmitted)
				begin
					nextstate = TRANSMIT_HANDSHAKE_EOP1;
				end else begin
					nextstate = TRANSMIT_HANDSHAKE_PID;
				end
			end
			TRANSMIT_HANDSHAKE_EOP1: begin
				nextstate = TRANSMIT_HANDSHAKE_EOP2;
			end
			TRANSMIT_HANDSHAKE_EOP2: begin
				nextstate = EOP_HANDSHAKE_DELAY1;
			end
			EOP_HANDSHAKE_DELAY1: begin
				nextstate = EOP_HANDSHAKE_DELAY2;
			end
			EOP_HANDSHAKE_DELAY2: begin
				nextstate =  TOKEN_IDLE;
			end
		endcase
	end
	
	assign idle_transmitting = ((state == EOP_TOKEN_DELAY1) | (state == EOP_TOKEN_DELAY2) | (state == EOP_DATA_DELAY1) | (state == EOP_DATA_DELAY2) | (state == EOP_HANDSHAKE_DELAY1) | (state == EOP_HANDSHAKE_DELAY2) | (state == TOKEN_IDLE)) ? 1 : 0;
	assign sync_transmitting = ((state == TRANSMIT_TOKEN_SYNC) | (state == TRANSMIT_DATA_SYNC) | (state == TRANSMIT_HANDSHAKE_SYNC)) ? 1 : 0;
	assign pid_transmitting = ((state == TRANSMIT_TOKEN_PID) | (state == TRANSMIT_DATA_PID) | (state == TRANSMIT_HANDSHAKE_PID)) ? 1 : 0;
	assign crc5_transmitting = ((state == TRANSMIT_TOKEN_CRC5)) ? 1 : 0;
	assign crc16_transmitting = ((state == TRANSMIT_DATA_CRC16)) ? 1 : 0;
	assign data_transmitting = ((state == TRANSMIT_DATA_BITS)) ? 1 : 0;
	assign eop_transmitting = ((state == TRANSMIT_TOKEN_EOP1) | (state == TRANSMIT_TOKEN_EOP2) | (state == TRANSMIT_DATA_EOP1) | (state == TRANSMIT_DATA_EOP2)|   (state == TRANSMIT_HANDSHAKE_EOP1) | (state == TRANSMIT_HANDSHAKE_EOP2)) ? 1 : 0;

	assign sync_load_enable = ((state == LOAD_TOKEN_SYNC) | (state == LOAD_DATA_SYNC) | (state == LOAD_HANDSHAKE_SYNC)) ? 1 : 0;
	assign pid_load_enable = ((state == LOAD_TOKEN_PID) | (state == LOAD_DATA_PID) | (state == LOAD_HANDSHAKE_PID)) ? 1 : 0;
	assign crc5_load_enable = ((state == LOAD_TOKEN_CRC5)) ? 1 : 0;
	assign crc16_load_enable = ((state == LOAD_DATA_CRC16)) ? 1 : 0;
	assign data_load_enable = ((state == LOAD_DATA_BITS)) ? 1 : 0;

	assign handshake_ack = ((state == EOP_HANDSHAKE_DELAY1)) ? 1 : 0;

	crc5_gen crc5 (.clk(clk), .n_rst(n_rst), .rcv_data(trans_pid), .trans_crc(trans_crc5));
	crc16_gen crc16 (.clk(clk), .n_rst(n_rst), .rcv_data(trans_data), .trans_crc(trans_crc16));
endmodule
