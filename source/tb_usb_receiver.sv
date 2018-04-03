// 337 Lab 6 Testbench EOP Detect
// This code serves as a starer test bench for the synchronizer design

`timescale 1ns / 10ps

module tb_usb_receiver();

	// Define local parameters used by the test bench
	localparam	CLK_PERIOD	= 10.5;
	localparam	CHECK_DELAY = 1;

	// Declare DUT portmap signals
	reg tb_clk; // input
	reg tb_n_rst; // input
	reg tb_d_plus; // input
	reg tb_d_minus; // input
	reg tb_r_enable; // input
	reg [7:0] tb_r_data;
	reg tb_empty;
	reg tb_full;
	reg tb_rcving;
	reg tb_r_error;
	reg [7:0] tb_d_data;

	// Clock generation block
	always
	begin
		tb_clk = 1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD/2.0);
	end
	
	// DUT Port map
	usb_receiver DUT(.clk(tb_clk), .n_rst(tb_n_rst), .d_plus(tb_d_plus), .d_minus(tb_d_minus), .r_enable(tb_r_enable), .r_data(tb_r_data), .empty(tb_empty), .full(tb_full), .rcving(tb_rcving), .r_error(tb_r_error));
	
	// Test bench main process
	initial
	begin
		// initialize
		tb_n_rst = 0;
		tb_d_plus = 1;
		tb_d_minus = 0;
		tb_r_enable = 0;
	
		// do asynch reset
		@(negedge tb_clk);
		tb_n_rst = 0;
		@(posedge tb_clk);
		tb_n_rst = 1;

		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		
		//send bad sync byte
		tb_d_data = 8'b01010101; //00000000

		foreach(tb_d_data[i]) begin
			tb_d_plus = tb_d_data[i];
			tb_d_minus = !tb_d_data[i];
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
		end

		//send packet data
		tb_d_data = 8'b00110101; //00001011
		
		foreach(tb_d_data[i]) begin
			tb_d_plus = tb_d_data[i];
			tb_d_minus = !tb_d_data[i];
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
		end
		
		tb_r_enable = 1;
		@(posedge tb_clk);
		tb_r_enable = 0;

		tb_d_data = 8'b10010010; //00001011
		
		foreach(tb_d_data[i]) begin
			tb_d_plus = tb_d_data[i];
			tb_d_minus = !tb_d_data[i];
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
		end

		//send eop & idle
		tb_d_plus = 0;
		tb_d_minus = 0;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_d_plus = 1;
		tb_d_minus = 0;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);


		tb_r_enable = 1;
		@(posedge tb_clk);
		tb_r_enable = 0;


		//send sync byte
		tb_d_data = 8'b01010100; //10000000

		foreach(tb_d_data[i]) begin
			tb_d_plus = tb_d_data[i];
			tb_d_minus = !tb_d_data[i];
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
		end

		//send incomplete packet data
		//tb_d_data = 4'b0110; //0010
		
		tb_d_plus = 0;
		tb_d_minus = 1;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);

		tb_d_plus = 1;
		tb_d_minus = 0;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);

		tb_d_plus = 0;
		tb_d_minus = 1;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);

		tb_d_plus = 1;
		tb_d_minus = 0;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		
		tb_d_plus = 0;
		tb_d_minus = 1;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);

		//send eop & idle
		tb_d_plus = 0;
		tb_d_minus = 0;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_d_plus = 1;
		tb_d_minus = 0;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);


		tb_r_enable = 1;
		@(posedge tb_clk);
		tb_r_enable = 0;


		//send sync byte 3rd case
		tb_d_data = 8'b01010100; //10000000

		foreach(tb_d_data[i]) begin
			tb_d_plus = tb_d_data[i];
			tb_d_minus = !tb_d_data[i];
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
		end

		//send packet data
		tb_d_data = 8'b10100010; //00011000
		
		foreach(tb_d_data[i]) begin
			tb_d_plus = tb_d_data[i];
			tb_d_minus = !tb_d_data[i];
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
			@(posedge tb_clk);
		end
		
		//send eop & idle
		tb_d_plus = 0;
		tb_d_minus = 0;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_d_plus = 1;
		tb_d_minus = 0;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);


		tb_r_enable = 1;
		@(posedge tb_clk);
		tb_r_enable = 0;
	end
endmodule
