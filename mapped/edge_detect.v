/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Feb 20 00:11:50 2018
/////////////////////////////////////////////////////////////


module edge_detect ( clk, n_rst, d_plus, d_edge );
  input clk, n_rst, d_plus;
  output d_edge;
  wire   d_prev, d_current;

  DFFSR d_current_reg ( .D(d_plus), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        d_current) );
  DFFSR d_prev_reg ( .D(d_current), .CLK(clk), .R(n_rst), .S(1'b1), .Q(d_prev)
         );
  XOR2X1 U6 ( .A(d_prev), .B(d_current), .Y(d_edge) );
endmodule

