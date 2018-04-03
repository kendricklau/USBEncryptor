/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Sat Feb 24 23:27:07 2018
/////////////////////////////////////////////////////////////


module sync_high ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   N3;

  DFFSR q_reg ( .D(async_in), .CLK(clk), .R(1'b1), .S(n_rst), .Q(N3) );
  DFFSR sync_out_reg ( .D(N3), .CLK(clk), .R(1'b1), .S(n_rst), .Q(sync_out) );
endmodule


module sync_low ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   N3;

  DFFSR q_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(N3) );
  DFFSR sync_out_reg ( .D(N3), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out) );
endmodule


module eop_detect ( d_plus, d_minus, eop );
  input d_plus, d_minus;
  output eop;


  NOR2X1 U1 ( .A(d_plus), .B(d_minus), .Y(eop) );
endmodule


module decode ( clk, n_rst, d_plus, shift_enable, eop, d_orig );
  input clk, n_rst, d_plus, shift_enable, eop;
  output d_orig;
  wire   stored_bit, current_bit, n4, n1, n2;

  DFFSR current_bit_reg ( .D(d_plus), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        current_bit) );
  DFFSR stored_bit_reg ( .D(n4), .CLK(clk), .R(1'b1), .S(n_rst), .Q(stored_bit) );
  MUX2X1 U3 ( .B(n1), .A(n2), .S(shift_enable), .Y(n4) );
  NOR2X1 U4 ( .A(d_plus), .B(eop), .Y(n2) );
  XOR2X1 U5 ( .A(n1), .B(current_bit), .Y(d_orig) );
  INVX1 U6 ( .A(stored_bit), .Y(n1) );
endmodule


module edge_detect ( clk, n_rst, d_plus, d_edge );
  input clk, n_rst, d_plus;
  output d_edge;
  wire   d_prev, d_current;

  DFFSR d_current_reg ( .D(d_plus), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        d_current) );
  DFFSR d_prev_reg ( .D(d_current), .CLK(clk), .R(1'b1), .S(n_rst), .Q(d_prev)
         );
  XOR2X1 U5 ( .A(d_prev), .B(d_current), .Y(d_edge) );
endmodule


module flex_counter_NUM_CNT_BITS32_1_DW01_inc_0 ( A, SUM );
  input [31:0] A;
  output [31:0] SUM;

  wire   [31:2] carry;

  HAX1 U1_1_30 ( .A(A[30]), .B(carry[30]), .YC(carry[31]), .YS(SUM[30]) );
  HAX1 U1_1_29 ( .A(A[29]), .B(carry[29]), .YC(carry[30]), .YS(SUM[29]) );
  HAX1 U1_1_28 ( .A(A[28]), .B(carry[28]), .YC(carry[29]), .YS(SUM[28]) );
  HAX1 U1_1_27 ( .A(A[27]), .B(carry[27]), .YC(carry[28]), .YS(SUM[27]) );
  HAX1 U1_1_26 ( .A(A[26]), .B(carry[26]), .YC(carry[27]), .YS(SUM[26]) );
  HAX1 U1_1_25 ( .A(A[25]), .B(carry[25]), .YC(carry[26]), .YS(SUM[25]) );
  HAX1 U1_1_24 ( .A(A[24]), .B(carry[24]), .YC(carry[25]), .YS(SUM[24]) );
  HAX1 U1_1_23 ( .A(A[23]), .B(carry[23]), .YC(carry[24]), .YS(SUM[23]) );
  HAX1 U1_1_22 ( .A(A[22]), .B(carry[22]), .YC(carry[23]), .YS(SUM[22]) );
  HAX1 U1_1_21 ( .A(A[21]), .B(carry[21]), .YC(carry[22]), .YS(SUM[21]) );
  HAX1 U1_1_20 ( .A(A[20]), .B(carry[20]), .YC(carry[21]), .YS(SUM[20]) );
  HAX1 U1_1_19 ( .A(A[19]), .B(carry[19]), .YC(carry[20]), .YS(SUM[19]) );
  HAX1 U1_1_18 ( .A(A[18]), .B(carry[18]), .YC(carry[19]), .YS(SUM[18]) );
  HAX1 U1_1_17 ( .A(A[17]), .B(carry[17]), .YC(carry[18]), .YS(SUM[17]) );
  HAX1 U1_1_16 ( .A(A[16]), .B(carry[16]), .YC(carry[17]), .YS(SUM[16]) );
  HAX1 U1_1_15 ( .A(A[15]), .B(carry[15]), .YC(carry[16]), .YS(SUM[15]) );
  HAX1 U1_1_14 ( .A(A[14]), .B(carry[14]), .YC(carry[15]), .YS(SUM[14]) );
  HAX1 U1_1_13 ( .A(A[13]), .B(carry[13]), .YC(carry[14]), .YS(SUM[13]) );
  HAX1 U1_1_12 ( .A(A[12]), .B(carry[12]), .YC(carry[13]), .YS(SUM[12]) );
  HAX1 U1_1_11 ( .A(A[11]), .B(carry[11]), .YC(carry[12]), .YS(SUM[11]) );
  HAX1 U1_1_10 ( .A(A[10]), .B(carry[10]), .YC(carry[11]), .YS(SUM[10]) );
  HAX1 U1_1_9 ( .A(A[9]), .B(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[31]), .B(A[31]), .Y(SUM[31]) );
endmodule


module flex_counter_NUM_CNT_BITS32_1 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [31:0] rollover_val;
  output [31:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20, N21,
         N22, N23, N24, N25, N26, N27, N28, N29, N30, N31, N32, N33, N34, N35,
         N36, N37, N38, N39, n167, n168, n169, n170, n171, n172, n173, n174,
         n175, n176, n177, n178, n179, n180, n181, n182, n183, n184, n185,
         n186, n187, n188, n189, n190, n191, n192, n193, n194, n195, n196,
         n197, n198, n199, n1, n2, n3, n4, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160;

  DFFSR \count_out_reg[0]  ( .D(n199), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR rollover_flag_reg ( .D(n198), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  DFFSR \count_out_reg[30]  ( .D(n196), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[30]) );
  DFFSR \count_out_reg[29]  ( .D(n195), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[29]) );
  DFFSR \count_out_reg[28]  ( .D(n194), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[28]) );
  DFFSR \count_out_reg[27]  ( .D(n193), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[27]) );
  DFFSR \count_out_reg[26]  ( .D(n192), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[26]) );
  DFFSR \count_out_reg[25]  ( .D(n191), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[25]) );
  DFFSR \count_out_reg[24]  ( .D(n190), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[24]) );
  DFFSR \count_out_reg[23]  ( .D(n189), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[23]) );
  DFFSR \count_out_reg[22]  ( .D(n188), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[22]) );
  DFFSR \count_out_reg[21]  ( .D(n187), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[21]) );
  DFFSR \count_out_reg[20]  ( .D(n186), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[20]) );
  DFFSR \count_out_reg[19]  ( .D(n185), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[19]) );
  DFFSR \count_out_reg[18]  ( .D(n184), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[18]) );
  DFFSR \count_out_reg[17]  ( .D(n183), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[17]) );
  DFFSR \count_out_reg[16]  ( .D(n182), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[16]) );
  DFFSR \count_out_reg[15]  ( .D(n181), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[15]) );
  DFFSR \count_out_reg[14]  ( .D(n180), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[14]) );
  DFFSR \count_out_reg[13]  ( .D(n179), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[13]) );
  DFFSR \count_out_reg[12]  ( .D(n178), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[12]) );
  DFFSR \count_out_reg[11]  ( .D(n177), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[11]) );
  DFFSR \count_out_reg[10]  ( .D(n176), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[10]) );
  DFFSR \count_out_reg[9]  ( .D(n175), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[9]) );
  DFFSR \count_out_reg[8]  ( .D(n174), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[8]) );
  DFFSR \count_out_reg[7]  ( .D(n173), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[7]) );
  DFFSR \count_out_reg[6]  ( .D(n172), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[6]) );
  DFFSR \count_out_reg[5]  ( .D(n171), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[5]) );
  DFFSR \count_out_reg[4]  ( .D(n170), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[4]) );
  DFFSR \count_out_reg[3]  ( .D(n169), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_out_reg[2]  ( .D(n168), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[1]  ( .D(n167), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[31]  ( .D(n197), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[31]) );
  flex_counter_NUM_CNT_BITS32_1_DW01_inc_0 add_35 ( .A(count_out), .SUM({N39, 
        N38, N37, N36, N35, N34, N33, N32, N31, N30, N29, N28, N27, N26, N25, 
        N24, N23, N22, N21, N20, N19, N18, N17, N16, N15, N14, N13, N12, N11, 
        N10, N9, N8}) );
  AND2X2 U36 ( .A(n44), .B(n1), .Y(n39) );
  BUFX2 U37 ( .A(n2), .Y(n1) );
  OAI21X1 U38 ( .A(n1), .B(n3), .C(n4), .Y(n199) );
  MUX2X1 U39 ( .B(n38), .A(count_out[0]), .S(n39), .Y(n4) );
  NOR2X1 U40 ( .A(clear), .B(n40), .Y(n38) );
  MUX2X1 U41 ( .B(n40), .A(n1), .S(n41), .Y(n198) );
  OAI21X1 U42 ( .A(n42), .B(n43), .C(n44), .Y(n41) );
  NAND2X1 U43 ( .A(n45), .B(n46), .Y(n43) );
  NOR2X1 U44 ( .A(n47), .B(n48), .Y(n46) );
  NAND3X1 U45 ( .A(n49), .B(n50), .C(n51), .Y(n48) );
  NOR2X1 U46 ( .A(n52), .B(n53), .Y(n51) );
  XNOR2X1 U47 ( .A(rollover_val[11]), .B(n54), .Y(n53) );
  XNOR2X1 U48 ( .A(rollover_val[10]), .B(n55), .Y(n52) );
  XNOR2X1 U49 ( .A(N22), .B(rollover_val[14]), .Y(n50) );
  XNOR2X1 U50 ( .A(N23), .B(rollover_val[15]), .Y(n49) );
  NAND3X1 U51 ( .A(n56), .B(n57), .C(n58), .Y(n47) );
  NOR2X1 U52 ( .A(n59), .B(n60), .Y(n58) );
  XNOR2X1 U53 ( .A(rollover_val[3]), .B(n61), .Y(n60) );
  XNOR2X1 U54 ( .A(rollover_val[2]), .B(n62), .Y(n59) );
  XNOR2X1 U55 ( .A(N14), .B(rollover_val[6]), .Y(n57) );
  XNOR2X1 U56 ( .A(N15), .B(rollover_val[7]), .Y(n56) );
  NOR2X1 U57 ( .A(n63), .B(n64), .Y(n45) );
  NAND3X1 U58 ( .A(n65), .B(n66), .C(n67), .Y(n64) );
  NOR2X1 U59 ( .A(n68), .B(n69), .Y(n67) );
  XNOR2X1 U60 ( .A(rollover_val[27]), .B(n70), .Y(n69) );
  XNOR2X1 U61 ( .A(rollover_val[26]), .B(n71), .Y(n68) );
  XNOR2X1 U62 ( .A(N38), .B(rollover_val[30]), .Y(n66) );
  XNOR2X1 U63 ( .A(N39), .B(rollover_val[31]), .Y(n65) );
  NAND3X1 U64 ( .A(n72), .B(n73), .C(n74), .Y(n63) );
  NOR2X1 U65 ( .A(n75), .B(n76), .Y(n74) );
  XNOR2X1 U66 ( .A(rollover_val[19]), .B(n77), .Y(n76) );
  XNOR2X1 U67 ( .A(rollover_val[18]), .B(n78), .Y(n75) );
  XNOR2X1 U68 ( .A(N30), .B(rollover_val[22]), .Y(n73) );
  XNOR2X1 U69 ( .A(N31), .B(rollover_val[23]), .Y(n72) );
  NAND2X1 U70 ( .A(n79), .B(n80), .Y(n42) );
  NOR2X1 U71 ( .A(n81), .B(n82), .Y(n80) );
  NAND3X1 U72 ( .A(n83), .B(n84), .C(n85), .Y(n82) );
  NOR2X1 U73 ( .A(n86), .B(n87), .Y(n85) );
  XNOR2X1 U74 ( .A(rollover_val[9]), .B(n88), .Y(n87) );
  XNOR2X1 U75 ( .A(rollover_val[8]), .B(n89), .Y(n86) );
  XNOR2X1 U76 ( .A(N20), .B(rollover_val[12]), .Y(n84) );
  XNOR2X1 U77 ( .A(N21), .B(rollover_val[13]), .Y(n83) );
  NAND3X1 U78 ( .A(n90), .B(n91), .C(n92), .Y(n81) );
  NOR2X1 U79 ( .A(n93), .B(n94), .Y(n92) );
  XNOR2X1 U80 ( .A(rollover_val[1]), .B(n95), .Y(n94) );
  XNOR2X1 U81 ( .A(rollover_val[0]), .B(n3), .Y(n93) );
  INVX1 U82 ( .A(N8), .Y(n3) );
  XNOR2X1 U83 ( .A(N12), .B(rollover_val[4]), .Y(n91) );
  NOR2X1 U84 ( .A(n1), .B(n96), .Y(n90) );
  XNOR2X1 U85 ( .A(rollover_val[5]), .B(n97), .Y(n96) );
  NOR2X1 U86 ( .A(n98), .B(n99), .Y(n79) );
  NAND3X1 U87 ( .A(n100), .B(n101), .C(n102), .Y(n99) );
  NOR2X1 U88 ( .A(n103), .B(n104), .Y(n102) );
  XNOR2X1 U89 ( .A(rollover_val[25]), .B(n105), .Y(n104) );
  XNOR2X1 U90 ( .A(rollover_val[24]), .B(n106), .Y(n103) );
  XNOR2X1 U91 ( .A(N36), .B(rollover_val[28]), .Y(n101) );
  XNOR2X1 U92 ( .A(N37), .B(rollover_val[29]), .Y(n100) );
  NAND3X1 U93 ( .A(n107), .B(n108), .C(n109), .Y(n98) );
  NOR2X1 U94 ( .A(n110), .B(n111), .Y(n109) );
  XNOR2X1 U95 ( .A(rollover_val[17]), .B(n112), .Y(n111) );
  XNOR2X1 U96 ( .A(rollover_val[16]), .B(n113), .Y(n110) );
  XNOR2X1 U97 ( .A(N28), .B(rollover_val[20]), .Y(n108) );
  XNOR2X1 U98 ( .A(N29), .B(rollover_val[21]), .Y(n107) );
  OAI21X1 U99 ( .A(n1), .B(n114), .C(n115), .Y(n197) );
  NAND2X1 U100 ( .A(count_out[31]), .B(n39), .Y(n115) );
  INVX1 U101 ( .A(N39), .Y(n114) );
  OAI21X1 U102 ( .A(n1), .B(n116), .C(n117), .Y(n196) );
  NAND2X1 U103 ( .A(count_out[30]), .B(n39), .Y(n117) );
  INVX1 U104 ( .A(N38), .Y(n116) );
  OAI21X1 U105 ( .A(n1), .B(n118), .C(n119), .Y(n195) );
  NAND2X1 U106 ( .A(count_out[29]), .B(n39), .Y(n119) );
  INVX1 U107 ( .A(N37), .Y(n118) );
  OAI21X1 U108 ( .A(n1), .B(n120), .C(n121), .Y(n194) );
  NAND2X1 U109 ( .A(count_out[28]), .B(n39), .Y(n121) );
  INVX1 U110 ( .A(N36), .Y(n120) );
  OAI21X1 U111 ( .A(n1), .B(n70), .C(n122), .Y(n193) );
  NAND2X1 U112 ( .A(count_out[27]), .B(n39), .Y(n122) );
  INVX1 U113 ( .A(N35), .Y(n70) );
  OAI21X1 U114 ( .A(n1), .B(n71), .C(n123), .Y(n192) );
  NAND2X1 U115 ( .A(count_out[26]), .B(n39), .Y(n123) );
  INVX1 U116 ( .A(N34), .Y(n71) );
  OAI21X1 U117 ( .A(n1), .B(n105), .C(n124), .Y(n191) );
  NAND2X1 U118 ( .A(count_out[25]), .B(n39), .Y(n124) );
  INVX1 U119 ( .A(N33), .Y(n105) );
  OAI21X1 U120 ( .A(n1), .B(n106), .C(n125), .Y(n190) );
  NAND2X1 U121 ( .A(count_out[24]), .B(n39), .Y(n125) );
  INVX1 U122 ( .A(N32), .Y(n106) );
  OAI21X1 U123 ( .A(n1), .B(n126), .C(n127), .Y(n189) );
  NAND2X1 U124 ( .A(count_out[23]), .B(n39), .Y(n127) );
  INVX1 U125 ( .A(N31), .Y(n126) );
  OAI21X1 U126 ( .A(n1), .B(n128), .C(n129), .Y(n188) );
  NAND2X1 U127 ( .A(count_out[22]), .B(n39), .Y(n129) );
  INVX1 U128 ( .A(N30), .Y(n128) );
  OAI21X1 U129 ( .A(n1), .B(n130), .C(n131), .Y(n187) );
  NAND2X1 U130 ( .A(count_out[21]), .B(n39), .Y(n131) );
  INVX1 U131 ( .A(N29), .Y(n130) );
  OAI21X1 U132 ( .A(n1), .B(n132), .C(n133), .Y(n186) );
  NAND2X1 U133 ( .A(count_out[20]), .B(n39), .Y(n133) );
  INVX1 U134 ( .A(N28), .Y(n132) );
  OAI21X1 U135 ( .A(n1), .B(n77), .C(n134), .Y(n185) );
  NAND2X1 U136 ( .A(count_out[19]), .B(n39), .Y(n134) );
  INVX1 U137 ( .A(N27), .Y(n77) );
  OAI21X1 U138 ( .A(n1), .B(n78), .C(n135), .Y(n184) );
  NAND2X1 U139 ( .A(count_out[18]), .B(n39), .Y(n135) );
  INVX1 U140 ( .A(N26), .Y(n78) );
  OAI21X1 U141 ( .A(n1), .B(n112), .C(n136), .Y(n183) );
  NAND2X1 U142 ( .A(count_out[17]), .B(n39), .Y(n136) );
  INVX1 U143 ( .A(N25), .Y(n112) );
  OAI21X1 U144 ( .A(n1), .B(n113), .C(n137), .Y(n182) );
  NAND2X1 U145 ( .A(count_out[16]), .B(n39), .Y(n137) );
  INVX1 U146 ( .A(N24), .Y(n113) );
  OAI21X1 U147 ( .A(n1), .B(n138), .C(n139), .Y(n181) );
  NAND2X1 U148 ( .A(count_out[15]), .B(n39), .Y(n139) );
  INVX1 U149 ( .A(N23), .Y(n138) );
  OAI21X1 U150 ( .A(n1), .B(n140), .C(n141), .Y(n180) );
  NAND2X1 U151 ( .A(count_out[14]), .B(n39), .Y(n141) );
  INVX1 U152 ( .A(N22), .Y(n140) );
  OAI21X1 U153 ( .A(n1), .B(n142), .C(n143), .Y(n179) );
  NAND2X1 U154 ( .A(count_out[13]), .B(n39), .Y(n143) );
  INVX1 U155 ( .A(N21), .Y(n142) );
  OAI21X1 U156 ( .A(n1), .B(n144), .C(n145), .Y(n178) );
  NAND2X1 U157 ( .A(count_out[12]), .B(n39), .Y(n145) );
  INVX1 U158 ( .A(N20), .Y(n144) );
  OAI21X1 U159 ( .A(n1), .B(n54), .C(n146), .Y(n177) );
  NAND2X1 U160 ( .A(count_out[11]), .B(n39), .Y(n146) );
  INVX1 U161 ( .A(N19), .Y(n54) );
  OAI21X1 U162 ( .A(n2), .B(n55), .C(n147), .Y(n176) );
  NAND2X1 U163 ( .A(count_out[10]), .B(n39), .Y(n147) );
  INVX1 U164 ( .A(N18), .Y(n55) );
  OAI21X1 U165 ( .A(n2), .B(n88), .C(n148), .Y(n175) );
  NAND2X1 U166 ( .A(count_out[9]), .B(n39), .Y(n148) );
  INVX1 U167 ( .A(N17), .Y(n88) );
  OAI21X1 U168 ( .A(n2), .B(n89), .C(n149), .Y(n174) );
  NAND2X1 U169 ( .A(count_out[8]), .B(n39), .Y(n149) );
  INVX1 U170 ( .A(N16), .Y(n89) );
  OAI21X1 U171 ( .A(n2), .B(n150), .C(n151), .Y(n173) );
  NAND2X1 U172 ( .A(count_out[7]), .B(n39), .Y(n151) );
  INVX1 U173 ( .A(N15), .Y(n150) );
  OAI21X1 U174 ( .A(n2), .B(n152), .C(n153), .Y(n172) );
  NAND2X1 U175 ( .A(count_out[6]), .B(n39), .Y(n153) );
  INVX1 U176 ( .A(N14), .Y(n152) );
  OAI21X1 U177 ( .A(n2), .B(n97), .C(n154), .Y(n171) );
  NAND2X1 U178 ( .A(count_out[5]), .B(n39), .Y(n154) );
  INVX1 U179 ( .A(N13), .Y(n97) );
  OAI21X1 U180 ( .A(n2), .B(n155), .C(n156), .Y(n170) );
  NAND2X1 U181 ( .A(count_out[4]), .B(n39), .Y(n156) );
  INVX1 U182 ( .A(N12), .Y(n155) );
  OAI21X1 U183 ( .A(n2), .B(n61), .C(n157), .Y(n169) );
  NAND2X1 U184 ( .A(count_out[3]), .B(n39), .Y(n157) );
  INVX1 U185 ( .A(N11), .Y(n61) );
  OAI21X1 U186 ( .A(n2), .B(n62), .C(n158), .Y(n168) );
  NAND2X1 U187 ( .A(count_out[2]), .B(n39), .Y(n158) );
  INVX1 U188 ( .A(N10), .Y(n62) );
  OAI21X1 U189 ( .A(n2), .B(n95), .C(n159), .Y(n167) );
  NAND2X1 U190 ( .A(count_out[1]), .B(n39), .Y(n159) );
  AOI21X1 U191 ( .A(count_enable), .B(rollover_flag), .C(clear), .Y(n44) );
  INVX1 U192 ( .A(N9), .Y(n95) );
  NAND3X1 U193 ( .A(n160), .B(n40), .C(count_enable), .Y(n2) );
  INVX1 U194 ( .A(rollover_flag), .Y(n40) );
  INVX1 U195 ( .A(clear), .Y(n160) );
endmodule


module flex_counter_NUM_CNT_BITS32_0_DW01_inc_0 ( A, SUM );
  input [31:0] A;
  output [31:0] SUM;

  wire   [31:2] carry;

  HAX1 U1_1_30 ( .A(A[30]), .B(carry[30]), .YC(carry[31]), .YS(SUM[30]) );
  HAX1 U1_1_29 ( .A(A[29]), .B(carry[29]), .YC(carry[30]), .YS(SUM[29]) );
  HAX1 U1_1_28 ( .A(A[28]), .B(carry[28]), .YC(carry[29]), .YS(SUM[28]) );
  HAX1 U1_1_27 ( .A(A[27]), .B(carry[27]), .YC(carry[28]), .YS(SUM[27]) );
  HAX1 U1_1_26 ( .A(A[26]), .B(carry[26]), .YC(carry[27]), .YS(SUM[26]) );
  HAX1 U1_1_25 ( .A(A[25]), .B(carry[25]), .YC(carry[26]), .YS(SUM[25]) );
  HAX1 U1_1_24 ( .A(A[24]), .B(carry[24]), .YC(carry[25]), .YS(SUM[24]) );
  HAX1 U1_1_23 ( .A(A[23]), .B(carry[23]), .YC(carry[24]), .YS(SUM[23]) );
  HAX1 U1_1_22 ( .A(A[22]), .B(carry[22]), .YC(carry[23]), .YS(SUM[22]) );
  HAX1 U1_1_21 ( .A(A[21]), .B(carry[21]), .YC(carry[22]), .YS(SUM[21]) );
  HAX1 U1_1_20 ( .A(A[20]), .B(carry[20]), .YC(carry[21]), .YS(SUM[20]) );
  HAX1 U1_1_19 ( .A(A[19]), .B(carry[19]), .YC(carry[20]), .YS(SUM[19]) );
  HAX1 U1_1_18 ( .A(A[18]), .B(carry[18]), .YC(carry[19]), .YS(SUM[18]) );
  HAX1 U1_1_17 ( .A(A[17]), .B(carry[17]), .YC(carry[18]), .YS(SUM[17]) );
  HAX1 U1_1_16 ( .A(A[16]), .B(carry[16]), .YC(carry[17]), .YS(SUM[16]) );
  HAX1 U1_1_15 ( .A(A[15]), .B(carry[15]), .YC(carry[16]), .YS(SUM[15]) );
  HAX1 U1_1_14 ( .A(A[14]), .B(carry[14]), .YC(carry[15]), .YS(SUM[14]) );
  HAX1 U1_1_13 ( .A(A[13]), .B(carry[13]), .YC(carry[14]), .YS(SUM[13]) );
  HAX1 U1_1_12 ( .A(A[12]), .B(carry[12]), .YC(carry[13]), .YS(SUM[12]) );
  HAX1 U1_1_11 ( .A(A[11]), .B(carry[11]), .YC(carry[12]), .YS(SUM[11]) );
  HAX1 U1_1_10 ( .A(A[10]), .B(carry[10]), .YC(carry[11]), .YS(SUM[10]) );
  HAX1 U1_1_9 ( .A(A[9]), .B(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[31]), .B(A[31]), .Y(SUM[31]) );
endmodule


module flex_counter_NUM_CNT_BITS32_0 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [31:0] rollover_val;
  output [31:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20, N21,
         N22, N23, N24, N25, N26, N27, N28, N29, N30, N31, N32, N33, N34, N35,
         N36, N37, N38, N39, n1, n2, n3, n4, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n194, n195, n196, n197, n198, n199, n200, n201, n202, n203, n204,
         n205, n206, n207, n208, n209, n210, n211, n212, n213, n214, n215,
         n216, n217, n218, n219, n220;

  DFFSR \count_out_reg[0]  ( .D(n161), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR rollover_flag_reg ( .D(n162), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  DFFSR \count_out_reg[30]  ( .D(n164), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[30]) );
  DFFSR \count_out_reg[29]  ( .D(n165), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[29]) );
  DFFSR \count_out_reg[28]  ( .D(n166), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[28]) );
  DFFSR \count_out_reg[27]  ( .D(n194), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[27]) );
  DFFSR \count_out_reg[26]  ( .D(n195), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[26]) );
  DFFSR \count_out_reg[25]  ( .D(n196), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[25]) );
  DFFSR \count_out_reg[24]  ( .D(n197), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[24]) );
  DFFSR \count_out_reg[23]  ( .D(n198), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[23]) );
  DFFSR \count_out_reg[22]  ( .D(n199), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[22]) );
  DFFSR \count_out_reg[21]  ( .D(n200), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[21]) );
  DFFSR \count_out_reg[20]  ( .D(n201), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[20]) );
  DFFSR \count_out_reg[19]  ( .D(n202), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[19]) );
  DFFSR \count_out_reg[18]  ( .D(n203), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[18]) );
  DFFSR \count_out_reg[17]  ( .D(n204), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[17]) );
  DFFSR \count_out_reg[16]  ( .D(n205), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[16]) );
  DFFSR \count_out_reg[15]  ( .D(n206), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[15]) );
  DFFSR \count_out_reg[14]  ( .D(n207), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[14]) );
  DFFSR \count_out_reg[13]  ( .D(n208), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[13]) );
  DFFSR \count_out_reg[12]  ( .D(n209), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[12]) );
  DFFSR \count_out_reg[11]  ( .D(n210), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[11]) );
  DFFSR \count_out_reg[10]  ( .D(n211), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[10]) );
  DFFSR \count_out_reg[9]  ( .D(n212), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[9]) );
  DFFSR \count_out_reg[8]  ( .D(n213), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[8]) );
  DFFSR \count_out_reg[7]  ( .D(n214), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[7]) );
  DFFSR \count_out_reg[6]  ( .D(n215), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[6]) );
  DFFSR \count_out_reg[5]  ( .D(n216), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[5]) );
  DFFSR \count_out_reg[4]  ( .D(n217), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[4]) );
  DFFSR \count_out_reg[3]  ( .D(n218), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_out_reg[2]  ( .D(n219), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[1]  ( .D(n220), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[31]  ( .D(n163), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[31]) );
  flex_counter_NUM_CNT_BITS32_0_DW01_inc_0 add_35 ( .A(count_out), .SUM({N39, 
        N38, N37, N36, N35, N34, N33, N32, N31, N30, N29, N28, N27, N26, N25, 
        N24, N23, N22, N21, N20, N19, N18, N17, N16, N15, N14, N13, N12, N11, 
        N10, N9, N8}) );
  AND2X2 U36 ( .A(n44), .B(n1), .Y(n39) );
  BUFX2 U37 ( .A(n2), .Y(n1) );
  OAI21X1 U38 ( .A(n1), .B(n3), .C(n4), .Y(n161) );
  MUX2X1 U39 ( .B(n38), .A(count_out[0]), .S(n39), .Y(n4) );
  NOR2X1 U40 ( .A(clear), .B(n40), .Y(n38) );
  MUX2X1 U41 ( .B(n40), .A(n1), .S(n41), .Y(n162) );
  OAI21X1 U42 ( .A(n42), .B(n43), .C(n44), .Y(n41) );
  NAND2X1 U43 ( .A(n45), .B(n46), .Y(n43) );
  NOR2X1 U44 ( .A(n47), .B(n48), .Y(n46) );
  NAND3X1 U45 ( .A(n49), .B(n50), .C(n51), .Y(n48) );
  NOR2X1 U46 ( .A(n52), .B(n53), .Y(n51) );
  XNOR2X1 U47 ( .A(rollover_val[11]), .B(n54), .Y(n53) );
  XNOR2X1 U48 ( .A(rollover_val[10]), .B(n55), .Y(n52) );
  XNOR2X1 U49 ( .A(N22), .B(rollover_val[14]), .Y(n50) );
  XNOR2X1 U50 ( .A(N23), .B(rollover_val[15]), .Y(n49) );
  NAND3X1 U51 ( .A(n56), .B(n57), .C(n58), .Y(n47) );
  NOR2X1 U52 ( .A(n59), .B(n60), .Y(n58) );
  XNOR2X1 U53 ( .A(rollover_val[3]), .B(n61), .Y(n60) );
  XNOR2X1 U54 ( .A(rollover_val[2]), .B(n62), .Y(n59) );
  XNOR2X1 U55 ( .A(N14), .B(rollover_val[6]), .Y(n57) );
  XNOR2X1 U56 ( .A(N15), .B(rollover_val[7]), .Y(n56) );
  NOR2X1 U57 ( .A(n63), .B(n64), .Y(n45) );
  NAND3X1 U58 ( .A(n65), .B(n66), .C(n67), .Y(n64) );
  NOR2X1 U59 ( .A(n68), .B(n69), .Y(n67) );
  XNOR2X1 U60 ( .A(rollover_val[27]), .B(n70), .Y(n69) );
  XNOR2X1 U61 ( .A(rollover_val[26]), .B(n71), .Y(n68) );
  XNOR2X1 U62 ( .A(N38), .B(rollover_val[30]), .Y(n66) );
  XNOR2X1 U63 ( .A(N39), .B(rollover_val[31]), .Y(n65) );
  NAND3X1 U64 ( .A(n72), .B(n73), .C(n74), .Y(n63) );
  NOR2X1 U65 ( .A(n75), .B(n76), .Y(n74) );
  XNOR2X1 U66 ( .A(rollover_val[19]), .B(n77), .Y(n76) );
  XNOR2X1 U67 ( .A(rollover_val[18]), .B(n78), .Y(n75) );
  XNOR2X1 U68 ( .A(N30), .B(rollover_val[22]), .Y(n73) );
  XNOR2X1 U69 ( .A(N31), .B(rollover_val[23]), .Y(n72) );
  NAND2X1 U70 ( .A(n79), .B(n80), .Y(n42) );
  NOR2X1 U71 ( .A(n81), .B(n82), .Y(n80) );
  NAND3X1 U72 ( .A(n83), .B(n84), .C(n85), .Y(n82) );
  NOR2X1 U73 ( .A(n86), .B(n87), .Y(n85) );
  XNOR2X1 U74 ( .A(rollover_val[9]), .B(n88), .Y(n87) );
  XNOR2X1 U75 ( .A(rollover_val[8]), .B(n89), .Y(n86) );
  XNOR2X1 U76 ( .A(N20), .B(rollover_val[12]), .Y(n84) );
  XNOR2X1 U77 ( .A(N21), .B(rollover_val[13]), .Y(n83) );
  NAND3X1 U78 ( .A(n90), .B(n91), .C(n92), .Y(n81) );
  NOR2X1 U79 ( .A(n93), .B(n94), .Y(n92) );
  XNOR2X1 U80 ( .A(rollover_val[1]), .B(n95), .Y(n94) );
  XNOR2X1 U81 ( .A(rollover_val[0]), .B(n3), .Y(n93) );
  INVX1 U82 ( .A(N8), .Y(n3) );
  XNOR2X1 U83 ( .A(N12), .B(rollover_val[4]), .Y(n91) );
  NOR2X1 U84 ( .A(n1), .B(n96), .Y(n90) );
  XNOR2X1 U85 ( .A(rollover_val[5]), .B(n97), .Y(n96) );
  NOR2X1 U86 ( .A(n98), .B(n99), .Y(n79) );
  NAND3X1 U87 ( .A(n100), .B(n101), .C(n102), .Y(n99) );
  NOR2X1 U88 ( .A(n103), .B(n104), .Y(n102) );
  XNOR2X1 U89 ( .A(rollover_val[25]), .B(n105), .Y(n104) );
  XNOR2X1 U90 ( .A(rollover_val[24]), .B(n106), .Y(n103) );
  XNOR2X1 U91 ( .A(N36), .B(rollover_val[28]), .Y(n101) );
  XNOR2X1 U92 ( .A(N37), .B(rollover_val[29]), .Y(n100) );
  NAND3X1 U93 ( .A(n107), .B(n108), .C(n109), .Y(n98) );
  NOR2X1 U94 ( .A(n110), .B(n111), .Y(n109) );
  XNOR2X1 U95 ( .A(rollover_val[17]), .B(n112), .Y(n111) );
  XNOR2X1 U96 ( .A(rollover_val[16]), .B(n113), .Y(n110) );
  XNOR2X1 U97 ( .A(N28), .B(rollover_val[20]), .Y(n108) );
  XNOR2X1 U98 ( .A(N29), .B(rollover_val[21]), .Y(n107) );
  OAI21X1 U99 ( .A(n1), .B(n114), .C(n115), .Y(n163) );
  NAND2X1 U100 ( .A(count_out[31]), .B(n39), .Y(n115) );
  INVX1 U101 ( .A(N39), .Y(n114) );
  OAI21X1 U102 ( .A(n1), .B(n116), .C(n117), .Y(n164) );
  NAND2X1 U103 ( .A(count_out[30]), .B(n39), .Y(n117) );
  INVX1 U104 ( .A(N38), .Y(n116) );
  OAI21X1 U105 ( .A(n1), .B(n118), .C(n119), .Y(n165) );
  NAND2X1 U106 ( .A(count_out[29]), .B(n39), .Y(n119) );
  INVX1 U107 ( .A(N37), .Y(n118) );
  OAI21X1 U108 ( .A(n1), .B(n120), .C(n121), .Y(n166) );
  NAND2X1 U109 ( .A(count_out[28]), .B(n39), .Y(n121) );
  INVX1 U110 ( .A(N36), .Y(n120) );
  OAI21X1 U111 ( .A(n1), .B(n70), .C(n122), .Y(n194) );
  NAND2X1 U112 ( .A(count_out[27]), .B(n39), .Y(n122) );
  INVX1 U113 ( .A(N35), .Y(n70) );
  OAI21X1 U114 ( .A(n1), .B(n71), .C(n123), .Y(n195) );
  NAND2X1 U115 ( .A(count_out[26]), .B(n39), .Y(n123) );
  INVX1 U116 ( .A(N34), .Y(n71) );
  OAI21X1 U117 ( .A(n1), .B(n105), .C(n124), .Y(n196) );
  NAND2X1 U118 ( .A(count_out[25]), .B(n39), .Y(n124) );
  INVX1 U119 ( .A(N33), .Y(n105) );
  OAI21X1 U120 ( .A(n1), .B(n106), .C(n125), .Y(n197) );
  NAND2X1 U121 ( .A(count_out[24]), .B(n39), .Y(n125) );
  INVX1 U122 ( .A(N32), .Y(n106) );
  OAI21X1 U123 ( .A(n1), .B(n126), .C(n127), .Y(n198) );
  NAND2X1 U124 ( .A(count_out[23]), .B(n39), .Y(n127) );
  INVX1 U125 ( .A(N31), .Y(n126) );
  OAI21X1 U126 ( .A(n1), .B(n128), .C(n129), .Y(n199) );
  NAND2X1 U127 ( .A(count_out[22]), .B(n39), .Y(n129) );
  INVX1 U128 ( .A(N30), .Y(n128) );
  OAI21X1 U129 ( .A(n1), .B(n130), .C(n131), .Y(n200) );
  NAND2X1 U130 ( .A(count_out[21]), .B(n39), .Y(n131) );
  INVX1 U131 ( .A(N29), .Y(n130) );
  OAI21X1 U132 ( .A(n1), .B(n132), .C(n133), .Y(n201) );
  NAND2X1 U133 ( .A(count_out[20]), .B(n39), .Y(n133) );
  INVX1 U134 ( .A(N28), .Y(n132) );
  OAI21X1 U135 ( .A(n1), .B(n77), .C(n134), .Y(n202) );
  NAND2X1 U136 ( .A(count_out[19]), .B(n39), .Y(n134) );
  INVX1 U137 ( .A(N27), .Y(n77) );
  OAI21X1 U138 ( .A(n1), .B(n78), .C(n135), .Y(n203) );
  NAND2X1 U139 ( .A(count_out[18]), .B(n39), .Y(n135) );
  INVX1 U140 ( .A(N26), .Y(n78) );
  OAI21X1 U141 ( .A(n1), .B(n112), .C(n136), .Y(n204) );
  NAND2X1 U142 ( .A(count_out[17]), .B(n39), .Y(n136) );
  INVX1 U143 ( .A(N25), .Y(n112) );
  OAI21X1 U144 ( .A(n1), .B(n113), .C(n137), .Y(n205) );
  NAND2X1 U145 ( .A(count_out[16]), .B(n39), .Y(n137) );
  INVX1 U146 ( .A(N24), .Y(n113) );
  OAI21X1 U147 ( .A(n1), .B(n138), .C(n139), .Y(n206) );
  NAND2X1 U148 ( .A(count_out[15]), .B(n39), .Y(n139) );
  INVX1 U149 ( .A(N23), .Y(n138) );
  OAI21X1 U150 ( .A(n1), .B(n140), .C(n141), .Y(n207) );
  NAND2X1 U151 ( .A(count_out[14]), .B(n39), .Y(n141) );
  INVX1 U152 ( .A(N22), .Y(n140) );
  OAI21X1 U153 ( .A(n1), .B(n142), .C(n143), .Y(n208) );
  NAND2X1 U154 ( .A(count_out[13]), .B(n39), .Y(n143) );
  INVX1 U155 ( .A(N21), .Y(n142) );
  OAI21X1 U156 ( .A(n1), .B(n144), .C(n145), .Y(n209) );
  NAND2X1 U157 ( .A(count_out[12]), .B(n39), .Y(n145) );
  INVX1 U158 ( .A(N20), .Y(n144) );
  OAI21X1 U159 ( .A(n1), .B(n54), .C(n146), .Y(n210) );
  NAND2X1 U160 ( .A(count_out[11]), .B(n39), .Y(n146) );
  INVX1 U161 ( .A(N19), .Y(n54) );
  OAI21X1 U162 ( .A(n2), .B(n55), .C(n147), .Y(n211) );
  NAND2X1 U163 ( .A(count_out[10]), .B(n39), .Y(n147) );
  INVX1 U164 ( .A(N18), .Y(n55) );
  OAI21X1 U165 ( .A(n2), .B(n88), .C(n148), .Y(n212) );
  NAND2X1 U166 ( .A(count_out[9]), .B(n39), .Y(n148) );
  INVX1 U167 ( .A(N17), .Y(n88) );
  OAI21X1 U168 ( .A(n2), .B(n89), .C(n149), .Y(n213) );
  NAND2X1 U169 ( .A(count_out[8]), .B(n39), .Y(n149) );
  INVX1 U170 ( .A(N16), .Y(n89) );
  OAI21X1 U171 ( .A(n2), .B(n150), .C(n151), .Y(n214) );
  NAND2X1 U172 ( .A(count_out[7]), .B(n39), .Y(n151) );
  INVX1 U173 ( .A(N15), .Y(n150) );
  OAI21X1 U174 ( .A(n2), .B(n152), .C(n153), .Y(n215) );
  NAND2X1 U175 ( .A(count_out[6]), .B(n39), .Y(n153) );
  INVX1 U176 ( .A(N14), .Y(n152) );
  OAI21X1 U177 ( .A(n2), .B(n97), .C(n154), .Y(n216) );
  NAND2X1 U178 ( .A(count_out[5]), .B(n39), .Y(n154) );
  INVX1 U179 ( .A(N13), .Y(n97) );
  OAI21X1 U180 ( .A(n2), .B(n155), .C(n156), .Y(n217) );
  NAND2X1 U181 ( .A(count_out[4]), .B(n39), .Y(n156) );
  INVX1 U182 ( .A(N12), .Y(n155) );
  OAI21X1 U183 ( .A(n2), .B(n61), .C(n157), .Y(n218) );
  NAND2X1 U184 ( .A(count_out[3]), .B(n39), .Y(n157) );
  INVX1 U185 ( .A(N11), .Y(n61) );
  OAI21X1 U186 ( .A(n2), .B(n62), .C(n158), .Y(n219) );
  NAND2X1 U187 ( .A(count_out[2]), .B(n39), .Y(n158) );
  INVX1 U188 ( .A(N10), .Y(n62) );
  OAI21X1 U189 ( .A(n2), .B(n95), .C(n159), .Y(n220) );
  NAND2X1 U190 ( .A(count_out[1]), .B(n39), .Y(n159) );
  AOI21X1 U191 ( .A(count_enable), .B(rollover_flag), .C(clear), .Y(n44) );
  INVX1 U192 ( .A(N9), .Y(n95) );
  NAND3X1 U193 ( .A(n160), .B(n40), .C(count_enable), .Y(n2) );
  INVX1 U194 ( .A(rollover_flag), .Y(n40) );
  INVX1 U195 ( .A(clear), .Y(n160) );
endmodule


module timer ( clk, n_rst, d_edge, rcving, shift_enable, byte_received );
  input clk, n_rst, d_edge, rcving;
  output shift_enable, byte_received;
  wire   current_byte_received, prev_byte_received, async_byte_received, n3,
         n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n32;
  wire   [31:0] count_out;

  DFFSR current_byte_received_reg ( .D(async_byte_received), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(current_byte_received) );
  DFFSR prev_byte_received_reg ( .D(current_byte_received), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(prev_byte_received) );
  flex_counter_NUM_CNT_BITS32_1 bit_shift ( .clk(clk), .n_rst(n_rst), .clear(
        d_edge), .count_enable(rcving), .rollover_val({1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b1, 1'b0, 1'b0, 1'b0}), .count_out(count_out) );
  flex_counter_NUM_CNT_BITS32_0 byte_receive ( .clk(clk), .n_rst(n_rst), 
        .clear(n32), .count_enable(shift_enable), .rollover_val({1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0}), .rollover_flag(
        async_byte_received) );
  INVX2 U5 ( .A(n3), .Y(shift_enable) );
  NAND3X1 U6 ( .A(n4), .B(n5), .C(n6), .Y(n3) );
  NOR2X1 U7 ( .A(n7), .B(n8), .Y(n6) );
  NAND3X1 U8 ( .A(n9), .B(n10), .C(n11), .Y(n8) );
  AND2X1 U9 ( .A(n12), .B(n13), .Y(n11) );
  NOR2X1 U10 ( .A(count_out[30]), .B(count_out[2]), .Y(n13) );
  NOR2X1 U11 ( .A(count_out[29]), .B(count_out[28]), .Y(n12) );
  NOR2X1 U12 ( .A(count_out[27]), .B(count_out[26]), .Y(n10) );
  NOR2X1 U13 ( .A(count_out[25]), .B(count_out[24]), .Y(n9) );
  NAND3X1 U14 ( .A(n14), .B(n15), .C(n16), .Y(n7) );
  AND2X1 U15 ( .A(n17), .B(n18), .Y(n16) );
  NOR2X1 U16 ( .A(count_out[9]), .B(count_out[8]), .Y(n18) );
  NOR2X1 U17 ( .A(count_out[7]), .B(count_out[6]), .Y(n17) );
  NOR2X1 U18 ( .A(count_out[5]), .B(count_out[4]), .Y(n15) );
  NOR2X1 U19 ( .A(count_out[3]), .B(count_out[31]), .Y(n14) );
  NOR2X1 U20 ( .A(n19), .B(n20), .Y(n5) );
  NAND2X1 U21 ( .A(n21), .B(n22), .Y(n20) );
  NOR2X1 U22 ( .A(count_out[19]), .B(count_out[18]), .Y(n22) );
  NOR2X1 U23 ( .A(count_out[17]), .B(count_out[16]), .Y(n21) );
  NAND2X1 U24 ( .A(n23), .B(n24), .Y(n19) );
  NOR2X1 U25 ( .A(count_out[23]), .B(count_out[22]), .Y(n24) );
  NOR2X1 U26 ( .A(count_out[21]), .B(count_out[20]), .Y(n23) );
  NOR2X1 U27 ( .A(n25), .B(n26), .Y(n4) );
  NAND3X1 U28 ( .A(count_out[1]), .B(count_out[0]), .C(n27), .Y(n26) );
  NOR2X1 U29 ( .A(count_out[11]), .B(count_out[10]), .Y(n27) );
  NAND2X1 U30 ( .A(n28), .B(n29), .Y(n25) );
  NOR2X1 U31 ( .A(count_out[15]), .B(count_out[14]), .Y(n29) );
  NOR2X1 U32 ( .A(count_out[13]), .B(count_out[12]), .Y(n28) );
  INVX1 U33 ( .A(rcving), .Y(n32) );
  NOR2X1 U34 ( .A(prev_byte_received), .B(n30), .Y(byte_received) );
  INVX1 U35 ( .A(current_byte_received), .Y(n30) );
endmodule


module flex_stp_sr_NUM_BITS8_SHIFT_MSB0 ( clk, n_rst, shift_enable, serial_in, 
        parallel_out );
  output [7:0] parallel_out;
  input clk, n_rst, shift_enable, serial_in;
  wire   n12, n14, n16, n18, n20, n22, n24, n26, n1, n2, n3, n4, n5, n6, n7,
         n8;

  DFFSR \parallel_out_reg[7]  ( .D(n26), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[7]) );
  DFFSR \parallel_out_reg[6]  ( .D(n24), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[6]) );
  DFFSR \parallel_out_reg[5]  ( .D(n22), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[5]) );
  DFFSR \parallel_out_reg[4]  ( .D(n20), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[4]) );
  DFFSR \parallel_out_reg[3]  ( .D(n18), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[3]) );
  DFFSR \parallel_out_reg[2]  ( .D(n16), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[2]) );
  DFFSR \parallel_out_reg[1]  ( .D(n14), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[1]) );
  DFFSR \parallel_out_reg[0]  ( .D(n12), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[0]) );
  INVX1 U2 ( .A(n1), .Y(n26) );
  MUX2X1 U3 ( .B(parallel_out[7]), .A(serial_in), .S(shift_enable), .Y(n1) );
  INVX1 U4 ( .A(n2), .Y(n24) );
  MUX2X1 U5 ( .B(parallel_out[6]), .A(parallel_out[7]), .S(shift_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(parallel_out[5]), .A(parallel_out[6]), .S(shift_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n20) );
  MUX2X1 U9 ( .B(parallel_out[4]), .A(parallel_out[5]), .S(shift_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n18) );
  MUX2X1 U11 ( .B(parallel_out[3]), .A(parallel_out[4]), .S(shift_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n16) );
  MUX2X1 U13 ( .B(parallel_out[2]), .A(parallel_out[3]), .S(shift_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n14) );
  MUX2X1 U15 ( .B(parallel_out[1]), .A(parallel_out[2]), .S(shift_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n12) );
  MUX2X1 U17 ( .B(parallel_out[0]), .A(parallel_out[1]), .S(shift_enable), .Y(
        n8) );
endmodule


module shift_register ( clk, n_rst, shift_enable, d_orig, rcv_data );
  output [7:0] rcv_data;
  input clk, n_rst, shift_enable, d_orig;


  flex_stp_sr_NUM_BITS8_SHIFT_MSB0 shift_reg ( .clk(clk), .n_rst(n_rst), 
        .shift_enable(shift_enable), .serial_in(d_orig), .parallel_out(
        rcv_data) );
endmodule


module rcu ( clk, n_rst, d_edge, eop, shift_enable, rcv_data, byte_received, 
        rcving, w_enable, r_error );
  input [7:0] rcv_data;
  input clk, n_rst, d_edge, eop, shift_enable, byte_received;
  output rcving, w_enable, r_error;
  wire   n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75,
         n76, n77, n78, n79, n80, n81, n82, n83;
  wire   [4:0] state;

  DFFSR \state_reg[0]  ( .D(n81), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[0])
         );
  DFFSR \state_reg[2]  ( .D(n80), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[2])
         );
  DFFSR \state_reg[1]  ( .D(n83), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[1])
         );
  DFFSR \state_reg[3]  ( .D(n82), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[3])
         );
  NAND2X1 U7 ( .A(n5), .B(n6), .Y(rcving) );
  OR2X1 U8 ( .A(n7), .B(n8), .Y(n80) );
  OAI21X1 U9 ( .A(d_edge), .B(n9), .C(n10), .Y(n8) );
  AOI22X1 U10 ( .A(n11), .B(n12), .C(n13), .D(n14), .Y(n10) );
  NAND3X1 U11 ( .A(n15), .B(n16), .C(n17), .Y(n7) );
  AND2X1 U12 ( .A(n18), .B(n19), .Y(n17) );
  OAI21X1 U13 ( .A(byte_received), .B(n20), .C(n21), .Y(n15) );
  OR2X1 U14 ( .A(n22), .B(n23), .Y(n81) );
  NAND3X1 U15 ( .A(n24), .B(n25), .C(n26), .Y(n23) );
  AOI22X1 U16 ( .A(n13), .B(n20), .C(n27), .D(state[0]), .Y(n26) );
  MUX2X1 U17 ( .B(n28), .A(n21), .S(byte_received), .Y(n24) );
  NAND3X1 U18 ( .A(n29), .B(n9), .C(n30), .Y(n22) );
  AOI22X1 U19 ( .A(d_edge), .B(n31), .C(n12), .D(n32), .Y(n30) );
  INVX1 U20 ( .A(n11), .Y(n32) );
  NOR2X1 U21 ( .A(n33), .B(n34), .Y(n11) );
  NAND3X1 U22 ( .A(rcv_data[7]), .B(n35), .C(n36), .Y(n34) );
  NOR2X1 U23 ( .A(rcv_data[2]), .B(rcv_data[1]), .Y(n36) );
  INVX1 U24 ( .A(rcv_data[0]), .Y(n35) );
  NAND2X1 U25 ( .A(n37), .B(n38), .Y(n33) );
  NOR2X1 U26 ( .A(rcv_data[6]), .B(rcv_data[5]), .Y(n38) );
  NOR2X1 U27 ( .A(rcv_data[4]), .B(rcv_data[3]), .Y(n37) );
  NAND3X1 U28 ( .A(n39), .B(n40), .C(n41), .Y(n82) );
  NOR2X1 U29 ( .A(n42), .B(n43), .Y(n41) );
  OAI21X1 U30 ( .A(shift_enable), .B(n44), .C(n25), .Y(n43) );
  INVX1 U31 ( .A(n45), .Y(n25) );
  OAI22X1 U32 ( .A(n44), .B(n20), .C(d_edge), .D(n46), .Y(n45) );
  NAND3X1 U33 ( .A(n14), .B(n47), .C(n21), .Y(n40) );
  INVX1 U34 ( .A(byte_received), .Y(n47) );
  NOR2X1 U35 ( .A(n27), .B(w_enable), .Y(n39) );
  NAND3X1 U36 ( .A(n48), .B(n49), .C(n50), .Y(n83) );
  NOR2X1 U37 ( .A(n51), .B(n52), .Y(n50) );
  OAI21X1 U38 ( .A(n14), .B(n53), .C(n54), .Y(n52) );
  INVX1 U39 ( .A(n20), .Y(n14) );
  NAND2X1 U40 ( .A(eop), .B(shift_enable), .Y(n20) );
  NAND2X1 U41 ( .A(n55), .B(n19), .Y(n51) );
  NAND3X1 U42 ( .A(n56), .B(n57), .C(shift_enable), .Y(n19) );
  INVX1 U43 ( .A(eop), .Y(n57) );
  INVX1 U44 ( .A(n44), .Y(n56) );
  INVX1 U45 ( .A(n42), .Y(n49) );
  OAI21X1 U46 ( .A(d_edge), .B(n29), .C(n58), .Y(n42) );
  AOI22X1 U47 ( .A(n27), .B(state[1]), .C(n28), .D(byte_received), .Y(n48) );
  INVX1 U48 ( .A(n18), .Y(n27) );
  NAND3X1 U49 ( .A(n59), .B(n5), .C(n60), .Y(n18) );
  NOR2X1 U50 ( .A(n61), .B(n62), .Y(n60) );
  NAND2X1 U51 ( .A(n6), .B(n46), .Y(n62) );
  NAND2X1 U52 ( .A(n63), .B(state[0]), .Y(n46) );
  INVX1 U53 ( .A(n9), .Y(n61) );
  INVX1 U54 ( .A(n64), .Y(n5) );
  NAND3X1 U55 ( .A(n65), .B(n44), .C(n66), .Y(n64) );
  NOR2X1 U56 ( .A(n28), .B(n21), .Y(n66) );
  INVX1 U57 ( .A(n54), .Y(n21) );
  NAND2X1 U58 ( .A(n67), .B(n68), .Y(n54) );
  INVX1 U59 ( .A(n69), .Y(n28) );
  NAND3X1 U60 ( .A(state[0]), .B(n70), .C(n71), .Y(n69) );
  NAND3X1 U61 ( .A(n72), .B(n70), .C(n63), .Y(n44) );
  NOR2X1 U62 ( .A(n13), .B(n12), .Y(n65) );
  INVX1 U63 ( .A(n55), .Y(n12) );
  NAND2X1 U64 ( .A(n67), .B(n71), .Y(n55) );
  INVX1 U65 ( .A(n53), .Y(n13) );
  INVX1 U66 ( .A(n31), .Y(n59) );
  OAI21X1 U67 ( .A(n73), .B(n74), .C(n75), .Y(n31) );
  AND2X1 U68 ( .A(n16), .B(n58), .Y(n75) );
  NAND2X1 U69 ( .A(n72), .B(n70), .Y(n74) );
  INVX1 U70 ( .A(n71), .Y(n73) );
  NAND3X1 U71 ( .A(n76), .B(n9), .C(n77), .Y(r_error) );
  AND2X1 U72 ( .A(n29), .B(n58), .Y(n77) );
  NAND2X1 U73 ( .A(n63), .B(n67), .Y(n58) );
  NOR2X1 U74 ( .A(n70), .B(state[0]), .Y(n67) );
  NAND2X1 U75 ( .A(n63), .B(n78), .Y(n29) );
  NOR2X1 U76 ( .A(n79), .B(state[2]), .Y(n63) );
  NAND3X1 U77 ( .A(state[0]), .B(n70), .C(n68), .Y(n9) );
  AND2X1 U78 ( .A(n53), .B(n16), .Y(n76) );
  NAND3X1 U79 ( .A(n72), .B(n70), .C(n68), .Y(n16) );
  NAND2X1 U80 ( .A(n71), .B(n78), .Y(n53) );
  NOR2X1 U81 ( .A(state[2]), .B(state[3]), .Y(n71) );
  INVX1 U82 ( .A(n6), .Y(w_enable) );
  NAND2X1 U83 ( .A(n68), .B(n78), .Y(n6) );
  NOR2X1 U84 ( .A(n70), .B(n72), .Y(n78) );
  INVX1 U85 ( .A(state[0]), .Y(n72) );
  INVX1 U86 ( .A(state[1]), .Y(n70) );
  AND2X1 U87 ( .A(state[2]), .B(n79), .Y(n68) );
  INVX1 U88 ( .A(state[3]), .Y(n79) );
