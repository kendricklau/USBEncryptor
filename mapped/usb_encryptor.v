/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Mon Apr 30 15:26:17 2018
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
  wire   n4, d_prev, d_current;

  DFFSR d_current_reg ( .D(d_plus), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        d_current) );
  DFFSR d_prev_reg ( .D(d_current), .CLK(clk), .R(1'b1), .S(n_rst), .Q(d_prev)
         );
  XNOR2X1 U5 ( .A(d_prev), .B(d_current), .Y(n4) );
  INVX2 U6 ( .A(n4), .Y(d_edge) );
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
  wire   N224, N225, N227, N228, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153;
  wire   [4:0] state;
  wire   [4:0] nextstate;
  assign sync_rcving = N224;
  assign pid_rcving = N225;
  assign crc16_rcving = N227;
  assign data_rcving = N228;

  DFFSR \state_reg[0]  ( .D(nextstate[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[0]) );
  DFFSR \state_reg[1]  ( .D(nextstate[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[1]) );
  DFFSR \state_reg[2]  ( .D(nextstate[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[2]) );
  DFFSR \state_reg[4]  ( .D(nextstate[4]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[4]) );
  DFFSR \state_reg[3]  ( .D(nextstate[3]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[3]) );
  NAND3X1 U8 ( .A(n6), .B(n7), .C(n8), .Y(nextstate[4]) );
  NOR2X1 U9 ( .A(n9), .B(n10), .Y(n8) );
  OAI21X1 U10 ( .A(n11), .B(n12), .C(n13), .Y(n10) );
  NAND2X1 U11 ( .A(n14), .B(n15), .Y(n12) );
  NAND3X1 U12 ( .A(n16), .B(n17), .C(n18), .Y(n9) );
  INVX1 U13 ( .A(n19), .Y(n16) );
  AOI22X1 U14 ( .A(n20), .B(n21), .C(n22), .D(n23), .Y(n7) );
  NOR2X1 U15 ( .A(n24), .B(n25), .Y(n6) );
  NAND3X1 U16 ( .A(n26), .B(n27), .C(n28), .Y(nextstate[3]) );
  AOI21X1 U17 ( .A(sync_bits_received), .B(n29), .C(n30), .Y(n28) );
  NAND2X1 U18 ( .A(n13), .B(n31), .Y(n30) );
  INVX1 U19 ( .A(n32), .Y(n27) );
  AOI21X1 U20 ( .A(crc5_rcving), .B(state[1]), .C(n25), .Y(n26) );
  NAND3X1 U21 ( .A(n33), .B(n34), .C(n35), .Y(n25) );
  AOI21X1 U22 ( .A(n36), .B(n23), .C(n37), .Y(n35) );
  INVX1 U23 ( .A(n38), .Y(n23) );
  OAI21X1 U24 ( .A(n39), .B(n40), .C(n41), .Y(n33) );
  NAND3X1 U25 ( .A(rcv_pid[7]), .B(rcv_pid[4]), .C(n42), .Y(n40) );
  AND2X1 U26 ( .A(rcv_pid[1]), .B(rcv_pid[2]), .Y(n42) );
  NAND3X1 U27 ( .A(n43), .B(n44), .C(n45), .Y(n39) );
  NOR2X1 U28 ( .A(rcv_pid[6]), .B(rcv_pid[5]), .Y(n45) );
  INVX1 U29 ( .A(rcv_pid[3]), .Y(n44) );
  NAND3X1 U30 ( .A(n46), .B(n47), .C(n48), .Y(nextstate[2]) );
  NOR2X1 U31 ( .A(n49), .B(n50), .Y(n48) );
  OAI21X1 U32 ( .A(n51), .B(n52), .C(n53), .Y(n50) );
  OAI21X1 U33 ( .A(n54), .B(n55), .C(n15), .Y(n53) );
  OAI22X1 U34 ( .A(n31), .B(n56), .C(n57), .D(n58), .Y(n55) );
  NOR2X1 U35 ( .A(n34), .B(n59), .Y(n54) );
  INVX1 U36 ( .A(n60), .Y(n51) );
  NAND3X1 U37 ( .A(n61), .B(n62), .C(n13), .Y(n49) );
  INVX1 U38 ( .A(n63), .Y(n13) );
  NOR2X1 U39 ( .A(n37), .B(n64), .Y(n47) );
  OAI21X1 U40 ( .A(n65), .B(n38), .C(n66), .Y(n64) );
  OAI21X1 U41 ( .A(d_edge), .B(n67), .C(n68), .Y(n37) );
  NOR2X1 U42 ( .A(n32), .B(n69), .Y(n46) );
  NAND2X1 U43 ( .A(n70), .B(n71), .Y(n32) );
  OAI21X1 U44 ( .A(n11), .B(n72), .C(n14), .Y(n71) );
  NAND2X1 U45 ( .A(n73), .B(n74), .Y(n72) );
  INVX1 U46 ( .A(data_bits_received), .Y(n11) );
  NAND3X1 U47 ( .A(n75), .B(n76), .C(n77), .Y(nextstate[1]) );
  NOR2X1 U48 ( .A(n78), .B(n79), .Y(n77) );
  OAI21X1 U49 ( .A(n56), .B(n80), .C(n81), .Y(n79) );
  OAI21X1 U50 ( .A(n58), .B(n82), .C(n83), .Y(n78) );
  AOI22X1 U51 ( .A(n38), .B(n36), .C(crc5_bits_received), .D(n84), .Y(n83) );
  INVX1 U52 ( .A(n61), .Y(n84) );
  NOR2X1 U53 ( .A(n85), .B(n86), .Y(n38) );
  NAND3X1 U54 ( .A(rcv_sync[7]), .B(n87), .C(n88), .Y(n86) );
  NOR2X1 U55 ( .A(rcv_sync[2]), .B(rcv_sync[1]), .Y(n88) );
  INVX1 U56 ( .A(rcv_sync[0]), .Y(n87) );
  NAND2X1 U57 ( .A(n89), .B(n90), .Y(n85) );
  NOR2X1 U58 ( .A(rcv_sync[6]), .B(rcv_sync[5]), .Y(n90) );
  NOR2X1 U59 ( .A(rcv_sync[4]), .B(rcv_sync[3]), .Y(n89) );
  INVX1 U60 ( .A(pid_bits_received), .Y(n58) );
  AOI21X1 U61 ( .A(n91), .B(n20), .C(n92), .Y(n76) );
  OAI21X1 U62 ( .A(n93), .B(n94), .C(n68), .Y(n92) );
  NAND3X1 U63 ( .A(n95), .B(state[2]), .C(n96), .Y(n68) );
  AOI21X1 U64 ( .A(d_edge), .B(n96), .C(n97), .Y(n94) );
  INVX1 U65 ( .A(n98), .Y(n93) );
  INVX1 U66 ( .A(n21), .Y(n91) );
  NAND3X1 U67 ( .A(rcv_pid[4]), .B(n43), .C(n99), .Y(n21) );
  INVX1 U68 ( .A(rcv_pid[0]), .Y(n43) );
  INVX1 U69 ( .A(n100), .Y(n75) );
  OAI22X1 U70 ( .A(n101), .B(n102), .C(n60), .D(n52), .Y(n100) );
  NAND3X1 U71 ( .A(n99), .B(n103), .C(rcv_pid[0]), .Y(n60) );
  INVX1 U72 ( .A(rcv_pid[4]), .Y(n103) );
  NOR2X1 U73 ( .A(n104), .B(n105), .Y(n99) );
  NAND3X1 U74 ( .A(rcv_pid[3]), .B(rcv_pid[2]), .C(rcv_pid[5]), .Y(n105) );
  INVX1 U75 ( .A(n106), .Y(n104) );
  NOR3X1 U76 ( .A(rcv_pid[6]), .B(rcv_pid[7]), .C(rcv_pid[1]), .Y(n106) );
  INVX1 U77 ( .A(crc16_bits_received), .Y(n101) );
  NAND3X1 U78 ( .A(n107), .B(n108), .C(n109), .Y(nextstate[0]) );
  NOR2X1 U79 ( .A(n110), .B(n111), .Y(n109) );
  OAI21X1 U80 ( .A(crc5_bits_received), .B(n61), .C(n112), .Y(n111) );
  AOI22X1 U81 ( .A(n113), .B(n98), .C(n114), .D(d_edge), .Y(n112) );
  NOR2X1 U82 ( .A(n115), .B(n57), .Y(n114) );
  NAND2X1 U83 ( .A(n31), .B(n116), .Y(n98) );
  OAI21X1 U84 ( .A(n115), .B(n59), .C(n117), .Y(n113) );
  MUX2X1 U85 ( .B(n96), .A(n97), .S(d_edge), .Y(n117) );
  NAND2X1 U86 ( .A(crc5_rcving), .B(n118), .Y(n61) );
  OAI21X1 U87 ( .A(crc16_bits_received), .B(n102), .C(n119), .Y(n110) );
  NOR2X1 U88 ( .A(n22), .B(n120), .Y(n119) );
  NOR2X1 U89 ( .A(n121), .B(n122), .Y(n108) );
  OAI22X1 U90 ( .A(sync_bits_received), .B(n80), .C(pid_bits_received), .D(n82), .Y(n122) );
  AND2X1 U91 ( .A(n65), .B(n81), .Y(n107) );
  NOR2X1 U92 ( .A(n123), .B(n124), .Y(n81) );
  INVX1 U93 ( .A(n125), .Y(n124) );
  AOI21X1 U94 ( .A(n56), .B(n126), .C(n69), .Y(n125) );
  OAI22X1 U95 ( .A(sync_bits_received), .B(n17), .C(n74), .D(n127), .Y(n69) );
  INVX1 U96 ( .A(sync_bits_received), .Y(n56) );
  OAI21X1 U97 ( .A(n128), .B(n129), .C(n130), .Y(n123) );
  NOR2X1 U98 ( .A(n19), .B(n63), .Y(n130) );
  NOR2X1 U99 ( .A(n131), .B(n132), .Y(n63) );
  NAND3X1 U100 ( .A(n133), .B(n134), .C(n135), .Y(n132) );
  NOR2X1 U101 ( .A(n97), .B(n136), .Y(n135) );
  INVX1 U102 ( .A(n24), .Y(n133) );
  NAND2X1 U103 ( .A(n66), .B(n102), .Y(n24) );
  NAND2X1 U104 ( .A(N227), .B(n118), .Y(n102) );
  AOI21X1 U105 ( .A(state[1]), .B(N227), .C(n137), .Y(n66) );
  AOI21X1 U106 ( .A(n74), .B(n134), .C(n116), .Y(n137) );
  NOR2X1 U107 ( .A(n138), .B(n96), .Y(n134) );
  NAND3X1 U108 ( .A(n139), .B(n140), .C(n141), .Y(n131) );
  NOR2X1 U109 ( .A(crc5_rcving), .B(N228), .Y(n141) );
  INVX1 U110 ( .A(N224), .Y(n139) );
  NOR2X1 U111 ( .A(n74), .B(n142), .Y(n19) );
  AOI21X1 U112 ( .A(n136), .B(n59), .C(n143), .Y(n128) );
  OAI22X1 U113 ( .A(data_bits_received), .B(n144), .C(pid_bits_received), .D(
        n57), .Y(n143) );
  INVX1 U114 ( .A(eop), .Y(n59) );
  NOR2X1 U115 ( .A(n127), .B(n145), .Y(crc5_rcving) );
  INVX1 U116 ( .A(n67), .Y(rcv_data_ready) );
  NAND3X1 U117 ( .A(n138), .B(state[2]), .C(n95), .Y(n67) );
  OAI21X1 U118 ( .A(n129), .B(n144), .C(n18), .Y(N228) );
  INVX1 U119 ( .A(n120), .Y(n18) );
  NOR2X1 U120 ( .A(n115), .B(n142), .Y(n120) );
  NOR2X1 U121 ( .A(n142), .B(n145), .Y(N227) );
  NAND3X1 U122 ( .A(n146), .B(n147), .C(state[4]), .Y(n142) );
  INVX1 U123 ( .A(n140), .Y(N225) );
  NOR2X1 U124 ( .A(n121), .B(n148), .Y(n140) );
  OAI21X1 U125 ( .A(n129), .B(n57), .C(n82), .Y(n148) );
  OAI21X1 U126 ( .A(n14), .B(n136), .C(n96), .Y(n82) );
  INVX1 U127 ( .A(n144), .Y(n14) );
  NAND3X1 U128 ( .A(n149), .B(n62), .C(n52), .Y(n121) );
  NAND2X1 U129 ( .A(n136), .B(n97), .Y(n52) );
  INVX1 U130 ( .A(n41), .Y(n62) );
  NOR2X1 U131 ( .A(n127), .B(n115), .Y(n41) );
  NAND2X1 U132 ( .A(n150), .B(state[2]), .Y(n127) );
  INVX1 U133 ( .A(n20), .Y(n149) );
  NOR2X1 U134 ( .A(n144), .B(n74), .Y(n20) );
  NAND3X1 U135 ( .A(n65), .B(n70), .C(n151), .Y(N224) );
  NOR2X1 U136 ( .A(n126), .B(n152), .Y(n151) );
  NAND2X1 U137 ( .A(n80), .B(n17), .Y(n152) );
  INVX1 U138 ( .A(n29), .Y(n17) );
  NOR2X1 U139 ( .A(n129), .B(n116), .Y(n29) );
  NAND3X1 U140 ( .A(state[2]), .B(n147), .C(state[4]), .Y(n116) );
  OR2X1 U141 ( .A(n57), .B(n73), .Y(n80) );
  INVX1 U142 ( .A(n96), .Y(n73) );
  NOR2X1 U143 ( .A(n145), .B(state[1]), .Y(n96) );
  NOR2X1 U144 ( .A(n31), .B(n129), .Y(n126) );
  INVX1 U145 ( .A(n15), .Y(n129) );
  NOR2X1 U146 ( .A(n118), .B(n145), .Y(n15) );
  INVX1 U147 ( .A(state[0]), .Y(n145) );
  NAND3X1 U148 ( .A(n146), .B(n153), .C(state[3]), .Y(n31) );
  INVX1 U149 ( .A(n22), .Y(n70) );
  NOR2X1 U150 ( .A(n144), .B(n115), .Y(n22) );
  INVX1 U151 ( .A(n138), .Y(n115) );
  NAND3X1 U152 ( .A(state[2]), .B(n153), .C(state[3]), .Y(n144) );
  AOI21X1 U153 ( .A(n138), .B(n136), .C(n36), .Y(n65) );
  NOR2X1 U154 ( .A(n57), .B(n74), .Y(n36) );
  INVX1 U155 ( .A(n97), .Y(n74) );
  NOR2X1 U156 ( .A(n118), .B(state[0]), .Y(n97) );
  INVX1 U157 ( .A(state[1]), .Y(n118) );
  NAND2X1 U158 ( .A(n150), .B(n146), .Y(n57) );
  NOR2X1 U159 ( .A(state[3]), .B(state[4]), .Y(n150) );
  INVX1 U160 ( .A(n34), .Y(n136) );
  NAND2X1 U161 ( .A(n95), .B(n146), .Y(n34) );
  INVX1 U162 ( .A(state[2]), .Y(n146) );
  NOR2X1 U163 ( .A(n147), .B(n153), .Y(n95) );
  INVX1 U164 ( .A(state[4]), .Y(n153) );
  INVX1 U165 ( .A(state[3]), .Y(n147) );
  NOR2X1 U166 ( .A(state[0]), .B(state[1]), .Y(n138) );
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

  assign tx_data[63] = des_curr[24];
  assign tx_data[62] = des_curr[56];
  assign tx_data[61] = des_curr[16];
  assign tx_data[60] = des_curr[48];
  assign tx_data[59] = des_curr[8];
  assign tx_data[58] = des_curr[40];
  assign tx_data[57] = des_curr[0];
  assign tx_data[56] = des_curr[32];
  assign tx_data[55] = des_curr[25];
  assign tx_data[54] = des_curr[57];
  assign tx_data[53] = des_curr[17];
  assign tx_data[52] = des_curr[49];
  assign tx_data[51] = des_curr[9];
  assign tx_data[50] = des_curr[41];
  assign tx_data[49] = des_curr[1];
  assign tx_data[48] = des_curr[33];
  assign tx_data[47] = des_curr[26];
  assign tx_data[46] = des_curr[58];
  assign tx_data[45] = des_curr[18];
  assign tx_data[44] = des_curr[50];
  assign tx_data[43] = des_curr[10];
  assign tx_data[42] = des_curr[42];
  assign tx_data[41] = des_curr[2];
  assign tx_data[40] = des_curr[34];
  assign tx_data[39] = des_curr[27];
  assign tx_data[38] = des_curr[59];
  assign tx_data[37] = des_curr[19];
  assign tx_data[36] = des_curr[51];
  assign tx_data[35] = des_curr[11];
  assign tx_data[34] = des_curr[43];
  assign tx_data[33] = des_curr[3];
  assign tx_data[32] = des_curr[35];
  assign tx_data[31] = des_curr[28];
  assign tx_data[30] = des_curr[60];
  assign tx_data[29] = des_curr[20];
  assign tx_data[28] = des_curr[52];
  assign tx_data[27] = des_curr[12];
  assign tx_data[26] = des_curr[44];
  assign tx_data[25] = des_curr[4];
  assign tx_data[24] = des_curr[36];
  assign tx_data[23] = des_curr[29];
  assign tx_data[22] = des_curr[61];
  assign tx_data[21] = des_curr[21];
  assign tx_data[20] = des_curr[53];
  assign tx_data[19] = des_curr[13];
  assign tx_data[18] = des_curr[45];
  assign tx_data[17] = des_curr[5];
  assign tx_data[16] = des_curr[37];
  assign tx_data[15] = des_curr[30];
  assign tx_data[14] = des_curr[62];
  assign tx_data[13] = des_curr[22];
  assign tx_data[12] = des_curr[54];
  assign tx_data[11] = des_curr[14];
  assign tx_data[10] = des_curr[46];
  assign tx_data[9] = des_curr[6];
  assign tx_data[8] = des_curr[38];
  assign tx_data[7] = des_curr[31];
  assign tx_data[6] = des_curr[63];
  assign tx_data[5] = des_curr[23];
  assign tx_data[4] = des_curr[55];
  assign tx_data[3] = des_curr[15];
  assign tx_data[2] = des_curr[47];
  assign tx_data[1] = des_curr[7];
  assign tx_data[0] = des_curr[39];
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


module des_round_computations ( clk, n_rst, des_start, des_enable, round_count, 
        des_in, subkey, des_curr );
  input [4:0] round_count;
  input [63:0] des_in;
  input [47:0] subkey;
  output [63:0] des_curr;
  input clk, n_rst, des_start, des_enable;
  wire   n1167, n1168, n1169, n1170, n1171, n1172, n1173, n1174, n1175, n1176,
         n1177, n1178, n1179, n1180, n1181, n1182, n1183, n1184, n1185, n1186,
         n1187, n1188, n1189, n1190, n1191, n1192, n1193, n1194, n1195, n1196,
         n1197, n1198, n1199, n1200, n1201, n1202, n1203, n1204, n1205, n1206,
         n1207, n1208, n1209, n1210, n1211, n1212, n1213, n1214, n1215, n1216,
         n1217, n1218, n1219, n1220, n1221, n1222, n1223, n1224, n1225, n1226,
         n1227, n1228, n1229, n1230, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n244, n245, n246, n247, n248, n249, n250, n251, n252, n253, n254,
         n255, n256, n257, n258, n259, n260, n261, n262, n263, n264, n265,
         n266, n267, n268, n269, n270, n271, n272, n273, n274, n275, n276,
         n277, n278, n279, n280, n281, n282, n283, n284, n285, n286, n287,
         n288, n289, n290, n291, n292, n293, n294, n295, n296, n297, n298,
         n299, n300, n301, n302, n303, n304, n305, n306, n307, n308, n309,
         n310, n311, n312, n313, n314, n315, n316, n317, n318, n319, n320,
         n321, n322, n323, n324, n325, n326, n327, n328, n329, n330, n331,
         n332, n333, n334, n335, n336, n337, n338, n339, n340, n341, n342,
         n343, n344, n345, n346, n347, n348, n349, n350, n351, n352, n353,
         n354, n355, n356, n357, n358, n359, n360, n361, n362, n363, n364,
         n365, n366, n367, n368, n369, n370, n371, n372, n373, n374, n375,
         n376, n377, n378, n379, n380, n381, n382, n383, n384, n385, n386,
         n387, n388, n389, n390, n391, n392, n393, n394, n395, n396, n397,
         n398, n399, n400, n401, n402, n403, n404, n405, n406, n407, n408,
         n409, n410, n411, n412, n413, n414, n415, n416, n417, n418, n419,
         n420, n421, n422, n423, n424, n425, n426, n427, n428, n429, n430,
         n431, n432, n433, n434, n435, n436, n437, n438, n439, n440, n441,
         n442, n443, n444, n445, n446, n447, n448, n449, n450, n451, n452,
         n453, n454, n455, n456, n457, n458, n459, n460, n461, n462, n463,
         n464, n465, n466, n467, n468, n469, n470, n471, n472, n473, n474,
         n475, n476, n477, n478, n479, n480, n481, n482, n483, n484, n485,
         n486, n487, n488, n489, n490, n491, n492, n493, n494, n495, n496,
         n497, n498, n499, n500, n501, n502, n503, n504, n505, n506, n507,
         n508, n509, n510, n511, n512, n513, n514, n515, n516, n517, n518,
         n519, n520, n521, n522, n523, n524, n525, n526, n527, n528, n529,
         n530, n531, n532, n533, n534, n535, n536, n537, n538, n539, n540,
         n541, n542, n543, n544, n545, n546, n547, n548, n549, n550, n551,
         n552, n553, n554, n555, n556, n557, n558, n559, n560, n561, n562,
         n563, n564, n565, n566, n567, n568, n569, n570, n571, n572, n573,
         n574, n575, n576, n577, n578, n579, n580, n581, n582, n583, n584,
         n585, n586, n587, n588, n589, n590, n591, n592, n593, n594, n595,
         n596, n597, n598, n599, n600, n601, n602, n603, n604, n605, n606,
         n607, n608, n609, n610, n611, n612, n613, n614, n615, n616, n617,
         n618, n619, n620, n621, n622, n623, n624, n625, n626, n627, n628,
         n629, n630, n631, n632, n633, n634, n635, n636, n637, n638, n639,
         n640, n641, n642, n643, n644, n645, n646, n647, n648, n649, n650,
         n651, n652, n653, n654, n655, n656, n657, n658, n659, n660, n661,
         n662, n663, n664, n665, n666, n667, n668, n669, n670, n671, n672,
         n673, n674, n675, n676, n677, n678, n679, n680, n681, n682, n683,
         n684, n685, n686, n687, n688, n689, n690, n691, n692, n693, n694,
         n695, n696, n697, n698, n699, n700, n701, n702, n703, n704, n705,
         n706, n707, n708, n709, n710, n711, n712, n713, n714, n715, n716,
         n717, n718, n719, n720, n721, n722, n723, n724, n725, n726, n727,
         n728, n729, n730, n731, n732, n733, n734, n735, n736, n737, n738,
         n739, n740, n741, n742, n743, n744, n745, n746, n747, n748, n749,
         n750, n751, n752, n753, n754, n755, n756, n757, n758, n759, n760,
         n761, n762, n763, n764, n765, n766, n767, n768, n769, n770, n771,
         n772, n773, n774, n775, n776, n777, n778, n779, n780, n781, n782,
         n783, n784, n785, n786, n787, n788, n789, n790, n791, n792, n793,
         n794, n795, n796, n797, n798, n799, n800, n801, n802, n803, n804,
         n805, n806, n807, n808, n809, n810, n811, n812, n813, n814, n815,
         n816, n817, n818, n819, n820, n821, n822, n823, n824, n825, n826,
         n827, n828, n829, n830, n831, n832, n833, n834, n835, n836, n837,
         n838, n839, n840, n841, n842, n843, n844, n845, n846, n847, n848,
         n849, n850, n851, n852, n853, n854, n855, n856, n857, n858, n859,
         n860, n861, n862, n863, n864, n865, n866, n867, n868, n869, n870,
         n871, n872, n873, n874, n875, n876, n877, n878, n879, n880, n881,
         n882, n883, n884, n885, n886, n887, n888, n889, n890, n891, n892,
         n893, n894, n895, n896, n897, n898, n899, n900, n901, n902, n903,
         n904, n905, n906, n907, n908, n909, n910, n911, n912, n913, n914,
         n915, n916, n917, n918, n919, n920, n921, n922, n923, n924, n925,
         n926, n927, n928, n929, n930, n931, n932, n933, n934, n935, n936,
         n937, n938, n939, n940, n941, n942, n943, n944, n945, n946, n947,
         n948, n949, n950, n951, n952, n953, n954, n955, n956, n957, n958,
         n959, n960, n961, n962, n963, n964, n965, n966, n967, n968, n969,
         n970, n971, n972, n973, n974, n975, n976, n977, n978, n979, n980,
         n981, n982, n983, n984, n985, n986, n987, n988, n989, n990, n991,
         n992, n993, n994, n995, n996, n997, n998, n999, n1000, n1001, n1002,
         n1003, n1004, n1005, n1006, n1007, n1008, n1009, n1010, n1011, n1012,
         n1013, n1014, n1015, n1016, n1017, n1018, n1019, n1020, n1021, n1022,
         n1023, n1024, n1025, n1026, n1027, n1028, n1029, n1030, n1031, n1032,
         n1033, n1034, n1035, n1036, n1037, n1038, n1039, n1040, n1041, n1042,
         n1043, n1044, n1045, n1046, n1047, n1048, n1049, n1050, n1051, n1052,
         n1053, n1054, n1055, n1056, n1057, n1058, n1059, n1060, n1061, n1062,
         n1063, n1064, n1065, n1066, n1067, n1068, n1069, n1070, n1071, n1072,
         n1073, n1074, n1075, n1076, n1077, n1078, n1079, n1080, n1081, n1082,
         n1083, n1084, n1085, n1086, n1087, n1088, n1089, n1090, n1091, n1092,
         n1093, n1094, n1095, n1096, n1097, n1098, n1099, n1100, n1101, n1102,
         n1103, n1104, n1105, n1106, n1107, n1108, n1109, n1110, n1111, n1112,
         n1113, n1114, n1115, n1116, n1117, n1118, n1119, n1120, n1121, n1122,
         n1123, n1124, n1125, n1126, n1127, n1128, n1129, n1130, n1131, n1132,
         n1133, n1134, n1135, n1136, n1137, n1138, n1139, n1140, n1141, n1142,
         n1143, n1144, n1145, n1146, n1147, n1148, n1149, n1150, n1151, n1152,
         n1153, n1154, n1155, n1156, n1157, n1158, n1159, n1160, n1161, n1162,
         n1163, n1164, n1165, n1166, n1231, n1232, n1233, n1234;

  DFFSR \right_reg[0]  ( .D(n1230), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[0]) );
  DFFSR \right_reg[17]  ( .D(n1213), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[17]) );
  DFFSR \left_reg[17]  ( .D(n1181), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[49]) );
  DFFSR \right_reg[12]  ( .D(n1218), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[12]) );
  DFFSR \left_reg[12]  ( .D(n1186), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[44]) );
  DFFSR \right_reg[24]  ( .D(n1206), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[24]) );
  DFFSR \left_reg[24]  ( .D(n1174), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[56]) );
  DFFSR \right_reg[19]  ( .D(n1211), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[19]) );
  DFFSR \left_reg[19]  ( .D(n1179), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[51]) );
  DFFSR \right_reg[6]  ( .D(n1224), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[6]) );
  DFFSR \left_reg[6]  ( .D(n1192), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[38]) );
  DFFSR \right_reg[10]  ( .D(n1220), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[10]) );
  DFFSR \left_reg[10]  ( .D(n1188), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[42]) );
  DFFSR \right_reg[28]  ( .D(n1202), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[28]) );
  DFFSR \left_reg[28]  ( .D(n1170), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[60]) );
  DFFSR \right_reg[14]  ( .D(n1216), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[14]) );
  DFFSR \left_reg[14]  ( .D(n1184), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[46]) );
  DFFSR \right_reg[29]  ( .D(n1201), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[29]) );
  DFFSR \left_reg[29]  ( .D(n1169), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[61]) );
  DFFSR \right_reg[1]  ( .D(n1229), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[1]) );
  DFFSR \left_reg[1]  ( .D(n1197), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[33]) );
  DFFSR \right_reg[5]  ( .D(n1225), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[5]) );
  DFFSR \left_reg[5]  ( .D(n1193), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[37]) );
  DFFSR \right_reg[20]  ( .D(n1210), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[20]) );
  DFFSR \left_reg[20]  ( .D(n1178), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[52]) );
  DFFSR \right_reg[22]  ( .D(n1208), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[22]) );
  DFFSR \left_reg[22]  ( .D(n1176), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[54]) );
  DFFSR \right_reg[2]  ( .D(n1228), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[2]) );
  DFFSR \left_reg[2]  ( .D(n1196), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[34]) );
  DFFSR \right_reg[11]  ( .D(n1219), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[11]) );
  DFFSR \left_reg[11]  ( .D(n1187), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[43]) );
  DFFSR \right_reg[18]  ( .D(n1212), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[18]) );
  DFFSR \left_reg[18]  ( .D(n1180), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[50]) );
  DFFSR \right_reg[31]  ( .D(n1199), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[31]) );
  DFFSR \left_reg[31]  ( .D(n1167), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[63]) );
  DFFSR \right_reg[27]  ( .D(n1203), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[27]) );
  DFFSR \left_reg[27]  ( .D(n1171), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[59]) );
  DFFSR \right_reg[4]  ( .D(n1226), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[4]) );
  DFFSR \left_reg[4]  ( .D(n1194), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[36]) );
  DFFSR \right_reg[25]  ( .D(n1205), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[25]) );
  DFFSR \left_reg[25]  ( .D(n1173), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[57]) );
  DFFSR \right_reg[30]  ( .D(n1200), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[30]) );
  DFFSR \left_reg[30]  ( .D(n1168), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[62]) );
  DFFSR \right_reg[15]  ( .D(n1215), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[15]) );
  DFFSR \left_reg[15]  ( .D(n1183), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[47]) );
  DFFSR \right_reg[23]  ( .D(n1207), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[23]) );
  DFFSR \left_reg[23]  ( .D(n1175), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[55]) );
  DFFSR \right_reg[9]  ( .D(n1221), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[9]) );
  DFFSR \left_reg[9]  ( .D(n1189), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[41]) );
  DFFSR \right_reg[21]  ( .D(n1209), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[21]) );
  DFFSR \left_reg[21]  ( .D(n1177), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[53]) );
  DFFSR \right_reg[16]  ( .D(n1214), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[16]) );
  DFFSR \left_reg[16]  ( .D(n1182), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[48]) );
  DFFSR \right_reg[8]  ( .D(n1222), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[8]) );
  DFFSR \left_reg[8]  ( .D(n1190), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[40]) );
  DFFSR \right_reg[13]  ( .D(n1217), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[13]) );
  DFFSR \left_reg[13]  ( .D(n1185), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[45]) );
  DFFSR \right_reg[7]  ( .D(n1223), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[7]) );
  DFFSR \left_reg[7]  ( .D(n1191), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[39]) );
  DFFSR \right_reg[26]  ( .D(n1204), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[26]) );
  DFFSR \left_reg[26]  ( .D(n1172), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[58]) );
  DFFSR \right_reg[3]  ( .D(n1227), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[3]) );
  DFFSR \left_reg[3]  ( .D(n1195), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[35]) );
  DFFSR \left_reg[0]  ( .D(n1198), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[32]) );
  INVX8 U67 ( .A(n1131), .Y(n71) );
  BUFX2 U68 ( .A(n70), .Y(n65) );
  INVX4 U69 ( .A(des_start), .Y(n68) );
  BUFX2 U70 ( .A(n170), .Y(n66) );
  INVX4 U71 ( .A(n167), .Y(n198) );
  OAI21X1 U72 ( .A(n67), .B(n68), .C(n69), .Y(n1230) );
  AOI22X1 U73 ( .A(des_curr[0]), .B(n65), .C(n71), .D(n72), .Y(n69) );
  INVX1 U74 ( .A(des_in[0]), .Y(n67) );
  OAI21X1 U75 ( .A(n68), .B(n73), .C(n74), .Y(n1229) );
  AOI22X1 U76 ( .A(n75), .B(n71), .C(des_curr[1]), .D(n65), .Y(n74) );
  INVX1 U77 ( .A(des_in[1]), .Y(n73) );
  OAI21X1 U78 ( .A(n68), .B(n76), .C(n77), .Y(n1228) );
  AOI22X1 U79 ( .A(des_curr[2]), .B(n65), .C(n78), .D(n71), .Y(n77) );
  INVX1 U80 ( .A(des_in[2]), .Y(n76) );
  OAI21X1 U81 ( .A(n68), .B(n79), .C(n80), .Y(n1227) );
  AOI22X1 U82 ( .A(des_curr[3]), .B(n65), .C(n81), .D(n71), .Y(n80) );
  INVX1 U83 ( .A(des_in[3]), .Y(n79) );
  OAI21X1 U84 ( .A(n68), .B(n82), .C(n83), .Y(n1226) );
  AOI22X1 U85 ( .A(n84), .B(n71), .C(des_curr[4]), .D(n65), .Y(n83) );
  INVX1 U86 ( .A(des_in[4]), .Y(n82) );
  OAI21X1 U87 ( .A(n68), .B(n85), .C(n86), .Y(n1225) );
  AOI22X1 U88 ( .A(n87), .B(n71), .C(des_curr[5]), .D(n65), .Y(n86) );
  INVX1 U89 ( .A(des_in[5]), .Y(n85) );
  OAI21X1 U90 ( .A(n68), .B(n88), .C(n89), .Y(n1224) );
  AOI22X1 U91 ( .A(n90), .B(n71), .C(des_curr[6]), .D(n65), .Y(n89) );
  INVX1 U92 ( .A(des_in[6]), .Y(n88) );
  OAI21X1 U93 ( .A(n68), .B(n91), .C(n92), .Y(n1223) );
  AOI22X1 U94 ( .A(n93), .B(n71), .C(des_curr[7]), .D(n65), .Y(n92) );
  INVX1 U95 ( .A(des_in[7]), .Y(n91) );
  OAI21X1 U96 ( .A(n68), .B(n94), .C(n95), .Y(n1222) );
  AOI22X1 U97 ( .A(n96), .B(n71), .C(des_curr[8]), .D(n65), .Y(n95) );
  INVX1 U98 ( .A(des_in[8]), .Y(n94) );
  OAI21X1 U99 ( .A(n68), .B(n97), .C(n98), .Y(n1221) );
  AOI22X1 U100 ( .A(n99), .B(n71), .C(des_curr[9]), .D(n65), .Y(n98) );
  INVX1 U101 ( .A(des_in[9]), .Y(n97) );
  OAI21X1 U102 ( .A(n68), .B(n100), .C(n101), .Y(n1220) );
  AOI22X1 U103 ( .A(des_curr[10]), .B(n65), .C(n102), .D(n71), .Y(n101) );
  INVX1 U104 ( .A(des_in[10]), .Y(n100) );
  OAI21X1 U105 ( .A(n68), .B(n103), .C(n104), .Y(n1219) );
  AOI22X1 U106 ( .A(n105), .B(n71), .C(des_curr[11]), .D(n65), .Y(n104) );
  INVX1 U107 ( .A(des_in[11]), .Y(n103) );
  OAI21X1 U108 ( .A(n68), .B(n106), .C(n107), .Y(n1218) );
  AOI22X1 U109 ( .A(des_curr[12]), .B(n65), .C(n108), .D(n71), .Y(n107) );
  INVX1 U110 ( .A(des_in[12]), .Y(n106) );
  OAI21X1 U111 ( .A(n68), .B(n109), .C(n110), .Y(n1217) );
  AOI22X1 U112 ( .A(n111), .B(n71), .C(des_curr[13]), .D(n65), .Y(n110) );
  INVX1 U113 ( .A(des_in[13]), .Y(n109) );
  OAI21X1 U114 ( .A(n68), .B(n112), .C(n113), .Y(n1216) );
  AOI22X1 U115 ( .A(n114), .B(n71), .C(des_curr[14]), .D(n65), .Y(n113) );
  INVX1 U116 ( .A(des_in[14]), .Y(n112) );
  OAI21X1 U117 ( .A(n68), .B(n115), .C(n116), .Y(n1215) );
  AOI22X1 U118 ( .A(n117), .B(n71), .C(des_curr[15]), .D(n65), .Y(n116) );
  INVX1 U119 ( .A(des_in[15]), .Y(n115) );
  OAI21X1 U120 ( .A(n68), .B(n118), .C(n119), .Y(n1214) );
  AOI22X1 U121 ( .A(des_curr[16]), .B(n65), .C(n120), .D(n71), .Y(n119) );
  INVX1 U122 ( .A(des_in[16]), .Y(n118) );
  OAI21X1 U123 ( .A(n68), .B(n121), .C(n122), .Y(n1213) );
  AOI22X1 U124 ( .A(des_curr[17]), .B(n65), .C(n123), .D(n71), .Y(n122) );
  INVX1 U125 ( .A(des_in[17]), .Y(n121) );
  OAI21X1 U126 ( .A(n68), .B(n124), .C(n125), .Y(n1212) );
  AOI22X1 U127 ( .A(n126), .B(n71), .C(des_curr[18]), .D(n65), .Y(n125) );
  INVX1 U128 ( .A(des_in[18]), .Y(n124) );
  OAI21X1 U129 ( .A(n68), .B(n127), .C(n128), .Y(n1211) );
  AOI22X1 U130 ( .A(n129), .B(n71), .C(des_curr[19]), .D(n70), .Y(n128) );
  INVX1 U131 ( .A(des_in[19]), .Y(n127) );
  OAI21X1 U132 ( .A(n68), .B(n130), .C(n131), .Y(n1210) );
  AOI22X1 U133 ( .A(n132), .B(n71), .C(des_curr[20]), .D(n70), .Y(n131) );
  INVX1 U134 ( .A(des_in[20]), .Y(n130) );
  OAI21X1 U135 ( .A(n68), .B(n133), .C(n134), .Y(n1209) );
  AOI22X1 U136 ( .A(n135), .B(n71), .C(des_curr[21]), .D(n70), .Y(n134) );
  INVX1 U137 ( .A(des_in[21]), .Y(n133) );
  OAI21X1 U138 ( .A(n68), .B(n136), .C(n137), .Y(n1208) );
  AOI22X1 U139 ( .A(n138), .B(n71), .C(des_curr[22]), .D(n70), .Y(n137) );
  INVX1 U140 ( .A(des_in[22]), .Y(n136) );
  OAI21X1 U141 ( .A(n68), .B(n139), .C(n140), .Y(n1207) );
  AOI22X1 U142 ( .A(n141), .B(n71), .C(des_curr[23]), .D(n70), .Y(n140) );
  INVX1 U143 ( .A(des_in[23]), .Y(n139) );
  OAI21X1 U144 ( .A(n68), .B(n142), .C(n143), .Y(n1206) );
  AOI22X1 U145 ( .A(n144), .B(n71), .C(des_curr[24]), .D(n70), .Y(n143) );
  INVX1 U146 ( .A(des_in[24]), .Y(n142) );
  OAI21X1 U147 ( .A(n68), .B(n145), .C(n146), .Y(n1205) );
  AOI22X1 U148 ( .A(des_curr[25]), .B(n65), .C(n147), .D(n71), .Y(n146) );
  INVX1 U149 ( .A(des_in[25]), .Y(n145) );
  OAI21X1 U150 ( .A(n68), .B(n148), .C(n149), .Y(n1204) );
  AOI22X1 U151 ( .A(n150), .B(n71), .C(des_curr[26]), .D(n70), .Y(n149) );
  INVX1 U152 ( .A(des_in[26]), .Y(n148) );
  OAI21X1 U153 ( .A(n68), .B(n151), .C(n152), .Y(n1203) );
  AOI22X1 U154 ( .A(n153), .B(n71), .C(des_curr[27]), .D(n70), .Y(n152) );
  INVX1 U155 ( .A(des_in[27]), .Y(n151) );
  OAI21X1 U156 ( .A(n68), .B(n154), .C(n155), .Y(n1202) );
  AOI22X1 U157 ( .A(n156), .B(n71), .C(des_curr[28]), .D(n70), .Y(n155) );
  INVX1 U158 ( .A(des_in[28]), .Y(n154) );
  OAI21X1 U159 ( .A(n68), .B(n157), .C(n158), .Y(n1201) );
  AOI22X1 U160 ( .A(n159), .B(n71), .C(des_curr[29]), .D(n70), .Y(n158) );
  INVX1 U161 ( .A(des_in[29]), .Y(n157) );
  OAI21X1 U162 ( .A(n68), .B(n160), .C(n161), .Y(n1200) );
  AOI22X1 U163 ( .A(des_curr[30]), .B(n65), .C(n162), .D(n71), .Y(n161) );
  INVX1 U164 ( .A(des_in[30]), .Y(n160) );
  OAI21X1 U165 ( .A(n68), .B(n163), .C(n164), .Y(n1199) );
  AOI22X1 U166 ( .A(n165), .B(n71), .C(des_curr[31]), .D(n70), .Y(n164) );
  OAI21X1 U167 ( .A(des_start), .B(n166), .C(n167), .Y(n70) );
  INVX1 U168 ( .A(des_in[31]), .Y(n163) );
  NAND2X1 U169 ( .A(n168), .B(n169), .Y(n1198) );
  AOI22X1 U170 ( .A(n66), .B(n72), .C(n71), .D(des_curr[0]), .Y(n169) );
  XOR2X1 U171 ( .A(n171), .B(des_curr[32]), .Y(n72) );
  NAND3X1 U172 ( .A(n172), .B(n173), .C(n174), .Y(n171) );
  NOR2X1 U173 ( .A(n175), .B(n176), .Y(n174) );
  OAI21X1 U174 ( .A(n177), .B(n178), .C(n179), .Y(n176) );
  OAI21X1 U175 ( .A(n180), .B(n181), .C(n182), .Y(n179) );
  NAND2X1 U176 ( .A(n183), .B(n184), .Y(n181) );
  INVX1 U177 ( .A(n185), .Y(n177) );
  OAI21X1 U178 ( .A(n186), .B(n187), .C(n188), .Y(n175) );
  OAI21X1 U179 ( .A(n189), .B(n190), .C(n191), .Y(n188) );
  NOR2X1 U180 ( .A(n192), .B(n193), .Y(n187) );
  AOI21X1 U181 ( .A(n194), .B(n195), .C(n196), .Y(n172) );
  INVX1 U182 ( .A(n197), .Y(n196) );
  AOI22X1 U183 ( .A(n198), .B(des_curr[32]), .C(des_in[32]), .D(des_start), 
        .Y(n168) );
  NAND2X1 U184 ( .A(n199), .B(n200), .Y(n1197) );
  AOI22X1 U185 ( .A(n66), .B(n75), .C(des_curr[1]), .D(n71), .Y(n200) );
  XOR2X1 U186 ( .A(n201), .B(des_curr[33]), .Y(n75) );
  NAND3X1 U187 ( .A(n202), .B(n203), .C(n204), .Y(n201) );
  NOR2X1 U188 ( .A(n205), .B(n206), .Y(n204) );
  OAI22X1 U189 ( .A(n207), .B(n208), .C(n209), .D(n210), .Y(n206) );
  INVX1 U190 ( .A(n211), .Y(n210) );
  NAND3X1 U191 ( .A(n212), .B(n213), .C(n214), .Y(n205) );
  OAI21X1 U192 ( .A(n215), .B(n216), .C(n217), .Y(n214) );
  OAI21X1 U193 ( .A(n218), .B(n219), .C(n220), .Y(n213) );
  INVX1 U194 ( .A(n221), .Y(n218) );
  OAI21X1 U195 ( .A(n222), .B(n223), .C(n224), .Y(n212) );
  AOI21X1 U196 ( .A(n225), .B(n226), .C(n227), .Y(n203) );
  AOI22X1 U197 ( .A(n198), .B(des_curr[33]), .C(des_in[33]), .D(des_start), 
        .Y(n199) );
  NAND2X1 U198 ( .A(n228), .B(n229), .Y(n1196) );
  AOI22X1 U199 ( .A(n66), .B(n78), .C(des_curr[2]), .D(n71), .Y(n229) );
  XNOR2X1 U200 ( .A(des_curr[34]), .B(n230), .Y(n78) );
  NOR2X1 U201 ( .A(n231), .B(n232), .Y(n230) );
  NAND3X1 U202 ( .A(n233), .B(n234), .C(n235), .Y(n232) );
  OAI21X1 U203 ( .A(n236), .B(n237), .C(n238), .Y(n234) );
  INVX1 U204 ( .A(n239), .Y(n237) );
  OAI21X1 U205 ( .A(n240), .B(n241), .C(n242), .Y(n233) );
  NAND2X1 U206 ( .A(n243), .B(n244), .Y(n241) );
  NAND3X1 U207 ( .A(n245), .B(n246), .C(n247), .Y(n231) );
  NOR2X1 U208 ( .A(n248), .B(n249), .Y(n247) );
  INVX1 U209 ( .A(n250), .Y(n248) );
  OAI21X1 U210 ( .A(n251), .B(n252), .C(n253), .Y(n250) );
  OAI21X1 U211 ( .A(n254), .B(n252), .C(n255), .Y(n246) );
  OAI21X1 U212 ( .A(n256), .B(n257), .C(n258), .Y(n245) );
  AOI22X1 U213 ( .A(n198), .B(des_curr[34]), .C(des_in[34]), .D(des_start), 
        .Y(n228) );
  NAND2X1 U214 ( .A(n259), .B(n260), .Y(n1195) );
  AOI22X1 U215 ( .A(n66), .B(n81), .C(n71), .D(des_curr[3]), .Y(n260) );
  XNOR2X1 U216 ( .A(des_curr[35]), .B(n261), .Y(n81) );
  NOR2X1 U217 ( .A(n262), .B(n263), .Y(n261) );
  NAND3X1 U218 ( .A(n264), .B(n265), .C(n266), .Y(n263) );
  NAND3X1 U219 ( .A(n267), .B(n268), .C(n269), .Y(n262) );
  INVX1 U220 ( .A(n270), .Y(n269) );
  OAI22X1 U221 ( .A(n271), .B(n272), .C(n273), .D(n274), .Y(n270) );
  OAI21X1 U222 ( .A(n275), .B(n276), .C(n277), .Y(n268) );
  OAI21X1 U223 ( .A(n278), .B(n279), .C(n280), .Y(n267) );
  INVX1 U224 ( .A(n281), .Y(n279) );
  AOI22X1 U225 ( .A(n198), .B(des_curr[35]), .C(des_in[35]), .D(des_start), 
        .Y(n259) );
  NAND2X1 U226 ( .A(n282), .B(n283), .Y(n1194) );
  AOI22X1 U227 ( .A(n66), .B(n84), .C(n71), .D(des_curr[4]), .Y(n283) );
  XOR2X1 U228 ( .A(n284), .B(des_curr[36]), .Y(n84) );
  NAND2X1 U229 ( .A(n285), .B(n286), .Y(n284) );
  NOR2X1 U230 ( .A(n287), .B(n288), .Y(n286) );
  OAI21X1 U231 ( .A(n289), .B(n290), .C(n291), .Y(n288) );
  OAI21X1 U232 ( .A(n292), .B(n293), .C(n294), .Y(n291) );
  NAND3X1 U233 ( .A(n295), .B(n296), .C(n297), .Y(n287) );
  OAI21X1 U234 ( .A(n298), .B(n299), .C(n300), .Y(n297) );
  OAI21X1 U235 ( .A(n301), .B(n302), .C(n303), .Y(n296) );
  OAI21X1 U236 ( .A(n304), .B(n305), .C(n293), .Y(n295) );
  NOR2X1 U237 ( .A(n306), .B(n307), .Y(n285) );
  OAI21X1 U238 ( .A(n308), .B(n309), .C(n310), .Y(n307) );
  OAI21X1 U239 ( .A(n311), .B(n312), .C(n313), .Y(n306) );
  AOI22X1 U240 ( .A(n314), .B(n315), .C(n316), .D(n292), .Y(n313) );
  AOI22X1 U241 ( .A(n198), .B(des_curr[36]), .C(des_in[36]), .D(des_start), 
        .Y(n282) );
  NAND2X1 U242 ( .A(n317), .B(n318), .Y(n1193) );
  AOI22X1 U243 ( .A(n66), .B(n87), .C(n71), .D(des_curr[5]), .Y(n318) );
  XOR2X1 U244 ( .A(n319), .B(des_curr[37]), .Y(n87) );
  NAND3X1 U245 ( .A(n320), .B(n321), .C(n322), .Y(n319) );
  NOR2X1 U246 ( .A(n323), .B(n324), .Y(n322) );
  OAI21X1 U247 ( .A(n325), .B(n326), .C(n327), .Y(n324) );
  OAI21X1 U248 ( .A(n328), .B(n329), .C(n330), .Y(n327) );
  INVX1 U249 ( .A(n331), .Y(n329) );
  NOR2X1 U250 ( .A(n332), .B(n333), .Y(n325) );
  NAND2X1 U251 ( .A(n334), .B(n335), .Y(n333) );
  OAI21X1 U252 ( .A(n336), .B(n337), .C(n338), .Y(n323) );
  OAI21X1 U253 ( .A(n339), .B(n340), .C(n341), .Y(n338) );
  AOI21X1 U254 ( .A(n342), .B(n343), .C(n344), .Y(n336) );
  AOI22X1 U255 ( .A(n345), .B(n346), .C(n347), .D(n348), .Y(n321) );
  AOI21X1 U256 ( .A(n349), .B(n350), .C(n351), .Y(n320) );
  AOI22X1 U257 ( .A(n198), .B(des_curr[37]), .C(des_in[37]), .D(des_start), 
        .Y(n317) );
  NAND2X1 U258 ( .A(n352), .B(n353), .Y(n1192) );
  AOI22X1 U259 ( .A(n66), .B(n90), .C(n71), .D(des_curr[6]), .Y(n353) );
  XOR2X1 U260 ( .A(n354), .B(des_curr[38]), .Y(n90) );
  NAND3X1 U261 ( .A(n355), .B(n356), .C(n357), .Y(n354) );
  NOR2X1 U262 ( .A(n358), .B(n359), .Y(n357) );
  OAI22X1 U263 ( .A(n360), .B(n361), .C(n362), .D(n363), .Y(n359) );
  NAND3X1 U264 ( .A(n364), .B(n365), .C(n366), .Y(n358) );
  OAI21X1 U265 ( .A(n367), .B(n368), .C(n369), .Y(n366) );
  NAND2X1 U266 ( .A(n370), .B(n371), .Y(n368) );
  OAI21X1 U267 ( .A(n372), .B(n373), .C(n374), .Y(n365) );
  OAI21X1 U268 ( .A(n375), .B(n376), .C(n377), .Y(n364) );
  AOI22X1 U269 ( .A(n375), .B(n378), .C(n379), .D(n380), .Y(n356) );
  NOR2X1 U270 ( .A(n381), .B(n382), .Y(n355) );
  AOI22X1 U271 ( .A(n198), .B(des_curr[38]), .C(des_in[38]), .D(des_start), 
        .Y(n352) );
  NAND2X1 U272 ( .A(n383), .B(n384), .Y(n1191) );
  AOI22X1 U273 ( .A(n66), .B(n93), .C(n71), .D(des_curr[7]), .Y(n384) );
  XOR2X1 U274 ( .A(n385), .B(des_curr[39]), .Y(n93) );
  NAND3X1 U275 ( .A(n386), .B(n387), .C(n388), .Y(n385) );
  NOR2X1 U276 ( .A(n389), .B(n390), .Y(n388) );
  OAI22X1 U277 ( .A(n391), .B(n392), .C(n393), .D(n394), .Y(n390) );
  OAI21X1 U278 ( .A(n395), .B(n396), .C(n397), .Y(n389) );
  AND2X1 U279 ( .A(n398), .B(n399), .Y(n397) );
  OAI21X1 U280 ( .A(n400), .B(n401), .C(n402), .Y(n399) );
  INVX1 U281 ( .A(n403), .Y(n400) );
  OAI21X1 U282 ( .A(n404), .B(n405), .C(n406), .Y(n398) );
  INVX1 U283 ( .A(n407), .Y(n405) );
  NOR2X1 U284 ( .A(n408), .B(n409), .Y(n387) );
  OAI22X1 U285 ( .A(n410), .B(n407), .C(n411), .D(n412), .Y(n409) );
  NOR2X1 U286 ( .A(n413), .B(n414), .Y(n386) );
  AOI22X1 U287 ( .A(n198), .B(des_curr[39]), .C(des_in[39]), .D(des_start), 
        .Y(n383) );
  NAND2X1 U288 ( .A(n415), .B(n416), .Y(n1190) );
  AOI22X1 U289 ( .A(n66), .B(n96), .C(n71), .D(des_curr[8]), .Y(n416) );
  XOR2X1 U290 ( .A(n417), .B(des_curr[40]), .Y(n96) );
  NAND3X1 U291 ( .A(n418), .B(n235), .C(n419), .Y(n417) );
  NOR2X1 U292 ( .A(n420), .B(n421), .Y(n419) );
  OAI21X1 U293 ( .A(n422), .B(n423), .C(n424), .Y(n421) );
  OAI21X1 U294 ( .A(n425), .B(n426), .C(n238), .Y(n424) );
  NAND2X1 U295 ( .A(n427), .B(n428), .Y(n426) );
  INVX1 U296 ( .A(n429), .Y(n422) );
  OAI21X1 U297 ( .A(n430), .B(n431), .C(n432), .Y(n420) );
  INVX1 U298 ( .A(n433), .Y(n432) );
  NOR2X1 U299 ( .A(n434), .B(n240), .Y(n431) );
  NOR2X1 U300 ( .A(n435), .B(n436), .Y(n235) );
  OAI22X1 U301 ( .A(n437), .B(n438), .C(n430), .D(n439), .Y(n436) );
  OAI21X1 U302 ( .A(n440), .B(n441), .C(n442), .Y(n435) );
  INVX1 U303 ( .A(n443), .Y(n442) );
  AOI21X1 U304 ( .A(n444), .B(n445), .C(n446), .Y(n443) );
  AOI22X1 U305 ( .A(n447), .B(n258), .C(n254), .D(n448), .Y(n418) );
  AOI22X1 U306 ( .A(n198), .B(des_curr[40]), .C(des_in[40]), .D(des_start), 
        .Y(n415) );
  NAND2X1 U307 ( .A(n449), .B(n450), .Y(n1189) );
  AOI22X1 U308 ( .A(n66), .B(n99), .C(des_curr[9]), .D(n71), .Y(n450) );
  XOR2X1 U309 ( .A(n451), .B(des_curr[41]), .Y(n99) );
  NAND3X1 U310 ( .A(n452), .B(n453), .C(n454), .Y(n451) );
  AOI21X1 U311 ( .A(n455), .B(n456), .C(n457), .Y(n454) );
  OAI21X1 U312 ( .A(n458), .B(n459), .C(n460), .Y(n457) );
  OAI21X1 U313 ( .A(n461), .B(n222), .C(n211), .Y(n460) );
  INVX1 U314 ( .A(n462), .Y(n461) );
  NOR2X1 U315 ( .A(n215), .B(n463), .Y(n459) );
  NAND3X1 U316 ( .A(n464), .B(n465), .C(n466), .Y(n455) );
  AOI22X1 U317 ( .A(n216), .B(n220), .C(n217), .D(n467), .Y(n452) );
  INVX1 U318 ( .A(n468), .Y(n216) );
  AOI22X1 U319 ( .A(n198), .B(des_curr[41]), .C(des_in[41]), .D(des_start), 
        .Y(n449) );
  NAND2X1 U320 ( .A(n469), .B(n470), .Y(n1188) );
  AOI22X1 U321 ( .A(n66), .B(n102), .C(des_curr[10]), .D(n71), .Y(n470) );
  XNOR2X1 U322 ( .A(des_curr[42]), .B(n471), .Y(n102) );
  NOR2X1 U323 ( .A(n472), .B(n473), .Y(n471) );
  NAND3X1 U324 ( .A(n474), .B(n197), .C(n475), .Y(n473) );
  AOI22X1 U325 ( .A(n476), .B(n477), .C(n193), .D(n195), .Y(n475) );
  NOR2X1 U326 ( .A(n478), .B(n479), .Y(n197) );
  OAI22X1 U327 ( .A(n480), .B(n481), .C(n186), .D(n482), .Y(n479) );
  INVX1 U328 ( .A(n483), .Y(n482) );
  OAI21X1 U329 ( .A(n484), .B(n485), .C(n486), .Y(n478) );
  OAI21X1 U330 ( .A(n487), .B(n180), .C(n488), .Y(n486) );
  INVX1 U331 ( .A(n489), .Y(n474) );
  NAND3X1 U332 ( .A(n490), .B(n491), .C(n492), .Y(n472) );
  AND2X1 U333 ( .A(n493), .B(n494), .Y(n492) );
  OAI21X1 U334 ( .A(n180), .B(n495), .C(n496), .Y(n494) );
  OAI21X1 U335 ( .A(n497), .B(n194), .C(n182), .Y(n493) );
  OAI21X1 U336 ( .A(n192), .B(n483), .C(n191), .Y(n491) );
  OAI21X1 U337 ( .A(n498), .B(n189), .C(n488), .Y(n490) );
  AOI22X1 U338 ( .A(n198), .B(des_curr[42]), .C(des_in[42]), .D(des_start), 
        .Y(n469) );
  NAND2X1 U339 ( .A(n499), .B(n500), .Y(n1187) );
  AOI22X1 U340 ( .A(n66), .B(n105), .C(des_curr[11]), .D(n71), .Y(n500) );
  XOR2X1 U341 ( .A(n501), .B(des_curr[43]), .Y(n105) );
  NAND3X1 U342 ( .A(n502), .B(n503), .C(n504), .Y(n501) );
  NOR2X1 U343 ( .A(n505), .B(n506), .Y(n504) );
  INVX1 U344 ( .A(n507), .Y(n506) );
  AOI22X1 U345 ( .A(n508), .B(n344), .C(n509), .D(n348), .Y(n507) );
  NAND3X1 U346 ( .A(n510), .B(n511), .C(n512), .Y(n505) );
  OAI21X1 U347 ( .A(n513), .B(n514), .C(n330), .Y(n512) );
  OAI21X1 U348 ( .A(n328), .B(n515), .C(n516), .Y(n510) );
  AOI22X1 U349 ( .A(n340), .B(n517), .C(n339), .D(n518), .Y(n503) );
  AOI21X1 U350 ( .A(n519), .B(n350), .C(n351), .Y(n502) );
  OR2X1 U351 ( .A(n520), .B(n521), .Y(n351) );
  OAI21X1 U352 ( .A(n522), .B(n523), .C(n524), .Y(n521) );
  OAI21X1 U353 ( .A(n515), .B(n514), .C(n348), .Y(n524) );
  NAND2X1 U354 ( .A(n525), .B(n334), .Y(n514) );
  INVX1 U355 ( .A(n335), .Y(n515) );
  NOR2X1 U356 ( .A(n344), .B(n526), .Y(n522) );
  NAND2X1 U357 ( .A(n527), .B(n528), .Y(n526) );
  NAND3X1 U358 ( .A(n529), .B(n530), .C(n531), .Y(n520) );
  OAI21X1 U359 ( .A(n519), .B(n532), .C(n518), .Y(n531) );
  OAI21X1 U360 ( .A(n513), .B(n533), .C(n517), .Y(n530) );
  NAND2X1 U361 ( .A(n326), .B(n337), .Y(n517) );
  OAI21X1 U362 ( .A(n332), .B(n509), .C(n516), .Y(n529) );
  NAND2X1 U363 ( .A(n331), .B(n534), .Y(n509) );
  INVX1 U364 ( .A(n535), .Y(n332) );
  AOI22X1 U365 ( .A(n198), .B(des_curr[43]), .C(des_in[43]), .D(des_start), 
        .Y(n499) );
  NAND2X1 U366 ( .A(n536), .B(n537), .Y(n1186) );
  AOI22X1 U367 ( .A(n66), .B(n108), .C(des_curr[12]), .D(n71), .Y(n537) );
  XNOR2X1 U368 ( .A(des_curr[44]), .B(n538), .Y(n108) );
  NOR2X1 U369 ( .A(n539), .B(n540), .Y(n538) );
  NAND3X1 U370 ( .A(n541), .B(n542), .C(n543), .Y(n540) );
  AOI22X1 U371 ( .A(n544), .B(n379), .C(n373), .D(n377), .Y(n543) );
  INVX1 U372 ( .A(n381), .Y(n542) );
  OAI21X1 U373 ( .A(n370), .B(n545), .C(n546), .Y(n381) );
  AOI22X1 U374 ( .A(n379), .B(n547), .C(n372), .D(n377), .Y(n546) );
  NAND3X1 U375 ( .A(n548), .B(n549), .C(n550), .Y(n539) );
  AOI22X1 U376 ( .A(n367), .B(n551), .C(n552), .D(n378), .Y(n550) );
  NAND2X1 U377 ( .A(n553), .B(n554), .Y(n367) );
  OAI21X1 U378 ( .A(n547), .B(n380), .C(n369), .Y(n549) );
  OAI21X1 U379 ( .A(n555), .B(n556), .C(n374), .Y(n548) );
  AOI22X1 U380 ( .A(n198), .B(des_curr[44]), .C(des_in[44]), .D(des_start), 
        .Y(n536) );
  NAND2X1 U381 ( .A(n557), .B(n558), .Y(n1185) );
  AOI22X1 U382 ( .A(n66), .B(n111), .C(des_curr[13]), .D(n71), .Y(n558) );
  XOR2X1 U383 ( .A(n559), .B(des_curr[45]), .Y(n111) );
  NAND3X1 U384 ( .A(n560), .B(n561), .C(n562), .Y(n559) );
  NOR2X1 U385 ( .A(n563), .B(n564), .Y(n562) );
  OAI21X1 U386 ( .A(n565), .B(n271), .C(n566), .Y(n564) );
  OAI21X1 U387 ( .A(n567), .B(n568), .C(n569), .Y(n566) );
  INVX1 U388 ( .A(n570), .Y(n567) );
  OAI21X1 U389 ( .A(n571), .B(n572), .C(n573), .Y(n563) );
  OAI21X1 U390 ( .A(n278), .B(n574), .C(n277), .Y(n573) );
  INVX1 U391 ( .A(n280), .Y(n572) );
  AND2X1 U392 ( .A(n575), .B(n576), .Y(n571) );
  AND2X1 U393 ( .A(n265), .B(n577), .Y(n560) );
  NOR2X1 U394 ( .A(n578), .B(n579), .Y(n265) );
  INVX1 U395 ( .A(n580), .Y(n579) );
  AOI21X1 U396 ( .A(n581), .B(n280), .C(n582), .Y(n580) );
  NAND3X1 U397 ( .A(n583), .B(n584), .C(n585), .Y(n578) );
  OAI21X1 U398 ( .A(n586), .B(n587), .C(n569), .Y(n585) );
  OAI21X1 U399 ( .A(n588), .B(n589), .C(n590), .Y(n587) );
  OAI21X1 U400 ( .A(n591), .B(n275), .C(n592), .Y(n584) );
  OAI21X1 U401 ( .A(n593), .B(n594), .C(n277), .Y(n583) );
  INVX1 U402 ( .A(n595), .Y(n594) );
  AOI22X1 U403 ( .A(n198), .B(des_curr[45]), .C(des_in[45]), .D(des_start), 
        .Y(n557) );
  NAND2X1 U404 ( .A(n596), .B(n597), .Y(n1184) );
  AOI22X1 U405 ( .A(n66), .B(n114), .C(des_curr[14]), .D(n71), .Y(n597) );
  XOR2X1 U406 ( .A(n598), .B(des_curr[46]), .Y(n114) );
  NAND2X1 U407 ( .A(n599), .B(n600), .Y(n598) );
  NOR2X1 U408 ( .A(n601), .B(n602), .Y(n600) );
  OAI21X1 U409 ( .A(n603), .B(n604), .C(n605), .Y(n602) );
  OAI21X1 U410 ( .A(n606), .B(n301), .C(n292), .Y(n605) );
  NOR2X1 U411 ( .A(n316), .B(n607), .Y(n604) );
  NAND3X1 U412 ( .A(n608), .B(n609), .C(n610), .Y(n601) );
  OAI21X1 U413 ( .A(n611), .B(n299), .C(n612), .Y(n610) );
  NAND2X1 U414 ( .A(n613), .B(n614), .Y(n299) );
  OAI21X1 U415 ( .A(n314), .B(n615), .C(n616), .Y(n608) );
  NOR2X1 U416 ( .A(n617), .B(n618), .Y(n599) );
  OAI21X1 U417 ( .A(n619), .B(n620), .C(n621), .Y(n618) );
  OAI21X1 U418 ( .A(n289), .B(n622), .C(n623), .Y(n617) );
  OAI21X1 U419 ( .A(n624), .B(n625), .C(n315), .Y(n623) );
  NAND2X1 U420 ( .A(n626), .B(n309), .Y(n625) );
  NOR2X1 U421 ( .A(n292), .B(n616), .Y(n289) );
  AOI22X1 U422 ( .A(n198), .B(des_curr[46]), .C(des_in[46]), .D(des_start), 
        .Y(n596) );
  NAND2X1 U423 ( .A(n627), .B(n628), .Y(n1183) );
  AOI22X1 U424 ( .A(n66), .B(n117), .C(des_curr[15]), .D(n71), .Y(n628) );
  XOR2X1 U425 ( .A(n629), .B(des_curr[47]), .Y(n117) );
  NAND3X1 U426 ( .A(n630), .B(n631), .C(n632), .Y(n629) );
  NOR2X1 U427 ( .A(n633), .B(n634), .Y(n632) );
  OAI21X1 U428 ( .A(n635), .B(n465), .C(n636), .Y(n634) );
  INVX1 U429 ( .A(n227), .Y(n636) );
  OAI21X1 U430 ( .A(n637), .B(n638), .C(n639), .Y(n227) );
  AOI22X1 U431 ( .A(n640), .B(n456), .C(n226), .D(n467), .Y(n639) );
  OAI21X1 U432 ( .A(n641), .B(n642), .C(n643), .Y(n640) );
  INVX1 U433 ( .A(n644), .Y(n643) );
  INVX1 U434 ( .A(n453), .Y(n633) );
  NOR2X1 U435 ( .A(n645), .B(n646), .Y(n453) );
  OAI22X1 U436 ( .A(n637), .B(n647), .C(n458), .D(n209), .Y(n646) );
  OAI21X1 U437 ( .A(n207), .B(n648), .C(n649), .Y(n645) );
  OAI21X1 U438 ( .A(n644), .B(n650), .C(n226), .Y(n649) );
  AND2X1 U439 ( .A(n651), .B(n652), .Y(n631) );
  OAI21X1 U440 ( .A(n653), .B(n654), .C(n220), .Y(n652) );
  INVX1 U441 ( .A(n655), .Y(n653) );
  OAI21X1 U442 ( .A(n656), .B(n463), .C(n211), .Y(n651) );
  NAND2X1 U443 ( .A(n647), .B(n657), .Y(n463) );
  INVX1 U444 ( .A(n219), .Y(n647) );
  AOI22X1 U445 ( .A(n650), .B(n456), .C(n215), .D(n658), .Y(n630) );
  INVX1 U446 ( .A(n659), .Y(n215) );
  NAND2X1 U447 ( .A(n660), .B(n221), .Y(n650) );
  NAND2X1 U448 ( .A(n661), .B(n662), .Y(n221) );
  AOI22X1 U449 ( .A(n198), .B(des_curr[47]), .C(des_in[47]), .D(des_start), 
        .Y(n627) );
  NAND2X1 U450 ( .A(n663), .B(n664), .Y(n1182) );
  AOI22X1 U451 ( .A(n66), .B(n120), .C(des_curr[16]), .D(n71), .Y(n664) );
  XOR2X1 U452 ( .A(n665), .B(des_curr[48]), .Y(n120) );
  NAND2X1 U453 ( .A(n666), .B(n667), .Y(n665) );
  NOR2X1 U454 ( .A(n668), .B(n669), .Y(n667) );
  OAI21X1 U455 ( .A(n427), .B(n438), .C(n670), .Y(n669) );
  OAI21X1 U456 ( .A(n434), .B(n671), .C(n242), .Y(n670) );
  AND2X1 U457 ( .A(n672), .B(n437), .Y(n427) );
  OAI21X1 U458 ( .A(n446), .B(n673), .C(n674), .Y(n668) );
  OAI21X1 U459 ( .A(n671), .B(n236), .C(n675), .Y(n674) );
  INVX1 U460 ( .A(n676), .Y(n236) );
  NOR2X1 U461 ( .A(n256), .B(n252), .Y(n673) );
  NAND2X1 U462 ( .A(n428), .B(n677), .Y(n252) );
  INVX1 U463 ( .A(n678), .Y(n256) );
  NOR2X1 U464 ( .A(n679), .B(n680), .Y(n666) );
  OAI21X1 U465 ( .A(n441), .B(n681), .C(n682), .Y(n680) );
  OAI21X1 U466 ( .A(n683), .B(n425), .C(n255), .Y(n682) );
  INVX1 U467 ( .A(n430), .Y(n255) );
  NAND2X1 U468 ( .A(n684), .B(n678), .Y(n425) );
  NAND3X1 U469 ( .A(n244), .B(n444), .C(n239), .Y(n683) );
  INVX1 U470 ( .A(n253), .Y(n441) );
  AOI22X1 U471 ( .A(n198), .B(des_curr[48]), .C(des_in[48]), .D(des_start), 
        .Y(n663) );
  NAND2X1 U472 ( .A(n685), .B(n686), .Y(n1181) );
  AOI22X1 U473 ( .A(n66), .B(n123), .C(des_curr[17]), .D(n71), .Y(n686) );
  XOR2X1 U474 ( .A(n687), .B(des_curr[49]), .Y(n123) );
  NAND3X1 U475 ( .A(n688), .B(n689), .C(n690), .Y(n687) );
  NOR2X1 U476 ( .A(n691), .B(n692), .Y(n690) );
  OAI21X1 U477 ( .A(n693), .B(n694), .C(n695), .Y(n692) );
  OAI21X1 U478 ( .A(n340), .B(n519), .C(n346), .Y(n695) );
  NOR2X1 U479 ( .A(n513), .B(n696), .Y(n693) );
  OAI21X1 U480 ( .A(n697), .B(n523), .C(n335), .Y(n691) );
  NOR2X1 U481 ( .A(n328), .B(n344), .Y(n697) );
  INVX1 U482 ( .A(n698), .Y(n344) );
  AOI22X1 U483 ( .A(n699), .B(n350), .C(n345), .D(n516), .Y(n689) );
  INVX1 U484 ( .A(n700), .Y(n688) );
  OAI21X1 U485 ( .A(n511), .B(n701), .C(n702), .Y(n700) );
  AOI22X1 U486 ( .A(n198), .B(des_curr[49]), .C(des_in[49]), .D(des_start), 
        .Y(n685) );
  NAND2X1 U487 ( .A(n703), .B(n704), .Y(n1180) );
  AOI22X1 U488 ( .A(n66), .B(n126), .C(des_curr[18]), .D(n71), .Y(n704) );
  XOR2X1 U489 ( .A(n705), .B(des_curr[50]), .Y(n126) );
  NAND3X1 U490 ( .A(n706), .B(n707), .C(n708), .Y(n705) );
  NOR2X1 U491 ( .A(n709), .B(n710), .Y(n708) );
  OAI22X1 U492 ( .A(n393), .B(n711), .C(n712), .D(n713), .Y(n710) );
  NOR2X1 U493 ( .A(n402), .B(n406), .Y(n393) );
  NAND3X1 U494 ( .A(n714), .B(n715), .C(n716), .Y(n709) );
  OAI21X1 U495 ( .A(n717), .B(n718), .C(n719), .Y(n716) );
  NAND2X1 U496 ( .A(n392), .B(n720), .Y(n718) );
  OAI21X1 U497 ( .A(n721), .B(n722), .C(n723), .Y(n714) );
  AOI22X1 U498 ( .A(n724), .B(n402), .C(n725), .D(n406), .Y(n707) );
  NOR2X1 U499 ( .A(n408), .B(n726), .Y(n706) );
  OAI22X1 U500 ( .A(n727), .B(n728), .C(n729), .D(n730), .Y(n408) );
  AOI22X1 U501 ( .A(n198), .B(des_curr[50]), .C(des_in[50]), .D(des_start), 
        .Y(n703) );
  NAND2X1 U502 ( .A(n731), .B(n732), .Y(n1179) );
  AOI22X1 U503 ( .A(n66), .B(n129), .C(des_curr[19]), .D(n71), .Y(n732) );
  XNOR2X1 U504 ( .A(des_curr[51]), .B(n733), .Y(n129) );
  NOR2X1 U505 ( .A(n734), .B(n735), .Y(n733) );
  NAND3X1 U506 ( .A(n736), .B(n310), .C(n737), .Y(n735) );
  AOI22X1 U507 ( .A(n304), .B(n303), .C(n612), .D(n738), .Y(n737) );
  INVX1 U508 ( .A(n309), .Y(n738) );
  OR2X1 U509 ( .A(n315), .B(n612), .Y(n303) );
  NOR2X1 U510 ( .A(n739), .B(n740), .Y(n310) );
  OAI22X1 U511 ( .A(n741), .B(n309), .C(n308), .D(n620), .Y(n740) );
  OAI21X1 U512 ( .A(n603), .B(n609), .C(n742), .Y(n739) );
  AOI22X1 U513 ( .A(n743), .B(n293), .C(n315), .D(n615), .Y(n742) );
  INVX1 U514 ( .A(n311), .Y(n615) );
  NAND3X1 U515 ( .A(n744), .B(n745), .C(n746), .Y(n734) );
  AND2X1 U516 ( .A(n747), .B(n748), .Y(n746) );
  OAI21X1 U517 ( .A(n298), .B(n302), .C(n293), .Y(n748) );
  OAI21X1 U518 ( .A(n301), .B(n305), .C(n300), .Y(n747) );
  INVX1 U519 ( .A(n749), .Y(n301) );
  OAI21X1 U520 ( .A(n294), .B(n316), .C(n315), .Y(n745) );
  OAI21X1 U521 ( .A(n750), .B(n743), .C(n292), .Y(n744) );
  NAND2X1 U522 ( .A(n622), .B(n751), .Y(n743) );
  INVX1 U523 ( .A(n620), .Y(n750) );
  AOI22X1 U524 ( .A(n198), .B(des_curr[51]), .C(des_in[51]), .D(des_start), 
        .Y(n731) );
  NAND2X1 U525 ( .A(n752), .B(n753), .Y(n1178) );
  AOI22X1 U526 ( .A(n66), .B(n132), .C(des_curr[20]), .D(n71), .Y(n753) );
  XOR2X1 U527 ( .A(n754), .B(des_curr[52]), .Y(n132) );
  NAND3X1 U528 ( .A(n755), .B(n756), .C(n757), .Y(n754) );
  NOR2X1 U529 ( .A(n758), .B(n759), .Y(n757) );
  OAI22X1 U530 ( .A(n186), .B(n760), .C(n761), .D(n762), .Y(n759) );
  INVX1 U531 ( .A(n477), .Y(n760) );
  NAND2X1 U532 ( .A(n763), .B(n764), .Y(n477) );
  OAI21X1 U533 ( .A(n484), .B(n481), .C(n765), .Y(n758) );
  OAI21X1 U534 ( .A(n189), .B(n483), .C(n182), .Y(n765) );
  OAI21X1 U535 ( .A(n766), .B(n767), .C(n768), .Y(n483) );
  INVX1 U536 ( .A(n195), .Y(n481) );
  AOI22X1 U537 ( .A(n476), .B(n769), .C(n194), .D(n191), .Y(n756) );
  NOR2X1 U538 ( .A(n489), .B(n770), .Y(n755) );
  OAI21X1 U539 ( .A(n480), .B(n485), .C(n771), .Y(n489) );
  AOI22X1 U540 ( .A(n772), .B(n191), .C(n195), .D(n769), .Y(n771) );
  NAND2X1 U541 ( .A(n773), .B(n183), .Y(n772) );
  INVX1 U542 ( .A(n774), .Y(n183) );
  INVX1 U543 ( .A(n182), .Y(n485) );
  AOI22X1 U544 ( .A(n198), .B(des_curr[52]), .C(des_in[52]), .D(des_start), 
        .Y(n752) );
  NAND2X1 U545 ( .A(n775), .B(n776), .Y(n1177) );
  AOI22X1 U546 ( .A(n66), .B(n135), .C(des_curr[21]), .D(n71), .Y(n776) );
  XOR2X1 U547 ( .A(n777), .B(des_curr[53]), .Y(n135) );
  NAND3X1 U548 ( .A(n778), .B(n779), .C(n780), .Y(n777) );
  AOI21X1 U549 ( .A(n592), .B(n781), .C(n782), .Y(n780) );
  OAI21X1 U550 ( .A(n783), .B(n784), .C(n785), .Y(n782) );
  OAI21X1 U551 ( .A(n593), .B(n586), .C(n280), .Y(n785) );
  NOR2X1 U552 ( .A(n275), .B(n581), .Y(n783) );
  NAND3X1 U553 ( .A(n595), .B(n786), .C(n590), .Y(n781) );
  INVX1 U554 ( .A(n787), .Y(n786) );
  AOI21X1 U555 ( .A(n569), .B(n276), .C(n582), .Y(n778) );
  NAND2X1 U556 ( .A(n788), .B(n789), .Y(n582) );
  AOI22X1 U557 ( .A(n278), .B(n569), .C(n790), .D(n592), .Y(n789) );
  AOI22X1 U558 ( .A(n791), .B(n280), .C(n277), .D(n787), .Y(n788) );
  OR2X1 U559 ( .A(n568), .B(n792), .Y(n276) );
  AOI22X1 U560 ( .A(n198), .B(des_curr[53]), .C(des_in[53]), .D(des_start), 
        .Y(n775) );
  NAND2X1 U561 ( .A(n793), .B(n794), .Y(n1176) );
  AOI22X1 U562 ( .A(n66), .B(n138), .C(des_curr[22]), .D(n71), .Y(n794) );
  XOR2X1 U563 ( .A(n795), .B(des_curr[54]), .Y(n138) );
  NAND3X1 U564 ( .A(n796), .B(n541), .C(n797), .Y(n795) );
  NOR2X1 U565 ( .A(n798), .B(n799), .Y(n797) );
  OAI22X1 U566 ( .A(n800), .B(n545), .C(n360), .D(n801), .Y(n799) );
  OAI21X1 U567 ( .A(n802), .B(n803), .C(n804), .Y(n798) );
  OAI21X1 U568 ( .A(n552), .B(n805), .C(n379), .Y(n804) );
  NOR2X1 U569 ( .A(n372), .B(n806), .Y(n803) );
  INVX1 U570 ( .A(n807), .Y(n541) );
  OAI21X1 U571 ( .A(n802), .B(n808), .C(n809), .Y(n807) );
  AOI22X1 U572 ( .A(n810), .B(n811), .C(n555), .D(n377), .Y(n809) );
  NAND3X1 U573 ( .A(n812), .B(n371), .C(n813), .Y(n811) );
  AOI21X1 U574 ( .A(n814), .B(n815), .C(n544), .Y(n813) );
  INVX1 U575 ( .A(n552), .Y(n371) );
  NOR2X1 U576 ( .A(n816), .B(n815), .Y(n552) );
  AOI22X1 U577 ( .A(n817), .B(n369), .C(n377), .D(n380), .Y(n796) );
  INVX1 U578 ( .A(n818), .Y(n369) );
  AOI22X1 U579 ( .A(n198), .B(des_curr[54]), .C(des_in[54]), .D(des_start), 
        .Y(n793) );
  NAND2X1 U580 ( .A(n819), .B(n820), .Y(n1175) );
  AOI22X1 U581 ( .A(n66), .B(n141), .C(des_curr[23]), .D(n71), .Y(n820) );
  XOR2X1 U582 ( .A(n821), .B(des_curr[55]), .Y(n141) );
  NAND3X1 U583 ( .A(n202), .B(n822), .C(n823), .Y(n821) );
  NOR2X1 U584 ( .A(n824), .B(n825), .Y(n823) );
  OAI21X1 U585 ( .A(n826), .B(n660), .C(n827), .Y(n825) );
  OAI21X1 U586 ( .A(n644), .B(n223), .C(n658), .Y(n827) );
  NAND2X1 U587 ( .A(n657), .B(n660), .Y(n223) );
  NAND2X1 U588 ( .A(n828), .B(n641), .Y(n657) );
  NOR2X1 U589 ( .A(n829), .B(n830), .Y(n644) );
  NAND2X1 U590 ( .A(n831), .B(n832), .Y(n660) );
  INVX1 U591 ( .A(n226), .Y(n826) );
  OR2X1 U592 ( .A(n833), .B(n834), .Y(n824) );
  OAI21X1 U593 ( .A(n635), .B(n835), .C(n836), .Y(n834) );
  OAI21X1 U594 ( .A(n467), .B(n837), .C(n220), .Y(n836) );
  NAND2X1 U595 ( .A(n458), .B(n635), .Y(n220) );
  INVX1 U596 ( .A(n465), .Y(n837) );
  NAND2X1 U597 ( .A(n661), .B(n831), .Y(n465) );
  INVX1 U598 ( .A(n208), .Y(n467) );
  NAND3X1 U599 ( .A(n838), .B(n641), .C(n662), .Y(n208) );
  OAI21X1 U600 ( .A(n661), .B(n832), .C(n662), .Y(n835) );
  INVX1 U601 ( .A(n217), .Y(n635) );
  AOI21X1 U602 ( .A(n466), .B(n468), .C(n458), .Y(n833) );
  NAND3X1 U603 ( .A(n839), .B(n840), .C(n841), .Y(n468) );
  AND2X1 U604 ( .A(n842), .B(n838), .Y(n841) );
  INVX1 U605 ( .A(n843), .Y(n466) );
  NAND3X1 U606 ( .A(n209), .B(n655), .C(n659), .Y(n843) );
  NAND3X1 U607 ( .A(n844), .B(n842), .C(n832), .Y(n659) );
  NAND3X1 U608 ( .A(n839), .B(n838), .C(n662), .Y(n209) );
  AOI22X1 U609 ( .A(n211), .B(n845), .C(n219), .D(n456), .Y(n822) );
  NOR2X1 U610 ( .A(n829), .B(n838), .Y(n219) );
  NAND3X1 U611 ( .A(n641), .B(n842), .C(n840), .Y(n829) );
  INVX1 U612 ( .A(n464), .Y(n845) );
  NOR2X1 U613 ( .A(n222), .B(n225), .Y(n464) );
  INVX1 U614 ( .A(n846), .Y(n225) );
  INVX1 U615 ( .A(n638), .Y(n222) );
  NAND3X1 U616 ( .A(n838), .B(n641), .C(n831), .Y(n638) );
  NOR2X1 U617 ( .A(n847), .B(n848), .Y(n202) );
  INVX1 U618 ( .A(n849), .Y(n848) );
  AOI22X1 U619 ( .A(n456), .B(n654), .C(n658), .D(n656), .Y(n849) );
  INVX1 U620 ( .A(n648), .Y(n656) );
  NAND2X1 U621 ( .A(n832), .B(n662), .Y(n648) );
  NOR2X1 U622 ( .A(n842), .B(n840), .Y(n662) );
  NAND2X1 U623 ( .A(n846), .B(n462), .Y(n654) );
  NAND3X1 U624 ( .A(n839), .B(n838), .C(n831), .Y(n462) );
  NOR2X1 U625 ( .A(n842), .B(n844), .Y(n831) );
  NAND3X1 U626 ( .A(n840), .B(n842), .C(n832), .Y(n846) );
  NOR2X1 U627 ( .A(n641), .B(n838), .Y(n832) );
  INVX1 U628 ( .A(n207), .Y(n456) );
  NOR2X1 U629 ( .A(n658), .B(n217), .Y(n207) );
  NOR2X1 U630 ( .A(n850), .B(n851), .Y(n217) );
  OAI21X1 U631 ( .A(n637), .B(n655), .C(n852), .Y(n847) );
  NAND3X1 U632 ( .A(n839), .B(n224), .C(n828), .Y(n852) );
  INVX1 U633 ( .A(n642), .Y(n828) );
  NAND3X1 U634 ( .A(n838), .B(n842), .C(n844), .Y(n642) );
  INVX1 U635 ( .A(n458), .Y(n224) );
  NOR2X1 U636 ( .A(n226), .B(n211), .Y(n458) );
  NOR2X1 U637 ( .A(n850), .B(n853), .Y(n211) );
  NOR2X1 U638 ( .A(n851), .B(n854), .Y(n226) );
  NAND3X1 U639 ( .A(n844), .B(n842), .C(n661), .Y(n655) );
  NOR2X1 U640 ( .A(n838), .B(n839), .Y(n661) );
  INVX1 U641 ( .A(n641), .Y(n839) );
  XOR2X1 U642 ( .A(des_curr[29]), .B(subkey[44]), .Y(n641) );
  INVX1 U643 ( .A(n830), .Y(n838) );
  XNOR2X1 U644 ( .A(des_curr[30]), .B(subkey[45]), .Y(n830) );
  XOR2X1 U645 ( .A(des_curr[31]), .B(subkey[46]), .Y(n842) );
  INVX1 U646 ( .A(n840), .Y(n844) );
  XOR2X1 U647 ( .A(des_curr[0]), .B(subkey[47]), .Y(n840) );
  INVX1 U648 ( .A(n658), .Y(n637) );
  NOR2X1 U649 ( .A(n853), .B(n854), .Y(n658) );
  INVX1 U650 ( .A(n850), .Y(n854) );
  XOR2X1 U651 ( .A(des_curr[27]), .B(subkey[42]), .Y(n850) );
  INVX1 U652 ( .A(n851), .Y(n853) );
  XOR2X1 U653 ( .A(des_curr[28]), .B(subkey[43]), .Y(n851) );
  AOI22X1 U654 ( .A(n198), .B(des_curr[55]), .C(des_in[55]), .D(des_start), 
        .Y(n819) );
  NAND2X1 U655 ( .A(n855), .B(n856), .Y(n1174) );
  AOI22X1 U656 ( .A(n66), .B(n144), .C(des_curr[24]), .D(n71), .Y(n856) );
  XOR2X1 U657 ( .A(n857), .B(des_curr[56]), .Y(n144) );
  NAND3X1 U658 ( .A(n858), .B(n859), .C(n860), .Y(n857) );
  NOR2X1 U659 ( .A(n861), .B(n862), .Y(n860) );
  OAI21X1 U660 ( .A(n410), .B(n863), .C(n864), .Y(n862) );
  OAI21X1 U661 ( .A(n404), .B(n865), .C(n866), .Y(n864) );
  NAND2X1 U662 ( .A(n867), .B(n392), .Y(n865) );
  INVX1 U663 ( .A(n868), .Y(n404) );
  INVX1 U664 ( .A(n719), .Y(n410) );
  NAND3X1 U665 ( .A(n869), .B(n870), .C(n871), .Y(n861) );
  OAI21X1 U666 ( .A(n872), .B(n873), .C(n874), .Y(n871) );
  INVX1 U667 ( .A(n713), .Y(n872) );
  OAI21X1 U668 ( .A(n873), .B(n717), .C(n402), .Y(n870) );
  INVX1 U669 ( .A(n875), .Y(n717) );
  OAI21X1 U670 ( .A(n722), .B(n725), .C(n723), .Y(n869) );
  AOI21X1 U671 ( .A(n876), .B(n406), .C(n877), .Y(n859) );
  OAI22X1 U672 ( .A(n712), .B(n407), .C(n395), .D(n403), .Y(n877) );
  NOR2X1 U673 ( .A(n723), .B(n719), .Y(n395) );
  NOR2X1 U674 ( .A(n874), .B(n866), .Y(n712) );
  NOR2X1 U675 ( .A(n413), .B(n878), .Y(n858) );
  NAND2X1 U676 ( .A(n879), .B(n880), .Y(n413) );
  AOI21X1 U677 ( .A(n719), .B(n721), .C(n881), .Y(n880) );
  OAI21X1 U678 ( .A(n882), .B(n713), .C(n715), .Y(n881) );
  OR2X1 U679 ( .A(n411), .B(n883), .Y(n715) );
  AOI22X1 U680 ( .A(n884), .B(n874), .C(n401), .D(n723), .Y(n879) );
  AOI22X1 U681 ( .A(n198), .B(des_curr[56]), .C(des_in[56]), .D(des_start), 
        .Y(n855) );
  NAND2X1 U682 ( .A(n885), .B(n886), .Y(n1173) );
  AOI22X1 U683 ( .A(n170), .B(n147), .C(des_curr[25]), .D(n71), .Y(n886) );
  XOR2X1 U684 ( .A(n887), .B(des_curr[57]), .Y(n147) );
  NAND3X1 U685 ( .A(n888), .B(n889), .C(n890), .Y(n887) );
  NOR2X1 U686 ( .A(n770), .B(n891), .Y(n890) );
  OAI21X1 U687 ( .A(n892), .B(n763), .C(n173), .Y(n891) );
  INVX1 U688 ( .A(n893), .Y(n173) );
  OAI21X1 U689 ( .A(n186), .B(n480), .C(n894), .Y(n893) );
  AOI22X1 U690 ( .A(n769), .B(n191), .C(n488), .D(n774), .Y(n894) );
  NOR2X1 U691 ( .A(n895), .B(n896), .Y(n774) );
  INVX1 U692 ( .A(n892), .Y(n191) );
  INVX1 U693 ( .A(n897), .Y(n769) );
  NAND3X1 U694 ( .A(n898), .B(n899), .C(n900), .Y(n897) );
  NOR2X1 U695 ( .A(n192), .B(n487), .Y(n763) );
  INVX1 U696 ( .A(n901), .Y(n487) );
  NAND3X1 U697 ( .A(n896), .B(n902), .C(n903), .Y(n901) );
  INVX1 U698 ( .A(n904), .Y(n192) );
  NAND3X1 U699 ( .A(n905), .B(n766), .C(n903), .Y(n904) );
  OR2X1 U700 ( .A(n906), .B(n907), .Y(n770) );
  OAI21X1 U701 ( .A(n484), .B(n178), .C(n908), .Y(n907) );
  OAI21X1 U702 ( .A(n193), .B(n497), .C(n496), .Y(n908) );
  OAI21X1 U703 ( .A(n892), .B(n909), .C(n910), .Y(n906) );
  OAI21X1 U704 ( .A(n911), .B(n912), .C(n488), .Y(n910) );
  INVX1 U705 ( .A(n480), .Y(n912) );
  NAND3X1 U706 ( .A(n902), .B(n766), .C(n903), .Y(n480) );
  AOI21X1 U707 ( .A(n913), .B(n896), .C(n180), .Y(n909) );
  NOR2X1 U708 ( .A(n914), .B(n915), .Y(n180) );
  INVX1 U709 ( .A(n767), .Y(n913) );
  NOR2X1 U710 ( .A(n488), .B(n195), .Y(n892) );
  INVX1 U711 ( .A(n762), .Y(n488) );
  NAND2X1 U712 ( .A(n916), .B(n917), .Y(n762) );
  AND2X1 U713 ( .A(n918), .B(n919), .Y(n889) );
  OAI21X1 U714 ( .A(n189), .B(n194), .C(n496), .Y(n919) );
  INVX1 U715 ( .A(n186), .Y(n496) );
  NOR2X1 U716 ( .A(n182), .B(n476), .Y(n186) );
  NOR2X1 U717 ( .A(n920), .B(n766), .Y(n194) );
  INVX1 U718 ( .A(n184), .Y(n189) );
  NAND3X1 U719 ( .A(n899), .B(n915), .C(n900), .Y(n184) );
  OAI21X1 U720 ( .A(n911), .B(n495), .C(n476), .Y(n918) );
  INVX1 U721 ( .A(n178), .Y(n476) );
  NAND2X1 U722 ( .A(n921), .B(n917), .Y(n178) );
  INVX1 U723 ( .A(n768), .Y(n911) );
  NAND3X1 U724 ( .A(n900), .B(n915), .C(n922), .Y(n768) );
  AOI22X1 U725 ( .A(n195), .B(n190), .C(n182), .D(n185), .Y(n888) );
  NAND3X1 U726 ( .A(n484), .B(n764), .C(n773), .Y(n185) );
  OR2X1 U727 ( .A(n914), .B(n898), .Y(n773) );
  NAND3X1 U728 ( .A(n766), .B(n899), .C(n905), .Y(n914) );
  INVX1 U729 ( .A(n902), .Y(n905) );
  INVX1 U730 ( .A(n498), .Y(n764) );
  NOR2X1 U731 ( .A(n920), .B(n896), .Y(n498) );
  NAND3X1 U732 ( .A(n902), .B(n899), .C(n898), .Y(n920) );
  INVX1 U733 ( .A(n915), .Y(n898) );
  NAND2X1 U734 ( .A(n903), .B(n900), .Y(n484) );
  NOR2X1 U735 ( .A(n766), .B(n902), .Y(n900) );
  NOR2X1 U736 ( .A(n899), .B(n915), .Y(n903) );
  NOR2X1 U737 ( .A(n917), .B(n921), .Y(n182) );
  INVX1 U738 ( .A(n916), .Y(n921) );
  NAND2X1 U739 ( .A(n761), .B(n923), .Y(n190) );
  INVX1 U740 ( .A(n193), .Y(n923) );
  NOR2X1 U741 ( .A(n895), .B(n766), .Y(n193) );
  NAND3X1 U742 ( .A(n902), .B(n915), .C(n922), .Y(n895) );
  INVX1 U743 ( .A(n899), .Y(n922) );
  NOR2X1 U744 ( .A(n495), .B(n497), .Y(n761) );
  INVX1 U745 ( .A(n924), .Y(n497) );
  NAND3X1 U746 ( .A(n766), .B(n915), .C(n925), .Y(n924) );
  NOR2X1 U747 ( .A(n902), .B(n899), .Y(n925) );
  NOR2X1 U748 ( .A(n767), .B(n896), .Y(n495) );
  INVX1 U749 ( .A(n766), .Y(n896) );
  XOR2X1 U750 ( .A(des_curr[7]), .B(subkey[10]), .Y(n766) );
  NAND3X1 U751 ( .A(n899), .B(n915), .C(n902), .Y(n767) );
  XOR2X1 U752 ( .A(des_curr[8]), .B(subkey[11]), .Y(n902) );
  XOR2X1 U753 ( .A(des_curr[5]), .B(subkey[8]), .Y(n915) );
  XOR2X1 U754 ( .A(des_curr[6]), .B(subkey[9]), .Y(n899) );
  NOR2X1 U755 ( .A(n917), .B(n916), .Y(n195) );
  XOR2X1 U756 ( .A(des_curr[4]), .B(subkey[7]), .Y(n916) );
  XOR2X1 U757 ( .A(des_curr[3]), .B(subkey[6]), .Y(n917) );
  AOI22X1 U758 ( .A(n198), .B(des_curr[57]), .C(des_in[57]), .D(des_start), 
        .Y(n885) );
  NAND2X1 U759 ( .A(n926), .B(n927), .Y(n1172) );
  AOI22X1 U760 ( .A(n170), .B(n150), .C(des_curr[26]), .D(n71), .Y(n927) );
  XOR2X1 U761 ( .A(n928), .B(des_curr[58]), .Y(n150) );
  NAND3X1 U762 ( .A(n929), .B(n930), .C(n931), .Y(n928) );
  NOR2X1 U763 ( .A(n932), .B(n933), .Y(n931) );
  OAI21X1 U764 ( .A(n445), .B(n438), .C(n934), .Y(n933) );
  OAI21X1 U765 ( .A(n429), .B(n935), .C(n238), .Y(n934) );
  INVX1 U766 ( .A(n446), .Y(n238) );
  NAND2X1 U767 ( .A(n936), .B(n437), .Y(n935) );
  NAND2X1 U768 ( .A(n937), .B(n938), .Y(n437) );
  NAND2X1 U769 ( .A(n444), .B(n676), .Y(n429) );
  NAND2X1 U770 ( .A(n939), .B(n940), .Y(n676) );
  NAND2X1 U771 ( .A(n941), .B(n942), .Y(n444) );
  NOR2X1 U772 ( .A(n943), .B(n671), .Y(n445) );
  INVX1 U773 ( .A(n936), .Y(n671) );
  NAND2X1 U774 ( .A(n944), .B(n945), .Y(n936) );
  OAI21X1 U775 ( .A(n430), .B(n946), .C(n947), .Y(n932) );
  OAI21X1 U776 ( .A(n948), .B(n257), .C(n242), .Y(n947) );
  INVX1 U777 ( .A(n439), .Y(n948) );
  NOR2X1 U778 ( .A(n434), .B(n949), .Y(n946) );
  NAND2X1 U779 ( .A(n678), .B(n677), .Y(n949) );
  NAND2X1 U780 ( .A(n941), .B(n938), .Y(n677) );
  NAND2X1 U781 ( .A(n937), .B(n942), .Y(n678) );
  INVX1 U782 ( .A(n681), .Y(n434) );
  NAND2X1 U783 ( .A(n939), .B(n937), .Y(n681) );
  NOR2X1 U784 ( .A(n242), .B(n448), .Y(n430) );
  AOI22X1 U785 ( .A(n675), .B(n240), .C(n254), .D(n258), .Y(n930) );
  NAND2X1 U786 ( .A(n950), .B(n438), .Y(n258) );
  INVX1 U787 ( .A(n448), .Y(n438) );
  INVX1 U788 ( .A(n684), .Y(n254) );
  NAND2X1 U789 ( .A(n939), .B(n941), .Y(n684) );
  NAND2X1 U790 ( .A(n951), .B(n239), .Y(n240) );
  NAND2X1 U791 ( .A(n937), .B(n944), .Y(n239) );
  NOR2X1 U792 ( .A(n952), .B(n953), .Y(n937) );
  AOI21X1 U793 ( .A(n447), .B(n253), .C(n679), .Y(n929) );
  NAND3X1 U794 ( .A(n954), .B(n955), .C(n956), .Y(n679) );
  AOI21X1 U795 ( .A(n251), .B(n242), .C(n957), .Y(n956) );
  OAI21X1 U796 ( .A(n446), .B(n439), .C(n958), .Y(n957) );
  OAI21X1 U797 ( .A(n943), .B(n257), .C(n253), .Y(n958) );
  INVX1 U798 ( .A(n672), .Y(n257) );
  NAND2X1 U799 ( .A(n939), .B(n945), .Y(n672) );
  NOR2X1 U800 ( .A(n959), .B(n960), .Y(n939) );
  INVX1 U801 ( .A(n244), .Y(n943) );
  NAND2X1 U802 ( .A(n940), .B(n938), .Y(n244) );
  NAND2X1 U803 ( .A(n944), .B(n941), .Y(n439) );
  AND2X1 U804 ( .A(n953), .B(n952), .Y(n941) );
  INVX1 U805 ( .A(n961), .Y(n953) );
  NOR2X1 U806 ( .A(n253), .B(n675), .Y(n446) );
  INVX1 U807 ( .A(n951), .Y(n251) );
  NAND2X1 U808 ( .A(n940), .B(n942), .Y(n951) );
  OAI21X1 U809 ( .A(n962), .B(n447), .C(n448), .Y(n955) );
  NOR2X1 U810 ( .A(n963), .B(n964), .Y(n448) );
  INVX1 U811 ( .A(n428), .Y(n962) );
  NAND2X1 U812 ( .A(n940), .B(n944), .Y(n428) );
  NOR2X1 U813 ( .A(n965), .B(n960), .Y(n944) );
  INVX1 U814 ( .A(n966), .Y(n960) );
  AND2X1 U815 ( .A(n961), .B(n952), .Y(n940) );
  NOR2X1 U816 ( .A(n433), .B(n249), .Y(n954) );
  NOR2X1 U817 ( .A(n440), .B(n950), .Y(n249) );
  INVX1 U818 ( .A(n675), .Y(n950) );
  NOR2X1 U819 ( .A(n967), .B(n964), .Y(n675) );
  INVX1 U820 ( .A(n968), .Y(n964) );
  NOR2X1 U821 ( .A(n423), .B(n440), .Y(n433) );
  NAND2X1 U822 ( .A(n945), .B(n938), .Y(n440) );
  NOR2X1 U823 ( .A(n966), .B(n959), .Y(n938) );
  INVX1 U824 ( .A(n242), .Y(n423) );
  NOR2X1 U825 ( .A(n968), .B(n967), .Y(n242) );
  INVX1 U826 ( .A(n963), .Y(n967) );
  NOR2X1 U827 ( .A(n968), .B(n963), .Y(n253) );
  XOR2X1 U828 ( .A(des_curr[19]), .B(subkey[30]), .Y(n963) );
  XOR2X1 U829 ( .A(des_curr[20]), .B(subkey[31]), .Y(n968) );
  INVX1 U830 ( .A(n243), .Y(n447) );
  NAND2X1 U831 ( .A(n942), .B(n945), .Y(n243) );
  NOR2X1 U832 ( .A(n952), .B(n961), .Y(n945) );
  XOR2X1 U833 ( .A(des_curr[21]), .B(subkey[32]), .Y(n961) );
  XOR2X1 U834 ( .A(des_curr[22]), .B(subkey[33]), .Y(n952) );
  NOR2X1 U835 ( .A(n966), .B(n965), .Y(n942) );
  INVX1 U836 ( .A(n959), .Y(n965) );
  XOR2X1 U837 ( .A(des_curr[23]), .B(subkey[34]), .Y(n959) );
  XOR2X1 U838 ( .A(des_curr[24]), .B(subkey[35]), .Y(n966) );
  AOI22X1 U839 ( .A(n198), .B(des_curr[58]), .C(des_in[58]), .D(des_start), 
        .Y(n926) );
  NAND2X1 U840 ( .A(n969), .B(n970), .Y(n1171) );
  AOI22X1 U841 ( .A(n170), .B(n153), .C(des_curr[27]), .D(n71), .Y(n970) );
  XOR2X1 U842 ( .A(n971), .B(des_curr[59]), .Y(n153) );
  NAND3X1 U843 ( .A(n972), .B(n973), .C(n974), .Y(n971) );
  NOR2X1 U844 ( .A(n975), .B(n976), .Y(n974) );
  OAI21X1 U845 ( .A(n523), .B(n535), .C(n702), .Y(n976) );
  NOR2X1 U846 ( .A(n977), .B(n978), .Y(n702) );
  OAI21X1 U847 ( .A(n701), .B(n335), .C(n979), .Y(n978) );
  AOI22X1 U848 ( .A(n340), .B(n350), .C(n519), .D(n348), .Y(n979) );
  NOR2X1 U849 ( .A(n980), .B(n981), .Y(n519) );
  NAND2X1 U850 ( .A(n694), .B(n337), .Y(n350) );
  INVX1 U851 ( .A(n516), .Y(n337) );
  AND2X1 U852 ( .A(n342), .B(n982), .Y(n340) );
  NAND3X1 U853 ( .A(n981), .B(n983), .C(n343), .Y(n335) );
  NAND3X1 U854 ( .A(n984), .B(n985), .C(n986), .Y(n977) );
  OAI21X1 U855 ( .A(n987), .B(n988), .C(n518), .Y(n986) );
  OR2X1 U856 ( .A(n989), .B(n533), .Y(n988) );
  INVX1 U857 ( .A(n511), .Y(n533) );
  NAND2X1 U858 ( .A(n990), .B(n343), .Y(n511) );
  NAND2X1 U859 ( .A(n535), .B(n698), .Y(n987) );
  NAND3X1 U860 ( .A(n981), .B(n983), .C(n991), .Y(n698) );
  OAI21X1 U861 ( .A(n345), .B(n349), .C(n330), .Y(n985) );
  INVX1 U862 ( .A(n528), .Y(n349) );
  INVX1 U863 ( .A(n534), .Y(n345) );
  NAND3X1 U864 ( .A(n983), .B(n992), .C(n982), .Y(n534) );
  OAI21X1 U865 ( .A(n532), .B(n993), .C(n516), .Y(n984) );
  NAND2X1 U866 ( .A(n994), .B(n995), .Y(n993) );
  INVX1 U867 ( .A(n996), .Y(n532) );
  AOI21X1 U868 ( .A(n343), .B(n342), .C(n328), .Y(n996) );
  INVX1 U869 ( .A(n997), .Y(n328) );
  OAI22X1 U870 ( .A(n694), .B(n997), .C(n326), .D(n994), .Y(n975) );
  INVX1 U871 ( .A(n513), .Y(n994) );
  NOR2X1 U872 ( .A(n980), .B(n992), .Y(n513) );
  NAND3X1 U873 ( .A(n983), .B(n998), .C(n999), .Y(n980) );
  NAND2X1 U874 ( .A(n991), .B(n990), .Y(n997) );
  AND2X1 U875 ( .A(n1000), .B(n1001), .Y(n973) );
  OAI21X1 U876 ( .A(n347), .B(n699), .C(n346), .Y(n1001) );
  NAND2X1 U877 ( .A(n523), .B(n326), .Y(n346) );
  INVX1 U878 ( .A(n330), .Y(n523) );
  INVX1 U879 ( .A(n334), .Y(n699) );
  NAND2X1 U880 ( .A(n342), .B(n991), .Y(n334) );
  OAI21X1 U881 ( .A(n347), .B(n696), .C(n516), .Y(n1000) );
  NOR2X1 U882 ( .A(n1002), .B(n1003), .Y(n516) );
  NAND2X1 U883 ( .A(n535), .B(n528), .Y(n696) );
  NAND3X1 U884 ( .A(n999), .B(n998), .C(n990), .Y(n528) );
  NAND3X1 U885 ( .A(n983), .B(n992), .C(n991), .Y(n535) );
  NOR2X1 U886 ( .A(n998), .B(n999), .Y(n991) );
  INVX1 U887 ( .A(n527), .Y(n347) );
  NAND3X1 U888 ( .A(n981), .B(n983), .C(n982), .Y(n527) );
  AOI22X1 U889 ( .A(n989), .B(n341), .C(n339), .D(n508), .Y(n972) );
  NAND2X1 U890 ( .A(n694), .B(n326), .Y(n508) );
  INVX1 U891 ( .A(n518), .Y(n326) );
  NOR2X1 U892 ( .A(n1004), .B(n1005), .Y(n518) );
  INVX1 U893 ( .A(n348), .Y(n694) );
  INVX1 U894 ( .A(n995), .Y(n339) );
  NAND3X1 U895 ( .A(n983), .B(n992), .C(n343), .Y(n995) );
  NOR2X1 U896 ( .A(n1006), .B(n998), .Y(n343) );
  INVX1 U897 ( .A(n701), .Y(n341) );
  NOR2X1 U898 ( .A(n330), .B(n348), .Y(n701) );
  NOR2X1 U899 ( .A(n1004), .B(n1002), .Y(n348) );
  INVX1 U900 ( .A(n1005), .Y(n1002) );
  NOR2X1 U901 ( .A(n1005), .B(n1003), .Y(n330) );
  INVX1 U902 ( .A(n1004), .Y(n1003) );
  XOR2X1 U903 ( .A(des_curr[31]), .B(subkey[0]), .Y(n1004) );
  XOR2X1 U904 ( .A(des_curr[0]), .B(subkey[1]), .Y(n1005) );
  NAND2X1 U905 ( .A(n525), .B(n331), .Y(n989) );
  NAND3X1 U906 ( .A(n999), .B(n998), .C(n342), .Y(n331) );
  NOR2X1 U907 ( .A(n992), .B(n983), .Y(n342) );
  INVX1 U908 ( .A(n1006), .Y(n999) );
  NAND2X1 U909 ( .A(n982), .B(n990), .Y(n525) );
  NOR2X1 U910 ( .A(n983), .B(n981), .Y(n990) );
  INVX1 U911 ( .A(n992), .Y(n981) );
  XOR2X1 U912 ( .A(des_curr[4]), .B(subkey[5]), .Y(n992) );
  XNOR2X1 U913 ( .A(des_curr[3]), .B(subkey[4]), .Y(n983) );
  AND2X1 U914 ( .A(n998), .B(n1006), .Y(n982) );
  XOR2X1 U915 ( .A(des_curr[1]), .B(subkey[2]), .Y(n1006) );
  XNOR2X1 U916 ( .A(des_curr[2]), .B(subkey[3]), .Y(n998) );
  AOI22X1 U917 ( .A(n198), .B(des_curr[59]), .C(des_in[59]), .D(des_start), 
        .Y(n969) );
  NAND2X1 U918 ( .A(n1007), .B(n1008), .Y(n1170) );
  AOI22X1 U919 ( .A(n170), .B(n156), .C(des_curr[28]), .D(n71), .Y(n1008) );
  XNOR2X1 U920 ( .A(des_curr[60]), .B(n1009), .Y(n156) );
  NOR2X1 U921 ( .A(n1010), .B(n1011), .Y(n1009) );
  NAND3X1 U922 ( .A(n577), .B(n266), .C(n779), .Y(n1011) );
  INVX1 U923 ( .A(n1012), .Y(n779) );
  NAND3X1 U924 ( .A(n561), .B(n264), .C(n1013), .Y(n1012) );
  AOI21X1 U925 ( .A(n280), .B(n591), .C(n1014), .Y(n1013) );
  OAI21X1 U926 ( .A(n565), .B(n1015), .C(n1016), .Y(n1014) );
  OAI21X1 U927 ( .A(n278), .B(n792), .C(n592), .Y(n1016) );
  INVX1 U928 ( .A(n1017), .Y(n792) );
  AND2X1 U929 ( .A(n1018), .B(n1019), .Y(n278) );
  NOR2X1 U930 ( .A(n277), .B(n569), .Y(n1015) );
  INVX1 U931 ( .A(n1020), .Y(n565) );
  NAND2X1 U932 ( .A(n1017), .B(n273), .Y(n591) );
  NAND3X1 U933 ( .A(n1021), .B(n1022), .C(n1018), .Y(n1017) );
  AOI21X1 U934 ( .A(n280), .B(n790), .C(n1023), .Y(n264) );
  INVX1 U935 ( .A(n1024), .Y(n1023) );
  AOI21X1 U936 ( .A(n592), .B(n568), .C(n1025), .Y(n1024) );
  AOI21X1 U937 ( .A(n576), .B(n1026), .C(n274), .Y(n1025) );
  AND2X1 U938 ( .A(n1027), .B(n1028), .Y(n561) );
  AOI22X1 U939 ( .A(n1029), .B(n280), .C(n574), .D(n592), .Y(n1028) );
  AOI22X1 U940 ( .A(n277), .B(n791), .C(n790), .D(n569), .Y(n1027) );
  NOR2X1 U941 ( .A(n1030), .B(n1031), .Y(n790) );
  INVX1 U942 ( .A(n1026), .Y(n791) );
  NAND3X1 U943 ( .A(n1032), .B(n1033), .C(n1019), .Y(n1026) );
  AOI22X1 U944 ( .A(n787), .B(n569), .C(n1020), .D(n280), .Y(n266) );
  OAI21X1 U945 ( .A(n588), .B(n589), .C(n595), .Y(n1020) );
  NAND3X1 U946 ( .A(n1031), .B(n588), .C(n1034), .Y(n595) );
  AOI21X1 U947 ( .A(n586), .B(n277), .C(n1035), .Y(n577) );
  INVX1 U948 ( .A(n1036), .Y(n1035) );
  OAI21X1 U949 ( .A(n568), .B(n787), .C(n280), .Y(n1036) );
  NOR2X1 U950 ( .A(n1037), .B(n1038), .Y(n280) );
  NOR2X1 U951 ( .A(n589), .B(n1033), .Y(n787) );
  NAND3X1 U952 ( .A(n1021), .B(n1032), .C(n1022), .Y(n589) );
  NOR2X1 U953 ( .A(n1039), .B(n588), .Y(n568) );
  OAI21X1 U954 ( .A(n272), .B(n784), .C(n1040), .Y(n1010) );
  AND2X1 U955 ( .A(n1041), .B(n1042), .Y(n1040) );
  OAI21X1 U956 ( .A(n275), .B(n586), .C(n592), .Y(n1042) );
  INVX1 U957 ( .A(n271), .Y(n592) );
  NAND2X1 U958 ( .A(n1043), .B(n1038), .Y(n271) );
  OAI21X1 U959 ( .A(n1033), .B(n1039), .C(n281), .Y(n586) );
  NAND3X1 U960 ( .A(n1031), .B(n588), .C(n1044), .Y(n281) );
  NOR2X1 U961 ( .A(n1045), .B(n1046), .Y(n1044) );
  NAND2X1 U962 ( .A(n1032), .B(n1034), .Y(n1039) );
  INVX1 U963 ( .A(n588), .Y(n1033) );
  NAND2X1 U964 ( .A(n570), .B(n575), .Y(n275) );
  NAND3X1 U965 ( .A(n1032), .B(n588), .C(n1019), .Y(n575) );
  NAND3X1 U966 ( .A(n1032), .B(n1046), .C(n1047), .Y(n570) );
  NOR2X1 U967 ( .A(n588), .B(n1045), .Y(n1047) );
  OAI21X1 U968 ( .A(n1029), .B(n581), .C(n569), .Y(n1041) );
  INVX1 U969 ( .A(n274), .Y(n569) );
  NAND2X1 U970 ( .A(n1038), .B(n1037), .Y(n274) );
  NAND2X1 U971 ( .A(n1048), .B(n273), .Y(n581) );
  NAND2X1 U972 ( .A(n1018), .B(n1034), .Y(n273) );
  NOR2X1 U973 ( .A(n1046), .B(n1022), .Y(n1034) );
  INVX1 U974 ( .A(n574), .Y(n1048) );
  NOR2X1 U975 ( .A(n1030), .B(n1032), .Y(n574) );
  NAND3X1 U976 ( .A(n588), .B(n1046), .C(n1022), .Y(n1030) );
  INVX1 U977 ( .A(n277), .Y(n784) );
  NOR2X1 U978 ( .A(n1038), .B(n1043), .Y(n277) );
  INVX1 U979 ( .A(n1037), .Y(n1043) );
  XOR2X1 U980 ( .A(des_curr[7]), .B(subkey[12]), .Y(n1037) );
  XOR2X1 U981 ( .A(des_curr[8]), .B(subkey[13]), .Y(n1038) );
  NOR2X1 U982 ( .A(n593), .B(n1029), .Y(n272) );
  INVX1 U983 ( .A(n590), .Y(n1029) );
  NAND3X1 U984 ( .A(n1031), .B(n588), .C(n1019), .Y(n590) );
  NOR2X1 U985 ( .A(n1021), .B(n1022), .Y(n1019) );
  INVX1 U986 ( .A(n1046), .Y(n1021) );
  INVX1 U987 ( .A(n576), .Y(n593) );
  NAND3X1 U988 ( .A(n1022), .B(n1046), .C(n1018), .Y(n576) );
  NOR2X1 U989 ( .A(n588), .B(n1032), .Y(n1018) );
  INVX1 U990 ( .A(n1031), .Y(n1032) );
  XOR2X1 U991 ( .A(des_curr[9]), .B(subkey[14]), .Y(n1031) );
  XOR2X1 U992 ( .A(des_curr[10]), .B(subkey[15]), .Y(n588) );
  XOR2X1 U993 ( .A(des_curr[11]), .B(subkey[16]), .Y(n1046) );
  INVX1 U994 ( .A(n1045), .Y(n1022) );
  XOR2X1 U995 ( .A(des_curr[12]), .B(subkey[17]), .Y(n1045) );
  AOI22X1 U996 ( .A(n198), .B(des_curr[60]), .C(des_in[60]), .D(des_start), 
        .Y(n1007) );
  NAND2X1 U997 ( .A(n1049), .B(n1050), .Y(n1169) );
  AOI22X1 U998 ( .A(n170), .B(n159), .C(des_curr[29]), .D(n71), .Y(n1050) );
  XOR2X1 U999 ( .A(n1051), .B(des_curr[61]), .Y(n159) );
  NAND3X1 U1000 ( .A(n1052), .B(n1053), .C(n1054), .Y(n1051) );
  NOR2X1 U1001 ( .A(n1055), .B(n1056), .Y(n1054) );
  OAI22X1 U1002 ( .A(n727), .B(n875), .C(n391), .D(n713), .Y(n1056) );
  NAND2X1 U1003 ( .A(n1057), .B(n1058), .Y(n713) );
  OAI21X1 U1004 ( .A(n1059), .B(n411), .C(n1060), .Y(n1055) );
  OAI21X1 U1005 ( .A(n721), .B(n725), .C(n402), .Y(n1060) );
  INVX1 U1006 ( .A(n728), .Y(n725) );
  INVX1 U1007 ( .A(n412), .Y(n721) );
  INVX1 U1008 ( .A(n724), .Y(n1059) );
  NAND3X1 U1009 ( .A(n403), .B(n868), .C(n1061), .Y(n724) );
  NOR2X1 U1010 ( .A(n873), .B(n876), .Y(n1061) );
  INVX1 U1011 ( .A(n396), .Y(n876) );
  NAND2X1 U1012 ( .A(n1058), .B(n1062), .Y(n396) );
  NAND2X1 U1013 ( .A(n1063), .B(n1064), .Y(n868) );
  NAND2X1 U1014 ( .A(n1065), .B(n1066), .Y(n403) );
  AOI21X1 U1015 ( .A(n401), .B(n719), .C(n414), .Y(n1053) );
  OR2X1 U1016 ( .A(n1067), .B(n1068), .Y(n414) );
  OAI22X1 U1017 ( .A(n728), .B(n411), .C(n720), .D(n729), .Y(n1068) );
  NAND2X1 U1018 ( .A(n1057), .B(n1063), .Y(n728) );
  OAI21X1 U1019 ( .A(n727), .B(n883), .C(n1069), .Y(n1067) );
  OAI21X1 U1020 ( .A(n873), .B(n884), .C(n402), .Y(n1069) );
  INVX1 U1021 ( .A(n882), .Y(n402) );
  INVX1 U1022 ( .A(n711), .Y(n884) );
  NAND2X1 U1023 ( .A(n1058), .B(n1064), .Y(n711) );
  INVX1 U1024 ( .A(n730), .Y(n873) );
  NAND2X1 U1025 ( .A(n1062), .B(n1070), .Y(n730) );
  INVX1 U1026 ( .A(n866), .Y(n727) );
  NOR2X1 U1027 ( .A(n726), .B(n878), .Y(n1052) );
  OAI21X1 U1028 ( .A(n882), .B(n720), .C(n1071), .Y(n878) );
  AOI22X1 U1029 ( .A(n406), .B(n1072), .C(n722), .D(n866), .Y(n1071) );
  INVX1 U1030 ( .A(n394), .Y(n722) );
  NAND2X1 U1031 ( .A(n1064), .B(n1070), .Y(n394) );
  NAND2X1 U1032 ( .A(n412), .B(n392), .Y(n1072) );
  NAND2X1 U1033 ( .A(n1057), .B(n1070), .Y(n392) );
  NAND2X1 U1034 ( .A(n1066), .B(n1064), .Y(n412) );
  NOR2X1 U1035 ( .A(n1073), .B(n1074), .Y(n1064) );
  NAND2X1 U1036 ( .A(n1065), .B(n1058), .Y(n720) );
  NOR2X1 U1037 ( .A(n1075), .B(n1076), .Y(n1058) );
  OR2X1 U1038 ( .A(n1077), .B(n1078), .Y(n726) );
  OAI22X1 U1039 ( .A(n882), .B(n407), .C(n411), .D(n875), .Y(n1078) );
  NAND2X1 U1040 ( .A(n1063), .B(n1062), .Y(n875) );
  INVX1 U1041 ( .A(n874), .Y(n411) );
  NAND2X1 U1042 ( .A(n1057), .B(n1066), .Y(n407) );
  AND2X1 U1043 ( .A(n1079), .B(n1074), .Y(n1057) );
  NOR2X1 U1044 ( .A(n866), .B(n719), .Y(n882) );
  NOR2X1 U1045 ( .A(n1080), .B(n1081), .Y(n719) );
  NOR2X1 U1046 ( .A(n1082), .B(n1083), .Y(n866) );
  OAI21X1 U1047 ( .A(n883), .B(n729), .C(n1084), .Y(n1077) );
  OAI21X1 U1048 ( .A(n1085), .B(n401), .C(n723), .Y(n1084) );
  INVX1 U1049 ( .A(n391), .Y(n723) );
  NOR2X1 U1050 ( .A(n406), .B(n874), .Y(n391) );
  NOR2X1 U1051 ( .A(n1080), .B(n1082), .Y(n874) );
  INVX1 U1052 ( .A(n1081), .Y(n1082) );
  INVX1 U1053 ( .A(n867), .Y(n401) );
  NAND2X1 U1054 ( .A(n1063), .B(n1065), .Y(n867) );
  NOR2X1 U1055 ( .A(n1086), .B(n1087), .Y(n1063) );
  INVX1 U1056 ( .A(n863), .Y(n1085) );
  NAND2X1 U1057 ( .A(n1065), .B(n1070), .Y(n863) );
  NOR2X1 U1058 ( .A(n1075), .B(n1086), .Y(n1070) );
  NOR2X1 U1059 ( .A(n1074), .B(n1079), .Y(n1065) );
  INVX1 U1060 ( .A(n1073), .Y(n1079) );
  INVX1 U1061 ( .A(n406), .Y(n729) );
  NOR2X1 U1062 ( .A(n1081), .B(n1083), .Y(n406) );
  INVX1 U1063 ( .A(n1080), .Y(n1083) );
  XOR2X1 U1064 ( .A(des_curr[11]), .B(subkey[18]), .Y(n1080) );
  XOR2X1 U1065 ( .A(des_curr[12]), .B(subkey[19]), .Y(n1081) );
  NAND2X1 U1066 ( .A(n1066), .B(n1062), .Y(n883) );
  AND2X1 U1067 ( .A(n1074), .B(n1073), .Y(n1062) );
  XOR2X1 U1068 ( .A(des_curr[15]), .B(subkey[22]), .Y(n1073) );
  XOR2X1 U1069 ( .A(des_curr[16]), .B(subkey[23]), .Y(n1074) );
  NOR2X1 U1070 ( .A(n1076), .B(n1087), .Y(n1066) );
  INVX1 U1071 ( .A(n1075), .Y(n1087) );
  XOR2X1 U1072 ( .A(des_curr[13]), .B(subkey[20]), .Y(n1075) );
  INVX1 U1073 ( .A(n1086), .Y(n1076) );
  XOR2X1 U1074 ( .A(des_curr[14]), .B(subkey[21]), .Y(n1086) );
  AOI22X1 U1075 ( .A(n198), .B(des_curr[61]), .C(des_in[61]), .D(des_start), 
        .Y(n1049) );
  NAND2X1 U1076 ( .A(n1088), .B(n1089), .Y(n1168) );
  AOI22X1 U1077 ( .A(n170), .B(n162), .C(des_curr[30]), .D(n71), .Y(n1089) );
  XNOR2X1 U1078 ( .A(des_curr[62]), .B(n1090), .Y(n162) );
  NOR2X1 U1079 ( .A(n1091), .B(n1092), .Y(n1090) );
  NAND3X1 U1080 ( .A(n736), .B(n621), .C(n1093), .Y(n1092) );
  AOI22X1 U1081 ( .A(n292), .B(n624), .C(n611), .D(n616), .Y(n1093) );
  INVX1 U1082 ( .A(n751), .Y(n611) );
  NAND2X1 U1083 ( .A(n1094), .B(n1095), .Y(n751) );
  NAND2X1 U1084 ( .A(n311), .B(n1096), .Y(n624) );
  NAND2X1 U1085 ( .A(n1097), .B(n1098), .Y(n311) );
  AND2X1 U1086 ( .A(n1099), .B(n1100), .Y(n621) );
  AOI21X1 U1087 ( .A(n294), .B(n292), .C(n1101), .Y(n1100) );
  OAI21X1 U1088 ( .A(n1102), .B(n308), .C(n1103), .Y(n1101) );
  OAI21X1 U1089 ( .A(n606), .B(n298), .C(n612), .Y(n1103) );
  INVX1 U1090 ( .A(n1096), .Y(n298) );
  NAND2X1 U1091 ( .A(n1104), .B(n1095), .Y(n1096) );
  INVX1 U1092 ( .A(n290), .Y(n606) );
  NOR2X1 U1093 ( .A(n304), .B(n316), .Y(n1102) );
  AND2X1 U1094 ( .A(n1105), .B(n1095), .Y(n316) );
  INVX1 U1095 ( .A(n626), .Y(n304) );
  NAND2X1 U1096 ( .A(n1104), .B(n1106), .Y(n626) );
  AOI22X1 U1097 ( .A(n1107), .B(n315), .C(n302), .D(n293), .Y(n1099) );
  INVX1 U1098 ( .A(n1108), .Y(n302) );
  INVX1 U1099 ( .A(n609), .Y(n1107) );
  INVX1 U1100 ( .A(n1109), .Y(n736) );
  OAI21X1 U1101 ( .A(n603), .B(n290), .C(n1110), .Y(n1109) );
  AOI22X1 U1102 ( .A(n607), .B(n293), .C(n294), .D(n616), .Y(n1110) );
  AND2X1 U1103 ( .A(n1111), .B(n1094), .Y(n294) );
  NAND2X1 U1104 ( .A(n1112), .B(n614), .Y(n607) );
  NAND2X1 U1105 ( .A(n1111), .B(n1105), .Y(n614) );
  NAND2X1 U1106 ( .A(n1097), .B(n1095), .Y(n290) );
  NOR2X1 U1107 ( .A(n1113), .B(n1114), .Y(n1095) );
  NAND3X1 U1108 ( .A(n1115), .B(n1116), .C(n1117), .Y(n1091) );
  AOI21X1 U1109 ( .A(n1118), .B(n300), .C(n1119), .Y(n1117) );
  AOI21X1 U1110 ( .A(n609), .B(n749), .C(n312), .Y(n1119) );
  INVX1 U1111 ( .A(n612), .Y(n312) );
  NAND2X1 U1112 ( .A(n1106), .B(n1105), .Y(n749) );
  NAND2X1 U1113 ( .A(n1106), .B(n1094), .Y(n609) );
  INVX1 U1114 ( .A(n603), .Y(n300) );
  NOR2X1 U1115 ( .A(n292), .B(n315), .Y(n603) );
  INVX1 U1116 ( .A(n741), .Y(n292) );
  NAND2X1 U1117 ( .A(n1120), .B(n1121), .Y(n741) );
  NAND3X1 U1118 ( .A(n309), .B(n620), .C(n1108), .Y(n1118) );
  NAND2X1 U1119 ( .A(n1106), .B(n1097), .Y(n1108) );
  NOR2X1 U1120 ( .A(n1122), .B(n1113), .Y(n1106) );
  NAND2X1 U1121 ( .A(n1104), .B(n1111), .Y(n620) );
  NAND2X1 U1122 ( .A(n1111), .B(n1097), .Y(n309) );
  NOR2X1 U1123 ( .A(n1123), .B(n1124), .Y(n1097) );
  NOR2X1 U1124 ( .A(n1122), .B(n1125), .Y(n1111) );
  OAI21X1 U1125 ( .A(n314), .B(n1126), .C(n315), .Y(n1116) );
  NOR2X1 U1126 ( .A(n1120), .B(n1121), .Y(n315) );
  INVX1 U1127 ( .A(n1112), .Y(n314) );
  NAND2X1 U1128 ( .A(n1098), .B(n1094), .Y(n1112) );
  NOR2X1 U1129 ( .A(n1127), .B(n1123), .Y(n1094) );
  OAI21X1 U1130 ( .A(n305), .B(n1126), .C(n293), .Y(n1115) );
  INVX1 U1131 ( .A(n619), .Y(n293) );
  NOR2X1 U1132 ( .A(n612), .B(n616), .Y(n619) );
  INVX1 U1133 ( .A(n308), .Y(n616) );
  NAND2X1 U1134 ( .A(n1128), .B(n1120), .Y(n308) );
  NOR2X1 U1135 ( .A(n1120), .B(n1128), .Y(n612) );
  INVX1 U1136 ( .A(n1121), .Y(n1128) );
  XOR2X1 U1137 ( .A(des_curr[23]), .B(subkey[36]), .Y(n1121) );
  XOR2X1 U1138 ( .A(des_curr[24]), .B(subkey[37]), .Y(n1120) );
  INVX1 U1139 ( .A(n622), .Y(n1126) );
  NAND2X1 U1140 ( .A(n1105), .B(n1098), .Y(n622) );
  AND2X1 U1141 ( .A(n1123), .B(n1127), .Y(n1105) );
  INVX1 U1142 ( .A(n613), .Y(n305) );
  NAND2X1 U1143 ( .A(n1104), .B(n1098), .Y(n613) );
  NOR2X1 U1144 ( .A(n1125), .B(n1114), .Y(n1098) );
  INVX1 U1145 ( .A(n1122), .Y(n1114) );
  XOR2X1 U1146 ( .A(des_curr[28]), .B(subkey[41]), .Y(n1122) );
  INVX1 U1147 ( .A(n1113), .Y(n1125) );
  XOR2X1 U1148 ( .A(des_curr[25]), .B(subkey[38]), .Y(n1113) );
  AND2X1 U1149 ( .A(n1124), .B(n1123), .Y(n1104) );
  XOR2X1 U1150 ( .A(des_curr[27]), .B(subkey[40]), .Y(n1123) );
  INVX1 U1151 ( .A(n1127), .Y(n1124) );
  XOR2X1 U1152 ( .A(des_curr[26]), .B(subkey[39]), .Y(n1127) );
  AOI22X1 U1153 ( .A(n198), .B(des_curr[62]), .C(des_in[62]), .D(des_start), 
        .Y(n1088) );
  NAND2X1 U1154 ( .A(n1129), .B(n1130), .Y(n1167) );
  AOI22X1 U1155 ( .A(n170), .B(n165), .C(des_curr[31]), .D(n71), .Y(n1130) );
  NAND3X1 U1156 ( .A(n166), .B(n68), .C(n167), .Y(n1131) );
  XOR2X1 U1157 ( .A(n1132), .B(des_curr[63]), .Y(n165) );
  NAND3X1 U1158 ( .A(n1133), .B(n1134), .C(n1135), .Y(n1132) );
  NOR2X1 U1159 ( .A(n1136), .B(n1137), .Y(n1135) );
  OAI21X1 U1160 ( .A(n1138), .B(n363), .C(n1139), .Y(n1137) );
  OAI21X1 U1161 ( .A(n555), .B(n1140), .C(n377), .Y(n1139) );
  INVX1 U1162 ( .A(n370), .Y(n1140) );
  INVX1 U1163 ( .A(n806), .Y(n1138) );
  NAND2X1 U1164 ( .A(n1141), .B(n554), .Y(n806) );
  OAI21X1 U1165 ( .A(n818), .B(n1142), .C(n1143), .Y(n1136) );
  OAI21X1 U1166 ( .A(n805), .B(n373), .C(n378), .Y(n1143) );
  INVX1 U1167 ( .A(n1144), .Y(n373) );
  INVX1 U1168 ( .A(n553), .Y(n805) );
  NAND3X1 U1169 ( .A(n1145), .B(n1146), .C(n1147), .Y(n553) );
  AND2X1 U1170 ( .A(n801), .B(n800), .Y(n1142) );
  NOR2X1 U1171 ( .A(n544), .B(n556), .Y(n800) );
  INVX1 U1172 ( .A(n361), .Y(n556) );
  INVX1 U1173 ( .A(n1148), .Y(n544) );
  NAND3X1 U1174 ( .A(n1149), .B(n1145), .C(n1147), .Y(n1148) );
  NOR2X1 U1175 ( .A(n375), .B(n547), .Y(n801) );
  INVX1 U1176 ( .A(n1150), .Y(n547) );
  NAND3X1 U1177 ( .A(n1151), .B(n1152), .C(n1153), .Y(n1150) );
  NOR2X1 U1178 ( .A(n1145), .B(n1146), .Y(n1153) );
  NOR2X1 U1179 ( .A(n1154), .B(n1145), .Y(n375) );
  NOR2X1 U1180 ( .A(n377), .B(n810), .Y(n818) );
  AOI22X1 U1181 ( .A(n379), .B(n817), .C(n372), .D(n551), .Y(n1134) );
  INVX1 U1182 ( .A(n360), .Y(n551) );
  NOR2X1 U1183 ( .A(n378), .B(n810), .Y(n360) );
  NOR2X1 U1184 ( .A(n1155), .B(n1156), .Y(n372) );
  NAND3X1 U1185 ( .A(n370), .B(n361), .C(n554), .Y(n817) );
  NAND3X1 U1186 ( .A(n1149), .B(n815), .C(n814), .Y(n554) );
  NAND3X1 U1187 ( .A(n1151), .B(n1146), .C(n814), .Y(n361) );
  NAND3X1 U1188 ( .A(n1149), .B(n1157), .C(n1147), .Y(n370) );
  AOI21X1 U1189 ( .A(n380), .B(n374), .C(n382), .Y(n1133) );
  OAI21X1 U1190 ( .A(n808), .B(n363), .C(n1158), .Y(n382) );
  AOI22X1 U1191 ( .A(n1159), .B(n377), .C(n555), .D(n374), .Y(n1158) );
  INVX1 U1192 ( .A(n362), .Y(n555) );
  NAND2X1 U1193 ( .A(n815), .B(n1160), .Y(n362) );
  OAI21X1 U1194 ( .A(n1152), .B(n1161), .C(n816), .Y(n1160) );
  NAND3X1 U1195 ( .A(n1152), .B(n1146), .C(n1157), .Y(n816) );
  NAND2X1 U1196 ( .A(n1149), .B(n1145), .Y(n1161) );
  INVX1 U1197 ( .A(n1157), .Y(n1145) );
  AND2X1 U1198 ( .A(n1162), .B(n1163), .Y(n377) );
  NOR2X1 U1199 ( .A(n1164), .B(n1165), .Y(n1159) );
  XNOR2X1 U1200 ( .A(n1146), .B(n1151), .Y(n1164) );
  INVX1 U1201 ( .A(n810), .Y(n363) );
  NOR2X1 U1202 ( .A(n1163), .B(n1162), .Y(n810) );
  INVX1 U1203 ( .A(n1166), .Y(n1163) );
  AND2X1 U1204 ( .A(n1144), .B(n812), .Y(n808) );
  OR2X1 U1205 ( .A(n1155), .B(n1152), .Y(n812) );
  NAND3X1 U1206 ( .A(n815), .B(n1157), .C(n1149), .Y(n1155) );
  NAND3X1 U1207 ( .A(n1157), .B(n1146), .C(n1147), .Y(n1144) );
  NOR2X1 U1208 ( .A(n1152), .B(n815), .Y(n1147) );
  INVX1 U1209 ( .A(n802), .Y(n374) );
  NOR2X1 U1210 ( .A(n378), .B(n379), .Y(n802) );
  NOR2X1 U1211 ( .A(n1166), .B(n1162), .Y(n379) );
  INVX1 U1212 ( .A(n545), .Y(n378) );
  NAND2X1 U1213 ( .A(n1162), .B(n1166), .Y(n545) );
  XOR2X1 U1214 ( .A(des_curr[16]), .B(subkey[25]), .Y(n1166) );
  XNOR2X1 U1215 ( .A(des_curr[15]), .B(subkey[24]), .Y(n1162) );
  OAI21X1 U1216 ( .A(n1165), .B(n1231), .C(n1141), .Y(n380) );
  INVX1 U1217 ( .A(n376), .Y(n1141) );
  NOR2X1 U1218 ( .A(n1154), .B(n1157), .Y(n376) );
  NAND3X1 U1219 ( .A(n815), .B(n1146), .C(n1156), .Y(n1154) );
  INVX1 U1220 ( .A(n1151), .Y(n815) );
  NAND2X1 U1221 ( .A(n1149), .B(n1151), .Y(n1231) );
  XOR2X1 U1222 ( .A(des_curr[19]), .B(subkey[28]), .Y(n1151) );
  INVX1 U1223 ( .A(n1146), .Y(n1149) );
  XOR2X1 U1224 ( .A(des_curr[17]), .B(subkey[26]), .Y(n1146) );
  INVX1 U1225 ( .A(n814), .Y(n1165) );
  NOR2X1 U1226 ( .A(n1157), .B(n1156), .Y(n814) );
  INVX1 U1227 ( .A(n1152), .Y(n1156) );
  XOR2X1 U1228 ( .A(des_curr[20]), .B(subkey[29]), .Y(n1152) );
  XOR2X1 U1229 ( .A(des_curr[18]), .B(subkey[27]), .Y(n1157) );
  NOR3X1 U1230 ( .A(n198), .B(des_start), .C(n166), .Y(n170) );
  AOI22X1 U1231 ( .A(n198), .B(des_curr[63]), .C(des_in[63]), .D(des_start), 
        .Y(n1129) );
  NAND2X1 U1232 ( .A(n68), .B(n1232), .Y(n167) );
  OAI21X1 U1233 ( .A(round_count[4]), .B(n166), .C(des_enable), .Y(n1232) );
  NAND2X1 U1234 ( .A(n1233), .B(n1234), .Y(n166) );
  NOR2X1 U1235 ( .A(round_count[3]), .B(round_count[2]), .Y(n1234) );
  NOR2X1 U1236 ( .A(round_count[1]), .B(round_count[0]), .Y(n1233) );
