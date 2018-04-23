// 337 Lab 6 Testbench EOP Detect
// This code serves as a starer test bench for the synchronizer design

`timescale 1ns / 10ps

module tb_usb_encryptor();

	// Define local parameters used by the test bench
	localparam	CLK_PERIOD	= 10.5;
	localparam	CHECK_DELAY = 1;

	// Declare DUT portmap signals
	reg tb_clk; // input
	reg tb_n_rst; // input
	reg tb_d_plus_in; // input
	reg tb_d_minus_in; // input
	reg tb_d_plus_out;
	reg tb_d_minus_out;
	reg tb_encrypt;
	reg [7:0] rcv_sync; // output
	reg [7:0] rcv_pid; // output
	reg [4:0] rcv_crc5; // output
	reg [15:0] rcv_crc16; // output
	reg [63:0] rcv_data; // output
	reg [7:0] tb_sync_data;
	reg [7:0] tb_pid_data;
	reg [4:0] tb_crc5_data;
	reg [15:0] tb_crc16_data;
	reg [63:0] tb_data_data;
	reg [7:0] temp_tb_sync_data;
	reg [7:0] temp_tb_pid_data;
	reg [4:0] temp_tb_crc5_data;
	reg [15:0] temp_tb_crc16_data;
	reg [63:0] temp_tb_data_data;
	reg tb_d_prev;
	integer i;

	// Clock generation block
	always
	begin
		tb_clk = 1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD/2.0);
	end
	
	// DUT Port map
	usb_encryptor DUT(.clk(tb_clk), .n_rst(tb_n_rst), .encrypt(encrypt), .d_plus_in(tb_d_plus_in), .d_minus_in(tb_d_minus_in), .d_plus_out(tb_d_plus_out), .d_minus_out(tb_d_minus_out));
	
	// Test bench main process
	initial
	begin
		// initialize
		tb_n_rst = 0;
		tb_d_plus_in = 1;
		tb_d_minus_in = 0;
		tb_encrypt = 1;
	
		// do asynch reset
		@(negedge tb_clk);
		tb_n_rst = 0;
		@(posedge tb_clk);
		tb_n_rst = 1;
		//NOMINAL CASE #1 -- NOMINAL DATA #1
		// Token Packet
		// advance to receive sync
		@(posedge tb_clk);
		tb_d_plus_in = 0;
		tb_d_minus_in = 1;
		@(posedge tb_clk);
		tb_d_plus_in = 1;
		tb_d_minus_in = 0;

		//send sync byte
		tb_sync_data = 8'b10000000; // DATA0
		for(i = 0; i < 8; i++) begin
			temp_tb_sync_data[7-i] = tb_sync_data[i];
		end
		tb_sync_data = temp_tb_sync_data;
		tb_d_prev = tb_d_plus_in;
		foreach(tb_sync_data[i]) begin
			if (tb_sync_data[i] == 0)
			begin
				tb_d_plus_in = !tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
				tb_d_prev = !tb_d_prev;
			end else if (tb_sync_data[i] == 1)
			begin
				tb_d_plus_in = tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
			end
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
		end
		//send IN PID byte
		tb_pid_data = 8'b10010110; // DATA0
		for(i = 0; i < 8; i++) begin
			temp_tb_pid_data[7-i] = tb_pid_data[i];
		end
		tb_pid_data = temp_tb_pid_data;
		tb_d_prev = tb_d_plus_in;
		foreach(tb_pid_data[i]) begin
			if (tb_pid_data[i] == 0)
			begin
				tb_d_plus_in = !tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
				tb_d_prev = !tb_d_prev;
			end else if (tb_pid_data[i] == 1)
			begin
				tb_d_plus_in = tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
			end
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
		end
		//send IN CRC5 bits
		tb_crc5_data = 5'b01010; //00111100 DATA0
		for(i = 0; i < 6; i++) begin
			temp_tb_crc5_data[4-i] = tb_crc5_data[i];
		end
		tb_crc5_data = temp_tb_crc5_data;
		tb_d_prev = tb_d_plus_in;
		foreach(tb_crc5_data[i]) begin
			if (tb_crc5_data[i] == 0)
			begin
				tb_d_plus_in = !tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
				tb_d_prev = !tb_d_prev;
			end else if (tb_crc5_data[i] == 1)
			begin
				tb_d_plus_in = tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
			end
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
		end
		// send EOP and then IDLE
		tb_d_plus_in = 0;
		tb_d_minus_in = 0;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_d_plus_in = 1;
		tb_d_minus_in = 0;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);

		// Data packet
		// advance to receive sync
		@(posedge tb_clk);
		tb_d_plus_in = 0;
		tb_d_minus_in = 1;
		@(posedge tb_clk);
		tb_d_plus_in = 1;
		tb_d_minus_in = 0;

		// send sync byte
		tb_sync_data = 8'b10000000; //00111100 DATA0
		for(i = 0; i < 8; i++) begin
			temp_tb_sync_data[7-i] = tb_sync_data[i];
		end
		tb_sync_data = temp_tb_sync_data;
		tb_d_prev = tb_d_plus_in;
		foreach(tb_sync_data[i]) begin
			if (tb_sync_data[i] == 0)
			begin
				tb_d_plus_in = !tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
				tb_d_prev = !tb_d_prev;
			end else if (tb_sync_data[i] == 1)
			begin
				tb_d_plus_in = tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
			end
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
		end

		// send IN PID byte
		tb_pid_data = 8'b00111100; //00111100 DATA0
		for(i = 0; i < 8; i++) begin
			temp_tb_pid_data[7-i] = tb_pid_data[i];
		end
		tb_pid_data = temp_tb_pid_data;
		tb_d_prev = tb_d_plus_in;
		foreach(tb_pid_data[i]) begin
			if (tb_pid_data[i] == 0)
			begin
				tb_d_plus_in = !tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
				tb_d_prev = !tb_d_prev;
			end else if (tb_pid_data[i] == 1)
			begin
				tb_d_plus_in = tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
			end
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
		end

		// send Data 8 byte
		tb_data_data = 64'b1111111111111111000000000000000011111111111111110000000000000000; //00111100 DATA0
		for(i = 0; i < 64; i++) begin
			temp_tb_data_data[63-i] = tb_data_data[i];
		end
		tb_data_data = temp_tb_data_data;
		tb_d_prev = tb_d_plus_in;
		foreach(tb_data_data[i]) begin
			if (tb_data_data[i] == 0)
			begin
				tb_d_plus_in = !tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
				tb_d_prev = !tb_d_prev;
			end else if (tb_data_data[i] == 1)
			begin
				tb_d_plus_in = tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
			end
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
		end

		// send CRC16 bytes
		tb_crc16_data = 16'b0000001011110100; //00111100 DATA0
		for(i = 0; i < 16; i++) begin
			temp_tb_crc16_data[15-i] = tb_crc16_data[i];
		end
		tb_crc16_data = temp_tb_crc16_data;
		tb_d_prev = tb_d_plus_in;
		foreach(tb_crc16_data[i]) begin
			if (tb_crc16_data[i] == 0)
			begin
				tb_d_plus_in = !tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
				tb_d_prev = !tb_d_prev;
			end else if (tb_crc16_data[i] == 1)
			begin
				tb_d_plus_in = tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
			end
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
		end

		// send EOP and then IDLE
		tb_d_plus_in = 0;
		tb_d_minus_in = 0;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_d_plus_in = 1;
		tb_d_minus_in = 0;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);

		// Handshake Packet
		// advance to receive sync
		@(posedge tb_clk);
		tb_d_plus_in = 0;
		tb_d_minus_in = 1;
		@(posedge tb_clk);
		tb_d_plus_in = 1;
		tb_d_minus_in = 0;

		//send sync byte
		tb_sync_data = 8'b10000000; //00111100 DATA0
		for(i = 0; i < 8; i++) begin
			temp_tb_sync_data[7-i] = tb_sync_data[i];
		end
		tb_sync_data = temp_tb_sync_data;
		tb_d_prev = tb_d_plus_in;
		foreach(tb_sync_data[i]) begin
			if (tb_sync_data[i] == 0)
			begin
				tb_d_plus_in = !tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
				tb_d_prev = !tb_d_prev;
			end else if (tb_sync_data[i] == 1)
			begin
				tb_d_plus_in = tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
			end
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
		end

		//send IN PID byte
		tb_pid_data = 8'b00101101; // 10010110
		for(i = 0; i < 8; i++) begin
			temp_tb_pid_data[7-i] = tb_pid_data[i];
		end
		tb_pid_data = temp_tb_pid_data;
		tb_d_prev = tb_d_plus_in;
		foreach(tb_pid_data[i]) begin
			if (tb_pid_data[i] == 0)
			begin
				tb_d_plus_in = !tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
				tb_d_prev = !tb_d_prev;
			end else if (tb_pid_data[i] == 1)
			begin
				tb_d_plus_in = tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
			end
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
		end

		// send EOP and then IDLE
		tb_d_plus_in = 0;
		tb_d_minus_in = 0;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_d_plus_in = 1;
		tb_d_minus_in = 0;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		

	// do asynch reset
		@(negedge tb_clk);
		tb_n_rst = 0;
		@(posedge tb_clk);
		tb_n_rst = 1;

		//NOMINAL CASE #2 - NOMINAL DATA #2
		// Token Packet
		// advance to receive sync
		@(posedge tb_clk);
		tb_d_plus_in = 0;
		tb_d_minus_in = 1;
		@(posedge tb_clk);
		tb_d_plus_in = 1;
		tb_d_minus_in = 0;

		//send sync byte
		tb_sync_data = 8'b10000000; // DATA0
		for(i = 0; i < 8; i++) begin
			temp_tb_sync_data[7-i] = tb_sync_data[i];
		end
		tb_sync_data = temp_tb_sync_data;
		tb_d_prev = tb_d_plus_in;
		foreach(tb_sync_data[i]) begin
			if (tb_sync_data[i] == 0)
			begin
				tb_d_plus_in = !tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
				tb_d_prev = !tb_d_prev;
			end else if (tb_sync_data[i] == 1)
			begin
				tb_d_plus_in = tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
			end
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
		end
		//send IN PID byte
		tb_pid_data = 8'b10010110; // DATA0
		for(i = 0; i < 8; i++) begin
			temp_tb_pid_data[7-i] = tb_pid_data[i];
		end
		tb_pid_data = temp_tb_pid_data;
		tb_d_prev = tb_d_plus_in;
		foreach(tb_pid_data[i]) begin
			if (tb_pid_data[i] == 0)
			begin
				tb_d_plus_in = !tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
				tb_d_prev = !tb_d_prev;
			end else if (tb_pid_data[i] == 1)
			begin
				tb_d_plus_in = tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
			end
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
		end
		//send IN CRC5 bits
		tb_crc5_data = 5'b01010; //00111100 DATA0
		for(i = 0; i < 6; i++) begin
			temp_tb_crc5_data[4-i] = tb_crc5_data[i];
		end
		tb_crc5_data = temp_tb_crc5_data;
		tb_d_prev = tb_d_plus_in;
		foreach(tb_crc5_data[i]) begin
			if (tb_crc5_data[i] == 0)
			begin
				tb_d_plus_in = !tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
				tb_d_prev = !tb_d_prev;
			end else if (tb_crc5_data[i] == 1)
			begin
				tb_d_plus_in = tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
			end
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
		end
		// send EOP and then IDLE
		tb_d_plus_in = 0;
		tb_d_minus_in = 0;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_d_plus_in = 1;
		tb_d_minus_in = 0;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);

		// Data packet
		// advance to receive sync
		@(posedge tb_clk);
		tb_d_plus_in = 0;
		tb_d_minus_in = 1;
		@(posedge tb_clk);
		tb_d_plus_in = 1;
		tb_d_minus_in = 0;

		// send sync byte
		tb_sync_data = 8'b10000000; //00111100 DATA0
		for(i = 0; i < 8; i++) begin
			temp_tb_sync_data[7-i] = tb_sync_data[i];
		end
		tb_sync_data = temp_tb_sync_data;
		tb_d_prev = tb_d_plus_in;
		foreach(tb_sync_data[i]) begin
			if (tb_sync_data[i] == 0)
			begin
				tb_d_plus_in = !tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
				tb_d_prev = !tb_d_prev;
			end else if (tb_sync_data[i] == 1)
			begin
				tb_d_plus_in = tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
			end
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
		end

		// send IN PID byte
		tb_pid_data = 8'b00111100; //00111100 DATA0
		for(i = 0; i < 8; i++) begin
			temp_tb_pid_data[7-i] = tb_pid_data[i];
		end
		tb_pid_data = temp_tb_pid_data;
		tb_d_prev = tb_d_plus_in;
		foreach(tb_pid_data[i]) begin
			if (tb_pid_data[i] == 0)
			begin
				tb_d_plus_in = !tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
				tb_d_prev = !tb_d_prev;
			end else if (tb_pid_data[i] == 1)
			begin
				tb_d_plus_in = tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
			end
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
		end

		// send Data 8 byte
		tb_data_data = 64'b0000000000000000111111111111111100000000000000001111111111111111; //00111100 DATA0
		for(i = 0; i < 64; i++) begin
			temp_tb_data_data[63-i] = tb_data_data[i];
		end
		tb_data_data = temp_tb_data_data;
		tb_d_prev = tb_d_plus_in;
		foreach(tb_data_data[i]) begin
			if (tb_data_data[i] == 0)
			begin
				tb_d_plus_in = !tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
				tb_d_prev = !tb_d_prev;
			end else if (tb_data_data[i] == 1)
			begin
				tb_d_plus_in = tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
			end
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
		end

		// send CRC16 bytes
		tb_crc16_data = 16'b1000000011010101; //00111100 DATA0
		for(i = 0; i < 16; i++) begin
			temp_tb_crc16_data[15-i] = tb_crc16_data[i];
		end
		tb_crc16_data = temp_tb_crc16_data;
		tb_d_prev = tb_d_plus_in;
		foreach(tb_crc16_data[i]) begin
			if (tb_crc16_data[i] == 0)
			begin
				tb_d_plus_in = !tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
				tb_d_prev = !tb_d_prev;
			end else if (tb_crc16_data[i] == 1)
			begin
				tb_d_plus_in = tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
			end
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
		end

		// send EOP and then IDLE
		tb_d_plus_in = 0;
		tb_d_minus_in = 0;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_d_plus_in = 1;
		tb_d_minus_in = 0;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);

		// Handshake Packet
		// advance to receive sync
		@(posedge tb_clk);
		tb_d_plus_in = 0;
		tb_d_minus_in = 1;
		@(posedge tb_clk);
		tb_d_plus_in = 1;
		tb_d_minus_in = 0;

		//send sync byte
		tb_sync_data = 8'b10000000; //00111100 DATA0
		for(i = 0; i < 8; i++) begin
			temp_tb_sync_data[7-i] = tb_sync_data[i];
		end
		tb_sync_data = temp_tb_sync_data;
		tb_d_prev = tb_d_plus_in;
		foreach(tb_sync_data[i]) begin
			if (tb_sync_data[i] == 0)
			begin
				tb_d_plus_in = !tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
				tb_d_prev = !tb_d_prev;
			end else if (tb_sync_data[i] == 1)
			begin
				tb_d_plus_in = tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
			end
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
		end

		//send IN PID byte
		tb_pid_data = 8'b00101101; // 10010110
		for(i = 0; i < 8; i++) begin
			temp_tb_pid_data[7-i] = tb_pid_data[i];
		end
		tb_pid_data = temp_tb_pid_data;
		tb_d_prev = tb_d_plus_in;
		foreach(tb_pid_data[i]) begin
			if (tb_pid_data[i] == 0)
			begin
				tb_d_plus_in = !tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
				tb_d_prev = !tb_d_prev;
			end else if (tb_pid_data[i] == 1)
			begin
				tb_d_plus_in = tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
			end
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
		end

		// send EOP and then IDLE
		tb_d_plus_in = 0;
		tb_d_minus_in = 0;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_d_plus_in = 1;
		tb_d_minus_in = 0;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);

		// do asynch reset
		@(negedge tb_clk);
		tb_n_rst = 0;
		@(posedge tb_clk);
		tb_n_rst = 1;
	
		//NOMINAL CASE #3 -- ERROR IN CRC DATA
		// Token Packet
		// advance to receive sync
		@(posedge tb_clk);
		tb_d_plus_in = 0;
		tb_d_minus_in = 1;
		@(posedge tb_clk);
		tb_d_plus_in = 1;
		tb_d_minus_in = 0;

		//send sync byte
		tb_sync_data = 8'b10000000; // DATA0
		for(i = 0; i < 8; i++) begin
			temp_tb_sync_data[7-i] = tb_sync_data[i];
		end
		tb_sync_data = temp_tb_sync_data;
		tb_d_prev = tb_d_plus_in;
		foreach(tb_sync_data[i]) begin
			if (tb_sync_data[i] == 0)
			begin
				tb_d_plus_in = !tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
				tb_d_prev = !tb_d_prev;
			end else if (tb_sync_data[i] == 1)
			begin
				tb_d_plus_in = tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
			end
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
		end
		//send IN PID byte
		tb_pid_data = 8'b10010110; // DATA0
		for(i = 0; i < 8; i++) begin
			temp_tb_pid_data[7-i] = tb_pid_data[i];
		end
		tb_pid_data = temp_tb_pid_data;
		tb_d_prev = tb_d_plus_in;
		foreach(tb_pid_data[i]) begin
			if (tb_pid_data[i] == 0)
			begin
				tb_d_plus_in = !tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
				tb_d_prev = !tb_d_prev;
			end else if (tb_pid_data[i] == 1)
			begin
				tb_d_plus_in = tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
			end
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
		end
		//send IN CRC5 bits
		tb_crc5_data = 5'b10000; //00111100 WRONG CRC
		for(i = 0; i < 6; i++) begin
			temp_tb_crc5_data[4-i] = tb_crc5_data[i];
		end
		tb_crc5_data = temp_tb_crc5_data;
		tb_d_prev = tb_d_plus_in;
		foreach(tb_crc5_data[i]) begin
			if (tb_crc5_data[i] == 0)
			begin
				tb_d_plus_in = !tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
				tb_d_prev = !tb_d_prev;
			end else if (tb_crc5_data[i] == 1)
			begin
				tb_d_plus_in = tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
			end
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
		end
		// send EOP and then IDLE
		tb_d_plus_in = 0;
		tb_d_minus_in = 0;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_d_plus_in = 1;
		tb_d_minus_in = 0;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);

		// Data packet
		// advance to receive sync
		@(posedge tb_clk);
		tb_d_plus_in = 0;
		tb_d_minus_in = 1;
		@(posedge tb_clk);
		tb_d_plus_in = 1;
		tb_d_minus_in = 0;

		// send sync byte
		tb_sync_data = 8'b10000000; //00111100 DATA0
		for(i = 0; i < 8; i++) begin
			temp_tb_sync_data[7-i] = tb_sync_data[i];
		end
		tb_sync_data = temp_tb_sync_data;
		tb_d_prev = tb_d_plus_in;
		foreach(tb_sync_data[i]) begin
			if (tb_sync_data[i] == 0)
			begin
				tb_d_plus_in = !tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
				tb_d_prev = !tb_d_prev;
			end else if (tb_sync_data[i] == 1)
			begin
				tb_d_plus_in = tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
			end
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
		end

		// send IN PID byte
		tb_pid_data = 8'b00111100; //00111100 DATA0
		for(i = 0; i < 8; i++) begin
			temp_tb_pid_data[7-i] = tb_pid_data[i];
		end
		tb_pid_data = temp_tb_pid_data;
		tb_d_prev = tb_d_plus_in;
		foreach(tb_pid_data[i]) begin
			if (tb_pid_data[i] == 0)
			begin
				tb_d_plus_in = !tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
				tb_d_prev = !tb_d_prev;
			end else if (tb_pid_data[i] == 1)
			begin
				tb_d_plus_in = tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
			end
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
		end

		// send Data 8 byte
		tb_data_data = 64'b0000000000000000111111111111111100000000000000001111111111111111; //00111100 DATA0
		for(i = 0; i < 64; i++) begin
			temp_tb_data_data[63-i] = tb_data_data[i];
		end
		tb_data_data = temp_tb_data_data;
		tb_d_prev = tb_d_plus_in;
		foreach(tb_data_data[i]) begin
			if (tb_data_data[i] == 0)
			begin
				tb_d_plus_in = !tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
				tb_d_prev = !tb_d_prev;
			end else if (tb_data_data[i] == 1)
			begin
				tb_d_plus_in = tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
			end
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
		end

		// send CRC16 bytes
		tb_crc16_data = 16'b1000000011010101; //00111100 DATA0
		for(i = 0; i < 16; i++) begin
			temp_tb_crc16_data[15-i] = tb_crc16_data[i];
		end
		tb_crc16_data = temp_tb_crc16_data;
		tb_d_prev = tb_d_plus_in;
		foreach(tb_crc16_data[i]) begin
			if (tb_crc16_data[i] == 0)
			begin
				tb_d_plus_in = !tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
				tb_d_prev = !tb_d_prev;
			end else if (tb_crc16_data[i] == 1)
			begin
				tb_d_plus_in = tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
			end
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
		end

		// send EOP and then IDLE
		tb_d_plus_in = 0;
		tb_d_minus_in = 0;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_d_plus_in = 1;
		tb_d_minus_in = 0;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);

		// Handshake Packet
		// advance to receive sync
		@(posedge tb_clk);
		tb_d_plus_in = 0;
		tb_d_minus_in = 1;
		@(posedge tb_clk);
		tb_d_plus_in = 1;
		tb_d_minus_in = 0;

		//send sync byte
		tb_sync_data = 8'b10000000; //00111100 DATA0
		for(i = 0; i < 8; i++) begin
			temp_tb_sync_data[7-i] = tb_sync_data[i];
		end
		tb_sync_data = temp_tb_sync_data;
		tb_d_prev = tb_d_plus_in;
		foreach(tb_sync_data[i]) begin
			if (tb_sync_data[i] == 0)
			begin
				tb_d_plus_in = !tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
				tb_d_prev = !tb_d_prev;
			end else if (tb_sync_data[i] == 1)
			begin
				tb_d_plus_in = tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
			end
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
		end

		//send IN PID byte
		tb_pid_data = 8'b00101101; // 10010110
		for(i = 0; i < 8; i++) begin
			temp_tb_pid_data[7-i] = tb_pid_data[i];
		end
		tb_pid_data = temp_tb_pid_data;
		tb_d_prev = tb_d_plus_in;
		foreach(tb_pid_data[i]) begin
			if (tb_pid_data[i] == 0)
			begin
				tb_d_plus_in = !tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
				tb_d_prev = !tb_d_prev;
			end else if (tb_pid_data[i] == 1)
			begin
				tb_d_plus_in = tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
			end
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
		end

		// send EOP and then IDLE
		tb_d_plus_in = 0;
		tb_d_minus_in = 0;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_d_plus_in = 1;
		tb_d_minus_in = 0;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);

	// do asynch reset
		@(negedge tb_clk);
		tb_n_rst = 0;
		@(posedge tb_clk);
		tb_n_rst = 1;

	//NOMINAL CASE #4 ERROR IN DATA CASE (BAD DATA)
		// Token Packet
		// advance to receive sync
		@(posedge tb_clk);
		tb_d_plus_in = 0;
		tb_d_minus_in = 1;
		@(posedge tb_clk);
		tb_d_plus_in = 1;
		tb_d_minus_in = 0;

		//send sync byte
		tb_sync_data = 8'b10000000; // DATA0
		for(i = 0; i < 8; i++) begin
			temp_tb_sync_data[7-i] = tb_sync_data[i];
		end
		tb_sync_data = temp_tb_sync_data;
		tb_d_prev = tb_d_plus_in;
		foreach(tb_sync_data[i]) begin
			if (tb_sync_data[i] == 0)
			begin
				tb_d_plus_in = !tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
				tb_d_prev = !tb_d_prev;
			end else if (tb_sync_data[i] == 1)
			begin
				tb_d_plus_in = tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
			end
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
		end
		//send IN PID byte
		tb_pid_data = 8'b10010110; // DATA0
		for(i = 0; i < 8; i++) begin
			temp_tb_pid_data[7-i] = tb_pid_data[i];
		end
		tb_pid_data = temp_tb_pid_data;
		tb_d_prev = tb_d_plus_in;
		foreach(tb_pid_data[i]) begin
			if (tb_pid_data[i] == 0)
			begin
				tb_d_plus_in = !tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
				tb_d_prev = !tb_d_prev;
			end else if (tb_pid_data[i] == 1)
			begin
				tb_d_plus_in = tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
			end
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
		end
		//send IN CRC5 bits
		tb_crc5_data = 5'b01010; //00111100 DATA0
		for(i = 0; i < 6; i++) begin
			temp_tb_crc5_data[4-i] = tb_crc5_data[i];
		end
		tb_crc5_data = temp_tb_crc5_data;
		tb_d_prev = tb_d_plus_in;
		foreach(tb_crc5_data[i]) begin
			if (tb_crc5_data[i] == 0)
			begin
				tb_d_plus_in = !tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
				tb_d_prev = !tb_d_prev;
			end else if (tb_crc5_data[i] == 1)
			begin
				tb_d_plus_in = tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
			end
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
		end
		// send EOP and then IDLE
		tb_d_plus_in = 0;
		tb_d_minus_in = 0;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_d_plus_in = 1;
		tb_d_minus_in = 0;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);

		// Data packet
		// advance to receive sync
		@(posedge tb_clk);
		tb_d_plus_in = 0;
		tb_d_minus_in = 1;
		@(posedge tb_clk);
		tb_d_plus_in = 1;
		tb_d_minus_in = 0;

		// send sync byte
		tb_sync_data = 8'b10000000; //00111100 DATA0
		for(i = 0; i < 8; i++) begin
			temp_tb_sync_data[7-i] = tb_sync_data[i];
		end
		tb_sync_data = temp_tb_sync_data;
		tb_d_prev = tb_d_plus_in;
		foreach(tb_sync_data[i]) begin
			if (tb_sync_data[i] == 0)
			begin
				tb_d_plus_in = !tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
				tb_d_prev = !tb_d_prev;
			end else if (tb_sync_data[i] == 1)
			begin
				tb_d_plus_in = tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
			end
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
		end

		// send IN PID byte
		tb_pid_data = 8'b00111100; //00111100 DATA0
		for(i = 0; i < 8; i++) begin
			temp_tb_pid_data[7-i] = tb_pid_data[i];
		end
		tb_pid_data = temp_tb_pid_data;
		tb_d_prev = tb_d_plus_in;
		foreach(tb_pid_data[i]) begin
			if (tb_pid_data[i] == 0)
			begin
				tb_d_plus_in = !tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
				tb_d_prev = !tb_d_prev;
			end else if (tb_pid_data[i] == 1)
			begin
				tb_d_plus_in = tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
			end
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
		end

		// send Data 8 byte
		tb_data_data = 64'b0000000000000000111111111111111100000000000000001111111111111110; //bad data
		for(i = 0; i < 64; i++) begin
			temp_tb_data_data[63-i] = tb_data_data[i];
		end
		tb_data_data = temp_tb_data_data;
		tb_d_prev = tb_d_plus_in;
		foreach(tb_data_data[i]) begin
			if (tb_data_data[i] == 0)
			begin
				tb_d_plus_in = !tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
				tb_d_prev = !tb_d_prev;
			end else if (tb_data_data[i] == 1)
			begin
				tb_d_plus_in = tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
			end
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
		end

		// send CRC16 bytes
		tb_crc16_data = 16'b1000000011010101; //00111100 DATA0
		for(i = 0; i < 16; i++) begin
			temp_tb_crc16_data[15-i] = tb_crc16_data[i];
		end
		tb_crc16_data = temp_tb_crc16_data;
		tb_d_prev = tb_d_plus_in;
		foreach(tb_crc16_data[i]) begin
			if (tb_crc16_data[i] == 0)
			begin
				tb_d_plus_in = !tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
				tb_d_prev = !tb_d_prev;
			end else if (tb_crc16_data[i] == 1)
			begin
				tb_d_plus_in = tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
			end
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
		end

		// send EOP and then IDLE
		tb_d_plus_in = 0;
		tb_d_minus_in = 0;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_d_plus_in = 1;
		tb_d_minus_in = 0;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);

		// Handshake Packet
		// advance to receive sync
		@(posedge tb_clk);
		tb_d_plus_in = 0;
		tb_d_minus_in = 1;
		@(posedge tb_clk);
		tb_d_plus_in = 1;
		tb_d_minus_in = 0;

		//send sync byte
		tb_sync_data = 8'b10000000; //00111100 DATA0
		for(i = 0; i < 8; i++) begin
			temp_tb_sync_data[7-i] = tb_sync_data[i];
		end
		tb_sync_data = temp_tb_sync_data;
		tb_d_prev = tb_d_plus_in;
		foreach(tb_sync_data[i]) begin
			if (tb_sync_data[i] == 0)
			begin
				tb_d_plus_in = !tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
				tb_d_prev = !tb_d_prev;
			end else if (tb_sync_data[i] == 1)
			begin
				tb_d_plus_in = tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
			end
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
		end

		//send IN PID byte
		tb_pid_data = 8'b00101101; // 10010110
		for(i = 0; i < 8; i++) begin
			temp_tb_pid_data[7-i] = tb_pid_data[i];
		end
		tb_pid_data = temp_tb_pid_data;
		tb_d_prev = tb_d_plus_in;
		foreach(tb_pid_data[i]) begin
			if (tb_pid_data[i] == 0)
			begin
				tb_d_plus_in = !tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
				tb_d_prev = !tb_d_prev;
			end else if (tb_pid_data[i] == 1)
			begin
				tb_d_plus_in = tb_d_prev;
				tb_d_minus_in = !tb_d_plus_in;
			end
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
		end

		// send EOP and then IDLE
		tb_d_plus_in = 0;
		tb_d_minus_in = 0;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_d_plus_in = 1;
		tb_d_minus_in = 0;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);

	end
endmodule