endmodule


module fiforam ( wclk, wenable, waddr, raddr, wdata, rdata );
  input [2:0] waddr;
  input [2:0] raddr;
  input [7:0] wdata;
  output [7:0] rdata;
  input wclk, wenable;
  wire   N10, N11, N12, N13, N14, N15, \fiforeg[0][7] , \fiforeg[0][6] ,
         \fiforeg[0][5] , \fiforeg[0][4] , \fiforeg[0][3] , \fiforeg[0][2] ,
         \fiforeg[0][1] , \fiforeg[0][0] , \fiforeg[1][7] , \fiforeg[1][6] ,
         \fiforeg[1][5] , \fiforeg[1][4] , \fiforeg[1][3] , \fiforeg[1][2] ,
         \fiforeg[1][1] , \fiforeg[1][0] , \fiforeg[2][7] , \fiforeg[2][6] ,
         \fiforeg[2][5] , \fiforeg[2][4] , \fiforeg[2][3] , \fiforeg[2][2] ,
         \fiforeg[2][1] , \fiforeg[2][0] , \fiforeg[3][7] , \fiforeg[3][6] ,
         \fiforeg[3][5] , \fiforeg[3][4] , \fiforeg[3][3] , \fiforeg[3][2] ,
         \fiforeg[3][1] , \fiforeg[3][0] , \fiforeg[4][7] , \fiforeg[4][6] ,
         \fiforeg[4][5] , \fiforeg[4][4] , \fiforeg[4][3] , \fiforeg[4][2] ,
         \fiforeg[4][1] , \fiforeg[4][0] , \fiforeg[5][7] , \fiforeg[5][6] ,
         \fiforeg[5][5] , \fiforeg[5][4] , \fiforeg[5][3] , \fiforeg[5][2] ,
         \fiforeg[5][1] , \fiforeg[5][0] , \fiforeg[6][7] , \fiforeg[6][6] ,
         \fiforeg[6][5] , \fiforeg[6][4] , \fiforeg[6][3] , \fiforeg[6][2] ,
         \fiforeg[6][1] , \fiforeg[6][0] , \fiforeg[7][7] , \fiforeg[7][6] ,
         \fiforeg[7][5] , \fiforeg[7][4] , \fiforeg[7][3] , \fiforeg[7][2] ,
         \fiforeg[7][1] , \fiforeg[7][0] , N17, N18, N19, N20, N21, N22, N23,
         N24, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n153,
         n154, n155, n156, n157, n158, n159, n160, n161, n162, n163, n164,
         n165, n166, n167, n168, n169, n170, n171, n172, n173, n174, n175,
         n176, n177, n178, n179, n180, n181, n182, n183, n184, n185, n186,
         n187, n188, n189, n190, n191, n192, n193, n194, n195, n196, n197,
         n198, n199, n200, n201, n202, n203, n204, n205, n206, n207, n208,
         n209, n210, n211, n212, n213, n214, n215, n216, n217, n218, n219,
         n220, n221, n222, n223, n224, n225, n226, n227, n228, n229, n230,
         n231, n232, n233, n234, n235, n236, n237, n238, n239, n240, n241,
         n242, n243, n244, n245, n246, n247, n248, n249, n250, n251, n252,
         n253, n254, n255, n256, n257, n258, n259, n260, n261, n262;
  assign N10 = raddr[0];
  assign N11 = raddr[1];
  assign N12 = raddr[2];
  assign N13 = waddr[0];
  assign N14 = waddr[1];
  assign N15 = waddr[2];

  DFFPOSX1 \fiforeg_reg[0][7]  ( .D(n152), .CLK(wclk), .Q(\fiforeg[0][7] ) );
  DFFPOSX1 \fiforeg_reg[0][6]  ( .D(n151), .CLK(wclk), .Q(\fiforeg[0][6] ) );
  DFFPOSX1 \fiforeg_reg[0][5]  ( .D(n150), .CLK(wclk), .Q(\fiforeg[0][5] ) );
  DFFPOSX1 \fiforeg_reg[0][4]  ( .D(n149), .CLK(wclk), .Q(\fiforeg[0][4] ) );
  DFFPOSX1 \fiforeg_reg[0][3]  ( .D(n148), .CLK(wclk), .Q(\fiforeg[0][3] ) );
  DFFPOSX1 \fiforeg_reg[0][2]  ( .D(n147), .CLK(wclk), .Q(\fiforeg[0][2] ) );
  DFFPOSX1 \fiforeg_reg[0][1]  ( .D(n146), .CLK(wclk), .Q(\fiforeg[0][1] ) );
  DFFPOSX1 \fiforeg_reg[0][0]  ( .D(n145), .CLK(wclk), .Q(\fiforeg[0][0] ) );
  DFFPOSX1 \fiforeg_reg[1][7]  ( .D(n144), .CLK(wclk), .Q(\fiforeg[1][7] ) );
  DFFPOSX1 \fiforeg_reg[1][6]  ( .D(n143), .CLK(wclk), .Q(\fiforeg[1][6] ) );
  DFFPOSX1 \fiforeg_reg[1][5]  ( .D(n142), .CLK(wclk), .Q(\fiforeg[1][5] ) );
  DFFPOSX1 \fiforeg_reg[1][4]  ( .D(n141), .CLK(wclk), .Q(\fiforeg[1][4] ) );
  DFFPOSX1 \fiforeg_reg[1][3]  ( .D(n140), .CLK(wclk), .Q(\fiforeg[1][3] ) );
  DFFPOSX1 \fiforeg_reg[1][2]  ( .D(n139), .CLK(wclk), .Q(\fiforeg[1][2] ) );
  DFFPOSX1 \fiforeg_reg[1][1]  ( .D(n138), .CLK(wclk), .Q(\fiforeg[1][1] ) );
  DFFPOSX1 \fiforeg_reg[1][0]  ( .D(n137), .CLK(wclk), .Q(\fiforeg[1][0] ) );
  DFFPOSX1 \fiforeg_reg[2][7]  ( .D(n136), .CLK(wclk), .Q(\fiforeg[2][7] ) );
  DFFPOSX1 \fiforeg_reg[2][6]  ( .D(n135), .CLK(wclk), .Q(\fiforeg[2][6] ) );
  DFFPOSX1 \fiforeg_reg[2][5]  ( .D(n134), .CLK(wclk), .Q(\fiforeg[2][5] ) );
  DFFPOSX1 \fiforeg_reg[2][4]  ( .D(n133), .CLK(wclk), .Q(\fiforeg[2][4] ) );
  DFFPOSX1 \fiforeg_reg[2][3]  ( .D(n132), .CLK(wclk), .Q(\fiforeg[2][3] ) );
  DFFPOSX1 \fiforeg_reg[2][2]  ( .D(n131), .CLK(wclk), .Q(\fiforeg[2][2] ) );
  DFFPOSX1 \fiforeg_reg[2][1]  ( .D(n130), .CLK(wclk), .Q(\fiforeg[2][1] ) );
  DFFPOSX1 \fiforeg_reg[2][0]  ( .D(n129), .CLK(wclk), .Q(\fiforeg[2][0] ) );
  DFFPOSX1 \fiforeg_reg[3][7]  ( .D(n128), .CLK(wclk), .Q(\fiforeg[3][7] ) );
  DFFPOSX1 \fiforeg_reg[3][6]  ( .D(n127), .CLK(wclk), .Q(\fiforeg[3][6] ) );
  DFFPOSX1 \fiforeg_reg[3][5]  ( .D(n126), .CLK(wclk), .Q(\fiforeg[3][5] ) );
  DFFPOSX1 \fiforeg_reg[3][4]  ( .D(n125), .CLK(wclk), .Q(\fiforeg[3][4] ) );
  DFFPOSX1 \fiforeg_reg[3][3]  ( .D(n124), .CLK(wclk), .Q(\fiforeg[3][3] ) );
  DFFPOSX1 \fiforeg_reg[3][2]  ( .D(n123), .CLK(wclk), .Q(\fiforeg[3][2] ) );
  DFFPOSX1 \fiforeg_reg[3][1]  ( .D(n122), .CLK(wclk), .Q(\fiforeg[3][1] ) );
  DFFPOSX1 \fiforeg_reg[3][0]  ( .D(n121), .CLK(wclk), .Q(\fiforeg[3][0] ) );
  DFFPOSX1 \fiforeg_reg[4][7]  ( .D(n120), .CLK(wclk), .Q(\fiforeg[4][7] ) );
  DFFPOSX1 \fiforeg_reg[4][6]  ( .D(n119), .CLK(wclk), .Q(\fiforeg[4][6] ) );
  DFFPOSX1 \fiforeg_reg[4][5]  ( .D(n118), .CLK(wclk), .Q(\fiforeg[4][5] ) );
  DFFPOSX1 \fiforeg_reg[4][4]  ( .D(n117), .CLK(wclk), .Q(\fiforeg[4][4] ) );
  DFFPOSX1 \fiforeg_reg[4][3]  ( .D(n116), .CLK(wclk), .Q(\fiforeg[4][3] ) );
  DFFPOSX1 \fiforeg_reg[4][2]  ( .D(n115), .CLK(wclk), .Q(\fiforeg[4][2] ) );
  DFFPOSX1 \fiforeg_reg[4][1]  ( .D(n114), .CLK(wclk), .Q(\fiforeg[4][1] ) );
  DFFPOSX1 \fiforeg_reg[4][0]  ( .D(n113), .CLK(wclk), .Q(\fiforeg[4][0] ) );
  DFFPOSX1 \fiforeg_reg[5][7]  ( .D(n112), .CLK(wclk), .Q(\fiforeg[5][7] ) );
  DFFPOSX1 \fiforeg_reg[5][6]  ( .D(n111), .CLK(wclk), .Q(\fiforeg[5][6] ) );
  DFFPOSX1 \fiforeg_reg[5][5]  ( .D(n110), .CLK(wclk), .Q(\fiforeg[5][5] ) );
  DFFPOSX1 \fiforeg_reg[5][4]  ( .D(n109), .CLK(wclk), .Q(\fiforeg[5][4] ) );
  DFFPOSX1 \fiforeg_reg[5][3]  ( .D(n108), .CLK(wclk), .Q(\fiforeg[5][3] ) );
  DFFPOSX1 \fiforeg_reg[5][2]  ( .D(n107), .CLK(wclk), .Q(\fiforeg[5][2] ) );
  DFFPOSX1 \fiforeg_reg[5][1]  ( .D(n106), .CLK(wclk), .Q(\fiforeg[5][1] ) );
  DFFPOSX1 \fiforeg_reg[5][0]  ( .D(n105), .CLK(wclk), .Q(\fiforeg[5][0] ) );
  DFFPOSX1 \fiforeg_reg[6][7]  ( .D(n104), .CLK(wclk), .Q(\fiforeg[6][7] ) );
  DFFPOSX1 \fiforeg_reg[6][6]  ( .D(n103), .CLK(wclk), .Q(\fiforeg[6][6] ) );
  DFFPOSX1 \fiforeg_reg[6][5]  ( .D(n102), .CLK(wclk), .Q(\fiforeg[6][5] ) );
  DFFPOSX1 \fiforeg_reg[6][4]  ( .D(n101), .CLK(wclk), .Q(\fiforeg[6][4] ) );
  DFFPOSX1 \fiforeg_reg[6][3]  ( .D(n100), .CLK(wclk), .Q(\fiforeg[6][3] ) );
  DFFPOSX1 \fiforeg_reg[6][2]  ( .D(n99), .CLK(wclk), .Q(\fiforeg[6][2] ) );
  DFFPOSX1 \fiforeg_reg[6][1]  ( .D(n98), .CLK(wclk), .Q(\fiforeg[6][1] ) );
  DFFPOSX1 \fiforeg_reg[6][0]  ( .D(n97), .CLK(wclk), .Q(\fiforeg[6][0] ) );
  DFFPOSX1 \fiforeg_reg[7][7]  ( .D(n96), .CLK(wclk), .Q(\fiforeg[7][7] ) );
  DFFPOSX1 \fiforeg_reg[7][6]  ( .D(n95), .CLK(wclk), .Q(\fiforeg[7][6] ) );
  DFFPOSX1 \fiforeg_reg[7][5]  ( .D(n94), .CLK(wclk), .Q(\fiforeg[7][5] ) );
  DFFPOSX1 \fiforeg_reg[7][4]  ( .D(n93), .CLK(wclk), .Q(\fiforeg[7][4] ) );
  DFFPOSX1 \fiforeg_reg[7][3]  ( .D(n92), .CLK(wclk), .Q(\fiforeg[7][3] ) );
  DFFPOSX1 \fiforeg_reg[7][2]  ( .D(n91), .CLK(wclk), .Q(\fiforeg[7][2] ) );
  DFFPOSX1 \fiforeg_reg[7][1]  ( .D(n90), .CLK(wclk), .Q(\fiforeg[7][1] ) );
  DFFPOSX1 \fiforeg_reg[7][0]  ( .D(n89), .CLK(wclk), .Q(\fiforeg[7][0] ) );
  BUFX2 U2 ( .A(n56), .Y(n1) );
  BUFX2 U3 ( .A(n175), .Y(n2) );
  BUFX2 U4 ( .A(n53), .Y(n3) );
  BUFX2 U5 ( .A(n172), .Y(n4) );
  BUFX2 U6 ( .A(n54), .Y(n5) );
  BUFX2 U7 ( .A(n173), .Y(n6) );
  BUFX2 U8 ( .A(n55), .Y(n7) );
  BUFX2 U9 ( .A(n174), .Y(n8) );
  NOR2X1 U10 ( .A(n63), .B(N11), .Y(n54) );
  NOR2X1 U11 ( .A(n63), .B(n62), .Y(n53) );
  AOI22X1 U12 ( .A(\fiforeg[4][0] ), .B(n5), .C(\fiforeg[6][0] ), .D(n3), .Y(
        n10) );
  NOR2X1 U13 ( .A(N11), .B(N12), .Y(n56) );
  NOR2X1 U14 ( .A(n62), .B(N12), .Y(n55) );
  AOI22X1 U15 ( .A(\fiforeg[0][0] ), .B(n1), .C(\fiforeg[2][0] ), .D(n7), .Y(
        n9) );
  AOI21X1 U16 ( .A(n10), .B(n9), .C(N10), .Y(n14) );
  AOI22X1 U17 ( .A(\fiforeg[5][0] ), .B(n5), .C(\fiforeg[7][0] ), .D(n3), .Y(
        n12) );
  AOI22X1 U18 ( .A(\fiforeg[1][0] ), .B(n1), .C(\fiforeg[3][0] ), .D(n7), .Y(
        n11) );
  AOI21X1 U19 ( .A(n12), .B(n11), .C(n61), .Y(n13) );
  OR2X1 U20 ( .A(n14), .B(n13), .Y(rdata[0]) );
  AOI22X1 U21 ( .A(\fiforeg[4][1] ), .B(n5), .C(\fiforeg[6][1] ), .D(n3), .Y(
        n16) );
  AOI22X1 U22 ( .A(\fiforeg[0][1] ), .B(n1), .C(\fiforeg[2][1] ), .D(n7), .Y(
        n15) );
  AOI21X1 U23 ( .A(n16), .B(n15), .C(N10), .Y(n20) );
  AOI22X1 U24 ( .A(\fiforeg[5][1] ), .B(n5), .C(\fiforeg[7][1] ), .D(n3), .Y(
        n18) );
  AOI22X1 U25 ( .A(\fiforeg[1][1] ), .B(n1), .C(\fiforeg[3][1] ), .D(n7), .Y(
        n17) );
  AOI21X1 U26 ( .A(n18), .B(n17), .C(n61), .Y(n19) );
  OR2X1 U27 ( .A(n20), .B(n19), .Y(rdata[1]) );
  AOI22X1 U28 ( .A(\fiforeg[4][2] ), .B(n5), .C(\fiforeg[6][2] ), .D(n3), .Y(
        n22) );
  AOI22X1 U29 ( .A(\fiforeg[0][2] ), .B(n1), .C(\fiforeg[2][2] ), .D(n7), .Y(
        n21) );
  AOI21X1 U30 ( .A(n22), .B(n21), .C(N10), .Y(n26) );
  AOI22X1 U31 ( .A(\fiforeg[5][2] ), .B(n5), .C(\fiforeg[7][2] ), .D(n3), .Y(
        n24) );
  AOI22X1 U32 ( .A(\fiforeg[1][2] ), .B(n1), .C(\fiforeg[3][2] ), .D(n7), .Y(
        n23) );
  AOI21X1 U33 ( .A(n24), .B(n23), .C(n61), .Y(n25) );
  OR2X1 U34 ( .A(n26), .B(n25), .Y(rdata[2]) );
  AOI22X1 U35 ( .A(\fiforeg[4][3] ), .B(n5), .C(\fiforeg[6][3] ), .D(n3), .Y(
        n28) );
  AOI22X1 U36 ( .A(\fiforeg[0][3] ), .B(n1), .C(\fiforeg[2][3] ), .D(n7), .Y(
        n27) );
  AOI21X1 U37 ( .A(n28), .B(n27), .C(N10), .Y(n32) );
  AOI22X1 U38 ( .A(\fiforeg[5][3] ), .B(n5), .C(\fiforeg[7][3] ), .D(n3), .Y(
        n30) );
  AOI22X1 U39 ( .A(\fiforeg[1][3] ), .B(n1), .C(\fiforeg[3][3] ), .D(n7), .Y(
        n29) );
  AOI21X1 U40 ( .A(n30), .B(n29), .C(n61), .Y(n31) );
  OR2X1 U41 ( .A(n32), .B(n31), .Y(rdata[3]) );
  AOI22X1 U42 ( .A(\fiforeg[4][4] ), .B(n5), .C(\fiforeg[6][4] ), .D(n3), .Y(
        n34) );
  AOI22X1 U43 ( .A(\fiforeg[0][4] ), .B(n1), .C(\fiforeg[2][4] ), .D(n7), .Y(
        n33) );
  AOI21X1 U44 ( .A(n34), .B(n33), .C(N10), .Y(n38) );
  AOI22X1 U45 ( .A(\fiforeg[5][4] ), .B(n5), .C(\fiforeg[7][4] ), .D(n3), .Y(
        n36) );
  AOI22X1 U46 ( .A(\fiforeg[1][4] ), .B(n1), .C(\fiforeg[3][4] ), .D(n7), .Y(
        n35) );
  AOI21X1 U47 ( .A(n36), .B(n35), .C(n61), .Y(n37) );
  OR2X1 U48 ( .A(n38), .B(n37), .Y(rdata[4]) );
  AOI22X1 U49 ( .A(\fiforeg[4][5] ), .B(n5), .C(\fiforeg[6][5] ), .D(n3), .Y(
        n40) );
  AOI22X1 U50 ( .A(\fiforeg[0][5] ), .B(n1), .C(\fiforeg[2][5] ), .D(n7), .Y(
        n39) );
  AOI21X1 U51 ( .A(n40), .B(n39), .C(N10), .Y(n44) );
  AOI22X1 U52 ( .A(\fiforeg[5][5] ), .B(n5), .C(\fiforeg[7][5] ), .D(n3), .Y(
        n42) );
  AOI22X1 U53 ( .A(\fiforeg[1][5] ), .B(n1), .C(\fiforeg[3][5] ), .D(n7), .Y(
        n41) );
  AOI21X1 U54 ( .A(n42), .B(n41), .C(n61), .Y(n43) );
  OR2X1 U55 ( .A(n44), .B(n43), .Y(rdata[5]) );
  AOI22X1 U56 ( .A(\fiforeg[4][6] ), .B(n5), .C(\fiforeg[6][6] ), .D(n3), .Y(
        n46) );
  AOI22X1 U57 ( .A(\fiforeg[0][6] ), .B(n1), .C(\fiforeg[2][6] ), .D(n7), .Y(
        n45) );
  AOI21X1 U58 ( .A(n46), .B(n45), .C(N10), .Y(n50) );
  AOI22X1 U59 ( .A(\fiforeg[5][6] ), .B(n5), .C(\fiforeg[7][6] ), .D(n3), .Y(
        n48) );
  AOI22X1 U60 ( .A(\fiforeg[1][6] ), .B(n1), .C(\fiforeg[3][6] ), .D(n7), .Y(
        n47) );
  AOI21X1 U61 ( .A(n48), .B(n47), .C(n61), .Y(n49) );
  OR2X1 U62 ( .A(n50), .B(n49), .Y(rdata[6]) );
  AOI22X1 U63 ( .A(\fiforeg[4][7] ), .B(n5), .C(\fiforeg[6][7] ), .D(n3), .Y(
        n52) );
  AOI22X1 U64 ( .A(\fiforeg[0][7] ), .B(n1), .C(\fiforeg[2][7] ), .D(n7), .Y(
        n51) );
  AOI21X1 U65 ( .A(n52), .B(n51), .C(N10), .Y(n60) );
  AOI22X1 U66 ( .A(\fiforeg[5][7] ), .B(n5), .C(\fiforeg[7][7] ), .D(n3), .Y(
        n58) );
  AOI22X1 U67 ( .A(\fiforeg[1][7] ), .B(n1), .C(\fiforeg[3][7] ), .D(n7), .Y(
        n57) );
  AOI21X1 U68 ( .A(n58), .B(n57), .C(n61), .Y(n59) );
  OR2X1 U69 ( .A(n60), .B(n59), .Y(rdata[7]) );
  INVX2 U70 ( .A(N10), .Y(n61) );
  INVX2 U71 ( .A(N11), .Y(n62) );
  INVX2 U72 ( .A(N12), .Y(n63) );
  NOR2X1 U73 ( .A(n211), .B(N14), .Y(n173) );
  NOR2X1 U74 ( .A(n211), .B(n180), .Y(n172) );
  AOI22X1 U75 ( .A(\fiforeg[4][0] ), .B(n6), .C(\fiforeg[6][0] ), .D(n4), .Y(
        n65) );
  NOR2X1 U76 ( .A(N14), .B(N15), .Y(n175) );
  NOR2X1 U77 ( .A(n180), .B(N15), .Y(n174) );
  AOI22X1 U78 ( .A(\fiforeg[0][0] ), .B(n2), .C(\fiforeg[2][0] ), .D(n8), .Y(
        n64) );
  AOI21X1 U79 ( .A(n65), .B(n64), .C(N13), .Y(n69) );
  AOI22X1 U80 ( .A(\fiforeg[5][0] ), .B(n6), .C(\fiforeg[7][0] ), .D(n4), .Y(
        n67) );
  AOI22X1 U81 ( .A(\fiforeg[1][0] ), .B(n2), .C(\fiforeg[3][0] ), .D(n8), .Y(
        n66) );
  AOI21X1 U82 ( .A(n67), .B(n66), .C(n212), .Y(n68) );
  OR2X1 U83 ( .A(n69), .B(n68), .Y(N24) );
  AOI22X1 U84 ( .A(\fiforeg[4][1] ), .B(n6), .C(\fiforeg[6][1] ), .D(n4), .Y(
        n71) );
  AOI22X1 U85 ( .A(\fiforeg[0][1] ), .B(n2), .C(\fiforeg[2][1] ), .D(n8), .Y(
        n70) );
  AOI21X1 U86 ( .A(n71), .B(n70), .C(N13), .Y(n75) );
  AOI22X1 U87 ( .A(\fiforeg[5][1] ), .B(n6), .C(\fiforeg[7][1] ), .D(n4), .Y(
        n73) );
  AOI22X1 U88 ( .A(\fiforeg[1][1] ), .B(n2), .C(\fiforeg[3][1] ), .D(n8), .Y(
        n72) );
  AOI21X1 U89 ( .A(n73), .B(n72), .C(n212), .Y(n74) );
  OR2X1 U90 ( .A(n75), .B(n74), .Y(N23) );
  AOI22X1 U91 ( .A(\fiforeg[4][2] ), .B(n6), .C(\fiforeg[6][2] ), .D(n4), .Y(
        n77) );
  AOI22X1 U92 ( .A(\fiforeg[0][2] ), .B(n2), .C(\fiforeg[2][2] ), .D(n8), .Y(
        n76) );
  AOI21X1 U93 ( .A(n77), .B(n76), .C(N13), .Y(n81) );
  AOI22X1 U94 ( .A(\fiforeg[5][2] ), .B(n6), .C(\fiforeg[7][2] ), .D(n4), .Y(
        n79) );
  AOI22X1 U95 ( .A(\fiforeg[1][2] ), .B(n2), .C(\fiforeg[3][2] ), .D(n8), .Y(
        n78) );
  AOI21X1 U96 ( .A(n79), .B(n78), .C(n212), .Y(n80) );
  OR2X1 U97 ( .A(n81), .B(n80), .Y(N22) );
  AOI22X1 U98 ( .A(\fiforeg[4][3] ), .B(n6), .C(\fiforeg[6][3] ), .D(n4), .Y(
        n83) );
  AOI22X1 U99 ( .A(\fiforeg[0][3] ), .B(n2), .C(\fiforeg[2][3] ), .D(n8), .Y(
        n82) );
  AOI21X1 U100 ( .A(n83), .B(n82), .C(N13), .Y(n87) );
  AOI22X1 U101 ( .A(\fiforeg[5][3] ), .B(n6), .C(\fiforeg[7][3] ), .D(n4), .Y(
        n85) );
  AOI22X1 U102 ( .A(\fiforeg[1][3] ), .B(n2), .C(\fiforeg[3][3] ), .D(n8), .Y(
        n84) );
  AOI21X1 U103 ( .A(n85), .B(n84), .C(n212), .Y(n86) );
  OR2X1 U104 ( .A(n87), .B(n86), .Y(N21) );
  AOI22X1 U105 ( .A(\fiforeg[4][4] ), .B(n6), .C(\fiforeg[6][4] ), .D(n4), .Y(
        n153) );
  AOI22X1 U106 ( .A(\fiforeg[0][4] ), .B(n2), .C(\fiforeg[2][4] ), .D(n8), .Y(
        n88) );
  AOI21X1 U107 ( .A(n153), .B(n88), .C(N13), .Y(n157) );
  AOI22X1 U108 ( .A(\fiforeg[5][4] ), .B(n6), .C(\fiforeg[7][4] ), .D(n4), .Y(
        n155) );
  AOI22X1 U109 ( .A(\fiforeg[1][4] ), .B(n2), .C(\fiforeg[3][4] ), .D(n8), .Y(
        n154) );
  AOI21X1 U110 ( .A(n155), .B(n154), .C(n212), .Y(n156) );
  OR2X1 U111 ( .A(n157), .B(n156), .Y(N20) );
  AOI22X1 U112 ( .A(\fiforeg[4][5] ), .B(n6), .C(\fiforeg[6][5] ), .D(n4), .Y(
        n159) );
  AOI22X1 U113 ( .A(\fiforeg[0][5] ), .B(n2), .C(\fiforeg[2][5] ), .D(n8), .Y(
        n158) );
  AOI21X1 U114 ( .A(n159), .B(n158), .C(N13), .Y(n163) );
  AOI22X1 U115 ( .A(\fiforeg[5][5] ), .B(n6), .C(\fiforeg[7][5] ), .D(n4), .Y(
        n161) );
  AOI22X1 U116 ( .A(\fiforeg[1][5] ), .B(n2), .C(\fiforeg[3][5] ), .D(n8), .Y(
        n160) );
  AOI21X1 U117 ( .A(n161), .B(n160), .C(n212), .Y(n162) );
  OR2X1 U118 ( .A(n163), .B(n162), .Y(N19) );
  AOI22X1 U119 ( .A(\fiforeg[4][6] ), .B(n6), .C(\fiforeg[6][6] ), .D(n4), .Y(
        n165) );
  AOI22X1 U120 ( .A(\fiforeg[0][6] ), .B(n2), .C(\fiforeg[2][6] ), .D(n8), .Y(
        n164) );
  AOI21X1 U121 ( .A(n165), .B(n164), .C(N13), .Y(n169) );
  AOI22X1 U122 ( .A(\fiforeg[5][6] ), .B(n6), .C(\fiforeg[7][6] ), .D(n4), .Y(
        n167) );
  AOI22X1 U123 ( .A(\fiforeg[1][6] ), .B(n2), .C(\fiforeg[3][6] ), .D(n8), .Y(
        n166) );
  AOI21X1 U124 ( .A(n167), .B(n166), .C(n212), .Y(n168) );
  OR2X1 U125 ( .A(n169), .B(n168), .Y(N18) );
  AOI22X1 U126 ( .A(\fiforeg[4][7] ), .B(n6), .C(\fiforeg[6][7] ), .D(n4), .Y(
        n171) );
  AOI22X1 U127 ( .A(\fiforeg[0][7] ), .B(n2), .C(\fiforeg[2][7] ), .D(n8), .Y(
        n170) );
  AOI21X1 U128 ( .A(n171), .B(n170), .C(N13), .Y(n179) );
  AOI22X1 U129 ( .A(\fiforeg[5][7] ), .B(n6), .C(\fiforeg[7][7] ), .D(n4), .Y(
        n177) );
  AOI22X1 U130 ( .A(\fiforeg[1][7] ), .B(n2), .C(\fiforeg[3][7] ), .D(n8), .Y(
        n176) );
  AOI21X1 U131 ( .A(n177), .B(n176), .C(n212), .Y(n178) );
  OR2X1 U132 ( .A(n179), .B(n178), .Y(N17) );
  INVX2 U133 ( .A(N14), .Y(n180) );
  MUX2X1 U134 ( .B(n181), .A(n182), .S(n183), .Y(n99) );
  INVX1 U135 ( .A(\fiforeg[6][2] ), .Y(n182) );
  MUX2X1 U136 ( .B(n184), .A(n185), .S(n183), .Y(n98) );
  INVX1 U137 ( .A(\fiforeg[6][1] ), .Y(n185) );
  MUX2X1 U138 ( .B(n186), .A(n187), .S(n183), .Y(n97) );
  INVX1 U139 ( .A(\fiforeg[6][0] ), .Y(n187) );
  MUX2X1 U140 ( .B(n188), .A(n189), .S(n190), .Y(n96) );
  INVX1 U141 ( .A(\fiforeg[7][7] ), .Y(n189) );
  MUX2X1 U142 ( .B(n191), .A(n192), .S(n190), .Y(n95) );
  INVX1 U143 ( .A(\fiforeg[7][6] ), .Y(n192) );
  MUX2X1 U144 ( .B(n193), .A(n194), .S(n190), .Y(n94) );
  INVX1 U145 ( .A(\fiforeg[7][5] ), .Y(n194) );
  MUX2X1 U146 ( .B(n195), .A(n196), .S(n190), .Y(n93) );
  INVX1 U147 ( .A(\fiforeg[7][4] ), .Y(n196) );
  MUX2X1 U148 ( .B(n197), .A(n198), .S(n190), .Y(n92) );
  INVX1 U149 ( .A(\fiforeg[7][3] ), .Y(n198) );
  MUX2X1 U150 ( .B(n181), .A(n199), .S(n190), .Y(n91) );
  INVX1 U151 ( .A(\fiforeg[7][2] ), .Y(n199) );
  MUX2X1 U152 ( .B(n184), .A(n200), .S(n190), .Y(n90) );
  INVX1 U153 ( .A(\fiforeg[7][1] ), .Y(n200) );
  MUX2X1 U154 ( .B(n186), .A(n201), .S(n190), .Y(n89) );
  NAND3X1 U155 ( .A(N15), .B(N14), .C(N13), .Y(n190) );
  INVX1 U156 ( .A(\fiforeg[7][0] ), .Y(n201) );
  MUX2X1 U157 ( .B(n188), .A(n202), .S(n203), .Y(n152) );
  INVX1 U158 ( .A(\fiforeg[0][7] ), .Y(n202) );
  MUX2X1 U159 ( .B(n191), .A(n204), .S(n203), .Y(n151) );
  INVX1 U160 ( .A(\fiforeg[0][6] ), .Y(n204) );
  MUX2X1 U161 ( .B(n193), .A(n205), .S(n203), .Y(n150) );
  INVX1 U162 ( .A(\fiforeg[0][5] ), .Y(n205) );
  MUX2X1 U163 ( .B(n195), .A(n206), .S(n203), .Y(n149) );
  INVX1 U164 ( .A(\fiforeg[0][4] ), .Y(n206) );
  MUX2X1 U165 ( .B(n197), .A(n207), .S(n203), .Y(n148) );
  INVX1 U166 ( .A(\fiforeg[0][3] ), .Y(n207) );
  MUX2X1 U167 ( .B(n181), .A(n208), .S(n203), .Y(n147) );
  INVX1 U168 ( .A(\fiforeg[0][2] ), .Y(n208) );
  MUX2X1 U169 ( .B(n184), .A(n209), .S(n203), .Y(n146) );
  INVX1 U170 ( .A(\fiforeg[0][1] ), .Y(n209) );
  MUX2X1 U171 ( .B(n186), .A(n210), .S(n203), .Y(n145) );
  NAND3X1 U172 ( .A(n180), .B(n211), .C(n212), .Y(n203) );
  INVX1 U173 ( .A(\fiforeg[0][0] ), .Y(n210) );
  MUX2X1 U174 ( .B(n188), .A(n213), .S(n214), .Y(n144) );
  INVX1 U175 ( .A(\fiforeg[1][7] ), .Y(n213) );
  MUX2X1 U176 ( .B(n191), .A(n215), .S(n214), .Y(n143) );
  INVX1 U177 ( .A(\fiforeg[1][6] ), .Y(n215) );
  MUX2X1 U178 ( .B(n193), .A(n216), .S(n214), .Y(n142) );
  INVX1 U179 ( .A(\fiforeg[1][5] ), .Y(n216) );
  MUX2X1 U180 ( .B(n195), .A(n217), .S(n214), .Y(n141) );
  INVX1 U181 ( .A(\fiforeg[1][4] ), .Y(n217) );
  MUX2X1 U182 ( .B(n197), .A(n218), .S(n214), .Y(n140) );
  INVX1 U183 ( .A(\fiforeg[1][3] ), .Y(n218) );
  MUX2X1 U184 ( .B(n181), .A(n219), .S(n214), .Y(n139) );
  INVX1 U185 ( .A(\fiforeg[1][2] ), .Y(n219) );
  MUX2X1 U186 ( .B(n184), .A(n220), .S(n214), .Y(n138) );
  INVX1 U187 ( .A(\fiforeg[1][1] ), .Y(n220) );
  MUX2X1 U188 ( .B(n186), .A(n221), .S(n214), .Y(n137) );
  NAND3X1 U189 ( .A(n180), .B(n211), .C(N13), .Y(n214) );
  INVX1 U190 ( .A(\fiforeg[1][0] ), .Y(n221) );
  MUX2X1 U191 ( .B(n188), .A(n222), .S(n223), .Y(n136) );
  INVX1 U192 ( .A(\fiforeg[2][7] ), .Y(n222) );
  MUX2X1 U193 ( .B(n191), .A(n224), .S(n223), .Y(n135) );
  INVX1 U194 ( .A(\fiforeg[2][6] ), .Y(n224) );
  MUX2X1 U195 ( .B(n193), .A(n225), .S(n223), .Y(n134) );
  INVX1 U196 ( .A(\fiforeg[2][5] ), .Y(n225) );
  MUX2X1 U197 ( .B(n195), .A(n226), .S(n223), .Y(n133) );
  INVX1 U198 ( .A(\fiforeg[2][4] ), .Y(n226) );
  MUX2X1 U199 ( .B(n197), .A(n227), .S(n223), .Y(n132) );
  INVX1 U200 ( .A(\fiforeg[2][3] ), .Y(n227) );
  MUX2X1 U201 ( .B(n181), .A(n228), .S(n223), .Y(n131) );
  INVX1 U202 ( .A(\fiforeg[2][2] ), .Y(n228) );
  MUX2X1 U203 ( .B(n184), .A(n229), .S(n223), .Y(n130) );
  INVX1 U204 ( .A(\fiforeg[2][1] ), .Y(n229) );
  MUX2X1 U205 ( .B(n186), .A(n230), .S(n223), .Y(n129) );
  NAND3X1 U206 ( .A(n212), .B(n211), .C(N14), .Y(n223) );
  INVX1 U207 ( .A(\fiforeg[2][0] ), .Y(n230) );
  MUX2X1 U208 ( .B(n188), .A(n231), .S(n232), .Y(n128) );
  INVX1 U209 ( .A(\fiforeg[3][7] ), .Y(n231) );
  MUX2X1 U210 ( .B(n191), .A(n233), .S(n232), .Y(n127) );
  INVX1 U211 ( .A(\fiforeg[3][6] ), .Y(n233) );
  MUX2X1 U212 ( .B(n193), .A(n234), .S(n232), .Y(n126) );
  INVX1 U213 ( .A(\fiforeg[3][5] ), .Y(n234) );
  MUX2X1 U214 ( .B(n195), .A(n235), .S(n232), .Y(n125) );
  INVX1 U215 ( .A(\fiforeg[3][4] ), .Y(n235) );
  MUX2X1 U216 ( .B(n197), .A(n236), .S(n232), .Y(n124) );
  INVX1 U217 ( .A(\fiforeg[3][3] ), .Y(n236) );
  MUX2X1 U218 ( .B(n181), .A(n237), .S(n232), .Y(n123) );
  INVX1 U219 ( .A(\fiforeg[3][2] ), .Y(n237) );
  MUX2X1 U220 ( .B(n184), .A(n238), .S(n232), .Y(n122) );
  INVX1 U221 ( .A(\fiforeg[3][1] ), .Y(n238) );
  MUX2X1 U222 ( .B(n186), .A(n239), .S(n232), .Y(n121) );
  NAND3X1 U223 ( .A(N14), .B(n211), .C(N13), .Y(n232) );
  INVX1 U224 ( .A(N15), .Y(n211) );
  INVX1 U225 ( .A(\fiforeg[3][0] ), .Y(n239) );
  MUX2X1 U226 ( .B(n188), .A(n240), .S(n241), .Y(n120) );
  INVX1 U227 ( .A(\fiforeg[4][7] ), .Y(n240) );
  MUX2X1 U228 ( .B(n191), .A(n242), .S(n241), .Y(n119) );
  INVX1 U229 ( .A(\fiforeg[4][6] ), .Y(n242) );
  MUX2X1 U230 ( .B(n193), .A(n243), .S(n241), .Y(n118) );
  INVX1 U231 ( .A(\fiforeg[4][5] ), .Y(n243) );
  MUX2X1 U232 ( .B(n195), .A(n244), .S(n241), .Y(n117) );
  INVX1 U233 ( .A(\fiforeg[4][4] ), .Y(n244) );
  MUX2X1 U234 ( .B(n197), .A(n245), .S(n241), .Y(n116) );
  INVX1 U235 ( .A(\fiforeg[4][3] ), .Y(n245) );
  MUX2X1 U236 ( .B(n181), .A(n246), .S(n241), .Y(n115) );
  INVX1 U237 ( .A(\fiforeg[4][2] ), .Y(n246) );
  MUX2X1 U238 ( .B(n184), .A(n247), .S(n241), .Y(n114) );
  INVX1 U239 ( .A(\fiforeg[4][1] ), .Y(n247) );
  MUX2X1 U240 ( .B(n186), .A(n248), .S(n241), .Y(n113) );
  NAND3X1 U241 ( .A(n212), .B(n180), .C(N15), .Y(n241) );
  INVX1 U242 ( .A(\fiforeg[4][0] ), .Y(n248) );
  MUX2X1 U243 ( .B(n188), .A(n249), .S(n250), .Y(n112) );
  INVX1 U244 ( .A(\fiforeg[5][7] ), .Y(n249) );
  MUX2X1 U245 ( .B(n191), .A(n251), .S(n250), .Y(n111) );
  INVX1 U246 ( .A(\fiforeg[5][6] ), .Y(n251) );
  MUX2X1 U247 ( .B(n193), .A(n252), .S(n250), .Y(n110) );
  INVX1 U248 ( .A(\fiforeg[5][5] ), .Y(n252) );
  MUX2X1 U249 ( .B(n195), .A(n253), .S(n250), .Y(n109) );
  INVX1 U250 ( .A(\fiforeg[5][4] ), .Y(n253) );
  MUX2X1 U251 ( .B(n197), .A(n254), .S(n250), .Y(n108) );
  INVX1 U252 ( .A(\fiforeg[5][3] ), .Y(n254) );
  MUX2X1 U253 ( .B(n181), .A(n255), .S(n250), .Y(n107) );
  INVX1 U254 ( .A(\fiforeg[5][2] ), .Y(n255) );
  MUX2X1 U255 ( .B(N22), .A(wdata[2]), .S(wenable), .Y(n181) );
  MUX2X1 U256 ( .B(n184), .A(n256), .S(n250), .Y(n106) );
  INVX1 U257 ( .A(\fiforeg[5][1] ), .Y(n256) );
  MUX2X1 U258 ( .B(N23), .A(wdata[1]), .S(wenable), .Y(n184) );
  MUX2X1 U259 ( .B(n186), .A(n257), .S(n250), .Y(n105) );
  NAND3X1 U260 ( .A(N15), .B(n180), .C(N13), .Y(n250) );
  INVX1 U261 ( .A(\fiforeg[5][0] ), .Y(n257) );
  MUX2X1 U262 ( .B(N24), .A(wdata[0]), .S(wenable), .Y(n186) );
  MUX2X1 U263 ( .B(n188), .A(n258), .S(n183), .Y(n104) );
  INVX1 U264 ( .A(\fiforeg[6][7] ), .Y(n258) );
  MUX2X1 U265 ( .B(N17), .A(wdata[7]), .S(wenable), .Y(n188) );
  MUX2X1 U266 ( .B(n191), .A(n259), .S(n183), .Y(n103) );
  INVX1 U267 ( .A(\fiforeg[6][6] ), .Y(n259) );
  MUX2X1 U268 ( .B(N18), .A(wdata[6]), .S(wenable), .Y(n191) );
  MUX2X1 U269 ( .B(n193), .A(n260), .S(n183), .Y(n102) );
  INVX1 U270 ( .A(\fiforeg[6][5] ), .Y(n260) );
  MUX2X1 U271 ( .B(N19), .A(wdata[5]), .S(wenable), .Y(n193) );
  MUX2X1 U272 ( .B(n195), .A(n261), .S(n183), .Y(n101) );
  INVX1 U273 ( .A(\fiforeg[6][4] ), .Y(n261) );
  MUX2X1 U274 ( .B(N20), .A(wdata[4]), .S(wenable), .Y(n195) );
  MUX2X1 U275 ( .B(n197), .A(n262), .S(n183), .Y(n100) );
  NAND3X1 U276 ( .A(N14), .B(n212), .C(N15), .Y(n183) );
  INVX1 U277 ( .A(N13), .Y(n212) );
  INVX1 U278 ( .A(\fiforeg[6][3] ), .Y(n262) );
  MUX2X1 U279 ( .B(N21), .A(wdata[3]), .S(wenable), .Y(n197) );
