/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Mon Apr 23 11:54:41 2018
/////////////////////////////////////////////////////////////


module round_counter ( clk, n_rst, count_enable, round_count, cnt_rollover );
  output [4:0] round_count;
  input clk, n_rst, count_enable;
  output cnt_rollover;
  wire   n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48;

  DFFSR \count_reg_reg[0]  ( .D(n28), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        round_count[0]) );
  DFFSR rollover_reg_reg ( .D(n27), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        cnt_rollover) );
  DFFSR \count_reg_reg[3]  ( .D(n24), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        round_count[3]) );
  DFFSR \count_reg_reg[2]  ( .D(n25), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        round_count[2]) );
  DFFSR \count_reg_reg[1]  ( .D(n26), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        round_count[1]) );
  DFFSR \count_reg_reg[4]  ( .D(n23), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        round_count[4]) );
  MUX2X1 U31 ( .B(n29), .A(n30), .S(round_count[0]), .Y(n28) );
  NOR2X1 U32 ( .A(n31), .B(n32), .Y(n27) );
  NAND2X1 U33 ( .A(n33), .B(n34), .Y(n32) );
  NAND3X1 U34 ( .A(n35), .B(n36), .C(n37), .Y(n31) );
  INVX1 U35 ( .A(n38), .Y(n37) );
  MUX2X1 U36 ( .B(n39), .A(n40), .S(round_count[1]), .Y(n26) );
  INVX1 U37 ( .A(n41), .Y(n40) );
  OAI21X1 U38 ( .A(n29), .B(round_count[0]), .C(n30), .Y(n41) );
  NAND2X1 U39 ( .A(n35), .B(round_count[0]), .Y(n39) );
  OAI22X1 U40 ( .A(n33), .B(n29), .C(n30), .D(n42), .Y(n25) );
  XOR2X1 U41 ( .A(n38), .B(round_count[2]), .Y(n33) );
  OAI22X1 U42 ( .A(n30), .B(n43), .C(n34), .D(n29), .Y(n24) );
  XOR2X1 U43 ( .A(n43), .B(n44), .Y(n34) );
  INVX1 U44 ( .A(round_count[3]), .Y(n43) );
  INVX1 U45 ( .A(n45), .Y(n30) );
  INVX1 U46 ( .A(n46), .Y(n23) );
  AOI22X1 U47 ( .A(n36), .B(n35), .C(n45), .D(round_count[4]), .Y(n46) );
  NOR2X1 U48 ( .A(cnt_rollover), .B(count_enable), .Y(n45) );
  INVX1 U49 ( .A(n29), .Y(n35) );
  NAND2X1 U50 ( .A(count_enable), .B(n47), .Y(n29) );
  INVX1 U51 ( .A(cnt_rollover), .Y(n47) );
  XNOR2X1 U52 ( .A(n48), .B(round_count[4]), .Y(n36) );
  NAND2X1 U53 ( .A(round_count[3]), .B(n44), .Y(n48) );
  NOR2X1 U54 ( .A(n38), .B(n42), .Y(n44) );
  INVX1 U55 ( .A(round_count[2]), .Y(n42) );
  NAND2X1 U56 ( .A(round_count[1]), .B(round_count[0]), .Y(n38) );
endmodule

