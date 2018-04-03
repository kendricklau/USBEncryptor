/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Feb 20 00:18:02 2018
/////////////////////////////////////////////////////////////


module decode ( clk, n_rst, d_plus, shift_enable, eop, d_orig );
  input clk, n_rst, d_plus, shift_enable, eop;
  output d_orig;
  wire   stored_bit, current_bit, next_current_bit, n4, n6;

  DFFSR current_bit_reg ( .D(next_current_bit), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(current_bit) );
  DFFSR stored_bit_reg ( .D(n4), .CLK(clk), .R(1'b1), .S(n_rst), .Q(stored_bit) );
  INVX1 U10 ( .A(n6), .Y(n4) );
  MUX2X1 U11 ( .B(stored_bit), .A(next_current_bit), .S(shift_enable), .Y(n6)
         );
  OR2X1 U12 ( .A(d_plus), .B(eop), .Y(next_current_bit) );
  XOR2X1 U13 ( .A(stored_bit), .B(current_bit), .Y(d_orig) );
endmodule