endmodule


module write_ptr ( wclk, rst_n, wenable, wptr, wptr_nxt );
  output [3:0] wptr;
  output [3:0] wptr_nxt;
  input wclk, rst_n, wenable;
  wire   n9, n10, n11, n12;
  wire   [2:0] binary_nxt;
  wire   [3:0] binary_r;

  DFFSR \binary_r_reg[0]  ( .D(binary_nxt[0]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[0]) );
  DFFSR \binary_r_reg[1]  ( .D(binary_nxt[1]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[1]) );
  DFFSR \binary_r_reg[2]  ( .D(binary_nxt[2]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[2]) );
  DFFSR \binary_r_reg[3]  ( .D(wptr_nxt[3]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[3]) );
  DFFSR \gray_r_reg[3]  ( .D(wptr_nxt[3]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wptr[3]) );
  DFFSR \gray_r_reg[2]  ( .D(wptr_nxt[2]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wptr[2]) );
  DFFSR \gray_r_reg[1]  ( .D(wptr_nxt[1]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wptr[1]) );
  DFFSR \gray_r_reg[0]  ( .D(wptr_nxt[0]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wptr[0]) );
  XOR2X1 U11 ( .A(wptr_nxt[3]), .B(binary_nxt[2]), .Y(wptr_nxt[2]) );
  XNOR2X1 U12 ( .A(n9), .B(binary_r[3]), .Y(wptr_nxt[3]) );
  NAND2X1 U13 ( .A(binary_r[2]), .B(n10), .Y(n9) );
  XOR2X1 U14 ( .A(binary_nxt[2]), .B(binary_nxt[1]), .Y(wptr_nxt[1]) );
  XOR2X1 U15 ( .A(binary_nxt[1]), .B(binary_nxt[0]), .Y(wptr_nxt[0]) );
  XOR2X1 U16 ( .A(n10), .B(binary_r[2]), .Y(binary_nxt[2]) );
  INVX1 U17 ( .A(n11), .Y(n10) );
  NAND3X1 U18 ( .A(binary_r[1]), .B(binary_r[0]), .C(wenable), .Y(n11) );
  XNOR2X1 U19 ( .A(n12), .B(binary_r[1]), .Y(binary_nxt[1]) );
  NAND2X1 U20 ( .A(wenable), .B(binary_r[0]), .Y(n12) );
  XOR2X1 U21 ( .A(binary_r[0]), .B(wenable), .Y(binary_nxt[0]) );
