// 337 Lab 6 Testbench EOP Detect
// This code serves as a starer test bench for the synchronizer design

`timescale 1ns / 10ps

module tb_eop_detect();

	// Define local parameters used by the test bench
	
	// Declare DUT portmap signals
	reg tb_d_plus;
	reg tb_d_minus;
	reg tb_eop;
	
	// Declare test bench signals
	integer tb_test_num;
	
	// Clock generation block
	
	// DUT Port map
	eop_detect DUT(.d_plus(tb_d_plus), .d_minus(tb_d_minus), .eop(tb_eop));
	
	// Test bench main process
	initial
	begin
		
		tb_d_plus = 1;
		tb_d_minus = 1;
		#(1); 
		tb_d_plus = 1;
		tb_d_minus = 0;
		#(1); 
		tb_d_plus = 0;
		tb_d_minus = 1;
		#(1); 
		tb_d_plus = 0;
		tb_d_minus = 0;
		#(1);

		tb_d_plus = 1;
		tb_d_minus = 1;
		#(1); 
		tb_d_plus = 1;
		tb_d_minus = 0;
		#(1); 
		tb_d_plus = 0;
		tb_d_minus = 0;
		#(1); 
		tb_d_plus = 0;
		tb_d_minus = 1;
		#(1);

		tb_d_plus = 1;
		tb_d_minus = 1;
		#(1); 
		tb_d_plus = 0;
		tb_d_minus = 1;
		#(1); 
		tb_d_plus = 1;
		tb_d_minus = 0;
		#(1); 
		tb_d_plus = 0;
		tb_d_minus = 0;
		#(1);

		tb_d_plus = 1;
		tb_d_minus = 1;
		#(1); 
		tb_d_plus = 0;
		tb_d_minus = 1;
		#(1); 
		tb_d_plus = 0;
		tb_d_minus = 0;
		#(1); 
		tb_d_plus = 1;
		tb_d_minus = 0;
		#(1);

		tb_d_plus = 1;
		tb_d_minus = 1;
		#(1); 
		tb_d_plus = 0;
		tb_d_minus = 0;
		#(1); 
		tb_d_plus = 1;
		tb_d_minus = 0;
		#(1); 
		tb_d_plus = 0;
		tb_d_minus = 1;
		#(1);

		tb_d_plus = 1;
		tb_d_minus = 1;
		#(1); 
		tb_d_plus = 0;
		tb_d_minus = 0;
		#(1); 
		tb_d_plus = 0;
		tb_d_minus = 1;
		#(1); 
		tb_d_plus = 1;
		tb_d_minus = 0;
		#(1);

		tb_d_plus = 1;
		tb_d_minus = 0;
		#(1); 
		tb_d_plus = 1;
		tb_d_minus = 1;
		#(1); 
		tb_d_plus = 0;
		tb_d_minus = 1;
		#(1); 
		tb_d_plus = 0;
		tb_d_minus = 0;
		#(1);

		tb_d_plus = 1;
		tb_d_minus = 0;
		#(1); 
		tb_d_plus = 1;
		tb_d_minus = 1;
		#(1); 
		tb_d_plus = 0;
		tb_d_minus = 0;
		#(1); 
		tb_d_plus = 0;
		tb_d_minus = 1;
		#(1);

		tb_d_plus = 1;
		tb_d_minus = 0;
		#(1); 
		tb_d_plus = 0;
		tb_d_minus = 1;
		#(1); 
		tb_d_plus = 1;
		tb_d_minus = 1;
		#(1); 
		tb_d_plus = 0;
		tb_d_minus = 0;
		#(1);

		tb_d_plus = 1;
		tb_d_minus = 0;
		#(1); 
		tb_d_plus = 0;
		tb_d_minus = 1;
		#(1); 
		tb_d_plus = 0;
		tb_d_minus = 0;
		#(1); 
		tb_d_plus = 1;
		tb_d_minus = 1;
		#(1);

		tb_d_plus = 1;
		tb_d_minus = 0;
		#(1); 
		tb_d_plus = 0;
		tb_d_minus = 0;
		#(1); 
		tb_d_plus = 1;
		tb_d_minus = 1;
		#(1); 
		tb_d_plus = 0;
		tb_d_minus = 1;
		#(1);

		tb_d_plus = 1;
		tb_d_minus = 0;
		#(1); 
		tb_d_plus = 0;
		tb_d_minus = 0;
		#(1); 
		tb_d_plus = 0;
		tb_d_minus = 1;
		#(1); 
		tb_d_plus = 1;
		tb_d_minus = 1;
		#(1);

		tb_d_plus = 0;
		tb_d_minus = 1;
		#(1); 
		tb_d_plus = 1;
		tb_d_minus = 1;
		#(1); 
		tb_d_plus = 1;
		tb_d_minus = 0;
		#(1); 
		tb_d_plus = 0;
		tb_d_minus = 0;
		#(1);

		tb_d_plus = 0;
		tb_d_minus = 1;
		#(1); 
		tb_d_plus = 1;
		tb_d_minus = 1;
		#(1); 
		tb_d_plus = 0;
		tb_d_minus = 0;
		#(1); 
		tb_d_plus = 1;
		tb_d_minus = 0;
		#(1);

		tb_d_plus = 0;
		tb_d_minus = 1;
		#(1); 
		tb_d_plus = 1;
		tb_d_minus = 0;
		#(1); 
		tb_d_plus = 1;
		tb_d_minus = 1;
		#(1); 
		tb_d_plus = 0;
		tb_d_minus = 0;
		#(1);

		tb_d_plus = 0;
		tb_d_minus = 1;
		#(1); 
		tb_d_plus = 1;
		tb_d_minus = 0;
		#(1); 
		tb_d_plus = 0;
		tb_d_minus = 0;
		#(1); 
		tb_d_plus = 1;
		tb_d_minus = 1;
		#(1);

		tb_d_plus = 0;
		tb_d_minus = 1;
		#(1); 
		tb_d_plus = 0;
		tb_d_minus = 0;
		#(1); 
		tb_d_plus = 1;
		tb_d_minus = 1;
		#(1); 
		tb_d_plus = 1;
		tb_d_minus = 0;
		#(1);

		tb_d_plus = 0;
		tb_d_minus = 1;
		#(1); 
		tb_d_plus = 0;
		tb_d_minus = 0;
		#(1); 
		tb_d_plus = 1;
		tb_d_minus = 0;
		#(1); 
		tb_d_plus = 1;
		tb_d_minus = 1;
		#(1);

		tb_d_plus = 0;
		tb_d_minus = 0;
		#(1); 
		tb_d_plus = 1;
		tb_d_minus = 1;
		#(1); 
		tb_d_plus = 1;
		tb_d_minus = 0;
		#(1); 
		tb_d_plus = 0;
		tb_d_minus = 1;
		#(1);

		tb_d_plus = 0;
		tb_d_minus = 0;
		#(1); 
		tb_d_plus = 1;
		tb_d_minus = 1;
		#(1); 
		tb_d_plus = 0;
		tb_d_minus = 1;
		#(1); 
		tb_d_plus = 1;
		tb_d_minus = 0;
		#(1);

		tb_d_plus = 0;
		tb_d_minus = 0;
		#(1); 
		tb_d_plus = 1;
		tb_d_minus = 0;
		#(1); 
		tb_d_plus = 1;
		tb_d_minus = 1;
		#(1); 
		tb_d_plus = 0;
		tb_d_minus = 1;
		#(1);

		tb_d_plus = 0;
		tb_d_minus = 0;
		#(1); 
		tb_d_plus = 1;
		tb_d_minus = 0;
		#(1); 
		tb_d_plus = 0;
		tb_d_minus = 1;
		#(1); 
		tb_d_plus = 1;
		tb_d_minus = 1;
		#(1);

		tb_d_plus = 0;
		tb_d_minus = 0;
		#(1); 
		tb_d_plus = 0;
		tb_d_minus = 1;
		#(1); 
		tb_d_plus = 1;
		tb_d_minus = 1;
		#(1); 
		tb_d_plus = 1;
		tb_d_minus = 0;
		#(1);

		tb_d_plus = 0;
		tb_d_minus = 0;
		#(1); 
		tb_d_plus = 0;
		tb_d_minus = 1;
		#(1); 
		tb_d_plus = 1;
		tb_d_minus = 0;
		#(1); 
		tb_d_plus = 1;
		tb_d_minus = 1;
		#(1);


		tb_d_plus = 1;
		tb_d_minus = 1;
		#(4); 
		tb_d_plus = 1;
		tb_d_minus = 0;
		#(4); 
		tb_d_plus = 0;
		tb_d_minus = 1;
		#(4); 
		tb_d_plus = 0;
		tb_d_minus = 0;
		#(4);

		tb_d_plus = 1;
		tb_d_minus = 1;
		#(4); 
		tb_d_plus = 1;
		tb_d_minus = 0;
		#(4); 
		tb_d_plus = 0;
		tb_d_minus = 0;
		#(4); 
		tb_d_plus = 0;
		tb_d_minus = 1;
		#(4);

		tb_d_plus = 1;
		tb_d_minus = 1;
		#(4); 
		tb_d_plus = 0;
		tb_d_minus = 1;
		#(4); 
		tb_d_plus = 1;
		tb_d_minus = 0;
		#(4); 
		tb_d_plus = 0;
		tb_d_minus = 0;
		#(4);

		tb_d_plus = 1;
		tb_d_minus = 1;
		#(4); 
		tb_d_plus = 0;
		tb_d_minus = 1;
		#(4); 
		tb_d_plus = 0;
		tb_d_minus = 0;
		#(4); 
		tb_d_plus = 1;
		tb_d_minus = 0;
		#(4);

		tb_d_plus = 1;
		tb_d_minus = 1;
		#(4); 
		tb_d_plus = 0;
		tb_d_minus = 0;
		#(4); 
		tb_d_plus = 1;
		tb_d_minus = 0;
		#(4); 
		tb_d_plus = 0;
		tb_d_minus = 1;
		#(4);

		tb_d_plus = 1;
		tb_d_minus = 1;
		#(4); 
		tb_d_plus = 0;
		tb_d_minus = 0;
		#(4); 
		tb_d_plus = 0;
		tb_d_minus = 1;
		#(4); 
		tb_d_plus = 1;
		tb_d_minus = 0;
		#(4);

		tb_d_plus = 1;
		tb_d_minus = 0;
		#(4); 
		tb_d_plus = 1;
		tb_d_minus = 1;
		#(4); 
		tb_d_plus = 0;
		tb_d_minus = 1;
		#(4); 
		tb_d_plus = 0;
		tb_d_minus = 0;
		#(4);

		tb_d_plus = 1;
		tb_d_minus = 0;
		#(4); 
		tb_d_plus = 1;
		tb_d_minus = 1;
		#(4); 
		tb_d_plus = 0;
		tb_d_minus = 0;
		#(4); 
		tb_d_plus = 0;
		tb_d_minus = 1;
		#(4);

		tb_d_plus = 1;
		tb_d_minus = 0;
		#(4); 
		tb_d_plus = 0;
		tb_d_minus = 1;
		#(4); 
		tb_d_plus = 1;
		tb_d_minus = 1;
		#(4); 
		tb_d_plus = 0;
		tb_d_minus = 0;
		#(4);

		tb_d_plus = 1;
		tb_d_minus = 0;
		#(4); 
		tb_d_plus = 0;
		tb_d_minus = 1;
		#(4); 
		tb_d_plus = 0;
		tb_d_minus = 0;
		#(4); 
		tb_d_plus = 1;
		tb_d_minus = 1;
		#(4);

		tb_d_plus = 1;
		tb_d_minus = 0;
		#(4); 
		tb_d_plus = 0;
		tb_d_minus = 0;
		#(4); 
		tb_d_plus = 1;
		tb_d_minus = 1;
		#(4); 
		tb_d_plus = 0;
		tb_d_minus = 1;
		#(4);

		tb_d_plus = 1;
		tb_d_minus = 0;
		#(4); 
		tb_d_plus = 0;
		tb_d_minus = 0;
		#(4); 
		tb_d_plus = 0;
		tb_d_minus = 1;
		#(4); 
		tb_d_plus = 1;
		tb_d_minus = 1;
		#(4);

		tb_d_plus = 0;
		tb_d_minus = 1;
		#(4); 
		tb_d_plus = 1;
		tb_d_minus = 1;
		#(4); 
		tb_d_plus = 1;
		tb_d_minus = 0;
		#(4); 
		tb_d_plus = 0;
		tb_d_minus = 0;
		#(4);

		tb_d_plus = 0;
		tb_d_minus = 1;
		#(4); 
		tb_d_plus = 1;
		tb_d_minus = 1;
		#(4); 
		tb_d_plus = 0;
		tb_d_minus = 0;
		#(4); 
		tb_d_plus = 1;
		tb_d_minus = 0;
		#(4);

		tb_d_plus = 0;
		tb_d_minus = 1;
		#(4); 
		tb_d_plus = 1;
		tb_d_minus = 0;
		#(4); 
		tb_d_plus = 1;
		tb_d_minus = 1;
		#(4); 
		tb_d_plus = 0;
		tb_d_minus = 0;
		#(4);

		tb_d_plus = 0;
		tb_d_minus = 1;
		#(4); 
		tb_d_plus = 1;
		tb_d_minus = 0;
		#(4); 
		tb_d_plus = 0;
		tb_d_minus = 0;
		#(4); 
		tb_d_plus = 1;
		tb_d_minus = 1;
		#(4);

		tb_d_plus = 0;
		tb_d_minus = 1;
		#(4); 
		tb_d_plus = 0;
		tb_d_minus = 0;
		#(4); 
		tb_d_plus = 1;
		tb_d_minus = 1;
		#(4); 
		tb_d_plus = 1;
		tb_d_minus = 0;
		#(4);

		tb_d_plus = 0;
		tb_d_minus = 1;
		#(4); 
		tb_d_plus = 0;
		tb_d_minus = 0;
		#(4); 
		tb_d_plus = 1;
		tb_d_minus = 0;
		#(4); 
		tb_d_plus = 1;
		tb_d_minus = 1;
		#(4);

		tb_d_plus = 0;
		tb_d_minus = 0;
		#(4); 
		tb_d_plus = 1;
		tb_d_minus = 1;
		#(4); 
		tb_d_plus = 1;
		tb_d_minus = 0;
		#(4); 
		tb_d_plus = 0;
		tb_d_minus = 1;
		#(4);

		tb_d_plus = 0;
		tb_d_minus = 0;
		#(4); 
		tb_d_plus = 1;
		tb_d_minus = 1;
		#(4); 
		tb_d_plus = 0;
		tb_d_minus = 1;
		#(4); 
		tb_d_plus = 1;
		tb_d_minus = 0;
		#(4);

		tb_d_plus = 0;
		tb_d_minus = 0;
		#(4); 
		tb_d_plus = 1;
		tb_d_minus = 0;
		#(4); 
		tb_d_plus = 1;
		tb_d_minus = 1;
		#(4); 
		tb_d_plus = 0;
		tb_d_minus = 1;
		#(4);

		tb_d_plus = 0;
		tb_d_minus = 0;
		#(4); 
		tb_d_plus = 1;
		tb_d_minus = 0;
		#(4); 
		tb_d_plus = 0;
		tb_d_minus = 1;
		#(4); 
		tb_d_plus = 1;
		tb_d_minus = 1;
		#(4);

		tb_d_plus = 0;
		tb_d_minus = 0;
		#(4); 
		tb_d_plus = 0;
		tb_d_minus = 1;
		#(4); 
		tb_d_plus = 1;
		tb_d_minus = 1;
		#(4); 
		tb_d_plus = 1;
		tb_d_minus = 0;
		#(4);

		tb_d_plus = 0;
		tb_d_minus = 0;
		#(4); 
		tb_d_plus = 0;
		tb_d_minus = 1;
		#(4); 
		tb_d_plus = 1;
		tb_d_minus = 0;
		#(4); 
		tb_d_plus = 1;
		tb_d_minus = 1;
		#(4);
				
	end
endmodule