endmodule


module key_generator ( clk, n_rst, reverse, cnt_rollover, key_rollover, 
        key_enable, round_count, key_count, subkey );
  input [4:0] round_count;
  input [1:0] key_count;
  output [47:0] subkey;
  input clk, n_rst, reverse, cnt_rollover, key_rollover, key_enable;
  wire   keyOut_55, keyOut_54, keyOut_53, keyOut_52, keyOut_51, keyOut_49,
         keyOut_46, keyOut_45, keyOut_44, keyOut_43, keyOut_41, keyOut_39,
         keyOut_38, keyOut_36, keyOut_35, keyOut_34, keyOut_33, keyOut_31,
         keyOut_30, keyOut_29, keyOut_28, keyOut_27, keyOut_25, keyOut_23,
         keyOut_19, keyOut_17, keyOut_15, keyOut_14, keyOut_13, keyOut_12,
         keyOut_11, keyOut_9, keyOut_4, keyOut_3, keyOut_2, \left[19] ,
         left_10, left_6, left_3, \right[21] , right_18, right_13, right_2,
         keyNext_55, keyNext_54, keyNext_53, keyNext_52, keyNext_51,
         keyNext_49, keyNext_46, keyNext_45, keyNext_44, keyNext_43,
         keyNext_41, keyNext_39, keyNext_38, keyNext_36, keyNext_35,
         keyNext_34, keyNext_33, keyNext_31, keyNext_30, keyNext_29,
         keyNext_28, keyNext_27, keyNext_25, keyNext_23, keyNext_19,
         keyNext_17, keyNext_15, keyNext_14, keyNext_13, keyNext_12,
         keyNext_11, keyNext_9, keyNext_4, keyNext_3, keyNext_2, n368, n370,
         n372, n374, n375, n376, n377, n378, n379, n380, n381, n383, n385,
         n387, n389, n390, n392, n394, n396, n397, n398, n400, n401, n403,
         n405, n406, n407, n409, n411, n413, n414, n416, n417, n419, n420,
         n422, n423, n424, n425, n427, n428, n430, n432, n434, n435, n437,
         n439, n440, n441, n442, n443, n445, n446, n448, n449, n451, n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n244, n245, n246, n247, n248, n249, n250, n251, n252, n253, n254,
         n255, n256, n257, n258, n259, n260, n261, n262, n263, n264, n265,
         n266, n267, n268, n269, n270, n271, n272, n273, n274, n275, n276,
         n277, n278, n279, n280, n281, n282, n283, n284, n285, n286, n287,
         n288, n289, n290, n291, n292, n293, n294, n295, n296, n297, n298,
         n299, n300, n301, n302, n303, n304, n305, n306, n307, n308, n309,
         n310, n311, n312, n313, n314, n315, n316, n317, n318, n319, n320,
         n321, n322, n323, n324, n325, n326, n327, n328, n329, n330, n331,
         n332, n333, n334, n335, n336, n337, n338, n339, n340, n341, n342,
         n343, n344, n345, n346, n347, n348, n349, n350, n351, n352, n353,
         n354, n355, n356, n357, n358, n359, n360, n361, n362, n363, n364,
         n365, n366, n463, n464, n465, n466, n467, n468, n469, n470;
  wire   [63:57] keyOut;
  wire   [63:57] keyNext;

  DFFSR \keyOut_reg[63]  ( .D(keyNext[63]), .CLK(clk), .R(n6), .S(n5), .Q(
        keyOut[63]) );
  DFFSR \keyOut_reg[62]  ( .D(keyNext[62]), .CLK(clk), .R(n6), .S(n5), .Q(
        keyOut[62]) );
  DFFSR \keyOut_reg[61]  ( .D(keyNext[61]), .CLK(clk), .R(n5), .S(n6), .Q(
        keyOut[61]) );
  DFFSR \keyOut_reg[59]  ( .D(keyNext[59]), .CLK(clk), .R(n6), .S(n5), .Q(
        keyOut[59]) );
  DFFSR \keyOut_reg[57]  ( .D(keyNext[57]), .CLK(clk), .R(n6), .S(n5), .Q(
        keyOut[57]) );
  DFFSR \keyOut_reg[55]  ( .D(keyNext_55), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        keyOut_55) );
  DFFSR \keyOut_reg[54]  ( .D(keyNext_54), .CLK(clk), .R(n5), .S(n6), .Q(
        keyOut_54) );
  DFFSR \keyOut_reg[53]  ( .D(keyNext_53), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        keyOut_53) );
  DFFSR \keyOut_reg[52]  ( .D(keyNext_52), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        keyOut_52) );
  DFFSR \keyOut_reg[51]  ( .D(keyNext_51), .CLK(clk), .R(n6), .S(n5), .Q(
        keyOut_51) );
  DFFSR \keyOut_reg[49]  ( .D(keyNext_49), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        keyOut_49) );
  DFFSR \keyOut_reg[46]  ( .D(keyNext_46), .CLK(clk), .R(n5), .S(n6), .Q(
        keyOut_46) );
  DFFSR \keyOut_reg[45]  ( .D(keyNext_45), .CLK(clk), .R(n6), .S(n5), .Q(
        keyOut_45) );
  DFFSR \keyOut_reg[44]  ( .D(keyNext_44), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        keyOut_44) );
  DFFSR \keyOut_reg[43]  ( .D(keyNext_43), .CLK(clk), .R(n6), .S(n5), .Q(
        keyOut_43) );
  DFFSR \keyOut_reg[41]  ( .D(keyNext_41), .CLK(clk), .R(n6), .S(n5), .Q(
        keyOut_41) );
  DFFSR \keyOut_reg[39]  ( .D(keyNext_39), .CLK(clk), .R(n6), .S(n5), .Q(
        keyOut_39) );
  DFFSR \keyOut_reg[38]  ( .D(keyNext_38), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        keyOut_38) );
  DFFSR \keyOut_reg[36]  ( .D(keyNext_36), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        keyOut_36) );
  DFFSR \keyOut_reg[35]  ( .D(keyNext_35), .CLK(clk), .R(n6), .S(n5), .Q(
        keyOut_35) );
  DFFSR \keyOut_reg[34]  ( .D(keyNext_34), .CLK(clk), .R(n5), .S(n6), .Q(
        keyOut_34) );
  DFFSR \keyOut_reg[33]  ( .D(keyNext_33), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        keyOut_33) );
  DFFSR \keyOut_reg[31]  ( .D(keyNext_31), .CLK(clk), .R(n6), .S(n5), .Q(
        keyOut_31) );
  DFFSR \keyOut_reg[30]  ( .D(keyNext_30), .CLK(clk), .R(n5), .S(n6), .Q(
        keyOut_30) );
  DFFSR \keyOut_reg[29]  ( .D(keyNext_29), .CLK(clk), .R(n5), .S(n6), .Q(
        keyOut_29) );
  DFFSR \keyOut_reg[28]  ( .D(keyNext_28), .CLK(clk), .R(n6), .S(n5), .Q(
        keyOut_28) );
  DFFSR \keyOut_reg[27]  ( .D(keyNext_27), .CLK(clk), .R(n6), .S(n5), .Q(
        keyOut_27) );
  DFFSR \keyOut_reg[25]  ( .D(keyNext_25), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        keyOut_25) );
  DFFSR \keyOut_reg[23]  ( .D(keyNext_23), .CLK(clk), .R(n6), .S(n5), .Q(
        keyOut_23) );
  DFFSR \keyOut_reg[19]  ( .D(keyNext_19), .CLK(clk), .R(n5), .S(n6), .Q(
        keyOut_19) );
  DFFSR \keyOut_reg[17]  ( .D(keyNext_17), .CLK(clk), .R(n6), .S(n5), .Q(
        keyOut_17) );
  DFFSR \keyOut_reg[15]  ( .D(keyNext_15), .CLK(clk), .R(n6), .S(n5), .Q(
        keyOut_15) );
  DFFSR \keyOut_reg[14]  ( .D(keyNext_14), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        keyOut_14) );
  DFFSR \keyOut_reg[13]  ( .D(keyNext_13), .CLK(clk), .R(n6), .S(n5), .Q(
        keyOut_13) );
  DFFSR \keyOut_reg[12]  ( .D(keyNext_12), .CLK(clk), .R(n5), .S(n6), .Q(
        keyOut_12) );
  DFFSR \keyOut_reg[11]  ( .D(keyNext_11), .CLK(clk), .R(n6), .S(n5), .Q(
        keyOut_11) );
  DFFSR \keyOut_reg[9]  ( .D(keyNext_9), .CLK(clk), .R(n6), .S(n5), .Q(
        keyOut_9) );
  DFFSR \keyOut_reg[4]  ( .D(keyNext_4), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        keyOut_4) );
  DFFSR \left_reg[3]  ( .D(n451), .CLK(clk), .R(1'b1), .S(n_rst), .Q(left_3)
         );
  DFFSR \left_reg[2]  ( .D(n449), .CLK(clk), .R(n5), .S(n6), .Q(subkey[31]) );
  DFFSR \left_reg[1]  ( .D(n448), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        subkey[27]) );
  DFFSR \left_reg[0]  ( .D(n446), .CLK(clk), .R(n6), .S(n5), .Q(subkey[40]) );
  DFFSR \left_reg[27]  ( .D(n445), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        subkey[43]) );
  DFFSR \left_reg[26]  ( .D(n443), .CLK(clk), .R(n6), .S(n5), .Q(subkey[24])
         );
  DFFSR \left_reg[25]  ( .D(n442), .CLK(clk), .R(n6), .S(n5), .Q(subkey[41])
         );
  DFFSR \left_reg[24]  ( .D(n441), .CLK(clk), .R(n6), .S(n5), .Q(subkey[32])
         );
  DFFSR \left_reg[23]  ( .D(n440), .CLK(clk), .R(n6), .S(n5), .Q(subkey[42])
         );
  DFFSR \left_reg[22]  ( .D(n439), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        subkey[38]) );
  DFFSR \left_reg[21]  ( .D(n437), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        subkey[28]) );
  DFFSR \left_reg[20]  ( .D(n435), .CLK(clk), .R(n6), .S(n5), .Q(subkey[30])
         );
  DFFSR \left_reg[19]  ( .D(n434), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        \left[19] ) );
  DFFSR \left_reg[18]  ( .D(n432), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        subkey[36]) );
  DFFSR \left_reg[17]  ( .D(n430), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        subkey[45]) );
  DFFSR \left_reg[16]  ( .D(n428), .CLK(clk), .R(n5), .S(n6), .Q(subkey[33])
         );
  DFFSR \left_reg[15]  ( .D(n427), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        subkey[25]) );
  DFFSR \left_reg[14]  ( .D(n425), .CLK(clk), .R(n5), .S(n6), .Q(subkey[47])
         );
  DFFSR \left_reg[13]  ( .D(n424), .CLK(clk), .R(n5), .S(n6), .Q(subkey[39])
         );
  DFFSR \left_reg[12]  ( .D(n423), .CLK(clk), .R(n6), .S(n5), .Q(subkey[29])
         );
  DFFSR \left_reg[11]  ( .D(n422), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        subkey[46]) );
  DFFSR \left_reg[10]  ( .D(n420), .CLK(clk), .R(n6), .S(n5), .Q(left_10) );
  DFFSR \left_reg[9]  ( .D(n419), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        subkey[34]) );
  DFFSR \left_reg[8]  ( .D(n417), .CLK(clk), .R(n5), .S(n6), .Q(subkey[26]) );
  DFFSR \left_reg[7]  ( .D(n416), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        subkey[37]) );
  DFFSR \left_reg[6]  ( .D(n414), .CLK(clk), .R(n6), .S(n5), .Q(left_6) );
  DFFSR \left_reg[5]  ( .D(n413), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        subkey[35]) );
  DFFSR \left_reg[4]  ( .D(n411), .CLK(clk), .R(n5), .S(n6), .Q(subkey[44]) );
  DFFSR \keyOut_reg[3]  ( .D(keyNext_3), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        keyOut_3) );
  DFFSR \keyOut_reg[2]  ( .D(keyNext_2), .CLK(clk), .R(n5), .S(n6), .Q(
        keyOut_2) );
  DFFSR \right_reg[27]  ( .D(n409), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        subkey[1]) );
  DFFSR \right_reg[26]  ( .D(n407), .CLK(clk), .R(n6), .S(n5), .Q(subkey[17])
         );
  DFFSR \right_reg[25]  ( .D(n406), .CLK(clk), .R(n6), .S(n5), .Q(subkey[21])
         );
  DFFSR \right_reg[24]  ( .D(n405), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        subkey[0]) );
  DFFSR \right_reg[23]  ( .D(n403), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        subkey[13]) );
  DFFSR \right_reg[22]  ( .D(n401), .CLK(clk), .R(n6), .S(n5), .Q(subkey[7])
         );
  DFFSR \right_reg[21]  ( .D(n400), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        \right[21] ) );
  DFFSR \right_reg[20]  ( .D(n398), .CLK(clk), .R(n6), .S(n5), .Q(subkey[2])
         );
  DFFSR \right_reg[19]  ( .D(n397), .CLK(clk), .R(n5), .S(n6), .Q(subkey[20])
         );
  DFFSR \right_reg[18]  ( .D(n396), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        right_18) );
  DFFSR \right_reg[17]  ( .D(n394), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        subkey[9]) );
  DFFSR \right_reg[16]  ( .D(n392), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        subkey[16]) );
  DFFSR \right_reg[15]  ( .D(n390), .CLK(clk), .R(n5), .S(n6), .Q(subkey[23])
         );
  DFFSR \right_reg[14]  ( .D(n389), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        subkey[4]) );
  DFFSR \right_reg[13]  ( .D(n387), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        right_13) );
  DFFSR \right_reg[12]  ( .D(n385), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        subkey[11]) );
  DFFSR \right_reg[11]  ( .D(n383), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        subkey[14]) );
  DFFSR \right_reg[10]  ( .D(n381), .CLK(clk), .R(n6), .S(n5), .Q(subkey[5])
         );
  DFFSR \right_reg[9]  ( .D(n380), .CLK(clk), .R(n5), .S(n6), .Q(subkey[19])
         );
  DFFSR \right_reg[8]  ( .D(n379), .CLK(clk), .R(n6), .S(n5), .Q(subkey[12])
         );
  DFFSR \right_reg[7]  ( .D(n378), .CLK(clk), .R(n6), .S(n5), .Q(subkey[10])
         );
  DFFSR \right_reg[6]  ( .D(n377), .CLK(clk), .R(n6), .S(n5), .Q(subkey[3]) );
  DFFSR \right_reg[5]  ( .D(n376), .CLK(clk), .R(n6), .S(n5), .Q(subkey[15])
         );
  DFFSR \right_reg[4]  ( .D(n375), .CLK(clk), .R(n6), .S(n5), .Q(subkey[22])
         );
  DFFSR \right_reg[3]  ( .D(n374), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        subkey[6]) );
  DFFSR \right_reg[2]  ( .D(n372), .CLK(clk), .R(1'b1), .S(n_rst), .Q(right_2)
         );
  DFFSR \right_reg[1]  ( .D(n370), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        subkey[18]) );
  DFFSR \right_reg[0]  ( .D(n368), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        subkey[8]) );
  OR2X2 U3 ( .A(n307), .B(n293), .Y(n1) );
  NOR2X1 U4 ( .A(reverse), .B(n_rst), .Y(n2) );
  AND2X2 U5 ( .A(reverse), .B(n11), .Y(n3) );
  INVX4 U6 ( .A(n1), .Y(n4) );
  INVX8 U7 ( .A(n2), .Y(n5) );
  INVX8 U8 ( .A(n3), .Y(n6) );
  INVX2 U9 ( .A(n23), .Y(n7) );
  INVX2 U10 ( .A(n29), .Y(n8) );
  INVX4 U11 ( .A(n17), .Y(n29) );
  INVX2 U12 ( .A(key_enable), .Y(n15) );
  INVX2 U13 ( .A(n19), .Y(n9) );
  INVX4 U14 ( .A(n28), .Y(n19) );
  BUFX2 U15 ( .A(n320), .Y(n10) );
  INVX4 U16 ( .A(n30), .Y(n23) );
  INVX4 U17 ( .A(n209), .Y(n21) );
  INVX4 U18 ( .A(n210), .Y(n22) );
  INVX1 U19 ( .A(n_rst), .Y(n11) );
  NAND3X1 U20 ( .A(n12), .B(n13), .C(n14), .Y(n451) );
  AOI21X1 U21 ( .A(left_3), .B(n15), .C(n16), .Y(n14) );
  OAI22X1 U22 ( .A(n8), .B(n18), .C(n19), .D(n20), .Y(n16) );
  AOI22X1 U23 ( .A(keyOut_12), .B(n21), .C(keyOut_4), .D(n22), .Y(n13) );
  AOI22X1 U24 ( .A(subkey[35]), .B(n4), .C(subkey[31]), .D(n23), .Y(n12) );
  OR2X1 U25 ( .A(n24), .B(n25), .Y(n449) );
  OAI21X1 U26 ( .A(key_enable), .B(n26), .C(n27), .Y(n25) );
  AOI22X1 U27 ( .A(subkey[40]), .B(n9), .C(left_3), .D(n29), .Y(n27) );
  OAI21X1 U28 ( .A(n7), .B(n20), .C(n31), .Y(n24) );
  AOI22X1 U29 ( .A(n22), .B(keyOut_12), .C(subkey[44]), .D(n4), .Y(n31) );
  OR2X1 U30 ( .A(n32), .B(n33), .Y(n448) );
  OAI21X1 U31 ( .A(key_enable), .B(n20), .C(n34), .Y(n33) );
  AOI22X1 U32 ( .A(subkey[43]), .B(n9), .C(n29), .D(subkey[31]), .Y(n34) );
  INVX1 U33 ( .A(subkey[27]), .Y(n20) );
  OAI21X1 U34 ( .A(n7), .B(n35), .C(n36), .Y(n32) );
  AOI22X1 U35 ( .A(keyOut_28), .B(n21), .C(left_3), .D(n4), .Y(n36) );
  OR2X1 U36 ( .A(n37), .B(n38), .Y(n446) );
  OAI21X1 U37 ( .A(key_enable), .B(n35), .C(n39), .Y(n38) );
  AOI22X1 U38 ( .A(subkey[24]), .B(n9), .C(n29), .D(subkey[27]), .Y(n39) );
  INVX1 U39 ( .A(subkey[40]), .Y(n35) );
  OAI21X1 U40 ( .A(n7), .B(n40), .C(n41), .Y(n37) );
  AOI22X1 U41 ( .A(keyOut_28), .B(n22), .C(subkey[31]), .D(n4), .Y(n41) );
  OR2X1 U42 ( .A(n42), .B(n43), .Y(n445) );
  OAI21X1 U43 ( .A(key_enable), .B(n40), .C(n44), .Y(n43) );
  AOI22X1 U44 ( .A(subkey[41]), .B(n9), .C(subkey[40]), .D(n29), .Y(n44) );
  INVX1 U45 ( .A(subkey[43]), .Y(n40) );
  OAI21X1 U46 ( .A(n7), .B(n45), .C(n46), .Y(n42) );
  AOI22X1 U47 ( .A(keyOut_15), .B(n21), .C(subkey[27]), .D(n4), .Y(n46) );
  NAND3X1 U48 ( .A(n47), .B(n48), .C(n49), .Y(n443) );
  INVX1 U49 ( .A(n50), .Y(n49) );
  OAI21X1 U50 ( .A(n45), .B(key_enable), .C(n51), .Y(n50) );
  AOI22X1 U51 ( .A(n29), .B(subkey[43]), .C(n9), .D(subkey[32]), .Y(n51) );
  AOI22X1 U52 ( .A(keyOut_23), .B(n21), .C(keyOut_15), .D(n22), .Y(n48) );
  AOI22X1 U53 ( .A(subkey[40]), .B(n4), .C(subkey[41]), .D(n23), .Y(n47) );
  NAND3X1 U54 ( .A(n52), .B(n53), .C(n54), .Y(n442) );
  AOI21X1 U55 ( .A(subkey[41]), .B(n15), .C(n55), .Y(n54) );
  OAI22X1 U56 ( .A(n8), .B(n45), .C(n19), .D(n56), .Y(n55) );
  INVX1 U57 ( .A(subkey[24]), .Y(n45) );
  AOI22X1 U58 ( .A(keyOut_31), .B(n21), .C(keyOut_23), .D(n22), .Y(n53) );
  AOI22X1 U59 ( .A(subkey[43]), .B(n4), .C(subkey[32]), .D(n23), .Y(n52) );
  NAND3X1 U60 ( .A(n57), .B(n58), .C(n59), .Y(n441) );
  AOI21X1 U61 ( .A(subkey[32]), .B(n15), .C(n60), .Y(n59) );
  OAI22X1 U62 ( .A(n8), .B(n61), .C(n19), .D(n62), .Y(n60) );
  INVX1 U63 ( .A(subkey[41]), .Y(n61) );
  AOI22X1 U64 ( .A(keyOut_39), .B(n21), .C(keyOut_31), .D(n22), .Y(n58) );
  AOI22X1 U65 ( .A(subkey[24]), .B(n4), .C(subkey[42]), .D(n23), .Y(n57) );
  OR2X1 U66 ( .A(n63), .B(n64), .Y(n440) );
  OAI21X1 U67 ( .A(key_enable), .B(n56), .C(n65), .Y(n64) );
  AOI22X1 U68 ( .A(subkey[28]), .B(n9), .C(subkey[32]), .D(n29), .Y(n65) );
  INVX1 U69 ( .A(subkey[42]), .Y(n56) );
  OAI21X1 U70 ( .A(n7), .B(n62), .C(n66), .Y(n63) );
  AOI22X1 U71 ( .A(keyOut_39), .B(n22), .C(subkey[41]), .D(n4), .Y(n66) );
  OR2X1 U72 ( .A(n67), .B(n68), .Y(n439) );
  OAI21X1 U73 ( .A(key_enable), .B(n62), .C(n69), .Y(n68) );
  AOI22X1 U74 ( .A(subkey[30]), .B(n9), .C(subkey[42]), .D(n29), .Y(n69) );
  INVX1 U75 ( .A(subkey[38]), .Y(n62) );
  OAI21X1 U76 ( .A(n7), .B(n70), .C(n71), .Y(n67) );
  AOI22X1 U77 ( .A(keyOut_55), .B(n21), .C(subkey[32]), .D(n4), .Y(n71) );
  NAND3X1 U78 ( .A(n72), .B(n73), .C(n74), .Y(n437) );
  INVX1 U79 ( .A(n75), .Y(n74) );
  OAI21X1 U80 ( .A(n70), .B(key_enable), .C(n76), .Y(n75) );
  AOI22X1 U81 ( .A(n29), .B(subkey[38]), .C(n9), .D(\left[19] ), .Y(n76) );
  AOI22X1 U82 ( .A(keyOut[63]), .B(n21), .C(keyOut_55), .D(n22), .Y(n73) );
  AOI22X1 U83 ( .A(subkey[42]), .B(n4), .C(subkey[30]), .D(n23), .Y(n72) );
  NAND3X1 U84 ( .A(n77), .B(n78), .C(n79), .Y(n435) );
  AOI21X1 U85 ( .A(subkey[30]), .B(n15), .C(n80), .Y(n79) );
  OAI22X1 U86 ( .A(n8), .B(n70), .C(n19), .D(n81), .Y(n80) );
  INVX1 U87 ( .A(subkey[28]), .Y(n70) );
  AOI21X1 U88 ( .A(keyOut[63]), .B(n22), .C(n21), .Y(n78) );
  AOI22X1 U89 ( .A(subkey[38]), .B(n4), .C(\left[19] ), .D(n23), .Y(n77) );
  NAND3X1 U90 ( .A(n82), .B(n83), .C(n84), .Y(n434) );
  AOI21X1 U91 ( .A(\left[19] ), .B(n15), .C(n85), .Y(n84) );
  OAI22X1 U92 ( .A(n8), .B(n86), .C(n19), .D(n87), .Y(n85) );
  INVX1 U93 ( .A(subkey[30]), .Y(n86) );
  AOI21X1 U94 ( .A(keyOut_14), .B(n21), .C(n22), .Y(n83) );
  AOI22X1 U95 ( .A(subkey[28]), .B(n4), .C(subkey[36]), .D(n23), .Y(n82) );
  OR2X1 U96 ( .A(n88), .B(n89), .Y(n432) );
  OAI21X1 U97 ( .A(key_enable), .B(n81), .C(n90), .Y(n89) );
  AOI22X1 U98 ( .A(subkey[33]), .B(n9), .C(\left[19] ), .D(n29), .Y(n90) );
  INVX1 U99 ( .A(subkey[36]), .Y(n81) );
  OAI21X1 U100 ( .A(n7), .B(n87), .C(n91), .Y(n88) );
  AOI22X1 U101 ( .A(keyOut_14), .B(n22), .C(subkey[30]), .D(n4), .Y(n91) );
  OR2X1 U102 ( .A(n92), .B(n93), .Y(n430) );
  OAI21X1 U103 ( .A(key_enable), .B(n87), .C(n94), .Y(n93) );
  AOI22X1 U104 ( .A(subkey[25]), .B(n9), .C(subkey[36]), .D(n29), .Y(n94) );
  OAI21X1 U105 ( .A(n7), .B(n95), .C(n96), .Y(n92) );
  AOI22X1 U106 ( .A(keyOut_30), .B(n21), .C(\left[19] ), .D(n4), .Y(n96) );
  INVX1 U107 ( .A(subkey[33]), .Y(n95) );
  NAND3X1 U108 ( .A(n97), .B(n98), .C(n99), .Y(n428) );
  AOI21X1 U109 ( .A(subkey[33]), .B(n15), .C(n100), .Y(n99) );
  OAI22X1 U110 ( .A(n8), .B(n87), .C(n19), .D(n101), .Y(n100) );
  INVX1 U111 ( .A(subkey[45]), .Y(n87) );
  AOI22X1 U112 ( .A(keyOut_38), .B(n21), .C(keyOut_30), .D(n22), .Y(n98) );
  AOI22X1 U113 ( .A(subkey[36]), .B(n4), .C(subkey[25]), .D(n23), .Y(n97) );
  NAND3X1 U114 ( .A(n102), .B(n103), .C(n104), .Y(n427) );
  INVX1 U115 ( .A(n105), .Y(n104) );
  OAI21X1 U116 ( .A(n106), .B(key_enable), .C(n107), .Y(n105) );
  AOI22X1 U117 ( .A(n29), .B(subkey[33]), .C(n28), .D(subkey[39]), .Y(n107) );
  AOI22X1 U118 ( .A(keyOut_46), .B(n21), .C(keyOut_38), .D(n22), .Y(n103) );
  AOI22X1 U119 ( .A(subkey[45]), .B(n4), .C(subkey[47]), .D(n23), .Y(n102) );
  NAND3X1 U120 ( .A(n108), .B(n109), .C(n110), .Y(n425) );
  AOI21X1 U121 ( .A(subkey[47]), .B(n15), .C(n111), .Y(n110) );
  OAI22X1 U122 ( .A(n8), .B(n106), .C(n19), .D(n112), .Y(n111) );
  INVX1 U123 ( .A(subkey[25]), .Y(n106) );
  AOI22X1 U124 ( .A(keyOut_54), .B(n21), .C(keyOut_46), .D(n22), .Y(n109) );
  AOI22X1 U125 ( .A(subkey[33]), .B(n4), .C(subkey[39]), .D(n23), .Y(n108) );
  NAND3X1 U126 ( .A(n113), .B(n114), .C(n115), .Y(n424) );
  AOI21X1 U127 ( .A(subkey[39]), .B(n15), .C(n116), .Y(n115) );
  OAI22X1 U128 ( .A(n8), .B(n101), .C(n19), .D(n117), .Y(n116) );
  INVX1 U129 ( .A(subkey[47]), .Y(n101) );
  AOI22X1 U130 ( .A(keyOut[62]), .B(n21), .C(keyOut_54), .D(n22), .Y(n114) );
  AOI22X1 U131 ( .A(subkey[25]), .B(n4), .C(subkey[29]), .D(n23), .Y(n113) );
  OR2X1 U132 ( .A(n118), .B(n119), .Y(n423) );
  OAI21X1 U133 ( .A(key_enable), .B(n112), .C(n120), .Y(n119) );
  AOI22X1 U134 ( .A(left_10), .B(n9), .C(subkey[39]), .D(n29), .Y(n120) );
  INVX1 U135 ( .A(subkey[29]), .Y(n112) );
  OAI21X1 U136 ( .A(n30), .B(n117), .C(n121), .Y(n118) );
  AOI22X1 U137 ( .A(keyOut[62]), .B(n22), .C(subkey[47]), .D(n4), .Y(n121) );
  OR2X1 U138 ( .A(n122), .B(n123), .Y(n422) );
  OAI21X1 U139 ( .A(key_enable), .B(n117), .C(n124), .Y(n123) );
  AOI22X1 U140 ( .A(subkey[34]), .B(n9), .C(subkey[29]), .D(n29), .Y(n124) );
  OAI21X1 U141 ( .A(n30), .B(n125), .C(n126), .Y(n122) );
  AOI22X1 U142 ( .A(keyOut_13), .B(n21), .C(subkey[39]), .D(n4), .Y(n126) );
  NAND3X1 U143 ( .A(n127), .B(n128), .C(n129), .Y(n420) );
  AOI21X1 U144 ( .A(left_10), .B(n15), .C(n130), .Y(n129) );
  OAI22X1 U145 ( .A(n8), .B(n117), .C(n19), .D(n131), .Y(n130) );
  INVX1 U146 ( .A(subkey[46]), .Y(n117) );
  AOI21X1 U147 ( .A(keyOut_13), .B(n22), .C(n21), .Y(n128) );
  AOI22X1 U148 ( .A(subkey[29]), .B(n4), .C(subkey[34]), .D(n23), .Y(n127) );
  NAND3X1 U149 ( .A(n132), .B(n133), .C(n134), .Y(n419) );
  AOI21X1 U150 ( .A(subkey[34]), .B(n15), .C(n135), .Y(n134) );
  OAI22X1 U151 ( .A(n8), .B(n125), .C(n19), .D(n136), .Y(n135) );
  INVX1 U152 ( .A(left_10), .Y(n125) );
  AOI21X1 U153 ( .A(keyOut_29), .B(n21), .C(n22), .Y(n133) );
  AOI22X1 U154 ( .A(subkey[46]), .B(n4), .C(subkey[26]), .D(n23), .Y(n132) );
  OR2X1 U155 ( .A(n137), .B(n138), .Y(n417) );
  OAI21X1 U156 ( .A(key_enable), .B(n131), .C(n139), .Y(n138) );
  AOI22X1 U157 ( .A(left_6), .B(n9), .C(subkey[34]), .D(n29), .Y(n139) );
  INVX1 U158 ( .A(subkey[26]), .Y(n131) );
  OAI21X1 U159 ( .A(n30), .B(n136), .C(n140), .Y(n137) );
  AOI22X1 U160 ( .A(keyOut_29), .B(n22), .C(left_10), .D(n4), .Y(n140) );
  OR2X1 U161 ( .A(n141), .B(n142), .Y(n416) );
  OAI21X1 U162 ( .A(key_enable), .B(n136), .C(n143), .Y(n142) );
  AOI22X1 U163 ( .A(n9), .B(subkey[35]), .C(subkey[26]), .D(n29), .Y(n143) );
  OAI21X1 U164 ( .A(n30), .B(n144), .C(n145), .Y(n141) );
  AOI22X1 U165 ( .A(keyOut_45), .B(n21), .C(subkey[34]), .D(n4), .Y(n145) );
  INVX1 U166 ( .A(left_6), .Y(n144) );
  NAND3X1 U167 ( .A(n146), .B(n147), .C(n148), .Y(n414) );
  AOI21X1 U168 ( .A(left_6), .B(n15), .C(n149), .Y(n148) );
  OAI22X1 U169 ( .A(n8), .B(n136), .C(n19), .D(n18), .Y(n149) );
  INVX1 U170 ( .A(subkey[44]), .Y(n18) );
  INVX1 U171 ( .A(subkey[37]), .Y(n136) );
  AOI22X1 U172 ( .A(keyOut_53), .B(n21), .C(keyOut_45), .D(n22), .Y(n147) );
  AOI22X1 U173 ( .A(subkey[26]), .B(n4), .C(n23), .D(subkey[35]), .Y(n146) );
  NAND3X1 U174 ( .A(n150), .B(n151), .C(n152), .Y(n413) );
  INVX1 U175 ( .A(n153), .Y(n152) );
  OAI21X1 U176 ( .A(n154), .B(key_enable), .C(n155), .Y(n153) );
  AOI22X1 U177 ( .A(n29), .B(left_6), .C(n28), .D(left_3), .Y(n155) );
  AOI22X1 U178 ( .A(keyOut[61]), .B(n21), .C(keyOut_53), .D(n22), .Y(n151) );
  AOI22X1 U179 ( .A(subkey[37]), .B(n4), .C(subkey[44]), .D(n23), .Y(n150) );
  NAND3X1 U180 ( .A(n156), .B(n157), .C(n158), .Y(n411) );
  AOI21X1 U181 ( .A(subkey[44]), .B(n15), .C(n159), .Y(n158) );
  OAI22X1 U182 ( .A(n154), .B(n17), .C(n26), .D(n19), .Y(n159) );
  INVX1 U183 ( .A(subkey[31]), .Y(n26) );
  INVX1 U184 ( .A(subkey[35]), .Y(n154) );
  AOI22X1 U185 ( .A(keyOut_4), .B(n21), .C(keyOut[61]), .D(n22), .Y(n157) );
  AOI22X1 U186 ( .A(left_6), .B(n4), .C(left_3), .D(n23), .Y(n156) );
  OR2X1 U187 ( .A(n160), .B(n161), .Y(n409) );
  OAI21X1 U188 ( .A(key_enable), .B(n162), .C(n163), .Y(n161) );
  AOI22X1 U189 ( .A(subkey[21]), .B(n9), .C(subkey[8]), .D(n29), .Y(n163) );
  OAI21X1 U190 ( .A(n30), .B(n164), .C(n165), .Y(n160) );
  AOI22X1 U191 ( .A(keyOut_9), .B(n21), .C(subkey[18]), .D(n4), .Y(n165) );
  NAND3X1 U192 ( .A(n166), .B(n167), .C(n168), .Y(n407) );
  AOI21X1 U193 ( .A(subkey[17]), .B(n15), .C(n169), .Y(n168) );
  OAI22X1 U194 ( .A(n8), .B(n162), .C(n19), .D(n170), .Y(n169) );
  INVX1 U195 ( .A(subkey[1]), .Y(n162) );
  AOI22X1 U196 ( .A(keyOut_17), .B(n21), .C(keyOut_9), .D(n22), .Y(n167) );
  AOI22X1 U197 ( .A(subkey[8]), .B(n4), .C(subkey[21]), .D(n23), .Y(n166) );
  NAND3X1 U198 ( .A(n171), .B(n172), .C(n173), .Y(n406) );
  AOI21X1 U199 ( .A(subkey[21]), .B(n15), .C(n174), .Y(n173) );
  OAI22X1 U200 ( .A(n8), .B(n164), .C(n19), .D(n175), .Y(n174) );
  AOI22X1 U201 ( .A(keyOut_25), .B(n21), .C(keyOut_17), .D(n22), .Y(n172) );
  AOI22X1 U202 ( .A(subkey[1]), .B(n4), .C(subkey[0]), .D(n23), .Y(n171) );
  NAND3X1 U203 ( .A(n176), .B(n177), .C(n178), .Y(n405) );
  INVX1 U204 ( .A(n179), .Y(n178) );
  OAI21X1 U205 ( .A(n170), .B(key_enable), .C(n180), .Y(n179) );
  AOI22X1 U206 ( .A(n29), .B(subkey[21]), .C(n28), .D(subkey[7]), .Y(n180) );
  AOI22X1 U207 ( .A(keyOut_33), .B(n21), .C(keyOut_25), .D(n22), .Y(n177) );
  AOI22X1 U208 ( .A(subkey[17]), .B(n4), .C(subkey[13]), .D(n23), .Y(n176) );
  NAND3X1 U209 ( .A(n181), .B(n182), .C(n183), .Y(n403) );
  AOI21X1 U210 ( .A(subkey[13]), .B(n15), .C(n184), .Y(n183) );
  OAI22X1 U211 ( .A(n8), .B(n170), .C(n19), .D(n185), .Y(n184) );
  INVX1 U212 ( .A(subkey[0]), .Y(n170) );
  AOI22X1 U213 ( .A(keyOut_41), .B(n21), .C(keyOut_33), .D(n22), .Y(n182) );
  AOI22X1 U214 ( .A(subkey[21]), .B(n4), .C(subkey[7]), .D(n23), .Y(n181) );
  NAND3X1 U215 ( .A(n186), .B(n187), .C(n188), .Y(n401) );
  AOI21X1 U216 ( .A(subkey[7]), .B(n15), .C(n189), .Y(n188) );
  OAI22X1 U217 ( .A(n8), .B(n175), .C(n19), .D(n190), .Y(n189) );
  INVX1 U218 ( .A(subkey[13]), .Y(n175) );
  AOI22X1 U219 ( .A(keyOut_49), .B(n21), .C(keyOut_41), .D(n22), .Y(n187) );
  AOI22X1 U220 ( .A(subkey[0]), .B(n4), .C(\right[21] ), .D(n23), .Y(n186) );
  NAND3X1 U221 ( .A(n191), .B(n192), .C(n193), .Y(n400) );
  INVX1 U222 ( .A(n194), .Y(n193) );
  OAI21X1 U223 ( .A(n185), .B(key_enable), .C(n195), .Y(n194) );
  AOI22X1 U224 ( .A(n29), .B(subkey[7]), .C(n28), .D(subkey[20]), .Y(n195) );
  AOI22X1 U225 ( .A(keyOut[57]), .B(n21), .C(keyOut_49), .D(n22), .Y(n192) );
  AOI22X1 U226 ( .A(subkey[13]), .B(n4), .C(subkey[2]), .D(n23), .Y(n191) );
  NAND3X1 U227 ( .A(n196), .B(n197), .C(n198), .Y(n398) );
  AOI21X1 U228 ( .A(subkey[2]), .B(n15), .C(n199), .Y(n198) );
  OAI22X1 U229 ( .A(n8), .B(n185), .C(n19), .D(n200), .Y(n199) );
  INVX1 U230 ( .A(\right[21] ), .Y(n185) );
  AOI22X1 U231 ( .A(keyOut_2), .B(n21), .C(keyOut[57]), .D(n22), .Y(n197) );
  AOI22X1 U232 ( .A(subkey[7]), .B(n4), .C(subkey[20]), .D(n23), .Y(n196) );
  NAND3X1 U233 ( .A(n201), .B(n202), .C(n203), .Y(n397) );
  AOI21X1 U234 ( .A(subkey[20]), .B(n15), .C(n204), .Y(n203) );
  OAI22X1 U235 ( .A(n8), .B(n190), .C(n19), .D(n205), .Y(n204) );
  INVX1 U236 ( .A(subkey[2]), .Y(n190) );
  AOI21X1 U237 ( .A(keyOut_2), .B(n22), .C(n21), .Y(n202) );
  AOI22X1 U238 ( .A(\right[21] ), .B(n4), .C(right_18), .D(n23), .Y(n201) );
  OR2X1 U239 ( .A(n206), .B(n207), .Y(n396) );
  OAI21X1 U240 ( .A(key_enable), .B(n200), .C(n208), .Y(n207) );
  AOI22X1 U241 ( .A(subkey[16]), .B(n9), .C(subkey[20]), .D(n29), .Y(n208) );
  INVX1 U242 ( .A(right_18), .Y(n200) );
  NAND3X1 U243 ( .A(n209), .B(n210), .C(n211), .Y(n206) );
  AOI22X1 U244 ( .A(subkey[2]), .B(n4), .C(subkey[9]), .D(n23), .Y(n211) );
  OR2X1 U245 ( .A(n212), .B(n213), .Y(n394) );
  OAI21X1 U246 ( .A(key_enable), .B(n205), .C(n214), .Y(n213) );
  AOI22X1 U247 ( .A(subkey[23]), .B(n9), .C(right_18), .D(n29), .Y(n214) );
  INVX1 U248 ( .A(subkey[9]), .Y(n205) );
  OAI21X1 U249 ( .A(n30), .B(n215), .C(n216), .Y(n212) );
  AOI21X1 U250 ( .A(subkey[20]), .B(n4), .C(n22), .Y(n216) );
  OR2X1 U251 ( .A(n217), .B(n218), .Y(n392) );
  OAI21X1 U252 ( .A(key_enable), .B(n215), .C(n219), .Y(n218) );
  AOI22X1 U253 ( .A(subkey[4]), .B(n9), .C(subkey[9]), .D(n29), .Y(n219) );
  OAI21X1 U254 ( .A(n30), .B(n220), .C(n221), .Y(n217) );
  AOI22X1 U255 ( .A(keyOut_34), .B(n21), .C(right_18), .D(n4), .Y(n221) );
  INVX1 U256 ( .A(subkey[23]), .Y(n220) );
  NAND3X1 U257 ( .A(n222), .B(n223), .C(n224), .Y(n390) );
  AOI21X1 U258 ( .A(subkey[23]), .B(n15), .C(n225), .Y(n224) );
  OAI22X1 U259 ( .A(n8), .B(n215), .C(n19), .D(n226), .Y(n225) );
  INVX1 U260 ( .A(subkey[16]), .Y(n215) );
  AOI21X1 U261 ( .A(keyOut_34), .B(n22), .C(n21), .Y(n223) );
  AOI22X1 U262 ( .A(subkey[9]), .B(n4), .C(subkey[4]), .D(n23), .Y(n222) );
  OR2X1 U263 ( .A(n227), .B(n228), .Y(n389) );
  OAI21X1 U264 ( .A(key_enable), .B(n229), .C(n230), .Y(n228) );
  AOI22X1 U265 ( .A(subkey[11]), .B(n9), .C(subkey[23]), .D(n29), .Y(n230) );
  OAI21X1 U266 ( .A(n30), .B(n226), .C(n231), .Y(n227) );
  AOI21X1 U267 ( .A(subkey[16]), .B(n4), .C(n22), .Y(n231) );
  OR2X1 U268 ( .A(n232), .B(n233), .Y(n387) );
  OAI22X1 U269 ( .A(key_enable), .B(n226), .C(n17), .D(n229), .Y(n233) );
  INVX1 U270 ( .A(subkey[4]), .Y(n229) );
  INVX1 U271 ( .A(right_13), .Y(n226) );
  OAI21X1 U272 ( .A(n19), .B(n234), .C(n235), .Y(n232) );
  AOI22X1 U273 ( .A(subkey[23]), .B(n4), .C(subkey[11]), .D(n23), .Y(n235) );
  OR2X1 U274 ( .A(n236), .B(n237), .Y(n385) );
  OAI21X1 U275 ( .A(key_enable), .B(n238), .C(n239), .Y(n237) );
  AOI22X1 U276 ( .A(subkey[5]), .B(n9), .C(right_13), .D(n29), .Y(n239) );
  OAI21X1 U277 ( .A(n30), .B(n234), .C(n240), .Y(n236) );
  AOI22X1 U278 ( .A(keyOut_3), .B(n21), .C(subkey[4]), .D(n4), .Y(n240) );
  NAND3X1 U279 ( .A(n241), .B(n242), .C(n243), .Y(n383) );
  AOI21X1 U280 ( .A(subkey[14]), .B(n15), .C(n244), .Y(n243) );
  OAI22X1 U281 ( .A(n17), .B(n238), .C(n19), .D(n245), .Y(n244) );
  INVX1 U282 ( .A(subkey[11]), .Y(n238) );
  AOI22X1 U283 ( .A(keyOut_11), .B(n21), .C(keyOut_3), .D(n22), .Y(n242) );
  AOI22X1 U284 ( .A(right_13), .B(n4), .C(subkey[5]), .D(n23), .Y(n241) );
  NAND3X1 U285 ( .A(n246), .B(n247), .C(n248), .Y(n381) );
  AOI21X1 U286 ( .A(subkey[5]), .B(n15), .C(n249), .Y(n248) );
  OAI22X1 U287 ( .A(n17), .B(n234), .C(n19), .D(n250), .Y(n249) );
  INVX1 U288 ( .A(subkey[14]), .Y(n234) );
  AOI22X1 U289 ( .A(keyOut_19), .B(n21), .C(keyOut_11), .D(n22), .Y(n247) );
  AOI22X1 U290 ( .A(subkey[11]), .B(n4), .C(subkey[19]), .D(n23), .Y(n246) );
  NAND3X1 U291 ( .A(n251), .B(n252), .C(n253), .Y(n380) );
  INVX1 U292 ( .A(n254), .Y(n253) );
  OAI21X1 U293 ( .A(n245), .B(key_enable), .C(n255), .Y(n254) );
  AOI22X1 U294 ( .A(n29), .B(subkey[5]), .C(n28), .D(subkey[10]), .Y(n255) );
  AOI22X1 U295 ( .A(keyOut_27), .B(n21), .C(keyOut_19), .D(n22), .Y(n252) );
  AOI22X1 U296 ( .A(subkey[14]), .B(n4), .C(subkey[12]), .D(n23), .Y(n251) );
  NAND3X1 U297 ( .A(n256), .B(n257), .C(n258), .Y(n379) );
  AOI21X1 U298 ( .A(subkey[12]), .B(n15), .C(n259), .Y(n258) );
  OAI22X1 U299 ( .A(n17), .B(n245), .C(n19), .D(n260), .Y(n259) );
  INVX1 U300 ( .A(subkey[19]), .Y(n245) );
  AOI22X1 U301 ( .A(keyOut_35), .B(n21), .C(keyOut_27), .D(n22), .Y(n257) );
  AOI22X1 U302 ( .A(subkey[5]), .B(n4), .C(subkey[10]), .D(n23), .Y(n256) );
  NAND3X1 U303 ( .A(n261), .B(n262), .C(n263), .Y(n378) );
  AOI21X1 U304 ( .A(subkey[10]), .B(n15), .C(n264), .Y(n263) );
  OAI22X1 U305 ( .A(n17), .B(n250), .C(n19), .D(n265), .Y(n264) );
  INVX1 U306 ( .A(subkey[15]), .Y(n265) );
  INVX1 U307 ( .A(subkey[12]), .Y(n250) );
  AOI22X1 U308 ( .A(keyOut_43), .B(n21), .C(keyOut_35), .D(n22), .Y(n262) );
  AOI22X1 U309 ( .A(subkey[19]), .B(n4), .C(subkey[3]), .D(n23), .Y(n261) );
  NAND3X1 U310 ( .A(n266), .B(n267), .C(n268), .Y(n377) );
  INVX1 U311 ( .A(n269), .Y(n268) );
  OAI21X1 U312 ( .A(n260), .B(key_enable), .C(n270), .Y(n269) );
  AOI22X1 U313 ( .A(n29), .B(subkey[10]), .C(n28), .D(subkey[22]), .Y(n270) );
  AOI22X1 U314 ( .A(keyOut_51), .B(n21), .C(keyOut_43), .D(n22), .Y(n267) );
  AOI22X1 U315 ( .A(subkey[12]), .B(n4), .C(subkey[15]), .D(n23), .Y(n266) );
  NAND3X1 U316 ( .A(n271), .B(n272), .C(n273), .Y(n376) );
  AOI21X1 U317 ( .A(subkey[15]), .B(n15), .C(n274), .Y(n273) );
  OAI22X1 U318 ( .A(n17), .B(n260), .C(n19), .D(n275), .Y(n274) );
  INVX1 U319 ( .A(subkey[3]), .Y(n260) );
  AOI22X1 U320 ( .A(keyOut[59]), .B(n21), .C(keyOut_51), .D(n22), .Y(n272) );
  AOI22X1 U321 ( .A(subkey[10]), .B(n4), .C(subkey[22]), .D(n23), .Y(n271) );
  NAND3X1 U322 ( .A(n276), .B(n277), .C(n278), .Y(n375) );
  INVX1 U323 ( .A(n279), .Y(n278) );
  OAI21X1 U324 ( .A(n280), .B(key_enable), .C(n281), .Y(n279) );
  AOI22X1 U325 ( .A(n29), .B(subkey[15]), .C(n28), .D(right_2), .Y(n281) );
  AOI22X1 U326 ( .A(keyOut_36), .B(n21), .C(keyOut[59]), .D(n22), .Y(n277) );
  AOI22X1 U327 ( .A(subkey[3]), .B(n4), .C(subkey[6]), .D(n23), .Y(n276) );
  NAND3X1 U328 ( .A(n282), .B(n283), .C(n284), .Y(n374) );
  AOI21X1 U329 ( .A(subkey[6]), .B(n15), .C(n285), .Y(n284) );
  OAI22X1 U330 ( .A(n17), .B(n280), .C(n19), .D(n286), .Y(n285) );
  INVX1 U331 ( .A(subkey[22]), .Y(n280) );
  AOI22X1 U332 ( .A(keyOut_44), .B(n21), .C(keyOut_36), .D(n22), .Y(n283) );
  AOI22X1 U333 ( .A(subkey[15]), .B(n4), .C(right_2), .D(n23), .Y(n282) );
  NAND3X1 U334 ( .A(n287), .B(n288), .C(n289), .Y(n372) );
  AOI21X1 U335 ( .A(right_2), .B(n15), .C(n290), .Y(n289) );
  OAI22X1 U336 ( .A(n17), .B(n275), .C(n19), .D(n291), .Y(n290) );
  INVX1 U337 ( .A(subkey[6]), .Y(n275) );
  AOI22X1 U338 ( .A(keyOut_52), .B(n21), .C(keyOut_44), .D(n22), .Y(n288) );
  NAND3X1 U339 ( .A(n292), .B(n293), .C(key_enable), .Y(n209) );
  AOI22X1 U340 ( .A(subkey[22]), .B(n4), .C(subkey[18]), .D(n23), .Y(n287) );
  OR2X1 U341 ( .A(n294), .B(n295), .Y(n370) );
  OAI21X1 U342 ( .A(key_enable), .B(n286), .C(n296), .Y(n295) );
  AOI22X1 U343 ( .A(subkey[1]), .B(n9), .C(right_2), .D(n29), .Y(n296) );
  OAI21X1 U344 ( .A(n30), .B(n291), .C(n297), .Y(n294) );
  AOI22X1 U345 ( .A(keyOut_52), .B(n22), .C(subkey[6]), .D(n4), .Y(n297) );
  OAI21X1 U346 ( .A(n298), .B(n299), .C(key_enable), .Y(n210) );
  NOR2X1 U347 ( .A(n300), .B(n293), .Y(n299) );
  OR2X1 U348 ( .A(n301), .B(n302), .Y(n368) );
  OAI22X1 U349 ( .A(key_enable), .B(n291), .C(n17), .D(n286), .Y(n302) );
  INVX1 U350 ( .A(subkey[18]), .Y(n286) );
  NAND3X1 U351 ( .A(key_enable), .B(n303), .C(n304), .Y(n17) );
  INVX1 U352 ( .A(subkey[8]), .Y(n291) );
  OAI21X1 U353 ( .A(n19), .B(n164), .C(n305), .Y(n301) );
  AOI22X1 U354 ( .A(right_2), .B(n4), .C(subkey[1]), .D(n23), .Y(n305) );
  NAND3X1 U355 ( .A(n303), .B(n293), .C(key_enable), .Y(n30) );
  INVX1 U356 ( .A(n306), .Y(n303) );
  INVX1 U357 ( .A(n304), .Y(n293) );
  INVX1 U358 ( .A(subkey[17]), .Y(n164) );
  NOR2X1 U359 ( .A(n307), .B(n304), .Y(n28) );
  MUX2X1 U360 ( .B(n308), .A(n309), .S(reverse), .Y(n304) );
  NOR2X1 U361 ( .A(key_count[1]), .B(n308), .Y(n309) );
  NAND3X1 U362 ( .A(n306), .B(key_enable), .C(n310), .Y(n307) );
  NOR2X1 U363 ( .A(n292), .B(n298), .Y(n310) );
  INVX1 U364 ( .A(n311), .Y(n298) );
  NAND3X1 U365 ( .A(n312), .B(n313), .C(n314), .Y(n311) );
  INVX1 U366 ( .A(round_count[0]), .Y(n312) );
  INVX1 U367 ( .A(n300), .Y(n292) );
  NAND3X1 U368 ( .A(n314), .B(n313), .C(round_count[0]), .Y(n300) );
  INVX1 U369 ( .A(round_count[3]), .Y(n313) );
  MUX2X1 U370 ( .B(n315), .A(n316), .S(round_count[3]), .Y(n306) );
  AND2X1 U371 ( .A(n314), .B(round_count[0]), .Y(n316) );
  NOR3X1 U372 ( .A(round_count[2]), .B(round_count[4]), .C(round_count[1]), 
        .Y(n314) );
  NOR2X1 U373 ( .A(n317), .B(n318), .Y(n315) );
  OR2X1 U374 ( .A(round_count[0]), .B(round_count[2]), .Y(n318) );
  XNOR2X1 U375 ( .A(round_count[1]), .B(round_count[4]), .Y(n317) );
  OAI21X1 U376 ( .A(n319), .B(n10), .C(n321), .Y(keyNext_9) );
  INVX1 U377 ( .A(keyOut_9), .Y(n319) );
  OAI21X1 U378 ( .A(n322), .B(n10), .C(n323), .Y(keyNext_55) );
  INVX1 U379 ( .A(keyOut_55), .Y(n322) );
  OAI21X1 U380 ( .A(n324), .B(n10), .C(n325), .Y(keyNext_54) );
  INVX1 U381 ( .A(keyOut_54), .Y(n324) );
  OAI21X1 U382 ( .A(n326), .B(n327), .C(n328), .Y(keyNext_53) );
  INVX1 U383 ( .A(keyOut_53), .Y(n326) );
  OAI21X1 U384 ( .A(n329), .B(n327), .C(n328), .Y(keyNext_52) );
  INVX1 U385 ( .A(keyOut_52), .Y(n329) );
  OAI21X1 U386 ( .A(n330), .B(n10), .C(n331), .Y(keyNext_51) );
  INVX1 U387 ( .A(keyOut_51), .Y(n330) );
  OAI21X1 U388 ( .A(n332), .B(n327), .C(n328), .Y(keyNext_49) );
  INVX1 U389 ( .A(keyOut_49), .Y(n332) );
  OAI21X1 U390 ( .A(n333), .B(n10), .C(n334), .Y(keyNext_46) );
  INVX1 U391 ( .A(keyOut_46), .Y(n333) );
  OAI21X1 U392 ( .A(n335), .B(n10), .C(n321), .Y(keyNext_45) );
  INVX1 U393 ( .A(keyOut_45), .Y(n335) );
  OAI21X1 U394 ( .A(n336), .B(n327), .C(n328), .Y(keyNext_44) );
  INVX1 U395 ( .A(keyOut_44), .Y(n336) );
  OAI21X1 U396 ( .A(n337), .B(n10), .C(n321), .Y(keyNext_43) );
  INVX1 U397 ( .A(keyOut_43), .Y(n337) );
  OAI21X1 U398 ( .A(n338), .B(n10), .C(n331), .Y(keyNext_41) );
  INVX1 U399 ( .A(keyOut_41), .Y(n338) );
  OAI21X1 U400 ( .A(n339), .B(n327), .C(n328), .Y(keyNext_4) );
  INVX1 U401 ( .A(keyOut_4), .Y(n339) );
  OAI21X1 U402 ( .A(n340), .B(n10), .C(n331), .Y(keyNext_39) );
  INVX1 U403 ( .A(keyOut_39), .Y(n340) );
  OAI21X1 U404 ( .A(n341), .B(n10), .C(n323), .Y(keyNext_38) );
  INVX1 U405 ( .A(keyOut_38), .Y(n341) );
  OAI21X1 U406 ( .A(n342), .B(n327), .C(n328), .Y(keyNext_36) );
  INVX1 U407 ( .A(keyOut_36), .Y(n342) );
  OAI21X1 U408 ( .A(n343), .B(n10), .C(n321), .Y(keyNext_35) );
  INVX1 U409 ( .A(keyOut_35), .Y(n343) );
  OAI21X1 U410 ( .A(n344), .B(n10), .C(n334), .Y(keyNext_34) );
  INVX1 U411 ( .A(keyOut_34), .Y(n344) );
  OAI21X1 U412 ( .A(n345), .B(n10), .C(n323), .Y(keyNext_33) );
  INVX1 U413 ( .A(keyOut_33), .Y(n345) );
  OAI21X1 U414 ( .A(n346), .B(n10), .C(n331), .Y(keyNext_31) );
  INVX1 U415 ( .A(keyOut_31), .Y(n346) );
  OAI21X1 U416 ( .A(n347), .B(n10), .C(n325), .Y(keyNext_30) );
  INVX1 U417 ( .A(keyOut_30), .Y(n347) );
  OAI21X1 U418 ( .A(n348), .B(n327), .C(n328), .Y(keyNext_3) );
  INVX1 U419 ( .A(keyOut_3), .Y(n348) );
  OAI21X1 U420 ( .A(n349), .B(n10), .C(n334), .Y(keyNext_29) );
  INVX1 U421 ( .A(keyOut_29), .Y(n349) );
  OAI21X1 U422 ( .A(n350), .B(n10), .C(n331), .Y(keyNext_28) );
  INVX1 U423 ( .A(keyOut_28), .Y(n350) );
  OAI21X1 U424 ( .A(n351), .B(n10), .C(n331), .Y(keyNext_27) );
  INVX1 U425 ( .A(keyOut_27), .Y(n351) );
  OAI21X1 U426 ( .A(n352), .B(n327), .C(n328), .Y(keyNext_25) );
  NOR2X1 U427 ( .A(n353), .B(n354), .Y(n328) );
  INVX1 U428 ( .A(keyOut_25), .Y(n352) );
  OAI21X1 U429 ( .A(n355), .B(n10), .C(n321), .Y(keyNext_23) );
  INVX1 U430 ( .A(keyOut_23), .Y(n355) );
  OAI21X1 U431 ( .A(n356), .B(n10), .C(n334), .Y(keyNext_2) );
  INVX1 U432 ( .A(keyOut_2), .Y(n356) );
  OAI21X1 U433 ( .A(n357), .B(n10), .C(n325), .Y(keyNext_19) );
  INVX1 U434 ( .A(keyOut_19), .Y(n357) );
  OAI21X1 U435 ( .A(n358), .B(n320), .C(n321), .Y(keyNext_17) );
  INVX1 U436 ( .A(keyOut_17), .Y(n358) );
  OAI21X1 U437 ( .A(n359), .B(n320), .C(n321), .Y(keyNext_15) );
  INVX1 U438 ( .A(keyOut_15), .Y(n359) );
  OAI21X1 U439 ( .A(n360), .B(n320), .C(n323), .Y(keyNext_14) );
  INVX1 U440 ( .A(keyOut_14), .Y(n360) );
  OAI21X1 U441 ( .A(n361), .B(n320), .C(n331), .Y(keyNext_13) );
  INVX1 U442 ( .A(keyOut_13), .Y(n361) );
  OAI21X1 U443 ( .A(n362), .B(n320), .C(n325), .Y(keyNext_12) );
  INVX1 U444 ( .A(keyOut_12), .Y(n362) );
  OAI21X1 U445 ( .A(n363), .B(n320), .C(n331), .Y(keyNext_11) );
  INVX1 U446 ( .A(keyOut_11), .Y(n363) );
  OAI21X1 U447 ( .A(n364), .B(n320), .C(n321), .Y(keyNext[63]) );
  INVX1 U448 ( .A(keyOut[63]), .Y(n364) );
  OAI21X1 U449 ( .A(n365), .B(n320), .C(n321), .Y(keyNext[62]) );
  INVX1 U450 ( .A(keyOut[62]), .Y(n365) );
  OAI21X1 U451 ( .A(n366), .B(n320), .C(n334), .Y(keyNext[61]) );
  AND2X1 U452 ( .A(n325), .B(n323), .Y(n334) );
  MUX2X1 U453 ( .B(n354), .A(n353), .S(reverse), .Y(n325) );
  INVX1 U454 ( .A(keyOut[61]), .Y(n366) );
  OAI21X1 U455 ( .A(n463), .B(n320), .C(n321), .Y(keyNext[59]) );
  INVX1 U456 ( .A(keyOut[59]), .Y(n463) );
  OAI21X1 U457 ( .A(n464), .B(n320), .C(n321), .Y(keyNext[57]) );
  AND2X1 U458 ( .A(n331), .B(n323), .Y(n321) );
  NAND3X1 U459 ( .A(n308), .B(n465), .C(n466), .Y(n323) );
  MUX2X1 U460 ( .B(n353), .A(n354), .S(reverse), .Y(n331) );
  INVX1 U461 ( .A(n467), .Y(n354) );
  NAND3X1 U462 ( .A(key_count[0]), .B(n465), .C(n466), .Y(n467) );
  OAI21X1 U463 ( .A(n327), .B(n468), .C(n465), .Y(n353) );
  INVX1 U504 ( .A(key_rollover), .Y(n465) );
  NAND2X1 U505 ( .A(n308), .B(n469), .Y(n468) );
  INVX1 U506 ( .A(key_count[0]), .Y(n308) );
  INVX1 U507 ( .A(n470), .Y(n327) );
  OAI21X1 U508 ( .A(key_count[1]), .B(key_count[0]), .C(n470), .Y(n320) );
  NOR2X1 U509 ( .A(n466), .B(key_rollover), .Y(n470) );
  AND2X1 U510 ( .A(cnt_rollover), .B(n469), .Y(n466) );
  INVX1 U511 ( .A(key_count[1]), .Y(n469) );
  INVX1 U512 ( .A(keyOut[57]), .Y(n464) );