endmodule


module write_fifo_ctrl ( wclk, rst_n, wenable, rptr, wenable_fifo, wptr, waddr, 
        full_flag );
  input [3:0] rptr;
  output [3:0] wptr;
  output [2:0] waddr;
  input wclk, rst_n, wenable;
  output wenable_fifo, full_flag;
  wire   n22, \gray_wptr[2] , N5, n2, n3, n16, n17, n18, n19, n20, n21;
  wire   [3:0] wptr_nxt;
  wire   [3:0] wrptr_r2;
  wire   [3:0] wrptr_r1;

  DFFSR \wrptr_r1_reg[3]  ( .D(rptr[3]), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        wrptr_r1[3]) );
  DFFSR \wrptr_r1_reg[2]  ( .D(rptr[2]), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        wrptr_r1[2]) );
  DFFSR \wrptr_r1_reg[1]  ( .D(rptr[1]), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        wrptr_r1[1]) );
  DFFSR \wrptr_r1_reg[0]  ( .D(rptr[0]), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        wrptr_r1[0]) );
  DFFSR \wrptr_r2_reg[3]  ( .D(wrptr_r1[3]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wrptr_r2[3]) );
  DFFSR \wrptr_r2_reg[2]  ( .D(wrptr_r1[2]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wrptr_r2[2]) );
  DFFSR \wrptr_r2_reg[1]  ( .D(wrptr_r1[1]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wrptr_r2[1]) );
  DFFSR \wrptr_r2_reg[0]  ( .D(wrptr_r1[0]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wrptr_r2[0]) );
  DFFSR full_flag_r_reg ( .D(N5), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        full_flag) );
  DFFSR \waddr_reg[2]  ( .D(\gray_wptr[2] ), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(waddr[2]) );
  DFFSR \waddr_reg[1]  ( .D(wptr_nxt[1]), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        waddr[1]) );
  DFFSR \waddr_reg[0]  ( .D(wptr_nxt[0]), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        waddr[0]) );
  write_ptr WPU1 ( .wclk(wclk), .rst_n(rst_n), .wenable(wenable_fifo), .wptr(
        wptr), .wptr_nxt(wptr_nxt) );
  BUFX2 U15 ( .A(n22), .Y(wenable_fifo) );
  NOR2X1 U16 ( .A(full_flag), .B(n2), .Y(n22) );
  INVX1 U17 ( .A(wenable), .Y(n2) );
  NOR2X1 U18 ( .A(n3), .B(n16), .Y(N5) );
  NAND2X1 U19 ( .A(n17), .B(n18), .Y(n16) );
  XOR2X1 U20 ( .A(n19), .B(\gray_wptr[2] ), .Y(n18) );
  XOR2X1 U21 ( .A(wptr_nxt[3]), .B(wptr_nxt[2]), .Y(\gray_wptr[2] ) );
  XNOR2X1 U22 ( .A(wrptr_r2[3]), .B(wrptr_r2[2]), .Y(n19) );
  XNOR2X1 U23 ( .A(wrptr_r2[1]), .B(wptr_nxt[1]), .Y(n17) );
  NAND2X1 U24 ( .A(n20), .B(n21), .Y(n3) );
  XOR2X1 U25 ( .A(wrptr_r2[3]), .B(wptr_nxt[3]), .Y(n21) );
  XNOR2X1 U26 ( .A(wrptr_r2[0]), .B(wptr_nxt[0]), .Y(n20) );
