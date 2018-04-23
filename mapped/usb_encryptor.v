/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Thu Apr 19 23:28:26 2018
/////////////////////////////////////////////////////////////


module sync_high_1 ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   N3;
  tri   clk;
  tri   n_rst;

  DFFSR q_reg ( .D(async_in), .CLK(clk), .R(1'b1), .S(n_rst), .Q(N3) );
  DFFSR sync_out_reg ( .D(N3), .CLK(clk), .R(1'b1), .S(n_rst), .Q(sync_out) );
endmodule


module sync_low ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   N3;
  tri   clk;
  tri   n_rst;

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
  tri   clk;
  tri   n_rst;
  tri   sync_shift_enable;
  tri   pid_shift_enable;
  tri   crc5_shift_enable;
  tri   crc16_shift_enable;
  tri   data_shift_enable;
  tri   d_orig;

  DFFSR current_bit_reg ( .D(d_plus), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        current_bit) );
  DFFSR stored_bit_reg ( .D(n12), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        stored_bit) );
  TBUFX1 d_orig_tri ( .A(n8), .EN(n9), .Y(d_orig) );
  NAND2X1 U3 ( .A(d_plus), .B(d_minus), .Y(n9) );
  XNOR2X1 U4 ( .A(stored_bit), .B(current_bit), .Y(n8) );
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
  tri   clk;
  tri   n_rst;

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
  tri   clk;
  tri   n_rst;

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
  tri   clk;
  tri   n_rst;

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
  tri   clk;
  tri   n_rst;

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
  tri   clk;
  tri   n_rst;

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
  tri   clk;
  tri   n_rst;

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
  tri   clk;
  tri   n_rst;
  tri   count_enable;

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
  tri   clk;
  tri   n_rst;
  tri   count_enable;

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
  tri   clk;
  tri   n_rst;
  tri   count_enable;

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
  tri   clk;
  tri   n_rst;
  tri   count_enable;

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
  tri   clk;
  tri   n_rst;
  tri   count_enable;

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
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n146, n147, n148, n149,
         n150;
  wire   [31:0] sync_count_out;
  wire   [31:0] pid_count_out;
  wire   [31:0] crc5_count_out;
  wire   [31:0] crc16_count_out;
  wire   [31:0] data_count_out;
  tri   clk;
  tri   n_rst;
  tri   pid_shift_enable;
  tri   crc5_shift_enable;
  tri   crc16_shift_enable;
  tri   data_shift_enable;
  tri   sync_shift_enable;
  assign sync_bits_received = 1'b0;
  assign pid_bits_received = 1'b0;
  assign crc5_bits_received = 1'b0;
  assign crc16_bits_received = 1'b0;
  assign data_bits_received = 1'b0;

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
        .clear(n146), .count_enable(sync_shift_enable), .rollover_val({1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0}) );
  flex_counter_NUM_CNT_BITS32_13 pid_bits_receive ( .clk(clk), .n_rst(n_rst), 
        .clear(n147), .count_enable(pid_shift_enable), .rollover_val({1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0}) );
  flex_counter_NUM_CNT_BITS32_12 crc5_bits_receive ( .clk(clk), .n_rst(n_rst), 
        .clear(n148), .count_enable(crc5_shift_enable), .rollover_val({1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b1}) );
  flex_counter_NUM_CNT_BITS32_11 crc16_bits_receive ( .clk(clk), .n_rst(n_rst), 
        .clear(n149), .count_enable(crc16_shift_enable), .rollover_val({1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0}) );
  flex_counter_NUM_CNT_BITS32_10 data_bits_receive ( .clk(clk), .n_rst(n_rst), 
        .clear(n150), .count_enable(data_shift_enable), .rollover_val({1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}) );
  INVX1 U9 ( .A(n1), .Y(pid_shift_enable) );
  NAND3X1 U10 ( .A(n2), .B(n3), .C(n4), .Y(n1) );
  NOR2X1 U11 ( .A(n5), .B(n6), .Y(n4) );
  NAND3X1 U12 ( .A(n7), .B(n8), .C(n9), .Y(n6) );
  AND2X1 U13 ( .A(n10), .B(n11), .Y(n9) );
  NOR2X1 U14 ( .A(pid_count_out[30]), .B(pid_count_out[29]), .Y(n11) );
  NOR2X1 U15 ( .A(pid_count_out[28]), .B(pid_count_out[27]), .Y(n10) );
  NOR2X1 U16 ( .A(pid_count_out[26]), .B(pid_count_out[25]), .Y(n8) );
  NOR2X1 U17 ( .A(pid_count_out[24]), .B(pid_count_out[23]), .Y(n7) );
  NAND3X1 U18 ( .A(n12), .B(n13), .C(n14), .Y(n5) );
  AND2X1 U19 ( .A(n15), .B(n16), .Y(n14) );
  NOR2X1 U20 ( .A(pid_count_out[9]), .B(pid_count_out[8]), .Y(n16) );
  NOR2X1 U21 ( .A(pid_count_out[7]), .B(pid_count_out[6]), .Y(n15) );
  NOR2X1 U22 ( .A(pid_count_out[5]), .B(pid_count_out[4]), .Y(n13) );
  NOR2X1 U23 ( .A(pid_count_out[3]), .B(pid_count_out[31]), .Y(n12) );
  NOR2X1 U24 ( .A(n17), .B(n18), .Y(n3) );
  NAND2X1 U25 ( .A(n19), .B(n20), .Y(n18) );
  NOR2X1 U26 ( .A(pid_count_out[19]), .B(pid_count_out[18]), .Y(n20) );
  NOR2X1 U27 ( .A(pid_count_out[17]), .B(pid_count_out[16]), .Y(n19) );
  NAND2X1 U28 ( .A(n21), .B(n22), .Y(n17) );
  NOR2X1 U29 ( .A(pid_count_out[22]), .B(pid_count_out[21]), .Y(n22) );
  NOR2X1 U30 ( .A(pid_count_out[20]), .B(pid_count_out[1]), .Y(n21) );
  NOR2X1 U31 ( .A(n23), .B(n24), .Y(n2) );
  NAND3X1 U32 ( .A(pid_count_out[2]), .B(n25), .C(n26), .Y(n24) );
  NOR2X1 U33 ( .A(pid_count_out[11]), .B(pid_count_out[10]), .Y(n26) );
  INVX1 U34 ( .A(pid_count_out[0]), .Y(n25) );
  NAND2X1 U35 ( .A(n27), .B(n28), .Y(n23) );
  NOR2X1 U36 ( .A(pid_count_out[15]), .B(pid_count_out[14]), .Y(n28) );
  NOR2X1 U37 ( .A(pid_count_out[13]), .B(pid_count_out[12]), .Y(n27) );
  INVX1 U38 ( .A(n29), .Y(crc5_shift_enable) );
  NAND3X1 U39 ( .A(n30), .B(n31), .C(n32), .Y(n29) );
  NOR2X1 U40 ( .A(n33), .B(n34), .Y(n32) );
  NAND3X1 U41 ( .A(n35), .B(n36), .C(n37), .Y(n34) );
  AND2X1 U42 ( .A(n38), .B(n39), .Y(n37) );
  NOR2X1 U43 ( .A(crc5_count_out[30]), .B(crc5_count_out[29]), .Y(n39) );
  NOR2X1 U44 ( .A(crc5_count_out[28]), .B(crc5_count_out[27]), .Y(n38) );
  NOR2X1 U45 ( .A(crc5_count_out[26]), .B(crc5_count_out[25]), .Y(n36) );
  NOR2X1 U46 ( .A(crc5_count_out[24]), .B(crc5_count_out[23]), .Y(n35) );
  NAND3X1 U47 ( .A(n40), .B(n41), .C(n42), .Y(n33) );
  AND2X1 U48 ( .A(n43), .B(n44), .Y(n42) );
  NOR2X1 U49 ( .A(crc5_count_out[9]), .B(crc5_count_out[8]), .Y(n44) );
  NOR2X1 U50 ( .A(crc5_count_out[7]), .B(crc5_count_out[6]), .Y(n43) );
  NOR2X1 U51 ( .A(crc5_count_out[5]), .B(crc5_count_out[4]), .Y(n41) );
  NOR2X1 U52 ( .A(crc5_count_out[3]), .B(crc5_count_out[31]), .Y(n40) );
  NOR2X1 U53 ( .A(n45), .B(n46), .Y(n31) );
  NAND2X1 U54 ( .A(n47), .B(n48), .Y(n46) );
  NOR2X1 U55 ( .A(crc5_count_out[19]), .B(crc5_count_out[18]), .Y(n48) );
  NOR2X1 U56 ( .A(crc5_count_out[17]), .B(crc5_count_out[16]), .Y(n47) );
  NAND2X1 U57 ( .A(n49), .B(n50), .Y(n45) );
  NOR2X1 U58 ( .A(crc5_count_out[22]), .B(crc5_count_out[21]), .Y(n50) );
  NOR2X1 U59 ( .A(crc5_count_out[20]), .B(crc5_count_out[1]), .Y(n49) );
  NOR2X1 U60 ( .A(n51), .B(n52), .Y(n30) );
  NAND3X1 U61 ( .A(crc5_count_out[2]), .B(n53), .C(n54), .Y(n52) );
  NOR2X1 U62 ( .A(crc5_count_out[11]), .B(crc5_count_out[10]), .Y(n54) );
  INVX1 U63 ( .A(crc5_count_out[0]), .Y(n53) );
  NAND2X1 U64 ( .A(n55), .B(n56), .Y(n51) );
  NOR2X1 U65 ( .A(crc5_count_out[15]), .B(crc5_count_out[14]), .Y(n56) );
  NOR2X1 U66 ( .A(crc5_count_out[13]), .B(crc5_count_out[12]), .Y(n55) );
  INVX1 U67 ( .A(n57), .Y(crc16_shift_enable) );
  NAND3X1 U68 ( .A(n58), .B(n59), .C(n60), .Y(n57) );
  NOR2X1 U69 ( .A(n61), .B(n62), .Y(n60) );
  NAND3X1 U70 ( .A(n63), .B(n64), .C(n65), .Y(n62) );
  AND2X1 U71 ( .A(n66), .B(n67), .Y(n65) );
  NOR2X1 U72 ( .A(crc16_count_out[30]), .B(crc16_count_out[29]), .Y(n67) );
  NOR2X1 U73 ( .A(crc16_count_out[28]), .B(crc16_count_out[27]), .Y(n66) );
  NOR2X1 U74 ( .A(crc16_count_out[26]), .B(crc16_count_out[25]), .Y(n64) );
  NOR2X1 U75 ( .A(crc16_count_out[24]), .B(crc16_count_out[23]), .Y(n63) );
  NAND3X1 U76 ( .A(n68), .B(n69), .C(n70), .Y(n61) );
  AND2X1 U77 ( .A(n71), .B(n72), .Y(n70) );
  NOR2X1 U78 ( .A(crc16_count_out[9]), .B(crc16_count_out[8]), .Y(n72) );
  NOR2X1 U79 ( .A(crc16_count_out[7]), .B(crc16_count_out[6]), .Y(n71) );
  NOR2X1 U80 ( .A(crc16_count_out[5]), .B(crc16_count_out[4]), .Y(n69) );
  NOR2X1 U81 ( .A(crc16_count_out[3]), .B(crc16_count_out[31]), .Y(n68) );
  NOR2X1 U82 ( .A(n73), .B(n74), .Y(n59) );
  NAND2X1 U83 ( .A(n75), .B(n76), .Y(n74) );
  NOR2X1 U84 ( .A(crc16_count_out[19]), .B(crc16_count_out[18]), .Y(n76) );
  NOR2X1 U85 ( .A(crc16_count_out[17]), .B(crc16_count_out[16]), .Y(n75) );
  NAND2X1 U86 ( .A(n77), .B(n78), .Y(n73) );
  NOR2X1 U87 ( .A(crc16_count_out[22]), .B(crc16_count_out[21]), .Y(n78) );
  NOR2X1 U88 ( .A(crc16_count_out[20]), .B(crc16_count_out[1]), .Y(n77) );
  NOR2X1 U89 ( .A(n79), .B(n80), .Y(n58) );
  NAND3X1 U90 ( .A(crc16_count_out[2]), .B(n81), .C(n82), .Y(n80) );
  NOR2X1 U91 ( .A(crc16_count_out[11]), .B(crc16_count_out[10]), .Y(n82) );
  INVX1 U92 ( .A(crc16_count_out[0]), .Y(n81) );
  NAND2X1 U93 ( .A(n83), .B(n84), .Y(n79) );
  NOR2X1 U94 ( .A(crc16_count_out[15]), .B(crc16_count_out[14]), .Y(n84) );
  NOR2X1 U95 ( .A(crc16_count_out[13]), .B(crc16_count_out[12]), .Y(n83) );
  INVX1 U96 ( .A(n85), .Y(data_shift_enable) );
  NAND3X1 U97 ( .A(n86), .B(n87), .C(n88), .Y(n85) );
  NOR2X1 U98 ( .A(n89), .B(n90), .Y(n88) );
  NAND3X1 U99 ( .A(n91), .B(n92), .C(n93), .Y(n90) );
  AND2X1 U100 ( .A(n94), .B(n95), .Y(n93) );
  NOR2X1 U101 ( .A(data_count_out[30]), .B(data_count_out[29]), .Y(n95) );
  NOR2X1 U102 ( .A(data_count_out[28]), .B(data_count_out[27]), .Y(n94) );
  NOR2X1 U103 ( .A(data_count_out[26]), .B(data_count_out[25]), .Y(n92) );
  NOR2X1 U104 ( .A(data_count_out[24]), .B(data_count_out[23]), .Y(n91) );
  NAND3X1 U105 ( .A(n96), .B(n97), .C(n98), .Y(n89) );
  AND2X1 U106 ( .A(n99), .B(n100), .Y(n98) );
  NOR2X1 U107 ( .A(data_count_out[9]), .B(data_count_out[8]), .Y(n100) );
  NOR2X1 U108 ( .A(data_count_out[7]), .B(data_count_out[6]), .Y(n99) );
  NOR2X1 U109 ( .A(data_count_out[5]), .B(data_count_out[4]), .Y(n97) );
  NOR2X1 U110 ( .A(data_count_out[3]), .B(data_count_out[31]), .Y(n96) );
  NOR2X1 U111 ( .A(n101), .B(n102), .Y(n87) );
  NAND2X1 U112 ( .A(n103), .B(n104), .Y(n102) );
  NOR2X1 U113 ( .A(data_count_out[19]), .B(data_count_out[18]), .Y(n104) );
  NOR2X1 U114 ( .A(data_count_out[17]), .B(data_count_out[16]), .Y(n103) );
  NAND2X1 U115 ( .A(n105), .B(n106), .Y(n101) );
  NOR2X1 U116 ( .A(data_count_out[22]), .B(data_count_out[21]), .Y(n106) );
  NOR2X1 U117 ( .A(data_count_out[20]), .B(data_count_out[1]), .Y(n105) );
  NOR2X1 U118 ( .A(n107), .B(n108), .Y(n86) );
  NAND3X1 U119 ( .A(data_count_out[2]), .B(n109), .C(n110), .Y(n108) );
  NOR2X1 U120 ( .A(data_count_out[11]), .B(data_count_out[10]), .Y(n110) );
  INVX1 U121 ( .A(data_count_out[0]), .Y(n109) );
  NAND2X1 U122 ( .A(n111), .B(n112), .Y(n107) );
  NOR2X1 U123 ( .A(data_count_out[15]), .B(data_count_out[14]), .Y(n112) );
  NOR2X1 U124 ( .A(data_count_out[13]), .B(data_count_out[12]), .Y(n111) );
  INVX1 U125 ( .A(n113), .Y(sync_shift_enable) );
  NAND3X1 U126 ( .A(n114), .B(n115), .C(n116), .Y(n113) );
  NOR2X1 U127 ( .A(n117), .B(n118), .Y(n116) );
  NAND3X1 U128 ( .A(n119), .B(n120), .C(n121), .Y(n118) );
  AND2X1 U129 ( .A(n122), .B(n123), .Y(n121) );
  NOR2X1 U130 ( .A(sync_count_out[30]), .B(sync_count_out[29]), .Y(n123) );
  NOR2X1 U131 ( .A(sync_count_out[28]), .B(sync_count_out[27]), .Y(n122) );
  NOR2X1 U132 ( .A(sync_count_out[26]), .B(sync_count_out[25]), .Y(n120) );
  NOR2X1 U133 ( .A(sync_count_out[24]), .B(sync_count_out[23]), .Y(n119) );
  NAND3X1 U134 ( .A(n124), .B(n125), .C(n126), .Y(n117) );
  AND2X1 U135 ( .A(n127), .B(n128), .Y(n126) );
  NOR2X1 U136 ( .A(sync_count_out[9]), .B(sync_count_out[8]), .Y(n128) );
  NOR2X1 U137 ( .A(sync_count_out[7]), .B(sync_count_out[6]), .Y(n127) );
  NOR2X1 U138 ( .A(sync_count_out[5]), .B(sync_count_out[4]), .Y(n125) );
  NOR2X1 U139 ( .A(sync_count_out[3]), .B(sync_count_out[31]), .Y(n124) );
  NOR2X1 U140 ( .A(n129), .B(n130), .Y(n115) );
  NAND2X1 U141 ( .A(n131), .B(n132), .Y(n130) );
  NOR2X1 U142 ( .A(sync_count_out[19]), .B(sync_count_out[18]), .Y(n132) );
  NOR2X1 U143 ( .A(sync_count_out[17]), .B(sync_count_out[16]), .Y(n131) );
  NAND2X1 U144 ( .A(n133), .B(n134), .Y(n129) );
  NOR2X1 U145 ( .A(sync_count_out[22]), .B(sync_count_out[21]), .Y(n134) );
  NOR2X1 U146 ( .A(sync_count_out[20]), .B(sync_count_out[1]), .Y(n133) );
  NOR2X1 U147 ( .A(n135), .B(n136), .Y(n114) );
  NAND3X1 U148 ( .A(sync_count_out[2]), .B(n137), .C(n138), .Y(n136) );
  NOR2X1 U149 ( .A(sync_count_out[11]), .B(sync_count_out[10]), .Y(n138) );
  INVX1 U150 ( .A(sync_count_out[0]), .Y(n137) );
  NAND2X1 U151 ( .A(n139), .B(n140), .Y(n135) );
  NOR2X1 U152 ( .A(sync_count_out[15]), .B(sync_count_out[14]), .Y(n140) );
  NOR2X1 U153 ( .A(sync_count_out[13]), .B(sync_count_out[12]), .Y(n139) );
  INVX1 U154 ( .A(sync_rcving), .Y(n146) );
  INVX1 U155 ( .A(pid_rcving), .Y(n147) );
  INVX1 U156 ( .A(crc5_rcving), .Y(n148) );
  INVX1 U157 ( .A(crc16_rcving), .Y(n149) );
  INVX1 U158 ( .A(data_rcving), .Y(n150) );
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

  tri   clk;
  tri   n_rst;
  tri   sync_shift_enable;
  tri   pid_shift_enable;
  tri   crc5_shift_enable;
  tri   crc16_shift_enable;
  tri   data_shift_enable;
  tri   d_orig;
  tri   [7:0] rcv_sync;
  tri   [7:0] rcv_pid;
  tri   [4:0] rcv_crc5;
  tri   [15:0] rcv_crc16;
  tri   [63:0] rcv_data;

  flex_stp_sr sync_shift_reg ( .clk(clk), .n_rst(n_rst), .shift_enable(
        sync_shift_enable), .serial_in(d_orig), .parallel_out(rcv_sync) );
  flex_stp_sr pid_shift_reg ( .clk(clk), .n_rst(n_rst), .shift_enable(
        pid_shift_enable), .serial_in(d_orig), .parallel_out(rcv_pid) );
  flex_stp_sr crc5_shift_reg ( .clk(clk), .n_rst(n_rst), .shift_enable(
        crc5_shift_enable), .serial_in(d_orig), .parallel_out(rcv_crc5) );
  flex_stp_sr crc16_shift_reg ( .clk(clk), .n_rst(n_rst), .shift_enable(
        crc16_shift_enable), .serial_in(d_orig), .parallel_out(rcv_crc16) );
  flex_stp_sr data_shift_reg ( .clk(clk), .n_rst(n_rst), .shift_enable(
        data_shift_enable), .serial_in(d_orig), .parallel_out(rcv_data) );
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
  wire   N194, N195, N196, N197, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
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
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157, n158, n159;
  wire   [4:0] state;
  wire   [4:0] nextstate;
  tri   clk;
  tri   n_rst;
  tri   [7:0] rcv_sync;
  tri   [7:0] rcv_pid;
  assign sync_rcving = N194;
  assign pid_rcving = N195;
  assign crc5_rcving = N196;
  assign crc16_rcving = N197;

  DFFSR \state_reg[0]  ( .D(nextstate[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[0]) );
  DFFSR \state_reg[1]  ( .D(nextstate[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[1]) );
  DFFSR \state_reg[3]  ( .D(nextstate[3]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[3]) );
  DFFSR \state_reg[2]  ( .D(nextstate[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[2]) );
  DFFSR \state_reg[4]  ( .D(nextstate[4]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[4]) );
  NAND3X1 U8 ( .A(n6), .B(n7), .C(n8), .Y(nextstate[4]) );
  NOR2X1 U9 ( .A(n9), .B(n10), .Y(n8) );
  OAI21X1 U10 ( .A(n11), .B(n12), .C(n13), .Y(n10) );
  NOR2X1 U11 ( .A(n14), .B(n15), .Y(n7) );
  INVX1 U12 ( .A(n16), .Y(n6) );
  OAI21X1 U13 ( .A(n17), .B(n18), .C(n19), .Y(n16) );
  NAND3X1 U14 ( .A(n20), .B(n21), .C(n22), .Y(nextstate[3]) );
  NOR2X1 U15 ( .A(n9), .B(n23), .Y(n22) );
  OAI21X1 U16 ( .A(n24), .B(n25), .C(n26), .Y(n23) );
  NAND3X1 U17 ( .A(n27), .B(n28), .C(n29), .Y(n9) );
  INVX1 U18 ( .A(n30), .Y(n29) );
  OAI21X1 U19 ( .A(n31), .B(n11), .C(n32), .Y(n30) );
  AND2X1 U20 ( .A(n33), .B(n19), .Y(n21) );
  INVX1 U21 ( .A(n34), .Y(n20) );
  OAI22X1 U22 ( .A(n35), .B(n36), .C(n37), .D(n11), .Y(n34) );
  NAND3X1 U23 ( .A(n38), .B(n39), .C(n40), .Y(nextstate[2]) );
  NOR2X1 U24 ( .A(n41), .B(n42), .Y(n40) );
  NAND3X1 U25 ( .A(n43), .B(n44), .C(n45), .Y(n42) );
  OAI21X1 U26 ( .A(n46), .B(n47), .C(n11), .Y(n45) );
  INVX1 U27 ( .A(n12), .Y(n46) );
  NAND3X1 U28 ( .A(n48), .B(n49), .C(n50), .Y(n41) );
  AOI21X1 U29 ( .A(n18), .B(n51), .C(n52), .Y(n39) );
  OAI22X1 U30 ( .A(n53), .B(n19), .C(n54), .D(n55), .Y(n52) );
  INVX1 U31 ( .A(n17), .Y(n51) );
  NOR2X1 U32 ( .A(n56), .B(n57), .Y(n38) );
  OAI22X1 U33 ( .A(eop), .B(n36), .C(n58), .D(n59), .Y(n57) );
  MUX2X1 U34 ( .B(n24), .A(n60), .S(pid_bits_received), .Y(n56) );
  NAND3X1 U35 ( .A(n61), .B(n62), .C(n63), .Y(nextstate[1]) );
  NOR2X1 U36 ( .A(n64), .B(n65), .Y(n63) );
  OAI21X1 U37 ( .A(n59), .B(n66), .C(n67), .Y(n65) );
  INVX1 U38 ( .A(n68), .Y(n67) );
  OAI22X1 U39 ( .A(n19), .B(n69), .C(n28), .D(n35), .Y(n68) );
  INVX1 U40 ( .A(eop), .Y(n35) );
  OAI21X1 U41 ( .A(n70), .B(n71), .C(n72), .Y(n64) );
  AND2X1 U42 ( .A(n73), .B(n74), .Y(n72) );
  OAI21X1 U43 ( .A(n75), .B(n76), .C(n77), .Y(n73) );
  NAND2X1 U44 ( .A(rcv_pid[0]), .B(n78), .Y(n76) );
  INVX1 U45 ( .A(n79), .Y(n78) );
  NAND3X1 U46 ( .A(n80), .B(n81), .C(rcv_pid[2]), .Y(n75) );
  INVX1 U47 ( .A(rcv_pid[6]), .Y(n81) );
  INVX1 U48 ( .A(rcv_pid[4]), .Y(n80) );
  INVX1 U49 ( .A(crc5_bits_received), .Y(n71) );
  NOR2X1 U50 ( .A(n82), .B(n83), .Y(n62) );
  INVX1 U51 ( .A(n84), .Y(n83) );
  AOI22X1 U52 ( .A(state[0]), .B(N197), .C(n85), .D(sync_bits_received), .Y(
        n84) );
  AND2X1 U53 ( .A(n32), .B(n86), .Y(n61) );
  AOI22X1 U54 ( .A(n59), .B(rcv_data_ready), .C(n55), .D(n87), .Y(n32) );
  NAND3X1 U55 ( .A(rcv_pid[7]), .B(rcv_pid[1]), .C(n88), .Y(n55) );
  NOR2X1 U56 ( .A(n89), .B(n90), .Y(n88) );
  OR2X1 U57 ( .A(rcv_pid[3]), .B(rcv_pid[5]), .Y(n90) );
  INVX1 U58 ( .A(d_edge), .Y(n59) );
  NAND3X1 U59 ( .A(n91), .B(n92), .C(n93), .Y(nextstate[0]) );
  NOR2X1 U60 ( .A(n94), .B(n95), .Y(n93) );
  OAI21X1 U61 ( .A(n18), .B(n17), .C(n96), .Y(n95) );
  AOI22X1 U62 ( .A(n97), .B(pid_bits_received), .C(data_bits_received), .D(n98), .Y(n96) );
  INVX1 U63 ( .A(n43), .Y(n98) );
  NOR2X1 U64 ( .A(n79), .B(n89), .Y(n18) );
  NAND3X1 U65 ( .A(rcv_pid[4]), .B(rcv_pid[2]), .C(n99), .Y(n89) );
  NOR2X1 U66 ( .A(rcv_pid[6]), .B(rcv_pid[0]), .Y(n99) );
  NAND3X1 U67 ( .A(rcv_pid[5]), .B(rcv_pid[3]), .C(n100), .Y(n79) );
  NOR2X1 U68 ( .A(rcv_pid[7]), .B(rcv_pid[1]), .Y(n100) );
  OAI21X1 U69 ( .A(crc5_bits_received), .B(n70), .C(n101), .Y(n94) );
  NOR2X1 U70 ( .A(n87), .B(n77), .Y(n101) );
  INVX1 U71 ( .A(n27), .Y(n77) );
  NOR2X1 U72 ( .A(n102), .B(n103), .Y(n92) );
  NAND2X1 U73 ( .A(n104), .B(n86), .Y(n103) );
  NOR2X1 U74 ( .A(n105), .B(n106), .Y(n86) );
  OAI21X1 U75 ( .A(n11), .B(n12), .C(n107), .Y(n106) );
  INVX1 U76 ( .A(n108), .Y(n107) );
  OAI22X1 U77 ( .A(n58), .B(d_edge), .C(n36), .D(eop), .Y(n108) );
  NOR2X1 U78 ( .A(n109), .B(n110), .Y(n11) );
  NAND3X1 U79 ( .A(rcv_sync[7]), .B(n111), .C(n112), .Y(n110) );
  NOR2X1 U80 ( .A(rcv_sync[2]), .B(rcv_sync[1]), .Y(n112) );
  INVX1 U81 ( .A(rcv_sync[0]), .Y(n111) );
  NAND2X1 U82 ( .A(n113), .B(n114), .Y(n109) );
  NOR2X1 U83 ( .A(rcv_sync[6]), .B(rcv_sync[5]), .Y(n114) );
  NOR2X1 U84 ( .A(rcv_sync[4]), .B(rcv_sync[3]), .Y(n113) );
  NAND3X1 U85 ( .A(n31), .B(n115), .C(n116), .Y(n105) );
  AOI21X1 U86 ( .A(n117), .B(n25), .C(n47), .Y(n116) );
  INVX1 U87 ( .A(n37), .Y(n47) );
  INVX1 U88 ( .A(pid_bits_received), .Y(n25) );
  MUX2X1 U89 ( .B(n85), .A(n118), .S(sync_bits_received), .Y(n104) );
  INVX1 U90 ( .A(n119), .Y(n118) );
  MUX2X1 U91 ( .B(n120), .A(n19), .S(state[0]), .Y(n102) );
  NAND3X1 U92 ( .A(n121), .B(n122), .C(n123), .Y(n19) );
  NOR2X1 U93 ( .A(n124), .B(n125), .Y(n123) );
  NAND3X1 U94 ( .A(n126), .B(n31), .C(n36), .Y(n125) );
  NAND3X1 U95 ( .A(n127), .B(n128), .C(n129), .Y(n36) );
  NAND2X1 U96 ( .A(n130), .B(n131), .Y(n31) );
  NAND3X1 U97 ( .A(n54), .B(n49), .C(n60), .Y(n124) );
  INVX1 U98 ( .A(N196), .Y(n49) );
  INVX1 U99 ( .A(n87), .Y(n54) );
  NOR2X1 U100 ( .A(n132), .B(n133), .Y(n87) );
  NOR2X1 U101 ( .A(n134), .B(n135), .Y(n122) );
  NAND2X1 U102 ( .A(n26), .B(n28), .Y(n135) );
  INVX1 U103 ( .A(n136), .Y(n26) );
  NAND3X1 U104 ( .A(n66), .B(n12), .C(n137), .Y(n136) );
  NOR2X1 U105 ( .A(n97), .B(n82), .Y(n137) );
  NAND3X1 U106 ( .A(n17), .B(n119), .C(n43), .Y(n82) );
  NAND2X1 U107 ( .A(data_rcving), .B(n138), .Y(n43) );
  NAND3X1 U108 ( .A(state[3]), .B(n138), .C(n130), .Y(n119) );
  NAND3X1 U109 ( .A(state[3]), .B(state[0]), .C(n139), .Y(n17) );
  INVX1 U110 ( .A(n44), .Y(n97) );
  NAND3X1 U111 ( .A(state[3]), .B(n138), .C(n139), .Y(n44) );
  NAND3X1 U112 ( .A(state[3]), .B(state[0]), .C(n130), .Y(n12) );
  INVX1 U113 ( .A(n13), .Y(n134) );
  NOR2X1 U114 ( .A(n140), .B(n141), .Y(n13) );
  OAI21X1 U115 ( .A(n138), .B(n142), .C(n143), .Y(n141) );
  AND2X1 U116 ( .A(n58), .B(n74), .Y(n143) );
  NAND2X1 U117 ( .A(n144), .B(n127), .Y(n58) );
  NAND3X1 U118 ( .A(n37), .B(n145), .C(n24), .Y(n140) );
  NOR2X1 U119 ( .A(n146), .B(n85), .Y(n121) );
  INVX1 U120 ( .A(n147), .Y(n146) );
  NAND2X1 U121 ( .A(crc16_bits_received), .B(N197), .Y(n120) );
  NOR2X1 U122 ( .A(n148), .B(n149), .Y(n91) );
  MUX2X1 U123 ( .B(n66), .A(n147), .S(d_edge), .Y(n149) );
  AOI21X1 U124 ( .A(n138), .B(n150), .C(n151), .Y(n147) );
  OAI21X1 U125 ( .A(n152), .B(n133), .C(n50), .Y(n151) );
  INVX1 U126 ( .A(n15), .Y(n50) );
  NOR2X1 U127 ( .A(n133), .B(n153), .Y(n15) );
  INVX1 U128 ( .A(n131), .Y(n133) );
  NAND3X1 U129 ( .A(state[0]), .B(n128), .C(n150), .Y(n66) );
  MUX2X1 U130 ( .B(n28), .A(n74), .S(eop), .Y(n148) );
  NAND2X1 U131 ( .A(n144), .B(n131), .Y(n74) );
  NAND3X1 U132 ( .A(state[4]), .B(state[0]), .C(n150), .Y(n28) );
  INVX1 U133 ( .A(n126), .Y(rcv_data_ready) );
  NAND3X1 U134 ( .A(n144), .B(n138), .C(state[3]), .Y(n126) );
  INVX1 U135 ( .A(n154), .Y(n144) );
  NAND3X1 U136 ( .A(state[4]), .B(n53), .C(state[1]), .Y(n154) );
  INVX1 U137 ( .A(n142), .Y(data_rcving) );
  NAND3X1 U138 ( .A(n129), .B(n128), .C(state[3]), .Y(n142) );
  INVX1 U139 ( .A(n145), .Y(N197) );
  NAND3X1 U140 ( .A(state[4]), .B(n69), .C(n155), .Y(n145) );
  NOR2X1 U141 ( .A(state[3]), .B(state[2]), .Y(n155) );
  NAND2X1 U142 ( .A(n115), .B(n70), .Y(N196) );
  NAND2X1 U143 ( .A(n139), .B(n127), .Y(n70) );
  INVX1 U144 ( .A(n132), .Y(n139) );
  NAND3X1 U145 ( .A(n131), .B(n128), .C(n129), .Y(n115) );
  OR2X1 U146 ( .A(n117), .B(n156), .Y(N195) );
  OAI21X1 U147 ( .A(n127), .B(n132), .C(n27), .Y(n156) );
  NAND3X1 U148 ( .A(state[4]), .B(n138), .C(n150), .Y(n27) );
  INVX1 U149 ( .A(n33), .Y(n150) );
  NAND3X1 U150 ( .A(n69), .B(n53), .C(state[3]), .Y(n33) );
  NAND3X1 U151 ( .A(n69), .B(n128), .C(state[2]), .Y(n132) );
  NAND2X1 U152 ( .A(n24), .B(n60), .Y(n117) );
  NAND2X1 U153 ( .A(n130), .B(n127), .Y(n60) );
  INVX1 U154 ( .A(n157), .Y(n130) );
  NAND3X1 U155 ( .A(n127), .B(state[4]), .C(n129), .Y(n24) );
  OR2X1 U156 ( .A(n85), .B(n158), .Y(N194) );
  OAI21X1 U157 ( .A(n127), .B(n157), .C(n37), .Y(n158) );
  NAND3X1 U158 ( .A(n131), .B(state[4]), .C(n129), .Y(n37) );
  NOR2X1 U159 ( .A(n69), .B(n53), .Y(n129) );
  NOR2X1 U160 ( .A(state[0]), .B(state[3]), .Y(n131) );
  NAND3X1 U161 ( .A(n53), .B(n128), .C(state[1]), .Y(n157) );
  OAI21X1 U162 ( .A(n159), .B(n152), .C(n48), .Y(n85) );
  INVX1 U163 ( .A(n14), .Y(n48) );
  NOR2X1 U164 ( .A(n159), .B(n153), .Y(n14) );
  NAND3X1 U165 ( .A(state[2]), .B(n69), .C(state[4]), .Y(n153) );
  NAND3X1 U166 ( .A(n53), .B(n128), .C(n69), .Y(n152) );
  INVX1 U167 ( .A(state[1]), .Y(n69) );
  INVX1 U168 ( .A(state[4]), .Y(n128) );
  INVX1 U169 ( .A(state[2]), .Y(n53) );
  INVX1 U170 ( .A(n127), .Y(n159) );
  NOR2X1 U171 ( .A(n138), .B(state[3]), .Y(n127) );
  INVX1 U172 ( .A(state[0]), .Y(n138) );
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
  wire   d_plus_sync, d_minus_sync, eop, d_edge, sync_rcving, pid_rcving,
         crc5_rcving, crc16_rcving, data_rcving;
  tri   clk;
  tri   n_rst;
  tri   [7:0] rcv_sync;
  tri   [7:0] rcv_pid;
  tri   [4:0] rcv_crc5;
  tri   [15:0] rcv_crc16;
  tri   [63:0] rcv_data;
  tri   sync_shift_enable;
  tri   pid_shift_enable;
  tri   crc5_shift_enable;
  tri   crc16_shift_enable;
  tri   data_shift_enable;
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
        data_shift_enable) );
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
        .sync_bits_received(1'b0), .pid_bits_received(1'b0), 
        .crc5_bits_received(1'b0), .crc16_bits_received(1'b0), 
        .data_bits_received(1'b0), .sync_rcving(sync_rcving), .pid_rcving(
        pid_rcving), .crc5_rcving(crc5_rcving), .crc16_rcving(crc16_rcving), 
        .data_rcving(data_rcving), .rcv_data_ready(rcv_data_ready) );
endmodule


module permutation ( rcv_data, des_curr, tx_data, des_in );
  input [63:0] rcv_data;
  input [63:0] des_curr;
  output [63:0] tx_data;
  output [63:0] des_in;

  tri   [63:0] rcv_data;
  assign tx_data[63] = des_curr[39];
  assign tx_data[62] = des_curr[7];
  assign tx_data[61] = des_curr[47];
  assign tx_data[60] = des_curr[15];
  assign tx_data[59] = des_curr[55];
  assign tx_data[58] = des_curr[23];
  assign tx_data[57] = des_curr[63];
  assign tx_data[56] = des_curr[31];
  assign tx_data[55] = des_curr[38];
  assign tx_data[54] = des_curr[6];
  assign tx_data[53] = des_curr[46];
  assign tx_data[52] = des_curr[14];
  assign tx_data[51] = des_curr[54];
  assign tx_data[50] = des_curr[22];
  assign tx_data[49] = des_curr[62];
  assign tx_data[48] = des_curr[30];
  assign tx_data[47] = des_curr[37];
  assign tx_data[46] = des_curr[5];
  assign tx_data[45] = des_curr[45];
  assign tx_data[44] = des_curr[13];
  assign tx_data[43] = des_curr[53];
  assign tx_data[42] = des_curr[21];
  assign tx_data[41] = des_curr[61];
  assign tx_data[40] = des_curr[29];
  assign tx_data[39] = des_curr[36];
  assign tx_data[38] = des_curr[4];
  assign tx_data[37] = des_curr[44];
  assign tx_data[36] = des_curr[12];
  assign tx_data[35] = des_curr[52];
  assign tx_data[34] = des_curr[20];
  assign tx_data[33] = des_curr[60];
  assign tx_data[32] = des_curr[28];
  assign tx_data[31] = des_curr[35];
  assign tx_data[30] = des_curr[3];
  assign tx_data[29] = des_curr[43];
  assign tx_data[28] = des_curr[11];
  assign tx_data[27] = des_curr[51];
  assign tx_data[26] = des_curr[19];
  assign tx_data[25] = des_curr[59];
  assign tx_data[24] = des_curr[27];
  assign tx_data[23] = des_curr[34];
  assign tx_data[22] = des_curr[2];
  assign tx_data[21] = des_curr[42];
  assign tx_data[20] = des_curr[10];
  assign tx_data[19] = des_curr[50];
  assign tx_data[18] = des_curr[18];
  assign tx_data[17] = des_curr[58];
  assign tx_data[16] = des_curr[26];
  assign tx_data[15] = des_curr[33];
  assign tx_data[14] = des_curr[1];
  assign tx_data[13] = des_curr[41];
  assign tx_data[12] = des_curr[9];
  assign tx_data[11] = des_curr[49];
  assign tx_data[10] = des_curr[17];
  assign tx_data[9] = des_curr[57];
  assign tx_data[8] = des_curr[25];
  assign tx_data[7] = des_curr[32];
  assign tx_data[6] = des_curr[0];
  assign tx_data[5] = des_curr[40];
  assign tx_data[4] = des_curr[8];
  assign tx_data[3] = des_curr[48];
  assign tx_data[2] = des_curr[16];
  assign tx_data[1] = des_curr[56];
  assign tx_data[0] = des_curr[24];
  assign des_in[63] = rcv_data[57];
  assign des_in[62] = rcv_data[49];
  assign des_in[61] = rcv_data[41];
  assign des_in[60] = rcv_data[33];
  assign des_in[59] = rcv_data[25];
  assign des_in[58] = rcv_data[17];
  assign des_in[57] = rcv_data[9];
  assign des_in[56] = rcv_data[1];
  assign des_in[55] = rcv_data[59];
  assign des_in[54] = rcv_data[51];
  assign des_in[53] = rcv_data[43];
  assign des_in[52] = rcv_data[35];
  assign des_in[51] = rcv_data[27];
  assign des_in[50] = rcv_data[19];
  assign des_in[49] = rcv_data[11];
  assign des_in[48] = rcv_data[3];
  assign des_in[47] = rcv_data[61];
  assign des_in[46] = rcv_data[53];
  assign des_in[45] = rcv_data[45];
  assign des_in[44] = rcv_data[37];
  assign des_in[43] = rcv_data[29];
  assign des_in[42] = rcv_data[21];
  assign des_in[41] = rcv_data[13];
  assign des_in[40] = rcv_data[5];
  assign des_in[39] = rcv_data[63];
  assign des_in[38] = rcv_data[55];
  assign des_in[37] = rcv_data[47];
  assign des_in[36] = rcv_data[39];
  assign des_in[35] = rcv_data[31];
  assign des_in[34] = rcv_data[23];
  assign des_in[33] = rcv_data[15];
  assign des_in[32] = rcv_data[7];
  assign des_in[31] = rcv_data[56];
  assign des_in[30] = rcv_data[48];
  assign des_in[29] = rcv_data[40];
  assign des_in[28] = rcv_data[32];
  assign des_in[27] = rcv_data[24];
  assign des_in[26] = rcv_data[16];
  assign des_in[25] = rcv_data[8];
  assign des_in[24] = rcv_data[0];
  assign des_in[23] = rcv_data[58];
  assign des_in[22] = rcv_data[50];
  assign des_in[21] = rcv_data[42];
  assign des_in[20] = rcv_data[34];
  assign des_in[19] = rcv_data[26];
  assign des_in[18] = rcv_data[18];
  assign des_in[17] = rcv_data[10];
  assign des_in[16] = rcv_data[2];
  assign des_in[15] = rcv_data[60];
  assign des_in[14] = rcv_data[52];
  assign des_in[13] = rcv_data[44];
  assign des_in[12] = rcv_data[36];
  assign des_in[11] = rcv_data[28];
  assign des_in[10] = rcv_data[20];
  assign des_in[9] = rcv_data[12];
  assign des_in[8] = rcv_data[4];
  assign des_in[7] = rcv_data[62];
  assign des_in[6] = rcv_data[54];
  assign des_in[5] = rcv_data[46];
  assign des_in[4] = rcv_data[38];
  assign des_in[3] = rcv_data[30];
  assign des_in[2] = rcv_data[22];
  assign des_in[1] = rcv_data[14];
  assign des_in[0] = rcv_data[6];

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
         n162, n163, n164, n165, n166;
  wire   [32:31] left;
  wire   [32:0] nxtLeft;
  wire   [32:0] nxtRight;
  tri   clk;
  tri   n_rst;
  tri   [63:0] des_in;

  DFFSR \right_reg[32]  ( .D(n166), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[32]) );
  DFFSR \left_reg[32]  ( .D(nxtLeft[32]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        left[32]) );
  DFFSR \right_reg[20]  ( .D(nxtRight[20]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(des_curr[20]) );
  DFFSR \right_reg[28]  ( .D(nxtRight[28]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(des_curr[28]) );
  DFFSR \right_reg[27]  ( .D(nxtRight[27]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(des_curr[27]) );
  DFFSR \right_reg[25]  ( .D(nxtRight[25]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(des_curr[25]) );
  DFFSR \left_reg[25]  ( .D(nxtLeft[25]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[58]) );
  DFFSR \left_reg[27]  ( .D(nxtLeft[27]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[60]) );
  DFFSR \left_reg[28]  ( .D(nxtLeft[28]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[61]) );
  DFFSR \left_reg[20]  ( .D(nxtLeft[20]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[53]) );
  DFFSR \right_reg[8]  ( .D(nxtRight[8]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[8]) );
  DFFSR \left_reg[8]  ( .D(nxtLeft[8]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[41]) );
  DFFSR \right_reg[4]  ( .D(nxtRight[4]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[4]) );
  DFFSR \right_reg[19]  ( .D(nxtRight[19]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(des_curr[19]) );
  DFFSR \right_reg[29]  ( .D(nxtRight[29]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(des_curr[29]) );
  DFFSR \right_reg[5]  ( .D(nxtRight[5]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[5]) );
  DFFSR \left_reg[5]  ( .D(nxtLeft[5]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[38]) );
  DFFSR \left_reg[29]  ( .D(nxtLeft[29]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[62]) );
  DFFSR \left_reg[19]  ( .D(nxtLeft[19]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[52]) );
  DFFSR \left_reg[4]  ( .D(nxtLeft[4]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[37]) );
  DFFSR \right_reg[0]  ( .D(nxtRight[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[0]) );
  DFFSR \right_reg[23]  ( .D(nxtRight[23]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(des_curr[23]) );
  DFFSR \right_reg[13]  ( .D(nxtRight[13]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(des_curr[13]) );
  DFFSR \right_reg[12]  ( .D(nxtRight[12]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(des_curr[12]) );
  DFFSR \right_reg[6]  ( .D(nxtRight[6]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[6]) );
  DFFSR \right_reg[30]  ( .D(nxtRight[30]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(des_curr[30]) );
  DFFSR \right_reg[17]  ( .D(nxtRight[17]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(des_curr[17]) );
  DFFSR \right_reg[18]  ( .D(nxtRight[18]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(des_curr[18]) );
  DFFSR \right_reg[7]  ( .D(nxtRight[7]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[7]) );
  DFFSR \right_reg[14]  ( .D(nxtRight[14]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(des_curr[14]) );
  DFFSR \right_reg[22]  ( .D(nxtRight[22]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(des_curr[22]) );
  DFFSR \right_reg[21]  ( .D(nxtRight[21]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(des_curr[21]) );
  DFFSR \right_reg[3]  ( .D(nxtRight[3]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[3]) );
  DFFSR \right_reg[1]  ( .D(nxtRight[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[1]) );
  DFFSR \right_reg[15]  ( .D(nxtRight[15]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(des_curr[15]) );
  DFFSR \right_reg[31]  ( .D(nxtRight[31]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(des_curr[31]) );
  DFFSR \right_reg[11]  ( .D(nxtRight[11]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(des_curr[11]) );
  DFFSR \right_reg[26]  ( .D(nxtRight[26]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(des_curr[26]) );
  DFFSR \right_reg[10]  ( .D(nxtRight[10]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(des_curr[10]) );
  DFFSR \right_reg[2]  ( .D(nxtRight[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[2]) );
  DFFSR \right_reg[9]  ( .D(nxtRight[9]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[9]) );
  DFFSR \right_reg[16]  ( .D(nxtRight[16]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(des_curr[16]) );
  DFFSR \right_reg[24]  ( .D(nxtRight[24]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(des_curr[24]) );
  DFFSR \left_reg[24]  ( .D(nxtLeft[24]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[57]) );
  DFFSR \left_reg[16]  ( .D(nxtLeft[16]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[49]) );
  DFFSR \left_reg[9]  ( .D(nxtLeft[9]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[42]) );
  DFFSR \left_reg[2]  ( .D(nxtLeft[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[35]) );
  DFFSR \left_reg[10]  ( .D(nxtLeft[10]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[43]) );
  DFFSR \left_reg[26]  ( .D(nxtLeft[26]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[59]) );
  DFFSR \left_reg[11]  ( .D(nxtLeft[11]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[44]) );
  DFFSR \left_reg[31]  ( .D(nxtLeft[31]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        left[31]) );
  DFFSR \left_reg[15]  ( .D(nxtLeft[15]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[48]) );
  DFFSR \left_reg[1]  ( .D(nxtLeft[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[34]) );
  DFFSR \left_reg[3]  ( .D(nxtLeft[3]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[36]) );
  DFFSR \left_reg[21]  ( .D(nxtLeft[21]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[54]) );
  DFFSR \left_reg[22]  ( .D(nxtLeft[22]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[55]) );
  DFFSR \left_reg[14]  ( .D(nxtLeft[14]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[47]) );
  DFFSR \left_reg[7]  ( .D(nxtLeft[7]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[40]) );
  DFFSR \left_reg[18]  ( .D(nxtLeft[18]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[51]) );
  DFFSR \left_reg[17]  ( .D(nxtLeft[17]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[50]) );
  DFFSR \left_reg[30]  ( .D(nxtLeft[30]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[63]) );
  DFFSR \left_reg[6]  ( .D(nxtLeft[6]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[39]) );
  DFFSR \left_reg[12]  ( .D(nxtLeft[12]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[45]) );
  DFFSR \left_reg[13]  ( .D(nxtLeft[13]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[46]) );
  DFFSR \left_reg[23]  ( .D(nxtLeft[23]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[56]) );
  DFFSR \left_reg[0]  ( .D(nxtLeft[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[33]) );
  INVX1 U69 ( .A(n67), .Y(nxtRight[9]) );
  MUX2X1 U70 ( .B(n68), .A(des_in[9]), .S(des_start), .Y(n67) );
  XOR2X1 U71 ( .A(des_curr[42]), .B(des_curr[2]), .Y(n68) );
  INVX1 U72 ( .A(n69), .Y(nxtRight[8]) );
  MUX2X1 U73 ( .B(n70), .A(des_in[8]), .S(des_start), .Y(n69) );
  XOR2X1 U74 ( .A(des_curr[8]), .B(des_curr[41]), .Y(n70) );
  INVX1 U75 ( .A(n71), .Y(nxtRight[7]) );
  MUX2X1 U76 ( .B(n72), .A(des_in[7]), .S(des_start), .Y(n71) );
  XOR2X1 U77 ( .A(des_curr[40]), .B(des_curr[18]), .Y(n72) );
  INVX1 U78 ( .A(n73), .Y(nxtRight[6]) );
  MUX2X1 U79 ( .B(n74), .A(des_in[6]), .S(des_start), .Y(n73) );
  XOR2X1 U80 ( .A(des_curr[39]), .B(des_curr[12]), .Y(n74) );
  INVX1 U81 ( .A(n75), .Y(nxtRight[5]) );
  MUX2X1 U82 ( .B(n76), .A(des_in[5]), .S(des_start), .Y(n75) );
  XOR2X1 U83 ( .A(des_curr[38]), .B(des_curr[29]), .Y(n76) );
  INVX1 U84 ( .A(n77), .Y(nxtRight[4]) );
  MUX2X1 U85 ( .B(n78), .A(des_in[4]), .S(des_start), .Y(n77) );
  XOR2X1 U86 ( .A(des_curr[5]), .B(des_curr[37]), .Y(n78) );
  INVX1 U87 ( .A(n79), .Y(nxtRight[3]) );
  MUX2X1 U88 ( .B(n80), .A(des_in[3]), .S(des_start), .Y(n79) );
  XOR2X1 U89 ( .A(des_curr[36]), .B(des_curr[21]), .Y(n80) );
  INVX1 U90 ( .A(n81), .Y(nxtRight[31]) );
  MUX2X1 U91 ( .B(n82), .A(des_in[31]), .S(des_start), .Y(n81) );
  XOR2X1 U92 ( .A(left[31]), .B(des_curr[15]), .Y(n82) );
  INVX1 U93 ( .A(n83), .Y(nxtRight[30]) );
  MUX2X1 U94 ( .B(n84), .A(des_in[30]), .S(des_start), .Y(n83) );
  XOR2X1 U95 ( .A(des_curr[6]), .B(des_curr[63]), .Y(n84) );
  INVX1 U96 ( .A(n85), .Y(nxtRight[2]) );
  MUX2X1 U97 ( .B(n86), .A(des_in[2]), .S(des_start), .Y(n85) );
  XOR2X1 U98 ( .A(des_curr[35]), .B(des_curr[10]), .Y(n86) );
  INVX1 U99 ( .A(n87), .Y(nxtRight[29]) );
  MUX2X1 U100 ( .B(n88), .A(des_in[29]), .S(des_start), .Y(n87) );
  XOR2X1 U101 ( .A(des_curr[62]), .B(des_curr[19]), .Y(n88) );
  INVX1 U102 ( .A(n89), .Y(nxtRight[28]) );
  MUX2X1 U103 ( .B(n90), .A(des_in[28]), .S(des_start), .Y(n89) );
  XOR2X1 U104 ( .A(des_curr[61]), .B(des_curr[20]), .Y(n90) );
  INVX1 U105 ( .A(n91), .Y(nxtRight[27]) );
  MUX2X1 U106 ( .B(n92), .A(des_in[27]), .S(des_start), .Y(n91) );
  XOR2X1 U107 ( .A(des_curr[60]), .B(des_curr[28]), .Y(n92) );
  INVX1 U108 ( .A(n93), .Y(nxtRight[26]) );
  MUX2X1 U109 ( .B(n94), .A(des_in[26]), .S(des_start), .Y(n93) );
  XOR2X1 U110 ( .A(des_curr[59]), .B(des_curr[11]), .Y(n94) );
  INVX1 U111 ( .A(n95), .Y(nxtRight[25]) );
  MUX2X1 U112 ( .B(n96), .A(des_in[25]), .S(des_start), .Y(n95) );
  XOR2X1 U113 ( .A(des_curr[58]), .B(des_curr[27]), .Y(n96) );
  INVX1 U114 ( .A(n97), .Y(nxtRight[24]) );
  MUX2X1 U115 ( .B(n98), .A(des_in[24]), .S(des_start), .Y(n97) );
  XOR2X1 U116 ( .A(des_curr[57]), .B(des_curr[16]), .Y(n98) );
  INVX1 U117 ( .A(n99), .Y(nxtRight[23]) );
  MUX2X1 U118 ( .B(n100), .A(des_in[23]), .S(des_start), .Y(n99) );
  XOR2X1 U119 ( .A(des_curr[56]), .B(des_curr[0]), .Y(n100) );
  INVX1 U120 ( .A(n101), .Y(nxtRight[22]) );
  MUX2X1 U121 ( .B(n102), .A(des_in[22]), .S(des_start), .Y(n101) );
  XOR2X1 U122 ( .A(des_curr[55]), .B(des_curr[14]), .Y(n102) );
  INVX1 U123 ( .A(n103), .Y(nxtRight[21]) );
  MUX2X1 U124 ( .B(n104), .A(des_in[21]), .S(des_start), .Y(n103) );
  XOR2X1 U125 ( .A(des_curr[54]), .B(des_curr[22]), .Y(n104) );
  INVX1 U126 ( .A(n105), .Y(nxtRight[20]) );
  MUX2X1 U127 ( .B(n106), .A(des_in[20]), .S(des_start), .Y(n105) );
  XOR2X1 U128 ( .A(des_curr[53]), .B(des_curr[25]), .Y(n106) );
  INVX1 U129 ( .A(n107), .Y(nxtRight[1]) );
  MUX2X1 U130 ( .B(n108), .A(des_in[1]), .S(des_start), .Y(n107) );
  XOR2X1 U131 ( .A(des_curr[3]), .B(des_curr[34]), .Y(n108) );
  INVX1 U132 ( .A(n109), .Y(nxtRight[19]) );
  MUX2X1 U133 ( .B(n110), .A(des_in[19]), .S(des_start), .Y(n109) );
  XOR2X1 U134 ( .A(des_curr[52]), .B(des_curr[4]), .Y(n110) );
  INVX1 U135 ( .A(n111), .Y(nxtRight[18]) );
  MUX2X1 U136 ( .B(n112), .A(des_in[18]), .S(des_start), .Y(n111) );
  XOR2X1 U137 ( .A(des_curr[51]), .B(des_curr[17]), .Y(n112) );
  INVX1 U138 ( .A(n113), .Y(nxtRight[17]) );
  MUX2X1 U139 ( .B(n114), .A(des_in[17]), .S(des_start), .Y(n113) );
  XOR2X1 U140 ( .A(des_curr[50]), .B(des_curr[30]), .Y(n114) );
  INVX1 U141 ( .A(n115), .Y(nxtRight[16]) );
  MUX2X1 U142 ( .B(n116), .A(des_in[16]), .S(des_start), .Y(n115) );
  XOR2X1 U143 ( .A(des_curr[9]), .B(des_curr[49]), .Y(n116) );
  INVX1 U144 ( .A(n117), .Y(nxtRight[15]) );
  MUX2X1 U145 ( .B(n118), .A(des_in[15]), .S(des_start), .Y(n117) );
  XOR2X1 U146 ( .A(des_curr[48]), .B(des_curr[1]), .Y(n118) );
  INVX1 U147 ( .A(n119), .Y(nxtRight[14]) );
  MUX2X1 U148 ( .B(n120), .A(des_in[14]), .S(des_start), .Y(n119) );
  XOR2X1 U149 ( .A(des_curr[7]), .B(des_curr[47]), .Y(n120) );
  INVX1 U150 ( .A(n121), .Y(nxtRight[13]) );
  MUX2X1 U151 ( .B(n122), .A(des_in[13]), .S(des_start), .Y(n121) );
  XOR2X1 U152 ( .A(des_curr[46]), .B(des_curr[23]), .Y(n122) );
  INVX1 U153 ( .A(n123), .Y(nxtRight[12]) );
  MUX2X1 U154 ( .B(n124), .A(des_in[12]), .S(des_start), .Y(n123) );
  XOR2X1 U155 ( .A(des_curr[45]), .B(des_curr[13]), .Y(n124) );
  OAI21X1 U156 ( .A(des_curr[44]), .B(n125), .C(n126), .Y(nxtRight[11]) );
  MUX2X1 U157 ( .B(n127), .A(des_in[11]), .S(des_start), .Y(n126) );
  NOR2X1 U158 ( .A(des_curr[31]), .B(n128), .Y(n127) );
  INVX1 U159 ( .A(des_curr[44]), .Y(n128) );
  INVX1 U160 ( .A(n129), .Y(nxtRight[10]) );
  MUX2X1 U161 ( .B(n130), .A(des_in[10]), .S(des_start), .Y(n129) );
  XOR2X1 U162 ( .A(des_curr[43]), .B(des_curr[26]), .Y(n130) );
  INVX1 U163 ( .A(n131), .Y(nxtRight[0]) );
  MUX2X1 U164 ( .B(n132), .A(des_in[0]), .S(des_start), .Y(n131) );
  XOR2X1 U165 ( .A(des_curr[33]), .B(des_curr[24]), .Y(n132) );
  INVX1 U166 ( .A(n133), .Y(nxtLeft[9]) );
  MUX2X1 U167 ( .B(des_curr[9]), .A(des_in[42]), .S(des_start), .Y(n133) );
  INVX1 U168 ( .A(n134), .Y(nxtLeft[8]) );
  MUX2X1 U169 ( .B(des_curr[8]), .A(des_in[41]), .S(des_start), .Y(n134) );
  INVX1 U170 ( .A(n135), .Y(nxtLeft[7]) );
  MUX2X1 U171 ( .B(des_curr[7]), .A(des_in[40]), .S(des_start), .Y(n135) );
  INVX1 U172 ( .A(n136), .Y(nxtLeft[6]) );
  MUX2X1 U173 ( .B(des_curr[6]), .A(des_in[39]), .S(des_start), .Y(n136) );
  INVX1 U174 ( .A(n137), .Y(nxtLeft[5]) );
  MUX2X1 U175 ( .B(des_curr[5]), .A(des_in[38]), .S(des_start), .Y(n137) );
  INVX1 U176 ( .A(n138), .Y(nxtLeft[4]) );
  MUX2X1 U177 ( .B(des_curr[4]), .A(des_in[37]), .S(des_start), .Y(n138) );
  INVX1 U178 ( .A(n139), .Y(nxtLeft[3]) );
  MUX2X1 U179 ( .B(des_curr[3]), .A(des_in[36]), .S(des_start), .Y(n139) );
  AND2X1 U180 ( .A(des_curr[32]), .B(n140), .Y(nxtLeft[32]) );
  INVX1 U181 ( .A(n125), .Y(nxtLeft[31]) );
  NAND2X1 U182 ( .A(des_curr[31]), .B(n140), .Y(n125) );
  INVX1 U183 ( .A(des_start), .Y(n140) );
  INVX1 U184 ( .A(n141), .Y(nxtLeft[30]) );
  MUX2X1 U185 ( .B(des_curr[30]), .A(des_in[63]), .S(des_start), .Y(n141) );
  INVX1 U186 ( .A(n142), .Y(nxtLeft[2]) );
  MUX2X1 U187 ( .B(des_curr[2]), .A(des_in[35]), .S(des_start), .Y(n142) );
  INVX1 U188 ( .A(n143), .Y(nxtLeft[29]) );
  MUX2X1 U189 ( .B(des_curr[29]), .A(des_in[62]), .S(des_start), .Y(n143) );
  INVX1 U190 ( .A(n144), .Y(nxtLeft[28]) );
  MUX2X1 U191 ( .B(des_curr[28]), .A(des_in[61]), .S(des_start), .Y(n144) );
  INVX1 U192 ( .A(n145), .Y(nxtLeft[27]) );
  MUX2X1 U193 ( .B(des_curr[27]), .A(des_in[60]), .S(des_start), .Y(n145) );
  INVX1 U194 ( .A(n146), .Y(nxtLeft[26]) );
  MUX2X1 U195 ( .B(des_curr[26]), .A(des_in[59]), .S(des_start), .Y(n146) );
  INVX1 U196 ( .A(n147), .Y(nxtLeft[25]) );
  MUX2X1 U197 ( .B(des_curr[25]), .A(des_in[58]), .S(des_start), .Y(n147) );
  INVX1 U198 ( .A(n148), .Y(nxtLeft[24]) );
  MUX2X1 U199 ( .B(des_curr[24]), .A(des_in[57]), .S(des_start), .Y(n148) );
  INVX1 U200 ( .A(n149), .Y(nxtLeft[23]) );
  MUX2X1 U201 ( .B(des_curr[23]), .A(des_in[56]), .S(des_start), .Y(n149) );
  INVX1 U202 ( .A(n150), .Y(nxtLeft[22]) );
  MUX2X1 U203 ( .B(des_curr[22]), .A(des_in[55]), .S(des_start), .Y(n150) );
  INVX1 U204 ( .A(n151), .Y(nxtLeft[21]) );
  MUX2X1 U205 ( .B(des_curr[21]), .A(des_in[54]), .S(des_start), .Y(n151) );
  INVX1 U206 ( .A(n152), .Y(nxtLeft[20]) );
  MUX2X1 U207 ( .B(des_curr[20]), .A(des_in[53]), .S(des_start), .Y(n152) );
  INVX1 U208 ( .A(n153), .Y(nxtLeft[1]) );
  MUX2X1 U209 ( .B(des_curr[1]), .A(des_in[34]), .S(des_start), .Y(n153) );
  INVX1 U210 ( .A(n154), .Y(nxtLeft[19]) );
  MUX2X1 U211 ( .B(des_curr[19]), .A(des_in[52]), .S(des_start), .Y(n154) );
  INVX1 U212 ( .A(n155), .Y(nxtLeft[18]) );
  MUX2X1 U213 ( .B(des_curr[18]), .A(des_in[51]), .S(des_start), .Y(n155) );
  INVX1 U214 ( .A(n156), .Y(nxtLeft[17]) );
  MUX2X1 U215 ( .B(des_curr[17]), .A(des_in[50]), .S(des_start), .Y(n156) );
  INVX1 U216 ( .A(n157), .Y(nxtLeft[16]) );
  MUX2X1 U217 ( .B(des_curr[16]), .A(des_in[49]), .S(des_start), .Y(n157) );
  INVX1 U218 ( .A(n158), .Y(nxtLeft[15]) );
  MUX2X1 U219 ( .B(des_curr[15]), .A(des_in[48]), .S(des_start), .Y(n158) );
  INVX1 U220 ( .A(n159), .Y(nxtLeft[14]) );
  MUX2X1 U221 ( .B(des_curr[14]), .A(des_in[47]), .S(des_start), .Y(n159) );
  INVX1 U222 ( .A(n160), .Y(nxtLeft[13]) );
  MUX2X1 U223 ( .B(des_curr[13]), .A(des_in[46]), .S(des_start), .Y(n160) );
  INVX1 U224 ( .A(n161), .Y(nxtLeft[12]) );
  MUX2X1 U225 ( .B(des_curr[12]), .A(des_in[45]), .S(des_start), .Y(n161) );
  INVX1 U226 ( .A(n162), .Y(nxtLeft[11]) );
  MUX2X1 U227 ( .B(des_curr[11]), .A(des_in[44]), .S(des_start), .Y(n162) );
  INVX1 U228 ( .A(n163), .Y(nxtLeft[10]) );
  MUX2X1 U229 ( .B(des_curr[10]), .A(des_in[43]), .S(des_start), .Y(n163) );
  INVX1 U230 ( .A(n164), .Y(nxtLeft[0]) );
  MUX2X1 U231 ( .B(des_curr[0]), .A(des_in[33]), .S(des_start), .Y(n164) );
  INVX1 U232 ( .A(n165), .Y(n166) );
  MUX2X1 U233 ( .B(left[32]), .A(des_in[32]), .S(des_start), .Y(n165) );
endmodule


module key_counter ( clk, n_rst, count_enable, key_count, key_rollover );
  output [1:0] key_count;
  input clk, n_rst, count_enable;
  output key_rollover;
  wire   n7, n8, n3, n4, n5;
  tri   clk;
  tri   n_rst;
  tri   count_enable;
  tri   [1:0] key_count;
  tri   key_rollover;
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
  tri   clk;
  tri   n_rst;
  tri   [4:0] round_count;
  tri   cnt_rollover;

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
  wire   n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31;
  wire   [3:0] state;
  wire   [3:0] nextstate;
  tri   clk;
  tri   n_rst;
  tri   encrypt_sync;
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
  tri   clk;
  tri   n_rst;
  tri   sync_out;

  DFFSR q_reg ( .D(async_in), .CLK(clk), .R(1'b1), .S(n_rst), .Q(N3) );
  DFFSR sync_out_reg ( .D(N3), .CLK(clk), .R(1'b1), .S(n_rst), .Q(sync_out) );
endmodule


module encryptor_core ( clk, n_rst, rcv_data_ready, encrypt, handshake_ack, 
        rcv_data, trans_data, trans_data_ready );
  input [63:0] rcv_data;
  output [63:0] trans_data;
  input clk, n_rst, rcv_data_ready, encrypt, handshake_ack;
  output trans_data_ready;
  wire   des_start, count_enable;
  wire   [63:0] des_curr;
  tri   clk;
  tri   n_rst;
  tri   [63:0] rcv_data;
  tri   [63:0] des_in;
  tri   [47:0] subkey;
  tri   reverse;
  tri   cnt_rollover;
  tri   key_rollover;
  tri   [4:0] round_count;
  tri   [1:0] key_count;
  tri   encrypt_sync;
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
  wire   n15, n16, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13;
  tri   clk;
  tri   n_rst;

  DFFSR d_minus_reg ( .D(n16), .CLK(clk), .R(n_rst), .S(1'b1), .Q(d_minus) );
  DFFSR d_plus_reg ( .D(n15), .CLK(clk), .R(1'b1), .S(n_rst), .Q(d_plus) );
  MUX2X1 U5 ( .B(n3), .A(n4), .S(d_minus), .Y(n16) );
  NAND3X1 U6 ( .A(n5), .B(n6), .C(n4), .Y(n3) );
  NAND2X1 U7 ( .A(n7), .B(n6), .Y(n15) );
  MUX2X1 U8 ( .B(n8), .A(n9), .S(d_plus), .Y(n7) );
  NOR2X1 U9 ( .A(eop_transmitting), .B(n9), .Y(n8) );
  INVX1 U10 ( .A(n4), .Y(n9) );
  NAND3X1 U11 ( .A(n5), .B(n6), .C(n10), .Y(n4) );
  OAI21X1 U12 ( .A(n11), .B(n12), .C(d_orig), .Y(n10) );
  OR2X1 U13 ( .A(crc5_shift_enable), .B(crc16_shift_enable), .Y(n12) );
  OR2X1 U14 ( .A(data_shift_enable), .B(n13), .Y(n11) );
  OR2X1 U15 ( .A(sync_shift_enable), .B(pid_shift_enable), .Y(n13) );
  INVX1 U16 ( .A(idle_transmitting), .Y(n6) );
  INVX1 U17 ( .A(eop_transmitting), .Y(n5) );
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
  tri   clk;
  tri   n_rst;

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
  tri   clk;
  tri   n_rst;

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
  tri   clk;
  tri   n_rst;

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
  tri   clk;
  tri   n_rst;

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
  tri   clk;
  tri   n_rst;

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
  tri   clk;
  tri   n_rst;

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
  tri   clk;
  tri   n_rst;

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
  tri   clk;
  tri   n_rst;

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
  tri   clk;
  tri   n_rst;

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
  tri   clk;
  tri   n_rst;

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
  tri   clk;
  tri   n_rst;

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
  tri   clk;
  tri   n_rst;

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
  tri   clk;
  tri   n_rst;

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
  tri   clk;
  tri   n_rst;

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
  tri   clk;
  tri   n_rst;

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
  tri   clk;
  tri   n_rst;

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
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n146, n147, n148, n149,
         n150;
  wire   [31:0] sync_count_out;
  wire   [31:0] pid_count_out;
  wire   [31:0] crc5_count_out;
  wire   [31:0] crc16_count_out;
  wire   [31:0] data_count_out;
  tri   clk;
  tri   n_rst;
  assign sync_bits_transmitted = 1'b0;
  assign pid_bits_transmitted = 1'b0;
  assign crc5_bits_transmitted = 1'b0;
  assign crc16_bits_transmitted = 1'b0;
  assign data_bits_transmitted = 1'b0;

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
        .clear(n146), .count_enable(sync_shift_enable), .rollover_val({1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0}) );
  flex_counter_NUM_CNT_BITS32_3 pid_bits_receive ( .clk(clk), .n_rst(n_rst), 
        .clear(n147), .count_enable(pid_shift_enable), .rollover_val({1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0}) );
  flex_counter_NUM_CNT_BITS32_2 crc5_bits_receive ( .clk(clk), .n_rst(n_rst), 
        .clear(n148), .count_enable(crc5_shift_enable), .rollover_val({1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b1}) );
  flex_counter_NUM_CNT_BITS32_1 crc16_bits_receive ( .clk(clk), .n_rst(n_rst), 
        .clear(n149), .count_enable(crc16_shift_enable), .rollover_val({1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0}) );
  flex_counter_NUM_CNT_BITS32_0 data_bits_receive ( .clk(clk), .n_rst(n_rst), 
        .clear(n150), .count_enable(data_shift_enable), .rollover_val({1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}) );
  INVX1 U9 ( .A(n1), .Y(sync_shift_enable) );
  NAND3X1 U10 ( .A(n2), .B(n3), .C(n4), .Y(n1) );
  NOR2X1 U11 ( .A(n5), .B(n6), .Y(n4) );
  NAND3X1 U12 ( .A(n7), .B(n8), .C(n9), .Y(n6) );
  AND2X1 U13 ( .A(n10), .B(n11), .Y(n9) );
  NOR2X1 U14 ( .A(sync_count_out[30]), .B(sync_count_out[29]), .Y(n11) );
  NOR2X1 U15 ( .A(sync_count_out[28]), .B(sync_count_out[27]), .Y(n10) );
  NOR2X1 U16 ( .A(sync_count_out[26]), .B(sync_count_out[25]), .Y(n8) );
  NOR2X1 U17 ( .A(sync_count_out[24]), .B(sync_count_out[23]), .Y(n7) );
  NAND3X1 U18 ( .A(n12), .B(n13), .C(n14), .Y(n5) );
  AND2X1 U19 ( .A(n15), .B(n16), .Y(n14) );
  NOR2X1 U20 ( .A(sync_count_out[9]), .B(sync_count_out[8]), .Y(n16) );
  NOR2X1 U21 ( .A(sync_count_out[7]), .B(sync_count_out[6]), .Y(n15) );
  NOR2X1 U22 ( .A(sync_count_out[5]), .B(sync_count_out[4]), .Y(n13) );
  NOR2X1 U23 ( .A(sync_count_out[3]), .B(sync_count_out[31]), .Y(n12) );
  NOR2X1 U24 ( .A(n17), .B(n18), .Y(n3) );
  NAND2X1 U25 ( .A(n19), .B(n20), .Y(n18) );
  NOR2X1 U26 ( .A(sync_count_out[19]), .B(sync_count_out[18]), .Y(n20) );
  NOR2X1 U27 ( .A(sync_count_out[17]), .B(sync_count_out[16]), .Y(n19) );
  NAND2X1 U28 ( .A(n21), .B(n22), .Y(n17) );
  NOR2X1 U29 ( .A(sync_count_out[22]), .B(sync_count_out[21]), .Y(n22) );
  NOR2X1 U30 ( .A(sync_count_out[20]), .B(sync_count_out[1]), .Y(n21) );
  NOR2X1 U31 ( .A(n23), .B(n24), .Y(n2) );
  NAND3X1 U32 ( .A(sync_count_out[2]), .B(n25), .C(n26), .Y(n24) );
  NOR2X1 U33 ( .A(sync_count_out[11]), .B(sync_count_out[10]), .Y(n26) );
  INVX1 U34 ( .A(sync_count_out[0]), .Y(n25) );
  NAND2X1 U35 ( .A(n27), .B(n28), .Y(n23) );
  NOR2X1 U36 ( .A(sync_count_out[15]), .B(sync_count_out[14]), .Y(n28) );
  NOR2X1 U37 ( .A(sync_count_out[13]), .B(sync_count_out[12]), .Y(n27) );
  INVX1 U38 ( .A(n29), .Y(pid_shift_enable) );
  NAND3X1 U39 ( .A(n30), .B(n31), .C(n32), .Y(n29) );
  NOR2X1 U40 ( .A(n33), .B(n34), .Y(n32) );
  NAND3X1 U41 ( .A(n35), .B(n36), .C(n37), .Y(n34) );
  AND2X1 U42 ( .A(n38), .B(n39), .Y(n37) );
  NOR2X1 U43 ( .A(pid_count_out[30]), .B(pid_count_out[29]), .Y(n39) );
  NOR2X1 U44 ( .A(pid_count_out[28]), .B(pid_count_out[27]), .Y(n38) );
  NOR2X1 U45 ( .A(pid_count_out[26]), .B(pid_count_out[25]), .Y(n36) );
  NOR2X1 U46 ( .A(pid_count_out[24]), .B(pid_count_out[23]), .Y(n35) );
  NAND3X1 U47 ( .A(n40), .B(n41), .C(n42), .Y(n33) );
  AND2X1 U48 ( .A(n43), .B(n44), .Y(n42) );
  NOR2X1 U49 ( .A(pid_count_out[9]), .B(pid_count_out[8]), .Y(n44) );
  NOR2X1 U50 ( .A(pid_count_out[7]), .B(pid_count_out[6]), .Y(n43) );
  NOR2X1 U51 ( .A(pid_count_out[5]), .B(pid_count_out[4]), .Y(n41) );
  NOR2X1 U52 ( .A(pid_count_out[3]), .B(pid_count_out[31]), .Y(n40) );
  NOR2X1 U53 ( .A(n45), .B(n46), .Y(n31) );
  NAND2X1 U54 ( .A(n47), .B(n48), .Y(n46) );
  NOR2X1 U55 ( .A(pid_count_out[19]), .B(pid_count_out[18]), .Y(n48) );
  NOR2X1 U56 ( .A(pid_count_out[17]), .B(pid_count_out[16]), .Y(n47) );
  NAND2X1 U57 ( .A(n49), .B(n50), .Y(n45) );
  NOR2X1 U58 ( .A(pid_count_out[22]), .B(pid_count_out[21]), .Y(n50) );
  NOR2X1 U59 ( .A(pid_count_out[20]), .B(pid_count_out[1]), .Y(n49) );
  NOR2X1 U60 ( .A(n51), .B(n52), .Y(n30) );
  NAND3X1 U61 ( .A(pid_count_out[2]), .B(n53), .C(n54), .Y(n52) );
  NOR2X1 U62 ( .A(pid_count_out[11]), .B(pid_count_out[10]), .Y(n54) );
  INVX1 U63 ( .A(pid_count_out[0]), .Y(n53) );
  NAND2X1 U64 ( .A(n55), .B(n56), .Y(n51) );
  NOR2X1 U65 ( .A(pid_count_out[15]), .B(pid_count_out[14]), .Y(n56) );
  NOR2X1 U66 ( .A(pid_count_out[13]), .B(pid_count_out[12]), .Y(n55) );
  INVX1 U67 ( .A(n57), .Y(crc5_shift_enable) );
  NAND3X1 U68 ( .A(n58), .B(n59), .C(n60), .Y(n57) );
  NOR2X1 U69 ( .A(n61), .B(n62), .Y(n60) );
  NAND3X1 U70 ( .A(n63), .B(n64), .C(n65), .Y(n62) );
  AND2X1 U71 ( .A(n66), .B(n67), .Y(n65) );
  NOR2X1 U72 ( .A(crc5_count_out[30]), .B(crc5_count_out[29]), .Y(n67) );
  NOR2X1 U73 ( .A(crc5_count_out[28]), .B(crc5_count_out[27]), .Y(n66) );
  NOR2X1 U74 ( .A(crc5_count_out[26]), .B(crc5_count_out[25]), .Y(n64) );
  NOR2X1 U75 ( .A(crc5_count_out[24]), .B(crc5_count_out[23]), .Y(n63) );
  NAND3X1 U76 ( .A(n68), .B(n69), .C(n70), .Y(n61) );
  AND2X1 U77 ( .A(n71), .B(n72), .Y(n70) );
  NOR2X1 U78 ( .A(crc5_count_out[9]), .B(crc5_count_out[8]), .Y(n72) );
  NOR2X1 U79 ( .A(crc5_count_out[7]), .B(crc5_count_out[6]), .Y(n71) );
  NOR2X1 U80 ( .A(crc5_count_out[5]), .B(crc5_count_out[4]), .Y(n69) );
  NOR2X1 U81 ( .A(crc5_count_out[3]), .B(crc5_count_out[31]), .Y(n68) );
  NOR2X1 U82 ( .A(n73), .B(n74), .Y(n59) );
  NAND2X1 U83 ( .A(n75), .B(n76), .Y(n74) );
  NOR2X1 U84 ( .A(crc5_count_out[19]), .B(crc5_count_out[18]), .Y(n76) );
  NOR2X1 U85 ( .A(crc5_count_out[17]), .B(crc5_count_out[16]), .Y(n75) );
  NAND2X1 U86 ( .A(n77), .B(n78), .Y(n73) );
  NOR2X1 U87 ( .A(crc5_count_out[22]), .B(crc5_count_out[21]), .Y(n78) );
  NOR2X1 U88 ( .A(crc5_count_out[20]), .B(crc5_count_out[1]), .Y(n77) );
  NOR2X1 U89 ( .A(n79), .B(n80), .Y(n58) );
  NAND3X1 U90 ( .A(crc5_count_out[2]), .B(n81), .C(n82), .Y(n80) );
  NOR2X1 U91 ( .A(crc5_count_out[11]), .B(crc5_count_out[10]), .Y(n82) );
  INVX1 U92 ( .A(crc5_count_out[0]), .Y(n81) );
  NAND2X1 U93 ( .A(n83), .B(n84), .Y(n79) );
  NOR2X1 U94 ( .A(crc5_count_out[15]), .B(crc5_count_out[14]), .Y(n84) );
  NOR2X1 U95 ( .A(crc5_count_out[13]), .B(crc5_count_out[12]), .Y(n83) );
  INVX1 U96 ( .A(n85), .Y(crc16_shift_enable) );
  NAND3X1 U97 ( .A(n86), .B(n87), .C(n88), .Y(n85) );
  NOR2X1 U98 ( .A(n89), .B(n90), .Y(n88) );
  NAND3X1 U99 ( .A(n91), .B(n92), .C(n93), .Y(n90) );
  AND2X1 U100 ( .A(n94), .B(n95), .Y(n93) );
  NOR2X1 U101 ( .A(crc16_count_out[30]), .B(crc16_count_out[29]), .Y(n95) );
  NOR2X1 U102 ( .A(crc16_count_out[28]), .B(crc16_count_out[27]), .Y(n94) );
  NOR2X1 U103 ( .A(crc16_count_out[26]), .B(crc16_count_out[25]), .Y(n92) );
  NOR2X1 U104 ( .A(crc16_count_out[24]), .B(crc16_count_out[23]), .Y(n91) );
  NAND3X1 U105 ( .A(n96), .B(n97), .C(n98), .Y(n89) );
  AND2X1 U106 ( .A(n99), .B(n100), .Y(n98) );
  NOR2X1 U107 ( .A(crc16_count_out[9]), .B(crc16_count_out[8]), .Y(n100) );
  NOR2X1 U108 ( .A(crc16_count_out[7]), .B(crc16_count_out[6]), .Y(n99) );
  NOR2X1 U109 ( .A(crc16_count_out[5]), .B(crc16_count_out[4]), .Y(n97) );
  NOR2X1 U110 ( .A(crc16_count_out[3]), .B(crc16_count_out[31]), .Y(n96) );
  NOR2X1 U111 ( .A(n101), .B(n102), .Y(n87) );
  NAND2X1 U112 ( .A(n103), .B(n104), .Y(n102) );
  NOR2X1 U113 ( .A(crc16_count_out[19]), .B(crc16_count_out[18]), .Y(n104) );
  NOR2X1 U114 ( .A(crc16_count_out[17]), .B(crc16_count_out[16]), .Y(n103) );
  NAND2X1 U115 ( .A(n105), .B(n106), .Y(n101) );
  NOR2X1 U116 ( .A(crc16_count_out[22]), .B(crc16_count_out[21]), .Y(n106) );
  NOR2X1 U117 ( .A(crc16_count_out[20]), .B(crc16_count_out[1]), .Y(n105) );
  NOR2X1 U118 ( .A(n107), .B(n108), .Y(n86) );
  NAND3X1 U119 ( .A(crc16_count_out[2]), .B(n109), .C(n110), .Y(n108) );
  NOR2X1 U120 ( .A(crc16_count_out[11]), .B(crc16_count_out[10]), .Y(n110) );
  INVX1 U121 ( .A(crc16_count_out[0]), .Y(n109) );
  NAND2X1 U122 ( .A(n111), .B(n112), .Y(n107) );
  NOR2X1 U123 ( .A(crc16_count_out[15]), .B(crc16_count_out[14]), .Y(n112) );
  NOR2X1 U124 ( .A(crc16_count_out[13]), .B(crc16_count_out[12]), .Y(n111) );
  INVX1 U125 ( .A(n113), .Y(data_shift_enable) );
  NAND3X1 U126 ( .A(n114), .B(n115), .C(n116), .Y(n113) );
  NOR2X1 U127 ( .A(n117), .B(n118), .Y(n116) );
  NAND3X1 U128 ( .A(n119), .B(n120), .C(n121), .Y(n118) );
  AND2X1 U129 ( .A(n122), .B(n123), .Y(n121) );
  NOR2X1 U130 ( .A(data_count_out[30]), .B(data_count_out[29]), .Y(n123) );
  NOR2X1 U131 ( .A(data_count_out[28]), .B(data_count_out[27]), .Y(n122) );
  NOR2X1 U132 ( .A(data_count_out[26]), .B(data_count_out[25]), .Y(n120) );
  NOR2X1 U133 ( .A(data_count_out[24]), .B(data_count_out[23]), .Y(n119) );
  NAND3X1 U134 ( .A(n124), .B(n125), .C(n126), .Y(n117) );
  AND2X1 U135 ( .A(n127), .B(n128), .Y(n126) );
  NOR2X1 U136 ( .A(data_count_out[9]), .B(data_count_out[8]), .Y(n128) );
  NOR2X1 U137 ( .A(data_count_out[7]), .B(data_count_out[6]), .Y(n127) );
  NOR2X1 U138 ( .A(data_count_out[5]), .B(data_count_out[4]), .Y(n125) );
  NOR2X1 U139 ( .A(data_count_out[3]), .B(data_count_out[31]), .Y(n124) );
  NOR2X1 U140 ( .A(n129), .B(n130), .Y(n115) );
  NAND2X1 U141 ( .A(n131), .B(n132), .Y(n130) );
  NOR2X1 U142 ( .A(data_count_out[19]), .B(data_count_out[18]), .Y(n132) );
  NOR2X1 U143 ( .A(data_count_out[17]), .B(data_count_out[16]), .Y(n131) );
  NAND2X1 U144 ( .A(n133), .B(n134), .Y(n129) );
  NOR2X1 U145 ( .A(data_count_out[22]), .B(data_count_out[21]), .Y(n134) );
  NOR2X1 U146 ( .A(data_count_out[20]), .B(data_count_out[1]), .Y(n133) );
  NOR2X1 U147 ( .A(n135), .B(n136), .Y(n114) );
  NAND3X1 U148 ( .A(data_count_out[2]), .B(n137), .C(n138), .Y(n136) );
  NOR2X1 U149 ( .A(data_count_out[11]), .B(data_count_out[10]), .Y(n138) );
  INVX1 U150 ( .A(data_count_out[0]), .Y(n137) );
  NAND2X1 U151 ( .A(n139), .B(n140), .Y(n135) );
  NOR2X1 U152 ( .A(data_count_out[15]), .B(data_count_out[14]), .Y(n140) );
  NOR2X1 U153 ( .A(data_count_out[13]), .B(data_count_out[12]), .Y(n139) );
  INVX1 U154 ( .A(sync_transmitting), .Y(n146) );
  INVX1 U155 ( .A(pid_transmitting), .Y(n147) );
  INVX1 U156 ( .A(crc5_transmitting), .Y(n148) );
  INVX1 U157 ( .A(crc16_transmitting), .Y(n149) );
  INVX1 U158 ( .A(data_transmitting), .Y(n150) );
endmodule


module tcu ( clk, n_rst, trans_data_ready, sync_bits_transmitted, 
        pid_bits_transmitted, crc5_bits_transmitted, crc16_bits_transmitted, 
        data_bits_transmitted, idle_transmitting, sync_transmitting, 
        pid_transmitting, crc5_transmitting, crc16_transmitting, 
        data_transmitting, eop_transmitting, sync_load_enable, pid_load_enable, 
        crc5_load_enable, crc16_load_enable, data_load_enable, trans_sync, 
        trans_pid, trans_crc5, trans_crc16, handshake_ack );
  output [7:0] trans_sync;
  output [7:0] trans_pid;
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
  tri   clk;
  tri   n_rst;
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
         crc16_transmitting, data_transmitting;
  wire   [7:0] trans_sync;
  wire   [7:0] trans_pid;
  wire   [4:0] trans_crc5;
  wire   [15:0] trans_crc16;
  tri   clk;
  tri   n_rst;
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
        .data_shift_enable(data_shift_enable) );
  tcu tcu1 ( .clk(clk), .n_rst(n_rst), .trans_data_ready(trans_data_ready), 
        .sync_bits_transmitted(1'b0), .pid_bits_transmitted(1'b0), 
        .crc5_bits_transmitted(1'b0), .crc16_bits_transmitted(1'b0), 
        .data_bits_transmitted(1'b0), .idle_transmitting(idle_transmitting), 
        .sync_transmitting(sync_transmitting), .pid_transmitting(
        pid_transmitting), .crc5_transmitting(crc5_transmitting), 
        .crc16_transmitting(crc16_transmitting), .data_transmitting(
        data_transmitting), .eop_transmitting(eop_transmitting), 
        .sync_load_enable(sync_load_enable), .pid_load_enable(pid_load_enable), 
        .crc5_load_enable(crc5_load_enable), .crc16_load_enable(
        crc16_load_enable), .data_load_enable(data_load_enable), .trans_pid({
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, trans_pid[5:4], 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, trans_pid[1:0]}), 
        .handshake_ack(handshake_ack) );
endmodule


module usb_encryptor ( clk, n_rst, encrypt, d_plus_in, d_minus_in, d_plus_out, 
        d_minus_out );
  input clk, n_rst, encrypt, d_plus_in, d_minus_in;
  output d_plus_out, d_minus_out;
  wire   rcv_data_ready, handshake_ack, trans_data_ready;
  wire   [63:0] trans_data;
  tri   clk;
  tri   n_rst;
  tri   [63:0] rcv_data;

  usb_receiver A1 ( .clk(clk), .n_rst(n_rst), .d_plus(d_plus_in), .d_minus(
        d_minus_in), .rcv_data(rcv_data), .rcv_data_ready(rcv_data_ready) );
  encryptor_core B1 ( .clk(clk), .n_rst(n_rst), .rcv_data_ready(rcv_data_ready), .encrypt(encrypt), .handshake_ack(handshake_ack), .rcv_data(rcv_data), 
        .trans_data(trans_data), .trans_data_ready(trans_data_ready) );
  usb_transmitter C1 ( .clk(clk), .n_rst(n_rst), .trans_data_ready(
        trans_data_ready), .trans_data(trans_data), .d_plus(d_plus_out), 
        .d_minus(d_minus_out), .handshake_ack(handshake_ack) );
endmodule