endmodule


module key_counter ( clk, n_rst, count_enable, empty, key_count, key_rollover
 );
  output [1:0] key_count;
  input clk, n_rst, count_enable, empty;
  output key_rollover;
  wire   n16, n17, n18, n4, n5, n6, n7, n8, n9, n10, n11, n12;

  DFFSR \key_reg_reg[0]  ( .D(n18), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        key_count[0]) );
  DFFSR rollover_reg_reg ( .D(n16), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        key_rollover) );
  DFFSR \key_reg_reg[1]  ( .D(n17), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        key_count[1]) );
  OAI22X1 U6 ( .A(key_rollover), .B(n4), .C(n5), .D(n6), .Y(n18) );
  OAI21X1 U7 ( .A(n5), .B(n7), .C(n8), .Y(n17) );
  NAND3X1 U8 ( .A(n9), .B(n10), .C(n11), .Y(n8) );
  MUX2X1 U9 ( .B(n12), .A(n7), .S(n6), .Y(n11) );
  NAND2X1 U10 ( .A(count_enable), .B(n7), .Y(n12) );
  OAI22X1 U11 ( .A(n4), .B(n7), .C(n5), .D(n10), .Y(n16) );
  INVX1 U12 ( .A(key_rollover), .Y(n10) );
  OR2X1 U13 ( .A(count_enable), .B(empty), .Y(n5) );
  INVX1 U14 ( .A(key_count[1]), .Y(n7) );
  NAND3X1 U15 ( .A(n9), .B(n6), .C(count_enable), .Y(n4) );
  INVX1 U16 ( .A(key_count[0]), .Y(n6) );
  INVX1 U17 ( .A(empty), .Y(n9) );