endmodule


module read_ptr ( rclk, rst_n, renable, rptr, rptr_nxt );
  output [3:0] rptr;
  output [3:0] rptr_nxt;
  input rclk, rst_n, renable;
  wire   n9, n10, n11, n12;
  wire   [2:0] binary_nxt;
  wire   [3:0] binary_r;

  DFFSR \binary_r_reg[0]  ( .D(binary_nxt[0]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[0]) );
  DFFSR \binary_r_reg[1]  ( .D(binary_nxt[1]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[1]) );
  DFFSR \binary_r_reg[2]  ( .D(binary_nxt[2]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[2]) );
  DFFSR \binary_r_reg[3]  ( .D(rptr_nxt[3]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[3]) );
  DFFSR \gray_r_reg[3]  ( .D(rptr_nxt[3]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rptr[3]) );
  DFFSR \gray_r_reg[2]  ( .D(rptr_nxt[2]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rptr[2]) );
  DFFSR \gray_r_reg[1]  ( .D(rptr_nxt[1]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rptr[1]) );
  DFFSR \gray_r_reg[0]  ( .D(rptr_nxt[0]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rptr[0]) );
  XOR2X1 U11 ( .A(rptr_nxt[3]), .B(binary_nxt[2]), .Y(rptr_nxt[2]) );
  XNOR2X1 U12 ( .A(n9), .B(binary_r[3]), .Y(rptr_nxt[3]) );
  NAND2X1 U13 ( .A(binary_r[2]), .B(n10), .Y(n9) );
  XOR2X1 U14 ( .A(binary_nxt[2]), .B(binary_nxt[1]), .Y(rptr_nxt[1]) );
  XOR2X1 U15 ( .A(binary_nxt[1]), .B(binary_nxt[0]), .Y(rptr_nxt[0]) );
  XOR2X1 U16 ( .A(n10), .B(binary_r[2]), .Y(binary_nxt[2]) );
  INVX1 U17 ( .A(n11), .Y(n10) );
  NAND3X1 U18 ( .A(binary_r[1]), .B(binary_r[0]), .C(renable), .Y(n11) );
  XNOR2X1 U19 ( .A(n12), .B(binary_r[1]), .Y(binary_nxt[1]) );
  NAND2X1 U20 ( .A(renable), .B(binary_r[0]), .Y(n12) );
  XOR2X1 U21 ( .A(binary_r[0]), .B(renable), .Y(binary_nxt[0]) );
