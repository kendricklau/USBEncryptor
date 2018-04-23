/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Sun Apr 22 23:22:29 2018
/////////////////////////////////////////////////////////////


module round_counter ( clk, n_rst, count_enable, round_count, cnt_rollover );
  output [4:0] round_count;
  input clk, n_rst, count_enable;
  output cnt_rollover;
  wire   n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48;

  DFFSR \count_reg_reg[0]  ( .D(n27), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        round_count[0]) );
  DFFSR \count_reg_reg[4]  ( .D(n23), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        round_count[4]) );
  DFFSR rollover_reg_reg ( .D(n22), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        cnt_rollover) );
  DFFSR \count_reg_reg[3]  ( .D(n24), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        round_count[3]) );
  DFFSR \count_reg_reg[2]  ( .D(n25), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        round_count[2]) );
  DFFSR \count_reg_reg[1]  ( .D(n26), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        round_count[1]) );
  OAI21X1 U30 ( .A(count_enable), .B(n28), .C(n29), .Y(n27) );
  OAI21X1 U31 ( .A(count_enable), .B(n30), .C(n31), .Y(n26) );
  OAI21X1 U32 ( .A(count_enable), .B(n32), .C(n33), .Y(n25) );
  OAI21X1 U33 ( .A(count_enable), .B(n34), .C(n35), .Y(n24) );
  OAI21X1 U34 ( .A(count_enable), .B(n36), .C(n37), .Y(n23) );
  OAI22X1 U35 ( .A(count_enable), .B(n38), .C(n39), .D(n40), .Y(n22) );
  NAND2X1 U36 ( .A(n41), .B(n35), .Y(n40) );
  NAND2X1 U37 ( .A(n42), .B(n43), .Y(n35) );
  XNOR2X1 U38 ( .A(round_count[3]), .B(n44), .Y(n43) );
  INVX1 U39 ( .A(n37), .Y(n41) );
  NAND2X1 U40 ( .A(n42), .B(n45), .Y(n37) );
  XNOR2X1 U41 ( .A(n36), .B(n46), .Y(n45) );
  NOR2X1 U42 ( .A(n34), .B(n44), .Y(n46) );
  INVX1 U43 ( .A(round_count[3]), .Y(n34) );
  INVX1 U44 ( .A(round_count[4]), .Y(n36) );
  NAND3X1 U45 ( .A(n31), .B(n29), .C(n33), .Y(n39) );
  NAND3X1 U46 ( .A(n47), .B(n44), .C(n42), .Y(n33) );
  NAND3X1 U47 ( .A(round_count[1]), .B(round_count[0]), .C(round_count[2]), 
        .Y(n44) );
  OAI21X1 U48 ( .A(n28), .B(n30), .C(n32), .Y(n47) );
  INVX1 U49 ( .A(round_count[2]), .Y(n32) );
  NAND2X1 U50 ( .A(n42), .B(n28), .Y(n29) );
  INVX1 U51 ( .A(round_count[0]), .Y(n28) );
  NAND2X1 U52 ( .A(n42), .B(n48), .Y(n31) );
  XNOR2X1 U53 ( .A(n30), .B(round_count[0]), .Y(n48) );
  INVX1 U54 ( .A(round_count[1]), .Y(n30) );
  AND2X1 U55 ( .A(count_enable), .B(n38), .Y(n42) );
  INVX1 U56 ( .A(cnt_rollover), .Y(n38) );
endmodule