endmodule


module round_counter ( clk, n_rst, count_enable, round_count, cnt_rollover );
  output [4:0] round_count;
  input clk, n_rst, count_enable;
  output cnt_rollover;
  wire   N5, N6, N7, N8, N9, n28, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n29, n30,
         n31, n32;

  DFFSR \count_reg_reg[0]  ( .D(N5), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        round_count[0]) );
  DFFSR \count_reg_reg[4]  ( .D(N9), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        round_count[4]) );
  DFFSR rollover_reg_reg ( .D(n28), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        cnt_rollover) );
  DFFSR \count_reg_reg[1]  ( .D(N6), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        round_count[1]) );
  DFFSR \count_reg_reg[2]  ( .D(N7), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        round_count[2]) );
  DFFSR \count_reg_reg[3]  ( .D(N8), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        round_count[3]) );
  NOR2X1 U9 ( .A(n7), .B(n8), .Y(n28) );
  NAND3X1 U10 ( .A(n9), .B(n10), .C(n11), .Y(n8) );
  NAND3X1 U11 ( .A(n12), .B(n13), .C(n14), .Y(n7) );
  NOR2X1 U12 ( .A(n15), .B(n16), .Y(N9) );
  AOI22X1 U13 ( .A(n11), .B(n12), .C(round_count[4]), .D(n17), .Y(n16) );
  OAI21X1 U14 ( .A(n18), .B(n19), .C(n20), .Y(n12) );
  INVX1 U15 ( .A(round_count[4]), .Y(n20) );
  INVX1 U16 ( .A(round_count[3]), .Y(n19) );
  INVX1 U17 ( .A(n21), .Y(N8) );
  INVX1 U18 ( .A(n22), .Y(N7) );
  INVX1 U19 ( .A(n23), .Y(N6) );
  NOR2X1 U20 ( .A(n15), .B(n24), .Y(N5) );
  MUX2X1 U21 ( .B(n11), .A(n17), .S(round_count[0]), .Y(n24) );
  NOR2X1 U22 ( .A(n25), .B(n26), .Y(n15) );
  OAI21X1 U23 ( .A(round_count[0]), .B(n11), .C(round_count[4]), .Y(n26) );
  NAND3X1 U24 ( .A(n22), .B(n21), .C(n23), .Y(n25) );
  AOI22X1 U25 ( .A(round_count[1]), .B(n17), .C(n27), .D(n11), .Y(n23) );
  INVX1 U26 ( .A(n14), .Y(n27) );
  XOR2X1 U27 ( .A(round_count[1]), .B(n13), .Y(n14) );
  INVX1 U28 ( .A(round_count[0]), .Y(n13) );
  AOI22X1 U29 ( .A(round_count[3]), .B(n17), .C(n29), .D(n11), .Y(n21) );
  INVX1 U30 ( .A(n10), .Y(n29) );
  XOR2X1 U31 ( .A(n18), .B(round_count[3]), .Y(n10) );
  NAND3X1 U32 ( .A(round_count[1]), .B(round_count[0]), .C(round_count[2]), 
        .Y(n18) );
  AOI22X1 U33 ( .A(round_count[2]), .B(n17), .C(n30), .D(n11), .Y(n22) );
  NOR2X1 U34 ( .A(n31), .B(cnt_rollover), .Y(n11) );
  INVX1 U35 ( .A(count_enable), .Y(n31) );
  INVX1 U36 ( .A(n9), .Y(n30) );
  XOR2X1 U37 ( .A(n32), .B(round_count[2]), .Y(n9) );
  NAND2X1 U38 ( .A(round_count[1]), .B(round_count[0]), .Y(n32) );
  NOR2X1 U39 ( .A(cnt_rollover), .B(count_enable), .Y(n17) );