endmodule


module read_fifo_ctrl ( rclk, rst_n, renable, wptr, rptr, raddr, empty_flag );
  input [3:0] wptr;
  output [3:0] rptr;
  output [2:0] raddr;
  input rclk, rst_n, renable;
  output empty_flag;
  wire   renable_p2, \gray_rptr[2] , N3, n1, n2, n3, n16, n17, n18, n19, n20;
  wire   [3:0] rptr_nxt;
  wire   [3:0] rwptr_r2;
  wire   [3:0] rwptr_r1;

  DFFSR \rwptr_r1_reg[3]  ( .D(wptr[3]), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        rwptr_r1[3]) );
  DFFSR \rwptr_r1_reg[2]  ( .D(wptr[2]), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        rwptr_r1[2]) );
  DFFSR \rwptr_r1_reg[1]  ( .D(wptr[1]), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        rwptr_r1[1]) );
  DFFSR \rwptr_r1_reg[0]  ( .D(wptr[0]), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        rwptr_r1[0]) );
  DFFSR \rwptr_r2_reg[3]  ( .D(rwptr_r1[3]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rwptr_r2[3]) );
  DFFSR \rwptr_r2_reg[2]  ( .D(rwptr_r1[2]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rwptr_r2[2]) );
  DFFSR \rwptr_r2_reg[1]  ( .D(rwptr_r1[1]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rwptr_r2[1]) );
  DFFSR \rwptr_r2_reg[0]  ( .D(rwptr_r1[0]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rwptr_r2[0]) );
  DFFSR empty_flag_r_reg ( .D(N3), .CLK(rclk), .R(1'b1), .S(rst_n), .Q(
        empty_flag) );
  DFFSR \raddr_reg[2]  ( .D(\gray_rptr[2] ), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(raddr[2]) );
  DFFSR \raddr_reg[1]  ( .D(rptr_nxt[1]), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        raddr[1]) );
  DFFSR \raddr_reg[0]  ( .D(rptr_nxt[0]), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        raddr[0]) );
  read_ptr RPU1 ( .rclk(rclk), .rst_n(rst_n), .renable(renable_p2), .rptr(rptr), .rptr_nxt(rptr_nxt) );
  NOR2X1 U15 ( .A(empty_flag), .B(n1), .Y(renable_p2) );
  INVX1 U16 ( .A(renable), .Y(n1) );
  NOR2X1 U17 ( .A(n2), .B(n3), .Y(N3) );
  NAND2X1 U18 ( .A(n16), .B(n17), .Y(n3) );
  XOR2X1 U19 ( .A(n18), .B(\gray_rptr[2] ), .Y(n17) );
  XOR2X1 U20 ( .A(rptr_nxt[3]), .B(rptr_nxt[2]), .Y(\gray_rptr[2] ) );
  XNOR2X1 U21 ( .A(rwptr_r2[3]), .B(rwptr_r2[2]), .Y(n18) );
  XNOR2X1 U22 ( .A(rwptr_r2[1]), .B(rptr_nxt[1]), .Y(n16) );
  NAND2X1 U23 ( .A(n19), .B(n20), .Y(n2) );
  XNOR2X1 U24 ( .A(rwptr_r2[0]), .B(rptr_nxt[0]), .Y(n20) );
  XNOR2X1 U25 ( .A(rptr_nxt[3]), .B(rwptr_r2[3]), .Y(n19) );
