/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Mon Apr 23 21:06:31 2018
/////////////////////////////////////////////////////////////


module sync_high_1 ( clk, n_rst, async_in, sync_out );
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


module decode ( clk, n_rst, d_plus, d_minus, sync_shift_enable, 
        pid_shift_enable, crc5_shift_enable, crc16_shift_enable, 
        data_shift_enable, eop, d_orig );
  input clk, n_rst, d_plus, d_minus, sync_shift_enable, pid_shift_enable,
         crc5_shift_enable, crc16_shift_enable, data_shift_enable, eop;
  output d_orig;
  wire   stored_bit, current_bit, n8, n9, n12, n1, n2, n3, n4, n5, n6;
  tri   d_orig;

  DFFSR current_bit_reg ( .D(d_plus), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        current_bit) );
  DFFSR stored_bit_reg ( .D(n12), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        stored_bit) );
  TBUFX1 d_orig_tri ( .A(n8), .EN(n9), .Y(d_orig) );
  NAND2X1 U3 ( .A(d_plus), .B(d_minus), .Y(n9) );
  XOR2X1 U4 ( .A(stored_bit), .B(current_bit), .Y(n8) );
  NAND2X1 U5 ( .A(n1), .B(n2), .Y(n12) );
  MUX2X1 U6 ( .B(d_plus), .A(stored_bit), .S(n3), .Y(n2) );
  AND2X1 U7 ( .A(n4), .B(n5), .Y(n3) );
  NOR2X1 U8 ( .A(data_shift_enable), .B(n6), .Y(n5) );
  OR2X1 U9 ( .A(sync_shift_enable), .B(pid_shift_enable), .Y(n6) );
  NOR2X1 U10 ( .A(crc5_shift_enable), .B(crc16_shift_enable), .Y(n4) );
  INVX1 U11 ( .A(eop), .Y(n1) );
endmodule


module edge_detect ( clk, n_rst, d_plus, d_minus, d_edge );
  input clk, n_rst, d_plus, d_minus;
  output d_edge;
  wire   d_prev, d_current;

  DFFSR d_current_reg ( .D(d_plus), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        d_current) );
  DFFSR d_prev_reg ( .D(d_current), .CLK(clk), .R(1'b1), .S(n_rst), .Q(d_prev)
         );
  XOR2X1 U5 ( .A(d_prev), .B(d_current), .Y(d_edge) );
endmodule


module flex_counter_NUM_CNT_BITS32_19_DW01_inc_0 ( A, SUM );
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


module flex_counter_NUM_CNT_BITS32_19 ( clk, n_rst, clear, count_enable, 
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
  flex_counter_NUM_CNT_BITS32_19_DW01_inc_0 add_35 ( .A(count_out), .SUM({N39, 
        N38, N37, N36, N35, N34, N33, N32, N31, N30, N29, N28, N27, N26, N25, 
        N24, N23, N22, N21, N20, N19, N18, N17, N16, N15, N14, N13, N12, N11, 
        N10, N9, N8}) );
  BUFX2 U36 ( .A(n2), .Y(n1) );
  AND2X2 U37 ( .A(n44), .B(n1), .Y(n39) );
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


module flex_counter_NUM_CNT_BITS32_18_DW01_inc_0 ( A, SUM );
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


module flex_counter_NUM_CNT_BITS32_18 ( clk, n_rst, clear, count_enable, 
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
  flex_counter_NUM_CNT_BITS32_18_DW01_inc_0 add_35 ( .A(count_out), .SUM({N39, 
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


module flex_counter_NUM_CNT_BITS32_17_DW01_inc_0 ( A, SUM );
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


module flex_counter_NUM_CNT_BITS32_17 ( clk, n_rst, clear, count_enable, 
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
  flex_counter_NUM_CNT_BITS32_17_DW01_inc_0 add_35 ( .A(count_out), .SUM({N39, 
        N38, N37, N36, N35, N34, N33, N32, N31, N30, N29, N28, N27, N26, N25, 
        N24, N23, N22, N21, N20, N19, N18, N17, N16, N15, N14, N13, N12, N11, 
        N10, N9, N8}) );
  BUFX2 U36 ( .A(n2), .Y(n1) );
  AND2X2 U37 ( .A(n44), .B(n1), .Y(n39) );
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


module flex_counter_NUM_CNT_BITS32_16_DW01_inc_0 ( A, SUM );
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


module flex_counter_NUM_CNT_BITS32_16 ( clk, n_rst, clear, count_enable, 
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
  flex_counter_NUM_CNT_BITS32_16_DW01_inc_0 add_35 ( .A(count_out), .SUM({N39, 
        N38, N37, N36, N35, N34, N33, N32, N31, N30, N29, N28, N27, N26, N25, 
        N24, N23, N22, N21, N20, N19, N18, N17, N16, N15, N14, N13, N12, N11, 
        N10, N9, N8}) );
  BUFX2 U36 ( .A(n2), .Y(n1) );
  AND2X2 U37 ( .A(n44), .B(n1), .Y(n39) );
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


module flex_counter_NUM_CNT_BITS32_15_DW01_inc_0 ( A, SUM );
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


module flex_counter_NUM_CNT_BITS32_15 ( clk, n_rst, clear, count_enable, 
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
  flex_counter_NUM_CNT_BITS32_15_DW01_inc_0 add_35 ( .A(count_out), .SUM({N39, 
        N38, N37, N36, N35, N34, N33, N32, N31, N30, N29, N28, N27, N26, N25, 
        N24, N23, N22, N21, N20, N19, N18, N17, N16, N15, N14, N13, N12, N11, 
        N10, N9, N8}) );
  BUFX2 U36 ( .A(n2), .Y(n1) );
  AND2X2 U37 ( .A(n44), .B(n1), .Y(n39) );
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


module flex_counter_NUM_CNT_BITS32_14_DW01_inc_0 ( A, SUM );
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


module flex_counter_NUM_CNT_BITS32_14 ( clk, n_rst, clear, count_enable, 
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
  flex_counter_NUM_CNT_BITS32_14_DW01_inc_0 add_35 ( .A(count_out), .SUM({N39, 
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


module flex_counter_NUM_CNT_BITS32_13_DW01_inc_0 ( A, SUM );
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


module flex_counter_NUM_CNT_BITS32_13 ( clk, n_rst, clear, count_enable, 
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
  flex_counter_NUM_CNT_BITS32_13_DW01_inc_0 add_35 ( .A(count_out), .SUM({N39, 
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


module flex_counter_NUM_CNT_BITS32_12_DW01_inc_0 ( A, SUM );
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


module flex_counter_NUM_CNT_BITS32_12 ( clk, n_rst, clear, count_enable, 
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
  flex_counter_NUM_CNT_BITS32_12_DW01_inc_0 add_35 ( .A(count_out), .SUM({N39, 
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


module flex_counter_NUM_CNT_BITS32_11_DW01_inc_0 ( A, SUM );
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


module flex_counter_NUM_CNT_BITS32_11 ( clk, n_rst, clear, count_enable, 
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
  flex_counter_NUM_CNT_BITS32_11_DW01_inc_0 add_35 ( .A(count_out), .SUM({N39, 
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


module flex_counter_NUM_CNT_BITS32_10_DW01_inc_0 ( A, SUM );
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


module flex_counter_NUM_CNT_BITS32_10 ( clk, n_rst, clear, count_enable, 
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
  flex_counter_NUM_CNT_BITS32_10_DW01_inc_0 add_35 ( .A(count_out), .SUM({N39, 
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


module timer ( clk, n_rst, d_edge, sync_rcving, pid_rcving, crc5_rcving, 
        crc16_rcving, data_rcving, sync_shift_enable, pid_shift_enable, 
        crc5_shift_enable, crc16_shift_enable, data_shift_enable, 
        sync_bits_received, pid_bits_received, crc5_bits_received, 
        crc16_bits_received, data_bits_received );
  input clk, n_rst, d_edge, sync_rcving, pid_rcving, crc5_rcving, crc16_rcving,
         data_rcving;
  output sync_shift_enable, pid_shift_enable, crc5_shift_enable,
         crc16_shift_enable, data_shift_enable, sync_bits_received,
         pid_bits_received, crc5_bits_received, crc16_bits_received,
         data_bits_received;
  wire   current_sync_bits_received, prev_sync_bits_received,
         current_pid_bits_received, prev_pid_bits_received,
         current_crc5_bits_received, prev_crc5_bits_received,
         current_crc16_bits_received, prev_crc16_bits_received,
         current_data_bits_received, prev_data_bits_received,
         async_sync_bits_received, async_pid_bits_received,
         async_crc5_bits_received, async_crc16_bits_received,
         async_data_bits_received, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n149, n150, n151, n152, n153, n154, n155, n161, n162,
         n163, n164, n165;
  wire   [31:0] sync_count_out;
  wire   [31:0] pid_count_out;
  wire   [31:0] crc5_count_out;
  wire   [31:0] crc16_count_out;
  wire   [31:0] data_count_out;

  DFFSR current_sync_bits_received_reg ( .D(async_sync_bits_received), .CLK(
        clk), .R(n_rst), .S(1'b1), .Q(current_sync_bits_received) );
  DFFSR prev_sync_bits_received_reg ( .D(current_sync_bits_received), .CLK(clk), .R(n_rst), .S(1'b1), .Q(prev_sync_bits_received) );
  DFFSR current_pid_bits_received_reg ( .D(async_pid_bits_received), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(current_pid_bits_received) );
  DFFSR prev_pid_bits_received_reg ( .D(current_pid_bits_received), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(prev_pid_bits_received) );
  DFFSR current_crc5_bits_received_reg ( .D(async_crc5_bits_received), .CLK(
        clk), .R(n_rst), .S(1'b1), .Q(current_crc5_bits_received) );
  DFFSR prev_crc5_bits_received_reg ( .D(current_crc5_bits_received), .CLK(clk), .R(n_rst), .S(1'b1), .Q(prev_crc5_bits_received) );
  DFFSR current_crc16_bits_received_reg ( .D(async_crc16_bits_received), .CLK(
        clk), .R(n_rst), .S(1'b1), .Q(current_crc16_bits_received) );
  DFFSR prev_crc16_bits_received_reg ( .D(current_crc16_bits_received), .CLK(
        clk), .R(n_rst), .S(1'b1), .Q(prev_crc16_bits_received) );
  DFFSR current_data_bits_received_reg ( .D(async_data_bits_received), .CLK(
        clk), .R(n_rst), .S(1'b1), .Q(current_data_bits_received) );
  DFFSR prev_data_bits_received_reg ( .D(current_data_bits_received), .CLK(clk), .R(n_rst), .S(1'b1), .Q(prev_data_bits_received) );
  flex_counter_NUM_CNT_BITS32_19 sync_bit_shift ( .clk(clk), .n_rst(n_rst), 
        .clear(d_edge), .count_enable(sync_rcving), .rollover_val({1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0}), .count_out(sync_count_out) );
  flex_counter_NUM_CNT_BITS32_18 pid_bit_shift ( .clk(clk), .n_rst(n_rst), 
        .clear(d_edge), .count_enable(pid_rcving), .rollover_val({1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0}), .count_out(pid_count_out) );
  flex_counter_NUM_CNT_BITS32_17 crc5_bit_shift ( .clk(clk), .n_rst(n_rst), 
        .clear(d_edge), .count_enable(crc5_rcving), .rollover_val({1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0}), .count_out(crc5_count_out) );
  flex_counter_NUM_CNT_BITS32_16 crc16_bit_shift ( .clk(clk), .n_rst(n_rst), 
        .clear(d_edge), .count_enable(crc16_rcving), .rollover_val({1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0}), .count_out(crc16_count_out) );
  flex_counter_NUM_CNT_BITS32_15 data_bit_shift ( .clk(clk), .n_rst(n_rst), 
        .clear(d_edge), .count_enable(data_rcving), .rollover_val({1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0}), .count_out(data_count_out) );
  flex_counter_NUM_CNT_BITS32_14 sync_bits_receive ( .clk(clk), .n_rst(n_rst), 
        .clear(n161), .count_enable(sync_shift_enable), .rollover_val({1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0}), .rollover_flag(
        async_sync_bits_received) );
  flex_counter_NUM_CNT_BITS32_13 pid_bits_receive ( .clk(clk), .n_rst(n_rst), 
        .clear(n162), .count_enable(pid_shift_enable), .rollover_val({1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0}), .rollover_flag(
        async_pid_bits_received) );
  flex_counter_NUM_CNT_BITS32_12 crc5_bits_receive ( .clk(clk), .n_rst(n_rst), 
        .clear(n165), .count_enable(crc5_shift_enable), .rollover_val({1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b1}), .rollover_flag(
        async_crc5_bits_received) );
  flex_counter_NUM_CNT_BITS32_11 crc16_bits_receive ( .clk(clk), .n_rst(n_rst), 
        .clear(n164), .count_enable(crc16_shift_enable), .rollover_val({1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0}), .rollover_flag(
        async_crc16_bits_received) );
  flex_counter_NUM_CNT_BITS32_10 data_bits_receive ( .clk(clk), .n_rst(n_rst), 
        .clear(n163), .count_enable(data_shift_enable), .rollover_val({1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .rollover_flag(
        async_data_bits_received) );
  INVX2 U13 ( .A(n69), .Y(crc16_shift_enable) );
  INVX8 U14 ( .A(n97), .Y(data_shift_enable) );
  NOR2X1 U15 ( .A(prev_sync_bits_received), .B(n11), .Y(sync_bits_received) );
  INVX1 U16 ( .A(current_sync_bits_received), .Y(n11) );
  NOR2X1 U17 ( .A(prev_pid_bits_received), .B(n12), .Y(pid_bits_received) );
  INVX1 U18 ( .A(current_pid_bits_received), .Y(n12) );
  INVX1 U19 ( .A(n13), .Y(pid_shift_enable) );
  NAND3X1 U20 ( .A(n14), .B(n15), .C(n16), .Y(n13) );
  NOR2X1 U21 ( .A(n17), .B(n18), .Y(n16) );
  NAND3X1 U22 ( .A(n19), .B(n20), .C(n21), .Y(n18) );
  AND2X1 U23 ( .A(n22), .B(n23), .Y(n21) );
  NOR2X1 U24 ( .A(pid_count_out[30]), .B(pid_count_out[29]), .Y(n23) );
  NOR2X1 U25 ( .A(pid_count_out[28]), .B(pid_count_out[27]), .Y(n22) );
  NOR2X1 U26 ( .A(pid_count_out[26]), .B(pid_count_out[25]), .Y(n20) );
  NOR2X1 U27 ( .A(pid_count_out[24]), .B(pid_count_out[23]), .Y(n19) );
  NAND3X1 U28 ( .A(n24), .B(n25), .C(n26), .Y(n17) );
  AND2X1 U29 ( .A(n27), .B(n28), .Y(n26) );
  NOR2X1 U30 ( .A(pid_count_out[9]), .B(pid_count_out[8]), .Y(n28) );
  NOR2X1 U31 ( .A(pid_count_out[7]), .B(pid_count_out[6]), .Y(n27) );
  NOR2X1 U32 ( .A(pid_count_out[5]), .B(pid_count_out[4]), .Y(n25) );
  NOR2X1 U33 ( .A(pid_count_out[3]), .B(pid_count_out[31]), .Y(n24) );
  NOR2X1 U34 ( .A(n29), .B(n30), .Y(n15) );
  NAND2X1 U35 ( .A(n31), .B(n32), .Y(n30) );
  NOR2X1 U36 ( .A(pid_count_out[19]), .B(pid_count_out[18]), .Y(n32) );
  NOR2X1 U37 ( .A(pid_count_out[17]), .B(pid_count_out[16]), .Y(n31) );
  NAND2X1 U38 ( .A(n33), .B(n34), .Y(n29) );
  NOR2X1 U39 ( .A(pid_count_out[22]), .B(pid_count_out[21]), .Y(n34) );
  NOR2X1 U40 ( .A(pid_count_out[20]), .B(pid_count_out[1]), .Y(n33) );
  NOR2X1 U41 ( .A(n35), .B(n36), .Y(n14) );
  NAND3X1 U42 ( .A(pid_count_out[2]), .B(n37), .C(n38), .Y(n36) );
  NOR2X1 U43 ( .A(pid_count_out[11]), .B(pid_count_out[10]), .Y(n38) );
  INVX1 U44 ( .A(pid_count_out[0]), .Y(n37) );
  NAND2X1 U45 ( .A(n39), .B(n40), .Y(n35) );
  NOR2X1 U46 ( .A(pid_count_out[15]), .B(pid_count_out[14]), .Y(n40) );
  NOR2X1 U47 ( .A(pid_count_out[13]), .B(pid_count_out[12]), .Y(n39) );
  INVX1 U48 ( .A(n41), .Y(crc5_shift_enable) );
  NAND3X1 U49 ( .A(n42), .B(n43), .C(n44), .Y(n41) );
  NOR2X1 U50 ( .A(n45), .B(n46), .Y(n44) );
  NAND3X1 U51 ( .A(n47), .B(n48), .C(n49), .Y(n46) );
  AND2X1 U52 ( .A(n50), .B(n51), .Y(n49) );
  NOR2X1 U53 ( .A(crc5_count_out[30]), .B(crc5_count_out[29]), .Y(n51) );
  NOR2X1 U54 ( .A(crc5_count_out[28]), .B(crc5_count_out[27]), .Y(n50) );
  NOR2X1 U55 ( .A(crc5_count_out[26]), .B(crc5_count_out[25]), .Y(n48) );
  NOR2X1 U56 ( .A(crc5_count_out[24]), .B(crc5_count_out[23]), .Y(n47) );
  NAND3X1 U57 ( .A(n52), .B(n53), .C(n54), .Y(n45) );
  AND2X1 U58 ( .A(n55), .B(n56), .Y(n54) );
  NOR2X1 U59 ( .A(crc5_count_out[9]), .B(crc5_count_out[8]), .Y(n56) );
  NOR2X1 U60 ( .A(crc5_count_out[7]), .B(crc5_count_out[6]), .Y(n55) );
  NOR2X1 U61 ( .A(crc5_count_out[5]), .B(crc5_count_out[4]), .Y(n53) );
  NOR2X1 U62 ( .A(crc5_count_out[3]), .B(crc5_count_out[31]), .Y(n52) );
  NOR2X1 U63 ( .A(n57), .B(n58), .Y(n43) );
  NAND2X1 U64 ( .A(n59), .B(n60), .Y(n58) );
  NOR2X1 U65 ( .A(crc5_count_out[19]), .B(crc5_count_out[18]), .Y(n60) );
  NOR2X1 U66 ( .A(crc5_count_out[17]), .B(crc5_count_out[16]), .Y(n59) );
  NAND2X1 U67 ( .A(n61), .B(n62), .Y(n57) );
  NOR2X1 U68 ( .A(crc5_count_out[22]), .B(crc5_count_out[21]), .Y(n62) );
  NOR2X1 U69 ( .A(crc5_count_out[20]), .B(crc5_count_out[1]), .Y(n61) );
  NOR2X1 U70 ( .A(n63), .B(n64), .Y(n42) );
  NAND3X1 U71 ( .A(crc5_count_out[2]), .B(n65), .C(n66), .Y(n64) );
  NOR2X1 U72 ( .A(crc5_count_out[11]), .B(crc5_count_out[10]), .Y(n66) );
  INVX1 U73 ( .A(crc5_count_out[0]), .Y(n65) );
  NAND2X1 U74 ( .A(n67), .B(n68), .Y(n63) );
  NOR2X1 U75 ( .A(crc5_count_out[15]), .B(crc5_count_out[14]), .Y(n68) );
  NOR2X1 U76 ( .A(crc5_count_out[13]), .B(crc5_count_out[12]), .Y(n67) );
  NAND3X1 U77 ( .A(n70), .B(n71), .C(n72), .Y(n69) );
  NOR2X1 U78 ( .A(n73), .B(n74), .Y(n72) );
  NAND3X1 U79 ( .A(n75), .B(n76), .C(n77), .Y(n74) );
  AND2X1 U80 ( .A(n78), .B(n79), .Y(n77) );
  NOR2X1 U81 ( .A(crc16_count_out[30]), .B(crc16_count_out[29]), .Y(n79) );
  NOR2X1 U82 ( .A(crc16_count_out[28]), .B(crc16_count_out[27]), .Y(n78) );
  NOR2X1 U83 ( .A(crc16_count_out[26]), .B(crc16_count_out[25]), .Y(n76) );
  NOR2X1 U84 ( .A(crc16_count_out[24]), .B(crc16_count_out[23]), .Y(n75) );
  NAND3X1 U85 ( .A(n80), .B(n81), .C(n82), .Y(n73) );
  AND2X1 U86 ( .A(n83), .B(n84), .Y(n82) );
  NOR2X1 U87 ( .A(crc16_count_out[9]), .B(crc16_count_out[8]), .Y(n84) );
  NOR2X1 U88 ( .A(crc16_count_out[7]), .B(crc16_count_out[6]), .Y(n83) );
  NOR2X1 U89 ( .A(crc16_count_out[5]), .B(crc16_count_out[4]), .Y(n81) );
  NOR2X1 U90 ( .A(crc16_count_out[3]), .B(crc16_count_out[31]), .Y(n80) );
  NOR2X1 U91 ( .A(n85), .B(n86), .Y(n71) );
  NAND2X1 U92 ( .A(n87), .B(n88), .Y(n86) );
  NOR2X1 U93 ( .A(crc16_count_out[19]), .B(crc16_count_out[18]), .Y(n88) );
  NOR2X1 U94 ( .A(crc16_count_out[17]), .B(crc16_count_out[16]), .Y(n87) );
  NAND2X1 U95 ( .A(n89), .B(n90), .Y(n85) );
  NOR2X1 U96 ( .A(crc16_count_out[22]), .B(crc16_count_out[21]), .Y(n90) );
  NOR2X1 U97 ( .A(crc16_count_out[20]), .B(crc16_count_out[1]), .Y(n89) );
  NOR2X1 U98 ( .A(n91), .B(n92), .Y(n70) );
  NAND3X1 U99 ( .A(crc16_count_out[2]), .B(n93), .C(n94), .Y(n92) );
  NOR2X1 U100 ( .A(crc16_count_out[11]), .B(crc16_count_out[10]), .Y(n94) );
  INVX1 U101 ( .A(crc16_count_out[0]), .Y(n93) );
  NAND2X1 U102 ( .A(n95), .B(n96), .Y(n91) );
  NOR2X1 U103 ( .A(crc16_count_out[15]), .B(crc16_count_out[14]), .Y(n96) );
  NOR2X1 U104 ( .A(crc16_count_out[13]), .B(crc16_count_out[12]), .Y(n95) );
  NAND3X1 U105 ( .A(n98), .B(n99), .C(n100), .Y(n97) );
  NOR2X1 U106 ( .A(n101), .B(n102), .Y(n100) );
  NAND3X1 U107 ( .A(n103), .B(n104), .C(n105), .Y(n102) );
  AND2X1 U108 ( .A(n106), .B(n107), .Y(n105) );
  NOR2X1 U109 ( .A(data_count_out[30]), .B(data_count_out[29]), .Y(n107) );
  NOR2X1 U110 ( .A(data_count_out[28]), .B(data_count_out[27]), .Y(n106) );
  NOR2X1 U111 ( .A(data_count_out[26]), .B(data_count_out[25]), .Y(n104) );
  NOR2X1 U112 ( .A(data_count_out[24]), .B(data_count_out[23]), .Y(n103) );
  NAND3X1 U113 ( .A(n108), .B(n109), .C(n110), .Y(n101) );
  AND2X1 U114 ( .A(n111), .B(n112), .Y(n110) );
  NOR2X1 U115 ( .A(data_count_out[9]), .B(data_count_out[8]), .Y(n112) );
  NOR2X1 U116 ( .A(data_count_out[7]), .B(data_count_out[6]), .Y(n111) );
  NOR2X1 U117 ( .A(data_count_out[5]), .B(data_count_out[4]), .Y(n109) );
  NOR2X1 U118 ( .A(data_count_out[3]), .B(data_count_out[31]), .Y(n108) );
  NOR2X1 U119 ( .A(n113), .B(n114), .Y(n99) );
  NAND2X1 U120 ( .A(n115), .B(n116), .Y(n114) );
  NOR2X1 U121 ( .A(data_count_out[19]), .B(data_count_out[18]), .Y(n116) );
  NOR2X1 U122 ( .A(data_count_out[17]), .B(data_count_out[16]), .Y(n115) );
  NAND2X1 U123 ( .A(n117), .B(n118), .Y(n113) );
  NOR2X1 U124 ( .A(data_count_out[22]), .B(data_count_out[21]), .Y(n118) );
  NOR2X1 U125 ( .A(data_count_out[20]), .B(data_count_out[1]), .Y(n117) );
  NOR2X1 U126 ( .A(n119), .B(n120), .Y(n98) );
  NAND3X1 U127 ( .A(data_count_out[2]), .B(n121), .C(n122), .Y(n120) );
  NOR2X1 U128 ( .A(data_count_out[11]), .B(data_count_out[10]), .Y(n122) );
  INVX1 U129 ( .A(data_count_out[0]), .Y(n121) );
  NAND2X1 U130 ( .A(n123), .B(n124), .Y(n119) );
  NOR2X1 U131 ( .A(data_count_out[15]), .B(data_count_out[14]), .Y(n124) );
  NOR2X1 U132 ( .A(data_count_out[13]), .B(data_count_out[12]), .Y(n123) );
  INVX1 U133 ( .A(n125), .Y(sync_shift_enable) );
  NAND3X1 U134 ( .A(n126), .B(n127), .C(n128), .Y(n125) );
  NOR2X1 U135 ( .A(n129), .B(n130), .Y(n128) );
  NAND3X1 U136 ( .A(n131), .B(n132), .C(n133), .Y(n130) );
  AND2X1 U137 ( .A(n134), .B(n135), .Y(n133) );
  NOR2X1 U138 ( .A(sync_count_out[30]), .B(sync_count_out[29]), .Y(n135) );
  NOR2X1 U139 ( .A(sync_count_out[28]), .B(sync_count_out[27]), .Y(n134) );
  NOR2X1 U140 ( .A(sync_count_out[26]), .B(sync_count_out[25]), .Y(n132) );
  NOR2X1 U141 ( .A(sync_count_out[24]), .B(sync_count_out[23]), .Y(n131) );
  NAND3X1 U142 ( .A(n136), .B(n137), .C(n138), .Y(n129) );
  AND2X1 U143 ( .A(n139), .B(n140), .Y(n138) );
  NOR2X1 U144 ( .A(sync_count_out[9]), .B(sync_count_out[8]), .Y(n140) );
  NOR2X1 U145 ( .A(sync_count_out[7]), .B(sync_count_out[6]), .Y(n139) );
  NOR2X1 U146 ( .A(sync_count_out[5]), .B(sync_count_out[4]), .Y(n137) );
  NOR2X1 U147 ( .A(sync_count_out[3]), .B(sync_count_out[31]), .Y(n136) );
  NOR2X1 U148 ( .A(n141), .B(n142), .Y(n127) );
  NAND2X1 U149 ( .A(n143), .B(n144), .Y(n142) );
  NOR2X1 U150 ( .A(sync_count_out[19]), .B(sync_count_out[18]), .Y(n144) );
  NOR2X1 U151 ( .A(sync_count_out[17]), .B(sync_count_out[16]), .Y(n143) );
  NAND2X1 U152 ( .A(n145), .B(n146), .Y(n141) );
  NOR2X1 U153 ( .A(sync_count_out[22]), .B(sync_count_out[21]), .Y(n146) );
  NOR2X1 U154 ( .A(sync_count_out[20]), .B(sync_count_out[1]), .Y(n145) );
  NOR2X1 U155 ( .A(n147), .B(n148), .Y(n126) );
  NAND3X1 U156 ( .A(sync_count_out[2]), .B(n149), .C(n150), .Y(n148) );
  NOR2X1 U157 ( .A(sync_count_out[11]), .B(sync_count_out[10]), .Y(n150) );
  INVX1 U158 ( .A(sync_count_out[0]), .Y(n149) );
  NAND2X1 U159 ( .A(n151), .B(n152), .Y(n147) );
  NOR2X1 U160 ( .A(sync_count_out[15]), .B(sync_count_out[14]), .Y(n152) );
  NOR2X1 U161 ( .A(sync_count_out[13]), .B(sync_count_out[12]), .Y(n151) );
  INVX1 U162 ( .A(sync_rcving), .Y(n161) );
  INVX1 U163 ( .A(pid_rcving), .Y(n162) );
  INVX1 U164 ( .A(data_rcving), .Y(n163) );
  INVX1 U165 ( .A(crc16_rcving), .Y(n164) );
  INVX1 U166 ( .A(crc5_rcving), .Y(n165) );
  NOR2X1 U167 ( .A(prev_data_bits_received), .B(n153), .Y(data_bits_received)
         );
  INVX1 U168 ( .A(current_data_bits_received), .Y(n153) );
  NOR2X1 U169 ( .A(prev_crc5_bits_received), .B(n154), .Y(crc5_bits_received)
         );
  INVX1 U170 ( .A(current_crc5_bits_received), .Y(n154) );
  NOR2X1 U171 ( .A(prev_crc16_bits_received), .B(n155), .Y(crc16_bits_received) );
  INVX1 U172 ( .A(current_crc16_bits_received), .Y(n155) );
endmodule


module flex_stp_sr_NUM_BITS8_SHIFT_MSB0_1 ( clk, n_rst, shift_enable, 
        serial_in, parallel_out );
  output [7:0] parallel_out;
  input clk, n_rst, shift_enable, serial_in;
  wire   n12, n14, n16, n18, n20, n22, n24, n26, n1, n2, n3, n4, n5, n6, n7,
         n8;
  tri   serial_in;

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


module flex_stp_sr_NUM_BITS8_SHIFT_MSB0_0 ( clk, n_rst, shift_enable, 
        serial_in, parallel_out );
  output [7:0] parallel_out;
  input clk, n_rst, shift_enable, serial_in;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n25, n27, n29, n31, n33, n35, n37
;
  tri   serial_in;

  DFFSR \parallel_out_reg[7]  ( .D(n9), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[7]) );
  DFFSR \parallel_out_reg[6]  ( .D(n25), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[6]) );
  DFFSR \parallel_out_reg[5]  ( .D(n27), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[5]) );
  DFFSR \parallel_out_reg[4]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[4]) );
  DFFSR \parallel_out_reg[3]  ( .D(n31), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[3]) );
  DFFSR \parallel_out_reg[2]  ( .D(n33), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[2]) );
  DFFSR \parallel_out_reg[1]  ( .D(n35), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[1]) );
  DFFSR \parallel_out_reg[0]  ( .D(n37), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[0]) );
  INVX1 U2 ( .A(n1), .Y(n9) );
  MUX2X1 U3 ( .B(parallel_out[7]), .A(serial_in), .S(shift_enable), .Y(n1) );
  INVX1 U4 ( .A(n2), .Y(n25) );
  MUX2X1 U5 ( .B(parallel_out[6]), .A(parallel_out[7]), .S(shift_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n27) );
  MUX2X1 U7 ( .B(parallel_out[5]), .A(parallel_out[6]), .S(shift_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n29) );
  MUX2X1 U9 ( .B(parallel_out[4]), .A(parallel_out[5]), .S(shift_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n31) );
  MUX2X1 U11 ( .B(parallel_out[3]), .A(parallel_out[4]), .S(shift_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n33) );
  MUX2X1 U13 ( .B(parallel_out[2]), .A(parallel_out[3]), .S(shift_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n35) );
  MUX2X1 U15 ( .B(parallel_out[1]), .A(parallel_out[2]), .S(shift_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n37) );
  MUX2X1 U17 ( .B(parallel_out[0]), .A(parallel_out[1]), .S(shift_enable), .Y(
        n8) );
endmodule


module flex_stp_sr_NUM_BITS5_SHIFT_MSB0 ( clk, n_rst, shift_enable, serial_in, 
        parallel_out );
  output [4:0] parallel_out;
  input clk, n_rst, shift_enable, serial_in;
  wire   n9, n11, n13, n15, n17, n1, n2, n3, n4, n5;
  tri   serial_in;

  DFFSR \parallel_out_reg[4]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[4]) );
  DFFSR \parallel_out_reg[3]  ( .D(n15), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[3]) );
  DFFSR \parallel_out_reg[2]  ( .D(n13), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[2]) );
  DFFSR \parallel_out_reg[1]  ( .D(n11), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[1]) );
  DFFSR \parallel_out_reg[0]  ( .D(n9), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[0]) );
  INVX1 U2 ( .A(n1), .Y(n9) );
  MUX2X1 U3 ( .B(parallel_out[0]), .A(parallel_out[1]), .S(shift_enable), .Y(
        n1) );
  INVX1 U4 ( .A(n2), .Y(n17) );
  MUX2X1 U5 ( .B(parallel_out[4]), .A(serial_in), .S(shift_enable), .Y(n2) );
  INVX1 U6 ( .A(n3), .Y(n15) );
  MUX2X1 U7 ( .B(parallel_out[3]), .A(parallel_out[4]), .S(shift_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n13) );
  MUX2X1 U9 ( .B(parallel_out[2]), .A(parallel_out[3]), .S(shift_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n11) );
  MUX2X1 U11 ( .B(parallel_out[1]), .A(parallel_out[2]), .S(shift_enable), .Y(
        n5) );
endmodule


module flex_stp_sr_NUM_BITS16_SHIFT_MSB0 ( clk, n_rst, shift_enable, serial_in, 
        parallel_out );
  output [15:0] parallel_out;
  input clk, n_rst, shift_enable, serial_in;
  wire   n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42, n44, n46,
         n48, n50, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16;
  tri   serial_in;

  DFFSR \parallel_out_reg[15]  ( .D(n50), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[15]) );
  DFFSR \parallel_out_reg[14]  ( .D(n48), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[14]) );
  DFFSR \parallel_out_reg[13]  ( .D(n46), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[13]) );
  DFFSR \parallel_out_reg[12]  ( .D(n44), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[12]) );
  DFFSR \parallel_out_reg[11]  ( .D(n42), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[11]) );
  DFFSR \parallel_out_reg[10]  ( .D(n40), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[10]) );
  DFFSR \parallel_out_reg[9]  ( .D(n38), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[9]) );
  DFFSR \parallel_out_reg[8]  ( .D(n36), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[8]) );
  DFFSR \parallel_out_reg[7]  ( .D(n34), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[7]) );
  DFFSR \parallel_out_reg[6]  ( .D(n32), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[6]) );
  DFFSR \parallel_out_reg[5]  ( .D(n30), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[5]) );
  DFFSR \parallel_out_reg[4]  ( .D(n28), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[4]) );
  DFFSR \parallel_out_reg[3]  ( .D(n26), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[3]) );
  DFFSR \parallel_out_reg[2]  ( .D(n24), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[2]) );
  DFFSR \parallel_out_reg[1]  ( .D(n22), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[1]) );
  DFFSR \parallel_out_reg[0]  ( .D(n20), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[0]) );
  INVX1 U2 ( .A(n1), .Y(n50) );
  MUX2X1 U3 ( .B(parallel_out[15]), .A(serial_in), .S(shift_enable), .Y(n1) );
  INVX1 U4 ( .A(n2), .Y(n48) );
  MUX2X1 U5 ( .B(parallel_out[14]), .A(parallel_out[15]), .S(shift_enable), 
        .Y(n2) );
  INVX1 U6 ( .A(n3), .Y(n46) );
  MUX2X1 U7 ( .B(parallel_out[13]), .A(parallel_out[14]), .S(shift_enable), 
        .Y(n3) );
  INVX1 U8 ( .A(n4), .Y(n44) );
  MUX2X1 U9 ( .B(parallel_out[12]), .A(parallel_out[13]), .S(shift_enable), 
        .Y(n4) );
  INVX1 U10 ( .A(n5), .Y(n42) );
  MUX2X1 U11 ( .B(parallel_out[11]), .A(parallel_out[12]), .S(shift_enable), 
        .Y(n5) );
  INVX1 U12 ( .A(n6), .Y(n40) );
  MUX2X1 U13 ( .B(parallel_out[10]), .A(parallel_out[11]), .S(shift_enable), 
        .Y(n6) );
  INVX1 U14 ( .A(n7), .Y(n38) );
  MUX2X1 U15 ( .B(parallel_out[9]), .A(parallel_out[10]), .S(shift_enable), 
        .Y(n7) );
  INVX1 U16 ( .A(n8), .Y(n36) );
  MUX2X1 U17 ( .B(parallel_out[8]), .A(parallel_out[9]), .S(shift_enable), .Y(
        n8) );
  INVX1 U18 ( .A(n9), .Y(n34) );
  MUX2X1 U19 ( .B(parallel_out[7]), .A(parallel_out[8]), .S(shift_enable), .Y(
        n9) );
  INVX1 U20 ( .A(n10), .Y(n32) );
  MUX2X1 U21 ( .B(parallel_out[6]), .A(parallel_out[7]), .S(shift_enable), .Y(
        n10) );
  INVX1 U22 ( .A(n11), .Y(n30) );
  MUX2X1 U23 ( .B(parallel_out[5]), .A(parallel_out[6]), .S(shift_enable), .Y(
        n11) );
  INVX1 U24 ( .A(n12), .Y(n28) );
  MUX2X1 U25 ( .B(parallel_out[4]), .A(parallel_out[5]), .S(shift_enable), .Y(
        n12) );
  INVX1 U26 ( .A(n13), .Y(n26) );
  MUX2X1 U27 ( .B(parallel_out[3]), .A(parallel_out[4]), .S(shift_enable), .Y(
        n13) );
  INVX1 U28 ( .A(n14), .Y(n24) );
  MUX2X1 U29 ( .B(parallel_out[2]), .A(parallel_out[3]), .S(shift_enable), .Y(
        n14) );
  INVX1 U30 ( .A(n15), .Y(n22) );
  MUX2X1 U31 ( .B(parallel_out[1]), .A(parallel_out[2]), .S(shift_enable), .Y(
        n15) );
  INVX1 U32 ( .A(n16), .Y(n20) );
  MUX2X1 U33 ( .B(parallel_out[0]), .A(parallel_out[1]), .S(shift_enable), .Y(
        n16) );
endmodule


module flex_stp_sr_NUM_BITS64_SHIFT_MSB0 ( clk, n_rst, shift_enable, serial_in, 
        parallel_out );
  output [63:0] parallel_out;
  input clk, n_rst, shift_enable, serial_in;
  wire   n68, n70, n72, n74, n76, n78, n80, n82, n84, n86, n88, n90, n92, n94,
         n96, n98, n100, n102, n104, n106, n108, n110, n112, n114, n116, n118,
         n120, n122, n124, n126, n128, n130, n132, n134, n136, n138, n140,
         n142, n144, n146, n148, n150, n152, n154, n156, n158, n160, n162,
         n164, n166, n168, n170, n172, n174, n176, n178, n180, n182, n184,
         n186, n188, n190, n192, n194, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65;
  tri   serial_in;

  DFFSR \parallel_out_reg[63]  ( .D(n194), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[63]) );
  DFFSR \parallel_out_reg[62]  ( .D(n192), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[62]) );
  DFFSR \parallel_out_reg[61]  ( .D(n190), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[61]) );
  DFFSR \parallel_out_reg[60]  ( .D(n188), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[60]) );
  DFFSR \parallel_out_reg[59]  ( .D(n186), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[59]) );
  DFFSR \parallel_out_reg[58]  ( .D(n184), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[58]) );
  DFFSR \parallel_out_reg[57]  ( .D(n182), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[57]) );
  DFFSR \parallel_out_reg[56]  ( .D(n180), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[56]) );
  DFFSR \parallel_out_reg[55]  ( .D(n178), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[55]) );
  DFFSR \parallel_out_reg[54]  ( .D(n176), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[54]) );
  DFFSR \parallel_out_reg[53]  ( .D(n174), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[53]) );
  DFFSR \parallel_out_reg[52]  ( .D(n172), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[52]) );
  DFFSR \parallel_out_reg[51]  ( .D(n170), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[51]) );
  DFFSR \parallel_out_reg[50]  ( .D(n168), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[50]) );
  DFFSR \parallel_out_reg[49]  ( .D(n166), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[49]) );
  DFFSR \parallel_out_reg[48]  ( .D(n164), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[48]) );
  DFFSR \parallel_out_reg[47]  ( .D(n162), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[47]) );
  DFFSR \parallel_out_reg[46]  ( .D(n160), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[46]) );
  DFFSR \parallel_out_reg[45]  ( .D(n158), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[45]) );
  DFFSR \parallel_out_reg[44]  ( .D(n156), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[44]) );
  DFFSR \parallel_out_reg[43]  ( .D(n154), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[43]) );
  DFFSR \parallel_out_reg[42]  ( .D(n152), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[42]) );
  DFFSR \parallel_out_reg[41]  ( .D(n150), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[41]) );
  DFFSR \parallel_out_reg[40]  ( .D(n148), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[40]) );
  DFFSR \parallel_out_reg[39]  ( .D(n146), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[39]) );
  DFFSR \parallel_out_reg[38]  ( .D(n144), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[38]) );
  DFFSR \parallel_out_reg[37]  ( .D(n142), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[37]) );
  DFFSR \parallel_out_reg[36]  ( .D(n140), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[36]) );
  DFFSR \parallel_out_reg[35]  ( .D(n138), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[35]) );
  DFFSR \parallel_out_reg[34]  ( .D(n136), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[34]) );
  DFFSR \parallel_out_reg[33]  ( .D(n134), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[33]) );
  DFFSR \parallel_out_reg[32]  ( .D(n132), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[32]) );
  DFFSR \parallel_out_reg[31]  ( .D(n130), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[31]) );
  DFFSR \parallel_out_reg[30]  ( .D(n128), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[30]) );
  DFFSR \parallel_out_reg[29]  ( .D(n126), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[29]) );
  DFFSR \parallel_out_reg[28]  ( .D(n124), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[28]) );
  DFFSR \parallel_out_reg[27]  ( .D(n122), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[27]) );
  DFFSR \parallel_out_reg[26]  ( .D(n120), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[26]) );
  DFFSR \parallel_out_reg[25]  ( .D(n118), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[25]) );
  DFFSR \parallel_out_reg[24]  ( .D(n116), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[24]) );
  DFFSR \parallel_out_reg[23]  ( .D(n114), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[23]) );
  DFFSR \parallel_out_reg[22]  ( .D(n112), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[22]) );
  DFFSR \parallel_out_reg[21]  ( .D(n110), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[21]) );
  DFFSR \parallel_out_reg[20]  ( .D(n108), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[20]) );
  DFFSR \parallel_out_reg[19]  ( .D(n106), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[19]) );
  DFFSR \parallel_out_reg[18]  ( .D(n104), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[18]) );
  DFFSR \parallel_out_reg[17]  ( .D(n102), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[17]) );
  DFFSR \parallel_out_reg[16]  ( .D(n100), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[16]) );
  DFFSR \parallel_out_reg[15]  ( .D(n98), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[15]) );
  DFFSR \parallel_out_reg[14]  ( .D(n96), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[14]) );
  DFFSR \parallel_out_reg[13]  ( .D(n94), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[13]) );
  DFFSR \parallel_out_reg[12]  ( .D(n92), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[12]) );
  DFFSR \parallel_out_reg[11]  ( .D(n90), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[11]) );
  DFFSR \parallel_out_reg[10]  ( .D(n88), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[10]) );
  DFFSR \parallel_out_reg[9]  ( .D(n86), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[9]) );
  DFFSR \parallel_out_reg[8]  ( .D(n84), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[8]) );
  DFFSR \parallel_out_reg[7]  ( .D(n82), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[7]) );
  DFFSR \parallel_out_reg[6]  ( .D(n80), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[6]) );
  DFFSR \parallel_out_reg[5]  ( .D(n78), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[5]) );
  DFFSR \parallel_out_reg[4]  ( .D(n76), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[4]) );
  DFFSR \parallel_out_reg[3]  ( .D(n74), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[3]) );
  DFFSR \parallel_out_reg[2]  ( .D(n72), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[2]) );
  DFFSR \parallel_out_reg[1]  ( .D(n70), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[1]) );
  DFFSR \parallel_out_reg[0]  ( .D(n68), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[0]) );
  MUX2X1 U2 ( .B(n1), .A(n2), .S(shift_enable), .Y(n98) );
  INVX1 U3 ( .A(parallel_out[16]), .Y(n2) );
  MUX2X1 U4 ( .B(n3), .A(n1), .S(shift_enable), .Y(n96) );
  INVX1 U5 ( .A(parallel_out[15]), .Y(n1) );
  MUX2X1 U6 ( .B(n4), .A(n3), .S(shift_enable), .Y(n94) );
  INVX1 U7 ( .A(parallel_out[14]), .Y(n3) );
  MUX2X1 U8 ( .B(n5), .A(n4), .S(shift_enable), .Y(n92) );
  INVX1 U9 ( .A(parallel_out[13]), .Y(n4) );
  MUX2X1 U10 ( .B(n6), .A(n5), .S(shift_enable), .Y(n90) );
  INVX1 U11 ( .A(parallel_out[12]), .Y(n5) );
  MUX2X1 U12 ( .B(n7), .A(n6), .S(shift_enable), .Y(n88) );
  INVX1 U13 ( .A(parallel_out[11]), .Y(n6) );
  MUX2X1 U14 ( .B(n8), .A(n7), .S(shift_enable), .Y(n86) );
  INVX1 U15 ( .A(parallel_out[10]), .Y(n7) );
  MUX2X1 U16 ( .B(n9), .A(n8), .S(shift_enable), .Y(n84) );
  INVX1 U17 ( .A(parallel_out[9]), .Y(n8) );
  MUX2X1 U18 ( .B(n10), .A(n9), .S(shift_enable), .Y(n82) );
  INVX1 U19 ( .A(parallel_out[8]), .Y(n9) );
  MUX2X1 U20 ( .B(n11), .A(n10), .S(shift_enable), .Y(n80) );
  INVX1 U21 ( .A(parallel_out[7]), .Y(n10) );
  MUX2X1 U22 ( .B(n12), .A(n11), .S(shift_enable), .Y(n78) );
  INVX1 U23 ( .A(parallel_out[6]), .Y(n11) );
  MUX2X1 U24 ( .B(n13), .A(n12), .S(shift_enable), .Y(n76) );
  INVX1 U25 ( .A(parallel_out[5]), .Y(n12) );
  MUX2X1 U26 ( .B(n14), .A(n13), .S(shift_enable), .Y(n74) );
  INVX1 U27 ( .A(parallel_out[4]), .Y(n13) );
  INVX1 U28 ( .A(parallel_out[3]), .Y(n14) );
  INVX1 U29 ( .A(n15), .Y(n72) );
  MUX2X1 U30 ( .B(parallel_out[2]), .A(parallel_out[3]), .S(shift_enable), .Y(
        n15) );
  INVX1 U31 ( .A(n16), .Y(n70) );
  MUX2X1 U32 ( .B(parallel_out[1]), .A(parallel_out[2]), .S(shift_enable), .Y(
        n16) );
  INVX1 U33 ( .A(n17), .Y(n68) );
  MUX2X1 U34 ( .B(parallel_out[0]), .A(parallel_out[1]), .S(shift_enable), .Y(
        n17) );
  INVX1 U35 ( .A(n18), .Y(n194) );
  MUX2X1 U36 ( .B(parallel_out[63]), .A(serial_in), .S(shift_enable), .Y(n18)
         );
  INVX1 U37 ( .A(n19), .Y(n192) );
  MUX2X1 U38 ( .B(parallel_out[62]), .A(parallel_out[63]), .S(shift_enable), 
        .Y(n19) );
  INVX1 U39 ( .A(n20), .Y(n190) );
  MUX2X1 U40 ( .B(parallel_out[61]), .A(parallel_out[62]), .S(shift_enable), 
        .Y(n20) );
  INVX1 U41 ( .A(n21), .Y(n188) );
  MUX2X1 U42 ( .B(parallel_out[60]), .A(parallel_out[61]), .S(shift_enable), 
        .Y(n21) );
  INVX1 U43 ( .A(n22), .Y(n186) );
  MUX2X1 U44 ( .B(parallel_out[59]), .A(parallel_out[60]), .S(shift_enable), 
        .Y(n22) );
  INVX1 U45 ( .A(n23), .Y(n184) );
  MUX2X1 U46 ( .B(parallel_out[58]), .A(parallel_out[59]), .S(shift_enable), 
        .Y(n23) );
  INVX1 U47 ( .A(n24), .Y(n182) );
  MUX2X1 U48 ( .B(parallel_out[57]), .A(parallel_out[58]), .S(shift_enable), 
        .Y(n24) );
  INVX1 U49 ( .A(n25), .Y(n180) );
  MUX2X1 U50 ( .B(parallel_out[56]), .A(parallel_out[57]), .S(shift_enable), 
        .Y(n25) );
  INVX1 U51 ( .A(n26), .Y(n178) );
  MUX2X1 U52 ( .B(parallel_out[55]), .A(parallel_out[56]), .S(shift_enable), 
        .Y(n26) );
  INVX1 U53 ( .A(n27), .Y(n176) );
  MUX2X1 U54 ( .B(parallel_out[54]), .A(parallel_out[55]), .S(shift_enable), 
        .Y(n27) );
  INVX1 U55 ( .A(n28), .Y(n174) );
  MUX2X1 U56 ( .B(parallel_out[53]), .A(parallel_out[54]), .S(shift_enable), 
        .Y(n28) );
  INVX1 U57 ( .A(n29), .Y(n172) );
  MUX2X1 U58 ( .B(parallel_out[52]), .A(parallel_out[53]), .S(shift_enable), 
        .Y(n29) );
  INVX1 U59 ( .A(n30), .Y(n170) );
  MUX2X1 U60 ( .B(parallel_out[51]), .A(parallel_out[52]), .S(shift_enable), 
        .Y(n30) );
  INVX1 U61 ( .A(n31), .Y(n168) );
  MUX2X1 U62 ( .B(parallel_out[50]), .A(parallel_out[51]), .S(shift_enable), 
        .Y(n31) );
  INVX1 U63 ( .A(n32), .Y(n166) );
  MUX2X1 U64 ( .B(parallel_out[49]), .A(parallel_out[50]), .S(shift_enable), 
        .Y(n32) );
  INVX1 U65 ( .A(n33), .Y(n164) );
  MUX2X1 U66 ( .B(parallel_out[48]), .A(parallel_out[49]), .S(shift_enable), 
        .Y(n33) );
  INVX1 U67 ( .A(n34), .Y(n162) );
  MUX2X1 U68 ( .B(parallel_out[47]), .A(parallel_out[48]), .S(shift_enable), 
        .Y(n34) );
  INVX1 U69 ( .A(n35), .Y(n160) );
  MUX2X1 U70 ( .B(parallel_out[46]), .A(parallel_out[47]), .S(shift_enable), 
        .Y(n35) );
  INVX1 U71 ( .A(n36), .Y(n158) );
  MUX2X1 U72 ( .B(parallel_out[45]), .A(parallel_out[46]), .S(shift_enable), 
        .Y(n36) );
  INVX1 U73 ( .A(n37), .Y(n156) );
  MUX2X1 U74 ( .B(parallel_out[44]), .A(parallel_out[45]), .S(shift_enable), 
        .Y(n37) );
  INVX1 U75 ( .A(n38), .Y(n154) );
  MUX2X1 U76 ( .B(parallel_out[43]), .A(parallel_out[44]), .S(shift_enable), 
        .Y(n38) );
  INVX1 U77 ( .A(n39), .Y(n152) );
  MUX2X1 U78 ( .B(parallel_out[42]), .A(parallel_out[43]), .S(shift_enable), 
        .Y(n39) );
  INVX1 U79 ( .A(n40), .Y(n150) );
  MUX2X1 U80 ( .B(parallel_out[41]), .A(parallel_out[42]), .S(shift_enable), 
        .Y(n40) );
  INVX1 U81 ( .A(n41), .Y(n148) );
  MUX2X1 U82 ( .B(parallel_out[40]), .A(parallel_out[41]), .S(shift_enable), 
        .Y(n41) );
  INVX1 U83 ( .A(n42), .Y(n146) );
  MUX2X1 U84 ( .B(parallel_out[39]), .A(parallel_out[40]), .S(shift_enable), 
        .Y(n42) );
  INVX1 U85 ( .A(n43), .Y(n144) );
  MUX2X1 U86 ( .B(parallel_out[38]), .A(parallel_out[39]), .S(shift_enable), 
        .Y(n43) );
  INVX1 U87 ( .A(n44), .Y(n142) );
  MUX2X1 U88 ( .B(parallel_out[37]), .A(parallel_out[38]), .S(shift_enable), 
        .Y(n44) );
  INVX1 U89 ( .A(n45), .Y(n140) );
  MUX2X1 U90 ( .B(parallel_out[36]), .A(parallel_out[37]), .S(shift_enable), 
        .Y(n45) );
  INVX1 U91 ( .A(n46), .Y(n138) );
  MUX2X1 U92 ( .B(parallel_out[35]), .A(parallel_out[36]), .S(shift_enable), 
        .Y(n46) );
  INVX1 U93 ( .A(n47), .Y(n136) );
  MUX2X1 U94 ( .B(parallel_out[34]), .A(parallel_out[35]), .S(shift_enable), 
        .Y(n47) );
  INVX1 U95 ( .A(n48), .Y(n134) );
  MUX2X1 U96 ( .B(parallel_out[33]), .A(parallel_out[34]), .S(shift_enable), 
        .Y(n48) );
  INVX1 U97 ( .A(n49), .Y(n132) );
  MUX2X1 U98 ( .B(parallel_out[32]), .A(parallel_out[33]), .S(shift_enable), 
        .Y(n49) );
  INVX1 U99 ( .A(n50), .Y(n130) );
  MUX2X1 U100 ( .B(parallel_out[31]), .A(parallel_out[32]), .S(shift_enable), 
        .Y(n50) );
  INVX1 U101 ( .A(n51), .Y(n128) );
  MUX2X1 U102 ( .B(parallel_out[30]), .A(parallel_out[31]), .S(shift_enable), 
        .Y(n51) );
  INVX1 U103 ( .A(n52), .Y(n126) );
  MUX2X1 U104 ( .B(parallel_out[29]), .A(parallel_out[30]), .S(shift_enable), 
        .Y(n52) );
  INVX1 U105 ( .A(n53), .Y(n124) );
  MUX2X1 U106 ( .B(parallel_out[28]), .A(parallel_out[29]), .S(shift_enable), 
        .Y(n53) );
  INVX1 U107 ( .A(n54), .Y(n122) );
  MUX2X1 U108 ( .B(parallel_out[27]), .A(parallel_out[28]), .S(shift_enable), 
        .Y(n54) );
  INVX1 U109 ( .A(n55), .Y(n120) );
  MUX2X1 U110 ( .B(parallel_out[26]), .A(parallel_out[27]), .S(shift_enable), 
        .Y(n55) );
  INVX1 U111 ( .A(n56), .Y(n118) );
  MUX2X1 U112 ( .B(parallel_out[25]), .A(parallel_out[26]), .S(shift_enable), 
        .Y(n56) );
  INVX1 U113 ( .A(n57), .Y(n116) );
  MUX2X1 U114 ( .B(parallel_out[24]), .A(parallel_out[25]), .S(shift_enable), 
        .Y(n57) );
  INVX1 U115 ( .A(n58), .Y(n114) );
  MUX2X1 U116 ( .B(parallel_out[23]), .A(parallel_out[24]), .S(shift_enable), 
        .Y(n58) );
  INVX1 U117 ( .A(n59), .Y(n112) );
  MUX2X1 U118 ( .B(parallel_out[22]), .A(parallel_out[23]), .S(shift_enable), 
        .Y(n59) );
  INVX1 U119 ( .A(n60), .Y(n110) );
  MUX2X1 U120 ( .B(parallel_out[21]), .A(parallel_out[22]), .S(shift_enable), 
        .Y(n60) );
  INVX1 U121 ( .A(n61), .Y(n108) );
  MUX2X1 U122 ( .B(parallel_out[20]), .A(parallel_out[21]), .S(shift_enable), 
        .Y(n61) );
  INVX1 U123 ( .A(n62), .Y(n106) );
  MUX2X1 U124 ( .B(parallel_out[19]), .A(parallel_out[20]), .S(shift_enable), 
        .Y(n62) );
  INVX1 U125 ( .A(n63), .Y(n104) );
  MUX2X1 U126 ( .B(parallel_out[18]), .A(parallel_out[19]), .S(shift_enable), 
        .Y(n63) );
  INVX1 U127 ( .A(n64), .Y(n102) );
  MUX2X1 U128 ( .B(parallel_out[17]), .A(parallel_out[18]), .S(shift_enable), 
        .Y(n64) );
  INVX1 U129 ( .A(n65), .Y(n100) );
  MUX2X1 U130 ( .B(parallel_out[16]), .A(parallel_out[17]), .S(shift_enable), 
        .Y(n65) );
endmodule


module shift_register ( clk, n_rst, sync_shift_enable, pid_shift_enable, 
        crc5_shift_enable, crc16_shift_enable, data_shift_enable, d_orig, 
        rcv_sync, rcv_pid, rcv_crc5, rcv_crc16, rcv_data );
  output [7:0] rcv_sync;
  output [7:0] rcv_pid;
  output [4:0] rcv_crc5;
  output [15:0] rcv_crc16;
  output [63:0] rcv_data;
  input clk, n_rst, sync_shift_enable, pid_shift_enable, crc5_shift_enable,
         crc16_shift_enable, data_shift_enable, d_orig;

  tri   d_orig;

  flex_stp_sr_NUM_BITS8_SHIFT_MSB0_1 sync_shift_reg ( .clk(clk), .n_rst(n_rst), 
        .shift_enable(sync_shift_enable), .serial_in(d_orig), .parallel_out(
        rcv_sync) );
  flex_stp_sr_NUM_BITS8_SHIFT_MSB0_0 pid_shift_reg ( .clk(clk), .n_rst(n_rst), 
        .shift_enable(pid_shift_enable), .serial_in(d_orig), .parallel_out(
        rcv_pid) );
  flex_stp_sr_NUM_BITS5_SHIFT_MSB0 crc5_shift_reg ( .clk(clk), .n_rst(n_rst), 
        .shift_enable(crc5_shift_enable), .serial_in(d_orig), .parallel_out(
        rcv_crc5) );
  flex_stp_sr_NUM_BITS16_SHIFT_MSB0 crc16_shift_reg ( .clk(clk), .n_rst(n_rst), 
        .shift_enable(crc16_shift_enable), .serial_in(d_orig), .parallel_out(
        rcv_crc16) );
  flex_stp_sr_NUM_BITS64_SHIFT_MSB0 data_shift_reg ( .clk(clk), .n_rst(n_rst), 
        .shift_enable(data_shift_enable), .serial_in(d_orig), .parallel_out(
        rcv_data) );
endmodule


module crc5_valid ( clk, n_rst, rcv_data, rcv_crc, data_ready, crc_valid );
  input [7:0] rcv_data;
  input [4:0] rcv_crc;
  input clk, n_rst, data_ready;
  output crc_valid;
  wire   n2, n3, n4, n5, n6;

  DFFSR crc_valid_reg ( .D(n6), .CLK(clk), .R(n_rst), .S(1'b1), .Q(crc_valid)
         );
  INVX1 U4 ( .A(n2), .Y(n6) );
  NAND3X1 U5 ( .A(n3), .B(data_ready), .C(n4), .Y(n2) );
  NOR2X1 U6 ( .A(rcv_crc[2]), .B(n5), .Y(n4) );
  OR2X1 U7 ( .A(rcv_crc[4]), .B(rcv_crc[3]), .Y(n5) );
  NOR2X1 U8 ( .A(rcv_crc[1]), .B(rcv_crc[0]), .Y(n3) );
endmodule


module crc16_valid ( clk, n_rst, rcv_data, rcv_crc, data_ready, crc_valid );
  input [63:0] rcv_data;
  input [15:0] rcv_crc;
  input clk, n_rst, data_ready;
  output crc_valid;
  wire   next_crc_valid, n14, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13;

  LATCH next_crc_valid_reg ( .CLK(data_ready), .D(n14), .Q(next_crc_valid) );
  DFFSR crc_valid_reg ( .D(next_crc_valid), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(crc_valid) );
  NOR2X1 U4 ( .A(n2), .B(n3), .Y(n14) );
  NAND3X1 U5 ( .A(n4), .B(n5), .C(n6), .Y(n3) );
  AND2X1 U6 ( .A(n7), .B(n8), .Y(n6) );
  NOR2X1 U7 ( .A(rcv_crc[1]), .B(rcv_crc[15]), .Y(n8) );
  NOR2X1 U8 ( .A(rcv_crc[14]), .B(rcv_crc[13]), .Y(n7) );
  NOR2X1 U9 ( .A(rcv_crc[12]), .B(rcv_crc[11]), .Y(n5) );
  NOR2X1 U10 ( .A(rcv_crc[10]), .B(rcv_crc[0]), .Y(n4) );
  NAND3X1 U11 ( .A(n9), .B(n10), .C(n11), .Y(n2) );
  AND2X1 U12 ( .A(n12), .B(n13), .Y(n11) );
  NOR2X1 U13 ( .A(rcv_crc[9]), .B(rcv_crc[8]), .Y(n13) );
  NOR2X1 U14 ( .A(rcv_crc[7]), .B(rcv_crc[6]), .Y(n12) );
  NOR2X1 U15 ( .A(rcv_crc[5]), .B(rcv_crc[4]), .Y(n10) );
  NOR2X1 U16 ( .A(rcv_crc[3]), .B(rcv_crc[2]), .Y(n9) );
endmodule


module rcu ( clk, n_rst, d_edge, eop, sync_shift_enable, pid_shift_enable, 
        crc5_shift_enable, crc16_shift_enable, data_shift_enable, rcv_sync, 
        rcv_pid, rcv_crc5, rcv_crc16, rcv_data, sync_bits_received, 
        pid_bits_received, crc5_bits_received, crc16_bits_received, 
        data_bits_received, sync_rcving, pid_rcving, crc5_rcving, crc16_rcving, 
        data_rcving, rcv_data_ready );
  input [7:0] rcv_sync;
  input [7:0] rcv_pid;
  input [4:0] rcv_crc5;
  input [15:0] rcv_crc16;
  input [63:0] rcv_data;
  input clk, n_rst, d_edge, eop, sync_shift_enable, pid_shift_enable,
         crc5_shift_enable, crc16_shift_enable, data_shift_enable,
         sync_bits_received, pid_bits_received, crc5_bits_received,
         crc16_bits_received, data_bits_received;
  output sync_rcving, pid_rcving, crc5_rcving, crc16_rcving, data_rcving,
         rcv_data_ready;
  wire   crc5_valid, crc16_valid, N226, N227, N229, N230, n181, n6, n7, n8, n9,
         n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93,
         n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n173;
  wire   [4:0] state;
  wire   [4:0] nextstate;
  assign sync_rcving = N226;
  assign pid_rcving = N227;
  assign crc16_rcving = N229;
  assign data_rcving = N230;

  DFFSR \state_reg[0]  ( .D(nextstate[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[0]) );
  DFFSR \state_reg[4]  ( .D(nextstate[4]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[4]) );
  DFFSR \state_reg[3]  ( .D(nextstate[3]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[3]) );
  DFFSR \state_reg[1]  ( .D(nextstate[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[1]) );
  DFFSR \state_reg[2]  ( .D(nextstate[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[2]) );
  crc5_valid crc5_comp ( .clk(clk), .n_rst(n_rst), .rcv_data(rcv_pid), 
        .rcv_crc(rcv_crc5), .data_ready(n173), .crc_valid(crc5_valid) );
  crc16_valid crc16_comp ( .clk(clk), .n_rst(n_rst), .rcv_data(rcv_data), 
        .rcv_crc(rcv_crc16), .data_ready(n181), .crc_valid(crc16_valid) );
  NAND3X1 U8 ( .A(n6), .B(n7), .C(n8), .Y(nextstate[4]) );
  NOR2X1 U9 ( .A(n9), .B(n10), .Y(n8) );
  NAND3X1 U10 ( .A(n11), .B(n12), .C(n13), .Y(n10) );
  NAND3X1 U11 ( .A(n14), .B(n15), .C(n16), .Y(n9) );
  AOI21X1 U12 ( .A(n17), .B(n18), .C(n19), .Y(n7) );
  OAI21X1 U13 ( .A(n20), .B(n21), .C(n22), .Y(n19) );
  NAND3X1 U14 ( .A(n23), .B(n24), .C(n25), .Y(n22) );
  NOR2X1 U15 ( .A(n26), .B(n27), .Y(n6) );
  INVX1 U16 ( .A(n28), .Y(n26) );
  NAND3X1 U17 ( .A(n29), .B(n30), .C(n31), .Y(nextstate[3]) );
  NOR2X1 U18 ( .A(n32), .B(n33), .Y(n31) );
  OAI21X1 U19 ( .A(n34), .B(n35), .C(n36), .Y(n33) );
  AOI22X1 U20 ( .A(n25), .B(n21), .C(sync_bits_received), .D(n37), .Y(n34) );
  INVX1 U21 ( .A(data_bits_received), .Y(n21) );
  NAND2X1 U22 ( .A(n38), .B(n39), .Y(n32) );
  NOR2X1 U23 ( .A(n40), .B(n27), .Y(n29) );
  OAI21X1 U24 ( .A(n41), .B(n42), .C(n43), .Y(n27) );
  NOR2X1 U25 ( .A(n44), .B(n45), .Y(n41) );
  NAND3X1 U26 ( .A(rcv_pid[7]), .B(rcv_pid[4]), .C(n46), .Y(n45) );
  AND2X1 U27 ( .A(rcv_pid[1]), .B(rcv_pid[2]), .Y(n46) );
  NAND3X1 U28 ( .A(n47), .B(n48), .C(n49), .Y(n44) );
  NOR2X1 U29 ( .A(rcv_pid[6]), .B(rcv_pid[5]), .Y(n49) );
  INVX1 U30 ( .A(rcv_pid[3]), .Y(n48) );
  INVX1 U31 ( .A(n50), .Y(n40) );
  NAND3X1 U32 ( .A(n51), .B(n52), .C(n53), .Y(nextstate[2]) );
  NOR2X1 U33 ( .A(n54), .B(n55), .Y(n53) );
  OAI21X1 U34 ( .A(n39), .B(n56), .C(n57), .Y(n55) );
  AOI21X1 U35 ( .A(n58), .B(n59), .C(n60), .Y(n57) );
  INVX1 U36 ( .A(n13), .Y(n60) );
  NOR2X1 U37 ( .A(n61), .B(n62), .Y(n58) );
  NAND2X1 U38 ( .A(sync_bits_received), .B(n63), .Y(n56) );
  NAND3X1 U39 ( .A(n42), .B(n64), .C(n65), .Y(n54) );
  INVX1 U40 ( .A(n66), .Y(n52) );
  OAI21X1 U41 ( .A(n67), .B(n43), .C(n68), .Y(n66) );
  AOI22X1 U42 ( .A(n69), .B(n70), .C(n71), .D(n25), .Y(n68) );
  INVX1 U43 ( .A(eop), .Y(n67) );
  NOR2X1 U44 ( .A(n72), .B(n73), .Y(n51) );
  OAI21X1 U45 ( .A(n74), .B(n75), .C(n28), .Y(n73) );
  NOR2X1 U46 ( .A(n76), .B(n77), .Y(n28) );
  OAI21X1 U47 ( .A(n78), .B(n79), .C(n50), .Y(n77) );
  AOI21X1 U48 ( .A(n80), .B(rcv_data_ready), .C(n81), .Y(n50) );
  OAI21X1 U49 ( .A(n82), .B(n61), .C(n83), .Y(n81) );
  INVX1 U50 ( .A(n84), .Y(rcv_data_ready) );
  OAI21X1 U51 ( .A(crc5_valid), .B(n36), .C(n85), .Y(n76) );
  OAI21X1 U52 ( .A(n86), .B(n71), .C(n37), .Y(n85) );
  NAND2X1 U53 ( .A(n62), .B(n87), .Y(n71) );
  NAND3X1 U54 ( .A(n88), .B(n89), .C(n90), .Y(nextstate[1]) );
  NOR2X1 U55 ( .A(n91), .B(n92), .Y(n90) );
  OAI21X1 U56 ( .A(n64), .B(n18), .C(n93), .Y(n92) );
  INVX1 U57 ( .A(n94), .Y(n93) );
  OAI22X1 U58 ( .A(n95), .B(n96), .C(n69), .D(n97), .Y(n94) );
  NAND3X1 U59 ( .A(n98), .B(n99), .C(rcv_pid[0]), .Y(n69) );
  INVX1 U60 ( .A(rcv_pid[4]), .Y(n99) );
  NAND3X1 U61 ( .A(rcv_pid[4]), .B(n47), .C(n98), .Y(n18) );
  NOR2X1 U62 ( .A(n100), .B(n101), .Y(n98) );
  NAND3X1 U63 ( .A(rcv_pid[3]), .B(rcv_pid[2]), .C(rcv_pid[5]), .Y(n101) );
  INVX1 U64 ( .A(n102), .Y(n100) );
  NOR3X1 U65 ( .A(rcv_pid[6]), .B(rcv_pid[7]), .C(rcv_pid[1]), .Y(n102) );
  INVX1 U66 ( .A(rcv_pid[0]), .Y(n47) );
  OAI21X1 U67 ( .A(n14), .B(n103), .C(n104), .Y(n91) );
  AND2X1 U68 ( .A(n83), .B(n13), .Y(n104) );
  AOI21X1 U69 ( .A(crc5_bits_received), .B(n105), .C(n106), .Y(n89) );
  OAI22X1 U70 ( .A(n107), .B(n80), .C(n82), .D(n24), .Y(n106) );
  INVX1 U71 ( .A(n61), .Y(n24) );
  NOR2X1 U72 ( .A(n108), .B(n109), .Y(n61) );
  NAND3X1 U73 ( .A(rcv_sync[7]), .B(n110), .C(n111), .Y(n109) );
  NOR2X1 U74 ( .A(rcv_sync[2]), .B(rcv_sync[1]), .Y(n111) );
  INVX1 U75 ( .A(rcv_sync[0]), .Y(n110) );
  NAND2X1 U76 ( .A(n112), .B(n113), .Y(n108) );
  NOR2X1 U77 ( .A(rcv_sync[6]), .B(rcv_sync[5]), .Y(n113) );
  NOR2X1 U78 ( .A(rcv_sync[4]), .B(rcv_sync[3]), .Y(n112) );
  INVX1 U79 ( .A(d_edge), .Y(n80) );
  INVX1 U80 ( .A(n65), .Y(n105) );
  NOR2X1 U81 ( .A(n114), .B(n115), .Y(n88) );
  OAI22X1 U82 ( .A(n116), .B(n117), .C(n75), .D(n38), .Y(n115) );
  INVX1 U83 ( .A(pid_bits_received), .Y(n75) );
  INVX1 U84 ( .A(sync_bits_received), .Y(n116) );
  INVX1 U85 ( .A(n118), .Y(n114) );
  NAND2X1 U86 ( .A(n119), .B(n120), .Y(nextstate[0]) );
  NOR2X1 U87 ( .A(n121), .B(n122), .Y(n120) );
  OAI21X1 U88 ( .A(crc5_valid), .B(n36), .C(n123), .Y(n122) );
  AOI22X1 U89 ( .A(n124), .B(eop), .C(n125), .D(n103), .Y(n123) );
  INVX1 U90 ( .A(crc16_bits_received), .Y(n103) );
  INVX1 U91 ( .A(n14), .Y(n125) );
  NAND2X1 U92 ( .A(N229), .B(n78), .Y(n14) );
  NOR2X1 U93 ( .A(n96), .B(n62), .Y(n124) );
  INVX1 U94 ( .A(n23), .Y(n62) );
  NAND3X1 U95 ( .A(n42), .B(n11), .C(n82), .Y(n121) );
  NOR2X1 U96 ( .A(n126), .B(n127), .Y(n119) );
  NAND3X1 U97 ( .A(n118), .B(n30), .C(n128), .Y(n127) );
  MUX2X1 U98 ( .B(n129), .A(n130), .S(d_edge), .Y(n128) );
  OAI21X1 U99 ( .A(n96), .B(n95), .C(n131), .Y(n130) );
  INVX1 U100 ( .A(n107), .Y(n129) );
  NAND2X1 U101 ( .A(n132), .B(n133), .Y(n107) );
  INVX1 U102 ( .A(n134), .Y(n30) );
  NAND3X1 U103 ( .A(n135), .B(n13), .C(n136), .Y(n134) );
  AOI22X1 U104 ( .A(n137), .B(N229), .C(n23), .D(n138), .Y(n136) );
  NOR2X1 U105 ( .A(crc16_valid), .B(n78), .Y(n137) );
  NAND2X1 U106 ( .A(n139), .B(n140), .Y(n13) );
  NOR2X1 U107 ( .A(n141), .B(n142), .Y(n140) );
  NAND3X1 U108 ( .A(n143), .B(n144), .C(n95), .Y(n142) );
  INVX1 U109 ( .A(n86), .Y(n95) );
  INVX1 U110 ( .A(N227), .Y(n144) );
  INVX1 U111 ( .A(N226), .Y(n143) );
  NAND3X1 U112 ( .A(n145), .B(n84), .C(n79), .Y(n141) );
  NAND3X1 U113 ( .A(state[2]), .B(n23), .C(n146), .Y(n84) );
  NOR2X1 U114 ( .A(n147), .B(n148), .Y(n146) );
  INVX1 U115 ( .A(N230), .Y(n145) );
  NOR2X1 U116 ( .A(n149), .B(n150), .Y(n139) );
  NAND3X1 U117 ( .A(n83), .B(n36), .C(n96), .Y(n150) );
  INVX1 U118 ( .A(n133), .Y(n96) );
  NAND2X1 U119 ( .A(crc5_rcving), .B(state[1]), .Y(n36) );
  NAND3X1 U120 ( .A(n132), .B(state[4]), .C(n151), .Y(n83) );
  NOR2X1 U121 ( .A(n152), .B(n147), .Y(n151) );
  NAND3X1 U122 ( .A(n43), .B(n131), .C(n65), .Y(n149) );
  NAND2X1 U123 ( .A(n153), .B(n23), .Y(n131) );
  NOR2X1 U124 ( .A(n70), .B(n17), .Y(n135) );
  INVX1 U125 ( .A(n97), .Y(n70) );
  NOR2X1 U126 ( .A(n154), .B(n155), .Y(n118) );
  OAI21X1 U127 ( .A(pid_bits_received), .B(n74), .C(n156), .Y(n155) );
  INVX1 U128 ( .A(n72), .Y(n156) );
  OAI21X1 U129 ( .A(data_bits_received), .B(n20), .C(n157), .Y(n72) );
  AOI21X1 U130 ( .A(n158), .B(n37), .C(n173), .Y(n157) );
  INVX1 U131 ( .A(n16), .Y(n37) );
  OAI21X1 U132 ( .A(eop), .B(n43), .C(n159), .Y(n154) );
  AOI21X1 U133 ( .A(n158), .B(n160), .C(n181), .Y(n159) );
  INVX1 U134 ( .A(n39), .Y(n160) );
  NOR2X1 U135 ( .A(sync_bits_received), .B(n35), .Y(n158) );
  NAND2X1 U136 ( .A(n63), .B(n59), .Y(n43) );
  OAI21X1 U137 ( .A(sync_bits_received), .B(n117), .C(n161), .Y(n126) );
  INVX1 U138 ( .A(n162), .Y(n161) );
  OAI22X1 U139 ( .A(n65), .B(crc5_bits_received), .C(n38), .D(
        pid_bits_received), .Y(n162) );
  NAND2X1 U140 ( .A(crc5_rcving), .B(n78), .Y(n65) );
  INVX1 U141 ( .A(n163), .Y(crc5_rcving) );
  NAND3X1 U142 ( .A(state[0]), .B(state[2]), .C(n164), .Y(n163) );
  INVX1 U143 ( .A(n165), .Y(n173) );
  NAND3X1 U144 ( .A(n86), .B(state[2]), .C(n164), .Y(n165) );
  INVX1 U145 ( .A(n15), .Y(n181) );
  NAND2X1 U146 ( .A(n86), .B(n166), .Y(n15) );
  NAND2X1 U147 ( .A(n11), .B(n20), .Y(N230) );
  NAND2X1 U148 ( .A(n25), .B(n63), .Y(n20) );
  NAND2X1 U149 ( .A(n166), .B(n23), .Y(n11) );
  INVX1 U150 ( .A(n79), .Y(N229) );
  NAND2X1 U151 ( .A(state[0]), .B(n166), .Y(n79) );
  INVX1 U152 ( .A(n167), .Y(n166) );
  NAND3X1 U153 ( .A(n152), .B(n147), .C(state[4]), .Y(n167) );
  NAND3X1 U154 ( .A(n74), .B(n42), .C(n168), .Y(N227) );
  NOR2X1 U155 ( .A(n17), .B(n169), .Y(n168) );
  NAND2X1 U156 ( .A(n97), .B(n38), .Y(n169) );
  NAND2X1 U157 ( .A(n132), .B(n138), .Y(n38) );
  NAND2X1 U158 ( .A(n59), .B(n86), .Y(n97) );
  INVX1 U159 ( .A(n12), .Y(n59) );
  INVX1 U160 ( .A(n64), .Y(n17) );
  NAND2X1 U161 ( .A(n25), .B(n86), .Y(n64) );
  INVX1 U162 ( .A(n170), .Y(n25) );
  NAND3X1 U163 ( .A(state[2]), .B(n23), .C(n164), .Y(n42) );
  NAND2X1 U164 ( .A(n153), .B(n63), .Y(n74) );
  NAND3X1 U165 ( .A(n117), .B(n82), .C(n171), .Y(N226) );
  AOI22X1 U166 ( .A(n23), .B(n138), .C(n63), .D(n133), .Y(n171) );
  NAND2X1 U167 ( .A(n16), .B(n39), .Y(n133) );
  NAND3X1 U168 ( .A(n152), .B(n148), .C(state[3]), .Y(n39) );
  NAND3X1 U169 ( .A(state[2]), .B(n147), .C(state[4]), .Y(n16) );
  INVX1 U170 ( .A(state[3]), .Y(n147) );
  INVX1 U171 ( .A(n35), .Y(n63) );
  NAND2X1 U172 ( .A(state[0]), .B(state[1]), .Y(n35) );
  NAND2X1 U173 ( .A(n170), .B(n12), .Y(n138) );
  NAND3X1 U174 ( .A(state[3]), .B(n152), .C(state[4]), .Y(n12) );
  NAND3X1 U175 ( .A(state[2]), .B(n148), .C(state[3]), .Y(n170) );
  INVX1 U176 ( .A(state[4]), .Y(n148) );
  NOR2X1 U177 ( .A(state[0]), .B(state[1]), .Y(n23) );
  NAND2X1 U178 ( .A(n153), .B(n86), .Y(n82) );
  NOR2X1 U179 ( .A(n78), .B(state[0]), .Y(n86) );
  NAND2X1 U180 ( .A(n132), .B(n153), .Y(n117) );
  AND2X1 U181 ( .A(n164), .B(n152), .Y(n153) );
  INVX1 U182 ( .A(state[2]), .Y(n152) );
  NOR2X1 U183 ( .A(state[3]), .B(state[4]), .Y(n164) );
  INVX1 U184 ( .A(n87), .Y(n132) );
  NAND2X1 U185 ( .A(state[0]), .B(n78), .Y(n87) );
  INVX1 U186 ( .A(state[1]), .Y(n78) );
endmodule


module usb_receiver ( clk, n_rst, d_plus, d_minus, rcv_sync, rcv_pid, rcv_crc5, 
        rcv_crc16, rcv_data, rcv_data_ready );
  output [7:0] rcv_sync;
  output [7:0] rcv_pid;
  output [4:0] rcv_crc5;
  output [15:0] rcv_crc16;
  output [63:0] rcv_data;
  input clk, n_rst, d_plus, d_minus;
  output rcv_data_ready;
  wire   d_plus_sync, d_minus_sync, eop, sync_shift_enable, pid_shift_enable,
         crc5_shift_enable, crc16_shift_enable, data_shift_enable, d_edge,
         sync_rcving, pid_rcving, crc5_rcving, crc16_rcving, data_rcving,
         sync_bits_received, pid_bits_received, crc5_bits_received,
         crc16_bits_received, data_bits_received;
  tri   d_orig;

  sync_high_1 sync_high1 ( .clk(clk), .n_rst(n_rst), .async_in(d_plus), 
        .sync_out(d_plus_sync) );
  sync_low sync_low1 ( .clk(clk), .n_rst(n_rst), .async_in(d_minus), 
        .sync_out(d_minus_sync) );
  eop_detect eop_detect1 ( .d_plus(d_plus_sync), .d_minus(d_minus_sync), .eop(
        eop) );
  decode decode1 ( .clk(clk), .n_rst(n_rst), .d_plus(d_plus_sync), .d_minus(
        d_minus_sync), .sync_shift_enable(sync_shift_enable), 
        .pid_shift_enable(pid_shift_enable), .crc5_shift_enable(
        crc5_shift_enable), .crc16_shift_enable(crc16_shift_enable), 
        .data_shift_enable(data_shift_enable), .eop(eop), .d_orig(d_orig) );
  edge_detect edge_detect1 ( .clk(clk), .n_rst(n_rst), .d_plus(d_plus_sync), 
        .d_minus(d_minus_sync), .d_edge(d_edge) );
  timer timer1 ( .clk(clk), .n_rst(n_rst), .d_edge(d_edge), .sync_rcving(
        sync_rcving), .pid_rcving(pid_rcving), .crc5_rcving(crc5_rcving), 
        .crc16_rcving(crc16_rcving), .data_rcving(data_rcving), 
        .sync_shift_enable(sync_shift_enable), .pid_shift_enable(
        pid_shift_enable), .crc5_shift_enable(crc5_shift_enable), 
        .crc16_shift_enable(crc16_shift_enable), .data_shift_enable(
        data_shift_enable), .sync_bits_received(sync_bits_received), 
        .pid_bits_received(pid_bits_received), .crc5_bits_received(
        crc5_bits_received), .crc16_bits_received(crc16_bits_received), 
        .data_bits_received(data_bits_received) );
  shift_register shift_register1 ( .clk(clk), .n_rst(n_rst), 
        .sync_shift_enable(sync_shift_enable), .pid_shift_enable(
        pid_shift_enable), .crc5_shift_enable(crc5_shift_enable), 
        .crc16_shift_enable(crc16_shift_enable), .data_shift_enable(
        data_shift_enable), .d_orig(d_orig), .rcv_sync(rcv_sync), .rcv_pid(
        rcv_pid), .rcv_crc5(rcv_crc5), .rcv_crc16(rcv_crc16), .rcv_data(
        rcv_data) );
  rcu rcu1 ( .clk(clk), .n_rst(n_rst), .d_edge(d_edge), .eop(eop), 
        .sync_shift_enable(sync_shift_enable), .pid_shift_enable(
        pid_shift_enable), .crc5_shift_enable(crc5_shift_enable), 
        .crc16_shift_enable(crc16_shift_enable), .data_shift_enable(
        data_shift_enable), .rcv_sync(rcv_sync), .rcv_pid(rcv_pid), .rcv_crc5(
        rcv_crc5), .rcv_crc16(rcv_crc16), .rcv_data(rcv_data), 
        .sync_bits_received(sync_bits_received), .pid_bits_received(
        pid_bits_received), .crc5_bits_received(crc5_bits_received), 
        .crc16_bits_received(crc16_bits_received), .data_bits_received(
        data_bits_received), .sync_rcving(sync_rcving), .pid_rcving(pid_rcving), .crc5_rcving(crc5_rcving), .crc16_rcving(crc16_rcving), .data_rcving(
        data_rcving), .rcv_data_ready(rcv_data_ready) );
endmodule


module permutation ( rcv_data, des_curr, tx_data, des_in );
  input [63:0] rcv_data;
  input [63:0] des_curr;
  output [63:0] tx_data;
  output [63:0] des_in;
  wire   \des_curr[24] , \des_curr[56] , \des_curr[16] , \des_curr[48] ,
         \des_curr[8] , \des_curr[40] , \des_curr[0] , \des_curr[22] ,
         \des_curr[25] , \des_curr[57] , \des_curr[17] , \des_curr[49] ,
         \des_curr[9] , \des_curr[41] , \des_curr[1] , \des_curr[23] ,
         \des_curr[26] , \des_curr[58] , \des_curr[18] , \des_curr[50] ,
         \des_curr[10] , \des_curr[42] , \des_curr[2] , \des_curr[27] ,
         \des_curr[59] , \des_curr[19] , \des_curr[51] , \des_curr[11] ,
         \des_curr[43] , \des_curr[3] , \des_curr[28] , \des_curr[60] ,
         \des_curr[20] , \des_curr[52] , \des_curr[12] , \des_curr[44] ,
         \des_curr[4] , \des_curr[29] , \des_curr[61] , \des_curr[21] ,
         \des_curr[53] , \des_curr[13] , \des_curr[45] , \des_curr[5] ,
         \des_curr[30] , \des_curr[62] , \des_curr[54] , \des_curr[14] ,
         \des_curr[46] , \des_curr[6] , \des_curr[31] , \des_curr[63] ,
         \des_curr[55] , \des_curr[15] , \des_curr[47] , \des_curr[7] ;
  assign tx_data[40] = \des_curr[24] ;
  assign tx_data[63] = \des_curr[24] ;
  assign \des_curr[24]  = des_curr[24];
  assign tx_data[62] = \des_curr[56] ;
  assign \des_curr[56]  = des_curr[56];
  assign tx_data[61] = \des_curr[16] ;
  assign \des_curr[16]  = des_curr[16];
  assign tx_data[60] = \des_curr[48] ;
  assign \des_curr[48]  = des_curr[48];
  assign tx_data[59] = \des_curr[8] ;
  assign \des_curr[8]  = des_curr[8];
  assign tx_data[58] = \des_curr[40] ;
  assign \des_curr[40]  = des_curr[40];
  assign tx_data[57] = \des_curr[0] ;
  assign \des_curr[0]  = des_curr[0];
  assign tx_data[13] = \des_curr[22] ;
  assign tx_data[56] = \des_curr[22] ;
  assign \des_curr[22]  = des_curr[22];
  assign tx_data[32] = \des_curr[25] ;
  assign tx_data[55] = \des_curr[25] ;
  assign \des_curr[25]  = des_curr[25];
  assign tx_data[54] = \des_curr[57] ;
  assign \des_curr[57]  = des_curr[57];
  assign tx_data[53] = \des_curr[17] ;
  assign \des_curr[17]  = des_curr[17];
  assign tx_data[52] = \des_curr[49] ;
  assign \des_curr[49]  = des_curr[49];
  assign tx_data[51] = \des_curr[9] ;
  assign \des_curr[9]  = des_curr[9];
  assign tx_data[50] = \des_curr[41] ;
  assign \des_curr[41]  = des_curr[41];
  assign tx_data[49] = \des_curr[1] ;
  assign \des_curr[1]  = des_curr[1];
  assign tx_data[5] = \des_curr[23] ;
  assign tx_data[48] = \des_curr[23] ;
  assign \des_curr[23]  = des_curr[23];
  assign tx_data[24] = \des_curr[26] ;
  assign tx_data[47] = \des_curr[26] ;
  assign \des_curr[26]  = des_curr[26];
  assign tx_data[46] = \des_curr[58] ;
  assign \des_curr[58]  = des_curr[58];
  assign tx_data[45] = \des_curr[18] ;
  assign \des_curr[18]  = des_curr[18];
  assign tx_data[44] = \des_curr[50] ;
  assign \des_curr[50]  = des_curr[50];
  assign tx_data[43] = \des_curr[10] ;
  assign \des_curr[10]  = des_curr[10];
  assign tx_data[42] = \des_curr[42] ;
  assign \des_curr[42]  = des_curr[42];
  assign tx_data[41] = \des_curr[2] ;
  assign \des_curr[2]  = des_curr[2];
  assign tx_data[16] = \des_curr[27] ;
  assign tx_data[39] = \des_curr[27] ;
  assign \des_curr[27]  = des_curr[27];
  assign tx_data[38] = \des_curr[59] ;
  assign \des_curr[59]  = des_curr[59];
  assign tx_data[37] = \des_curr[19] ;
  assign \des_curr[19]  = des_curr[19];
  assign tx_data[36] = \des_curr[51] ;
  assign \des_curr[51]  = des_curr[51];
  assign tx_data[35] = \des_curr[11] ;
  assign \des_curr[11]  = des_curr[11];
  assign tx_data[34] = \des_curr[43] ;
  assign \des_curr[43]  = des_curr[43];
  assign tx_data[33] = \des_curr[3] ;
  assign \des_curr[3]  = des_curr[3];
  assign tx_data[8] = \des_curr[28] ;
  assign tx_data[31] = \des_curr[28] ;
  assign \des_curr[28]  = des_curr[28];
  assign tx_data[30] = \des_curr[60] ;
  assign \des_curr[60]  = des_curr[60];
  assign tx_data[29] = \des_curr[20] ;
  assign \des_curr[20]  = des_curr[20];
  assign tx_data[28] = \des_curr[52] ;
  assign \des_curr[52]  = des_curr[52];
  assign tx_data[27] = \des_curr[12] ;
  assign \des_curr[12]  = des_curr[12];
  assign tx_data[26] = \des_curr[44] ;
  assign \des_curr[44]  = des_curr[44];
  assign tx_data[25] = \des_curr[4] ;
  assign \des_curr[4]  = des_curr[4];
  assign tx_data[0] = \des_curr[29] ;
  assign tx_data[23] = \des_curr[29] ;
  assign \des_curr[29]  = des_curr[29];
  assign tx_data[22] = \des_curr[61] ;
  assign \des_curr[61]  = des_curr[61];
  assign tx_data[21] = \des_curr[21] ;
  assign \des_curr[21]  = des_curr[21];
  assign tx_data[20] = \des_curr[53] ;
  assign \des_curr[53]  = des_curr[53];
  assign tx_data[19] = \des_curr[13] ;
  assign \des_curr[13]  = des_curr[13];
  assign tx_data[18] = \des_curr[45] ;
  assign \des_curr[45]  = des_curr[45];
  assign tx_data[17] = \des_curr[5] ;
  assign \des_curr[5]  = des_curr[5];
  assign tx_data[15] = \des_curr[30] ;
  assign \des_curr[30]  = des_curr[30];
  assign tx_data[14] = \des_curr[62] ;
  assign \des_curr[62]  = des_curr[62];
  assign tx_data[12] = \des_curr[54] ;
  assign \des_curr[54]  = des_curr[54];
  assign tx_data[11] = \des_curr[14] ;
  assign \des_curr[14]  = des_curr[14];
  assign tx_data[10] = \des_curr[46] ;
  assign \des_curr[46]  = des_curr[46];
  assign tx_data[9] = \des_curr[6] ;
  assign \des_curr[6]  = des_curr[6];
  assign tx_data[7] = \des_curr[31] ;
  assign \des_curr[31]  = des_curr[31];
  assign tx_data[6] = \des_curr[63] ;
  assign \des_curr[63]  = des_curr[63];
  assign tx_data[4] = \des_curr[55] ;
  assign \des_curr[55]  = des_curr[55];
  assign tx_data[3] = \des_curr[15] ;
  assign \des_curr[15]  = des_curr[15];
  assign tx_data[2] = \des_curr[47] ;
  assign \des_curr[47]  = des_curr[47];
  assign tx_data[1] = \des_curr[7] ;
  assign \des_curr[7]  = des_curr[7];
  assign des_in[63] = rcv_data[6];
  assign des_in[62] = rcv_data[14];
  assign des_in[61] = rcv_data[22];
  assign des_in[60] = rcv_data[30];
  assign des_in[59] = rcv_data[38];
  assign des_in[58] = rcv_data[46];
  assign des_in[57] = rcv_data[54];
  assign des_in[56] = rcv_data[62];
  assign des_in[55] = rcv_data[4];
  assign des_in[54] = rcv_data[12];
  assign des_in[53] = rcv_data[20];
  assign des_in[52] = rcv_data[28];
  assign des_in[51] = rcv_data[36];
  assign des_in[50] = rcv_data[44];
  assign des_in[49] = rcv_data[52];
  assign des_in[48] = rcv_data[60];
  assign des_in[47] = rcv_data[2];
  assign des_in[46] = rcv_data[10];
  assign des_in[45] = rcv_data[18];
  assign des_in[44] = rcv_data[26];
  assign des_in[43] = rcv_data[34];
  assign des_in[42] = rcv_data[42];
  assign des_in[41] = rcv_data[50];
  assign des_in[40] = rcv_data[58];
  assign des_in[39] = rcv_data[0];
  assign des_in[38] = rcv_data[8];
  assign des_in[37] = rcv_data[16];
  assign des_in[36] = rcv_data[24];
  assign des_in[35] = rcv_data[32];
  assign des_in[34] = rcv_data[40];
  assign des_in[33] = rcv_data[48];
  assign des_in[32] = rcv_data[56];
  assign des_in[31] = rcv_data[7];
  assign des_in[30] = rcv_data[15];
  assign des_in[29] = rcv_data[23];
  assign des_in[28] = rcv_data[31];
  assign des_in[27] = rcv_data[39];
  assign des_in[26] = rcv_data[47];
  assign des_in[25] = rcv_data[55];
  assign des_in[24] = rcv_data[63];
  assign des_in[23] = rcv_data[5];
  assign des_in[22] = rcv_data[13];
  assign des_in[21] = rcv_data[21];
  assign des_in[20] = rcv_data[29];
  assign des_in[19] = rcv_data[37];
  assign des_in[18] = rcv_data[45];
  assign des_in[17] = rcv_data[53];
  assign des_in[16] = rcv_data[61];
  assign des_in[15] = rcv_data[3];
  assign des_in[14] = rcv_data[11];
  assign des_in[13] = rcv_data[19];
  assign des_in[12] = rcv_data[27];
  assign des_in[11] = rcv_data[35];
  assign des_in[10] = rcv_data[43];
  assign des_in[9] = rcv_data[51];
  assign des_in[8] = rcv_data[59];
  assign des_in[7] = rcv_data[1];
  assign des_in[6] = rcv_data[9];
  assign des_in[5] = rcv_data[17];
  assign des_in[4] = rcv_data[25];
  assign des_in[3] = rcv_data[33];
  assign des_in[2] = rcv_data[41];
  assign des_in[1] = rcv_data[49];
  assign des_in[0] = rcv_data[57];

endmodule


module des_round_computations ( clk, n_rst, des_start, des_in, subkey, 
        des_curr );
  input [63:0] des_in;
  input [47:0] subkey;
  output [63:0] des_curr;
  input clk, n_rst, des_start;
  wire   n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94,
         n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106,
         n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117,
         n118, n119, n120, n121, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n150,
         n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n207, n208, n209, n210, n211, n212, n213, n214, n215, n216,
         n217, n218, n219, n220, n221, n222, n223, n224, n225, n226, n227,
         n228, n229, n230, n231, n232, n233, n234, n235, n236, n237, n238,
         n239, n240, n241, n242, n243, n244, n245, n246, n247, n248, n249,
         n250, n251, n252, n253, n254, n255, n256, n257, n258, n259, n260,
         n261, n262, n263, n264, n265, n266, n267, n268, n269, n270, n271,
         n272, n273, n274, n275, n276, n277, n278, n279, n280, n281, n282,
         n283, n284, n285, n286, n287, n288, n289, n290, n291, n292, n293,
         n294, n295, n296, n297, n298, n299, n300, n301, n302, n303, n304,
         n305, n306, n307, n308, n309, n310, n311, n312, n313, n314, n315,
         n316, n317, n318, n319, n320, n321, n322, n323, n324, n325, n326,
         n327, n328, n329, n330, n331, n332, n333, n334, n335, n336, n337,
         n338, n339, n340, n341, n342, n343, n344, n345, n346, n347, n348,
         n349, n350, n351, n352, n353, n354, n355, n356, n357, n358, n359,
         n360, n361, n362, n363, n364, n365, n366, n367, n368, n369, n370,
         n371, n372, n373, n374, n375, n376, n377, n378, n379, n380, n381,
         n382, n383, n384, n385, n386, n387, n388, n389, n390, n391, n392,
         n393, n394, n395, n396, n397, n398, n399, n400, n401, n402, n403,
         n404, n405, n406, n407, n408, n409, n410, n411, n412, n413, n414,
         n415, n416, n417, n418, n419, n420, n421, n422, n423, n424, n425,
         n426, n427, n428, n429, n430, n431, n432, n433, n434, n435, n436,
         n437, n438, n439, n440, n441, n442, n443, n444, n445, n446, n447,
         n448, n449, n450, n451, n452, n453, n454, n455, n456, n457, n458,
         n459, n460, n461, n462, n463, n464, n465, n466, n467, n468, n469,
         n470, n471, n472, n473, n474, n475, n476, n477, n478, n479, n480,
         n481, n482, n483, n484, n485, n486, n487, n488, n489, n490, n491,
         n492, n493, n494, n495, n496, n497, n498, n499, n500, n501, n502,
         n503, n504, n505, n506, n507, n508, n509, n510, n511, n512, n513,
         n514, n515, n516, n517, n518, n519, n520, n521, n522, n523, n524,
         n525, n526, n527, n528, n529, n530, n531, n532, n533, n534, n535,
         n536, n537, n538, n539, n540, n541, n542, n543, n544, n545, n546,
         n547, n548, n549, n550, n551, n552, n553, n554, n555, n556, n557,
         n558, n559, n560, n561, n562, n563, n564, n565, n566, n567, n568,
         n569, n570, n571, n572, n573, n574, n575, n576, n577, n578, n579,
         n580, n581, n582, n583, n584, n585, n586, n587, n588, n589, n590,
         n591, n592, n593, n594, n595, n596, n597, n598, n599, n600, n601,
         n602, n603, n604, n605, n606, n607, n608, n609, n610, n611, n612,
         n613, n614, n615, n616, n617, n618, n619, n620, n621, n622, n623,
         n624, n625, n626, n627, n628, n629, n630, n631, n632, n633, n634,
         n635, n636, n637, n638, n639, n640, n641, n642, n643, n644, n645,
         n646, n647, n648, n649, n650, n651, n652, n653, n654, n655, n656,
         n657, n658, n659, n660, n661, n662, n663, n664, n665, n666, n667,
         n668, n669, n670, n671, n672, n673, n674, n675, n676, n677, n678,
         n679, n680, n681, n682, n683, n684, n685, n686, n687, n688, n689,
         n690, n691, n692, n693, n694, n695, n696, n697, n698, n699, n700,
         n701, n702, n703, n704, n705, n706, n707, n708, n709, n710, n711,
         n712, n713, n714, n715, n716, n717, n718, n719, n720, n721, n722,
         n723, n724, n725, n726, n727, n728, n729, n730, n731, n732, n733,
         n734, n735, n736, n737, n738, n739, n740, n741, n742, n743, n744,
         n745, n746, n747, n748, n749, n750, n751, n752, n753, n754, n755,
         n756, n757, n758, n759, n760, n761, n762, n763, n764, n765, n766,
         n767, n768, n769, n770, n771, n772, n773, n774, n775, n776, n777,
         n778, n779, n780, n781, n782, n783, n784, n785, n786, n787, n788,
         n789, n790, n791, n792, n793, n794, n795, n796, n797, n798, n799,
         n800, n801, n802, n803, n804, n805, n806, n807, n808, n809, n810,
         n811, n812, n813, n814, n815, n816, n817, n818, n819, n820, n821,
         n822, n823, n824, n825, n826, n827, n828, n829, n830, n831, n832,
         n833, n834, n835, n836, n837, n838, n839, n840, n841, n842, n843,
         n844, n845, n846, n847, n848, n849, n850, n851, n852, n853, n854,
         n855, n856, n857, n858, n859, n860, n861, n862, n863, n864, n865,
         n866, n867, n868, n869, n870, n871, n872, n873, n874, n875, n876,
         n877, n878, n879, n880, n881, n882, n883, n884, n885, n886, n887,
         n888, n889, n890, n891, n892, n893, n894, n895, n896, n897, n898,
         n899, n900, n901, n902, n903, n904, n905, n906, n907, n908, n909,
         n910, n911, n912, n913, n914, n915, n916, n917, n918, n919, n920,
         n921, n922, n923, n924, n925, n926, n927, n928, n929, n930, n931,
         n932, n933, n934, n935, n936, n937, n938, n939, n940, n941, n942,
         n943, n944, n945, n946, n947, n948, n949, n950, n951, n952, n953,
         n954, n955, n956, n957, n958, n959, n960, n961, n962, n963, n964,
         n965, n966, n967, n968, n969, n970, n971, n972, n973, n974, n975,
         n976, n977, n978, n979, n980, n981, n982, n983, n984, n985, n986,
         n987, n988, n989, n990, n991, n992, n993, n994, n995, n996, n997,
         n998, n999, n1000, n1001, n1002, n1003, n1004, n1005, n1006, n1007,
         n1008, n1009, n1010, n1011, n1012, n1013, n1014, n1015, n1016, n1017,
         n1018, n1019, n1020, n1021, n1022, n1023, n1024, n1025, n1026, n1027,
         n1028, n1029, n1030, n1031, n1032, n1033, n1034, n1035, n1036, n1037,
         n1038, n1039, n1040, n1041, n1042, n1043, n1044, n1045, n1046, n1047,
         n1048, n1049, n1050, n1051, n1052, n1053, n1054, n1055, n1056, n1057,
         n1058, n1059, n1060, n1061, n1062, n1063, n1064, n1065, n1066, n1067,
         n1068, n1069, n1070, n1071, n1072, n1073, n1074, n1075, n1076, n1077,
         n1078, n1079, n1080, n1081, n1082, n1083, n1084, n1085, n1086, n1087,
         n1088, n1089, n1090, n1091, n1092, n1093, n1094, n1095, n1096, n1097,
         n1098;
  wire   [32:31] left;
  wire   [32:0] nxtLeft;
  wire   [32:0] nxtRight;

  DFFSR \right_reg[32]  ( .D(n1098), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[32]) );
  DFFSR \left_reg[32]  ( .D(nxtLeft[32]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        left[32]) );
  DFFSR \right_reg[0]  ( .D(nxtRight[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[0]) );
  DFFSR \right_reg[1]  ( .D(nxtRight[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[1]) );
  DFFSR \right_reg[27]  ( .D(nxtRight[27]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(des_curr[27]) );
  DFFSR \right_reg[23]  ( .D(nxtRight[23]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(des_curr[23]) );
  DFFSR \right_reg[26]  ( .D(nxtRight[26]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(des_curr[26]) );
  DFFSR \right_reg[14]  ( .D(nxtRight[14]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(des_curr[14]) );
  DFFSR \right_reg[29]  ( .D(nxtRight[29]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(des_curr[29]) );
  DFFSR \right_reg[9]  ( .D(nxtRight[9]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[9]) );
  DFFSR \right_reg[21]  ( .D(nxtRight[21]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(des_curr[21]) );
  DFFSR \right_reg[2]  ( .D(nxtRight[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[2]) );
  DFFSR \right_reg[17]  ( .D(nxtRight[17]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(des_curr[17]) );
  DFFSR \right_reg[6]  ( .D(nxtRight[6]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[6]) );
  DFFSR \right_reg[10]  ( .D(nxtRight[10]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(des_curr[10]) );
  DFFSR \right_reg[3]  ( .D(nxtRight[3]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[3]) );
  DFFSR \right_reg[11]  ( .D(nxtRight[11]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(des_curr[11]) );
  DFFSR \right_reg[18]  ( .D(nxtRight[18]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(des_curr[18]) );
  DFFSR \right_reg[12]  ( .D(nxtRight[12]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(des_curr[12]) );
  DFFSR \right_reg[7]  ( .D(nxtRight[7]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[7]) );
  DFFSR \right_reg[28]  ( .D(nxtRight[28]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(des_curr[28]) );
  DFFSR \right_reg[15]  ( .D(nxtRight[15]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(des_curr[15]) );
  DFFSR \right_reg[24]  ( .D(nxtRight[24]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(des_curr[24]) );
  DFFSR \right_reg[16]  ( .D(nxtRight[16]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(des_curr[16]) );
  DFFSR \right_reg[31]  ( .D(nxtRight[31]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(des_curr[31]) );
  DFFSR \right_reg[5]  ( .D(nxtRight[5]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[5]) );
  DFFSR \right_reg[25]  ( .D(nxtRight[25]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(des_curr[25]) );
  DFFSR \right_reg[30]  ( .D(nxtRight[30]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(des_curr[30]) );
  DFFSR \left_reg[30]  ( .D(nxtLeft[30]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[63]) );
  DFFSR \right_reg[19]  ( .D(nxtRight[19]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(des_curr[19]) );
  DFFSR \left_reg[19]  ( .D(nxtLeft[19]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[52]) );
  DFFSR \right_reg[4]  ( .D(nxtRight[4]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[4]) );
  DFFSR \right_reg[20]  ( .D(nxtRight[20]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(des_curr[20]) );
  DFFSR \right_reg[22]  ( .D(nxtRight[22]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(des_curr[22]) );
  DFFSR \left_reg[22]  ( .D(nxtLeft[22]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[55]) );
  DFFSR \right_reg[8]  ( .D(nxtRight[8]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[8]) );
  DFFSR \right_reg[13]  ( .D(nxtRight[13]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(des_curr[13]) );
  DFFSR \left_reg[13]  ( .D(nxtLeft[13]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[46]) );
  DFFSR \left_reg[8]  ( .D(nxtLeft[8]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[41]) );
  DFFSR \left_reg[20]  ( .D(nxtLeft[20]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[53]) );
  DFFSR \left_reg[4]  ( .D(nxtLeft[4]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[37]) );
  DFFSR \left_reg[25]  ( .D(nxtLeft[25]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[58]) );
  DFFSR \left_reg[5]  ( .D(nxtLeft[5]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[38]) );
  DFFSR \left_reg[31]  ( .D(nxtLeft[31]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        left[31]) );
  DFFSR \left_reg[16]  ( .D(nxtLeft[16]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[49]) );
  DFFSR \left_reg[24]  ( .D(nxtLeft[24]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[57]) );
  DFFSR \left_reg[15]  ( .D(nxtLeft[15]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[48]) );
  DFFSR \left_reg[28]  ( .D(nxtLeft[28]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[61]) );
  DFFSR \left_reg[7]  ( .D(nxtLeft[7]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[40]) );
  DFFSR \left_reg[12]  ( .D(nxtLeft[12]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[45]) );
  DFFSR \left_reg[18]  ( .D(nxtLeft[18]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[51]) );
  DFFSR \left_reg[11]  ( .D(nxtLeft[11]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[44]) );
  DFFSR \left_reg[3]  ( .D(nxtLeft[3]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[36]) );
  DFFSR \left_reg[10]  ( .D(nxtLeft[10]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[43]) );
  DFFSR \left_reg[6]  ( .D(nxtLeft[6]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[39]) );
  DFFSR \left_reg[17]  ( .D(nxtLeft[17]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[50]) );
  DFFSR \left_reg[2]  ( .D(nxtLeft[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[35]) );
  DFFSR \left_reg[21]  ( .D(nxtLeft[21]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[54]) );
  DFFSR \left_reg[9]  ( .D(nxtLeft[9]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[42]) );
  DFFSR \left_reg[29]  ( .D(nxtLeft[29]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[62]) );
  DFFSR \left_reg[14]  ( .D(nxtLeft[14]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[47]) );
  DFFSR \left_reg[26]  ( .D(nxtLeft[26]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[59]) );
  DFFSR \left_reg[23]  ( .D(nxtLeft[23]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[56]) );
  DFFSR \left_reg[27]  ( .D(nxtLeft[27]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[60]) );
  DFFSR \left_reg[1]  ( .D(nxtLeft[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[34]) );
  DFFSR \left_reg[0]  ( .D(nxtLeft[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[33]) );
  MUX2X1 U69 ( .B(n67), .A(n68), .S(des_start), .Y(nxtRight[9]) );
  INVX1 U70 ( .A(des_in[9]), .Y(n68) );
  XNOR2X1 U71 ( .A(des_curr[42]), .B(n69), .Y(n67) );
  NAND3X1 U72 ( .A(n70), .B(n71), .C(n72), .Y(n69) );
  AOI21X1 U73 ( .A(n73), .B(n74), .C(n75), .Y(n72) );
  OAI21X1 U74 ( .A(n76), .B(n77), .C(n78), .Y(n75) );
  OAI21X1 U75 ( .A(n79), .B(n80), .C(n81), .Y(n78) );
  INVX1 U76 ( .A(n82), .Y(n79) );
  NOR2X1 U77 ( .A(n83), .B(n84), .Y(n77) );
  NAND3X1 U78 ( .A(n85), .B(n86), .C(n87), .Y(n73) );
  INVX1 U79 ( .A(n88), .Y(n87) );
  INVX1 U80 ( .A(n89), .Y(n85) );
  AOI22X1 U81 ( .A(n90), .B(n91), .C(n92), .D(n93), .Y(n70) );
  MUX2X1 U82 ( .B(n94), .A(n95), .S(des_start), .Y(nxtRight[8]) );
  INVX1 U83 ( .A(des_in[8]), .Y(n95) );
  XNOR2X1 U84 ( .A(des_curr[41]), .B(n96), .Y(n94) );
  NAND3X1 U85 ( .A(n97), .B(n98), .C(n99), .Y(n96) );
  NOR2X1 U86 ( .A(n100), .B(n101), .Y(n99) );
  OAI21X1 U87 ( .A(n102), .B(n103), .C(n104), .Y(n101) );
  OAI21X1 U88 ( .A(n105), .B(n106), .C(n107), .Y(n104) );
  NAND2X1 U89 ( .A(n108), .B(n109), .Y(n106) );
  NAND2X1 U90 ( .A(n110), .B(n111), .Y(n105) );
  OAI21X1 U91 ( .A(n112), .B(n113), .C(n114), .Y(n100) );
  AND2X1 U92 ( .A(n115), .B(n116), .Y(n113) );
  AOI22X1 U93 ( .A(n117), .B(n118), .C(n119), .D(n120), .Y(n97) );
  MUX2X1 U94 ( .B(n121), .A(n122), .S(des_start), .Y(nxtRight[7]) );
  INVX1 U95 ( .A(des_in[7]), .Y(n122) );
  XNOR2X1 U96 ( .A(des_curr[40]), .B(n123), .Y(n121) );
  NAND3X1 U97 ( .A(n124), .B(n125), .C(n126), .Y(n123) );
  NOR2X1 U98 ( .A(n127), .B(n128), .Y(n126) );
  OAI22X1 U99 ( .A(n129), .B(n130), .C(n131), .D(n132), .Y(n128) );
  OAI21X1 U100 ( .A(n133), .B(n134), .C(n135), .Y(n127) );
  AND2X1 U101 ( .A(n136), .B(n137), .Y(n135) );
  OAI21X1 U102 ( .A(n138), .B(n139), .C(n140), .Y(n137) );
  INVX1 U103 ( .A(n141), .Y(n138) );
  OAI21X1 U104 ( .A(n142), .B(n143), .C(n144), .Y(n136) );
  INVX1 U105 ( .A(n145), .Y(n143) );
  NOR2X1 U106 ( .A(n146), .B(n147), .Y(n125) );
  OAI22X1 U107 ( .A(n148), .B(n149), .C(n150), .D(n145), .Y(n147) );
  NOR2X1 U108 ( .A(n151), .B(n152), .Y(n124) );
  MUX2X1 U109 ( .B(n153), .A(n154), .S(des_start), .Y(nxtRight[6]) );
  INVX1 U110 ( .A(des_in[6]), .Y(n154) );
  XNOR2X1 U111 ( .A(des_curr[39]), .B(n155), .Y(n153) );
  NAND3X1 U112 ( .A(n156), .B(n157), .C(n158), .Y(n155) );
  NOR2X1 U113 ( .A(n159), .B(n160), .Y(n158) );
  OAI22X1 U114 ( .A(n161), .B(n162), .C(n163), .D(n164), .Y(n160) );
  NAND3X1 U115 ( .A(n165), .B(n166), .C(n167), .Y(n159) );
  OAI21X1 U116 ( .A(n168), .B(n169), .C(n170), .Y(n167) );
  NAND2X1 U117 ( .A(n171), .B(n172), .Y(n169) );
  OAI21X1 U118 ( .A(n173), .B(n174), .C(n175), .Y(n166) );
  INVX1 U119 ( .A(n176), .Y(n174) );
  INVX1 U120 ( .A(n162), .Y(n173) );
  OAI21X1 U121 ( .A(n177), .B(n178), .C(n179), .Y(n165) );
  AOI22X1 U122 ( .A(n180), .B(n181), .C(n182), .D(n183), .Y(n157) );
  NOR2X1 U123 ( .A(n184), .B(n185), .Y(n156) );
  MUX2X1 U124 ( .B(n186), .A(n187), .S(des_start), .Y(nxtRight[5]) );
  INVX1 U125 ( .A(des_in[5]), .Y(n187) );
  XNOR2X1 U126 ( .A(des_curr[38]), .B(n188), .Y(n186) );
  NAND3X1 U127 ( .A(n189), .B(n190), .C(n191), .Y(n188) );
  NOR2X1 U128 ( .A(n192), .B(n193), .Y(n191) );
  OAI21X1 U129 ( .A(n194), .B(n195), .C(n196), .Y(n193) );
  OAI21X1 U130 ( .A(n197), .B(n198), .C(n199), .Y(n196) );
  AOI21X1 U131 ( .A(n200), .B(n201), .C(n202), .Y(n194) );
  OAI21X1 U132 ( .A(n203), .B(n204), .C(n205), .Y(n192) );
  OAI21X1 U133 ( .A(n206), .B(n207), .C(n208), .Y(n205) );
  NOR2X1 U134 ( .A(n209), .B(n210), .Y(n204) );
  AOI22X1 U135 ( .A(n211), .B(n212), .C(n213), .D(n214), .Y(n190) );
  AOI21X1 U136 ( .A(n215), .B(n216), .C(n217), .Y(n189) );
  MUX2X1 U137 ( .B(n218), .A(n219), .S(des_start), .Y(nxtRight[4]) );
  INVX1 U138 ( .A(des_in[4]), .Y(n219) );
  XNOR2X1 U139 ( .A(des_curr[37]), .B(n220), .Y(n218) );
  NAND2X1 U140 ( .A(n221), .B(n222), .Y(n220) );
  NOR2X1 U141 ( .A(n223), .B(n224), .Y(n222) );
  OAI21X1 U142 ( .A(n225), .B(n226), .C(n227), .Y(n224) );
  OAI21X1 U143 ( .A(n228), .B(n229), .C(n230), .Y(n227) );
  INVX1 U144 ( .A(n231), .Y(n229) );
  NOR2X1 U145 ( .A(n228), .B(n232), .Y(n225) );
  OAI21X1 U146 ( .A(n233), .B(n234), .C(n235), .Y(n223) );
  OAI21X1 U147 ( .A(n236), .B(n237), .C(n238), .Y(n235) );
  NOR2X1 U148 ( .A(n239), .B(n240), .Y(n234) );
  NOR2X1 U149 ( .A(n241), .B(n242), .Y(n221) );
  OAI21X1 U150 ( .A(n243), .B(n244), .C(n245), .Y(n242) );
  OAI21X1 U151 ( .A(n246), .B(n247), .C(n248), .Y(n241) );
  OAI21X1 U152 ( .A(n249), .B(n250), .C(n251), .Y(n248) );
  NAND2X1 U153 ( .A(n252), .B(n253), .Y(n250) );
  MUX2X1 U154 ( .B(n254), .A(n255), .S(des_start), .Y(nxtRight[3]) );
  INVX1 U155 ( .A(des_in[3]), .Y(n255) );
  XNOR2X1 U156 ( .A(des_curr[36]), .B(n256), .Y(n254) );
  NAND3X1 U157 ( .A(n257), .B(n258), .C(n259), .Y(n256) );
  NOR2X1 U158 ( .A(n260), .B(n261), .Y(n259) );
  OAI22X1 U159 ( .A(n262), .B(n263), .C(n264), .D(n265), .Y(n261) );
  OAI21X1 U160 ( .A(n266), .B(n267), .C(n268), .Y(n260) );
  OAI21X1 U161 ( .A(n269), .B(n270), .C(n271), .Y(n268) );
  NOR2X1 U162 ( .A(n272), .B(n273), .Y(n258) );
  NOR2X1 U163 ( .A(n274), .B(n275), .Y(n257) );
  MUX2X1 U164 ( .B(n276), .A(n277), .S(des_start), .Y(nxtRight[31]) );
  INVX1 U165 ( .A(des_in[31]), .Y(n277) );
  XNOR2X1 U166 ( .A(left[31]), .B(n278), .Y(n276) );
  NAND3X1 U167 ( .A(n279), .B(n280), .C(n281), .Y(n278) );
  NOR2X1 U168 ( .A(n282), .B(n283), .Y(n281) );
  OAI21X1 U169 ( .A(n284), .B(n164), .C(n285), .Y(n283) );
  OAI21X1 U170 ( .A(n178), .B(n286), .C(n287), .Y(n285) );
  INVX1 U171 ( .A(n288), .Y(n284) );
  OAI21X1 U172 ( .A(n289), .B(n290), .C(n291), .Y(n282) );
  OAI21X1 U173 ( .A(n292), .B(n293), .C(n175), .Y(n291) );
  NOR2X1 U174 ( .A(n294), .B(n295), .Y(n290) );
  AOI22X1 U175 ( .A(n182), .B(n296), .C(n177), .D(n181), .Y(n280) );
  AOI21X1 U176 ( .A(n183), .B(n179), .C(n185), .Y(n279) );
  OAI21X1 U177 ( .A(n297), .B(n164), .C(n298), .Y(n185) );
  AOI22X1 U178 ( .A(n299), .B(n300), .C(n293), .D(n179), .Y(n298) );
  INVX1 U179 ( .A(n301), .Y(n299) );
  OAI21X1 U180 ( .A(n302), .B(n303), .C(n175), .Y(n301) );
  MUX2X1 U181 ( .B(n304), .A(n305), .S(des_start), .Y(nxtRight[30]) );
  INVX1 U182 ( .A(des_in[30]), .Y(n305) );
  XOR2X1 U183 ( .A(des_curr[63]), .B(n306), .Y(n304) );
  NOR2X1 U184 ( .A(n307), .B(n308), .Y(n306) );
  NAND3X1 U185 ( .A(n309), .B(n310), .C(n311), .Y(n308) );
  AOI22X1 U186 ( .A(n230), .B(n312), .C(n313), .D(n314), .Y(n311) );
  INVX1 U187 ( .A(n315), .Y(n312) );
  NAND3X1 U188 ( .A(n316), .B(n317), .C(n318), .Y(n307) );
  AOI22X1 U189 ( .A(n319), .B(n320), .C(n321), .D(n322), .Y(n318) );
  OAI21X1 U190 ( .A(n249), .B(n323), .C(n251), .Y(n317) );
  INVX1 U191 ( .A(n324), .Y(n323) );
  OAI21X1 U192 ( .A(n325), .B(n326), .C(n327), .Y(n316) );
  OR2X1 U193 ( .A(n232), .B(n236), .Y(n326) );
  MUX2X1 U194 ( .B(n328), .A(n329), .S(des_start), .Y(nxtRight[2]) );
  INVX1 U195 ( .A(des_in[2]), .Y(n329) );
  XNOR2X1 U196 ( .A(des_curr[35]), .B(n330), .Y(n328) );
  NAND3X1 U197 ( .A(n331), .B(n98), .C(n332), .Y(n330) );
  NOR2X1 U198 ( .A(n333), .B(n334), .Y(n332) );
  OAI21X1 U199 ( .A(n112), .B(n335), .C(n336), .Y(n334) );
  OAI21X1 U200 ( .A(n337), .B(n338), .C(n107), .Y(n336) );
  NOR2X1 U201 ( .A(n119), .B(n339), .Y(n335) );
  INVX1 U202 ( .A(n111), .Y(n119) );
  OAI21X1 U203 ( .A(n340), .B(n341), .C(n342), .Y(n333) );
  NOR2X1 U204 ( .A(n343), .B(n339), .Y(n340) );
  NOR2X1 U205 ( .A(n344), .B(n345), .Y(n98) );
  OAI21X1 U206 ( .A(n112), .B(n346), .C(n347), .Y(n345) );
  OAI21X1 U207 ( .A(n348), .B(n349), .C(n107), .Y(n347) );
  NAND2X1 U208 ( .A(n350), .B(n351), .Y(n349) );
  INVX1 U209 ( .A(n352), .Y(n112) );
  OAI21X1 U210 ( .A(n110), .B(n353), .C(n354), .Y(n344) );
  NAND3X1 U211 ( .A(n355), .B(n356), .C(n357), .Y(n354) );
  AOI22X1 U212 ( .A(n358), .B(n359), .C(n360), .D(n118), .Y(n331) );
  INVX1 U213 ( .A(n108), .Y(n360) );
  NOR2X1 U214 ( .A(n361), .B(n362), .Y(n108) );
  NAND3X1 U215 ( .A(n351), .B(n363), .C(n116), .Y(n359) );
  MUX2X1 U216 ( .B(n364), .A(n365), .S(des_start), .Y(nxtRight[29]) );
  INVX1 U217 ( .A(des_in[29]), .Y(n365) );
  XNOR2X1 U218 ( .A(des_curr[62]), .B(n366), .Y(n364) );
  NAND3X1 U219 ( .A(n367), .B(n368), .C(n369), .Y(n366) );
  NOR2X1 U220 ( .A(n370), .B(n371), .Y(n369) );
  OAI22X1 U221 ( .A(n150), .B(n372), .C(n148), .D(n373), .Y(n371) );
  INVX1 U222 ( .A(n374), .Y(n148) );
  OAI21X1 U223 ( .A(n375), .B(n129), .C(n376), .Y(n370) );
  OAI21X1 U224 ( .A(n377), .B(n378), .C(n140), .Y(n376) );
  INVX1 U225 ( .A(n379), .Y(n375) );
  AOI21X1 U226 ( .A(n380), .B(n381), .C(n151), .Y(n368) );
  OR2X1 U227 ( .A(n382), .B(n383), .Y(n151) );
  OAI22X1 U228 ( .A(n129), .B(n384), .C(n385), .D(n386), .Y(n383) );
  OAI21X1 U229 ( .A(n387), .B(n388), .C(n389), .Y(n382) );
  OAI21X1 U230 ( .A(n390), .B(n391), .C(n140), .Y(n389) );
  INVX1 U231 ( .A(n392), .Y(n391) );
  NOR2X1 U232 ( .A(n393), .B(n394), .Y(n367) );
  MUX2X1 U233 ( .B(n395), .A(n396), .S(des_start), .Y(nxtRight[28]) );
  INVX1 U234 ( .A(des_in[28]), .Y(n396) );
  XNOR2X1 U235 ( .A(des_curr[61]), .B(n397), .Y(n395) );
  NAND3X1 U236 ( .A(n398), .B(n399), .C(n400), .Y(n397) );
  NOR2X1 U237 ( .A(n401), .B(n402), .Y(n400) );
  OAI21X1 U238 ( .A(n403), .B(n266), .C(n404), .Y(n402) );
  OAI22X1 U239 ( .A(n265), .B(n405), .C(n406), .D(n262), .Y(n401) );
  NOR2X1 U240 ( .A(n273), .B(n407), .Y(n398) );
  OAI22X1 U241 ( .A(n266), .B(n408), .C(n409), .D(n410), .Y(n273) );
  INVX1 U242 ( .A(n411), .Y(n408) );
  MUX2X1 U243 ( .B(n412), .A(n413), .S(des_start), .Y(nxtRight[27]) );
  INVX1 U244 ( .A(des_in[27]), .Y(n413) );
  XNOR2X1 U245 ( .A(des_curr[60]), .B(n414), .Y(n412) );
  NAND3X1 U246 ( .A(n415), .B(n416), .C(n417), .Y(n414) );
  NOR2X1 U247 ( .A(n418), .B(n419), .Y(n417) );
  OAI21X1 U248 ( .A(n420), .B(n421), .C(n422), .Y(n419) );
  INVX1 U249 ( .A(n423), .Y(n418) );
  AOI22X1 U250 ( .A(n216), .B(n206), .C(n424), .D(n215), .Y(n423) );
  AOI21X1 U251 ( .A(n425), .B(n426), .C(n427), .Y(n416) );
  OAI21X1 U252 ( .A(n203), .B(n428), .C(n429), .Y(n427) );
  OAI21X1 U253 ( .A(n215), .B(n197), .C(n208), .Y(n429) );
  INVX1 U254 ( .A(n430), .Y(n215) );
  INVX1 U255 ( .A(n431), .Y(n203) );
  AOI22X1 U256 ( .A(n209), .B(n432), .C(n433), .D(n212), .Y(n415) );
  MUX2X1 U257 ( .B(n434), .A(n435), .S(des_start), .Y(nxtRight[26]) );
  INVX1 U258 ( .A(des_in[26]), .Y(n435) );
  XOR2X1 U259 ( .A(des_curr[59]), .B(n436), .Y(n434) );
  NOR2X1 U260 ( .A(n437), .B(n438), .Y(n436) );
  OR2X1 U261 ( .A(n439), .B(n440), .Y(n438) );
  OAI21X1 U262 ( .A(n341), .B(n363), .C(n441), .Y(n440) );
  INVX1 U263 ( .A(n442), .Y(n441) );
  OAI22X1 U264 ( .A(n443), .B(n111), .C(n116), .D(n444), .Y(n439) );
  NOR2X1 U265 ( .A(n343), .B(n338), .Y(n116) );
  INVX1 U266 ( .A(n445), .Y(n338) );
  INVX1 U267 ( .A(n118), .Y(n443) );
  NAND2X1 U268 ( .A(n444), .B(n353), .Y(n118) );
  NAND3X1 U269 ( .A(n446), .B(n447), .C(n448), .Y(n437) );
  AOI22X1 U270 ( .A(n449), .B(n352), .C(n450), .D(n107), .Y(n448) );
  NAND3X1 U271 ( .A(n451), .B(n110), .C(n102), .Y(n450) );
  AND2X1 U272 ( .A(n350), .B(n452), .Y(n102) );
  NAND3X1 U273 ( .A(n453), .B(n454), .C(n115), .Y(n449) );
  OAI21X1 U274 ( .A(n348), .B(n455), .C(n120), .Y(n447) );
  OAI21X1 U275 ( .A(n456), .B(n361), .C(n358), .Y(n446) );
  INVX1 U276 ( .A(n346), .Y(n456) );
  MUX2X1 U277 ( .B(n457), .A(n458), .S(des_start), .Y(nxtRight[25]) );
  INVX1 U278 ( .A(des_in[25]), .Y(n458) );
  XOR2X1 U279 ( .A(des_curr[58]), .B(n459), .Y(n457) );
  NOR2X1 U280 ( .A(n460), .B(n461), .Y(n459) );
  OR2X1 U281 ( .A(n462), .B(n463), .Y(n461) );
  OAI21X1 U282 ( .A(n464), .B(n465), .C(n466), .Y(n463) );
  INVX1 U283 ( .A(n467), .Y(n466) );
  NAND3X1 U284 ( .A(n468), .B(n469), .C(n470), .Y(n460) );
  AOI22X1 U285 ( .A(n471), .B(n472), .C(n473), .D(n474), .Y(n470) );
  OAI21X1 U286 ( .A(n475), .B(n476), .C(n477), .Y(n469) );
  OAI21X1 U287 ( .A(n478), .B(n479), .C(n480), .Y(n468) );
  MUX2X1 U288 ( .B(n481), .A(n482), .S(des_start), .Y(nxtRight[24]) );
  INVX1 U289 ( .A(des_in[24]), .Y(n482) );
  XNOR2X1 U290 ( .A(des_curr[57]), .B(n483), .Y(n481) );
  NAND3X1 U291 ( .A(n484), .B(n485), .C(n486), .Y(n483) );
  NOR2X1 U292 ( .A(n487), .B(n488), .Y(n486) );
  OAI21X1 U293 ( .A(n150), .B(n489), .C(n490), .Y(n488) );
  OAI21X1 U294 ( .A(n139), .B(n491), .C(n381), .Y(n490) );
  NAND2X1 U295 ( .A(n149), .B(n492), .Y(n491) );
  NAND3X1 U296 ( .A(n493), .B(n494), .C(n495), .Y(n487) );
  OAI21X1 U297 ( .A(n390), .B(n496), .C(n497), .Y(n495) );
  OAI21X1 U298 ( .A(n390), .B(n380), .C(n140), .Y(n494) );
  INVX1 U299 ( .A(n498), .Y(n390) );
  OAI21X1 U300 ( .A(n499), .B(n378), .C(n374), .Y(n493) );
  AOI21X1 U301 ( .A(n500), .B(n144), .C(n501), .Y(n485) );
  OAI22X1 U302 ( .A(n502), .B(n145), .C(n131), .D(n141), .Y(n501) );
  NOR2X1 U303 ( .A(n374), .B(n503), .Y(n131) );
  NOR2X1 U304 ( .A(n152), .B(n393), .Y(n484) );
  OAI21X1 U305 ( .A(n504), .B(n385), .C(n505), .Y(n393) );
  AOI22X1 U306 ( .A(n144), .B(n506), .C(n499), .D(n381), .Y(n505) );
  NAND2X1 U307 ( .A(n149), .B(n130), .Y(n506) );
  NAND2X1 U308 ( .A(n507), .B(n508), .Y(n152) );
  AOI21X1 U309 ( .A(n503), .B(n377), .C(n509), .Y(n508) );
  OAI21X1 U310 ( .A(n129), .B(n392), .C(n510), .Y(n509) );
  AOI22X1 U311 ( .A(n496), .B(n140), .C(n139), .D(n374), .Y(n507) );
  INVX1 U312 ( .A(n373), .Y(n496) );
  MUX2X1 U313 ( .B(n511), .A(n512), .S(des_start), .Y(nxtRight[23]) );
  INVX1 U314 ( .A(des_in[23]), .Y(n512) );
  XNOR2X1 U315 ( .A(des_curr[56]), .B(n513), .Y(n511) );
  NAND3X1 U316 ( .A(n514), .B(n515), .C(n516), .Y(n513) );
  NOR2X1 U317 ( .A(n517), .B(n518), .Y(n516) );
  OAI21X1 U318 ( .A(n519), .B(n520), .C(n521), .Y(n518) );
  OAI21X1 U319 ( .A(n522), .B(n523), .C(n92), .Y(n521) );
  NOR2X1 U320 ( .A(n524), .B(n525), .Y(n519) );
  OAI21X1 U321 ( .A(n526), .B(n527), .C(n528), .Y(n517) );
  OAI21X1 U322 ( .A(n90), .B(n88), .C(n529), .Y(n528) );
  NAND3X1 U323 ( .A(n530), .B(n531), .C(n532), .Y(n88) );
  NOR2X1 U324 ( .A(n533), .B(n93), .Y(n527) );
  AOI22X1 U325 ( .A(n534), .B(n535), .C(n81), .D(n89), .Y(n515) );
  NAND2X1 U326 ( .A(n536), .B(n537), .Y(n89) );
  INVX1 U327 ( .A(n538), .Y(n534) );
  AOI21X1 U328 ( .A(n539), .B(n74), .C(n540), .Y(n514) );
  MUX2X1 U329 ( .B(n541), .A(n542), .S(des_start), .Y(nxtRight[22]) );
  INVX1 U330 ( .A(des_in[22]), .Y(n542) );
  XOR2X1 U331 ( .A(des_curr[55]), .B(n543), .Y(n541) );
  NOR2X1 U332 ( .A(n544), .B(n545), .Y(n543) );
  NAND2X1 U333 ( .A(n546), .B(n547), .Y(n545) );
  AOI22X1 U334 ( .A(n296), .B(n170), .C(n175), .D(n183), .Y(n546) );
  NAND3X1 U335 ( .A(n172), .B(n548), .C(n549), .Y(n296) );
  NAND3X1 U336 ( .A(n550), .B(n551), .C(n552), .Y(n544) );
  AOI22X1 U337 ( .A(n294), .B(n181), .C(n287), .D(n295), .Y(n552) );
  NAND2X1 U338 ( .A(n548), .B(n553), .Y(n295) );
  NAND2X1 U339 ( .A(n554), .B(n162), .Y(n294) );
  NAND2X1 U340 ( .A(n303), .B(n555), .Y(n162) );
  OAI21X1 U341 ( .A(n177), .B(n288), .C(n179), .Y(n551) );
  NAND2X1 U342 ( .A(n176), .B(n549), .Y(n288) );
  OAI21X1 U343 ( .A(n556), .B(n286), .C(n182), .Y(n550) );
  INVX1 U344 ( .A(n557), .Y(n286) );
  MUX2X1 U345 ( .B(n558), .A(n559), .S(des_start), .Y(nxtRight[21]) );
  INVX1 U346 ( .A(des_in[21]), .Y(n559) );
  XOR2X1 U347 ( .A(des_curr[54]), .B(n560), .Y(n558) );
  NOR2X1 U348 ( .A(n561), .B(n562), .Y(n560) );
  NAND3X1 U349 ( .A(n563), .B(n564), .C(n565), .Y(n562) );
  NOR2X1 U350 ( .A(n566), .B(n272), .Y(n565) );
  OAI22X1 U351 ( .A(n262), .B(n405), .C(n265), .D(n567), .Y(n272) );
  INVX1 U352 ( .A(n568), .Y(n564) );
  INVX1 U353 ( .A(n407), .Y(n563) );
  NAND3X1 U354 ( .A(n569), .B(n570), .C(n571), .Y(n407) );
  AOI21X1 U355 ( .A(n271), .B(n572), .C(n274), .Y(n571) );
  OAI21X1 U356 ( .A(n410), .B(n573), .C(n574), .Y(n274) );
  AOI22X1 U357 ( .A(n575), .B(n576), .C(n577), .D(n578), .Y(n574) );
  NAND2X1 U358 ( .A(n579), .B(n263), .Y(n576) );
  OAI21X1 U359 ( .A(n580), .B(n575), .C(n581), .Y(n570) );
  OAI21X1 U360 ( .A(n582), .B(n270), .C(n578), .Y(n569) );
  NAND3X1 U361 ( .A(n583), .B(n584), .C(n585), .Y(n561) );
  INVX1 U362 ( .A(n586), .Y(n585) );
  OAI22X1 U363 ( .A(n266), .B(n264), .C(n265), .D(n403), .Y(n586) );
  NOR2X1 U364 ( .A(n582), .B(n577), .Y(n264) );
  OAI21X1 U365 ( .A(n587), .B(n411), .C(n578), .Y(n584) );
  INVX1 U366 ( .A(n588), .Y(n587) );
  OAI21X1 U367 ( .A(n589), .B(n590), .C(n271), .Y(n583) );
  INVX1 U368 ( .A(n406), .Y(n590) );
  MUX2X1 U369 ( .B(n591), .A(n592), .S(des_start), .Y(nxtRight[20]) );
  INVX1 U370 ( .A(des_in[20]), .Y(n592) );
  XNOR2X1 U371 ( .A(des_curr[53]), .B(n593), .Y(n591) );
  NAND3X1 U372 ( .A(n594), .B(n595), .C(n596), .Y(n593) );
  NOR2X1 U373 ( .A(n597), .B(n598), .Y(n596) );
  INVX1 U374 ( .A(n599), .Y(n598) );
  AOI22X1 U375 ( .A(n477), .B(n600), .C(n601), .D(n602), .Y(n599) );
  OAI21X1 U376 ( .A(n603), .B(n604), .C(n605), .Y(n597) );
  OAI21X1 U377 ( .A(n476), .B(n606), .C(n473), .Y(n605) );
  AOI22X1 U378 ( .A(n607), .B(n480), .C(n475), .D(n608), .Y(n595) );
  NOR2X1 U379 ( .A(n462), .B(n609), .Y(n594) );
  OR2X1 U380 ( .A(n610), .B(n611), .Y(n462) );
  OAI21X1 U381 ( .A(n603), .B(n612), .C(n613), .Y(n611) );
  OAI21X1 U382 ( .A(n478), .B(n614), .C(n602), .Y(n613) );
  INVX1 U383 ( .A(n615), .Y(n478) );
  OAI21X1 U384 ( .A(n464), .B(n616), .C(n617), .Y(n610) );
  OAI21X1 U385 ( .A(n618), .B(n619), .C(n477), .Y(n617) );
  INVX1 U386 ( .A(n620), .Y(n616) );
  OAI21X1 U387 ( .A(n621), .B(n622), .C(n623), .Y(n620) );
  INVX1 U388 ( .A(n608), .Y(n464) );
  MUX2X1 U389 ( .B(n624), .A(n625), .S(des_start), .Y(nxtRight[1]) );
  INVX1 U390 ( .A(des_in[1]), .Y(n625) );
  XNOR2X1 U391 ( .A(des_curr[34]), .B(n626), .Y(n624) );
  NAND3X1 U392 ( .A(n627), .B(n628), .C(n629), .Y(n626) );
  NOR2X1 U393 ( .A(n630), .B(n631), .Y(n629) );
  OAI21X1 U394 ( .A(n632), .B(n537), .C(n633), .Y(n631) );
  OAI21X1 U395 ( .A(n90), .B(n83), .C(n92), .Y(n633) );
  INVX1 U396 ( .A(n530), .Y(n83) );
  INVX1 U397 ( .A(n634), .Y(n90) );
  NAND3X1 U398 ( .A(n635), .B(n636), .C(n637), .Y(n634) );
  AND2X1 U399 ( .A(n638), .B(n639), .Y(n637) );
  OAI21X1 U400 ( .A(n526), .B(n640), .C(n641), .Y(n630) );
  OAI21X1 U401 ( .A(n80), .B(n525), .C(n529), .Y(n641) );
  INVX1 U402 ( .A(n76), .Y(n529) );
  NAND2X1 U403 ( .A(n642), .B(n538), .Y(n525) );
  INVX1 U404 ( .A(n536), .Y(n80) );
  NOR2X1 U405 ( .A(n523), .B(n539), .Y(n640) );
  INVX1 U406 ( .A(n643), .Y(n523) );
  INVX1 U407 ( .A(n91), .Y(n526) );
  AOI22X1 U408 ( .A(n93), .B(n74), .C(n81), .D(n644), .Y(n628) );
  INVX1 U409 ( .A(n531), .Y(n644) );
  NOR2X1 U410 ( .A(n540), .B(n645), .Y(n627) );
  OAI21X1 U411 ( .A(n646), .B(n647), .C(n648), .Y(n540) );
  AOI21X1 U412 ( .A(n649), .B(n650), .C(n651), .Y(n648) );
  AOI21X1 U413 ( .A(n532), .B(n652), .C(n520), .Y(n651) );
  NOR2X1 U414 ( .A(n76), .B(n653), .Y(n649) );
  INVX1 U415 ( .A(n654), .Y(n647) );
  MUX2X1 U416 ( .B(n655), .A(n656), .S(des_start), .Y(nxtRight[19]) );
  INVX1 U417 ( .A(des_in[19]), .Y(n656) );
  XNOR2X1 U418 ( .A(des_curr[52]), .B(n657), .Y(n655) );
  NAND3X1 U419 ( .A(n658), .B(n659), .C(n660), .Y(n657) );
  NOR2X1 U420 ( .A(n661), .B(n662), .Y(n660) );
  OAI21X1 U421 ( .A(n231), .B(n246), .C(n663), .Y(n662) );
  OAI21X1 U422 ( .A(n325), .B(n664), .C(n230), .Y(n663) );
  NOR2X1 U423 ( .A(n665), .B(n666), .Y(n231) );
  OAI21X1 U424 ( .A(n233), .B(n667), .C(n668), .Y(n661) );
  OAI21X1 U425 ( .A(n236), .B(n239), .C(n251), .Y(n668) );
  NOR2X1 U426 ( .A(n249), .B(n237), .Y(n667) );
  INVX1 U427 ( .A(n669), .Y(n237) );
  INVX1 U428 ( .A(n670), .Y(n249) );
  AOI22X1 U429 ( .A(n671), .B(n238), .C(n319), .D(n232), .Y(n659) );
  INVX1 U430 ( .A(n672), .Y(n232) );
  NAND2X1 U431 ( .A(n246), .B(n244), .Y(n238) );
  AND2X1 U432 ( .A(n245), .B(n310), .Y(n658) );
  INVX1 U433 ( .A(n673), .Y(n310) );
  OAI21X1 U434 ( .A(n226), .B(n252), .C(n674), .Y(n673) );
  AOI22X1 U435 ( .A(n675), .B(n251), .C(n228), .D(n327), .Y(n674) );
  NOR2X1 U436 ( .A(n676), .B(n677), .Y(n245) );
  OAI22X1 U437 ( .A(n243), .B(n246), .C(n672), .D(n678), .Y(n677) );
  OAI21X1 U438 ( .A(n233), .B(n679), .C(n680), .Y(n676) );
  AOI22X1 U439 ( .A(n664), .B(n251), .C(n314), .D(n325), .Y(n680) );
  INVX1 U440 ( .A(n226), .Y(n314) );
  NAND2X1 U441 ( .A(n324), .B(n681), .Y(n664) );
  MUX2X1 U442 ( .B(n682), .A(n683), .S(des_start), .Y(nxtRight[18]) );
  INVX1 U443 ( .A(des_in[18]), .Y(n683) );
  XNOR2X1 U444 ( .A(des_curr[51]), .B(n684), .Y(n682) );
  NAND3X1 U445 ( .A(n685), .B(n686), .C(n687), .Y(n684) );
  NOR2X1 U446 ( .A(n688), .B(n689), .Y(n687) );
  OAI22X1 U447 ( .A(n502), .B(n373), .C(n133), .D(n392), .Y(n689) );
  NAND2X1 U448 ( .A(n690), .B(n691), .Y(n392) );
  NOR2X1 U449 ( .A(n140), .B(n144), .Y(n133) );
  NAND2X1 U450 ( .A(n692), .B(n691), .Y(n373) );
  NOR2X1 U451 ( .A(n497), .B(n381), .Y(n502) );
  INVX1 U452 ( .A(n388), .Y(n381) );
  INVX1 U453 ( .A(n129), .Y(n497) );
  NAND3X1 U454 ( .A(n693), .B(n510), .C(n694), .Y(n688) );
  OAI21X1 U455 ( .A(n380), .B(n695), .C(n503), .Y(n694) );
  INVX1 U456 ( .A(n150), .Y(n503) );
  NAND2X1 U457 ( .A(n385), .B(n149), .Y(n695) );
  NAND2X1 U458 ( .A(n696), .B(n692), .Y(n149) );
  NAND2X1 U459 ( .A(n697), .B(n691), .Y(n385) );
  INVX1 U460 ( .A(n698), .Y(n380) );
  OR2X1 U461 ( .A(n129), .B(n387), .Y(n510) );
  OAI21X1 U462 ( .A(n499), .B(n377), .C(n374), .Y(n693) );
  INVX1 U463 ( .A(n130), .Y(n377) );
  NAND2X1 U464 ( .A(n690), .B(n699), .Y(n130) );
  INVX1 U465 ( .A(n134), .Y(n499) );
  NAND2X1 U466 ( .A(n696), .B(n690), .Y(n134) );
  AOI22X1 U467 ( .A(n379), .B(n140), .C(n378), .D(n144), .Y(n686) );
  INVX1 U468 ( .A(n386), .Y(n144) );
  INVX1 U469 ( .A(n384), .Y(n378) );
  NAND3X1 U470 ( .A(n141), .B(n498), .C(n700), .Y(n379) );
  NOR2X1 U471 ( .A(n142), .B(n500), .Y(n700) );
  INVX1 U472 ( .A(n132), .Y(n500) );
  NAND2X1 U473 ( .A(n691), .B(n701), .Y(n132) );
  NOR2X1 U474 ( .A(n702), .B(n703), .Y(n691) );
  INVX1 U475 ( .A(n492), .Y(n142) );
  NAND2X1 U476 ( .A(n704), .B(n690), .Y(n492) );
  NOR2X1 U477 ( .A(n705), .B(n706), .Y(n690) );
  NAND2X1 U478 ( .A(n697), .B(n699), .Y(n141) );
  NOR2X1 U479 ( .A(n146), .B(n394), .Y(n685) );
  OR2X1 U480 ( .A(n707), .B(n708), .Y(n394) );
  OAI22X1 U481 ( .A(n129), .B(n698), .C(n504), .D(n145), .Y(n708) );
  NAND2X1 U482 ( .A(n692), .B(n699), .Y(n145) );
  INVX1 U483 ( .A(n140), .Y(n504) );
  NAND2X1 U484 ( .A(n388), .B(n150), .Y(n140) );
  NAND2X1 U485 ( .A(n709), .B(n710), .Y(n150) );
  NAND2X1 U486 ( .A(n704), .B(n701), .Y(n698) );
  OAI21X1 U487 ( .A(n387), .B(n386), .C(n711), .Y(n707) );
  OAI21X1 U488 ( .A(n712), .B(n139), .C(n374), .Y(n711) );
  NAND2X1 U489 ( .A(n386), .B(n129), .Y(n374) );
  NAND2X1 U490 ( .A(n710), .B(n713), .Y(n129) );
  INVX1 U491 ( .A(n372), .Y(n139) );
  NAND2X1 U492 ( .A(n704), .B(n697), .Y(n372) );
  INVX1 U493 ( .A(n489), .Y(n712) );
  NAND2X1 U494 ( .A(n696), .B(n697), .Y(n489) );
  NOR2X1 U495 ( .A(n705), .B(n714), .Y(n697) );
  INVX1 U496 ( .A(n715), .Y(n705) );
  NAND2X1 U497 ( .A(n701), .B(n699), .Y(n387) );
  NOR2X1 U498 ( .A(n716), .B(n703), .Y(n699) );
  OAI22X1 U499 ( .A(n388), .B(n384), .C(n386), .D(n498), .Y(n146) );
  NAND2X1 U500 ( .A(n696), .B(n701), .Y(n498) );
  NOR2X1 U501 ( .A(n714), .B(n715), .Y(n701) );
  NOR2X1 U502 ( .A(n717), .B(n702), .Y(n696) );
  INVX1 U503 ( .A(n716), .Y(n702) );
  NAND2X1 U504 ( .A(n709), .B(n718), .Y(n386) );
  NAND2X1 U505 ( .A(n704), .B(n692), .Y(n384) );
  NOR2X1 U506 ( .A(n706), .B(n715), .Y(n692) );
  XNOR2X1 U507 ( .A(des_curr[16]), .B(subkey[23]), .Y(n715) );
  INVX1 U508 ( .A(n714), .Y(n706) );
  XNOR2X1 U509 ( .A(des_curr[15]), .B(subkey[22]), .Y(n714) );
  NOR2X1 U510 ( .A(n717), .B(n716), .Y(n704) );
  XNOR2X1 U511 ( .A(des_curr[13]), .B(subkey[20]), .Y(n716) );
  INVX1 U512 ( .A(n703), .Y(n717) );
  XNOR2X1 U513 ( .A(des_curr[14]), .B(subkey[21]), .Y(n703) );
  NAND2X1 U514 ( .A(n713), .B(n718), .Y(n388) );
  INVX1 U515 ( .A(n710), .Y(n718) );
  XNOR2X1 U516 ( .A(des_curr[11]), .B(subkey[18]), .Y(n710) );
  INVX1 U517 ( .A(n709), .Y(n713) );
  XNOR2X1 U518 ( .A(des_curr[12]), .B(subkey[19]), .Y(n709) );
  MUX2X1 U519 ( .B(n719), .A(n720), .S(des_start), .Y(nxtRight[17]) );
  INVX1 U520 ( .A(des_in[17]), .Y(n720) );
  XNOR2X1 U521 ( .A(des_curr[50]), .B(n721), .Y(n719) );
  NAND3X1 U522 ( .A(n722), .B(n723), .C(n724), .Y(n721) );
  NOR2X1 U523 ( .A(n725), .B(n726), .Y(n724) );
  OAI21X1 U524 ( .A(n727), .B(n728), .C(n729), .Y(n726) );
  OAI21X1 U525 ( .A(n210), .B(n730), .C(n212), .Y(n729) );
  NAND2X1 U526 ( .A(n420), .B(n731), .Y(n212) );
  NOR2X1 U527 ( .A(n732), .B(n426), .Y(n727) );
  NAND2X1 U528 ( .A(n733), .B(n734), .Y(n426) );
  OAI21X1 U529 ( .A(n735), .B(n731), .C(n736), .Y(n725) );
  NOR2X1 U530 ( .A(n206), .B(n202), .Y(n735) );
  AOI22X1 U531 ( .A(n433), .B(n214), .C(n737), .D(n431), .Y(n723) );
  INVX1 U532 ( .A(n738), .Y(n433) );
  INVX1 U533 ( .A(n739), .Y(n722) );
  OAI21X1 U534 ( .A(n740), .B(n195), .C(n422), .Y(n739) );
  NOR2X1 U535 ( .A(n741), .B(n742), .Y(n422) );
  OAI21X1 U536 ( .A(n728), .B(n743), .C(n744), .Y(n742) );
  AOI22X1 U537 ( .A(n210), .B(n214), .C(n745), .D(n431), .Y(n744) );
  NAND2X1 U538 ( .A(n728), .B(n731), .Y(n431) );
  NAND3X1 U539 ( .A(n746), .B(n747), .C(n748), .Y(n741) );
  OAI21X1 U540 ( .A(n749), .B(n750), .C(n199), .Y(n748) );
  NAND2X1 U541 ( .A(n428), .B(n751), .Y(n750) );
  NOR2X1 U542 ( .A(n207), .B(n752), .Y(n428) );
  INVX1 U543 ( .A(n753), .Y(n207) );
  NAND2X1 U544 ( .A(n733), .B(n754), .Y(n749) );
  OAI21X1 U545 ( .A(n213), .B(n211), .C(n208), .Y(n747) );
  INVX1 U546 ( .A(n740), .Y(n211) );
  INVX1 U547 ( .A(n734), .Y(n213) );
  OAI21X1 U548 ( .A(n755), .B(n756), .C(n425), .Y(n746) );
  NAND2X1 U549 ( .A(n421), .B(n757), .Y(n756) );
  MUX2X1 U550 ( .B(n758), .A(n759), .S(des_start), .Y(nxtRight[16]) );
  INVX1 U551 ( .A(des_in[16]), .Y(n759) );
  XNOR2X1 U552 ( .A(des_curr[49]), .B(n760), .Y(n758) );
  NAND2X1 U553 ( .A(n761), .B(n762), .Y(n760) );
  NOR2X1 U554 ( .A(n763), .B(n764), .Y(n762) );
  OAI21X1 U555 ( .A(n765), .B(n444), .C(n766), .Y(n764) );
  OAI21X1 U556 ( .A(n348), .B(n767), .C(n358), .Y(n766) );
  INVX1 U557 ( .A(n115), .Y(n767) );
  NOR2X1 U558 ( .A(n337), .B(n348), .Y(n765) );
  INVX1 U559 ( .A(n451), .Y(n348) );
  NAND2X1 U560 ( .A(n768), .B(n355), .Y(n451) );
  INVX1 U561 ( .A(n452), .Y(n337) );
  NAND2X1 U562 ( .A(n769), .B(n770), .Y(n452) );
  OAI21X1 U563 ( .A(n771), .B(n772), .C(n773), .Y(n763) );
  OAI21X1 U564 ( .A(n774), .B(n361), .C(n120), .Y(n773) );
  INVX1 U565 ( .A(n110), .Y(n774) );
  NAND2X1 U566 ( .A(n775), .B(n357), .Y(n110) );
  NOR2X1 U567 ( .A(n362), .B(n339), .Y(n772) );
  NAND2X1 U568 ( .A(n109), .B(n454), .Y(n339) );
  NAND2X1 U569 ( .A(n776), .B(n357), .Y(n454) );
  INVX1 U570 ( .A(n453), .Y(n362) );
  NOR2X1 U571 ( .A(n442), .B(n777), .Y(n761) );
  OAI21X1 U572 ( .A(n341), .B(n115), .C(n778), .Y(n777) );
  OAI21X1 U573 ( .A(n779), .B(n780), .C(n352), .Y(n778) );
  NAND2X1 U574 ( .A(n353), .B(n103), .Y(n352) );
  NAND2X1 U575 ( .A(n445), .B(n453), .Y(n780) );
  NAND2X1 U576 ( .A(n781), .B(n775), .Y(n453) );
  NAND2X1 U577 ( .A(n768), .B(n775), .Y(n445) );
  NAND3X1 U578 ( .A(n351), .B(n111), .C(n350), .Y(n779) );
  NAND2X1 U579 ( .A(n781), .B(n776), .Y(n350) );
  NAND2X1 U580 ( .A(n769), .B(n776), .Y(n111) );
  NAND2X1 U581 ( .A(n769), .B(n775), .Y(n115) );
  AND2X1 U582 ( .A(n782), .B(n783), .Y(n775) );
  NAND3X1 U583 ( .A(n784), .B(n785), .C(n786), .Y(n442) );
  AOI21X1 U584 ( .A(n343), .B(n358), .C(n787), .Y(n786) );
  OAI21X1 U585 ( .A(n771), .B(n346), .C(n788), .Y(n787) );
  OAI21X1 U586 ( .A(n455), .B(n361), .C(n356), .Y(n788) );
  INVX1 U587 ( .A(n341), .Y(n356) );
  AND2X1 U588 ( .A(n769), .B(n355), .Y(n361) );
  NOR2X1 U589 ( .A(n789), .B(n790), .Y(n769) );
  INVX1 U590 ( .A(n351), .Y(n455) );
  NAND2X1 U591 ( .A(n770), .B(n357), .Y(n351) );
  NAND2X1 U592 ( .A(n776), .B(n768), .Y(n346) );
  NOR2X1 U593 ( .A(n783), .B(n782), .Y(n776) );
  INVX1 U594 ( .A(n107), .Y(n771) );
  NAND2X1 U595 ( .A(n341), .B(n444), .Y(n107) );
  NAND2X1 U596 ( .A(n791), .B(n792), .Y(n341) );
  AND2X1 U597 ( .A(n781), .B(n770), .Y(n343) );
  OAI21X1 U598 ( .A(n117), .B(n793), .C(n120), .Y(n785) );
  INVX1 U599 ( .A(n353), .Y(n120) );
  NAND2X1 U600 ( .A(n792), .B(n794), .Y(n353) );
  INVX1 U601 ( .A(n109), .Y(n793) );
  NAND2X1 U602 ( .A(n770), .B(n768), .Y(n109) );
  NOR2X1 U603 ( .A(n795), .B(n790), .Y(n768) );
  AND2X1 U604 ( .A(n783), .B(n796), .Y(n770) );
  INVX1 U605 ( .A(n363), .Y(n117) );
  NAND2X1 U606 ( .A(n781), .B(n355), .Y(n363) );
  NOR2X1 U607 ( .A(n797), .B(n795), .Y(n781) );
  AND2X1 U608 ( .A(n114), .B(n342), .Y(n784) );
  NAND3X1 U609 ( .A(n357), .B(n355), .C(n798), .Y(n342) );
  INVX1 U610 ( .A(n444), .Y(n798) );
  NAND2X1 U611 ( .A(n799), .B(n794), .Y(n444) );
  INVX1 U612 ( .A(n791), .Y(n794) );
  NAND3X1 U613 ( .A(n357), .B(n355), .C(n358), .Y(n114) );
  INVX1 U614 ( .A(n103), .Y(n358) );
  NAND2X1 U615 ( .A(n791), .B(n799), .Y(n103) );
  INVX1 U616 ( .A(n792), .Y(n799) );
  XNOR2X1 U617 ( .A(des_curr[19]), .B(subkey[30]), .Y(n792) );
  XNOR2X1 U618 ( .A(des_curr[20]), .B(subkey[31]), .Y(n791) );
  NOR2X1 U619 ( .A(n796), .B(n783), .Y(n355) );
  XOR2X1 U620 ( .A(des_curr[21]), .B(subkey[32]), .Y(n783) );
  INVX1 U621 ( .A(n782), .Y(n796) );
  XNOR2X1 U622 ( .A(des_curr[22]), .B(subkey[33]), .Y(n782) );
  NOR2X1 U623 ( .A(n797), .B(n789), .Y(n357) );
  INVX1 U624 ( .A(n795), .Y(n789) );
  XNOR2X1 U625 ( .A(des_curr[23]), .B(subkey[34]), .Y(n795) );
  INVX1 U626 ( .A(n790), .Y(n797) );
  XNOR2X1 U627 ( .A(des_curr[24]), .B(subkey[35]), .Y(n790) );
  MUX2X1 U628 ( .B(n800), .A(n801), .S(des_start), .Y(nxtRight[15]) );
  INVX1 U629 ( .A(des_in[15]), .Y(n801) );
  XOR2X1 U630 ( .A(des_curr[48]), .B(n802), .Y(n800) );
  NOR2X1 U631 ( .A(n803), .B(n804), .Y(n802) );
  OR2X1 U632 ( .A(n645), .B(n805), .Y(n804) );
  OAI21X1 U633 ( .A(n520), .B(n530), .C(n71), .Y(n805) );
  NOR2X1 U634 ( .A(n806), .B(n807), .Y(n71) );
  OAI22X1 U635 ( .A(n76), .B(n531), .C(n808), .D(n520), .Y(n807) );
  NAND3X1 U636 ( .A(n809), .B(n636), .C(n635), .Y(n531) );
  OAI21X1 U637 ( .A(n646), .B(n652), .C(n810), .Y(n806) );
  OAI21X1 U638 ( .A(n524), .B(n811), .C(n535), .Y(n810) );
  INVX1 U639 ( .A(n74), .Y(n646) );
  NAND3X1 U640 ( .A(n812), .B(n639), .C(n813), .Y(n530) );
  OAI21X1 U641 ( .A(n520), .B(n536), .C(n814), .Y(n645) );
  AOI22X1 U642 ( .A(n815), .B(n74), .C(n93), .D(n535), .Y(n814) );
  INVX1 U643 ( .A(n816), .Y(n93) );
  NAND3X1 U644 ( .A(n636), .B(n653), .C(n809), .Y(n816) );
  OAI21X1 U645 ( .A(n653), .B(n817), .C(n818), .Y(n815) );
  INVX1 U646 ( .A(n524), .Y(n818) );
  NOR2X1 U647 ( .A(n819), .B(n820), .Y(n524) );
  NAND3X1 U648 ( .A(n636), .B(n653), .C(n821), .Y(n536) );
  NAND3X1 U649 ( .A(n822), .B(n823), .C(n824), .Y(n803) );
  AOI22X1 U650 ( .A(n533), .B(n92), .C(n811), .D(n74), .Y(n824) );
  NAND2X1 U651 ( .A(n825), .B(n520), .Y(n74) );
  OR2X1 U652 ( .A(n826), .B(n827), .Y(n520) );
  NAND2X1 U653 ( .A(n538), .B(n643), .Y(n811) );
  NAND3X1 U654 ( .A(n820), .B(n653), .C(n809), .Y(n643) );
  NAND2X1 U655 ( .A(n813), .B(n821), .Y(n538) );
  INVX1 U656 ( .A(n825), .Y(n92) );
  INVX1 U657 ( .A(n86), .Y(n533) );
  NAND3X1 U658 ( .A(n820), .B(n653), .C(n821), .Y(n86) );
  OAI21X1 U659 ( .A(n828), .B(n654), .C(n91), .Y(n823) );
  NAND2X1 U660 ( .A(n76), .B(n825), .Y(n91) );
  NAND2X1 U661 ( .A(n826), .B(n827), .Y(n825) );
  NOR2X1 U662 ( .A(n81), .B(n535), .Y(n76) );
  INVX1 U663 ( .A(n632), .Y(n535) );
  NAND2X1 U664 ( .A(n827), .B(n829), .Y(n632) );
  NAND2X1 U665 ( .A(n82), .B(n537), .Y(n654) );
  NAND3X1 U666 ( .A(n639), .B(n638), .C(n813), .Y(n537) );
  NAND3X1 U667 ( .A(n635), .B(n636), .C(n821), .Y(n82) );
  NOR2X1 U668 ( .A(n639), .B(n812), .Y(n821) );
  INVX1 U669 ( .A(n532), .Y(n828) );
  NAND3X1 U670 ( .A(n639), .B(n653), .C(n830), .Y(n532) );
  NOR2X1 U671 ( .A(n638), .B(n636), .Y(n830) );
  OAI21X1 U672 ( .A(n522), .B(n84), .C(n81), .Y(n822) );
  NOR2X1 U673 ( .A(n829), .B(n827), .Y(n81) );
  XNOR2X1 U674 ( .A(des_curr[28]), .B(subkey[43]), .Y(n827) );
  INVX1 U675 ( .A(n826), .Y(n829) );
  XNOR2X1 U676 ( .A(des_curr[27]), .B(subkey[42]), .Y(n826) );
  NAND2X1 U677 ( .A(n808), .B(n642), .Y(n84) );
  NAND2X1 U678 ( .A(n650), .B(n653), .Y(n642) );
  INVX1 U679 ( .A(n817), .Y(n650) );
  NAND3X1 U680 ( .A(n636), .B(n639), .C(n812), .Y(n817) );
  INVX1 U681 ( .A(n539), .Y(n808) );
  NOR2X1 U682 ( .A(n636), .B(n819), .Y(n539) );
  NAND3X1 U683 ( .A(n638), .B(n653), .C(n639), .Y(n819) );
  INVX1 U684 ( .A(n652), .Y(n522) );
  NAND2X1 U685 ( .A(n813), .B(n809), .Y(n652) );
  NOR2X1 U686 ( .A(n638), .B(n639), .Y(n809) );
  XOR2X1 U687 ( .A(des_curr[31]), .B(subkey[46]), .Y(n639) );
  INVX1 U688 ( .A(n812), .Y(n638) );
  XNOR2X1 U689 ( .A(des_curr[0]), .B(subkey[47]), .Y(n812) );
  NOR2X1 U690 ( .A(n653), .B(n636), .Y(n813) );
  INVX1 U691 ( .A(n820), .Y(n636) );
  XNOR2X1 U692 ( .A(des_curr[30]), .B(subkey[45]), .Y(n820) );
  INVX1 U693 ( .A(n635), .Y(n653) );
  XNOR2X1 U694 ( .A(des_curr[29]), .B(subkey[44]), .Y(n635) );
  MUX2X1 U695 ( .B(n831), .A(n832), .S(des_start), .Y(nxtRight[14]) );
  INVX1 U696 ( .A(des_in[14]), .Y(n832) );
  XNOR2X1 U697 ( .A(des_curr[47]), .B(n833), .Y(n831) );
  NAND3X1 U698 ( .A(n834), .B(n309), .C(n835), .Y(n833) );
  NOR2X1 U699 ( .A(n836), .B(n837), .Y(n835) );
  OAI21X1 U700 ( .A(n838), .B(n226), .C(n839), .Y(n837) );
  OAI21X1 U701 ( .A(n313), .B(n240), .C(n319), .Y(n839) );
  NAND2X1 U702 ( .A(n670), .B(n840), .Y(n240) );
  NAND3X1 U703 ( .A(n841), .B(n842), .C(n843), .Y(n670) );
  INVX1 U704 ( .A(n681), .Y(n313) );
  NAND3X1 U705 ( .A(n844), .B(n845), .C(n846), .Y(n681) );
  NOR2X1 U706 ( .A(n847), .B(n322), .Y(n838) );
  NAND2X1 U707 ( .A(n324), .B(n247), .Y(n322) );
  OAI21X1 U708 ( .A(n233), .B(n848), .C(n849), .Y(n836) );
  OAI21X1 U709 ( .A(n325), .B(n850), .C(n251), .Y(n849) );
  AND2X1 U710 ( .A(n843), .B(n851), .Y(n325) );
  NOR2X1 U711 ( .A(n665), .B(n675), .Y(n848) );
  NAND2X1 U712 ( .A(n247), .B(n840), .Y(n675) );
  NAND2X1 U713 ( .A(n851), .B(n852), .Y(n840) );
  NAND2X1 U714 ( .A(n843), .B(n846), .Y(n247) );
  INVX1 U715 ( .A(n327), .Y(n233) );
  NAND2X1 U716 ( .A(n678), .B(n246), .Y(n327) );
  INVX1 U717 ( .A(n321), .Y(n246) );
  AND2X1 U718 ( .A(n853), .B(n854), .Y(n309) );
  AOI21X1 U719 ( .A(n666), .B(n230), .C(n855), .Y(n854) );
  OAI21X1 U720 ( .A(n856), .B(n226), .C(n857), .Y(n855) );
  OAI21X1 U721 ( .A(n228), .B(n239), .C(n319), .Y(n857) );
  INVX1 U722 ( .A(n858), .Y(n228) );
  NOR2X1 U723 ( .A(n665), .B(n671), .Y(n856) );
  INVX1 U724 ( .A(n253), .Y(n671) );
  NOR2X1 U725 ( .A(n859), .B(n845), .Y(n665) );
  INVX1 U726 ( .A(n252), .Y(n666) );
  NAND3X1 U727 ( .A(n860), .B(n861), .C(n843), .Y(n252) );
  NOR2X1 U728 ( .A(n862), .B(n844), .Y(n843) );
  AOI22X1 U729 ( .A(n236), .B(n251), .C(n321), .D(n850), .Y(n853) );
  NAND2X1 U730 ( .A(n244), .B(n226), .Y(n251) );
  NAND2X1 U731 ( .A(n863), .B(n864), .Y(n226) );
  INVX1 U732 ( .A(n319), .Y(n244) );
  NOR2X1 U733 ( .A(n864), .B(n863), .Y(n319) );
  NOR2X1 U734 ( .A(n865), .B(n845), .Y(n236) );
  AOI22X1 U735 ( .A(n230), .B(n866), .C(n321), .D(n867), .Y(n834) );
  NAND3X1 U736 ( .A(n253), .B(n672), .C(n315), .Y(n867) );
  NOR2X1 U737 ( .A(n847), .B(n239), .Y(n315) );
  NOR2X1 U738 ( .A(n859), .B(n862), .Y(n239) );
  NAND3X1 U739 ( .A(n841), .B(n842), .C(n844), .Y(n859) );
  INVX1 U740 ( .A(n243), .Y(n847) );
  NAND2X1 U741 ( .A(n852), .B(n846), .Y(n243) );
  NAND3X1 U742 ( .A(n861), .B(n852), .C(n860), .Y(n672) );
  NAND3X1 U743 ( .A(n844), .B(n845), .C(n851), .Y(n253) );
  NOR2X1 U744 ( .A(n864), .B(n868), .Y(n321) );
  NAND3X1 U745 ( .A(n858), .B(n324), .C(n869), .Y(n866) );
  INVX1 U746 ( .A(n320), .Y(n869) );
  NAND2X1 U747 ( .A(n679), .B(n669), .Y(n320) );
  NAND3X1 U748 ( .A(n844), .B(n862), .C(n851), .Y(n669) );
  NOR2X1 U749 ( .A(n842), .B(n861), .Y(n851) );
  INVX1 U750 ( .A(n850), .Y(n679) );
  NOR2X1 U751 ( .A(n865), .B(n862), .Y(n850) );
  NAND3X1 U752 ( .A(n844), .B(n861), .C(n860), .Y(n865) );
  NAND3X1 U753 ( .A(n841), .B(n842), .C(n852), .Y(n324) );
  NOR2X1 U754 ( .A(n845), .B(n844), .Y(n852) );
  INVX1 U755 ( .A(n860), .Y(n842) );
  NAND3X1 U756 ( .A(n844), .B(n862), .C(n846), .Y(n858) );
  NOR2X1 U757 ( .A(n841), .B(n860), .Y(n846) );
  XNOR2X1 U758 ( .A(des_curr[28]), .B(subkey[41]), .Y(n860) );
  INVX1 U759 ( .A(n861), .Y(n841) );
  XNOR2X1 U760 ( .A(des_curr[27]), .B(subkey[40]), .Y(n861) );
  INVX1 U761 ( .A(n845), .Y(n862) );
  XNOR2X1 U762 ( .A(des_curr[26]), .B(subkey[39]), .Y(n845) );
  XNOR2X1 U763 ( .A(des_curr[25]), .B(subkey[38]), .Y(n844) );
  INVX1 U764 ( .A(n678), .Y(n230) );
  NAND2X1 U765 ( .A(n868), .B(n864), .Y(n678) );
  XOR2X1 U766 ( .A(des_curr[24]), .B(subkey[37]), .Y(n864) );
  INVX1 U767 ( .A(n863), .Y(n868) );
  XNOR2X1 U768 ( .A(des_curr[23]), .B(subkey[36]), .Y(n863) );
  MUX2X1 U769 ( .B(n870), .A(n871), .S(des_start), .Y(nxtRight[13]) );
  INVX1 U770 ( .A(des_in[13]), .Y(n871) );
  XNOR2X1 U771 ( .A(des_curr[46]), .B(n872), .Y(n870) );
  NAND3X1 U772 ( .A(n873), .B(n399), .C(n874), .Y(n872) );
  NOR2X1 U773 ( .A(n875), .B(n876), .Y(n874) );
  OAI22X1 U774 ( .A(n266), .B(n877), .C(n409), .D(n262), .Y(n876) );
  INVX1 U775 ( .A(n581), .Y(n409) );
  OAI21X1 U776 ( .A(n878), .B(n879), .C(n588), .Y(n581) );
  OAI21X1 U777 ( .A(n880), .B(n881), .C(n882), .Y(n875) );
  OAI21X1 U778 ( .A(n270), .B(n883), .C(n580), .Y(n882) );
  NAND2X1 U779 ( .A(n884), .B(n885), .Y(n881) );
  MUX2X1 U780 ( .B(n886), .A(n887), .S(n878), .Y(n880) );
  NOR2X1 U781 ( .A(n888), .B(n410), .Y(n887) );
  NOR2X1 U782 ( .A(n266), .B(n889), .Y(n886) );
  NOR2X1 U783 ( .A(n568), .B(n890), .Y(n399) );
  OAI21X1 U784 ( .A(n406), .B(n265), .C(n891), .Y(n890) );
  OAI21X1 U785 ( .A(n577), .B(n411), .C(n271), .Y(n891) );
  INVX1 U786 ( .A(n877), .Y(n577) );
  NAND3X1 U787 ( .A(n892), .B(n884), .C(n893), .Y(n877) );
  NAND2X1 U788 ( .A(n894), .B(n895), .Y(n568) );
  AOI22X1 U789 ( .A(n580), .B(n896), .C(n897), .D(n575), .Y(n895) );
  AOI22X1 U790 ( .A(n883), .B(n578), .C(n898), .D(n271), .Y(n894) );
  INVX1 U791 ( .A(n899), .Y(n883) );
  AOI21X1 U792 ( .A(n589), .B(n271), .C(n275), .Y(n873) );
  NAND3X1 U793 ( .A(n900), .B(n901), .C(n902), .Y(n275) );
  AOI21X1 U794 ( .A(n578), .B(n572), .C(n903), .Y(n902) );
  OAI21X1 U795 ( .A(n265), .B(n588), .C(n904), .Y(n903) );
  NAND2X1 U796 ( .A(n575), .B(n905), .Y(n904) );
  OAI21X1 U797 ( .A(n878), .B(n879), .C(n406), .Y(n905) );
  AOI21X1 U798 ( .A(n906), .B(n893), .C(n269), .Y(n406) );
  INVX1 U799 ( .A(n907), .Y(n269) );
  NAND3X1 U800 ( .A(n888), .B(n908), .C(n909), .Y(n907) );
  NAND2X1 U801 ( .A(n893), .B(n909), .Y(n588) );
  NAND2X1 U802 ( .A(n910), .B(n267), .Y(n572) );
  INVX1 U803 ( .A(n582), .Y(n910) );
  NOR2X1 U804 ( .A(n911), .B(n885), .Y(n582) );
  INVX1 U805 ( .A(n566), .Y(n901) );
  NAND2X1 U806 ( .A(n912), .B(n913), .Y(n566) );
  AOI22X1 U807 ( .A(n271), .B(n896), .C(n270), .D(n575), .Y(n913) );
  INVX1 U808 ( .A(n914), .Y(n270) );
  NAND3X1 U809 ( .A(n892), .B(n885), .C(n915), .Y(n914) );
  NOR2X1 U810 ( .A(n884), .B(n888), .Y(n915) );
  INVX1 U811 ( .A(n579), .Y(n896) );
  NAND3X1 U812 ( .A(n885), .B(n889), .C(n916), .Y(n579) );
  NOR2X1 U813 ( .A(n917), .B(n878), .Y(n916) );
  INVX1 U814 ( .A(n892), .Y(n878) );
  AOI22X1 U815 ( .A(n580), .B(n411), .C(n578), .D(n897), .Y(n912) );
  INVX1 U816 ( .A(n573), .Y(n897) );
  NAND3X1 U817 ( .A(n888), .B(n885), .C(n906), .Y(n573) );
  NOR2X1 U818 ( .A(n917), .B(n892), .Y(n906) );
  INVX1 U819 ( .A(n262), .Y(n578) );
  NOR2X1 U820 ( .A(n879), .B(n892), .Y(n411) );
  NAND3X1 U821 ( .A(n884), .B(n908), .C(n888), .Y(n879) );
  INVX1 U822 ( .A(n265), .Y(n580) );
  INVX1 U823 ( .A(n918), .Y(n900) );
  OAI21X1 U824 ( .A(n410), .B(n403), .C(n404), .Y(n918) );
  AOI21X1 U825 ( .A(n575), .B(n898), .C(n919), .Y(n404) );
  OAI22X1 U826 ( .A(n263), .B(n265), .C(n567), .D(n262), .Y(n919) );
  NAND2X1 U827 ( .A(n920), .B(n921), .Y(n262) );
  NAND3X1 U828 ( .A(n884), .B(n885), .C(n922), .Y(n567) );
  XOR2X1 U829 ( .A(n892), .B(n889), .Y(n922) );
  NAND2X1 U830 ( .A(n923), .B(n924), .Y(n265) );
  INVX1 U831 ( .A(n589), .Y(n263) );
  INVX1 U832 ( .A(n405), .Y(n898) );
  NAND3X1 U833 ( .A(n885), .B(n889), .C(n909), .Y(n405) );
  INVX1 U834 ( .A(n888), .Y(n889) );
  INVX1 U835 ( .A(n266), .Y(n575) );
  NAND2X1 U836 ( .A(n921), .B(n924), .Y(n266) );
  INVX1 U837 ( .A(n920), .Y(n924) );
  INVX1 U838 ( .A(n923), .Y(n921) );
  AND2X1 U839 ( .A(n899), .B(n267), .Y(n403) );
  NAND3X1 U840 ( .A(n892), .B(n917), .C(n893), .Y(n267) );
  NOR2X1 U841 ( .A(n885), .B(n888), .Y(n893) );
  NAND3X1 U842 ( .A(n888), .B(n885), .C(n909), .Y(n899) );
  NOR2X1 U843 ( .A(n892), .B(n884), .Y(n909) );
  INVX1 U844 ( .A(n908), .Y(n885) );
  INVX1 U845 ( .A(n410), .Y(n271) );
  NAND2X1 U846 ( .A(n920), .B(n923), .Y(n410) );
  XNOR2X1 U847 ( .A(des_curr[8]), .B(subkey[13]), .Y(n923) );
  XNOR2X1 U848 ( .A(des_curr[7]), .B(subkey[12]), .Y(n920) );
  NOR2X1 U849 ( .A(n911), .B(n908), .Y(n589) );
  XNOR2X1 U850 ( .A(des_curr[11]), .B(subkey[16]), .Y(n908) );
  NAND3X1 U851 ( .A(n892), .B(n917), .C(n888), .Y(n911) );
  XNOR2X1 U852 ( .A(des_curr[12]), .B(subkey[17]), .Y(n888) );
  INVX1 U853 ( .A(n884), .Y(n917) );
  XNOR2X1 U854 ( .A(des_curr[9]), .B(subkey[14]), .Y(n884) );
  XNOR2X1 U855 ( .A(des_curr[10]), .B(subkey[15]), .Y(n892) );
  MUX2X1 U856 ( .B(n925), .A(n926), .S(des_start), .Y(nxtRight[12]) );
  INVX1 U857 ( .A(des_in[12]), .Y(n926) );
  XOR2X1 U858 ( .A(des_curr[45]), .B(n927), .Y(n925) );
  NOR2X1 U859 ( .A(n928), .B(n929), .Y(n927) );
  NAND3X1 U860 ( .A(n547), .B(n930), .C(n931), .Y(n929) );
  AOI22X1 U861 ( .A(n932), .B(n182), .C(n556), .D(n287), .Y(n931) );
  INVX1 U862 ( .A(n171), .Y(n556) );
  INVX1 U863 ( .A(n184), .Y(n930) );
  OAI21X1 U864 ( .A(n554), .B(n933), .C(n934), .Y(n184) );
  AOI22X1 U865 ( .A(n177), .B(n175), .C(n287), .D(n292), .Y(n934) );
  INVX1 U866 ( .A(n172), .Y(n292) );
  NAND2X1 U867 ( .A(n302), .B(n555), .Y(n172) );
  INVX1 U868 ( .A(n161), .Y(n287) );
  AND2X1 U869 ( .A(n935), .B(n936), .Y(n177) );
  INVX1 U870 ( .A(n937), .Y(n547) );
  OAI21X1 U871 ( .A(n938), .B(n297), .C(n939), .Y(n937) );
  AOI22X1 U872 ( .A(n940), .B(n941), .C(n175), .D(n293), .Y(n939) );
  NAND3X1 U873 ( .A(n171), .B(n942), .C(n943), .Y(n941) );
  AOI21X1 U874 ( .A(n303), .B(n300), .C(n932), .Y(n943) );
  INVX1 U875 ( .A(n553), .Y(n932) );
  NAND2X1 U876 ( .A(n302), .B(n944), .Y(n553) );
  NAND3X1 U877 ( .A(n945), .B(n946), .C(n947), .Y(n171) );
  AND2X1 U878 ( .A(n948), .B(n942), .Y(n297) );
  NAND3X1 U879 ( .A(n949), .B(n936), .C(n555), .Y(n942) );
  INVX1 U880 ( .A(n179), .Y(n938) );
  NAND3X1 U881 ( .A(n950), .B(n951), .C(n952), .Y(n928) );
  AOI22X1 U882 ( .A(n168), .B(n181), .C(n178), .D(n175), .Y(n952) );
  INVX1 U883 ( .A(n948), .Y(n178) );
  NAND2X1 U884 ( .A(n947), .B(n555), .Y(n948) );
  NOR2X1 U885 ( .A(n945), .B(n953), .Y(n555) );
  NAND2X1 U886 ( .A(n161), .B(n164), .Y(n181) );
  NAND2X1 U887 ( .A(n557), .B(n549), .Y(n168) );
  NAND3X1 U888 ( .A(n949), .B(n936), .C(n300), .Y(n549) );
  NAND2X1 U889 ( .A(n947), .B(n944), .Y(n557) );
  OAI21X1 U890 ( .A(n954), .B(n183), .C(n170), .Y(n951) );
  INVX1 U891 ( .A(n289), .Y(n170) );
  NOR2X1 U892 ( .A(n940), .B(n175), .Y(n289) );
  NOR2X1 U893 ( .A(n955), .B(n956), .Y(n175) );
  INVX1 U894 ( .A(n164), .Y(n940) );
  NAND2X1 U895 ( .A(n956), .B(n955), .Y(n164) );
  INVX1 U896 ( .A(n957), .Y(n955) );
  OAI21X1 U897 ( .A(n958), .B(n959), .C(n176), .Y(n183) );
  NAND2X1 U898 ( .A(n303), .B(n944), .Y(n176) );
  NOR2X1 U899 ( .A(n960), .B(n936), .Y(n303) );
  INVX1 U900 ( .A(n554), .Y(n954) );
  NAND3X1 U901 ( .A(n945), .B(n946), .C(n302), .Y(n554) );
  INVX1 U902 ( .A(n959), .Y(n302) );
  NAND2X1 U903 ( .A(n936), .B(n960), .Y(n959) );
  INVX1 U904 ( .A(n949), .Y(n960) );
  OAI21X1 U905 ( .A(n180), .B(n293), .C(n179), .Y(n950) );
  NAND2X1 U906 ( .A(n161), .B(n933), .Y(n179) );
  INVX1 U907 ( .A(n182), .Y(n933) );
  NOR2X1 U908 ( .A(n956), .B(n957), .Y(n182) );
  NAND2X1 U909 ( .A(n957), .B(n956), .Y(n161) );
  XOR2X1 U910 ( .A(des_curr[16]), .B(subkey[25]), .Y(n956) );
  XNOR2X1 U911 ( .A(des_curr[15]), .B(subkey[24]), .Y(n957) );
  INVX1 U912 ( .A(n163), .Y(n293) );
  MUX2X1 U913 ( .B(n935), .A(n961), .S(n936), .Y(n163) );
  AND2X1 U914 ( .A(n949), .B(n944), .Y(n961) );
  NOR2X1 U915 ( .A(n945), .B(n946), .Y(n944) );
  INVX1 U916 ( .A(n962), .Y(n935) );
  NAND3X1 U917 ( .A(n945), .B(n946), .C(n949), .Y(n962) );
  INVX1 U918 ( .A(n953), .Y(n946) );
  INVX1 U919 ( .A(n548), .Y(n180) );
  NAND2X1 U920 ( .A(n947), .B(n300), .Y(n548) );
  INVX1 U921 ( .A(n958), .Y(n300) );
  NAND2X1 U922 ( .A(n953), .B(n945), .Y(n958) );
  XOR2X1 U923 ( .A(des_curr[20]), .B(subkey[29]), .Y(n945) );
  XNOR2X1 U924 ( .A(des_curr[18]), .B(subkey[27]), .Y(n953) );
  NOR2X1 U925 ( .A(n949), .B(n936), .Y(n947) );
  XNOR2X1 U926 ( .A(des_curr[17]), .B(subkey[26]), .Y(n936) );
  XNOR2X1 U927 ( .A(des_curr[19]), .B(subkey[28]), .Y(n949) );
  MUX2X1 U928 ( .B(n963), .A(n964), .S(des_start), .Y(nxtRight[11]) );
  INVX1 U929 ( .A(des_in[11]), .Y(n964) );
  XNOR2X1 U930 ( .A(des_curr[44]), .B(n965), .Y(n963) );
  NAND3X1 U931 ( .A(n966), .B(n967), .C(n968), .Y(n965) );
  NOR2X1 U932 ( .A(n969), .B(n970), .Y(n968) );
  INVX1 U933 ( .A(n971), .Y(n970) );
  AOI22X1 U934 ( .A(n432), .B(n202), .C(n972), .D(n216), .Y(n971) );
  NAND2X1 U935 ( .A(n420), .B(n728), .Y(n432) );
  NAND3X1 U936 ( .A(n973), .B(n751), .C(n974), .Y(n969) );
  OAI21X1 U937 ( .A(n732), .B(n975), .C(n208), .Y(n974) );
  INVX1 U938 ( .A(n731), .Y(n208) );
  NAND2X1 U939 ( .A(n738), .B(n976), .Y(n975) );
  OAI21X1 U940 ( .A(n206), .B(n745), .C(n425), .Y(n973) );
  INVX1 U941 ( .A(n736), .Y(n745) );
  AOI22X1 U942 ( .A(n210), .B(n424), .C(n209), .D(n199), .Y(n967) );
  INVX1 U943 ( .A(n757), .Y(n209) );
  NAND3X1 U944 ( .A(n201), .B(n977), .C(n978), .Y(n757) );
  INVX1 U945 ( .A(n979), .Y(n210) );
  NAND3X1 U946 ( .A(n980), .B(n981), .C(n200), .Y(n979) );
  AOI21X1 U947 ( .A(n730), .B(n214), .C(n217), .Y(n966) );
  OR2X1 U948 ( .A(n982), .B(n983), .Y(n217) );
  OAI21X1 U949 ( .A(n984), .B(n731), .C(n985), .Y(n983) );
  OAI21X1 U950 ( .A(n197), .B(n972), .C(n425), .Y(n985) );
  INVX1 U951 ( .A(n195), .Y(n425) );
  NAND2X1 U952 ( .A(n753), .B(n740), .Y(n972) );
  NAND3X1 U953 ( .A(n977), .B(n981), .C(n986), .Y(n740) );
  NAND3X1 U954 ( .A(n987), .B(n980), .C(n200), .Y(n753) );
  INVX1 U955 ( .A(n733), .Y(n197) );
  NAND3X1 U956 ( .A(n978), .B(n977), .C(n988), .Y(n733) );
  NAND2X1 U957 ( .A(n989), .B(n990), .Y(n731) );
  NOR2X1 U958 ( .A(n202), .B(n991), .Y(n984) );
  NAND2X1 U959 ( .A(n734), .B(n430), .Y(n991) );
  NAND3X1 U960 ( .A(n992), .B(n981), .C(n986), .Y(n430) );
  NAND3X1 U961 ( .A(n987), .B(n993), .C(n980), .Y(n734) );
  INVX1 U962 ( .A(n754), .Y(n202) );
  NAND3X1 U963 ( .A(n978), .B(n992), .C(n988), .Y(n754) );
  NAND3X1 U964 ( .A(n994), .B(n995), .C(n996), .Y(n982) );
  OAI21X1 U965 ( .A(n730), .B(n755), .C(n199), .Y(n996) );
  INVX1 U966 ( .A(n420), .Y(n199) );
  INVX1 U967 ( .A(n997), .Y(n755) );
  AOI21X1 U968 ( .A(n201), .B(n200), .C(n206), .Y(n997) );
  AND2X1 U969 ( .A(n988), .B(n993), .Y(n206) );
  OAI21X1 U970 ( .A(n737), .B(n732), .C(n424), .Y(n995) );
  NAND2X1 U971 ( .A(n195), .B(n420), .Y(n424) );
  NAND2X1 U972 ( .A(n989), .B(n998), .Y(n420) );
  INVX1 U973 ( .A(n421), .Y(n732) );
  NAND3X1 U974 ( .A(n987), .B(n992), .C(n986), .Y(n421) );
  INVX1 U975 ( .A(n751), .Y(n737) );
  NAND2X1 U976 ( .A(n993), .B(n201), .Y(n751) );
  OAI21X1 U977 ( .A(n752), .B(n198), .C(n216), .Y(n994) );
  INVX1 U978 ( .A(n728), .Y(n216) );
  NAND2X1 U979 ( .A(n736), .B(n738), .Y(n198) );
  NAND2X1 U980 ( .A(n988), .B(n200), .Y(n738) );
  NOR2X1 U981 ( .A(n977), .B(n978), .Y(n200) );
  NOR2X1 U982 ( .A(n980), .B(n987), .Y(n988) );
  NAND3X1 U983 ( .A(n978), .B(n201), .C(n992), .Y(n736) );
  NOR2X1 U984 ( .A(n981), .B(n980), .Y(n201) );
  INVX1 U985 ( .A(n976), .Y(n752) );
  NAND3X1 U986 ( .A(n993), .B(n981), .C(n980), .Y(n976) );
  INVX1 U987 ( .A(n987), .Y(n981) );
  NOR2X1 U988 ( .A(n992), .B(n978), .Y(n993) );
  NAND2X1 U989 ( .A(n195), .B(n728), .Y(n214) );
  NAND2X1 U990 ( .A(n998), .B(n999), .Y(n728) );
  NAND2X1 U991 ( .A(n990), .B(n999), .Y(n195) );
  INVX1 U992 ( .A(n989), .Y(n999) );
  XNOR2X1 U993 ( .A(des_curr[0]), .B(subkey[1]), .Y(n989) );
  INVX1 U994 ( .A(n998), .Y(n990) );
  XNOR2X1 U995 ( .A(des_curr[31]), .B(subkey[0]), .Y(n998) );
  INVX1 U996 ( .A(n743), .Y(n730) );
  NAND3X1 U997 ( .A(n987), .B(n977), .C(n986), .Y(n743) );
  AND2X1 U998 ( .A(n980), .B(n978), .Y(n986) );
  XNOR2X1 U999 ( .A(des_curr[3]), .B(subkey[4]), .Y(n978) );
  XNOR2X1 U1000 ( .A(des_curr[2]), .B(subkey[3]), .Y(n980) );
  INVX1 U1001 ( .A(n992), .Y(n977) );
  XNOR2X1 U1002 ( .A(des_curr[4]), .B(subkey[5]), .Y(n992) );
  XNOR2X1 U1003 ( .A(des_curr[1]), .B(subkey[2]), .Y(n987) );
  MUX2X1 U1004 ( .B(n1000), .A(n1001), .S(des_start), .Y(nxtRight[10]) );
  INVX1 U1005 ( .A(des_in[10]), .Y(n1001) );
  XOR2X1 U1006 ( .A(des_curr[43]), .B(n1002), .Y(n1000) );
  NOR2X1 U1007 ( .A(n1003), .B(n1004), .Y(n1002) );
  NAND3X1 U1008 ( .A(n1005), .B(n1006), .C(n1007), .Y(n1004) );
  AOI22X1 U1009 ( .A(n480), .B(n600), .C(n618), .D(n471), .Y(n1007) );
  NAND2X1 U1010 ( .A(n465), .B(n1008), .Y(n600) );
  NOR2X1 U1011 ( .A(n1009), .B(n1010), .Y(n465) );
  INVX1 U1012 ( .A(n612), .Y(n480) );
  INVX1 U1013 ( .A(n609), .Y(n1006) );
  OAI21X1 U1014 ( .A(n1011), .B(n1012), .C(n1013), .Y(n609) );
  AOI22X1 U1015 ( .A(n1014), .B(n608), .C(n471), .D(n607), .Y(n1013) );
  NAND2X1 U1016 ( .A(n1015), .B(n1016), .Y(n1014) );
  NAND3X1 U1017 ( .A(n1017), .B(n1018), .C(n1019), .Y(n1003) );
  AND2X1 U1018 ( .A(n1020), .B(n1021), .Y(n1019) );
  OAI21X1 U1019 ( .A(n479), .B(n1022), .C(n477), .Y(n1021) );
  OAI21X1 U1020 ( .A(n1009), .B(n606), .C(n608), .Y(n1020) );
  OAI21X1 U1021 ( .A(n1023), .B(n476), .C(n602), .Y(n1018) );
  OAI21X1 U1022 ( .A(n475), .B(n619), .C(n473), .Y(n1017) );
  MUX2X1 U1023 ( .B(n1024), .A(n1025), .S(des_start), .Y(nxtRight[0]) );
  INVX1 U1024 ( .A(des_in[0]), .Y(n1025) );
  XNOR2X1 U1025 ( .A(des_curr[33]), .B(n1026), .Y(n1024) );
  NAND3X1 U1026 ( .A(n1027), .B(n1005), .C(n1028), .Y(n1026) );
  NOR2X1 U1027 ( .A(n1029), .B(n1030), .Y(n1028) );
  OAI21X1 U1028 ( .A(n1031), .B(n612), .C(n1032), .Y(n1030) );
  OAI21X1 U1029 ( .A(n1033), .B(n1034), .C(n473), .Y(n1032) );
  INVX1 U1030 ( .A(n1012), .Y(n473) );
  NAND2X1 U1031 ( .A(n623), .B(n1035), .Y(n1034) );
  INVX1 U1032 ( .A(n1022), .Y(n623) );
  INVX1 U1033 ( .A(n474), .Y(n1031) );
  NAND3X1 U1034 ( .A(n603), .B(n1008), .C(n1016), .Y(n474) );
  OR2X1 U1035 ( .A(n1036), .B(n1037), .Y(n1016) );
  INVX1 U1036 ( .A(n1023), .Y(n1008) );
  NOR2X1 U1037 ( .A(n1038), .B(n1039), .Y(n1023) );
  NAND2X1 U1038 ( .A(n1040), .B(n1041), .Y(n1029) );
  OAI21X1 U1039 ( .A(n1009), .B(n618), .C(n477), .Y(n1041) );
  INVX1 U1040 ( .A(n1042), .Y(n1009) );
  NAND3X1 U1041 ( .A(n1043), .B(n622), .C(n1044), .Y(n1042) );
  OAI21X1 U1042 ( .A(n476), .B(n472), .C(n608), .Y(n1040) );
  OR2X1 U1043 ( .A(n601), .B(n618), .Y(n472) );
  NOR2X1 U1044 ( .A(n1045), .B(n622), .Y(n618) );
  OR2X1 U1045 ( .A(n619), .B(n479), .Y(n601) );
  NOR2X1 U1046 ( .A(n621), .B(n1039), .Y(n479) );
  INVX1 U1047 ( .A(n1046), .Y(n619) );
  NAND3X1 U1048 ( .A(n622), .B(n1047), .C(n1048), .Y(n1046) );
  NOR2X1 U1049 ( .A(n1049), .B(n1050), .Y(n1048) );
  INVX1 U1050 ( .A(n1035), .Y(n476) );
  NAND3X1 U1051 ( .A(n1047), .B(n1049), .C(n1051), .Y(n1035) );
  NOR2X1 U1052 ( .A(n1052), .B(n1053), .Y(n1005) );
  INVX1 U1053 ( .A(n1054), .Y(n1053) );
  AOI22X1 U1054 ( .A(n614), .B(n471), .C(n477), .D(n606), .Y(n1054) );
  OAI21X1 U1055 ( .A(n622), .B(n621), .C(n615), .Y(n606) );
  NAND3X1 U1056 ( .A(n1055), .B(n1047), .C(n1051), .Y(n615) );
  NAND3X1 U1057 ( .A(n1047), .B(n1049), .C(n1050), .Y(n621) );
  OAI21X1 U1058 ( .A(n603), .B(n1012), .C(n1056), .Y(n1052) );
  OAI21X1 U1059 ( .A(n1010), .B(n1022), .C(n602), .Y(n1056) );
  INVX1 U1060 ( .A(n1057), .Y(n602) );
  NOR2X1 U1061 ( .A(n1036), .B(n1047), .Y(n1022) );
  NAND3X1 U1062 ( .A(n622), .B(n1049), .C(n1043), .Y(n1036) );
  INVX1 U1063 ( .A(n1058), .Y(n1010) );
  NAND3X1 U1064 ( .A(n1039), .B(n1050), .C(n1044), .Y(n1058) );
  NAND2X1 U1065 ( .A(n1044), .B(n1051), .Y(n603) );
  AOI21X1 U1066 ( .A(n475), .B(n471), .C(n467), .Y(n1027) );
  OAI21X1 U1067 ( .A(n1057), .B(n1015), .C(n1059), .Y(n467) );
  AOI22X1 U1068 ( .A(n607), .B(n608), .C(n614), .D(n477), .Y(n1059) );
  NAND2X1 U1069 ( .A(n612), .B(n1012), .Y(n477) );
  NAND2X1 U1070 ( .A(n1060), .B(n1061), .Y(n1012) );
  NAND2X1 U1071 ( .A(n1062), .B(n1063), .Y(n612) );
  INVX1 U1072 ( .A(n1011), .Y(n614) );
  NAND3X1 U1073 ( .A(n622), .B(n1050), .C(n1044), .Y(n1011) );
  NOR2X1 U1074 ( .A(n1047), .B(n1049), .Y(n1044) );
  NAND2X1 U1075 ( .A(n1057), .B(n604), .Y(n608) );
  INVX1 U1076 ( .A(n1064), .Y(n607) );
  NAND3X1 U1077 ( .A(n1037), .B(n1049), .C(n1051), .Y(n1064) );
  NOR2X1 U1078 ( .A(n1050), .B(n622), .Y(n1051) );
  INVX1 U1079 ( .A(n1033), .Y(n1015) );
  NOR2X1 U1080 ( .A(n1045), .B(n1039), .Y(n1033) );
  NAND3X1 U1081 ( .A(n1050), .B(n1047), .C(n1055), .Y(n1045) );
  INVX1 U1082 ( .A(n1037), .Y(n1047) );
  NAND2X1 U1083 ( .A(n1061), .B(n1063), .Y(n1057) );
  INVX1 U1084 ( .A(n1060), .Y(n1063) );
  INVX1 U1085 ( .A(n1062), .Y(n1061) );
  INVX1 U1086 ( .A(n604), .Y(n471) );
  NAND2X1 U1087 ( .A(n1062), .B(n1060), .Y(n604) );
  XNOR2X1 U1088 ( .A(des_curr[3]), .B(subkey[6]), .Y(n1060) );
  XNOR2X1 U1089 ( .A(des_curr[4]), .B(subkey[7]), .Y(n1062) );
  NOR2X1 U1090 ( .A(n1038), .B(n622), .Y(n475) );
  INVX1 U1091 ( .A(n1039), .Y(n622) );
  XNOR2X1 U1092 ( .A(des_curr[7]), .B(subkey[10]), .Y(n1039) );
  NAND3X1 U1093 ( .A(n1050), .B(n1049), .C(n1037), .Y(n1038) );
  XNOR2X1 U1094 ( .A(des_curr[5]), .B(subkey[8]), .Y(n1037) );
  INVX1 U1095 ( .A(n1055), .Y(n1049) );
  XNOR2X1 U1096 ( .A(des_curr[6]), .B(subkey[9]), .Y(n1055) );
  INVX1 U1097 ( .A(n1043), .Y(n1050) );
  XNOR2X1 U1098 ( .A(des_curr[8]), .B(subkey[11]), .Y(n1043) );
  INVX1 U1099 ( .A(n1065), .Y(nxtLeft[9]) );
  MUX2X1 U1100 ( .B(des_curr[9]), .A(des_in[42]), .S(des_start), .Y(n1065) );
  INVX1 U1101 ( .A(n1066), .Y(nxtLeft[8]) );
  MUX2X1 U1102 ( .B(des_curr[8]), .A(des_in[41]), .S(des_start), .Y(n1066) );
  INVX1 U1103 ( .A(n1067), .Y(nxtLeft[7]) );
  MUX2X1 U1104 ( .B(des_curr[7]), .A(des_in[40]), .S(des_start), .Y(n1067) );
  INVX1 U1105 ( .A(n1068), .Y(nxtLeft[6]) );
  MUX2X1 U1106 ( .B(des_curr[6]), .A(des_in[39]), .S(des_start), .Y(n1068) );
  INVX1 U1107 ( .A(n1069), .Y(nxtLeft[5]) );
  MUX2X1 U1108 ( .B(des_curr[5]), .A(des_in[38]), .S(des_start), .Y(n1069) );
  INVX1 U1109 ( .A(n1070), .Y(nxtLeft[4]) );
  MUX2X1 U1110 ( .B(des_curr[4]), .A(des_in[37]), .S(des_start), .Y(n1070) );
  INVX1 U1111 ( .A(n1071), .Y(nxtLeft[3]) );
  MUX2X1 U1112 ( .B(des_curr[3]), .A(des_in[36]), .S(des_start), .Y(n1071) );
  AND2X1 U1113 ( .A(des_curr[32]), .B(n1072), .Y(nxtLeft[32]) );
  AND2X1 U1114 ( .A(n1072), .B(des_curr[31]), .Y(nxtLeft[31]) );
  INVX1 U1115 ( .A(des_start), .Y(n1072) );
  INVX1 U1116 ( .A(n1073), .Y(nxtLeft[30]) );
  MUX2X1 U1117 ( .B(des_curr[30]), .A(des_in[63]), .S(des_start), .Y(n1073) );
  INVX1 U1118 ( .A(n1074), .Y(nxtLeft[2]) );
  MUX2X1 U1119 ( .B(des_curr[2]), .A(des_in[35]), .S(des_start), .Y(n1074) );
  INVX1 U1120 ( .A(n1075), .Y(nxtLeft[29]) );
  MUX2X1 U1121 ( .B(des_curr[29]), .A(des_in[62]), .S(des_start), .Y(n1075) );
  INVX1 U1122 ( .A(n1076), .Y(nxtLeft[28]) );
  MUX2X1 U1123 ( .B(des_curr[28]), .A(des_in[61]), .S(des_start), .Y(n1076) );
  INVX1 U1124 ( .A(n1077), .Y(nxtLeft[27]) );
  MUX2X1 U1125 ( .B(des_curr[27]), .A(des_in[60]), .S(des_start), .Y(n1077) );
  INVX1 U1126 ( .A(n1078), .Y(nxtLeft[26]) );
  MUX2X1 U1127 ( .B(des_curr[26]), .A(des_in[59]), .S(des_start), .Y(n1078) );
  INVX1 U1128 ( .A(n1079), .Y(nxtLeft[25]) );
  MUX2X1 U1129 ( .B(des_curr[25]), .A(des_in[58]), .S(des_start), .Y(n1079) );
  INVX1 U1130 ( .A(n1080), .Y(nxtLeft[24]) );
  MUX2X1 U1131 ( .B(des_curr[24]), .A(des_in[57]), .S(des_start), .Y(n1080) );
  INVX1 U1132 ( .A(n1081), .Y(nxtLeft[23]) );
  MUX2X1 U1133 ( .B(des_curr[23]), .A(des_in[56]), .S(des_start), .Y(n1081) );
  INVX1 U1134 ( .A(n1082), .Y(nxtLeft[22]) );
  MUX2X1 U1135 ( .B(des_curr[22]), .A(des_in[55]), .S(des_start), .Y(n1082) );
  INVX1 U1136 ( .A(n1083), .Y(nxtLeft[21]) );
  MUX2X1 U1137 ( .B(des_curr[21]), .A(des_in[54]), .S(des_start), .Y(n1083) );
  INVX1 U1138 ( .A(n1084), .Y(nxtLeft[20]) );
  MUX2X1 U1139 ( .B(des_curr[20]), .A(des_in[53]), .S(des_start), .Y(n1084) );
  INVX1 U1140 ( .A(n1085), .Y(nxtLeft[1]) );
  MUX2X1 U1141 ( .B(des_curr[1]), .A(des_in[34]), .S(des_start), .Y(n1085) );
  INVX1 U1142 ( .A(n1086), .Y(nxtLeft[19]) );
  MUX2X1 U1143 ( .B(des_curr[19]), .A(des_in[52]), .S(des_start), .Y(n1086) );
  INVX1 U1144 ( .A(n1087), .Y(nxtLeft[18]) );
  MUX2X1 U1145 ( .B(des_curr[18]), .A(des_in[51]), .S(des_start), .Y(n1087) );
  INVX1 U1146 ( .A(n1088), .Y(nxtLeft[17]) );
  MUX2X1 U1147 ( .B(des_curr[17]), .A(des_in[50]), .S(des_start), .Y(n1088) );
  INVX1 U1148 ( .A(n1089), .Y(nxtLeft[16]) );
  MUX2X1 U1149 ( .B(des_curr[16]), .A(des_in[49]), .S(des_start), .Y(n1089) );
  INVX1 U1150 ( .A(n1090), .Y(nxtLeft[15]) );
  MUX2X1 U1151 ( .B(des_curr[15]), .A(des_in[48]), .S(des_start), .Y(n1090) );
  INVX1 U1152 ( .A(n1091), .Y(nxtLeft[14]) );
  MUX2X1 U1153 ( .B(des_curr[14]), .A(des_in[47]), .S(des_start), .Y(n1091) );
  INVX1 U1154 ( .A(n1092), .Y(nxtLeft[13]) );
  MUX2X1 U1155 ( .B(des_curr[13]), .A(des_in[46]), .S(des_start), .Y(n1092) );
  INVX1 U1156 ( .A(n1093), .Y(nxtLeft[12]) );
  MUX2X1 U1157 ( .B(des_curr[12]), .A(des_in[45]), .S(des_start), .Y(n1093) );
  INVX1 U1158 ( .A(n1094), .Y(nxtLeft[11]) );
  MUX2X1 U1159 ( .B(des_curr[11]), .A(des_in[44]), .S(des_start), .Y(n1094) );
  INVX1 U1160 ( .A(n1095), .Y(nxtLeft[10]) );
  MUX2X1 U1161 ( .B(des_curr[10]), .A(des_in[43]), .S(des_start), .Y(n1095) );
  INVX1 U1162 ( .A(n1096), .Y(nxtLeft[0]) );
  MUX2X1 U1163 ( .B(des_curr[0]), .A(des_in[33]), .S(des_start), .Y(n1096) );
  INVX1 U1164 ( .A(n1097), .Y(n1098) );
  MUX2X1 U1165 ( .B(left[32]), .A(des_in[32]), .S(des_start), .Y(n1097) );
endmodule


module key_generator ( clk, n_rst, reverse, cnt_rollover, key_rollover, 
        round_count, key_count, subkey );
  input [4:0] round_count;
  input [1:0] key_count;
  output [47:0] subkey;
  input clk, n_rst, reverse, cnt_rollover, key_rollover;
  wire   \subkey[27] , keyOutR_63, keyOutR_61, keyOutR_60, keyOutR_59,
         keyOutR_57, keyOutR_55, keyOutR_54, keyOutR_53, keyOutR_52,
         keyOutR_51, keyOutR_50, keyOutR_47, keyOutR_46, keyOutR_45,
         keyOutR_44, keyOutR_39, keyOutR_38, keyOutR_36, keyOutR_35,
         keyOutR_33, keyOutR_32, keyOutR_29, keyOutR_28, keyOutR_27,
         keyOutR_24, keyOutR_23, keyOutR_22, keyOutR_21, keyOutR_20,
         keyOutR_19, \left[19] , left_10, left_6, left_3, left_1, \right[21] ,
         right_18, right_13, right_2, n147, n148, n149, n150, n151, n152, n153,
         n154, n155, n156, n157, n158, n159, n160, n161, n162, n163, n164,
         n165, n166, n167, n168, n169, n170, n171, n172, n173, n174, n175,
         n176, n177, n178, n179, n180, n181, n182, n183, n184, n185, n186,
         n187, n188, n189, n190, n191, n192, n193, n194, n195, n196, n197,
         n198, n199, n200, n201, n202, n203, n204, n205, n206, n207, n208,
         n209, n210, n211, n212, n213, n214, n215, n216, n217, n218, n219,
         n220, n221, n222, n223, n224, n225, n226, n227, n228, n229, n230,
         n231, n232, n233, n234, n235, n236, n237, n238, n239, n240, n241,
         n242, n243, n244, n245, n246, n247, n248, n249, n250, n251, n252,
         n253, n254, n255, n256, n257, n258, n259, n260, n261, n262, n263,
         n264, n265, n266, n267, n268, n269, n270, n271, n272, n273, n274,
         n275, n276, n277, n278, n279, n280, n281, n282, n283, n284, n285,
         n286, n287, n288, n289, n290, n291, n292, n293, n294, n295, n296,
         n297, n298, n299, n300, n301, n302, n303, n304, n305, n306, n307,
         n308, n309, n310, n311, n312, n313, n314, n315, n316, n317, n318,
         n319, n320, n321, n322, n323, n324, n325, n326, n327, n328, n329,
         n330, n331, n332, n333, n334;
  wire   [63:0] keyOut;
  wire   [17:1] keyOutR;
  wire   [63:0] keyNext;
  wire   [27:0] nxtleft;
  wire   [27:0] nxtright;
  assign subkey[1] = \subkey[27] ;
  assign subkey[27] = \subkey[27] ;

  DFFSR \keyOut_reg[63]  ( .D(keyNext[63]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOut[63]) );
  DFFSR \keyOut_reg[62]  ( .D(keyNext[62]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOut[62]) );
  DFFSR \keyOut_reg[61]  ( .D(keyNext[61]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(keyOut[61]) );
  DFFSR \keyOut_reg[59]  ( .D(keyNext[59]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOut[59]) );
  DFFSR \keyOut_reg[57]  ( .D(keyNext[57]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOut[57]) );
  DFFSR \keyOut_reg[56]  ( .D(keyNext[56]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(keyOut[56]) );
  DFFSR \keyOut_reg[54]  ( .D(keyNext[54]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(keyOut[54]) );
  DFFSR \keyOut_reg[53]  ( .D(keyNext[53]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOut[53]) );
  DFFSR \keyOut_reg[52]  ( .D(keyNext[52]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOut[52]) );
  DFFSR \keyOut_reg[51]  ( .D(keyNext[51]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOut[51]) );
  DFFSR \keyOut_reg[49]  ( .D(keyNext[49]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOut[49]) );
  DFFSR \keyOut_reg[48]  ( .D(keyNext[48]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(keyOut[48]) );
  DFFSR \keyOut_reg[46]  ( .D(keyNext[46]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(keyOut[46]) );
  DFFSR \keyOut_reg[45]  ( .D(keyNext[45]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOut[45]) );
  DFFSR \keyOut_reg[44]  ( .D(keyNext[44]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOut[44]) );
  DFFSR \keyOut_reg[43]  ( .D(keyNext[43]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOut[43]) );
  DFFSR \keyOut_reg[42]  ( .D(keyNext[42]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOut[42]) );
  DFFSR \keyOut_reg[41]  ( .D(keyNext[41]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOut[41]) );
  DFFSR \keyOut_reg[40]  ( .D(keyNext[40]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(keyOut[40]) );
  DFFSR \keyOut_reg[39]  ( .D(keyNext[39]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOut[39]) );
  DFFSR \keyOut_reg[36]  ( .D(keyNext[36]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOut[36]) );
  DFFSR \keyOut_reg[35]  ( .D(keyNext[35]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOut[35]) );
  DFFSR \keyOut_reg[34]  ( .D(keyNext[34]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(keyOut[34]) );
  DFFSR \keyOut_reg[31]  ( .D(keyNext[31]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOut[31]) );
  DFFSR \keyOut_reg[30]  ( .D(keyNext[30]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(keyOut[30]) );
  DFFSR \keyOut_reg[29]  ( .D(keyNext[29]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(keyOut[29]) );
  DFFSR \keyOut_reg[28]  ( .D(keyNext[28]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOut[28]) );
  DFFSR \keyOut_reg[27]  ( .D(keyNext[27]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOut[27]) );
  DFFSR \keyOut_reg[25]  ( .D(keyNext[25]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOut[25]) );
  DFFSR \keyOut_reg[24]  ( .D(keyNext[24]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(keyOut[24]) );
  DFFSR \keyOut_reg[23]  ( .D(keyNext[23]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOut[23]) );
  DFFSR \keyOut_reg[21]  ( .D(keyNext[21]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOut[21]) );
  DFFSR \keyOut_reg[19]  ( .D(keyNext[19]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(keyOut[19]) );
  DFFSR \keyOut_reg[18]  ( .D(keyNext[18]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOut[18]) );
  DFFSR \keyOut_reg[17]  ( .D(keyNext[17]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOut[17]) );
  DFFSR \keyOut_reg[16]  ( .D(keyNext[16]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOut[16]) );
  DFFSR \keyOut_reg[15]  ( .D(keyNext[15]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOut[15]) );
  DFFSR \keyOut_reg[13]  ( .D(keyNext[13]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOut[13]) );
  DFFSR \keyOut_reg[12]  ( .D(keyNext[12]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(keyOut[12]) );
  DFFSR \keyOut_reg[11]  ( .D(keyNext[11]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOut[11]) );
  DFFSR \keyOut_reg[10]  ( .D(keyNext[10]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOut[10]) );
  DFFSR \keyOut_reg[9]  ( .D(keyNext[9]), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        keyOut[9]) );
  DFFSR \keyOut_reg[8]  ( .D(keyNext[8]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        keyOut[8]) );
  DFFSR \keyOut_reg[6]  ( .D(keyNext[6]), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        keyOut[6]) );
  DFFSR \keyOut_reg[4]  ( .D(keyNext[4]), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        keyOut[4]) );
  DFFSR \keyOut_reg[3]  ( .D(keyNext[3]), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        keyOut[3]) );
  DFFSR \keyOut_reg[2]  ( .D(keyNext[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        keyOut[2]) );
  DFFSR \keyOut_reg[0]  ( .D(keyNext[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        keyOut[0]) );
  DFFSR \keyOutR_reg[63]  ( .D(keyNext[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(keyOutR_63) );
  DFFSR \keyOutR_reg[61]  ( .D(keyNext[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(keyOutR_61) );
  DFFSR \keyOutR_reg[60]  ( .D(keyNext[3]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOutR_60) );
  DFFSR \keyOutR_reg[59]  ( .D(keyNext[4]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOutR_59) );
  DFFSR \keyOutR_reg[57]  ( .D(keyNext[6]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOutR_57) );
  DFFSR \keyOutR_reg[55]  ( .D(keyNext[8]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(keyOutR_55) );
  DFFSR \keyOutR_reg[54]  ( .D(keyNext[9]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOutR_54) );
  DFFSR \keyOutR_reg[53]  ( .D(keyNext[10]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOutR_53) );
  DFFSR \keyOutR_reg[52]  ( .D(keyNext[11]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOutR_52) );
  DFFSR \keyOutR_reg[51]  ( .D(keyNext[12]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(keyOutR_51) );
  DFFSR \keyOutR_reg[50]  ( .D(keyNext[13]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOutR_50) );
  DFFSR \keyOutR_reg[47]  ( .D(keyNext[16]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOutR_47) );
  DFFSR \keyOutR_reg[46]  ( .D(keyNext[17]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOutR_46) );
  DFFSR \keyOutR_reg[45]  ( .D(keyNext[18]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOutR_45) );
  DFFSR \keyOutR_reg[44]  ( .D(keyNext[19]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(keyOutR_44) );
  DFFSR \keyOutR_reg[39]  ( .D(keyNext[24]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(keyOutR_39) );
  DFFSR \keyOutR_reg[38]  ( .D(keyNext[25]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOutR_38) );
  DFFSR \keyOutR_reg[36]  ( .D(keyNext[27]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOutR_36) );
  DFFSR \keyOutR_reg[35]  ( .D(keyNext[28]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOutR_35) );
  DFFSR \keyOutR_reg[33]  ( .D(keyNext[30]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(keyOutR_33) );
  DFFSR \keyOutR_reg[32]  ( .D(keyNext[31]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOutR_32) );
  DFFSR \keyOutR_reg[29]  ( .D(keyNext[34]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(keyOutR_29) );
  DFFSR \keyOutR_reg[28]  ( .D(keyNext[35]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOutR_28) );
  DFFSR \keyOutR_reg[27]  ( .D(keyNext[36]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOutR_27) );
  DFFSR \keyOutR_reg[24]  ( .D(keyNext[39]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOutR_24) );
  DFFSR \keyOutR_reg[23]  ( .D(keyNext[40]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(keyOutR_23) );
  DFFSR \keyOutR_reg[22]  ( .D(keyNext[41]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOutR_22) );
  DFFSR \keyOutR_reg[21]  ( .D(keyNext[42]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOutR_21) );
  DFFSR \keyOutR_reg[20]  ( .D(keyNext[43]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOutR_20) );
  DFFSR \keyOutR_reg[19]  ( .D(keyNext[44]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOutR_19) );
  DFFSR \keyOutR_reg[17]  ( .D(keyNext[46]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(keyOutR[17]) );
  DFFSR \keyOutR_reg[15]  ( .D(keyNext[48]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(keyOutR[15]) );
  DFFSR \keyOutR_reg[14]  ( .D(keyNext[49]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOutR[14]) );
  DFFSR \keyOutR_reg[12]  ( .D(keyNext[51]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOutR[12]) );
  DFFSR \keyOutR_reg[11]  ( .D(keyNext[52]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOutR[11]) );
  DFFSR \keyOutR_reg[10]  ( .D(keyNext[53]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOutR[10]) );
  DFFSR \keyOutR_reg[9]  ( .D(keyNext[54]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(keyOutR[9]) );
  DFFSR \keyOutR_reg[7]  ( .D(keyNext[56]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(keyOutR[7]) );
  DFFSR \keyOutR_reg[6]  ( .D(keyNext[57]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOutR[6]) );
  DFFSR \keyOutR_reg[4]  ( .D(keyNext[59]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOutR[4]) );
  DFFSR \left_reg[3]  ( .D(nxtleft[3]), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        left_3) );
  DFFSR \left_reg[5]  ( .D(nxtleft[5]), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        subkey[35]) );
  DFFSR \left_reg[7]  ( .D(n333), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        subkey[37]) );
  DFFSR \left_reg[9]  ( .D(nxtleft[9]), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        subkey[34]) );
  DFFSR \left_reg[11]  ( .D(n332), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        subkey[46]) );
  DFFSR \left_reg[13]  ( .D(nxtleft[13]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        subkey[39]) );
  DFFSR \left_reg[15]  ( .D(nxtleft[15]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        subkey[25]) );
  DFFSR \left_reg[17]  ( .D(nxtleft[17]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        subkey[45]) );
  DFFSR \left_reg[19]  ( .D(nxtleft[19]), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        \left[19] ) );
  DFFSR \left_reg[21]  ( .D(nxtleft[21]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        subkey[28]) );
  DFFSR \left_reg[23]  ( .D(nxtleft[23]), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        subkey[42]) );
  DFFSR \left_reg[25]  ( .D(nxtleft[25]), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        subkey[41]) );
  DFFSR \left_reg[27]  ( .D(nxtleft[27]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        subkey[43]) );
  DFFSR \left_reg[1]  ( .D(nxtleft[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        left_1) );
  DFFSR \left_reg[2]  ( .D(nxtleft[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        subkey[31]) );
  DFFSR \left_reg[4]  ( .D(nxtleft[4]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        subkey[44]) );
  DFFSR \left_reg[6]  ( .D(nxtleft[6]), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        left_6) );
  DFFSR \left_reg[8]  ( .D(nxtleft[8]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        subkey[26]) );
  DFFSR \left_reg[10]  ( .D(nxtleft[10]), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        left_10) );
  DFFSR \left_reg[12]  ( .D(nxtleft[12]), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        subkey[29]) );
  DFFSR \left_reg[14]  ( .D(nxtleft[14]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        subkey[47]) );
  DFFSR \left_reg[16]  ( .D(nxtleft[16]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        subkey[33]) );
  DFFSR \left_reg[18]  ( .D(nxtleft[18]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        subkey[36]) );
  DFFSR \left_reg[20]  ( .D(nxtleft[20]), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        subkey[30]) );
  DFFSR \left_reg[22]  ( .D(nxtleft[22]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        subkey[38]) );
  DFFSR \left_reg[24]  ( .D(nxtleft[24]), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        subkey[32]) );
  DFFSR \left_reg[26]  ( .D(nxtleft[26]), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        subkey[24]) );
  DFFSR \left_reg[0]  ( .D(nxtleft[0]), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        subkey[40]) );
  DFFSR \keyOutR_reg[2]  ( .D(keyNext[61]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(keyOutR[2]) );
  DFFSR \keyOutR_reg[1]  ( .D(keyNext[62]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(keyOutR[1]) );
  DFFSR \right_reg[0]  ( .D(nxtright[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        subkey[8]) );
  DFFSR \right_reg[2]  ( .D(nxtright[2]), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        right_2) );
  DFFSR \right_reg[4]  ( .D(nxtright[4]), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        subkey[22]) );
  DFFSR \right_reg[6]  ( .D(nxtright[6]), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        subkey[3]) );
  DFFSR \right_reg[8]  ( .D(nxtright[8]), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        subkey[12]) );
  DFFSR \right_reg[9]  ( .D(nxtright[9]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        subkey[19]) );
  DFFSR \right_reg[10]  ( .D(nxtright[10]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(subkey[5]) );
  DFFSR \right_reg[11]  ( .D(nxtright[11]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(subkey[14]) );
  DFFSR \right_reg[12]  ( .D(n334), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        subkey[11]) );
  DFFSR \right_reg[13]  ( .D(nxtright[13]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(right_13) );
  DFFSR \right_reg[14]  ( .D(nxtright[14]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(subkey[4]) );
  DFFSR \right_reg[15]  ( .D(nxtright[15]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(subkey[23]) );
  DFFSR \right_reg[16]  ( .D(nxtright[16]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(subkey[16]) );
  DFFSR \right_reg[17]  ( .D(nxtright[17]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(subkey[9]) );
  DFFSR \right_reg[18]  ( .D(nxtright[18]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(right_18) );
  DFFSR \right_reg[19]  ( .D(nxtright[19]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(subkey[20]) );
  DFFSR \right_reg[20]  ( .D(nxtright[20]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(subkey[2]) );
  DFFSR \right_reg[21]  ( .D(nxtright[21]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(\right[21] ) );
  DFFSR \right_reg[22]  ( .D(nxtright[22]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(subkey[7]) );
  DFFSR \right_reg[23]  ( .D(nxtright[23]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(subkey[13]) );
  DFFSR \right_reg[24]  ( .D(nxtright[24]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(subkey[0]) );
  DFFSR \right_reg[25]  ( .D(nxtright[25]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(subkey[21]) );
  DFFSR \right_reg[26]  ( .D(nxtright[26]), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(subkey[17]) );
  DFFSR \right_reg[27]  ( .D(nxtright[27]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\subkey[27] ) );
  DFFSR \right_reg[1]  ( .D(nxtright[1]), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        subkey[18]) );
  DFFSR \right_reg[3]  ( .D(nxtright[3]), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        subkey[6]) );
  DFFSR \right_reg[5]  ( .D(nxtright[5]), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        subkey[15]) );
  DFFSR \right_reg[7]  ( .D(nxtright[7]), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        subkey[10]) );
  NAND2X1 U33 ( .A(n263), .B(n149), .Y(n147) );
  INVX4 U63 ( .A(n147), .Y(n148) );
  INVX2 U66 ( .A(n157), .Y(n149) );
  BUFX4 U71 ( .A(n156), .Y(n150) );
  INVX4 U74 ( .A(n331), .Y(n151) );
  INVX2 U82 ( .A(key_rollover), .Y(n278) );
  INVX4 U86 ( .A(n162), .Y(n157) );
  BUFX4 U87 ( .A(n155), .Y(n152) );
  NAND2X1 U92 ( .A(n153), .B(n154), .Y(nxtright[9]) );
  AOI22X1 U95 ( .A(keyOutR_19), .B(n152), .C(keyOut[19]), .D(n150), .Y(n154)
         );
  AOI22X1 U96 ( .A(subkey[10]), .B(n148), .C(subkey[12]), .D(n157), .Y(n153)
         );
  NAND2X1 U101 ( .A(n158), .B(n159), .Y(nxtright[8]) );
  AOI22X1 U109 ( .A(keyOutR_27), .B(n152), .C(keyOut[27]), .D(n150), .Y(n159)
         );
  AOI22X1 U113 ( .A(subkey[3]), .B(n148), .C(n157), .D(subkey[10]), .Y(n158)
         );
  NAND2X1 U116 ( .A(n160), .B(n161), .Y(nxtright[7]) );
  AOI22X1 U120 ( .A(keyOutR_35), .B(n152), .C(keyOut[35]), .D(n150), .Y(n161)
         );
  AOI22X1 U122 ( .A(subkey[15]), .B(n148), .C(subkey[3]), .D(n157), .Y(n160)
         );
  OAI21X1 U129 ( .A(n149), .B(n163), .C(n164), .Y(nxtright[6]) );
  AOI22X1 U135 ( .A(keyOut[43]), .B(n150), .C(subkey[22]), .D(n148), .Y(n164)
         );
  INVX1 U137 ( .A(subkey[15]), .Y(n163) );
  NAND2X1 U146 ( .A(n165), .B(n166), .Y(nxtright[5]) );
  AOI22X1 U147 ( .A(keyOutR_51), .B(n152), .C(keyOut[51]), .D(n150), .Y(n166)
         );
  AOI22X1 U151 ( .A(subkey[6]), .B(n148), .C(subkey[22]), .D(n157), .Y(n165)
         );
  NAND2X1 U152 ( .A(n167), .B(n168), .Y(nxtright[4]) );
  AOI22X1 U161 ( .A(keyOutR_59), .B(n152), .C(keyOut[59]), .D(n150), .Y(n168)
         );
  AOI22X1 U164 ( .A(right_2), .B(n148), .C(subkey[6]), .D(n157), .Y(n167) );
  NAND2X1 U169 ( .A(n169), .B(n170), .Y(nxtright[3]) );
  AOI22X1 U172 ( .A(keyOutR_36), .B(n152), .C(keyOut[36]), .D(n150), .Y(n170)
         );
  AOI22X1 U174 ( .A(subkey[18]), .B(n148), .C(right_2), .D(n157), .Y(n169) );
  NAND2X1 U178 ( .A(n171), .B(n172), .Y(nxtright[2]) );
  AOI22X1 U179 ( .A(keyOutR_44), .B(n152), .C(keyOut[44]), .D(n150), .Y(n172)
         );
  AOI22X1 U180 ( .A(subkey[8]), .B(n148), .C(subkey[18]), .D(n157), .Y(n171)
         );
  OAI21X1 U181 ( .A(n149), .B(n173), .C(n174), .Y(nxtright[27]) );
  AOI22X1 U182 ( .A(keyOutR[1]), .B(n152), .C(subkey[21]), .D(n148), .Y(n174)
         );
  INVX1 U183 ( .A(subkey[17]), .Y(n173) );
  NAND2X1 U184 ( .A(n175), .B(n176), .Y(nxtright[26]) );
  AOI22X1 U185 ( .A(keyOutR[9]), .B(n152), .C(keyOut[9]), .D(n150), .Y(n176)
         );
  AOI22X1 U186 ( .A(subkey[0]), .B(n148), .C(subkey[21]), .D(n157), .Y(n175)
         );
  NAND2X1 U187 ( .A(n177), .B(n178), .Y(nxtright[25]) );
  AOI22X1 U188 ( .A(keyOutR[17]), .B(n152), .C(keyOut[17]), .D(n150), .Y(n178)
         );
  AOI22X1 U189 ( .A(subkey[13]), .B(n148), .C(subkey[0]), .D(n157), .Y(n177)
         );
  OAI21X1 U190 ( .A(n149), .B(n179), .C(n180), .Y(nxtright[24]) );
  AOI22X1 U191 ( .A(keyOut[25]), .B(n150), .C(subkey[7]), .D(n148), .Y(n180)
         );
  INVX1 U192 ( .A(subkey[13]), .Y(n179) );
  OAI21X1 U193 ( .A(n149), .B(n181), .C(n182), .Y(nxtright[23]) );
  AOI22X1 U194 ( .A(keyOutR_33), .B(n152), .C(\right[21] ), .D(n148), .Y(n182)
         );
  INVX1 U195 ( .A(subkey[7]), .Y(n181) );
  OAI21X1 U196 ( .A(n149), .B(n183), .C(n184), .Y(nxtright[22]) );
  AOI22X1 U197 ( .A(keyOut[41]), .B(n150), .C(subkey[2]), .D(n148), .Y(n184)
         );
  INVX1 U198 ( .A(\right[21] ), .Y(n183) );
  OAI21X1 U199 ( .A(n149), .B(n185), .C(n186), .Y(nxtright[21]) );
  AOI22X1 U200 ( .A(keyOut[49]), .B(n150), .C(subkey[20]), .D(n148), .Y(n186)
         );
  INVX1 U201 ( .A(subkey[2]), .Y(n185) );
  NAND2X1 U202 ( .A(n187), .B(n188), .Y(nxtright[20]) );
  AOI22X1 U203 ( .A(keyOutR_57), .B(n152), .C(keyOut[57]), .D(n150), .Y(n188)
         );
  AOI22X1 U204 ( .A(right_18), .B(n148), .C(subkey[20]), .D(n157), .Y(n187) );
  NAND2X1 U205 ( .A(n189), .B(n190), .Y(nxtright[1]) );
  AOI22X1 U206 ( .A(keyOutR_52), .B(n152), .C(keyOut[52]), .D(n150), .Y(n190)
         );
  AOI22X1 U207 ( .A(\subkey[27] ), .B(n148), .C(subkey[8]), .D(n157), .Y(n189)
         );
  NAND2X1 U208 ( .A(n191), .B(n192), .Y(nxtright[19]) );
  AOI22X1 U209 ( .A(keyOutR[2]), .B(n152), .C(keyOut[2]), .D(n150), .Y(n192)
         );
  AOI22X1 U210 ( .A(subkey[9]), .B(n148), .C(right_18), .D(n157), .Y(n191) );
  NAND2X1 U211 ( .A(n193), .B(n194), .Y(nxtright[18]) );
  AOI22X1 U212 ( .A(keyOutR[10]), .B(n152), .C(keyOut[10]), .D(n150), .Y(n194)
         );
  AOI22X1 U213 ( .A(subkey[16]), .B(n148), .C(subkey[9]), .D(n157), .Y(n193)
         );
  OAI21X1 U214 ( .A(n149), .B(n195), .C(n196), .Y(nxtright[17]) );
  AOI22X1 U215 ( .A(keyOut[8]), .B(n150), .C(subkey[23]), .D(n148), .Y(n196)
         );
  INVX1 U216 ( .A(subkey[16]), .Y(n195) );
  OAI21X1 U217 ( .A(n149), .B(n197), .C(n198), .Y(nxtright[16]) );
  AOI22X1 U218 ( .A(keyOut[16]), .B(n150), .C(subkey[4]), .D(n148), .Y(n198)
         );
  INVX1 U219 ( .A(subkey[23]), .Y(n197) );
  NAND2X1 U220 ( .A(n199), .B(n200), .Y(nxtright[15]) );
  AOI22X1 U221 ( .A(keyOutR_24), .B(n152), .C(keyOut[24]), .D(n150), .Y(n200)
         );
  AOI22X1 U222 ( .A(right_13), .B(n148), .C(subkey[4]), .D(n157), .Y(n199) );
  OAI21X1 U223 ( .A(n149), .B(n201), .C(n202), .Y(nxtright[14]) );
  AOI22X1 U224 ( .A(keyOutR_32), .B(n152), .C(subkey[11]), .D(n148), .Y(n202)
         );
  INVX1 U225 ( .A(right_13), .Y(n201) );
  OAI21X1 U226 ( .A(n149), .B(n203), .C(n204), .Y(nxtright[13]) );
  AOI22X1 U227 ( .A(keyOutR_50), .B(n152), .C(subkey[14]), .D(n148), .Y(n204)
         );
  INVX1 U228 ( .A(subkey[11]), .Y(n203) );
  OAI21X1 U229 ( .A(n149), .B(n205), .C(n206), .Y(nxtright[11]) );
  AOI22X1 U230 ( .A(keyOut[3]), .B(n150), .C(subkey[19]), .D(n148), .Y(n206)
         );
  INVX1 U231 ( .A(subkey[5]), .Y(n205) );
  NAND2X1 U232 ( .A(n207), .B(n208), .Y(nxtright[10]) );
  AOI22X1 U233 ( .A(keyOutR[11]), .B(n152), .C(keyOut[11]), .D(n150), .Y(n208)
         );
  AOI22X1 U234 ( .A(subkey[12]), .B(n148), .C(subkey[19]), .D(n157), .Y(n207)
         );
  OAI21X1 U235 ( .A(n149), .B(n209), .C(n210), .Y(nxtright[0]) );
  AOI22X1 U236 ( .A(keyOutR_60), .B(n152), .C(subkey[17]), .D(n148), .Y(n210)
         );
  INVX1 U237 ( .A(\subkey[27] ), .Y(n209) );
  NAND2X1 U238 ( .A(n211), .B(n212), .Y(nxtleft[9]) );
  AOI22X1 U239 ( .A(keyOutR_21), .B(n152), .C(keyOut[21]), .D(n150), .Y(n212)
         );
  AOI22X1 U240 ( .A(subkey[37]), .B(n148), .C(subkey[26]), .D(n157), .Y(n211)
         );
  NAND2X1 U241 ( .A(n213), .B(n214), .Y(nxtleft[8]) );
  AOI22X1 U242 ( .A(keyOutR_29), .B(n152), .C(keyOut[29]), .D(n150), .Y(n214)
         );
  AOI22X1 U243 ( .A(left_6), .B(n148), .C(subkey[37]), .D(n157), .Y(n213) );
  NAND2X1 U244 ( .A(n215), .B(n216), .Y(nxtleft[6]) );
  AOI22X1 U245 ( .A(keyOutR_45), .B(n152), .C(keyOut[45]), .D(n150), .Y(n216)
         );
  AOI22X1 U246 ( .A(subkey[44]), .B(n148), .C(subkey[35]), .D(n157), .Y(n215)
         );
  NAND2X1 U247 ( .A(n217), .B(n218), .Y(nxtleft[5]) );
  AOI22X1 U248 ( .A(keyOutR_53), .B(n152), .C(keyOut[53]), .D(n150), .Y(n218)
         );
  AOI22X1 U249 ( .A(left_3), .B(n148), .C(subkey[44]), .D(n157), .Y(n217) );
  NAND2X1 U250 ( .A(n219), .B(n220), .Y(nxtleft[4]) );
  AOI22X1 U251 ( .A(keyOutR_61), .B(n152), .C(keyOut[61]), .D(n150), .Y(n220)
         );
  AOI22X1 U252 ( .A(subkey[31]), .B(n148), .C(left_3), .D(n157), .Y(n219) );
  NAND2X1 U253 ( .A(n221), .B(n222), .Y(nxtleft[3]) );
  AOI22X1 U254 ( .A(keyOutR[4]), .B(n152), .C(keyOut[4]), .D(n150), .Y(n222)
         );
  AOI22X1 U255 ( .A(left_1), .B(n148), .C(subkey[31]), .D(n157), .Y(n221) );
  NAND2X1 U256 ( .A(n223), .B(n224), .Y(nxtleft[2]) );
  AOI22X1 U257 ( .A(keyOutR[12]), .B(n152), .C(keyOut[12]), .D(n150), .Y(n224)
         );
  AOI22X1 U258 ( .A(subkey[40]), .B(n148), .C(left_1), .D(n157), .Y(n223) );
  OAI21X1 U259 ( .A(n149), .B(n225), .C(n226), .Y(nxtleft[27]) );
  AOI22X1 U260 ( .A(keyOutR[7]), .B(n152), .C(subkey[41]), .D(n148), .Y(n226)
         );
  INVX1 U261 ( .A(subkey[24]), .Y(n225) );
  NAND2X1 U262 ( .A(n227), .B(n228), .Y(nxtleft[26]) );
  AOI22X1 U263 ( .A(keyOutR[15]), .B(n152), .C(keyOut[15]), .D(n150), .Y(n228)
         );
  AOI22X1 U264 ( .A(subkey[32]), .B(n148), .C(subkey[41]), .D(n157), .Y(n227)
         );
  NAND2X1 U265 ( .A(n229), .B(n230), .Y(nxtleft[25]) );
  AOI22X1 U266 ( .A(keyOutR_23), .B(n152), .C(keyOut[23]), .D(n150), .Y(n230)
         );
  AOI22X1 U267 ( .A(subkey[42]), .B(n148), .C(subkey[32]), .D(n157), .Y(n229)
         );
  OAI21X1 U268 ( .A(n149), .B(n231), .C(n232), .Y(nxtleft[24]) );
  AOI22X1 U269 ( .A(keyOut[31]), .B(n150), .C(subkey[38]), .D(n148), .Y(n232)
         );
  INVX1 U270 ( .A(subkey[42]), .Y(n231) );
  NAND2X1 U271 ( .A(n233), .B(n234), .Y(nxtleft[23]) );
  AOI22X1 U272 ( .A(keyOutR_39), .B(n152), .C(keyOut[39]), .D(n150), .Y(n234)
         );
  AOI22X1 U273 ( .A(subkey[28]), .B(n148), .C(subkey[38]), .D(n157), .Y(n233)
         );
  OAI21X1 U274 ( .A(n162), .B(n235), .C(n236), .Y(nxtleft[22]) );
  AOI22X1 U275 ( .A(keyOutR_47), .B(n152), .C(subkey[30]), .D(n148), .Y(n236)
         );
  INVX1 U276 ( .A(subkey[28]), .Y(n235) );
  OAI21X1 U277 ( .A(n162), .B(n237), .C(n238), .Y(nxtleft[21]) );
  AOI22X1 U278 ( .A(keyOutR_55), .B(n152), .C(\left[19] ), .D(n148), .Y(n238)
         );
  INVX1 U279 ( .A(subkey[30]), .Y(n237) );
  NAND2X1 U280 ( .A(n239), .B(n240), .Y(nxtleft[20]) );
  AOI22X1 U281 ( .A(keyOutR_63), .B(n152), .C(keyOut[63]), .D(n150), .Y(n240)
         );
  AOI22X1 U282 ( .A(subkey[36]), .B(n148), .C(\left[19] ), .D(n157), .Y(n239)
         );
  OAI21X1 U283 ( .A(n162), .B(n241), .C(n242), .Y(nxtleft[1]) );
  AOI22X1 U284 ( .A(keyOutR_20), .B(n152), .C(subkey[43]), .D(n148), .Y(n242)
         );
  INVX1 U285 ( .A(subkey[40]), .Y(n241) );
  NAND2X1 U286 ( .A(n243), .B(n244), .Y(nxtleft[19]) );
  AOI22X1 U287 ( .A(keyOutR[6]), .B(n152), .C(keyOut[6]), .D(n150), .Y(n244)
         );
  AOI22X1 U288 ( .A(subkey[45]), .B(n148), .C(subkey[36]), .D(n157), .Y(n243)
         );
  OAI21X1 U289 ( .A(n162), .B(n245), .C(n246), .Y(nxtleft[18]) );
  AOI22X1 U290 ( .A(keyOutR[14]), .B(n152), .C(subkey[33]), .D(n148), .Y(n246)
         );
  INVX1 U291 ( .A(subkey[45]), .Y(n245) );
  OAI21X1 U292 ( .A(n162), .B(n247), .C(n248), .Y(nxtleft[17]) );
  AOI22X1 U293 ( .A(keyOutR_22), .B(n152), .C(subkey[25]), .D(n148), .Y(n248)
         );
  INVX1 U294 ( .A(subkey[33]), .Y(n247) );
  OAI21X1 U295 ( .A(n162), .B(n249), .C(n250), .Y(nxtleft[16]) );
  AOI22X1 U296 ( .A(keyOut[30]), .B(n150), .C(subkey[47]), .D(n148), .Y(n250)
         );
  INVX1 U297 ( .A(subkey[25]), .Y(n249) );
  OAI21X1 U298 ( .A(n162), .B(n251), .C(n252), .Y(nxtleft[15]) );
  AOI22X1 U299 ( .A(keyOutR_38), .B(n152), .C(subkey[39]), .D(n148), .Y(n252)
         );
  INVX1 U300 ( .A(subkey[47]), .Y(n251) );
  NAND2X1 U301 ( .A(n253), .B(n254), .Y(nxtleft[14]) );
  AOI22X1 U302 ( .A(keyOutR_46), .B(n152), .C(keyOut[46]), .D(n150), .Y(n254)
         );
  AOI22X1 U303 ( .A(subkey[29]), .B(n148), .C(subkey[39]), .D(n157), .Y(n253)
         );
  NAND2X1 U304 ( .A(n255), .B(n256), .Y(nxtleft[13]) );
  AOI22X1 U305 ( .A(keyOutR_54), .B(n152), .C(keyOut[54]), .D(n150), .Y(n256)
         );
  AOI22X1 U306 ( .A(subkey[46]), .B(n148), .C(subkey[29]), .D(n157), .Y(n255)
         );
  OAI21X1 U307 ( .A(n162), .B(n257), .C(n258), .Y(nxtleft[12]) );
  AOI22X1 U308 ( .A(keyOut[62]), .B(n150), .C(left_10), .D(n148), .Y(n258) );
  INVX1 U309 ( .A(subkey[46]), .Y(n257) );
  OAI21X1 U310 ( .A(n162), .B(n259), .C(n260), .Y(nxtleft[10]) );
  AOI22X1 U311 ( .A(keyOut[13]), .B(n150), .C(subkey[26]), .D(n148), .Y(n260)
         );
  INVX1 U312 ( .A(subkey[34]), .Y(n259) );
  NAND2X1 U313 ( .A(n261), .B(n262), .Y(nxtleft[0]) );
  AOI22X1 U314 ( .A(keyOutR_28), .B(n152), .C(keyOut[28]), .D(n150), .Y(n262)
         );
  NOR2X1 U315 ( .A(n263), .B(reverse), .Y(n156) );
  NOR2X1 U316 ( .A(n264), .B(n263), .Y(n155) );
  INVX1 U317 ( .A(reverse), .Y(n264) );
  AOI22X1 U318 ( .A(subkey[24]), .B(n148), .C(subkey[43]), .D(n157), .Y(n261)
         );
  INVX1 U319 ( .A(n265), .Y(n332) );
  AOI22X1 U320 ( .A(n157), .B(left_10), .C(n148), .D(subkey[34]), .Y(n265) );
  INVX1 U321 ( .A(n266), .Y(n333) );
  AOI22X1 U322 ( .A(n157), .B(left_6), .C(n148), .D(subkey[35]), .Y(n266) );
  INVX1 U323 ( .A(n267), .Y(n334) );
  AOI22X1 U324 ( .A(n157), .B(subkey[14]), .C(n148), .D(subkey[5]), .Y(n267)
         );
  NAND3X1 U325 ( .A(n268), .B(n269), .C(n270), .Y(n263) );
  NOR2X1 U326 ( .A(round_count[1]), .B(round_count[0]), .Y(n270) );
  NOR2X1 U327 ( .A(round_count[4]), .B(round_count[3]), .Y(n268) );
  NAND2X1 U328 ( .A(n271), .B(n269), .Y(n162) );
  INVX1 U329 ( .A(round_count[2]), .Y(n269) );
  MUX2X1 U330 ( .B(n272), .A(n273), .S(round_count[0]), .Y(n271) );
  OR2X1 U331 ( .A(round_count[1]), .B(round_count[4]), .Y(n273) );
  NAND2X1 U332 ( .A(n274), .B(n275), .Y(n272) );
  INVX1 U333 ( .A(round_count[3]), .Y(n275) );
  XOR2X1 U334 ( .A(round_count[4]), .B(round_count[1]), .Y(n274) );
  OAI21X1 U335 ( .A(n276), .B(n151), .C(n278), .Y(keyNext[9]) );
  INVX1 U336 ( .A(keyOut[9]), .Y(n276) );
  OAI21X1 U337 ( .A(n279), .B(n151), .C(n280), .Y(keyNext[8]) );
  INVX1 U338 ( .A(keyOut[8]), .Y(n279) );
  OAI21X1 U339 ( .A(n281), .B(n151), .C(n282), .Y(keyNext[6]) );
  INVX1 U340 ( .A(keyOut[6]), .Y(n281) );
  OAI21X1 U341 ( .A(n283), .B(n151), .C(n278), .Y(keyNext[63]) );
  INVX1 U342 ( .A(keyOut[63]), .Y(n283) );
  OAI21X1 U343 ( .A(n284), .B(n151), .C(n278), .Y(keyNext[62]) );
  INVX1 U344 ( .A(keyOut[62]), .Y(n284) );
  OAI21X1 U345 ( .A(n285), .B(n151), .C(n280), .Y(keyNext[61]) );
  INVX1 U346 ( .A(keyOut[61]), .Y(n285) );
  OAI21X1 U347 ( .A(n286), .B(n151), .C(n278), .Y(keyNext[59]) );
  INVX1 U348 ( .A(keyOut[59]), .Y(n286) );
  OAI21X1 U349 ( .A(n287), .B(n151), .C(n278), .Y(keyNext[57]) );
  INVX1 U350 ( .A(keyOut[57]), .Y(n287) );
  OAI21X1 U351 ( .A(n151), .B(n288), .C(n280), .Y(keyNext[56]) );
  INVX1 U352 ( .A(keyOut[56]), .Y(n288) );
  OAI21X1 U353 ( .A(n289), .B(n151), .C(n280), .Y(keyNext[54]) );
  INVX1 U354 ( .A(keyOut[54]), .Y(n289) );
  OAI21X1 U355 ( .A(n290), .B(n151), .C(n282), .Y(keyNext[53]) );
  INVX1 U356 ( .A(keyOut[53]), .Y(n290) );
  OAI21X1 U357 ( .A(n291), .B(n151), .C(n282), .Y(keyNext[52]) );
  INVX1 U358 ( .A(keyOut[52]), .Y(n291) );
  OAI21X1 U359 ( .A(n292), .B(n151), .C(n278), .Y(keyNext[51]) );
  INVX1 U360 ( .A(keyOut[51]), .Y(n292) );
  OAI21X1 U361 ( .A(n293), .B(n151), .C(n282), .Y(keyNext[4]) );
  INVX1 U362 ( .A(keyOut[4]), .Y(n293) );
  OAI21X1 U363 ( .A(n294), .B(n151), .C(n282), .Y(keyNext[49]) );
  INVX1 U364 ( .A(keyOut[49]), .Y(n294) );
  OAI21X1 U365 ( .A(n151), .B(n295), .C(n280), .Y(keyNext[48]) );
  INVX1 U366 ( .A(keyOut[48]), .Y(n295) );
  OAI21X1 U367 ( .A(n296), .B(n151), .C(n280), .Y(keyNext[46]) );
  INVX1 U368 ( .A(keyOut[46]), .Y(n296) );
  OAI21X1 U369 ( .A(n297), .B(n151), .C(n278), .Y(keyNext[45]) );
  INVX1 U370 ( .A(keyOut[45]), .Y(n297) );
  OAI21X1 U371 ( .A(n298), .B(n151), .C(n282), .Y(keyNext[44]) );
  INVX1 U372 ( .A(keyOut[44]), .Y(n298) );
  OAI21X1 U373 ( .A(n299), .B(n151), .C(n278), .Y(keyNext[43]) );
  INVX1 U374 ( .A(keyOut[43]), .Y(n299) );
  OAI21X1 U375 ( .A(n151), .B(n300), .C(n282), .Y(keyNext[42]) );
  INVX1 U376 ( .A(keyOut[42]), .Y(n300) );
  OAI21X1 U377 ( .A(n301), .B(n151), .C(n278), .Y(keyNext[41]) );
  INVX1 U378 ( .A(keyOut[41]), .Y(n301) );
  OAI21X1 U379 ( .A(n151), .B(n302), .C(n280), .Y(keyNext[40]) );
  INVX1 U380 ( .A(keyOut[40]), .Y(n302) );
  OAI21X1 U381 ( .A(n303), .B(n151), .C(n282), .Y(keyNext[3]) );
  INVX1 U382 ( .A(keyOut[3]), .Y(n303) );
  OAI21X1 U383 ( .A(n304), .B(n151), .C(n278), .Y(keyNext[39]) );
  INVX1 U384 ( .A(keyOut[39]), .Y(n304) );
  OAI21X1 U385 ( .A(n305), .B(n151), .C(n282), .Y(keyNext[36]) );
  INVX1 U386 ( .A(keyOut[36]), .Y(n305) );
  OAI21X1 U387 ( .A(n306), .B(n151), .C(n278), .Y(keyNext[35]) );
  INVX1 U388 ( .A(keyOut[35]), .Y(n306) );
  OAI21X1 U389 ( .A(n151), .B(n307), .C(n280), .Y(keyNext[34]) );
  INVX1 U390 ( .A(keyOut[34]), .Y(n307) );
  OAI21X1 U391 ( .A(n308), .B(n151), .C(n278), .Y(keyNext[31]) );
  INVX1 U392 ( .A(keyOut[31]), .Y(n308) );
  OAI21X1 U393 ( .A(n309), .B(n151), .C(n280), .Y(keyNext[30]) );
  INVX1 U394 ( .A(keyOut[30]), .Y(n309) );
  OAI21X1 U395 ( .A(n310), .B(n151), .C(n280), .Y(keyNext[2]) );
  INVX1 U396 ( .A(keyOut[2]), .Y(n310) );
  OAI21X1 U397 ( .A(n311), .B(n151), .C(n280), .Y(keyNext[29]) );
  INVX1 U398 ( .A(keyOut[29]), .Y(n311) );
  OAI21X1 U399 ( .A(n312), .B(n151), .C(n278), .Y(keyNext[28]) );
  INVX1 U400 ( .A(keyOut[28]), .Y(n312) );
  OAI21X1 U401 ( .A(n313), .B(n151), .C(n278), .Y(keyNext[27]) );
  INVX1 U402 ( .A(keyOut[27]), .Y(n313) );
  OAI21X1 U403 ( .A(n314), .B(n151), .C(n282), .Y(keyNext[25]) );
  INVX1 U404 ( .A(keyOut[25]), .Y(n314) );
  OAI21X1 U405 ( .A(n315), .B(n151), .C(n280), .Y(keyNext[24]) );
  INVX1 U406 ( .A(keyOut[24]), .Y(n315) );
  OAI21X1 U407 ( .A(n316), .B(n151), .C(n278), .Y(keyNext[23]) );
  INVX1 U408 ( .A(keyOut[23]), .Y(n316) );
  OAI21X1 U409 ( .A(n317), .B(n151), .C(n282), .Y(keyNext[21]) );
  INVX1 U410 ( .A(keyOut[21]), .Y(n317) );
  OAI21X1 U411 ( .A(n318), .B(n277), .C(n280), .Y(keyNext[19]) );
  INVX1 U412 ( .A(keyOut[19]), .Y(n318) );
  OAI21X1 U413 ( .A(n151), .B(n319), .C(n282), .Y(keyNext[18]) );
  INVX1 U414 ( .A(keyOut[18]), .Y(n319) );
  OAI21X1 U415 ( .A(n320), .B(n277), .C(n278), .Y(keyNext[17]) );
  INVX1 U416 ( .A(keyOut[17]), .Y(n320) );
  OAI21X1 U417 ( .A(n321), .B(n277), .C(n282), .Y(keyNext[16]) );
  INVX1 U418 ( .A(keyOut[16]), .Y(n321) );
  OAI21X1 U419 ( .A(n322), .B(n277), .C(n278), .Y(keyNext[15]) );
  INVX1 U420 ( .A(keyOut[15]), .Y(n322) );
  OAI21X1 U421 ( .A(n323), .B(n277), .C(n278), .Y(keyNext[13]) );
  INVX1 U422 ( .A(keyOut[13]), .Y(n323) );
  OAI21X1 U423 ( .A(n324), .B(n277), .C(n280), .Y(keyNext[12]) );
  INVX1 U424 ( .A(keyOut[12]), .Y(n324) );
  OAI21X1 U425 ( .A(n325), .B(n277), .C(n278), .Y(keyNext[11]) );
  INVX1 U426 ( .A(keyOut[11]), .Y(n325) );
  OAI21X1 U427 ( .A(n326), .B(n277), .C(n282), .Y(keyNext[10]) );
  AND2X1 U428 ( .A(n280), .B(n278), .Y(n282) );
  NAND3X1 U429 ( .A(key_count[0]), .B(cnt_rollover), .C(n327), .Y(n280) );
  NOR2X1 U430 ( .A(key_rollover), .B(key_count[1]), .Y(n327) );
  INVX1 U431 ( .A(keyOut[10]), .Y(n326) );
  OAI21X1 U432 ( .A(n328), .B(n329), .C(n330), .Y(keyNext[0]) );
  NAND2X1 U433 ( .A(keyOut[0]), .B(n331), .Y(n330) );
  INVX1 U434 ( .A(n277), .Y(n331) );
  OAI21X1 U435 ( .A(key_count[1]), .B(n328), .C(n278), .Y(n277) );
  OR2X1 U436 ( .A(key_count[1]), .B(key_rollover), .Y(n329) );
  INVX1 U437 ( .A(cnt_rollover), .Y(n328) );
endmodule


module key_counter ( clk, n_rst, count_enable, key_count, key_rollover );
  output [1:0] key_count;
  input clk, n_rst, count_enable;
  output key_rollover;
  wire   n7, n8, n3, n4, n5;
  assign key_count[1] = 1'b0;

  DFFSR \key_count_reg[0]  ( .D(n8), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        key_count[0]) );
  DFFSR key_rollover_reg ( .D(n7), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        key_rollover) );
  MUX2X1 U6 ( .B(n3), .A(count_enable), .S(key_count[0]), .Y(n8) );
  NAND2X1 U7 ( .A(count_enable), .B(n4), .Y(n3) );
  INVX1 U8 ( .A(key_rollover), .Y(n4) );
  INVX1 U9 ( .A(n5), .Y(n7) );
  AOI21X1 U10 ( .A(key_count[0]), .B(count_enable), .C(key_rollover), .Y(n5)
         );
endmodule


module round_counter ( clk, n_rst, count_enable, round_count, cnt_rollover );
  output [4:0] round_count;
  input clk, n_rst, count_enable;
  output cnt_rollover;
  wire   n22, n23, n24, n25, n26, n27, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n28, n29, n30, n31, n32, n33;

  DFFSR \round_count_reg[0]  ( .D(n27), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        round_count[0]) );
  DFFSR \round_count_reg[4]  ( .D(n23), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        round_count[4]) );
  DFFSR cnt_rollover_reg ( .D(n22), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        cnt_rollover) );
  DFFSR \round_count_reg[3]  ( .D(n24), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        round_count[3]) );
  DFFSR \round_count_reg[2]  ( .D(n25), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        round_count[2]) );
  DFFSR \round_count_reg[1]  ( .D(n26), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        round_count[1]) );
  OAI21X1 U9 ( .A(count_enable), .B(n7), .C(n8), .Y(n27) );
  OAI21X1 U10 ( .A(count_enable), .B(n9), .C(n10), .Y(n26) );
  OAI21X1 U11 ( .A(count_enable), .B(n11), .C(n12), .Y(n25) );
  OAI21X1 U12 ( .A(count_enable), .B(n13), .C(n14), .Y(n24) );
  OAI21X1 U13 ( .A(count_enable), .B(n15), .C(n16), .Y(n23) );
  OAI21X1 U14 ( .A(n17), .B(n18), .C(n19), .Y(n22) );
  NAND2X1 U15 ( .A(n20), .B(n14), .Y(n18) );
  NAND2X1 U16 ( .A(n21), .B(n28), .Y(n14) );
  XNOR2X1 U17 ( .A(round_count[3]), .B(n29), .Y(n28) );
  INVX1 U18 ( .A(n16), .Y(n20) );
  NAND2X1 U19 ( .A(n21), .B(n30), .Y(n16) );
  XNOR2X1 U20 ( .A(n15), .B(n31), .Y(n30) );
  NOR2X1 U21 ( .A(n13), .B(n29), .Y(n31) );
  INVX1 U22 ( .A(round_count[3]), .Y(n13) );
  INVX1 U23 ( .A(round_count[4]), .Y(n15) );
  NAND3X1 U24 ( .A(n10), .B(n8), .C(n12), .Y(n17) );
  NAND3X1 U25 ( .A(n32), .B(n29), .C(n21), .Y(n12) );
  NAND3X1 U26 ( .A(round_count[1]), .B(round_count[0]), .C(round_count[2]), 
        .Y(n29) );
  OAI21X1 U27 ( .A(n7), .B(n9), .C(n11), .Y(n32) );
  INVX1 U28 ( .A(round_count[2]), .Y(n11) );
  NAND2X1 U29 ( .A(n21), .B(n7), .Y(n8) );
  INVX1 U30 ( .A(round_count[0]), .Y(n7) );
  NAND2X1 U31 ( .A(n21), .B(n33), .Y(n10) );
  XNOR2X1 U32 ( .A(n9), .B(round_count[0]), .Y(n33) );
  INVX1 U33 ( .A(round_count[1]), .Y(n9) );
  AND2X1 U34 ( .A(count_enable), .B(n19), .Y(n21) );
  INVX1 U35 ( .A(cnt_rollover), .Y(n19) );
endmodule


module des_controller ( clk, n_rst, receive, empty, key_rollover, encrypt_sync, 
        count_enable, reverse, des_start, data_out );
  input clk, n_rst, receive, empty, key_rollover, encrypt_sync;
  output count_enable, reverse, des_start, data_out;
  wire   encrypt_sync, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31;
  wire   [3:0] state;
  wire   [3:0] nextstate;
  assign reverse = encrypt_sync;

  DFFSR \state_reg[0]  ( .D(nextstate[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[0]) );
  DFFSR \state_reg[2]  ( .D(nextstate[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[2]) );
  DFFSR \state_reg[1]  ( .D(nextstate[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[1]) );
  DFFSR \state_reg[3]  ( .D(nextstate[3]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[3]) );
  INVX8 U7 ( .A(n20), .Y(des_start) );
  OAI21X1 U8 ( .A(n5), .B(n6), .C(n7), .Y(nextstate[3]) );
  NAND2X1 U9 ( .A(state[3]), .B(n8), .Y(n7) );
  NAND3X1 U10 ( .A(n6), .B(n5), .C(empty), .Y(n8) );
  NAND3X1 U11 ( .A(n9), .B(n10), .C(n11), .Y(nextstate[2]) );
  NAND2X1 U12 ( .A(key_rollover), .B(n12), .Y(n11) );
  OAI21X1 U13 ( .A(n13), .B(n14), .C(state[2]), .Y(n9) );
  INVX1 U14 ( .A(n15), .Y(n14) );
  OAI21X1 U15 ( .A(n16), .B(n15), .C(n17), .Y(nextstate[1]) );
  NOR2X1 U16 ( .A(n18), .B(n12), .Y(n17) );
  INVX1 U17 ( .A(n19), .Y(n12) );
  NAND3X1 U18 ( .A(n19), .B(n20), .C(n21), .Y(nextstate[0]) );
  INVX1 U19 ( .A(n22), .Y(n21) );
  MUX2X1 U20 ( .B(n15), .A(n23), .S(n24), .Y(n22) );
  OAI21X1 U21 ( .A(receive), .B(state[2]), .C(n13), .Y(n23) );
  OAI21X1 U22 ( .A(state[3]), .B(n25), .C(n26), .Y(n15) );
  NOR2X1 U23 ( .A(n18), .B(count_enable), .Y(n26) );
  AND2X1 U24 ( .A(n13), .B(state[0]), .Y(n18) );
  NOR2X1 U25 ( .A(state[1]), .B(state[3]), .Y(n13) );
  INVX1 U26 ( .A(state[2]), .Y(n25) );
  NAND3X1 U27 ( .A(state[2]), .B(state[1]), .C(n27), .Y(n19) );
  NOR2X1 U28 ( .A(state[3]), .B(state[0]), .Y(n27) );
  NAND3X1 U29 ( .A(state[1]), .B(n24), .C(n28), .Y(n20) );
  INVX1 U30 ( .A(state[0]), .Y(n24) );
  INVX1 U31 ( .A(n10), .Y(count_enable) );
  NAND3X1 U32 ( .A(state[0]), .B(state[1]), .C(n28), .Y(n10) );
  NOR2X1 U33 ( .A(state[3]), .B(state[2]), .Y(n28) );
  NOR2X1 U34 ( .A(n29), .B(n30), .Y(data_out) );
  NAND2X1 U35 ( .A(n6), .B(n5), .Y(n30) );
  AOI22X1 U36 ( .A(state[1]), .B(state[0]), .C(n31), .D(state[2]), .Y(n5) );
  XNOR2X1 U37 ( .A(state[2]), .B(n31), .Y(n6) );
  XNOR2X1 U38 ( .A(state[0]), .B(n16), .Y(n31) );
  INVX1 U39 ( .A(state[1]), .Y(n16) );
  INVX1 U40 ( .A(state[3]), .Y(n29) );
endmodule


module sync_high_0 ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   N3;

  DFFSR q_reg ( .D(async_in), .CLK(clk), .R(1'b1), .S(n_rst), .Q(N3) );
  DFFSR sync_out_reg ( .D(N3), .CLK(clk), .R(1'b1), .S(n_rst), .Q(sync_out) );
endmodule


module encryptor_core ( clk, n_rst, rcv_data_ready, encrypt, handshake_ack, 
        rcv_data, trans_data, trans_data_ready );
  input [63:0] rcv_data;
  output [63:0] trans_data;
  input clk, n_rst, rcv_data_ready, encrypt, handshake_ack;
  output trans_data_ready;
  wire   des_start, reverse, cnt_rollover, key_rollover, count_enable,
         encrypt_sync;
  wire   [63:0] des_curr;
  wire   [63:0] des_in;
  wire   [47:0] subkey;
  wire   [4:0] round_count;
  wire   [1:0] key_count;
  wire   SYNOPSYS_UNCONNECTED__0;

  permutation PERMUTATION ( .rcv_data(rcv_data), .des_curr(des_curr), 
        .tx_data(trans_data), .des_in(des_in) );
  des_round_computations DES_COMP ( .clk(clk), .n_rst(n_rst), .des_start(
        des_start), .des_in(des_in), .subkey(subkey), .des_curr(des_curr) );
  key_generator KEYGEN ( .clk(clk), .n_rst(n_rst), .reverse(reverse), 
        .cnt_rollover(cnt_rollover), .key_rollover(key_rollover), 
        .round_count(round_count), .key_count({1'b0, key_count[0]}), .subkey(
        subkey) );
  key_counter KEYCNTR ( .clk(clk), .n_rst(n_rst), .count_enable(cnt_rollover), 
        .key_count({SYNOPSYS_UNCONNECTED__0, key_count[0]}), .key_rollover(
        key_rollover) );
  round_counter RNDCNTR ( .clk(clk), .n_rst(n_rst), .count_enable(count_enable), .round_count(round_count), .cnt_rollover(cnt_rollover) );
  des_controller DES_CONTROLLER ( .clk(clk), .n_rst(n_rst), .receive(
        rcv_data_ready), .empty(handshake_ack), .key_rollover(1'b0), 
        .encrypt_sync(encrypt_sync), .count_enable(count_enable), .reverse(
        reverse), .des_start(des_start), .data_out(trans_data_ready) );
  sync_high_0 ENCRYPT_SYNC ( .clk(clk), .n_rst(n_rst), .async_in(encrypt), 
        .sync_out(encrypt_sync) );
endmodule


module encode ( clk, n_rst, d_orig, idle_transmitting, eop_transmitting, 
        sync_shift_enable, pid_shift_enable, crc5_shift_enable, 
        crc16_shift_enable, data_shift_enable, d_plus, d_minus );
  input clk, n_rst, d_orig, idle_transmitting, eop_transmitting,
         sync_shift_enable, pid_shift_enable, crc5_shift_enable,
         crc16_shift_enable, data_shift_enable;
  output d_plus, d_minus;
  wire   n16, n17, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14;

  DFFSR d_minus_reg ( .D(n17), .CLK(clk), .R(n_rst), .S(1'b1), .Q(d_minus) );
  DFFSR d_plus_reg ( .D(n16), .CLK(clk), .R(1'b1), .S(n_rst), .Q(d_plus) );
  MUX2X1 U5 ( .B(n3), .A(n4), .S(d_minus), .Y(n17) );
  NAND3X1 U6 ( .A(n5), .B(n6), .C(n4), .Y(n3) );
  INVX1 U7 ( .A(eop_transmitting), .Y(n5) );
  NAND2X1 U8 ( .A(n7), .B(n6), .Y(n16) );
  INVX1 U9 ( .A(idle_transmitting), .Y(n6) );
  MUX2X1 U10 ( .B(n8), .A(n9), .S(d_plus), .Y(n7) );
  NOR2X1 U11 ( .A(eop_transmitting), .B(n9), .Y(n8) );
  INVX1 U12 ( .A(n4), .Y(n9) );
  OAI21X1 U13 ( .A(d_orig), .B(n10), .C(n11), .Y(n4) );
  NOR2X1 U14 ( .A(idle_transmitting), .B(eop_transmitting), .Y(n11) );
  AND2X1 U15 ( .A(n12), .B(n13), .Y(n10) );
  NOR2X1 U16 ( .A(data_shift_enable), .B(n14), .Y(n13) );
  OR2X1 U17 ( .A(sync_shift_enable), .B(pid_shift_enable), .Y(n14) );
  NOR2X1 U18 ( .A(crc5_shift_enable), .B(crc16_shift_enable), .Y(n12) );
endmodule


module flex_pts_sr_NUM_BITS8_SHIFT_MSB0_1 ( clk, n_rst, load_enable, 
        shift_enable, parallel_in, serial_out );
  input [7:0] parallel_in;
  input clk, n_rst, load_enable, shift_enable;
  output serial_out;
  wire   n35, n36, n37, n38, n39, n40, n41, n42, n43, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31;
  wire   [7:0] parallel_in_tmp;

  DFFSR \parallel_in_tmp_reg[7]  ( .D(n37), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[7]) );
  DFFSR \parallel_in_tmp_reg[6]  ( .D(n38), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[6]) );
  DFFSR \parallel_in_tmp_reg[5]  ( .D(n39), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[5]) );
  DFFSR \parallel_in_tmp_reg[4]  ( .D(n40), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[4]) );
  DFFSR \parallel_in_tmp_reg[3]  ( .D(n41), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[3]) );
  DFFSR \parallel_in_tmp_reg[2]  ( .D(n42), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[2]) );
  DFFSR \parallel_in_tmp_reg[1]  ( .D(n43), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[1]) );
  DFFSR \parallel_in_tmp_reg[0]  ( .D(n36), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[0]) );
  DFFSR serial_out_reg ( .D(n35), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        serial_out) );
  OAI21X1 U12 ( .A(n10), .B(n11), .C(n12), .Y(n43) );
  AOI22X1 U13 ( .A(parallel_in_tmp[1]), .B(n13), .C(parallel_in[1]), .D(n14), 
        .Y(n12) );
  INVX1 U14 ( .A(parallel_in_tmp[2]), .Y(n10) );
  OAI21X1 U15 ( .A(n11), .B(n15), .C(n16), .Y(n42) );
  AOI22X1 U16 ( .A(parallel_in_tmp[2]), .B(n13), .C(parallel_in[2]), .D(n14), 
        .Y(n16) );
  INVX1 U17 ( .A(parallel_in_tmp[3]), .Y(n15) );
  OAI21X1 U18 ( .A(n11), .B(n17), .C(n18), .Y(n41) );
  AOI22X1 U19 ( .A(parallel_in_tmp[3]), .B(n13), .C(parallel_in[3]), .D(n14), 
        .Y(n18) );
  INVX1 U20 ( .A(parallel_in_tmp[4]), .Y(n17) );
  OAI21X1 U21 ( .A(n11), .B(n19), .C(n20), .Y(n40) );
  AOI22X1 U22 ( .A(parallel_in_tmp[4]), .B(n13), .C(parallel_in[4]), .D(n14), 
        .Y(n20) );
  INVX1 U23 ( .A(parallel_in_tmp[5]), .Y(n19) );
  OAI21X1 U24 ( .A(n11), .B(n21), .C(n22), .Y(n39) );
  AOI22X1 U25 ( .A(parallel_in_tmp[5]), .B(n13), .C(parallel_in[5]), .D(n14), 
        .Y(n22) );
  INVX1 U26 ( .A(parallel_in_tmp[6]), .Y(n21) );
  OAI21X1 U27 ( .A(n11), .B(n23), .C(n24), .Y(n38) );
  AOI22X1 U28 ( .A(parallel_in_tmp[6]), .B(n13), .C(parallel_in[6]), .D(n14), 
        .Y(n24) );
  INVX1 U29 ( .A(parallel_in_tmp[7]), .Y(n23) );
  OAI21X1 U30 ( .A(n25), .B(n26), .C(n27), .Y(n37) );
  AOI21X1 U31 ( .A(parallel_in_tmp[7]), .B(n13), .C(shift_enable), .Y(n27) );
  INVX1 U32 ( .A(parallel_in[7]), .Y(n26) );
  OAI21X1 U33 ( .A(n28), .B(n11), .C(n29), .Y(n36) );
  AOI22X1 U34 ( .A(parallel_in_tmp[0]), .B(n13), .C(parallel_in[0]), .D(n14), 
        .Y(n29) );
  NOR2X1 U35 ( .A(n14), .B(shift_enable), .Y(n13) );
  INVX1 U36 ( .A(n25), .Y(n14) );
  NAND2X1 U37 ( .A(load_enable), .B(n11), .Y(n25) );
  INVX1 U38 ( .A(parallel_in_tmp[1]), .Y(n28) );
  MUX2X1 U39 ( .B(n30), .A(n31), .S(n11), .Y(n35) );
  INVX1 U40 ( .A(shift_enable), .Y(n11) );
  INVX1 U41 ( .A(serial_out), .Y(n31) );
  MUX2X1 U42 ( .B(parallel_in_tmp[0]), .A(parallel_in[0]), .S(load_enable), 
        .Y(n30) );
endmodule


module flex_pts_sr_NUM_BITS8_SHIFT_MSB0_0 ( clk, n_rst, load_enable, 
        shift_enable, parallel_in, serial_out );
  input [7:0] parallel_in;
  input clk, n_rst, load_enable, shift_enable;
  output serial_out;
  wire   n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n41, n42, n43,
         n44, n45, n46;
  wire   [7:0] parallel_in_tmp;

  DFFSR \parallel_in_tmp_reg[7]  ( .D(n44), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[7]) );
  DFFSR \parallel_in_tmp_reg[6]  ( .D(n43), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[6]) );
  DFFSR \parallel_in_tmp_reg[5]  ( .D(n42), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[5]) );
  DFFSR \parallel_in_tmp_reg[4]  ( .D(n41), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[4]) );
  DFFSR \parallel_in_tmp_reg[3]  ( .D(n34), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[3]) );
  DFFSR \parallel_in_tmp_reg[2]  ( .D(n33), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[2]) );
  DFFSR \parallel_in_tmp_reg[1]  ( .D(n32), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[1]) );
  DFFSR \parallel_in_tmp_reg[0]  ( .D(n45), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[0]) );
  DFFSR serial_out_reg ( .D(n46), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        serial_out) );
  OAI21X1 U12 ( .A(n10), .B(n11), .C(n12), .Y(n32) );
  AOI22X1 U13 ( .A(parallel_in_tmp[1]), .B(n13), .C(parallel_in[1]), .D(n14), 
        .Y(n12) );
  INVX1 U14 ( .A(parallel_in_tmp[2]), .Y(n10) );
  OAI21X1 U15 ( .A(n11), .B(n15), .C(n16), .Y(n33) );
  AOI22X1 U16 ( .A(parallel_in_tmp[2]), .B(n13), .C(parallel_in[2]), .D(n14), 
        .Y(n16) );
  INVX1 U17 ( .A(parallel_in_tmp[3]), .Y(n15) );
  OAI21X1 U18 ( .A(n11), .B(n17), .C(n18), .Y(n34) );
  AOI22X1 U19 ( .A(parallel_in_tmp[3]), .B(n13), .C(parallel_in[3]), .D(n14), 
        .Y(n18) );
  INVX1 U20 ( .A(parallel_in_tmp[4]), .Y(n17) );
  OAI21X1 U21 ( .A(n11), .B(n19), .C(n20), .Y(n41) );
  AOI22X1 U22 ( .A(parallel_in_tmp[4]), .B(n13), .C(parallel_in[4]), .D(n14), 
        .Y(n20) );
  INVX1 U23 ( .A(parallel_in_tmp[5]), .Y(n19) );
  OAI21X1 U24 ( .A(n11), .B(n21), .C(n22), .Y(n42) );
  AOI22X1 U25 ( .A(parallel_in_tmp[5]), .B(n13), .C(parallel_in[5]), .D(n14), 
        .Y(n22) );
  INVX1 U26 ( .A(parallel_in_tmp[6]), .Y(n21) );
  OAI21X1 U27 ( .A(n11), .B(n23), .C(n24), .Y(n43) );
  AOI22X1 U28 ( .A(parallel_in_tmp[6]), .B(n13), .C(parallel_in[6]), .D(n14), 
        .Y(n24) );
  INVX1 U29 ( .A(parallel_in_tmp[7]), .Y(n23) );
  OAI21X1 U30 ( .A(n25), .B(n26), .C(n27), .Y(n44) );
  AOI21X1 U31 ( .A(parallel_in_tmp[7]), .B(n13), .C(shift_enable), .Y(n27) );
  INVX1 U32 ( .A(parallel_in[7]), .Y(n26) );
  OAI21X1 U33 ( .A(n28), .B(n11), .C(n29), .Y(n45) );
  AOI22X1 U34 ( .A(parallel_in_tmp[0]), .B(n13), .C(parallel_in[0]), .D(n14), 
        .Y(n29) );
  NOR2X1 U35 ( .A(n14), .B(shift_enable), .Y(n13) );
  INVX1 U36 ( .A(n25), .Y(n14) );
  NAND2X1 U37 ( .A(load_enable), .B(n11), .Y(n25) );
  INVX1 U38 ( .A(parallel_in_tmp[1]), .Y(n28) );
  MUX2X1 U39 ( .B(n30), .A(n31), .S(n11), .Y(n46) );
  INVX1 U40 ( .A(shift_enable), .Y(n11) );
  INVX1 U41 ( .A(serial_out), .Y(n31) );
  MUX2X1 U42 ( .B(parallel_in_tmp[0]), .A(parallel_in[0]), .S(load_enable), 
        .Y(n30) );
endmodule


module flex_pts_sr_NUM_BITS5_SHIFT_MSB0 ( clk, n_rst, load_enable, 
        shift_enable, parallel_in, serial_out );
  input [4:0] parallel_in;
  input clk, n_rst, load_enable, shift_enable;
  output serial_out;
  wire   n26, n27, n28, n29, n30, n31, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22;
  wire   [4:0] parallel_in_tmp;

  DFFSR \parallel_in_tmp_reg[4]  ( .D(n28), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[4]) );
  DFFSR \parallel_in_tmp_reg[3]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[3]) );
  DFFSR \parallel_in_tmp_reg[2]  ( .D(n30), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[2]) );
  DFFSR \parallel_in_tmp_reg[1]  ( .D(n31), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[1]) );
  DFFSR \parallel_in_tmp_reg[0]  ( .D(n27), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[0]) );
  DFFSR serial_out_reg ( .D(n26), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        serial_out) );
  OAI21X1 U9 ( .A(n7), .B(n8), .C(n9), .Y(n31) );
  AOI22X1 U10 ( .A(parallel_in_tmp[1]), .B(n10), .C(parallel_in[1]), .D(n11), 
        .Y(n9) );
  INVX1 U11 ( .A(parallel_in_tmp[2]), .Y(n7) );
  OAI21X1 U12 ( .A(n8), .B(n12), .C(n13), .Y(n30) );
  AOI22X1 U13 ( .A(parallel_in_tmp[2]), .B(n10), .C(parallel_in[2]), .D(n11), 
        .Y(n13) );
  INVX1 U14 ( .A(parallel_in_tmp[3]), .Y(n12) );
  OAI21X1 U15 ( .A(n8), .B(n14), .C(n15), .Y(n29) );
  AOI22X1 U16 ( .A(parallel_in_tmp[3]), .B(n10), .C(parallel_in[3]), .D(n11), 
        .Y(n15) );
  INVX1 U17 ( .A(parallel_in_tmp[4]), .Y(n14) );
  OAI21X1 U18 ( .A(n16), .B(n17), .C(n18), .Y(n28) );
  AOI21X1 U19 ( .A(parallel_in_tmp[4]), .B(n10), .C(shift_enable), .Y(n18) );
  INVX1 U20 ( .A(parallel_in[4]), .Y(n17) );
  OAI21X1 U21 ( .A(n19), .B(n8), .C(n20), .Y(n27) );
  AOI22X1 U22 ( .A(parallel_in_tmp[0]), .B(n10), .C(parallel_in[0]), .D(n11), 
        .Y(n20) );
  NOR2X1 U23 ( .A(n11), .B(shift_enable), .Y(n10) );
  INVX1 U24 ( .A(n16), .Y(n11) );
  NAND2X1 U25 ( .A(load_enable), .B(n8), .Y(n16) );
  INVX1 U26 ( .A(parallel_in_tmp[1]), .Y(n19) );
  MUX2X1 U27 ( .B(n21), .A(n22), .S(n8), .Y(n26) );
  INVX1 U28 ( .A(shift_enable), .Y(n8) );
  INVX1 U29 ( .A(serial_out), .Y(n22) );
  MUX2X1 U30 ( .B(parallel_in_tmp[0]), .A(parallel_in[0]), .S(load_enable), 
        .Y(n21) );
endmodule


module flex_pts_sr_NUM_BITS16_SHIFT_MSB0 ( clk, n_rst, load_enable, 
        shift_enable, parallel_in, serial_out );
  input [15:0] parallel_in;
  input clk, n_rst, load_enable, shift_enable;
  output serial_out;
  wire   n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56;
  wire   [15:0] parallel_in_tmp;

  DFFSR \parallel_in_tmp_reg[15]  ( .D(n61), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[15]) );
  DFFSR \parallel_in_tmp_reg[14]  ( .D(n62), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[14]) );
  DFFSR \parallel_in_tmp_reg[13]  ( .D(n63), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[13]) );
  DFFSR \parallel_in_tmp_reg[12]  ( .D(n64), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[12]) );
  DFFSR \parallel_in_tmp_reg[11]  ( .D(n65), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[11]) );
  DFFSR \parallel_in_tmp_reg[10]  ( .D(n66), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[10]) );
  DFFSR \parallel_in_tmp_reg[9]  ( .D(n67), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[9]) );
  DFFSR \parallel_in_tmp_reg[8]  ( .D(n68), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[8]) );
  DFFSR \parallel_in_tmp_reg[7]  ( .D(n69), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[7]) );
  DFFSR \parallel_in_tmp_reg[6]  ( .D(n70), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[6]) );
  DFFSR \parallel_in_tmp_reg[5]  ( .D(n71), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[5]) );
  DFFSR \parallel_in_tmp_reg[4]  ( .D(n72), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[4]) );
  DFFSR \parallel_in_tmp_reg[3]  ( .D(n73), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[3]) );
  DFFSR \parallel_in_tmp_reg[2]  ( .D(n74), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[2]) );
  DFFSR \parallel_in_tmp_reg[1]  ( .D(n75), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[1]) );
  DFFSR \parallel_in_tmp_reg[0]  ( .D(n60), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[0]) );
  DFFSR serial_out_reg ( .D(n59), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        serial_out) );
  BUFX2 U20 ( .A(n22), .Y(n18) );
  INVX2 U21 ( .A(shift_enable), .Y(n20) );
  INVX2 U22 ( .A(n50), .Y(n23) );
  OAI21X1 U23 ( .A(n19), .B(n20), .C(n21), .Y(n75) );
  AOI22X1 U24 ( .A(parallel_in_tmp[1]), .B(n18), .C(parallel_in[1]), .D(n23), 
        .Y(n21) );
  INVX1 U25 ( .A(parallel_in_tmp[2]), .Y(n19) );
  OAI21X1 U26 ( .A(n20), .B(n24), .C(n25), .Y(n74) );
  AOI22X1 U27 ( .A(parallel_in_tmp[2]), .B(n18), .C(parallel_in[2]), .D(n23), 
        .Y(n25) );
  INVX1 U28 ( .A(parallel_in_tmp[3]), .Y(n24) );
  OAI21X1 U29 ( .A(n20), .B(n26), .C(n27), .Y(n73) );
  AOI22X1 U30 ( .A(parallel_in_tmp[3]), .B(n18), .C(parallel_in[3]), .D(n23), 
        .Y(n27) );
  INVX1 U31 ( .A(parallel_in_tmp[4]), .Y(n26) );
  OAI21X1 U32 ( .A(n20), .B(n28), .C(n29), .Y(n72) );
  AOI22X1 U33 ( .A(parallel_in_tmp[4]), .B(n18), .C(parallel_in[4]), .D(n23), 
        .Y(n29) );
  INVX1 U34 ( .A(parallel_in_tmp[5]), .Y(n28) );
  OAI21X1 U35 ( .A(n20), .B(n30), .C(n31), .Y(n71) );
  AOI22X1 U36 ( .A(parallel_in_tmp[5]), .B(n18), .C(parallel_in[5]), .D(n23), 
        .Y(n31) );
  INVX1 U37 ( .A(parallel_in_tmp[6]), .Y(n30) );
  OAI21X1 U38 ( .A(n20), .B(n32), .C(n33), .Y(n70) );
  AOI22X1 U39 ( .A(parallel_in_tmp[6]), .B(n18), .C(parallel_in[6]), .D(n23), 
        .Y(n33) );
  INVX1 U40 ( .A(parallel_in_tmp[7]), .Y(n32) );
  OAI21X1 U41 ( .A(n20), .B(n34), .C(n35), .Y(n69) );
  AOI22X1 U42 ( .A(parallel_in_tmp[7]), .B(n18), .C(parallel_in[7]), .D(n23), 
        .Y(n35) );
  INVX1 U43 ( .A(parallel_in_tmp[8]), .Y(n34) );
  OAI21X1 U44 ( .A(n20), .B(n36), .C(n37), .Y(n68) );
  AOI22X1 U45 ( .A(parallel_in_tmp[8]), .B(n18), .C(parallel_in[8]), .D(n23), 
        .Y(n37) );
  INVX1 U46 ( .A(parallel_in_tmp[9]), .Y(n36) );
  OAI21X1 U47 ( .A(n20), .B(n38), .C(n39), .Y(n67) );
  AOI22X1 U48 ( .A(parallel_in_tmp[9]), .B(n18), .C(parallel_in[9]), .D(n23), 
        .Y(n39) );
  INVX1 U49 ( .A(parallel_in_tmp[10]), .Y(n38) );
  OAI21X1 U50 ( .A(n20), .B(n40), .C(n41), .Y(n66) );
  AOI22X1 U51 ( .A(parallel_in_tmp[10]), .B(n18), .C(parallel_in[10]), .D(n23), 
        .Y(n41) );
  INVX1 U52 ( .A(parallel_in_tmp[11]), .Y(n40) );
  OAI21X1 U53 ( .A(n20), .B(n42), .C(n43), .Y(n65) );
  AOI22X1 U54 ( .A(parallel_in_tmp[11]), .B(n18), .C(parallel_in[11]), .D(n23), 
        .Y(n43) );
  INVX1 U55 ( .A(parallel_in_tmp[12]), .Y(n42) );
  OAI21X1 U56 ( .A(n20), .B(n44), .C(n45), .Y(n64) );
  AOI22X1 U57 ( .A(parallel_in_tmp[12]), .B(n18), .C(parallel_in[12]), .D(n23), 
        .Y(n45) );
  INVX1 U58 ( .A(parallel_in_tmp[13]), .Y(n44) );
  OAI21X1 U59 ( .A(n20), .B(n46), .C(n47), .Y(n63) );
  AOI22X1 U60 ( .A(parallel_in_tmp[13]), .B(n18), .C(parallel_in[13]), .D(n23), 
        .Y(n47) );
  INVX1 U61 ( .A(parallel_in_tmp[14]), .Y(n46) );
  OAI21X1 U62 ( .A(n20), .B(n48), .C(n49), .Y(n62) );
  AOI22X1 U63 ( .A(parallel_in_tmp[14]), .B(n18), .C(parallel_in[14]), .D(n23), 
        .Y(n49) );
  INVX1 U64 ( .A(parallel_in_tmp[15]), .Y(n48) );
  OAI21X1 U65 ( .A(n50), .B(n51), .C(n52), .Y(n61) );
  AOI21X1 U66 ( .A(parallel_in_tmp[15]), .B(n18), .C(shift_enable), .Y(n52) );
  INVX1 U67 ( .A(parallel_in[15]), .Y(n51) );
  OAI21X1 U68 ( .A(n53), .B(n20), .C(n54), .Y(n60) );
  AOI22X1 U69 ( .A(parallel_in_tmp[0]), .B(n18), .C(parallel_in[0]), .D(n23), 
        .Y(n54) );
  NOR2X1 U70 ( .A(n23), .B(shift_enable), .Y(n22) );
  NAND2X1 U71 ( .A(load_enable), .B(n20), .Y(n50) );
  INVX1 U72 ( .A(parallel_in_tmp[1]), .Y(n53) );
  MUX2X1 U73 ( .B(n55), .A(n56), .S(n20), .Y(n59) );
  INVX1 U74 ( .A(serial_out), .Y(n56) );
  MUX2X1 U75 ( .B(parallel_in_tmp[0]), .A(parallel_in[0]), .S(load_enable), 
        .Y(n55) );
endmodule


module flex_pts_sr_NUM_BITS64_SHIFT_MSB0 ( clk, n_rst, load_enable, 
        shift_enable, parallel_in, serial_out );
  input [63:0] parallel_in;
  input clk, n_rst, load_enable, shift_enable;
  output serial_out;
  wire   n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         n225, n226, n227, n228, n229, n230, n231, n232, n233, n234, n235,
         n236, n237, n238, n239, n240, n241, n242, n243, n244, n245, n246,
         n247, n248, n249, n250, n251, n252, n253, n254, n255, n256, n257,
         n258, n259, n260, n261, n262, n263, n264, n265, n266, n267, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
         n174, n175, n176, n177, n178, n179, n180, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, n195,
         n196, n197, n198, n199, n200;
  wire   [63:0] parallel_in_tmp;

  DFFSR \parallel_in_tmp_reg[63]  ( .D(n205), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[63]) );
  DFFSR \parallel_in_tmp_reg[62]  ( .D(n206), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[62]) );
  DFFSR \parallel_in_tmp_reg[61]  ( .D(n207), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[61]) );
  DFFSR \parallel_in_tmp_reg[60]  ( .D(n208), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[60]) );
  DFFSR \parallel_in_tmp_reg[59]  ( .D(n209), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[59]) );
  DFFSR \parallel_in_tmp_reg[58]  ( .D(n210), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[58]) );
  DFFSR \parallel_in_tmp_reg[57]  ( .D(n211), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[57]) );
  DFFSR \parallel_in_tmp_reg[56]  ( .D(n212), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[56]) );
  DFFSR \parallel_in_tmp_reg[55]  ( .D(n213), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[55]) );
  DFFSR \parallel_in_tmp_reg[54]  ( .D(n214), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[54]) );
  DFFSR \parallel_in_tmp_reg[53]  ( .D(n215), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[53]) );
  DFFSR \parallel_in_tmp_reg[52]  ( .D(n216), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[52]) );
  DFFSR \parallel_in_tmp_reg[51]  ( .D(n217), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[51]) );
  DFFSR \parallel_in_tmp_reg[50]  ( .D(n218), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[50]) );
  DFFSR \parallel_in_tmp_reg[49]  ( .D(n219), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[49]) );
  DFFSR \parallel_in_tmp_reg[48]  ( .D(n220), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[48]) );
  DFFSR \parallel_in_tmp_reg[47]  ( .D(n221), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[47]) );
  DFFSR \parallel_in_tmp_reg[46]  ( .D(n222), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[46]) );
  DFFSR \parallel_in_tmp_reg[45]  ( .D(n223), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[45]) );
  DFFSR \parallel_in_tmp_reg[44]  ( .D(n224), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[44]) );
  DFFSR \parallel_in_tmp_reg[43]  ( .D(n225), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[43]) );
  DFFSR \parallel_in_tmp_reg[42]  ( .D(n226), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[42]) );
  DFFSR \parallel_in_tmp_reg[41]  ( .D(n227), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[41]) );
  DFFSR \parallel_in_tmp_reg[40]  ( .D(n228), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[40]) );
  DFFSR \parallel_in_tmp_reg[39]  ( .D(n229), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[39]) );
  DFFSR \parallel_in_tmp_reg[38]  ( .D(n230), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[38]) );
  DFFSR \parallel_in_tmp_reg[37]  ( .D(n231), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[37]) );
  DFFSR \parallel_in_tmp_reg[36]  ( .D(n232), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[36]) );
  DFFSR \parallel_in_tmp_reg[35]  ( .D(n233), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[35]) );
  DFFSR \parallel_in_tmp_reg[34]  ( .D(n234), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[34]) );
  DFFSR \parallel_in_tmp_reg[33]  ( .D(n235), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[33]) );
  DFFSR \parallel_in_tmp_reg[32]  ( .D(n236), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[32]) );
  DFFSR \parallel_in_tmp_reg[31]  ( .D(n237), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[31]) );
  DFFSR \parallel_in_tmp_reg[30]  ( .D(n238), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[30]) );
  DFFSR \parallel_in_tmp_reg[29]  ( .D(n239), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[29]) );
  DFFSR \parallel_in_tmp_reg[28]  ( .D(n240), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[28]) );
  DFFSR \parallel_in_tmp_reg[27]  ( .D(n241), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[27]) );
  DFFSR \parallel_in_tmp_reg[26]  ( .D(n242), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[26]) );
  DFFSR \parallel_in_tmp_reg[25]  ( .D(n243), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[25]) );
  DFFSR \parallel_in_tmp_reg[24]  ( .D(n244), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[24]) );
  DFFSR \parallel_in_tmp_reg[23]  ( .D(n245), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[23]) );
  DFFSR \parallel_in_tmp_reg[22]  ( .D(n246), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[22]) );
  DFFSR \parallel_in_tmp_reg[21]  ( .D(n247), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[21]) );
  DFFSR \parallel_in_tmp_reg[20]  ( .D(n248), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[20]) );
  DFFSR \parallel_in_tmp_reg[19]  ( .D(n249), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[19]) );
  DFFSR \parallel_in_tmp_reg[18]  ( .D(n250), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[18]) );
  DFFSR \parallel_in_tmp_reg[17]  ( .D(n251), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[17]) );
  DFFSR \parallel_in_tmp_reg[16]  ( .D(n252), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[16]) );
  DFFSR \parallel_in_tmp_reg[15]  ( .D(n253), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[15]) );
  DFFSR \parallel_in_tmp_reg[14]  ( .D(n254), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[14]) );
  DFFSR \parallel_in_tmp_reg[13]  ( .D(n255), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[13]) );
  DFFSR \parallel_in_tmp_reg[12]  ( .D(n256), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[12]) );
  DFFSR \parallel_in_tmp_reg[11]  ( .D(n257), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[11]) );
  DFFSR \parallel_in_tmp_reg[10]  ( .D(n258), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[10]) );
  DFFSR \parallel_in_tmp_reg[9]  ( .D(n259), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[9]) );
  DFFSR \parallel_in_tmp_reg[8]  ( .D(n260), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[8]) );
  DFFSR \parallel_in_tmp_reg[7]  ( .D(n261), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[7]) );
  DFFSR \parallel_in_tmp_reg[6]  ( .D(n262), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[6]) );
  DFFSR \parallel_in_tmp_reg[5]  ( .D(n263), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[5]) );
  DFFSR \parallel_in_tmp_reg[4]  ( .D(n264), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[4]) );
  DFFSR \parallel_in_tmp_reg[3]  ( .D(n265), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[3]) );
  DFFSR \parallel_in_tmp_reg[2]  ( .D(n266), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[2]) );
  DFFSR \parallel_in_tmp_reg[1]  ( .D(n267), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[1]) );
  DFFSR \parallel_in_tmp_reg[0]  ( .D(n204), .CLK(clk), .R(1'b1), .S(n_rst), 
        .Q(parallel_in_tmp[0]) );
  DFFSR serial_out_reg ( .D(n203), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        serial_out) );
  OR2X2 U68 ( .A(n71), .B(shift_enable), .Y(n66) );
  INVX8 U69 ( .A(n66), .Y(n67) );
  INVX8 U70 ( .A(n194), .Y(n71) );
  INVX8 U71 ( .A(shift_enable), .Y(n69) );
  OAI21X1 U72 ( .A(n68), .B(n69), .C(n70), .Y(n267) );
  AOI22X1 U73 ( .A(parallel_in_tmp[1]), .B(n67), .C(parallel_in[1]), .D(n71), 
        .Y(n70) );
  INVX1 U74 ( .A(parallel_in_tmp[2]), .Y(n68) );
  OAI21X1 U75 ( .A(n69), .B(n72), .C(n73), .Y(n266) );
  AOI22X1 U76 ( .A(parallel_in_tmp[2]), .B(n67), .C(parallel_in[2]), .D(n71), 
        .Y(n73) );
  INVX1 U77 ( .A(parallel_in_tmp[3]), .Y(n72) );
  OAI21X1 U78 ( .A(n69), .B(n74), .C(n75), .Y(n265) );
  AOI22X1 U79 ( .A(parallel_in_tmp[3]), .B(n67), .C(parallel_in[3]), .D(n71), 
        .Y(n75) );
  INVX1 U80 ( .A(parallel_in_tmp[4]), .Y(n74) );
  OAI21X1 U81 ( .A(n69), .B(n76), .C(n77), .Y(n264) );
  AOI22X1 U82 ( .A(parallel_in_tmp[4]), .B(n67), .C(parallel_in[4]), .D(n71), 
        .Y(n77) );
  INVX1 U83 ( .A(parallel_in_tmp[5]), .Y(n76) );
  OAI21X1 U84 ( .A(n69), .B(n78), .C(n79), .Y(n263) );
  AOI22X1 U85 ( .A(parallel_in_tmp[5]), .B(n67), .C(parallel_in[5]), .D(n71), 
        .Y(n79) );
  INVX1 U86 ( .A(parallel_in_tmp[6]), .Y(n78) );
  OAI21X1 U87 ( .A(n69), .B(n80), .C(n81), .Y(n262) );
  AOI22X1 U88 ( .A(parallel_in_tmp[6]), .B(n67), .C(parallel_in[6]), .D(n71), 
        .Y(n81) );
  INVX1 U89 ( .A(parallel_in_tmp[7]), .Y(n80) );
  OAI21X1 U90 ( .A(n69), .B(n82), .C(n83), .Y(n261) );
  AOI22X1 U91 ( .A(parallel_in_tmp[7]), .B(n67), .C(parallel_in[7]), .D(n71), 
        .Y(n83) );
  INVX1 U92 ( .A(parallel_in_tmp[8]), .Y(n82) );
  OAI21X1 U93 ( .A(n69), .B(n84), .C(n85), .Y(n260) );
  AOI22X1 U94 ( .A(parallel_in_tmp[8]), .B(n67), .C(parallel_in[8]), .D(n71), 
        .Y(n85) );
  INVX1 U95 ( .A(parallel_in_tmp[9]), .Y(n84) );
  OAI21X1 U96 ( .A(n69), .B(n86), .C(n87), .Y(n259) );
  AOI22X1 U97 ( .A(parallel_in_tmp[9]), .B(n67), .C(parallel_in[9]), .D(n71), 
        .Y(n87) );
  INVX1 U98 ( .A(parallel_in_tmp[10]), .Y(n86) );
  OAI21X1 U99 ( .A(n69), .B(n88), .C(n89), .Y(n258) );
  AOI22X1 U100 ( .A(parallel_in_tmp[10]), .B(n67), .C(parallel_in[10]), .D(n71), .Y(n89) );
  INVX1 U101 ( .A(parallel_in_tmp[11]), .Y(n88) );
  OAI21X1 U102 ( .A(n69), .B(n90), .C(n91), .Y(n257) );
  AOI22X1 U103 ( .A(parallel_in_tmp[11]), .B(n67), .C(parallel_in[11]), .D(n71), .Y(n91) );
  INVX1 U104 ( .A(parallel_in_tmp[12]), .Y(n90) );
  OAI21X1 U105 ( .A(n69), .B(n92), .C(n93), .Y(n256) );
  AOI22X1 U106 ( .A(parallel_in_tmp[12]), .B(n67), .C(parallel_in[12]), .D(n71), .Y(n93) );
  INVX1 U107 ( .A(parallel_in_tmp[13]), .Y(n92) );
  OAI21X1 U108 ( .A(n69), .B(n94), .C(n95), .Y(n255) );
  AOI22X1 U109 ( .A(parallel_in_tmp[13]), .B(n67), .C(parallel_in[13]), .D(n71), .Y(n95) );
  INVX1 U110 ( .A(parallel_in_tmp[14]), .Y(n94) );
  OAI21X1 U111 ( .A(n69), .B(n96), .C(n97), .Y(n254) );
  AOI22X1 U112 ( .A(parallel_in_tmp[14]), .B(n67), .C(parallel_in[14]), .D(n71), .Y(n97) );
  INVX1 U113 ( .A(parallel_in_tmp[15]), .Y(n96) );
  OAI21X1 U114 ( .A(n69), .B(n98), .C(n99), .Y(n253) );
  AOI22X1 U115 ( .A(parallel_in_tmp[15]), .B(n67), .C(parallel_in[15]), .D(n71), .Y(n99) );
  INVX1 U116 ( .A(parallel_in_tmp[16]), .Y(n98) );
  OAI21X1 U117 ( .A(n69), .B(n100), .C(n101), .Y(n252) );
  AOI22X1 U118 ( .A(parallel_in_tmp[16]), .B(n67), .C(parallel_in[16]), .D(n71), .Y(n101) );
  INVX1 U119 ( .A(parallel_in_tmp[17]), .Y(n100) );
  OAI21X1 U120 ( .A(n69), .B(n102), .C(n103), .Y(n251) );
  AOI22X1 U121 ( .A(parallel_in_tmp[17]), .B(n67), .C(parallel_in[17]), .D(n71), .Y(n103) );
  INVX1 U122 ( .A(parallel_in_tmp[18]), .Y(n102) );
  OAI21X1 U123 ( .A(n69), .B(n104), .C(n105), .Y(n250) );
  AOI22X1 U124 ( .A(parallel_in_tmp[18]), .B(n67), .C(parallel_in[18]), .D(n71), .Y(n105) );
  INVX1 U125 ( .A(parallel_in_tmp[19]), .Y(n104) );
  OAI21X1 U126 ( .A(n69), .B(n106), .C(n107), .Y(n249) );
  AOI22X1 U127 ( .A(parallel_in_tmp[19]), .B(n67), .C(parallel_in[19]), .D(n71), .Y(n107) );
  INVX1 U128 ( .A(parallel_in_tmp[20]), .Y(n106) );
  OAI21X1 U129 ( .A(n69), .B(n108), .C(n109), .Y(n248) );
  AOI22X1 U130 ( .A(parallel_in_tmp[20]), .B(n67), .C(parallel_in[20]), .D(n71), .Y(n109) );
  INVX1 U131 ( .A(parallel_in_tmp[21]), .Y(n108) );
  OAI21X1 U132 ( .A(n69), .B(n110), .C(n111), .Y(n247) );
  AOI22X1 U133 ( .A(parallel_in_tmp[21]), .B(n67), .C(parallel_in[21]), .D(n71), .Y(n111) );
  INVX1 U134 ( .A(parallel_in_tmp[22]), .Y(n110) );
  OAI21X1 U135 ( .A(n69), .B(n112), .C(n113), .Y(n246) );
  AOI22X1 U136 ( .A(parallel_in_tmp[22]), .B(n67), .C(parallel_in[22]), .D(n71), .Y(n113) );
  INVX1 U137 ( .A(parallel_in_tmp[23]), .Y(n112) );
  OAI21X1 U138 ( .A(n69), .B(n114), .C(n115), .Y(n245) );
  AOI22X1 U139 ( .A(parallel_in_tmp[23]), .B(n67), .C(parallel_in[23]), .D(n71), .Y(n115) );
  INVX1 U140 ( .A(parallel_in_tmp[24]), .Y(n114) );
  OAI21X1 U141 ( .A(n69), .B(n116), .C(n117), .Y(n244) );
  AOI22X1 U142 ( .A(parallel_in_tmp[24]), .B(n67), .C(parallel_in[24]), .D(n71), .Y(n117) );
  INVX1 U143 ( .A(parallel_in_tmp[25]), .Y(n116) );
  OAI21X1 U144 ( .A(n69), .B(n118), .C(n119), .Y(n243) );
  AOI22X1 U145 ( .A(parallel_in_tmp[25]), .B(n67), .C(parallel_in[25]), .D(n71), .Y(n119) );
  INVX1 U146 ( .A(parallel_in_tmp[26]), .Y(n118) );
  OAI21X1 U147 ( .A(n69), .B(n120), .C(n121), .Y(n242) );
  AOI22X1 U148 ( .A(parallel_in_tmp[26]), .B(n67), .C(parallel_in[26]), .D(n71), .Y(n121) );
  INVX1 U149 ( .A(parallel_in_tmp[27]), .Y(n120) );
  OAI21X1 U150 ( .A(n69), .B(n122), .C(n123), .Y(n241) );
  AOI22X1 U151 ( .A(parallel_in_tmp[27]), .B(n67), .C(parallel_in[27]), .D(n71), .Y(n123) );
  INVX1 U152 ( .A(parallel_in_tmp[28]), .Y(n122) );
  OAI21X1 U153 ( .A(n69), .B(n124), .C(n125), .Y(n240) );
  AOI22X1 U154 ( .A(parallel_in_tmp[28]), .B(n67), .C(parallel_in[28]), .D(n71), .Y(n125) );
  INVX1 U155 ( .A(parallel_in_tmp[29]), .Y(n124) );
  OAI21X1 U156 ( .A(n69), .B(n126), .C(n127), .Y(n239) );
  AOI22X1 U157 ( .A(parallel_in_tmp[29]), .B(n67), .C(parallel_in[29]), .D(n71), .Y(n127) );
  INVX1 U158 ( .A(parallel_in_tmp[30]), .Y(n126) );
  OAI21X1 U159 ( .A(n69), .B(n128), .C(n129), .Y(n238) );
  AOI22X1 U160 ( .A(parallel_in_tmp[30]), .B(n67), .C(parallel_in[30]), .D(n71), .Y(n129) );
  INVX1 U161 ( .A(parallel_in_tmp[31]), .Y(n128) );
  OAI21X1 U162 ( .A(n69), .B(n130), .C(n131), .Y(n237) );
  AOI22X1 U163 ( .A(parallel_in_tmp[31]), .B(n67), .C(parallel_in[31]), .D(n71), .Y(n131) );
  INVX1 U164 ( .A(parallel_in_tmp[32]), .Y(n130) );
  OAI21X1 U165 ( .A(n69), .B(n132), .C(n133), .Y(n236) );
  AOI22X1 U166 ( .A(parallel_in_tmp[32]), .B(n67), .C(parallel_in[32]), .D(n71), .Y(n133) );
  INVX1 U167 ( .A(parallel_in_tmp[33]), .Y(n132) );
  OAI21X1 U168 ( .A(n69), .B(n134), .C(n135), .Y(n235) );
  AOI22X1 U169 ( .A(parallel_in_tmp[33]), .B(n67), .C(parallel_in[33]), .D(n71), .Y(n135) );
  INVX1 U170 ( .A(parallel_in_tmp[34]), .Y(n134) );
  OAI21X1 U171 ( .A(n69), .B(n136), .C(n137), .Y(n234) );
  AOI22X1 U172 ( .A(parallel_in_tmp[34]), .B(n67), .C(parallel_in[34]), .D(n71), .Y(n137) );
  INVX1 U173 ( .A(parallel_in_tmp[35]), .Y(n136) );
  OAI21X1 U174 ( .A(n69), .B(n138), .C(n139), .Y(n233) );
  AOI22X1 U175 ( .A(parallel_in_tmp[35]), .B(n67), .C(parallel_in[35]), .D(n71), .Y(n139) );
  INVX1 U176 ( .A(parallel_in_tmp[36]), .Y(n138) );
  OAI21X1 U177 ( .A(n69), .B(n140), .C(n141), .Y(n232) );
  AOI22X1 U178 ( .A(parallel_in_tmp[36]), .B(n67), .C(parallel_in[36]), .D(n71), .Y(n141) );
  INVX1 U179 ( .A(parallel_in_tmp[37]), .Y(n140) );
  OAI21X1 U180 ( .A(n69), .B(n142), .C(n143), .Y(n231) );
  AOI22X1 U181 ( .A(parallel_in_tmp[37]), .B(n67), .C(parallel_in[37]), .D(n71), .Y(n143) );
  INVX1 U182 ( .A(parallel_in_tmp[38]), .Y(n142) );
  OAI21X1 U183 ( .A(n69), .B(n144), .C(n145), .Y(n230) );
  AOI22X1 U184 ( .A(parallel_in_tmp[38]), .B(n67), .C(parallel_in[38]), .D(n71), .Y(n145) );
  INVX1 U185 ( .A(parallel_in_tmp[39]), .Y(n144) );
  OAI21X1 U186 ( .A(n69), .B(n146), .C(n147), .Y(n229) );
  AOI22X1 U187 ( .A(parallel_in_tmp[39]), .B(n67), .C(parallel_in[39]), .D(n71), .Y(n147) );
  INVX1 U188 ( .A(parallel_in_tmp[40]), .Y(n146) );
  OAI21X1 U189 ( .A(n69), .B(n148), .C(n149), .Y(n228) );
  AOI22X1 U190 ( .A(parallel_in_tmp[40]), .B(n67), .C(parallel_in[40]), .D(n71), .Y(n149) );
  INVX1 U191 ( .A(parallel_in_tmp[41]), .Y(n148) );
  OAI21X1 U192 ( .A(n69), .B(n150), .C(n151), .Y(n227) );
  AOI22X1 U193 ( .A(parallel_in_tmp[41]), .B(n67), .C(parallel_in[41]), .D(n71), .Y(n151) );
  INVX1 U194 ( .A(parallel_in_tmp[42]), .Y(n150) );
  OAI21X1 U195 ( .A(n69), .B(n152), .C(n153), .Y(n226) );
  AOI22X1 U196 ( .A(parallel_in_tmp[42]), .B(n67), .C(parallel_in[42]), .D(n71), .Y(n153) );
  INVX1 U197 ( .A(parallel_in_tmp[43]), .Y(n152) );
  OAI21X1 U198 ( .A(n69), .B(n154), .C(n155), .Y(n225) );
  AOI22X1 U199 ( .A(parallel_in_tmp[43]), .B(n67), .C(parallel_in[43]), .D(n71), .Y(n155) );
  INVX1 U200 ( .A(parallel_in_tmp[44]), .Y(n154) );
  OAI21X1 U201 ( .A(n69), .B(n156), .C(n157), .Y(n224) );
  AOI22X1 U202 ( .A(parallel_in_tmp[44]), .B(n67), .C(parallel_in[44]), .D(n71), .Y(n157) );
  INVX1 U203 ( .A(parallel_in_tmp[45]), .Y(n156) );
  OAI21X1 U204 ( .A(n69), .B(n158), .C(n159), .Y(n223) );
  AOI22X1 U205 ( .A(parallel_in_tmp[45]), .B(n67), .C(parallel_in[45]), .D(n71), .Y(n159) );
  INVX1 U206 ( .A(parallel_in_tmp[46]), .Y(n158) );
  OAI21X1 U207 ( .A(n69), .B(n160), .C(n161), .Y(n222) );
  AOI22X1 U208 ( .A(parallel_in_tmp[46]), .B(n67), .C(parallel_in[46]), .D(n71), .Y(n161) );
  INVX1 U209 ( .A(parallel_in_tmp[47]), .Y(n160) );
  OAI21X1 U210 ( .A(n69), .B(n162), .C(n163), .Y(n221) );
  AOI22X1 U211 ( .A(parallel_in_tmp[47]), .B(n67), .C(parallel_in[47]), .D(n71), .Y(n163) );
  INVX1 U212 ( .A(parallel_in_tmp[48]), .Y(n162) );
  OAI21X1 U213 ( .A(n69), .B(n164), .C(n165), .Y(n220) );
  AOI22X1 U214 ( .A(parallel_in_tmp[48]), .B(n67), .C(parallel_in[48]), .D(n71), .Y(n165) );
  INVX1 U215 ( .A(parallel_in_tmp[49]), .Y(n164) );
  OAI21X1 U216 ( .A(n69), .B(n166), .C(n167), .Y(n219) );
  AOI22X1 U217 ( .A(parallel_in_tmp[49]), .B(n67), .C(parallel_in[49]), .D(n71), .Y(n167) );
  INVX1 U218 ( .A(parallel_in_tmp[50]), .Y(n166) );
  OAI21X1 U219 ( .A(n69), .B(n168), .C(n169), .Y(n218) );
  AOI22X1 U220 ( .A(parallel_in_tmp[50]), .B(n67), .C(parallel_in[50]), .D(n71), .Y(n169) );
  INVX1 U221 ( .A(parallel_in_tmp[51]), .Y(n168) );
  OAI21X1 U222 ( .A(n69), .B(n170), .C(n171), .Y(n217) );
  AOI22X1 U223 ( .A(parallel_in_tmp[51]), .B(n67), .C(parallel_in[51]), .D(n71), .Y(n171) );
  INVX1 U224 ( .A(parallel_in_tmp[52]), .Y(n170) );
  OAI21X1 U225 ( .A(n69), .B(n172), .C(n173), .Y(n216) );
  AOI22X1 U226 ( .A(parallel_in_tmp[52]), .B(n67), .C(parallel_in[52]), .D(n71), .Y(n173) );
  INVX1 U227 ( .A(parallel_in_tmp[53]), .Y(n172) );
  OAI21X1 U228 ( .A(n69), .B(n174), .C(n175), .Y(n215) );
  AOI22X1 U229 ( .A(parallel_in_tmp[53]), .B(n67), .C(parallel_in[53]), .D(n71), .Y(n175) );
  INVX1 U230 ( .A(parallel_in_tmp[54]), .Y(n174) );
  OAI21X1 U231 ( .A(n69), .B(n176), .C(n177), .Y(n214) );
  AOI22X1 U232 ( .A(parallel_in_tmp[54]), .B(n67), .C(parallel_in[54]), .D(n71), .Y(n177) );
  INVX1 U233 ( .A(parallel_in_tmp[55]), .Y(n176) );
  OAI21X1 U234 ( .A(n69), .B(n178), .C(n179), .Y(n213) );
  AOI22X1 U235 ( .A(parallel_in_tmp[55]), .B(n67), .C(parallel_in[55]), .D(n71), .Y(n179) );
  INVX1 U236 ( .A(parallel_in_tmp[56]), .Y(n178) );
  OAI21X1 U237 ( .A(n69), .B(n180), .C(n181), .Y(n212) );
  AOI22X1 U238 ( .A(parallel_in_tmp[56]), .B(n67), .C(parallel_in[56]), .D(n71), .Y(n181) );
  INVX1 U239 ( .A(parallel_in_tmp[57]), .Y(n180) );
  OAI21X1 U240 ( .A(n69), .B(n182), .C(n183), .Y(n211) );
  AOI22X1 U241 ( .A(parallel_in_tmp[57]), .B(n67), .C(parallel_in[57]), .D(n71), .Y(n183) );
  INVX1 U242 ( .A(parallel_in_tmp[58]), .Y(n182) );
  OAI21X1 U243 ( .A(n69), .B(n184), .C(n185), .Y(n210) );
  AOI22X1 U244 ( .A(parallel_in_tmp[58]), .B(n67), .C(parallel_in[58]), .D(n71), .Y(n185) );
  INVX1 U245 ( .A(parallel_in_tmp[59]), .Y(n184) );
  OAI21X1 U246 ( .A(n69), .B(n186), .C(n187), .Y(n209) );
  AOI22X1 U247 ( .A(parallel_in_tmp[59]), .B(n67), .C(parallel_in[59]), .D(n71), .Y(n187) );
  INVX1 U248 ( .A(parallel_in_tmp[60]), .Y(n186) );
  OAI21X1 U249 ( .A(n69), .B(n188), .C(n189), .Y(n208) );
  AOI22X1 U250 ( .A(parallel_in_tmp[60]), .B(n67), .C(parallel_in[60]), .D(n71), .Y(n189) );
  INVX1 U251 ( .A(parallel_in_tmp[61]), .Y(n188) );
  OAI21X1 U252 ( .A(n69), .B(n190), .C(n191), .Y(n207) );
  AOI22X1 U253 ( .A(parallel_in_tmp[61]), .B(n67), .C(parallel_in[61]), .D(n71), .Y(n191) );
  INVX1 U254 ( .A(parallel_in_tmp[62]), .Y(n190) );
  OAI21X1 U255 ( .A(n69), .B(n192), .C(n193), .Y(n206) );
  AOI22X1 U256 ( .A(parallel_in_tmp[62]), .B(n67), .C(parallel_in[62]), .D(n71), .Y(n193) );
  INVX1 U257 ( .A(parallel_in_tmp[63]), .Y(n192) );
  OAI21X1 U258 ( .A(n194), .B(n195), .C(n196), .Y(n205) );
  AOI21X1 U259 ( .A(parallel_in_tmp[63]), .B(n67), .C(shift_enable), .Y(n196)
         );
  INVX1 U260 ( .A(parallel_in[63]), .Y(n195) );
  OAI21X1 U261 ( .A(n197), .B(n69), .C(n198), .Y(n204) );
  AOI22X1 U262 ( .A(parallel_in_tmp[0]), .B(n67), .C(parallel_in[0]), .D(n71), 
        .Y(n198) );
  NAND2X1 U263 ( .A(load_enable), .B(n69), .Y(n194) );
  INVX1 U264 ( .A(parallel_in_tmp[1]), .Y(n197) );
  MUX2X1 U265 ( .B(n199), .A(n200), .S(n69), .Y(n203) );
  INVX1 U266 ( .A(serial_out), .Y(n200) );
  MUX2X1 U267 ( .B(parallel_in_tmp[0]), .A(parallel_in[0]), .S(load_enable), 
        .Y(n199) );
endmodule


module t_shift_register ( clk, n_rst, sync_shift_enable, pid_shift_enable, 
        crc5_shift_enable, crc16_shift_enable, data_shift_enable, 
        sync_load_enable, pid_load_enable, crc5_load_enable, crc16_load_enable, 
        data_load_enable, trans_sync, trans_pid, trans_crc5, trans_crc16, 
        trans_data, sync_transmitting, pid_transmitting, crc5_transmitting, 
        crc16_transmitting, data_transmitting, eop_transmitting, d_orig );
  input [7:0] trans_sync;
  input [7:0] trans_pid;
  input [4:0] trans_crc5;
  input [15:0] trans_crc16;
  input [63:0] trans_data;
  input clk, n_rst, sync_shift_enable, pid_shift_enable, crc5_shift_enable,
         crc16_shift_enable, data_shift_enable, sync_load_enable,
         pid_load_enable, crc5_load_enable, crc16_load_enable,
         data_load_enable, sync_transmitting, pid_transmitting,
         crc5_transmitting, crc16_transmitting, data_transmitting,
         eop_transmitting;
  output d_orig;
  wire   sync_serial_out, pid_serial_out, crc5_serial_out, crc16_serial_out,
         data_serial_out, n16, n2, n3, n4, n5, n6, n7, n8;

  DFFSR d_orig_reg ( .D(n16), .CLK(clk), .R(1'b1), .S(n_rst), .Q(d_orig) );
  flex_pts_sr_NUM_BITS8_SHIFT_MSB0_1 sync_shift_reg ( .clk(clk), .n_rst(n_rst), 
        .load_enable(sync_load_enable), .shift_enable(sync_shift_enable), 
        .parallel_in(trans_sync), .serial_out(sync_serial_out) );
  flex_pts_sr_NUM_BITS8_SHIFT_MSB0_0 pid_shift_reg ( .clk(clk), .n_rst(n_rst), 
        .load_enable(pid_load_enable), .shift_enable(pid_shift_enable), 
        .parallel_in(trans_pid), .serial_out(pid_serial_out) );
  flex_pts_sr_NUM_BITS5_SHIFT_MSB0 crc5_shift_reg ( .clk(clk), .n_rst(n_rst), 
        .load_enable(crc5_load_enable), .shift_enable(crc5_shift_enable), 
        .parallel_in(trans_crc5), .serial_out(crc5_serial_out) );
  flex_pts_sr_NUM_BITS16_SHIFT_MSB0 crc16_shift_reg ( .clk(clk), .n_rst(n_rst), 
        .load_enable(crc16_load_enable), .shift_enable(crc16_shift_enable), 
        .parallel_in(trans_crc16), .serial_out(crc16_serial_out) );
  flex_pts_sr_NUM_BITS64_SHIFT_MSB0 data_shift_reg ( .clk(clk), .n_rst(n_rst), 
        .load_enable(data_load_enable), .shift_enable(data_shift_enable), 
        .parallel_in(trans_data), .serial_out(data_serial_out) );
  MUX2X1 U4 ( .B(n2), .A(n3), .S(sync_transmitting), .Y(n16) );
  INVX1 U5 ( .A(sync_serial_out), .Y(n3) );
  MUX2X1 U6 ( .B(n4), .A(pid_serial_out), .S(pid_transmitting), .Y(n2) );
  MUX2X1 U7 ( .B(n5), .A(n6), .S(crc5_transmitting), .Y(n4) );
  INVX1 U8 ( .A(crc5_serial_out), .Y(n6) );
  MUX2X1 U9 ( .B(n7), .A(crc16_serial_out), .S(crc16_transmitting), .Y(n5) );
  INVX1 U10 ( .A(n8), .Y(n7) );
  MUX2X1 U11 ( .B(d_orig), .A(data_serial_out), .S(data_transmitting), .Y(n8)
         );
endmodule


module flex_counter_NUM_CNT_BITS32_9_DW01_inc_0 ( A, SUM );
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


module flex_counter_NUM_CNT_BITS32_9 ( clk, n_rst, clear, count_enable, 
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
  flex_counter_NUM_CNT_BITS32_9_DW01_inc_0 add_35 ( .A(count_out), .SUM({N39, 
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


module flex_counter_NUM_CNT_BITS32_8_DW01_inc_0 ( A, SUM );
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


module flex_counter_NUM_CNT_BITS32_8 ( clk, n_rst, clear, count_enable, 
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
  flex_counter_NUM_CNT_BITS32_8_DW01_inc_0 add_35 ( .A(count_out), .SUM({N39, 
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


module flex_counter_NUM_CNT_BITS32_7_DW01_inc_0 ( A, SUM );
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


module flex_counter_NUM_CNT_BITS32_7 ( clk, n_rst, clear, count_enable, 
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
  flex_counter_NUM_CNT_BITS32_7_DW01_inc_0 add_35 ( .A(count_out), .SUM({N39, 
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


module flex_counter_NUM_CNT_BITS32_6_DW01_inc_0 ( A, SUM );
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


module flex_counter_NUM_CNT_BITS32_6 ( clk, n_rst, clear, count_enable, 
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
  flex_counter_NUM_CNT_BITS32_6_DW01_inc_0 add_35 ( .A(count_out), .SUM({N39, 
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


module flex_counter_NUM_CNT_BITS32_5_DW01_inc_0 ( A, SUM );
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


module flex_counter_NUM_CNT_BITS32_5 ( clk, n_rst, clear, count_enable, 
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
  flex_counter_NUM_CNT_BITS32_5_DW01_inc_0 add_35 ( .A(count_out), .SUM({N39, 
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


module flex_counter_NUM_CNT_BITS32_4_DW01_inc_0 ( A, SUM );
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


module flex_counter_NUM_CNT_BITS32_4 ( clk, n_rst, clear, count_enable, 
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
  flex_counter_NUM_CNT_BITS32_4_DW01_inc_0 add_35 ( .A(count_out), .SUM({N39, 
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


module flex_counter_NUM_CNT_BITS32_3_DW01_inc_0 ( A, SUM );
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


module flex_counter_NUM_CNT_BITS32_3 ( clk, n_rst, clear, count_enable, 
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
  flex_counter_NUM_CNT_BITS32_3_DW01_inc_0 add_35 ( .A(count_out), .SUM({N39, 
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


module flex_counter_NUM_CNT_BITS32_2_DW01_inc_0 ( A, SUM );
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


module flex_counter_NUM_CNT_BITS32_2 ( clk, n_rst, clear, count_enable, 
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
  flex_counter_NUM_CNT_BITS32_2_DW01_inc_0 add_35 ( .A(count_out), .SUM({N39, 
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
  flex_counter_NUM_CNT_BITS32_1_DW01_inc_0 add_35 ( .A(count_out), .SUM({N39, 
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


module t_timer ( clk, n_rst, d_edge, sync_transmitting, pid_transmitting, 
        crc5_transmitting, crc16_transmitting, data_transmitting, 
        sync_shift_enable, pid_shift_enable, crc5_shift_enable, 
        crc16_shift_enable, data_shift_enable, sync_bits_transmitted, 
        pid_bits_transmitted, crc5_bits_transmitted, crc16_bits_transmitted, 
        data_bits_transmitted );
  input clk, n_rst, d_edge, sync_transmitting, pid_transmitting,
         crc5_transmitting, crc16_transmitting, data_transmitting;
  output sync_shift_enable, pid_shift_enable, crc5_shift_enable,
         crc16_shift_enable, data_shift_enable, sync_bits_transmitted,
         pid_bits_transmitted, crc5_bits_transmitted, crc16_bits_transmitted,
         data_bits_transmitted;
  wire   current_sync_bits_transmitted, prev_sync_bits_transmitted,
         current_pid_bits_transmitted, prev_pid_bits_transmitted,
         current_crc5_bits_transmitted, prev_crc5_bits_transmitted,
         current_crc16_bits_transmitted, prev_crc16_bits_transmitted,
         current_data_bits_transmitted, prev_data_bits_transmitted,
         async_sync_bits_transmitted, async_pid_bits_transmitted,
         async_crc5_bits_transmitted, async_crc16_bits_transmitted,
         async_data_bits_transmitted, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88,
         n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n107, n108, n109, n110, n111, n112,
         n113, n114, n115, n116, n117, n118, n119, n120, n121, n122, n123,
         n124, n125, n126, n127, n128, n129, n130, n131, n132, n133, n134,
         n135, n136, n137, n138, n139, n140, n141, n142, n143, n144, n145,
         n146, n147, n148, n149, n150, n151, n152, n153, n154, n155, n161,
         n162, n163, n164, n165;
  wire   [31:0] sync_count_out;
  wire   [31:0] pid_count_out;
  wire   [31:0] crc5_count_out;
  wire   [31:0] crc16_count_out;
  wire   [31:0] data_count_out;

  DFFSR current_sync_bits_transmitted_reg ( .D(async_sync_bits_transmitted), 
        .CLK(clk), .R(n_rst), .S(1'b1), .Q(current_sync_bits_transmitted) );
  DFFSR prev_sync_bits_transmitted_reg ( .D(current_sync_bits_transmitted), 
        .CLK(clk), .R(n_rst), .S(1'b1), .Q(prev_sync_bits_transmitted) );
  DFFSR current_pid_bits_transmitted_reg ( .D(async_pid_bits_transmitted), 
        .CLK(clk), .R(n_rst), .S(1'b1), .Q(current_pid_bits_transmitted) );
  DFFSR prev_pid_bits_transmitted_reg ( .D(current_pid_bits_transmitted), 
        .CLK(clk), .R(n_rst), .S(1'b1), .Q(prev_pid_bits_transmitted) );
  DFFSR current_crc5_bits_transmitted_reg ( .D(async_crc5_bits_transmitted), 
        .CLK(clk), .R(n_rst), .S(1'b1), .Q(current_crc5_bits_transmitted) );
  DFFSR prev_crc5_bits_transmitted_reg ( .D(current_crc5_bits_transmitted), 
        .CLK(clk), .R(n_rst), .S(1'b1), .Q(prev_crc5_bits_transmitted) );
  DFFSR current_crc16_bits_transmitted_reg ( .D(async_crc16_bits_transmitted), 
        .CLK(clk), .R(n_rst), .S(1'b1), .Q(current_crc16_bits_transmitted) );
  DFFSR prev_crc16_bits_transmitted_reg ( .D(current_crc16_bits_transmitted), 
        .CLK(clk), .R(n_rst), .S(1'b1), .Q(prev_crc16_bits_transmitted) );
  DFFSR current_data_bits_transmitted_reg ( .D(async_data_bits_transmitted), 
        .CLK(clk), .R(n_rst), .S(1'b1), .Q(current_data_bits_transmitted) );
  DFFSR prev_data_bits_transmitted_reg ( .D(current_data_bits_transmitted), 
        .CLK(clk), .R(n_rst), .S(1'b1), .Q(prev_data_bits_transmitted) );
  flex_counter_NUM_CNT_BITS32_9 sync_bit_shift ( .clk(clk), .n_rst(n_rst), 
        .clear(d_edge), .count_enable(sync_transmitting), .rollover_val({1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0}), .count_out(sync_count_out)
         );
  flex_counter_NUM_CNT_BITS32_8 pid_bit_shift ( .clk(clk), .n_rst(n_rst), 
        .clear(d_edge), .count_enable(pid_transmitting), .rollover_val({1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0}), .count_out(pid_count_out)
         );
  flex_counter_NUM_CNT_BITS32_7 crc5_bit_shift ( .clk(clk), .n_rst(n_rst), 
        .clear(d_edge), .count_enable(crc5_transmitting), .rollover_val({1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0}), .count_out(crc5_count_out)
         );
  flex_counter_NUM_CNT_BITS32_6 crc16_bit_shift ( .clk(clk), .n_rst(n_rst), 
        .clear(d_edge), .count_enable(crc16_transmitting), .rollover_val({1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0}), .count_out(crc16_count_out) );
  flex_counter_NUM_CNT_BITS32_5 data_bit_shift ( .clk(clk), .n_rst(n_rst), 
        .clear(d_edge), .count_enable(data_transmitting), .rollover_val({1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0}), .count_out(data_count_out)
         );
  flex_counter_NUM_CNT_BITS32_4 sync_bits_receive ( .clk(clk), .n_rst(n_rst), 
        .clear(n161), .count_enable(sync_shift_enable), .rollover_val({1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0}), .rollover_flag(
        async_sync_bits_transmitted) );
  flex_counter_NUM_CNT_BITS32_3 pid_bits_receive ( .clk(clk), .n_rst(n_rst), 
        .clear(n162), .count_enable(pid_shift_enable), .rollover_val({1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0}), .rollover_flag(
        async_pid_bits_transmitted) );
  flex_counter_NUM_CNT_BITS32_2 crc5_bits_receive ( .clk(clk), .n_rst(n_rst), 
        .clear(n163), .count_enable(crc5_shift_enable), .rollover_val({1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b1}), .rollover_flag(
        async_crc5_bits_transmitted) );
  flex_counter_NUM_CNT_BITS32_1 crc16_bits_receive ( .clk(clk), .n_rst(n_rst), 
        .clear(n165), .count_enable(crc16_shift_enable), .rollover_val({1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0}), .rollover_flag(
        async_crc16_bits_transmitted) );
  flex_counter_NUM_CNT_BITS32_0 data_bits_receive ( .clk(clk), .n_rst(n_rst), 
        .clear(n164), .count_enable(data_shift_enable), .rollover_val({1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .rollover_flag(
        async_data_bits_transmitted) );
  NOR2X1 U13 ( .A(prev_sync_bits_transmitted), .B(n11), .Y(
        sync_bits_transmitted) );
  INVX1 U14 ( .A(current_sync_bits_transmitted), .Y(n11) );
  NOR2X1 U15 ( .A(prev_pid_bits_transmitted), .B(n12), .Y(pid_bits_transmitted) );
  INVX1 U16 ( .A(current_pid_bits_transmitted), .Y(n12) );
  INVX1 U17 ( .A(n13), .Y(sync_shift_enable) );
  NAND3X1 U18 ( .A(n14), .B(n15), .C(n16), .Y(n13) );
  NOR2X1 U19 ( .A(n17), .B(n18), .Y(n16) );
  NAND3X1 U20 ( .A(n19), .B(n20), .C(n21), .Y(n18) );
  AND2X1 U21 ( .A(n22), .B(n23), .Y(n21) );
  NOR2X1 U22 ( .A(sync_count_out[30]), .B(sync_count_out[29]), .Y(n23) );
  NOR2X1 U23 ( .A(sync_count_out[28]), .B(sync_count_out[27]), .Y(n22) );
  NOR2X1 U24 ( .A(sync_count_out[26]), .B(sync_count_out[25]), .Y(n20) );
  NOR2X1 U25 ( .A(sync_count_out[24]), .B(sync_count_out[23]), .Y(n19) );
  NAND3X1 U26 ( .A(n24), .B(n25), .C(n26), .Y(n17) );
  AND2X1 U27 ( .A(n27), .B(n28), .Y(n26) );
  NOR2X1 U28 ( .A(sync_count_out[9]), .B(sync_count_out[8]), .Y(n28) );
  NOR2X1 U29 ( .A(sync_count_out[7]), .B(sync_count_out[6]), .Y(n27) );
  NOR2X1 U30 ( .A(sync_count_out[5]), .B(sync_count_out[4]), .Y(n25) );
  NOR2X1 U31 ( .A(sync_count_out[3]), .B(sync_count_out[31]), .Y(n24) );
  NOR2X1 U32 ( .A(n29), .B(n30), .Y(n15) );
  NAND2X1 U33 ( .A(n31), .B(n32), .Y(n30) );
  NOR2X1 U34 ( .A(sync_count_out[19]), .B(sync_count_out[18]), .Y(n32) );
  NOR2X1 U35 ( .A(sync_count_out[17]), .B(sync_count_out[16]), .Y(n31) );
  NAND2X1 U36 ( .A(n33), .B(n34), .Y(n29) );
  NOR2X1 U37 ( .A(sync_count_out[22]), .B(sync_count_out[21]), .Y(n34) );
  NOR2X1 U38 ( .A(sync_count_out[20]), .B(sync_count_out[1]), .Y(n33) );
  NOR2X1 U39 ( .A(n35), .B(n36), .Y(n14) );
  NAND3X1 U40 ( .A(sync_count_out[2]), .B(n37), .C(n38), .Y(n36) );
  NOR2X1 U41 ( .A(sync_count_out[11]), .B(sync_count_out[10]), .Y(n38) );
  INVX1 U42 ( .A(sync_count_out[0]), .Y(n37) );
  NAND2X1 U43 ( .A(n39), .B(n40), .Y(n35) );
  NOR2X1 U44 ( .A(sync_count_out[15]), .B(sync_count_out[14]), .Y(n40) );
  NOR2X1 U45 ( .A(sync_count_out[13]), .B(sync_count_out[12]), .Y(n39) );
  INVX1 U46 ( .A(n41), .Y(pid_shift_enable) );
  NAND3X1 U47 ( .A(n42), .B(n43), .C(n44), .Y(n41) );
  NOR2X1 U48 ( .A(n45), .B(n46), .Y(n44) );
  NAND3X1 U49 ( .A(n47), .B(n48), .C(n49), .Y(n46) );
  AND2X1 U50 ( .A(n50), .B(n51), .Y(n49) );
  NOR2X1 U51 ( .A(pid_count_out[30]), .B(pid_count_out[29]), .Y(n51) );
  NOR2X1 U52 ( .A(pid_count_out[28]), .B(pid_count_out[27]), .Y(n50) );
  NOR2X1 U53 ( .A(pid_count_out[26]), .B(pid_count_out[25]), .Y(n48) );
  NOR2X1 U54 ( .A(pid_count_out[24]), .B(pid_count_out[23]), .Y(n47) );
  NAND3X1 U55 ( .A(n52), .B(n53), .C(n54), .Y(n45) );
  AND2X1 U56 ( .A(n55), .B(n56), .Y(n54) );
  NOR2X1 U57 ( .A(pid_count_out[9]), .B(pid_count_out[8]), .Y(n56) );
  NOR2X1 U58 ( .A(pid_count_out[7]), .B(pid_count_out[6]), .Y(n55) );
  NOR2X1 U59 ( .A(pid_count_out[5]), .B(pid_count_out[4]), .Y(n53) );
  NOR2X1 U60 ( .A(pid_count_out[3]), .B(pid_count_out[31]), .Y(n52) );
  NOR2X1 U61 ( .A(n57), .B(n58), .Y(n43) );
  NAND2X1 U62 ( .A(n59), .B(n60), .Y(n58) );
  NOR2X1 U63 ( .A(pid_count_out[19]), .B(pid_count_out[18]), .Y(n60) );
  NOR2X1 U64 ( .A(pid_count_out[17]), .B(pid_count_out[16]), .Y(n59) );
  NAND2X1 U65 ( .A(n61), .B(n62), .Y(n57) );
  NOR2X1 U66 ( .A(pid_count_out[22]), .B(pid_count_out[21]), .Y(n62) );
  NOR2X1 U67 ( .A(pid_count_out[20]), .B(pid_count_out[1]), .Y(n61) );
  NOR2X1 U68 ( .A(n63), .B(n64), .Y(n42) );
  NAND3X1 U69 ( .A(pid_count_out[2]), .B(n65), .C(n66), .Y(n64) );
  NOR2X1 U70 ( .A(pid_count_out[11]), .B(pid_count_out[10]), .Y(n66) );
  INVX1 U71 ( .A(pid_count_out[0]), .Y(n65) );
  NAND2X1 U72 ( .A(n67), .B(n68), .Y(n63) );
  NOR2X1 U73 ( .A(pid_count_out[15]), .B(pid_count_out[14]), .Y(n68) );
  NOR2X1 U74 ( .A(pid_count_out[13]), .B(pid_count_out[12]), .Y(n67) );
  INVX1 U75 ( .A(n69), .Y(crc5_shift_enable) );
  NAND3X1 U76 ( .A(n70), .B(n71), .C(n72), .Y(n69) );
  NOR2X1 U77 ( .A(n73), .B(n74), .Y(n72) );
  NAND3X1 U78 ( .A(n75), .B(n76), .C(n77), .Y(n74) );
  AND2X1 U79 ( .A(n78), .B(n79), .Y(n77) );
  NOR2X1 U80 ( .A(crc5_count_out[30]), .B(crc5_count_out[29]), .Y(n79) );
  NOR2X1 U81 ( .A(crc5_count_out[28]), .B(crc5_count_out[27]), .Y(n78) );
  NOR2X1 U82 ( .A(crc5_count_out[26]), .B(crc5_count_out[25]), .Y(n76) );
  NOR2X1 U83 ( .A(crc5_count_out[24]), .B(crc5_count_out[23]), .Y(n75) );
  NAND3X1 U84 ( .A(n80), .B(n81), .C(n82), .Y(n73) );
  AND2X1 U85 ( .A(n83), .B(n84), .Y(n82) );
  NOR2X1 U86 ( .A(crc5_count_out[9]), .B(crc5_count_out[8]), .Y(n84) );
  NOR2X1 U87 ( .A(crc5_count_out[7]), .B(crc5_count_out[6]), .Y(n83) );
  NOR2X1 U88 ( .A(crc5_count_out[5]), .B(crc5_count_out[4]), .Y(n81) );
  NOR2X1 U89 ( .A(crc5_count_out[3]), .B(crc5_count_out[31]), .Y(n80) );
  NOR2X1 U90 ( .A(n85), .B(n86), .Y(n71) );
  NAND2X1 U91 ( .A(n87), .B(n88), .Y(n86) );
  NOR2X1 U92 ( .A(crc5_count_out[19]), .B(crc5_count_out[18]), .Y(n88) );
  NOR2X1 U93 ( .A(crc5_count_out[17]), .B(crc5_count_out[16]), .Y(n87) );
  NAND2X1 U94 ( .A(n89), .B(n90), .Y(n85) );
  NOR2X1 U95 ( .A(crc5_count_out[22]), .B(crc5_count_out[21]), .Y(n90) );
  NOR2X1 U96 ( .A(crc5_count_out[20]), .B(crc5_count_out[1]), .Y(n89) );
  NOR2X1 U97 ( .A(n91), .B(n92), .Y(n70) );
  NAND3X1 U98 ( .A(crc5_count_out[2]), .B(n93), .C(n94), .Y(n92) );
  NOR2X1 U99 ( .A(crc5_count_out[11]), .B(crc5_count_out[10]), .Y(n94) );
  INVX1 U100 ( .A(crc5_count_out[0]), .Y(n93) );
  NAND2X1 U101 ( .A(n95), .B(n96), .Y(n91) );
  NOR2X1 U102 ( .A(crc5_count_out[15]), .B(crc5_count_out[14]), .Y(n96) );
  NOR2X1 U103 ( .A(crc5_count_out[13]), .B(crc5_count_out[12]), .Y(n95) );
  INVX1 U104 ( .A(n97), .Y(crc16_shift_enable) );
  NAND3X1 U105 ( .A(n98), .B(n99), .C(n100), .Y(n97) );
  NOR2X1 U106 ( .A(n101), .B(n102), .Y(n100) );
  NAND3X1 U107 ( .A(n103), .B(n104), .C(n105), .Y(n102) );
  AND2X1 U108 ( .A(n106), .B(n107), .Y(n105) );
  NOR2X1 U109 ( .A(crc16_count_out[30]), .B(crc16_count_out[29]), .Y(n107) );
  NOR2X1 U110 ( .A(crc16_count_out[28]), .B(crc16_count_out[27]), .Y(n106) );
  NOR2X1 U111 ( .A(crc16_count_out[26]), .B(crc16_count_out[25]), .Y(n104) );
  NOR2X1 U112 ( .A(crc16_count_out[24]), .B(crc16_count_out[23]), .Y(n103) );
  NAND3X1 U113 ( .A(n108), .B(n109), .C(n110), .Y(n101) );
  AND2X1 U114 ( .A(n111), .B(n112), .Y(n110) );
  NOR2X1 U115 ( .A(crc16_count_out[9]), .B(crc16_count_out[8]), .Y(n112) );
  NOR2X1 U116 ( .A(crc16_count_out[7]), .B(crc16_count_out[6]), .Y(n111) );
  NOR2X1 U117 ( .A(crc16_count_out[5]), .B(crc16_count_out[4]), .Y(n109) );
  NOR2X1 U118 ( .A(crc16_count_out[3]), .B(crc16_count_out[31]), .Y(n108) );
  NOR2X1 U119 ( .A(n113), .B(n114), .Y(n99) );
  NAND2X1 U120 ( .A(n115), .B(n116), .Y(n114) );
  NOR2X1 U121 ( .A(crc16_count_out[19]), .B(crc16_count_out[18]), .Y(n116) );
  NOR2X1 U122 ( .A(crc16_count_out[17]), .B(crc16_count_out[16]), .Y(n115) );
  NAND2X1 U123 ( .A(n117), .B(n118), .Y(n113) );
  NOR2X1 U124 ( .A(crc16_count_out[22]), .B(crc16_count_out[21]), .Y(n118) );
  NOR2X1 U125 ( .A(crc16_count_out[20]), .B(crc16_count_out[1]), .Y(n117) );
  NOR2X1 U126 ( .A(n119), .B(n120), .Y(n98) );
  NAND3X1 U127 ( .A(crc16_count_out[2]), .B(n121), .C(n122), .Y(n120) );
  NOR2X1 U128 ( .A(crc16_count_out[11]), .B(crc16_count_out[10]), .Y(n122) );
  INVX1 U129 ( .A(crc16_count_out[0]), .Y(n121) );
  NAND2X1 U130 ( .A(n123), .B(n124), .Y(n119) );
  NOR2X1 U131 ( .A(crc16_count_out[15]), .B(crc16_count_out[14]), .Y(n124) );
  NOR2X1 U132 ( .A(crc16_count_out[13]), .B(crc16_count_out[12]), .Y(n123) );
  INVX1 U133 ( .A(n125), .Y(data_shift_enable) );
  NAND3X1 U134 ( .A(n126), .B(n127), .C(n128), .Y(n125) );
  NOR2X1 U135 ( .A(n129), .B(n130), .Y(n128) );
  NAND3X1 U136 ( .A(n131), .B(n132), .C(n133), .Y(n130) );
  AND2X1 U137 ( .A(n134), .B(n135), .Y(n133) );
  NOR2X1 U138 ( .A(data_count_out[30]), .B(data_count_out[29]), .Y(n135) );
  NOR2X1 U139 ( .A(data_count_out[28]), .B(data_count_out[27]), .Y(n134) );
  NOR2X1 U140 ( .A(data_count_out[26]), .B(data_count_out[25]), .Y(n132) );
  NOR2X1 U141 ( .A(data_count_out[24]), .B(data_count_out[23]), .Y(n131) );
  NAND3X1 U142 ( .A(n136), .B(n137), .C(n138), .Y(n129) );
  AND2X1 U143 ( .A(n139), .B(n140), .Y(n138) );
  NOR2X1 U144 ( .A(data_count_out[9]), .B(data_count_out[8]), .Y(n140) );
  NOR2X1 U145 ( .A(data_count_out[7]), .B(data_count_out[6]), .Y(n139) );
  NOR2X1 U146 ( .A(data_count_out[5]), .B(data_count_out[4]), .Y(n137) );
  NOR2X1 U147 ( .A(data_count_out[3]), .B(data_count_out[31]), .Y(n136) );
  NOR2X1 U148 ( .A(n141), .B(n142), .Y(n127) );
  NAND2X1 U149 ( .A(n143), .B(n144), .Y(n142) );
  NOR2X1 U150 ( .A(data_count_out[19]), .B(data_count_out[18]), .Y(n144) );
  NOR2X1 U151 ( .A(data_count_out[17]), .B(data_count_out[16]), .Y(n143) );
  NAND2X1 U152 ( .A(n145), .B(n146), .Y(n141) );
  NOR2X1 U153 ( .A(data_count_out[22]), .B(data_count_out[21]), .Y(n146) );
  NOR2X1 U154 ( .A(data_count_out[20]), .B(data_count_out[1]), .Y(n145) );
  NOR2X1 U155 ( .A(n147), .B(n148), .Y(n126) );
  NAND3X1 U156 ( .A(data_count_out[2]), .B(n149), .C(n150), .Y(n148) );
  NOR2X1 U157 ( .A(data_count_out[11]), .B(data_count_out[10]), .Y(n150) );
  INVX1 U158 ( .A(data_count_out[0]), .Y(n149) );
  NAND2X1 U159 ( .A(n151), .B(n152), .Y(n147) );
  NOR2X1 U160 ( .A(data_count_out[15]), .B(data_count_out[14]), .Y(n152) );
  NOR2X1 U161 ( .A(data_count_out[13]), .B(data_count_out[12]), .Y(n151) );
  INVX1 U162 ( .A(sync_transmitting), .Y(n161) );
  INVX1 U163 ( .A(pid_transmitting), .Y(n162) );
  INVX1 U164 ( .A(crc5_transmitting), .Y(n163) );
  INVX1 U165 ( .A(data_transmitting), .Y(n164) );
  INVX1 U166 ( .A(crc16_transmitting), .Y(n165) );
  NOR2X1 U167 ( .A(prev_data_bits_transmitted), .B(n153), .Y(
        data_bits_transmitted) );
  INVX1 U168 ( .A(current_data_bits_transmitted), .Y(n153) );
  NOR2X1 U169 ( .A(prev_crc5_bits_transmitted), .B(n154), .Y(
        crc5_bits_transmitted) );
  INVX1 U170 ( .A(current_crc5_bits_transmitted), .Y(n154) );
  NOR2X1 U171 ( .A(prev_crc16_bits_transmitted), .B(n155), .Y(
        crc16_bits_transmitted) );
  INVX1 U172 ( .A(current_crc16_bits_transmitted), .Y(n155) );
endmodule


module tcu ( clk, n_rst, trans_data_ready, sync_bits_transmitted, 
        pid_bits_transmitted, crc5_bits_transmitted, crc16_bits_transmitted, 
        data_bits_transmitted, idle_transmitting, sync_transmitting, 
        pid_transmitting, crc5_transmitting, crc16_transmitting, 
        data_transmitting, eop_transmitting, sync_load_enable, pid_load_enable, 
        crc5_load_enable, crc16_load_enable, data_load_enable, trans_sync, 
        trans_pid, trans_data, trans_crc5, trans_crc16, handshake_ack );
  output [7:0] trans_sync;
  output [7:0] trans_pid;
  input [63:0] trans_data;
  output [4:0] trans_crc5;
  output [15:0] trans_crc16;
  input clk, n_rst, trans_data_ready, sync_bits_transmitted,
         pid_bits_transmitted, crc5_bits_transmitted, crc16_bits_transmitted,
         data_bits_transmitted;
  output idle_transmitting, sync_transmitting, pid_transmitting,
         crc5_transmitting, crc16_transmitting, data_transmitting,
         eop_transmitting, sync_load_enable, pid_load_enable, crc5_load_enable,
         crc16_load_enable, data_load_enable, handshake_ack;
  wire   N221, N222, N225, N226, N227, N228, N229, N230, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94,
         n95, n96, n97, n98, n99, n101, n106;
  wire   [4:0] state;
  wire   [4:0] nextstate;
  assign trans_sync[7] = 1'b1;
  assign trans_sync[6] = 1'b0;
  assign trans_sync[5] = 1'b0;
  assign trans_sync[4] = 1'b0;
  assign trans_sync[3] = 1'b0;
  assign trans_sync[2] = 1'b0;
  assign trans_sync[1] = 1'b0;
  assign trans_sync[0] = 1'b0;
  assign trans_pid[7] = 1'b0;
  assign trans_pid[6] = 1'b0;
  assign trans_pid[3] = 1'b1;
  assign trans_pid[2] = 1'b1;
  assign trans_crc5[4] = 1'b1;
  assign trans_crc5[3] = 1'b1;
  assign trans_crc5[2] = 1'b1;
  assign trans_crc5[1] = 1'b1;
  assign trans_crc5[0] = 1'b1;
  assign trans_crc16[15] = 1'b1;
  assign trans_crc16[14] = 1'b1;
  assign trans_crc16[13] = 1'b1;
  assign trans_crc16[12] = 1'b1;
  assign trans_crc16[11] = 1'b1;
  assign trans_crc16[10] = 1'b1;
  assign trans_crc16[9] = 1'b1;
  assign trans_crc16[8] = 1'b1;
  assign trans_crc16[7] = 1'b1;
  assign trans_crc16[6] = 1'b1;
  assign trans_crc16[5] = 1'b1;
  assign trans_crc16[4] = 1'b1;
  assign trans_crc16[3] = 1'b1;
  assign trans_crc16[2] = 1'b1;
  assign trans_crc16[1] = 1'b1;
  assign trans_crc16[0] = 1'b1;
  assign idle_transmitting = N225;
  assign sync_transmitting = N226;
  assign pid_transmitting = N227;
  assign eop_transmitting = N228;
  assign sync_load_enable = N229;
  assign pid_load_enable = N230;

  DFFSR \state_reg[0]  ( .D(nextstate[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[0]) );
  DFFSR \state_reg[1]  ( .D(nextstate[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[1]) );
  DFFSR \state_reg[4]  ( .D(nextstate[4]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[4]) );
  DFFSR \state_reg[3]  ( .D(nextstate[3]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[3]) );
  DFFSR \state_reg[2]  ( .D(nextstate[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[2]) );
  LATCH \trans_pid_reg[5]  ( .CLK(N230), .D(N222), .Q(trans_pid[5]) );
  LATCH \trans_pid_reg[4]  ( .CLK(N230), .D(N221), .Q(trans_pid[4]) );
  LATCH \trans_pid_reg[1]  ( .CLK(N230), .D(n101), .Q(trans_pid[1]) );
  LATCH \trans_pid_reg[0]  ( .CLK(N230), .D(n106), .Q(trans_pid[0]) );
  NAND3X1 U41 ( .A(n6), .B(n7), .C(n8), .Y(nextstate[4]) );
  NOR2X1 U42 ( .A(n9), .B(n10), .Y(n8) );
  NAND3X1 U43 ( .A(n11), .B(n12), .C(n13), .Y(nextstate[3]) );
  NOR2X1 U44 ( .A(n14), .B(n15), .Y(n13) );
  NAND2X1 U45 ( .A(n16), .B(n17), .Y(n15) );
  INVX1 U46 ( .A(n10), .Y(n17) );
  NAND3X1 U47 ( .A(n18), .B(n19), .C(n20), .Y(n10) );
  AOI22X1 U48 ( .A(n21), .B(n22), .C(n23), .D(n24), .Y(n20) );
  OAI21X1 U49 ( .A(n25), .B(n26), .C(n27), .Y(n14) );
  NOR2X1 U50 ( .A(handshake_ack), .B(N222), .Y(n12) );
  NOR2X1 U51 ( .A(n24), .B(n28), .Y(n11) );
  OR2X1 U52 ( .A(n29), .B(n30), .Y(nextstate[2]) );
  NAND3X1 U53 ( .A(n31), .B(n32), .C(n16), .Y(n30) );
  AOI21X1 U54 ( .A(n24), .B(n33), .C(n34), .Y(n16) );
  INVX1 U55 ( .A(n35), .Y(n32) );
  NAND3X1 U56 ( .A(n18), .B(n36), .C(n37), .Y(n29) );
  NOR2X1 U57 ( .A(crc5_transmitting), .B(N221), .Y(n37) );
  NAND3X1 U58 ( .A(n38), .B(n39), .C(n40), .Y(nextstate[1]) );
  AND2X1 U59 ( .A(n41), .B(n19), .Y(n40) );
  INVX1 U60 ( .A(n42), .Y(n39) );
  NAND3X1 U61 ( .A(n43), .B(n44), .C(n45), .Y(nextstate[0]) );
  NOR2X1 U62 ( .A(n46), .B(n47), .Y(n45) );
  OAI21X1 U63 ( .A(n48), .B(n26), .C(n49), .Y(n47) );
  NAND2X1 U64 ( .A(trans_data_ready), .B(n50), .Y(n49) );
  INVX1 U65 ( .A(n51), .Y(n50) );
  OAI21X1 U66 ( .A(n52), .B(n53), .C(n54), .Y(n46) );
  NOR2X1 U67 ( .A(n28), .B(n55), .Y(n54) );
  AOI22X1 U68 ( .A(sync_bits_transmitted), .B(N226), .C(pid_bits_transmitted), 
        .D(N227), .Y(n44) );
  AOI21X1 U69 ( .A(data_bits_transmitted), .B(data_transmitting), .C(n42), .Y(
        n43) );
  NAND3X1 U70 ( .A(n7), .B(n56), .C(n57), .Y(n42) );
  INVX1 U71 ( .A(n58), .Y(n57) );
  OAI21X1 U72 ( .A(n53), .B(n59), .C(n18), .Y(n58) );
  NAND3X1 U73 ( .A(n60), .B(n61), .C(n62), .Y(n18) );
  NOR2X1 U74 ( .A(n63), .B(n64), .Y(n62) );
  OR2X1 U75 ( .A(N226), .B(N227), .Y(n64) );
  NAND3X1 U76 ( .A(n65), .B(n56), .C(n66), .Y(n63) );
  INVX1 U77 ( .A(N229), .Y(n66) );
  NOR2X1 U78 ( .A(n67), .B(n68), .Y(n61) );
  NAND2X1 U79 ( .A(n36), .B(n59), .Y(n68) );
  NOR2X1 U80 ( .A(n9), .B(n69), .Y(n60) );
  INVX1 U81 ( .A(n27), .Y(n69) );
  NAND3X1 U82 ( .A(n70), .B(n71), .C(n72), .Y(n9) );
  NOR2X1 U83 ( .A(crc16_load_enable), .B(n35), .Y(n72) );
  NAND3X1 U84 ( .A(n73), .B(n74), .C(n75), .Y(n35) );
  AOI22X1 U85 ( .A(n22), .B(n76), .C(n21), .D(n77), .Y(n75) );
  NAND3X1 U86 ( .A(n52), .B(n41), .C(n59), .Y(n77) );
  INVX1 U87 ( .A(n28), .Y(n74) );
  NOR2X1 U88 ( .A(n52), .B(n25), .Y(n28) );
  AOI21X1 U89 ( .A(n22), .B(n24), .C(handshake_ack), .Y(n73) );
  INVX1 U90 ( .A(data_load_enable), .Y(n71) );
  INVX1 U91 ( .A(data_transmitting), .Y(n70) );
  INVX1 U92 ( .A(crc5_transmitting), .Y(n56) );
  INVX1 U93 ( .A(crc16_transmitting), .Y(n7) );
  NOR2X1 U94 ( .A(n26), .B(n53), .Y(crc5_transmitting) );
  NOR2X1 U95 ( .A(n78), .B(n25), .Y(data_load_enable) );
  NOR2X1 U96 ( .A(n52), .B(n79), .Y(data_transmitting) );
  NOR2X1 U97 ( .A(n59), .B(n79), .Y(crc16_transmitting) );
  INVX1 U98 ( .A(n36), .Y(crc5_load_enable) );
  NAND2X1 U99 ( .A(n80), .B(n21), .Y(n36) );
  NOR2X1 U100 ( .A(n41), .B(n79), .Y(crc16_load_enable) );
  NOR2X1 U101 ( .A(n25), .B(n41), .Y(handshake_ack) );
  INVX1 U102 ( .A(n65), .Y(N230) );
  NOR2X1 U103 ( .A(N222), .B(n101), .Y(n65) );
  OAI21X1 U104 ( .A(n48), .B(n78), .C(n81), .Y(N229) );
  AOI22X1 U105 ( .A(n80), .B(n76), .C(n21), .D(n22), .Y(n81) );
  NAND2X1 U106 ( .A(n82), .B(n27), .Y(N228) );
  AOI21X1 U107 ( .A(n33), .B(n21), .C(n55), .Y(n27) );
  NOR2X1 U108 ( .A(n83), .B(n48), .Y(n55) );
  INVX1 U109 ( .A(n78), .Y(n33) );
  MUX2X1 U110 ( .B(n22), .A(n23), .S(state[2]), .Y(n82) );
  INVX1 U111 ( .A(n84), .Y(n22) );
  NAND3X1 U112 ( .A(state[4]), .B(state[1]), .C(state[0]), .Y(n84) );
  NAND2X1 U113 ( .A(n31), .B(n19), .Y(N227) );
  NAND2X1 U114 ( .A(n24), .B(n85), .Y(n19) );
  AOI22X1 U115 ( .A(n86), .B(n87), .C(n21), .D(n88), .Y(n31) );
  INVX1 U116 ( .A(n53), .Y(n21) );
  NAND2X1 U117 ( .A(state[2]), .B(n89), .Y(n53) );
  OAI21X1 U118 ( .A(n79), .B(n26), .C(n90), .Y(N226) );
  AOI21X1 U119 ( .A(n23), .B(n24), .C(n34), .Y(n90) );
  NOR2X1 U120 ( .A(n83), .B(n25), .Y(n34) );
  INVX1 U121 ( .A(n52), .Y(n23) );
  NAND3X1 U122 ( .A(n91), .B(n92), .C(state[4]), .Y(n52) );
  NAND2X1 U123 ( .A(n93), .B(n94), .Y(N225) );
  OAI21X1 U124 ( .A(n85), .B(n95), .C(state[2]), .Y(n94) );
  INVX1 U125 ( .A(n41), .Y(n95) );
  INVX1 U126 ( .A(n59), .Y(n85) );
  NAND3X1 U127 ( .A(state[1]), .B(n91), .C(state[4]), .Y(n59) );
  INVX1 U128 ( .A(n67), .Y(n93) );
  OAI21X1 U129 ( .A(n38), .B(n48), .C(n51), .Y(n67) );
  NAND2X1 U130 ( .A(n88), .B(n76), .Y(n51) );
  INVX1 U131 ( .A(n83), .Y(n88) );
  NAND2X1 U132 ( .A(n96), .B(n91), .Y(n83) );
  NOR2X1 U133 ( .A(n87), .B(n80), .Y(n38) );
  INVX1 U134 ( .A(n26), .Y(n87) );
  NAND3X1 U135 ( .A(n91), .B(n97), .C(state[1]), .Y(n26) );
  INVX1 U136 ( .A(state[0]), .Y(n91) );
  NAND2X1 U137 ( .A(n6), .B(n98), .Y(N222) );
  INVX1 U138 ( .A(n106), .Y(n6) );
  NOR2X1 U139 ( .A(n48), .B(n41), .Y(n106) );
  NAND3X1 U140 ( .A(state[4]), .B(n92), .C(state[0]), .Y(n41) );
  INVX1 U141 ( .A(state[1]), .Y(n92) );
  INVX1 U142 ( .A(n24), .Y(n48) );
  NOR2X1 U143 ( .A(n89), .B(state[2]), .Y(n24) );
  INVX1 U144 ( .A(state[3]), .Y(n89) );
  NAND2X1 U145 ( .A(n99), .B(n98), .Y(N221) );
  NAND2X1 U146 ( .A(n80), .B(n86), .Y(n98) );
  INVX1 U147 ( .A(n25), .Y(n86) );
  NAND2X1 U148 ( .A(state[2]), .B(state[3]), .Y(n25) );
  AND2X1 U149 ( .A(n96), .B(state[0]), .Y(n80) );
  NOR2X1 U150 ( .A(state[4]), .B(state[1]), .Y(n96) );
  INVX1 U151 ( .A(n101), .Y(n99) );
  NOR2X1 U152 ( .A(n78), .B(n79), .Y(n101) );
  INVX1 U153 ( .A(n76), .Y(n79) );
  NOR2X1 U154 ( .A(state[3]), .B(state[2]), .Y(n76) );
  NAND3X1 U155 ( .A(state[1]), .B(n97), .C(state[0]), .Y(n78) );
  INVX1 U156 ( .A(state[4]), .Y(n97) );
endmodule


module usb_transmitter ( clk, n_rst, trans_data_ready, trans_data, d_plus, 
        d_minus, handshake_ack );
  input [63:0] trans_data;
  input clk, n_rst, trans_data_ready;
  output d_plus, d_minus, handshake_ack;
  wire   d_orig, idle_transmitting, eop_transmitting, sync_shift_enable,
         pid_shift_enable, crc5_shift_enable, crc16_shift_enable,
         data_shift_enable, sync_load_enable, pid_load_enable,
         crc5_load_enable, crc16_load_enable, data_load_enable,
         sync_transmitting, pid_transmitting, crc5_transmitting,
         crc16_transmitting, data_transmitting, sync_bits_transmitted,
         pid_bits_transmitted, crc5_bits_transmitted, crc16_bits_transmitted,
         data_bits_transmitted;
  wire   [7:0] trans_sync;
  wire   [7:0] trans_pid;
  wire   [4:0] trans_crc5;
  wire   [15:0] trans_crc16;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3;

  encode encode1 ( .clk(clk), .n_rst(n_rst), .d_orig(d_orig), 
        .idle_transmitting(idle_transmitting), .eop_transmitting(
        eop_transmitting), .sync_shift_enable(sync_shift_enable), 
        .pid_shift_enable(pid_shift_enable), .crc5_shift_enable(
        crc5_shift_enable), .crc16_shift_enable(crc16_shift_enable), 
        .data_shift_enable(data_shift_enable), .d_plus(d_plus), .d_minus(
        d_minus) );
  t_shift_register t_shift_register1 ( .clk(clk), .n_rst(n_rst), 
        .sync_shift_enable(sync_shift_enable), .pid_shift_enable(
        pid_shift_enable), .crc5_shift_enable(crc5_shift_enable), 
        .crc16_shift_enable(crc16_shift_enable), .data_shift_enable(
        data_shift_enable), .sync_load_enable(sync_load_enable), 
        .pid_load_enable(pid_load_enable), .crc5_load_enable(crc5_load_enable), 
        .crc16_load_enable(crc16_load_enable), .data_load_enable(
        data_load_enable), .trans_sync({1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0}), .trans_pid({1'b0, 1'b0, trans_pid[5:4], 1'b1, 1'b1, 
        trans_pid[1:0]}), .trans_crc5({1'b1, 1'b1, 1'b1, 1'b1, 1'b1}), 
        .trans_crc16({1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 
        1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1}), .trans_data(trans_data), 
        .sync_transmitting(sync_transmitting), .pid_transmitting(
        pid_transmitting), .crc5_transmitting(crc5_transmitting), 
        .crc16_transmitting(crc16_transmitting), .data_transmitting(
        data_transmitting), .eop_transmitting(eop_transmitting), .d_orig(
        d_orig) );
  t_timer t_timer1 ( .clk(clk), .n_rst(n_rst), .d_edge(1'b0), 
        .sync_transmitting(sync_transmitting), .pid_transmitting(
        pid_transmitting), .crc5_transmitting(crc5_transmitting), 
        .crc16_transmitting(crc16_transmitting), .data_transmitting(
        data_transmitting), .sync_shift_enable(sync_shift_enable), 
        .pid_shift_enable(pid_shift_enable), .crc5_shift_enable(
        crc5_shift_enable), .crc16_shift_enable(crc16_shift_enable), 
        .data_shift_enable(data_shift_enable), .sync_bits_transmitted(
        sync_bits_transmitted), .pid_bits_transmitted(pid_bits_transmitted), 
        .crc5_bits_transmitted(crc5_bits_transmitted), 
        .crc16_bits_transmitted(crc16_bits_transmitted), 
        .data_bits_transmitted(data_bits_transmitted) );
  tcu tcu1 ( .clk(clk), .n_rst(n_rst), .trans_data_ready(trans_data_ready), 
        .sync_bits_transmitted(sync_bits_transmitted), .pid_bits_transmitted(
        pid_bits_transmitted), .crc5_bits_transmitted(crc5_bits_transmitted), 
        .crc16_bits_transmitted(crc16_bits_transmitted), 
        .data_bits_transmitted(data_bits_transmitted), .idle_transmitting(
        idle_transmitting), .sync_transmitting(sync_transmitting), 
        .pid_transmitting(pid_transmitting), .crc5_transmitting(
        crc5_transmitting), .crc16_transmitting(crc16_transmitting), 
        .data_transmitting(data_transmitting), .eop_transmitting(
        eop_transmitting), .sync_load_enable(sync_load_enable), 
        .pid_load_enable(pid_load_enable), .crc5_load_enable(crc5_load_enable), 
        .crc16_load_enable(crc16_load_enable), .data_load_enable(
        data_load_enable), .trans_pid({SYNOPSYS_UNCONNECTED__0, 
        SYNOPSYS_UNCONNECTED__1, trans_pid[5:4], SYNOPSYS_UNCONNECTED__2, 
        SYNOPSYS_UNCONNECTED__3, trans_pid[1:0]}), .trans_data(trans_data), 
        .handshake_ack(handshake_ack) );
endmodule


module usb_encryptor_t ( clk, n_rst, encrypt, d_plus_in, d_minus_in, d_plus_out, 
        d_minus_out );
  input clk, n_rst, encrypt, d_plus_in, d_minus_in;
  output d_plus_out, d_minus_out;
  wire   rcv_data_ready, handshake_ack, trans_data_ready;
  wire   [63:0] rcv_data;
  wire   [63:0] trans_data;

  usb_receiver A1 ( .clk(clk), .n_rst(n_rst), .d_plus(d_plus_in), .d_minus(
        d_minus_in), .rcv_data(rcv_data), .rcv_data_ready(rcv_data_ready) );
  encryptor_core B1 ( .clk(clk), .n_rst(n_rst), .rcv_data_ready(rcv_data_ready), .encrypt(encrypt), .handshake_ack(handshake_ack), .rcv_data(rcv_data), 
        .trans_data(trans_data), .trans_data_ready(trans_data_ready) );
  usb_transmitter C1 ( .clk(clk), .n_rst(n_rst), .trans_data_ready(
        trans_data_ready), .trans_data(trans_data), .d_plus(d_plus_out), 
        .d_minus(d_minus_out), .handshake_ack(handshake_ack) );
endmodule

module  usb_encryptor ( clk, n_rst, encrypt, d_plus_in, d_minus_in, d_plus_out, 
	d_minus_out );

input   clk, n_rst, encrypt, d_plus_in, d_minus_in;
output  d_plus_out, d_minus_out;
wire	nclk, nn_rst, nencrypt, nd_plus_in, nd_minus_in, nd_plus_out, nd_minus_out;

        usb_encryptor_t I0 ( .clk(nclk), .n_rst(nn_rst), .encrypt(nencrypt), .d_plus_in(nd_plus_in), 
	.d_minus_in(nd_minus_in), .d_plus_out(nd_plus_out), .d_minus_out(nd_minus_out) );

PADOUT U1 ( .DO(nd_minus_out), .YPAD(d_minus_out) );
PADOUT U2 ( .DO(nd_plus_out), .YPAD(d_plus_out) );
PADINC U3 ( .DI(nclk), .YPAD(clk) );
PADINC U4 ( .DI(nd_minus_in), .YPAD(d_minus_in) );
PADINC U5 ( .DI(nd_plus_in), .YPAD(d_plus_in) );
PADINC U6 ( .DI(nencrypt), .YPAD(encrypt) );
PADINC U7 ( .DI(nn_rst), .YPAD(n_rst) );

endmodule