endmodule


module des_controller ( clk, n_rst, receive, empty, key_rollover, encrypt_sync, 
        count_enable, reverse, des_start, data_out, des_enable, key_enable );
  input clk, n_rst, receive, empty, key_rollover, encrypt_sync;
  output count_enable, reverse, des_start, data_out, des_enable, key_enable;
  wire   n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n31, n32;
  wire   [3:0] state;
  wire   [3:0] nextstate;

  DFFSR \state_reg[0]  ( .D(nextstate[0]), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        state[0]) );
  DFFSR \state_reg[1]  ( .D(nextstate[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[1]) );
  DFFSR \state_reg[3]  ( .D(nextstate[3]), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        state[3]) );
  DFFSR \state_reg[2]  ( .D(nextstate[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[2]) );
  BUFX4 U7 ( .A(n32), .Y(key_enable) );
  BUFX4 U8 ( .A(n31), .Y(des_start) );
  OAI21X1 U9 ( .A(n7), .B(n8), .C(n9), .Y(nextstate[3]) );
  NAND2X1 U10 ( .A(state[3]), .B(n10), .Y(n9) );
  OAI21X1 U11 ( .A(state[0]), .B(empty), .C(n11), .Y(n10) );
  NAND2X1 U12 ( .A(state[1]), .B(state[0]), .Y(n8) );
  NAND3X1 U13 ( .A(n12), .B(n13), .C(n14), .Y(nextstate[2]) );
  OAI21X1 U14 ( .A(n15), .B(state[3]), .C(state[2]), .Y(n14) );
  INVX1 U15 ( .A(n16), .Y(n15) );
  OAI21X1 U16 ( .A(key_rollover), .B(n17), .C(n18), .Y(n16) );
  NAND2X1 U17 ( .A(n19), .B(n12), .Y(nextstate[1]) );
  MUX2X1 U18 ( .B(state[1]), .A(n11), .S(n20), .Y(n19) );
  OAI21X1 U19 ( .A(n11), .B(n21), .C(n22), .Y(nextstate[0]) );
  NAND2X1 U20 ( .A(receive), .B(n23), .Y(n22) );
  AOI21X1 U21 ( .A(state[3]), .B(state[0]), .C(n23), .Y(n21) );
  INVX1 U22 ( .A(encrypt_sync), .Y(reverse) );
  INVX1 U23 ( .A(n12), .Y(des_enable) );
  NAND3X1 U24 ( .A(state[2]), .B(n17), .C(n20), .Y(n12) );
  NOR2X1 U25 ( .A(n24), .B(n25), .Y(n31) );
  NAND2X1 U26 ( .A(state[1]), .B(n7), .Y(n25) );
  NOR2X1 U27 ( .A(n24), .B(n26), .Y(n32) );
  NAND2X1 U28 ( .A(state[2]), .B(n17), .Y(n26) );
  INVX1 U29 ( .A(state[1]), .Y(n17) );
  INVX1 U30 ( .A(n23), .Y(n24) );
  NOR2X1 U31 ( .A(state[0]), .B(state[3]), .Y(n23) );
  INVX1 U32 ( .A(n13), .Y(count_enable) );
  NAND3X1 U33 ( .A(state[1]), .B(n7), .C(n20), .Y(n13) );
  NOR2X1 U34 ( .A(n18), .B(state[3]), .Y(n20) );
  INVX1 U35 ( .A(state[2]), .Y(n7) );
  NOR2X1 U36 ( .A(n27), .B(n28), .Y(data_out) );
  NAND2X1 U37 ( .A(n11), .B(n18), .Y(n28) );
  INVX1 U38 ( .A(state[0]), .Y(n18) );
  NOR2X1 U39 ( .A(state[2]), .B(state[1]), .Y(n11) );
  INVX1 U40 ( .A(state[3]), .Y(n27) );
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
  wire   des_start, des_enable, reverse, cnt_rollover, key_rollover,
         key_enable, count_enable, encrypt_sync;
  wire   [63:0] des_curr;
  wire   [63:0] des_in;
  wire   [4:0] round_count;
  wire   [47:0] subkey;
  wire   [1:0] key_count;

  permutation PERMUTATION ( .rcv_data(rcv_data), .des_curr(des_curr), 
        .tx_data(trans_data), .des_in(des_in) );
  des_round_computations DES_COMP ( .clk(clk), .n_rst(n_rst), .des_start(
        des_start), .des_enable(des_enable), .round_count(round_count), 
        .des_in(des_in), .subkey(subkey), .des_curr(des_curr) );
  key_generator KEYGEN ( .clk(clk), .n_rst(n_rst), .reverse(reverse), 
        .cnt_rollover(cnt_rollover), .key_rollover(key_rollover), .key_enable(
        key_enable), .round_count(round_count), .key_count(key_count), 
        .subkey(subkey) );
  key_counter KEYCNTR ( .clk(clk), .n_rst(n_rst), .count_enable(cnt_rollover), 
        .empty(handshake_ack), .key_count(key_count), .key_rollover(
        key_rollover) );
  round_counter RNDCNTR ( .clk(clk), .n_rst(n_rst), .count_enable(count_enable), .round_count(round_count), .cnt_rollover(cnt_rollover) );
  des_controller DES_CONTROLLER ( .clk(clk), .n_rst(n_rst), .receive(
        rcv_data_ready), .empty(handshake_ack), .key_rollover(key_rollover), 
        .encrypt_sync(encrypt_sync), .count_enable(count_enable), .reverse(
        reverse), .des_start(des_start), .data_out(trans_data_ready), 
        .des_enable(des_enable), .key_enable(key_enable) );
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
        .clear(n164), .count_enable(crc16_shift_enable), .rollover_val({1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0}), .rollover_flag(
        async_crc16_bits_transmitted) );
  flex_counter_NUM_CNT_BITS32_0 data_bits_receive ( .clk(clk), .n_rst(n_rst), 
        .clear(n165), .count_enable(data_shift_enable), .rollover_val({1'b0, 
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
  INVX1 U165 ( .A(crc16_transmitting), .Y(n164) );
  INVX1 U166 ( .A(data_transmitting), .Y(n165) );
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
         n95, n96, n97, n98, n99, n100, n102, n106;
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
  assign trans_crc5[4] = 1'b0;
  assign trans_crc5[3] = 1'b1;
  assign trans_crc5[2] = 1'b0;
  assign trans_crc5[1] = 1'b1;
  assign trans_crc5[0] = 1'b0;
  assign trans_crc16[15] = 1'b0;
  assign trans_crc16[14] = 1'b1;
  assign trans_crc16[13] = 1'b0;
  assign trans_crc16[12] = 1'b0;
  assign trans_crc16[11] = 1'b0;
  assign trans_crc16[10] = 1'b1;
  assign trans_crc16[9] = 1'b1;
  assign trans_crc16[8] = 1'b0;
  assign trans_crc16[7] = 1'b1;
  assign trans_crc16[6] = 1'b0;
  assign trans_crc16[5] = 1'b0;
  assign trans_crc16[4] = 1'b1;
  assign trans_crc16[3] = 1'b0;
  assign trans_crc16[2] = 1'b1;
  assign trans_crc16[1] = 1'b1;
  assign trans_crc16[0] = 1'b0;
  assign idle_transmitting = N225;
  assign sync_transmitting = N226;
  assign pid_transmitting = N227;
  assign eop_transmitting = N228;
  assign sync_load_enable = N229;
  assign pid_load_enable = N230;

  DFFSR \state_reg[0]  ( .D(nextstate[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[0]) );
  DFFSR \state_reg[3]  ( .D(nextstate[3]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[3]) );
  DFFSR \state_reg[1]  ( .D(nextstate[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[1]) );
  DFFSR \state_reg[4]  ( .D(nextstate[4]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[4]) );
  DFFSR \state_reg[2]  ( .D(nextstate[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[2]) );
  LATCH \trans_pid_reg[5]  ( .CLK(N230), .D(N222), .Q(trans_pid[5]) );
  LATCH \trans_pid_reg[4]  ( .CLK(N230), .D(N221), .Q(trans_pid[4]) );
  LATCH \trans_pid_reg[1]  ( .CLK(N230), .D(n102), .Q(trans_pid[1]) );
  LATCH \trans_pid_reg[0]  ( .CLK(N230), .D(n106), .Q(trans_pid[0]) );
  NAND3X1 U41 ( .A(n6), .B(n7), .C(n8), .Y(nextstate[4]) );
  NOR2X1 U42 ( .A(n106), .B(crc16_transmitting), .Y(n8) );
  INVX1 U43 ( .A(n9), .Y(n7) );
  NAND3X1 U44 ( .A(n10), .B(n11), .C(n12), .Y(nextstate[3]) );
  NOR2X1 U45 ( .A(n13), .B(n14), .Y(n12) );
  OAI21X1 U46 ( .A(n15), .B(n16), .C(n17), .Y(n14) );
  NOR2X1 U47 ( .A(n18), .B(n19), .Y(n10) );
  INVX1 U48 ( .A(n6), .Y(n18) );
  AOI21X1 U49 ( .A(n20), .B(n21), .C(n22), .Y(n6) );
  OAI21X1 U50 ( .A(n17), .B(n23), .C(n24), .Y(n22) );
  NAND3X1 U51 ( .A(n25), .B(n26), .C(n27), .Y(nextstate[2]) );
  NOR2X1 U52 ( .A(n19), .B(n28), .Y(n27) );
  OAI21X1 U53 ( .A(n17), .B(n29), .C(n30), .Y(n19) );
  NOR2X1 U54 ( .A(N221), .B(n31), .Y(n25) );
  OR2X1 U55 ( .A(n32), .B(n33), .Y(nextstate[1]) );
  NAND3X1 U56 ( .A(n34), .B(n11), .C(n35), .Y(n33) );
  INVX1 U57 ( .A(n36), .Y(n11) );
  OAI21X1 U58 ( .A(n15), .B(n37), .C(n38), .Y(n36) );
  NOR2X1 U59 ( .A(handshake_ack), .B(N222), .Y(n38) );
  INVX1 U60 ( .A(n28), .Y(n34) );
  NAND3X1 U61 ( .A(n39), .B(n40), .C(n24), .Y(n28) );
  NAND3X1 U62 ( .A(n41), .B(n42), .C(n43), .Y(n32) );
  AOI22X1 U63 ( .A(n20), .B(n44), .C(n45), .D(n46), .Y(n43) );
  NAND3X1 U64 ( .A(n47), .B(n48), .C(n49), .Y(nextstate[0]) );
  NOR2X1 U65 ( .A(n50), .B(n51), .Y(n49) );
  INVX1 U66 ( .A(n52), .Y(n51) );
  AOI21X1 U67 ( .A(data_transmitting), .B(data_bits_transmitted), .C(n53), .Y(
        n52) );
  OAI21X1 U68 ( .A(n41), .B(n54), .C(n55), .Y(n50) );
  AOI22X1 U69 ( .A(sync_bits_transmitted), .B(N226), .C(pid_bits_transmitted), 
        .D(N227), .Y(n55) );
  INVX1 U70 ( .A(crc16_bits_transmitted), .Y(n54) );
  AOI21X1 U71 ( .A(crc5_bits_transmitted), .B(crc5_transmitting), .C(n56), .Y(
        n48) );
  NAND2X1 U72 ( .A(n24), .B(n57), .Y(n56) );
  NAND3X1 U73 ( .A(n58), .B(n59), .C(n60), .Y(n24) );
  NOR2X1 U74 ( .A(n61), .B(n62), .Y(n60) );
  OR2X1 U75 ( .A(n45), .B(N226), .Y(n62) );
  NAND3X1 U76 ( .A(n63), .B(n64), .C(n65), .Y(n61) );
  INVX1 U77 ( .A(N227), .Y(n65) );
  INVX1 U78 ( .A(N229), .Y(n63) );
  NOR2X1 U79 ( .A(n66), .B(n67), .Y(n59) );
  NAND2X1 U80 ( .A(n39), .B(n40), .Y(n67) );
  NOR2X1 U81 ( .A(n13), .B(n9), .Y(n58) );
  NAND3X1 U82 ( .A(n68), .B(n42), .C(n69), .Y(n9) );
  NOR2X1 U83 ( .A(data_load_enable), .B(data_transmitting), .Y(n69) );
  INVX1 U84 ( .A(n31), .Y(n68) );
  NAND3X1 U85 ( .A(n70), .B(n71), .C(n72), .Y(n31) );
  AOI21X1 U86 ( .A(n20), .B(n73), .C(n53), .Y(n72) );
  OAI22X1 U87 ( .A(n15), .B(n16), .C(n23), .D(n74), .Y(n53) );
  NOR2X1 U88 ( .A(n75), .B(n45), .Y(n23) );
  INVX1 U89 ( .A(handshake_ack), .Y(n71) );
  OAI21X1 U90 ( .A(n46), .B(n76), .C(n21), .Y(n70) );
  AOI22X1 U91 ( .A(n77), .B(n46), .C(trans_data_ready), .D(n78), .Y(n47) );
  INVX1 U92 ( .A(n79), .Y(n78) );
  INVX1 U93 ( .A(n39), .Y(crc5_transmitting) );
  NAND2X1 U94 ( .A(n77), .B(n20), .Y(n39) );
  NOR2X1 U95 ( .A(n29), .B(n15), .Y(data_load_enable) );
  NOR2X1 U96 ( .A(n16), .B(n80), .Y(data_transmitting) );
  INVX1 U97 ( .A(n40), .Y(crc5_load_enable) );
  NAND2X1 U98 ( .A(n81), .B(n20), .Y(n40) );
  INVX1 U99 ( .A(n42), .Y(crc16_load_enable) );
  NAND2X1 U100 ( .A(n76), .B(n73), .Y(n42) );
  INVX1 U101 ( .A(n82), .Y(n73) );
  NOR2X1 U102 ( .A(n15), .B(n82), .Y(handshake_ack) );
  INVX1 U103 ( .A(n41), .Y(crc16_transmitting) );
  NAND2X1 U104 ( .A(n45), .B(n76), .Y(n41) );
  INVX1 U105 ( .A(n83), .Y(n45) );
  INVX1 U106 ( .A(n64), .Y(N230) );
  NOR2X1 U107 ( .A(N222), .B(n102), .Y(n64) );
  OAI21X1 U108 ( .A(n17), .B(n29), .C(n84), .Y(N229) );
  AOI22X1 U109 ( .A(n81), .B(n76), .C(n21), .D(n20), .Y(n84) );
  NAND2X1 U110 ( .A(n85), .B(n86), .Y(N228) );
  INVX1 U111 ( .A(n13), .Y(n86) );
  OAI21X1 U112 ( .A(n29), .B(n74), .C(n57), .Y(n13) );
  NAND2X1 U113 ( .A(n87), .B(n46), .Y(n57) );
  INVX1 U114 ( .A(n17), .Y(n46) );
  MUX2X1 U115 ( .B(n21), .A(n75), .S(state[2]), .Y(n85) );
  INVX1 U116 ( .A(n16), .Y(n75) );
  INVX1 U117 ( .A(n88), .Y(n21) );
  NAND3X1 U118 ( .A(state[4]), .B(state[0]), .C(state[1]), .Y(n88) );
  OAI21X1 U119 ( .A(n17), .B(n83), .C(n26), .Y(N227) );
  AOI22X1 U120 ( .A(n89), .B(n77), .C(n20), .D(n87), .Y(n26) );
  INVX1 U121 ( .A(n74), .Y(n20) );
  NAND2X1 U122 ( .A(state[2]), .B(n90), .Y(n74) );
  OAI21X1 U123 ( .A(n80), .B(n37), .C(n91), .Y(N226) );
  INVX1 U124 ( .A(n92), .Y(n91) );
  OAI21X1 U125 ( .A(n16), .B(n17), .C(n30), .Y(n92) );
  NAND2X1 U126 ( .A(n87), .B(n89), .Y(n30) );
  INVX1 U127 ( .A(n15), .Y(n89) );
  NAND2X1 U128 ( .A(n93), .B(state[4]), .Y(n16) );
  INVX1 U129 ( .A(n94), .Y(N225) );
  AOI21X1 U130 ( .A(n44), .B(state[2]), .C(n66), .Y(n94) );
  OAI21X1 U131 ( .A(n35), .B(n17), .C(n79), .Y(n66) );
  NAND2X1 U132 ( .A(n87), .B(n76), .Y(n79) );
  INVX1 U133 ( .A(n80), .Y(n76) );
  AND2X1 U134 ( .A(n93), .B(n95), .Y(n87) );
  NOR2X1 U135 ( .A(state[1]), .B(state[0]), .Y(n93) );
  NOR2X1 U136 ( .A(n77), .B(n81), .Y(n35) );
  INVX1 U137 ( .A(n96), .Y(n81) );
  INVX1 U138 ( .A(n37), .Y(n77) );
  NAND3X1 U139 ( .A(n97), .B(n95), .C(state[1]), .Y(n37) );
  NAND2X1 U140 ( .A(n82), .B(n83), .Y(n44) );
  NAND3X1 U141 ( .A(state[4]), .B(n97), .C(state[1]), .Y(n83) );
  INVX1 U142 ( .A(state[0]), .Y(n97) );
  OR2X1 U143 ( .A(n106), .B(n98), .Y(N222) );
  NOR2X1 U144 ( .A(n17), .B(n82), .Y(n106) );
  NAND3X1 U145 ( .A(state[0]), .B(n99), .C(state[4]), .Y(n82) );
  NAND2X1 U146 ( .A(state[3]), .B(n100), .Y(n17) );
  OR2X1 U147 ( .A(n102), .B(n98), .Y(N221) );
  NOR2X1 U148 ( .A(n96), .B(n15), .Y(n98) );
  NAND2X1 U149 ( .A(state[2]), .B(state[3]), .Y(n15) );
  NAND3X1 U150 ( .A(n99), .B(n95), .C(state[0]), .Y(n96) );
  INVX1 U151 ( .A(state[1]), .Y(n99) );
  NOR2X1 U152 ( .A(n29), .B(n80), .Y(n102) );
  NAND2X1 U153 ( .A(n90), .B(n100), .Y(n80) );
  INVX1 U154 ( .A(state[2]), .Y(n100) );
  INVX1 U155 ( .A(state[3]), .Y(n90) );
  NAND3X1 U156 ( .A(state[0]), .B(n95), .C(state[1]), .Y(n29) );
  INVX1 U157 ( .A(state[4]), .Y(n95) );
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
        trans_pid[1:0]}), .trans_crc5({1'b0, 1'b1, 1'b0, 1'b1, 1'b0}), 
        .trans_crc16({1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 1'b1, 
        1'b0, 1'b0, 1'b1, 1'b0, 1'b1, 1'b1, 1'b0}), .trans_data(trans_data), 
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


module usb_encryptor ( clk, n_rst, encrypt, d_plus_in, d_minus_in, d_plus_out, 
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