endmodule


module fifo ( r_clk, w_clk, n_rst, r_enable, w_enable, w_data, r_data, empty, 
        full );
  input [7:0] w_data;
  output [7:0] r_data;
  input r_clk, w_clk, n_rst, r_enable, w_enable;
  output empty, full;
  wire   wenable_fifo;
  wire   [2:0] waddr;
  wire   [2:0] raddr;
  wire   [3:0] rptr;
  wire   [3:0] wptr;

  fiforam UFIFORAM ( .wclk(w_clk), .wenable(wenable_fifo), .waddr(waddr), 
        .raddr(raddr), .wdata(w_data), .rdata(r_data) );
  write_fifo_ctrl UWFC ( .wclk(w_clk), .rst_n(n_rst), .wenable(w_enable), 
        .rptr(rptr), .wenable_fifo(wenable_fifo), .wptr(wptr), .waddr(waddr), 
        .full_flag(full) );
  read_fifo_ctrl URFC ( .rclk(r_clk), .rst_n(n_rst), .renable(r_enable), 
        .wptr(wptr), .rptr(rptr), .raddr(raddr), .empty_flag(empty) );
endmodule


module rx_fifo ( clk, n_rst, r_enable, w_enable, w_data, r_data, empty, full
 );
  input [7:0] w_data;
  output [7:0] r_data;
  input clk, n_rst, r_enable, w_enable;
  output empty, full;


  fifo A1 ( .r_clk(clk), .w_clk(clk), .n_rst(n_rst), .r_enable(r_enable), 
        .w_enable(w_enable), .w_data(w_data), .r_data(r_data), .empty(empty), 
        .full(full) );
endmodule


module usb_receiver ( clk, n_rst, d_plus, d_minus, r_enable, r_data, empty, 
        full, rcving, r_error );
  output [7:0] r_data;
  input clk, n_rst, d_plus, d_minus, r_enable;
  output empty, full, rcving, r_error;
  wire   d_plus_sync, d_minus_sync, eop, shift_enable, d_orig, d_edge,
         byte_received, w_enable;
  wire   [7:0] rcv_data;

  sync_high sync_high1 ( .clk(clk), .n_rst(n_rst), .async_in(d_plus), 
        .sync_out(d_plus_sync) );
  sync_low sync_low1 ( .clk(clk), .n_rst(n_rst), .async_in(d_minus), 
        .sync_out(d_minus_sync) );
  eop_detect eop_detect1 ( .d_plus(d_plus_sync), .d_minus(d_minus_sync), .eop(
        eop) );
  decode decode1 ( .clk(clk), .n_rst(n_rst), .d_plus(d_plus_sync), 
        .shift_enable(shift_enable), .eop(eop), .d_orig(d_orig) );
  edge_detect edge_detect1 ( .clk(clk), .n_rst(n_rst), .d_plus(d_plus_sync), 
        .d_edge(d_edge) );
  timer timer1 ( .clk(clk), .n_rst(n_rst), .d_edge(d_edge), .rcving(rcving), 
        .shift_enable(shift_enable), .byte_received(byte_received) );
  shift_register shift_register1 ( .clk(clk), .n_rst(n_rst), .shift_enable(
        shift_enable), .d_orig(d_orig), .rcv_data(rcv_data) );
  rcu rcu1 ( .clk(clk), .n_rst(n_rst), .d_edge(d_edge), .eop(eop), 
        .shift_enable(shift_enable), .rcv_data(rcv_data), .byte_received(
        byte_received), .rcving(rcving), .w_enable(w_enable), .r_error(r_error) );
  rx_fifo rx_fifo1 ( .clk(clk), .n_rst(n_rst), .r_enable(r_enable), .w_enable(
        w_enable), .w_data(rcv_data), .r_data(r_data), .empty(empty), .full(
        full) );
endmodule

