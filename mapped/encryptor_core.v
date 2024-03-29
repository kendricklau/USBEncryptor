/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Mon Apr 23 19:21:13 2018
/////////////////////////////////////////////////////////////


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


module des_round_computations ( clk, n_rst, des_start, des_enable, des_in, 
        subkey, des_curr );
  input [63:0] des_in;
  input [47:0] subkey;
  output [63:0] des_curr;
  input clk, n_rst, des_start, des_enable;
  wire   n1164, n1165, n1166, n1167, n1168, n1169, n1170, n1171, n1172, n1173,
         n1174, n1175, n1176, n1177, n1178, n1179, n1180, n1181, n1182, n1183,
         n1184, n1185, n1186, n1187, n1188, n1189, n1190, n1191, n1192, n1193,
         n1194, n1195, n1196, n1197, n1198, n1199, n1200, n1201, n1202, n1203,
         n1204, n1205, n1206, n1207, n1208, n1209, n1210, n1211, n1212, n1213,
         n1214, n1215, n1216, n1217, n1218, n1219, n1220, n1221, n1222, n1223,
         n1224, n1225, n1226, n1227, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88,
         n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n107, n108, n109, n110, n111, n112,
         n113, n114, n115, n116, n117, n118, n119, n120, n121, n122, n123,
         n124, n125, n126, n127, n128, n129, n130, n131, n132, n133, n134,
         n135, n136, n137, n138, n139, n140, n141, n142, n143, n144, n145,
         n146, n147, n148, n149, n150, n151, n152, n153, n154, n155, n156,
         n157, n158, n159, n160, n161, n162, n163, n164, n165, n166, n167,
         n168, n169, n170, n171, n172, n173, n174, n175, n176, n177, n178,
         n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202, n203, n204, n205, n206, n207, n208, n209, n210, n211,
         n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, n222,
         n223, n224, n225, n226, n227, n228, n229, n230, n231, n232, n233,
         n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n244,
         n245, n246, n247, n248, n249, n250, n251, n252, n253, n254, n255,
         n256, n257, n258, n259, n260, n261, n262, n263, n264, n265, n266,
         n267, n268, n269, n270, n271, n272, n273, n274, n275, n276, n277,
         n278, n279, n280, n281, n282, n283, n284, n285, n286, n287, n288,
         n289, n290, n291, n292, n293, n294, n295, n296, n297, n298, n299,
         n300, n301, n302, n303, n304, n305, n306, n307, n308, n309, n310,
         n311, n312, n313, n314, n315, n316, n317, n318, n319, n320, n321,
         n322, n323, n324, n325, n326, n327, n328, n329, n330, n331, n332,
         n333, n334, n335, n336, n337, n338, n339, n340, n341, n342, n343,
         n344, n345, n346, n347, n348, n349, n350, n351, n352, n353, n354,
         n355, n356, n357, n358, n359, n360, n361, n362, n363, n364, n365,
         n366, n367, n368, n369, n370, n371, n372, n373, n374, n375, n376,
         n377, n378, n379, n380, n381, n382, n383, n384, n385, n386, n387,
         n388, n389, n390, n391, n392, n393, n394, n395, n396, n397, n398,
         n399, n400, n401, n402, n403, n404, n405, n406, n407, n408, n409,
         n410, n411, n412, n413, n414, n415, n416, n417, n418, n419, n420,
         n421, n422, n423, n424, n425, n426, n427, n428, n429, n430, n431,
         n432, n433, n434, n435, n436, n437, n438, n439, n440, n441, n442,
         n443, n444, n445, n446, n447, n448, n449, n450, n451, n452, n453,
         n454, n455, n456, n457, n458, n459, n460, n461, n462, n463, n464,
         n465, n466, n467, n468, n469, n470, n471, n472, n473, n474, n475,
         n476, n477, n478, n479, n480, n481, n482, n483, n484, n485, n486,
         n487, n488, n489, n490, n491, n492, n493, n494, n495, n496, n497,
         n498, n499, n500, n501, n502, n503, n504, n505, n506, n507, n508,
         n509, n510, n511, n512, n513, n514, n515, n516, n517, n518, n519,
         n520, n521, n522, n523, n524, n525, n526, n527, n528, n529, n530,
         n531, n532, n533, n534, n535, n536, n537, n538, n539, n540, n541,
         n542, n543, n544, n545, n546, n547, n548, n549, n550, n551, n552,
         n553, n554, n555, n556, n557, n558, n559, n560, n561, n562, n563,
         n564, n565, n566, n567, n568, n569, n570, n571, n572, n573, n574,
         n575, n576, n577, n578, n579, n580, n581, n582, n583, n584, n585,
         n586, n587, n588, n589, n590, n591, n592, n593, n594, n595, n596,
         n597, n598, n599, n600, n601, n602, n603, n604, n605, n606, n607,
         n608, n609, n610, n611, n612, n613, n614, n615, n616, n617, n618,
         n619, n620, n621, n622, n623, n624, n625, n626, n627, n628, n629,
         n630, n631, n632, n633, n634, n635, n636, n637, n638, n639, n640,
         n641, n642, n643, n644, n645, n646, n647, n648, n649, n650, n651,
         n652, n653, n654, n655, n656, n657, n658, n659, n660, n661, n662,
         n663, n664, n665, n666, n667, n668, n669, n670, n671, n672, n673,
         n674, n675, n676, n677, n678, n679, n680, n681, n682, n683, n684,
         n685, n686, n687, n688, n689, n690, n691, n692, n693, n694, n695,
         n696, n697, n698, n699, n700, n701, n702, n703, n704, n705, n706,
         n707, n708, n709, n710, n711, n712, n713, n714, n715, n716, n717,
         n718, n719, n720, n721, n722, n723, n724, n725, n726, n727, n728,
         n729, n730, n731, n732, n733, n734, n735, n736, n737, n738, n739,
         n740, n741, n742, n743, n744, n745, n746, n747, n748, n749, n750,
         n751, n752, n753, n754, n755, n756, n757, n758, n759, n760, n761,
         n762, n763, n764, n765, n766, n767, n768, n769, n770, n771, n772,
         n773, n774, n775, n776, n777, n778, n779, n780, n781, n782, n783,
         n784, n785, n786, n787, n788, n789, n790, n791, n792, n793, n794,
         n795, n796, n797, n798, n799, n800, n801, n802, n803, n804, n805,
         n806, n807, n808, n809, n810, n811, n812, n813, n814, n815, n816,
         n817, n818, n819, n820, n821, n822, n823, n824, n825, n826, n827,
         n828, n829, n830, n831, n832, n833, n834, n835, n836, n837, n838,
         n839, n840, n841, n842, n843, n844, n845, n846, n847, n848, n849,
         n850, n851, n852, n853, n854, n855, n856, n857, n858, n859, n860,
         n861, n862, n863, n864, n865, n866, n867, n868, n869, n870, n871,
         n872, n873, n874, n875, n876, n877, n878, n879, n880, n881, n882,
         n883, n884, n885, n886, n887, n888, n889, n890, n891, n892, n893,
         n894, n895, n896, n897, n898, n899, n900, n901, n902, n903, n904,
         n905, n906, n907, n908, n909, n910, n911, n912, n913, n914, n915,
         n916, n917, n918, n919, n920, n921, n922, n923, n924, n925, n926,
         n927, n928, n929, n930, n931, n932, n933, n934, n935, n936, n937,
         n938, n939, n940, n941, n942, n943, n944, n945, n946, n947, n948,
         n949, n950, n951, n952, n953, n954, n955, n956, n957, n958, n959,
         n960, n961, n962, n963, n964, n965, n966, n967, n968, n969, n970,
         n971, n972, n973, n974, n975, n976, n977, n978, n979, n980, n981,
         n982, n983, n984, n985, n986, n987, n988, n989, n990, n991, n992,
         n993, n994, n995, n996, n997, n998, n999, n1000, n1001, n1002, n1003,
         n1004, n1005, n1006, n1007, n1008, n1009, n1010, n1011, n1012, n1013,
         n1014, n1015, n1016, n1017, n1018, n1019, n1020, n1021, n1022, n1023,
         n1024, n1025, n1026, n1027, n1028, n1029, n1030, n1031, n1032, n1033,
         n1034, n1035, n1036, n1037, n1038, n1039, n1040, n1041, n1042, n1043,
         n1044, n1045, n1046, n1047, n1048, n1049, n1050, n1051, n1052, n1053,
         n1054, n1055, n1056, n1057, n1058, n1059, n1060, n1061, n1062, n1063,
         n1064, n1065, n1066, n1067, n1068, n1069, n1070, n1071, n1072, n1073,
         n1074, n1075, n1076, n1077, n1078, n1079, n1080, n1081, n1082, n1083,
         n1084, n1085, n1086, n1087, n1088, n1089, n1090, n1091, n1092, n1093,
         n1094, n1095, n1096, n1097, n1098, n1099, n1100, n1101, n1102, n1103,
         n1104, n1105, n1106, n1107, n1108, n1109, n1110, n1111, n1112, n1113,
         n1114, n1115, n1116, n1117, n1118, n1119, n1120, n1121, n1122, n1123,
         n1124, n1125, n1126, n1127, n1128, n1129, n1130, n1131, n1132, n1133,
         n1134, n1135, n1136, n1137, n1138, n1139, n1140, n1141, n1142, n1143,
         n1144, n1145, n1146, n1147, n1148, n1149, n1150, n1151, n1152, n1153,
         n1154, n1155, n1156, n1157, n1158, n1159, n1160, n1161, n1162, n1163,
         n1228, n1229, n1230, n1231, n1232, n1233, n1234;
  wire   [32:31] left;

  DFFSR \right_reg[32]  ( .D(n1164), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[32]) );
  DFFSR \left_reg[32]  ( .D(n1234), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        left[32]) );
  DFFSR \right_reg[0]  ( .D(n1227), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[0]) );
  DFFSR \left_reg[0]  ( .D(n1226), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[33]) );
  DFFSR \right_reg[17]  ( .D(n1179), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[17]) );
  DFFSR \left_reg[17]  ( .D(n1209), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[50]) );
  DFFSR \right_reg[12]  ( .D(n1184), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[12]) );
  DFFSR \left_reg[12]  ( .D(n1214), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[45]) );
  DFFSR \right_reg[24]  ( .D(n1172), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[24]) );
  DFFSR \left_reg[24]  ( .D(n1202), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[57]) );
  DFFSR \right_reg[19]  ( .D(n1177), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[19]) );
  DFFSR \left_reg[19]  ( .D(n1207), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[52]) );
  DFFSR \right_reg[6]  ( .D(n1190), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[6]) );
  DFFSR \left_reg[6]  ( .D(n1220), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[39]) );
  DFFSR \right_reg[10]  ( .D(n1186), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[10]) );
  DFFSR \left_reg[10]  ( .D(n1216), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[43]) );
  DFFSR \right_reg[28]  ( .D(n1168), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[28]) );
  DFFSR \left_reg[28]  ( .D(n1198), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[61]) );
  DFFSR \right_reg[14]  ( .D(n1182), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[14]) );
  DFFSR \left_reg[14]  ( .D(n1212), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[47]) );
  DFFSR \right_reg[29]  ( .D(n1167), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[29]) );
  DFFSR \left_reg[29]  ( .D(n1197), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[62]) );
  DFFSR \right_reg[1]  ( .D(n1195), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[1]) );
  DFFSR \left_reg[1]  ( .D(n1225), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[34]) );
  DFFSR \right_reg[5]  ( .D(n1191), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[5]) );
  DFFSR \left_reg[5]  ( .D(n1221), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[38]) );
  DFFSR \right_reg[20]  ( .D(n1176), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[20]) );
  DFFSR \left_reg[20]  ( .D(n1206), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[53]) );
  DFFSR \right_reg[22]  ( .D(n1174), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[22]) );
  DFFSR \left_reg[22]  ( .D(n1204), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[55]) );
  DFFSR \right_reg[2]  ( .D(n1194), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[2]) );
  DFFSR \left_reg[2]  ( .D(n1224), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[35]) );
  DFFSR \right_reg[11]  ( .D(n1185), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[11]) );
  DFFSR \left_reg[11]  ( .D(n1215), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[44]) );
  DFFSR \right_reg[18]  ( .D(n1178), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[18]) );
  DFFSR \left_reg[18]  ( .D(n1208), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[51]) );
  DFFSR \right_reg[31]  ( .D(n1165), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[31]) );
  DFFSR \left_reg[31]  ( .D(n1233), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        left[31]) );
  DFFSR \right_reg[27]  ( .D(n1169), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[27]) );
  DFFSR \left_reg[27]  ( .D(n1199), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[60]) );
  DFFSR \right_reg[4]  ( .D(n1192), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[4]) );
  DFFSR \left_reg[4]  ( .D(n1222), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[37]) );
  DFFSR \right_reg[25]  ( .D(n1171), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[25]) );
  DFFSR \left_reg[25]  ( .D(n1201), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[58]) );
  DFFSR \right_reg[30]  ( .D(n1166), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[30]) );
  DFFSR \left_reg[30]  ( .D(n1196), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[63]) );
  DFFSR \right_reg[15]  ( .D(n1181), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[15]) );
  DFFSR \left_reg[15]  ( .D(n1211), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[48]) );
  DFFSR \right_reg[23]  ( .D(n1173), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[23]) );
  DFFSR \left_reg[23]  ( .D(n1203), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[56]) );
  DFFSR \right_reg[9]  ( .D(n1187), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[9]) );
  DFFSR \left_reg[9]  ( .D(n1217), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[42]) );
  DFFSR \right_reg[21]  ( .D(n1175), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[21]) );
  DFFSR \left_reg[21]  ( .D(n1205), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[54]) );
  DFFSR \right_reg[16]  ( .D(n1180), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[16]) );
  DFFSR \left_reg[16]  ( .D(n1210), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[49]) );
  DFFSR \right_reg[8]  ( .D(n1188), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[8]) );
  DFFSR \left_reg[8]  ( .D(n1218), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[41]) );
  DFFSR \right_reg[13]  ( .D(n1183), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[13]) );
  DFFSR \left_reg[13]  ( .D(n1213), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[46]) );
  DFFSR \right_reg[7]  ( .D(n1189), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[7]) );
  DFFSR \left_reg[7]  ( .D(n1219), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[40]) );
  DFFSR \right_reg[26]  ( .D(n1170), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[26]) );
  DFFSR \left_reg[26]  ( .D(n1200), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[59]) );
  DFFSR \right_reg[3]  ( .D(n1193), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[3]) );
  DFFSR \left_reg[3]  ( .D(n1223), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        des_curr[36]) );
  OR2X2 U69 ( .A(des_start), .B(des_enable), .Y(n67) );
  OR2X2 U70 ( .A(n70), .B(des_start), .Y(n68) );
  INVX8 U71 ( .A(des_start), .Y(n74) );
  INVX8 U72 ( .A(n68), .Y(n69) );
  INVX8 U73 ( .A(n67), .Y(n70) );
  INVX1 U74 ( .A(n71), .Y(n1233) );
  AOI22X1 U75 ( .A(n70), .B(left[31]), .C(n69), .D(des_curr[31]), .Y(n71) );
  INVX1 U76 ( .A(n72), .Y(n1234) );
  AOI22X1 U77 ( .A(n70), .B(left[32]), .C(n69), .D(des_curr[32]), .Y(n72) );
  OAI21X1 U78 ( .A(n73), .B(n74), .C(n75), .Y(n1227) );
  AOI22X1 U79 ( .A(n76), .B(n69), .C(des_curr[0]), .D(n70), .Y(n75) );
  XOR2X1 U80 ( .A(n77), .B(des_curr[33]), .Y(n76) );
  NAND3X1 U81 ( .A(n78), .B(n79), .C(n80), .Y(n77) );
  NOR2X1 U82 ( .A(n81), .B(n82), .Y(n80) );
  OAI21X1 U83 ( .A(n83), .B(n84), .C(n85), .Y(n82) );
  OAI21X1 U84 ( .A(n86), .B(n87), .C(n88), .Y(n85) );
  NAND2X1 U85 ( .A(n89), .B(n90), .Y(n87) );
  INVX1 U86 ( .A(n91), .Y(n83) );
  NAND2X1 U87 ( .A(n92), .B(n93), .Y(n81) );
  OAI21X1 U88 ( .A(n94), .B(n95), .C(n96), .Y(n93) );
  OAI21X1 U89 ( .A(n97), .B(n98), .C(n99), .Y(n92) );
  AOI21X1 U90 ( .A(n100), .B(n101), .C(n102), .Y(n78) );
  INVX1 U91 ( .A(n103), .Y(n102) );
  INVX1 U92 ( .A(des_in[0]), .Y(n73) );
  OAI21X1 U93 ( .A(n74), .B(n104), .C(n105), .Y(n1226) );
  AOI22X1 U94 ( .A(des_curr[0]), .B(n69), .C(des_curr[33]), .D(n70), .Y(n105)
         );
  INVX1 U95 ( .A(des_in[33]), .Y(n104) );
  OAI21X1 U96 ( .A(n74), .B(n106), .C(n107), .Y(n1225) );
  AOI22X1 U97 ( .A(des_curr[1]), .B(n69), .C(des_curr[34]), .D(n70), .Y(n107)
         );
  INVX1 U98 ( .A(des_in[34]), .Y(n106) );
  OAI21X1 U99 ( .A(n74), .B(n108), .C(n109), .Y(n1224) );
  AOI22X1 U100 ( .A(des_curr[2]), .B(n69), .C(des_curr[35]), .D(n70), .Y(n109)
         );
  INVX1 U101 ( .A(des_in[35]), .Y(n108) );
  OAI21X1 U102 ( .A(n74), .B(n110), .C(n111), .Y(n1223) );
  AOI22X1 U103 ( .A(des_curr[3]), .B(n69), .C(des_curr[36]), .D(n70), .Y(n111)
         );
  INVX1 U104 ( .A(des_in[36]), .Y(n110) );
  OAI21X1 U105 ( .A(n74), .B(n112), .C(n113), .Y(n1222) );
  AOI22X1 U106 ( .A(des_curr[4]), .B(n69), .C(des_curr[37]), .D(n70), .Y(n113)
         );
  INVX1 U107 ( .A(des_in[37]), .Y(n112) );
  OAI21X1 U108 ( .A(n74), .B(n114), .C(n115), .Y(n1221) );
  AOI22X1 U109 ( .A(des_curr[5]), .B(n69), .C(des_curr[38]), .D(n70), .Y(n115)
         );
  INVX1 U110 ( .A(des_in[38]), .Y(n114) );
  OAI21X1 U111 ( .A(n74), .B(n116), .C(n117), .Y(n1220) );
  AOI22X1 U112 ( .A(des_curr[6]), .B(n69), .C(des_curr[39]), .D(n70), .Y(n117)
         );
  INVX1 U113 ( .A(des_in[39]), .Y(n116) );
  OAI21X1 U114 ( .A(n74), .B(n118), .C(n119), .Y(n1219) );
  AOI22X1 U115 ( .A(des_curr[7]), .B(n69), .C(des_curr[40]), .D(n70), .Y(n119)
         );
  INVX1 U116 ( .A(des_in[40]), .Y(n118) );
  OAI21X1 U117 ( .A(n74), .B(n120), .C(n121), .Y(n1218) );
  AOI22X1 U118 ( .A(des_curr[8]), .B(n69), .C(des_curr[41]), .D(n70), .Y(n121)
         );
  INVX1 U119 ( .A(des_in[41]), .Y(n120) );
  OAI21X1 U120 ( .A(n74), .B(n122), .C(n123), .Y(n1217) );
  AOI22X1 U121 ( .A(des_curr[9]), .B(n69), .C(des_curr[42]), .D(n70), .Y(n123)
         );
  INVX1 U122 ( .A(des_in[42]), .Y(n122) );
  OAI21X1 U123 ( .A(n74), .B(n124), .C(n125), .Y(n1216) );
  AOI22X1 U124 ( .A(des_curr[10]), .B(n69), .C(des_curr[43]), .D(n70), .Y(n125) );
  INVX1 U125 ( .A(des_in[43]), .Y(n124) );
  OAI21X1 U126 ( .A(n74), .B(n126), .C(n127), .Y(n1215) );
  AOI22X1 U127 ( .A(des_curr[11]), .B(n69), .C(des_curr[44]), .D(n70), .Y(n127) );
  INVX1 U128 ( .A(des_in[44]), .Y(n126) );
  OAI21X1 U129 ( .A(n74), .B(n128), .C(n129), .Y(n1214) );
  AOI22X1 U130 ( .A(des_curr[12]), .B(n69), .C(des_curr[45]), .D(n70), .Y(n129) );
  INVX1 U131 ( .A(des_in[45]), .Y(n128) );
  OAI21X1 U132 ( .A(n74), .B(n130), .C(n131), .Y(n1213) );
  AOI22X1 U133 ( .A(des_curr[13]), .B(n69), .C(des_curr[46]), .D(n70), .Y(n131) );
  INVX1 U134 ( .A(des_in[46]), .Y(n130) );
  OAI21X1 U135 ( .A(n74), .B(n132), .C(n133), .Y(n1212) );
  AOI22X1 U136 ( .A(des_curr[14]), .B(n69), .C(des_curr[47]), .D(n70), .Y(n133) );
  INVX1 U137 ( .A(des_in[47]), .Y(n132) );
  OAI21X1 U138 ( .A(n74), .B(n134), .C(n135), .Y(n1211) );
  AOI22X1 U139 ( .A(des_curr[15]), .B(n69), .C(des_curr[48]), .D(n70), .Y(n135) );
  INVX1 U140 ( .A(des_in[48]), .Y(n134) );
  OAI21X1 U141 ( .A(n74), .B(n136), .C(n137), .Y(n1210) );
  AOI22X1 U142 ( .A(des_curr[16]), .B(n69), .C(des_curr[49]), .D(n70), .Y(n137) );
  INVX1 U143 ( .A(des_in[49]), .Y(n136) );
  OAI21X1 U144 ( .A(n74), .B(n138), .C(n139), .Y(n1209) );
  AOI22X1 U145 ( .A(des_curr[17]), .B(n69), .C(des_curr[50]), .D(n70), .Y(n139) );
  INVX1 U146 ( .A(des_in[50]), .Y(n138) );
  OAI21X1 U147 ( .A(n74), .B(n140), .C(n141), .Y(n1208) );
  AOI22X1 U148 ( .A(des_curr[18]), .B(n69), .C(des_curr[51]), .D(n70), .Y(n141) );
  INVX1 U149 ( .A(des_in[51]), .Y(n140) );
  OAI21X1 U150 ( .A(n74), .B(n142), .C(n143), .Y(n1207) );
  AOI22X1 U151 ( .A(des_curr[19]), .B(n69), .C(des_curr[52]), .D(n70), .Y(n143) );
  INVX1 U152 ( .A(des_in[52]), .Y(n142) );
  OAI21X1 U153 ( .A(n74), .B(n144), .C(n145), .Y(n1206) );
  AOI22X1 U154 ( .A(des_curr[20]), .B(n69), .C(des_curr[53]), .D(n70), .Y(n145) );
  INVX1 U155 ( .A(des_in[53]), .Y(n144) );
  OAI21X1 U156 ( .A(n74), .B(n146), .C(n147), .Y(n1205) );
  AOI22X1 U157 ( .A(des_curr[21]), .B(n69), .C(des_curr[54]), .D(n70), .Y(n147) );
  INVX1 U158 ( .A(des_in[54]), .Y(n146) );
  OAI21X1 U159 ( .A(n74), .B(n148), .C(n149), .Y(n1204) );
  AOI22X1 U160 ( .A(des_curr[22]), .B(n69), .C(des_curr[55]), .D(n70), .Y(n149) );
  INVX1 U161 ( .A(des_in[55]), .Y(n148) );
  OAI21X1 U162 ( .A(n74), .B(n150), .C(n151), .Y(n1203) );
  AOI22X1 U163 ( .A(des_curr[23]), .B(n69), .C(des_curr[56]), .D(n70), .Y(n151) );
  INVX1 U164 ( .A(des_in[56]), .Y(n150) );
  OAI21X1 U165 ( .A(n74), .B(n152), .C(n153), .Y(n1202) );
  AOI22X1 U166 ( .A(des_curr[24]), .B(n69), .C(des_curr[57]), .D(n70), .Y(n153) );
  INVX1 U167 ( .A(des_in[57]), .Y(n152) );
  OAI21X1 U168 ( .A(n74), .B(n154), .C(n155), .Y(n1201) );
  AOI22X1 U169 ( .A(des_curr[25]), .B(n69), .C(des_curr[58]), .D(n70), .Y(n155) );
  INVX1 U170 ( .A(des_in[58]), .Y(n154) );
  OAI21X1 U171 ( .A(n74), .B(n156), .C(n157), .Y(n1200) );
  AOI22X1 U172 ( .A(des_curr[26]), .B(n69), .C(des_curr[59]), .D(n70), .Y(n157) );
  INVX1 U173 ( .A(des_in[59]), .Y(n156) );
  OAI21X1 U174 ( .A(n74), .B(n158), .C(n159), .Y(n1199) );
  AOI22X1 U175 ( .A(des_curr[27]), .B(n69), .C(des_curr[60]), .D(n70), .Y(n159) );
  INVX1 U176 ( .A(des_in[60]), .Y(n158) );
  OAI21X1 U177 ( .A(n74), .B(n160), .C(n161), .Y(n1198) );
  AOI22X1 U178 ( .A(des_curr[28]), .B(n69), .C(des_curr[61]), .D(n70), .Y(n161) );
  INVX1 U179 ( .A(des_in[61]), .Y(n160) );
  OAI21X1 U180 ( .A(n74), .B(n162), .C(n163), .Y(n1197) );
  AOI22X1 U181 ( .A(des_curr[29]), .B(n69), .C(des_curr[62]), .D(n70), .Y(n163) );
  INVX1 U182 ( .A(des_in[62]), .Y(n162) );
  OAI21X1 U183 ( .A(n74), .B(n164), .C(n165), .Y(n1196) );
  AOI22X1 U184 ( .A(des_curr[30]), .B(n69), .C(des_curr[63]), .D(n70), .Y(n165) );
  INVX1 U185 ( .A(des_in[63]), .Y(n164) );
  OAI21X1 U186 ( .A(n74), .B(n166), .C(n167), .Y(n1195) );
  AOI22X1 U187 ( .A(n168), .B(n69), .C(des_curr[1]), .D(n70), .Y(n167) );
  XOR2X1 U188 ( .A(n169), .B(des_curr[34]), .Y(n168) );
  NAND3X1 U189 ( .A(n170), .B(n171), .C(n172), .Y(n169) );
  NOR2X1 U190 ( .A(n173), .B(n174), .Y(n172) );
  OAI22X1 U191 ( .A(n175), .B(n176), .C(n177), .D(n178), .Y(n174) );
  INVX1 U192 ( .A(n179), .Y(n178) );
  NAND3X1 U193 ( .A(n180), .B(n181), .C(n182), .Y(n173) );
  OAI21X1 U194 ( .A(n183), .B(n184), .C(n185), .Y(n182) );
  OAI21X1 U195 ( .A(n186), .B(n187), .C(n188), .Y(n181) );
  INVX1 U196 ( .A(n189), .Y(n186) );
  OAI21X1 U197 ( .A(n190), .B(n191), .C(n192), .Y(n180) );
  AOI21X1 U198 ( .A(n193), .B(n194), .C(n195), .Y(n171) );
  INVX1 U199 ( .A(des_in[1]), .Y(n166) );
  OAI21X1 U200 ( .A(n74), .B(n196), .C(n197), .Y(n1194) );
  AOI22X1 U201 ( .A(n198), .B(n69), .C(des_curr[2]), .D(n70), .Y(n197) );
  XNOR2X1 U202 ( .A(des_curr[35]), .B(n199), .Y(n198) );
  NOR2X1 U203 ( .A(n200), .B(n201), .Y(n199) );
  NAND3X1 U204 ( .A(n202), .B(n203), .C(n204), .Y(n201) );
  OAI21X1 U205 ( .A(n205), .B(n206), .C(n207), .Y(n203) );
  OAI21X1 U206 ( .A(n208), .B(n209), .C(n210), .Y(n202) );
  NAND2X1 U207 ( .A(n211), .B(n212), .Y(n209) );
  NAND3X1 U208 ( .A(n213), .B(n214), .C(n215), .Y(n200) );
  AND2X1 U209 ( .A(n216), .B(n217), .Y(n215) );
  OAI21X1 U210 ( .A(n218), .B(n219), .C(n220), .Y(n217) );
  OAI21X1 U211 ( .A(n221), .B(n222), .C(n223), .Y(n216) );
  INVX1 U212 ( .A(n224), .Y(n222) );
  INVX1 U213 ( .A(n225), .Y(n214) );
  OAI21X1 U214 ( .A(n226), .B(n206), .C(n227), .Y(n213) );
  INVX1 U215 ( .A(des_in[2]), .Y(n196) );
  OAI21X1 U216 ( .A(n74), .B(n228), .C(n229), .Y(n1193) );
  AOI22X1 U217 ( .A(n230), .B(n69), .C(des_curr[3]), .D(n70), .Y(n229) );
  XNOR2X1 U218 ( .A(des_curr[36]), .B(n231), .Y(n230) );
  NOR2X1 U219 ( .A(n232), .B(n233), .Y(n231) );
  NAND3X1 U220 ( .A(n234), .B(n235), .C(n236), .Y(n233) );
  NAND3X1 U221 ( .A(n237), .B(n238), .C(n239), .Y(n232) );
  INVX1 U222 ( .A(n240), .Y(n239) );
  OAI22X1 U223 ( .A(n241), .B(n242), .C(n243), .D(n244), .Y(n240) );
  OAI21X1 U224 ( .A(n245), .B(n246), .C(n247), .Y(n238) );
  OAI21X1 U225 ( .A(n248), .B(n249), .C(n250), .Y(n237) );
  INVX1 U226 ( .A(n251), .Y(n249) );
  INVX1 U227 ( .A(des_in[3]), .Y(n228) );
  OAI21X1 U228 ( .A(n74), .B(n252), .C(n253), .Y(n1192) );
  AOI22X1 U229 ( .A(n254), .B(n69), .C(des_curr[4]), .D(n70), .Y(n253) );
  XOR2X1 U230 ( .A(n255), .B(des_curr[37]), .Y(n254) );
  NAND2X1 U231 ( .A(n256), .B(n257), .Y(n255) );
  NOR2X1 U232 ( .A(n258), .B(n259), .Y(n257) );
  OAI21X1 U233 ( .A(n260), .B(n261), .C(n262), .Y(n259) );
  OAI21X1 U234 ( .A(n263), .B(n264), .C(n265), .Y(n262) );
  NAND3X1 U235 ( .A(n266), .B(n267), .C(n268), .Y(n258) );
  OAI21X1 U236 ( .A(n269), .B(n270), .C(n271), .Y(n268) );
  OAI21X1 U237 ( .A(n272), .B(n273), .C(n274), .Y(n267) );
  OAI21X1 U238 ( .A(n275), .B(n276), .C(n264), .Y(n266) );
  NOR2X1 U239 ( .A(n277), .B(n278), .Y(n256) );
  OAI21X1 U240 ( .A(n279), .B(n280), .C(n281), .Y(n278) );
  OAI21X1 U241 ( .A(n282), .B(n283), .C(n284), .Y(n277) );
  AOI22X1 U242 ( .A(n285), .B(n286), .C(n287), .D(n263), .Y(n284) );
  INVX1 U243 ( .A(n288), .Y(n283) );
  INVX1 U244 ( .A(des_in[4]), .Y(n252) );
  OAI21X1 U245 ( .A(n74), .B(n289), .C(n290), .Y(n1191) );
  AOI22X1 U246 ( .A(n291), .B(n69), .C(des_curr[5]), .D(n70), .Y(n290) );
  XOR2X1 U247 ( .A(n292), .B(des_curr[38]), .Y(n291) );
  NAND3X1 U248 ( .A(n293), .B(n294), .C(n295), .Y(n292) );
  NOR2X1 U249 ( .A(n296), .B(n297), .Y(n295) );
  OAI21X1 U250 ( .A(n298), .B(n299), .C(n300), .Y(n297) );
  OAI21X1 U251 ( .A(n301), .B(n302), .C(n303), .Y(n300) );
  INVX1 U252 ( .A(n304), .Y(n302) );
  NOR2X1 U253 ( .A(n305), .B(n306), .Y(n298) );
  NAND2X1 U254 ( .A(n307), .B(n308), .Y(n306) );
  OAI21X1 U255 ( .A(n309), .B(n310), .C(n311), .Y(n296) );
  OAI21X1 U256 ( .A(n312), .B(n313), .C(n314), .Y(n311) );
  AOI21X1 U257 ( .A(n315), .B(n316), .C(n317), .Y(n309) );
  AOI22X1 U258 ( .A(n318), .B(n319), .C(n320), .D(n321), .Y(n294) );
  AOI21X1 U259 ( .A(n322), .B(n323), .C(n324), .Y(n293) );
  INVX1 U260 ( .A(des_in[5]), .Y(n289) );
  OAI21X1 U261 ( .A(n74), .B(n325), .C(n326), .Y(n1190) );
  AOI22X1 U262 ( .A(n327), .B(n69), .C(des_curr[6]), .D(n70), .Y(n326) );
  XOR2X1 U263 ( .A(n328), .B(des_curr[39]), .Y(n327) );
  NAND3X1 U264 ( .A(n329), .B(n330), .C(n331), .Y(n328) );
  NOR2X1 U265 ( .A(n332), .B(n333), .Y(n331) );
  OAI22X1 U266 ( .A(n334), .B(n335), .C(n336), .D(n337), .Y(n333) );
  NAND3X1 U267 ( .A(n338), .B(n339), .C(n340), .Y(n332) );
  OAI21X1 U268 ( .A(n341), .B(n342), .C(n343), .Y(n340) );
  NAND2X1 U269 ( .A(n344), .B(n345), .Y(n342) );
  OAI21X1 U270 ( .A(n346), .B(n347), .C(n348), .Y(n339) );
  OAI21X1 U271 ( .A(n349), .B(n350), .C(n351), .Y(n338) );
  AOI22X1 U272 ( .A(n349), .B(n352), .C(n353), .D(n354), .Y(n330) );
  NOR2X1 U273 ( .A(n355), .B(n356), .Y(n329) );
  INVX1 U274 ( .A(des_in[6]), .Y(n325) );
  OAI21X1 U275 ( .A(n74), .B(n357), .C(n358), .Y(n1189) );
  AOI22X1 U276 ( .A(n359), .B(n69), .C(des_curr[7]), .D(n70), .Y(n358) );
  XOR2X1 U277 ( .A(n360), .B(des_curr[40]), .Y(n359) );
  NAND3X1 U278 ( .A(n361), .B(n362), .C(n363), .Y(n360) );
  NOR2X1 U279 ( .A(n364), .B(n365), .Y(n363) );
  OAI22X1 U280 ( .A(n366), .B(n367), .C(n368), .D(n369), .Y(n365) );
  OAI21X1 U281 ( .A(n370), .B(n371), .C(n372), .Y(n364) );
  AND2X1 U282 ( .A(n373), .B(n374), .Y(n372) );
  OAI21X1 U283 ( .A(n375), .B(n376), .C(n377), .Y(n374) );
  INVX1 U284 ( .A(n378), .Y(n375) );
  OAI21X1 U285 ( .A(n379), .B(n380), .C(n381), .Y(n373) );
  INVX1 U286 ( .A(n382), .Y(n380) );
  NOR2X1 U287 ( .A(n383), .B(n384), .Y(n362) );
  OAI22X1 U288 ( .A(n385), .B(n382), .C(n386), .D(n387), .Y(n384) );
  NOR2X1 U289 ( .A(n388), .B(n389), .Y(n361) );
  INVX1 U290 ( .A(des_in[7]), .Y(n357) );
  OAI21X1 U291 ( .A(n74), .B(n390), .C(n391), .Y(n1188) );
  AOI22X1 U292 ( .A(n392), .B(n69), .C(des_curr[8]), .D(n70), .Y(n391) );
  XOR2X1 U293 ( .A(n393), .B(des_curr[41]), .Y(n392) );
  NAND3X1 U294 ( .A(n394), .B(n204), .C(n395), .Y(n393) );
  NOR2X1 U295 ( .A(n396), .B(n397), .Y(n395) );
  OAI21X1 U296 ( .A(n398), .B(n399), .C(n400), .Y(n397) );
  OAI21X1 U297 ( .A(n401), .B(n402), .C(n223), .Y(n400) );
  NAND2X1 U298 ( .A(n403), .B(n404), .Y(n402) );
  NAND2X1 U299 ( .A(n405), .B(n406), .Y(n401) );
  INVX1 U300 ( .A(n407), .Y(n398) );
  OAI21X1 U301 ( .A(n408), .B(n409), .C(n410), .Y(n396) );
  INVX1 U302 ( .A(n411), .Y(n410) );
  NOR2X1 U303 ( .A(n412), .B(n208), .Y(n409) );
  NOR2X1 U304 ( .A(n413), .B(n414), .Y(n204) );
  OAI22X1 U305 ( .A(n415), .B(n416), .C(n408), .D(n417), .Y(n414) );
  OAI21X1 U306 ( .A(n418), .B(n419), .C(n420), .Y(n413) );
  INVX1 U307 ( .A(n421), .Y(n420) );
  AOI21X1 U308 ( .A(n422), .B(n423), .C(n424), .Y(n421) );
  AOI22X1 U309 ( .A(n425), .B(n220), .C(n226), .D(n426), .Y(n394) );
  INVX1 U310 ( .A(des_in[8]), .Y(n390) );
  OAI21X1 U311 ( .A(n74), .B(n427), .C(n428), .Y(n1187) );
  AOI22X1 U312 ( .A(n429), .B(n69), .C(des_curr[9]), .D(n70), .Y(n428) );
  XOR2X1 U313 ( .A(n430), .B(des_curr[42]), .Y(n429) );
  NAND3X1 U314 ( .A(n431), .B(n432), .C(n433), .Y(n430) );
  AOI21X1 U315 ( .A(n434), .B(n435), .C(n436), .Y(n433) );
  OAI21X1 U316 ( .A(n437), .B(n438), .C(n439), .Y(n436) );
  OAI21X1 U317 ( .A(n440), .B(n190), .C(n179), .Y(n439) );
  INVX1 U318 ( .A(n441), .Y(n440) );
  NOR2X1 U319 ( .A(n183), .B(n442), .Y(n438) );
  NAND3X1 U320 ( .A(n443), .B(n444), .C(n445), .Y(n434) );
  AOI22X1 U321 ( .A(n184), .B(n188), .C(n185), .D(n446), .Y(n431) );
  INVX1 U322 ( .A(n447), .Y(n184) );
  INVX1 U323 ( .A(des_in[9]), .Y(n427) );
  OAI21X1 U324 ( .A(n74), .B(n448), .C(n449), .Y(n1186) );
  AOI22X1 U325 ( .A(n450), .B(n69), .C(des_curr[10]), .D(n70), .Y(n449) );
  XNOR2X1 U326 ( .A(des_curr[43]), .B(n451), .Y(n450) );
  NOR2X1 U327 ( .A(n452), .B(n453), .Y(n451) );
  NAND3X1 U328 ( .A(n454), .B(n103), .C(n455), .Y(n453) );
  AOI22X1 U329 ( .A(n456), .B(n457), .C(n98), .D(n101), .Y(n455) );
  NOR2X1 U330 ( .A(n458), .B(n459), .Y(n103) );
  OAI22X1 U331 ( .A(n460), .B(n461), .C(n462), .D(n463), .Y(n459) );
  INVX1 U332 ( .A(n464), .Y(n463) );
  OAI21X1 U333 ( .A(n465), .B(n466), .C(n467), .Y(n458) );
  OAI21X1 U334 ( .A(n468), .B(n86), .C(n469), .Y(n467) );
  INVX1 U335 ( .A(n470), .Y(n454) );
  NAND3X1 U336 ( .A(n471), .B(n472), .C(n473), .Y(n452) );
  AND2X1 U337 ( .A(n474), .B(n475), .Y(n473) );
  OAI21X1 U338 ( .A(n86), .B(n476), .C(n99), .Y(n475) );
  OAI21X1 U339 ( .A(n477), .B(n100), .C(n88), .Y(n474) );
  OAI21X1 U340 ( .A(n97), .B(n464), .C(n96), .Y(n472) );
  OAI21X1 U341 ( .A(n478), .B(n94), .C(n469), .Y(n471) );
  INVX1 U342 ( .A(des_in[10]), .Y(n448) );
  OAI21X1 U343 ( .A(n74), .B(n479), .C(n480), .Y(n1185) );
  AOI22X1 U344 ( .A(n481), .B(n69), .C(des_curr[11]), .D(n70), .Y(n480) );
  XOR2X1 U345 ( .A(n482), .B(des_curr[44]), .Y(n481) );
  NAND3X1 U346 ( .A(n483), .B(n484), .C(n485), .Y(n482) );
  NOR2X1 U347 ( .A(n486), .B(n487), .Y(n485) );
  INVX1 U348 ( .A(n488), .Y(n487) );
  AOI22X1 U349 ( .A(n489), .B(n317), .C(n490), .D(n321), .Y(n488) );
  NAND3X1 U350 ( .A(n491), .B(n492), .C(n493), .Y(n486) );
  OAI21X1 U351 ( .A(n494), .B(n495), .C(n303), .Y(n493) );
  OAI21X1 U352 ( .A(n301), .B(n496), .C(n497), .Y(n491) );
  AOI22X1 U353 ( .A(n313), .B(n498), .C(n312), .D(n499), .Y(n484) );
  AOI21X1 U354 ( .A(n500), .B(n323), .C(n324), .Y(n483) );
  OR2X1 U355 ( .A(n501), .B(n502), .Y(n324) );
  OAI21X1 U356 ( .A(n503), .B(n504), .C(n505), .Y(n502) );
  OAI21X1 U357 ( .A(n496), .B(n495), .C(n321), .Y(n505) );
  NAND2X1 U358 ( .A(n506), .B(n307), .Y(n495) );
  INVX1 U359 ( .A(n308), .Y(n496) );
  NOR2X1 U360 ( .A(n317), .B(n507), .Y(n503) );
  NAND2X1 U361 ( .A(n508), .B(n509), .Y(n507) );
  NAND3X1 U362 ( .A(n510), .B(n511), .C(n512), .Y(n501) );
  OAI21X1 U363 ( .A(n500), .B(n513), .C(n499), .Y(n512) );
  OAI21X1 U364 ( .A(n494), .B(n514), .C(n498), .Y(n511) );
  NAND2X1 U365 ( .A(n299), .B(n310), .Y(n498) );
  OAI21X1 U366 ( .A(n305), .B(n490), .C(n497), .Y(n510) );
  NAND2X1 U367 ( .A(n304), .B(n515), .Y(n490) );
  INVX1 U368 ( .A(n516), .Y(n305) );
  INVX1 U369 ( .A(des_in[11]), .Y(n479) );
  OAI21X1 U370 ( .A(n74), .B(n517), .C(n518), .Y(n1184) );
  AOI22X1 U371 ( .A(n519), .B(n69), .C(des_curr[12]), .D(n70), .Y(n518) );
  XNOR2X1 U372 ( .A(des_curr[45]), .B(n520), .Y(n519) );
  NOR2X1 U373 ( .A(n521), .B(n522), .Y(n520) );
  NAND3X1 U374 ( .A(n523), .B(n524), .C(n525), .Y(n522) );
  AOI22X1 U375 ( .A(n526), .B(n353), .C(n347), .D(n351), .Y(n525) );
  INVX1 U376 ( .A(n355), .Y(n524) );
  OAI21X1 U377 ( .A(n344), .B(n527), .C(n528), .Y(n355) );
  AOI22X1 U378 ( .A(n353), .B(n529), .C(n346), .D(n351), .Y(n528) );
  NAND3X1 U379 ( .A(n530), .B(n531), .C(n532), .Y(n521) );
  AOI22X1 U380 ( .A(n341), .B(n533), .C(n534), .D(n352), .Y(n532) );
  NAND2X1 U381 ( .A(n535), .B(n536), .Y(n341) );
  OAI21X1 U382 ( .A(n529), .B(n354), .C(n343), .Y(n531) );
  OAI21X1 U383 ( .A(n537), .B(n538), .C(n348), .Y(n530) );
  INVX1 U384 ( .A(des_in[12]), .Y(n517) );
  OAI21X1 U385 ( .A(n74), .B(n539), .C(n540), .Y(n1183) );
  AOI22X1 U386 ( .A(n541), .B(n69), .C(des_curr[13]), .D(n70), .Y(n540) );
  XOR2X1 U387 ( .A(n542), .B(des_curr[46]), .Y(n541) );
  NAND3X1 U388 ( .A(n543), .B(n544), .C(n545), .Y(n542) );
  NOR2X1 U389 ( .A(n546), .B(n547), .Y(n545) );
  OAI21X1 U390 ( .A(n548), .B(n241), .C(n549), .Y(n547) );
  OAI21X1 U391 ( .A(n550), .B(n551), .C(n552), .Y(n549) );
  INVX1 U392 ( .A(n553), .Y(n550) );
  OAI21X1 U393 ( .A(n554), .B(n555), .C(n556), .Y(n546) );
  OAI21X1 U394 ( .A(n248), .B(n557), .C(n247), .Y(n556) );
  INVX1 U395 ( .A(n250), .Y(n555) );
  AND2X1 U396 ( .A(n558), .B(n559), .Y(n554) );
  AND2X1 U397 ( .A(n235), .B(n560), .Y(n543) );
  NOR2X1 U398 ( .A(n561), .B(n562), .Y(n235) );
  INVX1 U399 ( .A(n563), .Y(n562) );
  AOI21X1 U400 ( .A(n564), .B(n250), .C(n565), .Y(n563) );
  NAND3X1 U401 ( .A(n566), .B(n567), .C(n568), .Y(n561) );
  OAI21X1 U402 ( .A(n569), .B(n570), .C(n552), .Y(n568) );
  OAI21X1 U403 ( .A(n571), .B(n572), .C(n573), .Y(n570) );
  OAI21X1 U404 ( .A(n574), .B(n245), .C(n575), .Y(n567) );
  OAI21X1 U405 ( .A(n576), .B(n577), .C(n247), .Y(n566) );
  INVX1 U406 ( .A(n578), .Y(n577) );
  INVX1 U407 ( .A(des_in[13]), .Y(n539) );
  OAI21X1 U408 ( .A(n74), .B(n579), .C(n580), .Y(n1182) );
  AOI22X1 U409 ( .A(n581), .B(n69), .C(des_curr[14]), .D(n70), .Y(n580) );
  XOR2X1 U410 ( .A(n582), .B(des_curr[47]), .Y(n581) );
  NAND2X1 U411 ( .A(n583), .B(n584), .Y(n582) );
  NOR2X1 U412 ( .A(n585), .B(n586), .Y(n584) );
  OAI21X1 U413 ( .A(n587), .B(n588), .C(n589), .Y(n586) );
  OAI21X1 U414 ( .A(n590), .B(n272), .C(n263), .Y(n589) );
  NOR2X1 U415 ( .A(n287), .B(n591), .Y(n588) );
  NAND3X1 U416 ( .A(n592), .B(n593), .C(n594), .Y(n585) );
  OAI21X1 U417 ( .A(n595), .B(n270), .C(n288), .Y(n594) );
  NAND2X1 U418 ( .A(n596), .B(n597), .Y(n270) );
  OAI21X1 U419 ( .A(n285), .B(n598), .C(n599), .Y(n592) );
  INVX1 U420 ( .A(n600), .Y(n285) );
  NOR2X1 U421 ( .A(n601), .B(n602), .Y(n583) );
  OAI21X1 U422 ( .A(n603), .B(n604), .C(n605), .Y(n602) );
  OAI21X1 U423 ( .A(n260), .B(n606), .C(n607), .Y(n601) );
  OAI21X1 U424 ( .A(n608), .B(n609), .C(n286), .Y(n607) );
  NAND2X1 U425 ( .A(n610), .B(n280), .Y(n609) );
  NOR2X1 U426 ( .A(n263), .B(n599), .Y(n260) );
  INVX1 U427 ( .A(des_in[14]), .Y(n579) );
  OAI21X1 U428 ( .A(n74), .B(n611), .C(n612), .Y(n1181) );
  AOI22X1 U429 ( .A(n613), .B(n69), .C(des_curr[15]), .D(n70), .Y(n612) );
  XOR2X1 U430 ( .A(n614), .B(des_curr[48]), .Y(n613) );
  NAND3X1 U431 ( .A(n615), .B(n616), .C(n617), .Y(n614) );
  NOR2X1 U432 ( .A(n618), .B(n619), .Y(n617) );
  OAI21X1 U433 ( .A(n620), .B(n444), .C(n621), .Y(n619) );
  INVX1 U434 ( .A(n195), .Y(n621) );
  OAI21X1 U435 ( .A(n622), .B(n623), .C(n624), .Y(n195) );
  AOI22X1 U436 ( .A(n625), .B(n435), .C(n194), .D(n446), .Y(n624) );
  OAI21X1 U437 ( .A(n626), .B(n627), .C(n628), .Y(n625) );
  INVX1 U438 ( .A(n629), .Y(n628) );
  INVX1 U439 ( .A(n432), .Y(n618) );
  NOR2X1 U440 ( .A(n630), .B(n631), .Y(n432) );
  OAI22X1 U441 ( .A(n622), .B(n632), .C(n437), .D(n177), .Y(n631) );
  OAI21X1 U442 ( .A(n175), .B(n633), .C(n634), .Y(n630) );
  OAI21X1 U443 ( .A(n629), .B(n635), .C(n194), .Y(n634) );
  AND2X1 U444 ( .A(n636), .B(n637), .Y(n616) );
  OAI21X1 U445 ( .A(n638), .B(n639), .C(n188), .Y(n637) );
  INVX1 U446 ( .A(n640), .Y(n638) );
  OAI21X1 U447 ( .A(n641), .B(n442), .C(n179), .Y(n636) );
  NAND2X1 U448 ( .A(n632), .B(n642), .Y(n442) );
  INVX1 U449 ( .A(n187), .Y(n632) );
  AOI22X1 U450 ( .A(n635), .B(n435), .C(n183), .D(n643), .Y(n615) );
  INVX1 U451 ( .A(n644), .Y(n183) );
  NAND2X1 U452 ( .A(n645), .B(n189), .Y(n635) );
  NAND2X1 U453 ( .A(n646), .B(n647), .Y(n189) );
  INVX1 U454 ( .A(des_in[15]), .Y(n611) );
  OAI21X1 U455 ( .A(n74), .B(n648), .C(n649), .Y(n1180) );
  AOI22X1 U456 ( .A(n650), .B(n69), .C(des_curr[16]), .D(n70), .Y(n649) );
  XOR2X1 U457 ( .A(n651), .B(des_curr[49]), .Y(n650) );
  NAND2X1 U458 ( .A(n652), .B(n653), .Y(n651) );
  NOR2X1 U459 ( .A(n654), .B(n655), .Y(n653) );
  OAI21X1 U460 ( .A(n403), .B(n416), .C(n656), .Y(n655) );
  OAI21X1 U461 ( .A(n412), .B(n657), .C(n210), .Y(n656) );
  AND2X1 U462 ( .A(n658), .B(n415), .Y(n403) );
  OAI21X1 U463 ( .A(n424), .B(n659), .C(n660), .Y(n654) );
  OAI21X1 U464 ( .A(n657), .B(n221), .C(n661), .Y(n660) );
  INVX1 U465 ( .A(n662), .Y(n221) );
  NOR2X1 U466 ( .A(n218), .B(n206), .Y(n659) );
  NAND2X1 U467 ( .A(n406), .B(n663), .Y(n206) );
  INVX1 U468 ( .A(n405), .Y(n218) );
  NOR2X1 U469 ( .A(n664), .B(n665), .Y(n652) );
  OAI21X1 U470 ( .A(n419), .B(n666), .C(n667), .Y(n665) );
  OAI21X1 U471 ( .A(n668), .B(n669), .C(n227), .Y(n667) );
  INVX1 U472 ( .A(n408), .Y(n227) );
  NAND2X1 U473 ( .A(n404), .B(n405), .Y(n669) );
  NAND3X1 U474 ( .A(n212), .B(n422), .C(n224), .Y(n668) );
  INVX1 U475 ( .A(n207), .Y(n419) );
  INVX1 U476 ( .A(des_in[16]), .Y(n648) );
  OAI21X1 U477 ( .A(n74), .B(n670), .C(n671), .Y(n1179) );
  AOI22X1 U478 ( .A(n672), .B(n69), .C(des_curr[17]), .D(n70), .Y(n671) );
  XOR2X1 U479 ( .A(n673), .B(des_curr[50]), .Y(n672) );
  NAND3X1 U480 ( .A(n674), .B(n675), .C(n676), .Y(n673) );
  NOR2X1 U481 ( .A(n677), .B(n678), .Y(n676) );
  OAI21X1 U482 ( .A(n679), .B(n680), .C(n681), .Y(n678) );
  OAI21X1 U483 ( .A(n301), .B(n317), .C(n303), .Y(n681) );
  INVX1 U484 ( .A(n682), .Y(n317) );
  NOR2X1 U485 ( .A(n494), .B(n683), .Y(n679) );
  OAI21X1 U486 ( .A(n684), .B(n685), .C(n308), .Y(n677) );
  NOR2X1 U487 ( .A(n313), .B(n500), .Y(n685) );
  AOI22X1 U488 ( .A(n686), .B(n323), .C(n318), .D(n497), .Y(n675) );
  INVX1 U489 ( .A(n687), .Y(n674) );
  OAI21X1 U490 ( .A(n492), .B(n688), .C(n689), .Y(n687) );
  INVX1 U491 ( .A(des_in[17]), .Y(n670) );
  OAI21X1 U492 ( .A(n74), .B(n690), .C(n691), .Y(n1178) );
  AOI22X1 U493 ( .A(n692), .B(n69), .C(des_curr[18]), .D(n70), .Y(n691) );
  XOR2X1 U494 ( .A(n693), .B(des_curr[51]), .Y(n692) );
  NAND3X1 U495 ( .A(n694), .B(n695), .C(n696), .Y(n693) );
  NOR2X1 U496 ( .A(n697), .B(n698), .Y(n696) );
  OAI22X1 U497 ( .A(n368), .B(n699), .C(n700), .D(n701), .Y(n698) );
  NOR2X1 U498 ( .A(n377), .B(n381), .Y(n368) );
  NAND3X1 U499 ( .A(n702), .B(n703), .C(n704), .Y(n697) );
  OAI21X1 U500 ( .A(n705), .B(n706), .C(n707), .Y(n704) );
  NAND2X1 U501 ( .A(n367), .B(n708), .Y(n706) );
  OAI21X1 U502 ( .A(n709), .B(n710), .C(n711), .Y(n702) );
  AOI22X1 U503 ( .A(n712), .B(n377), .C(n713), .D(n381), .Y(n695) );
  NOR2X1 U504 ( .A(n383), .B(n714), .Y(n694) );
  OAI22X1 U505 ( .A(n715), .B(n716), .C(n717), .D(n718), .Y(n383) );
  INVX1 U506 ( .A(des_in[18]), .Y(n690) );
  OAI21X1 U507 ( .A(n74), .B(n719), .C(n720), .Y(n1177) );
  AOI22X1 U508 ( .A(n721), .B(n69), .C(des_curr[19]), .D(n70), .Y(n720) );
  XNOR2X1 U509 ( .A(des_curr[52]), .B(n722), .Y(n721) );
  NOR2X1 U510 ( .A(n723), .B(n724), .Y(n722) );
  NAND3X1 U511 ( .A(n725), .B(n281), .C(n726), .Y(n724) );
  AOI22X1 U512 ( .A(n275), .B(n274), .C(n288), .D(n727), .Y(n726) );
  INVX1 U513 ( .A(n280), .Y(n727) );
  OR2X1 U514 ( .A(n286), .B(n288), .Y(n274) );
  NOR2X1 U515 ( .A(n728), .B(n729), .Y(n281) );
  OAI22X1 U516 ( .A(n730), .B(n280), .C(n279), .D(n604), .Y(n729) );
  OAI21X1 U517 ( .A(n587), .B(n593), .C(n731), .Y(n728) );
  AOI22X1 U518 ( .A(n732), .B(n264), .C(n286), .D(n598), .Y(n731) );
  INVX1 U519 ( .A(n282), .Y(n598) );
  NAND3X1 U520 ( .A(n733), .B(n734), .C(n735), .Y(n723) );
  AND2X1 U521 ( .A(n736), .B(n737), .Y(n735) );
  OAI21X1 U522 ( .A(n269), .B(n273), .C(n264), .Y(n737) );
  OAI21X1 U523 ( .A(n272), .B(n276), .C(n271), .Y(n736) );
  OAI21X1 U524 ( .A(n265), .B(n287), .C(n286), .Y(n734) );
  OAI21X1 U525 ( .A(n738), .B(n732), .C(n263), .Y(n733) );
  NAND2X1 U526 ( .A(n606), .B(n739), .Y(n732) );
  INVX1 U527 ( .A(n604), .Y(n738) );
  INVX1 U528 ( .A(des_in[19]), .Y(n719) );
  OAI21X1 U529 ( .A(n74), .B(n740), .C(n741), .Y(n1176) );
  AOI22X1 U530 ( .A(n742), .B(n69), .C(des_curr[20]), .D(n70), .Y(n741) );
  XOR2X1 U531 ( .A(n743), .B(des_curr[53]), .Y(n742) );
  NAND3X1 U532 ( .A(n744), .B(n745), .C(n746), .Y(n743) );
  NOR2X1 U533 ( .A(n747), .B(n748), .Y(n746) );
  OAI22X1 U534 ( .A(n462), .B(n749), .C(n750), .D(n751), .Y(n748) );
  INVX1 U535 ( .A(n457), .Y(n749) );
  NAND2X1 U536 ( .A(n752), .B(n753), .Y(n457) );
  OAI21X1 U537 ( .A(n465), .B(n461), .C(n754), .Y(n747) );
  OAI21X1 U538 ( .A(n94), .B(n464), .C(n88), .Y(n754) );
  OAI21X1 U539 ( .A(n755), .B(n756), .C(n757), .Y(n464) );
  INVX1 U540 ( .A(n101), .Y(n461) );
  AOI22X1 U541 ( .A(n456), .B(n758), .C(n100), .D(n96), .Y(n745) );
  NOR2X1 U542 ( .A(n470), .B(n759), .Y(n744) );
  OAI21X1 U543 ( .A(n460), .B(n466), .C(n760), .Y(n470) );
  AOI22X1 U544 ( .A(n761), .B(n96), .C(n101), .D(n758), .Y(n760) );
  NAND2X1 U545 ( .A(n762), .B(n89), .Y(n761) );
  INVX1 U546 ( .A(n763), .Y(n89) );
  INVX1 U547 ( .A(n88), .Y(n466) );
  INVX1 U548 ( .A(des_in[20]), .Y(n740) );
  OAI21X1 U549 ( .A(n74), .B(n764), .C(n765), .Y(n1175) );
  AOI22X1 U550 ( .A(n766), .B(n69), .C(des_curr[21]), .D(n70), .Y(n765) );
  XOR2X1 U551 ( .A(n767), .B(des_curr[54]), .Y(n766) );
  NAND3X1 U552 ( .A(n768), .B(n769), .C(n770), .Y(n767) );
  AOI21X1 U553 ( .A(n575), .B(n771), .C(n772), .Y(n770) );
  OAI21X1 U554 ( .A(n773), .B(n774), .C(n775), .Y(n772) );
  OAI21X1 U555 ( .A(n576), .B(n569), .C(n250), .Y(n775) );
  NOR2X1 U556 ( .A(n245), .B(n564), .Y(n773) );
  NAND3X1 U557 ( .A(n578), .B(n776), .C(n573), .Y(n771) );
  INVX1 U558 ( .A(n777), .Y(n776) );
  AOI21X1 U559 ( .A(n552), .B(n246), .C(n565), .Y(n768) );
  NAND2X1 U560 ( .A(n778), .B(n779), .Y(n565) );
  AOI22X1 U561 ( .A(n248), .B(n552), .C(n780), .D(n575), .Y(n779) );
  AOI22X1 U562 ( .A(n781), .B(n250), .C(n247), .D(n777), .Y(n778) );
  OR2X1 U563 ( .A(n551), .B(n782), .Y(n246) );
  INVX1 U564 ( .A(des_in[21]), .Y(n764) );
  OAI21X1 U565 ( .A(n74), .B(n783), .C(n784), .Y(n1174) );
  AOI22X1 U566 ( .A(n785), .B(n69), .C(des_curr[22]), .D(n70), .Y(n784) );
  XOR2X1 U567 ( .A(n786), .B(des_curr[55]), .Y(n785) );
  NAND3X1 U568 ( .A(n787), .B(n523), .C(n788), .Y(n786) );
  NOR2X1 U569 ( .A(n789), .B(n790), .Y(n788) );
  OAI22X1 U570 ( .A(n791), .B(n527), .C(n334), .D(n792), .Y(n790) );
  OAI21X1 U571 ( .A(n793), .B(n794), .C(n795), .Y(n789) );
  OAI21X1 U572 ( .A(n534), .B(n796), .C(n353), .Y(n795) );
  NOR2X1 U573 ( .A(n346), .B(n797), .Y(n794) );
  INVX1 U574 ( .A(n798), .Y(n523) );
  OAI21X1 U575 ( .A(n793), .B(n799), .C(n800), .Y(n798) );
  AOI22X1 U576 ( .A(n801), .B(n802), .C(n537), .D(n351), .Y(n800) );
  NAND3X1 U577 ( .A(n803), .B(n345), .C(n804), .Y(n802) );
  AOI21X1 U578 ( .A(n805), .B(n806), .C(n526), .Y(n804) );
  INVX1 U579 ( .A(n534), .Y(n345) );
  NOR2X1 U580 ( .A(n807), .B(n806), .Y(n534) );
  AOI22X1 U581 ( .A(n808), .B(n343), .C(n351), .D(n354), .Y(n787) );
  INVX1 U582 ( .A(n809), .Y(n343) );
  INVX1 U583 ( .A(des_in[22]), .Y(n783) );
  OAI21X1 U584 ( .A(n74), .B(n810), .C(n811), .Y(n1173) );
  AOI22X1 U585 ( .A(n812), .B(n69), .C(des_curr[23]), .D(n70), .Y(n811) );
  XOR2X1 U586 ( .A(n813), .B(des_curr[56]), .Y(n812) );
  NAND3X1 U587 ( .A(n170), .B(n814), .C(n815), .Y(n813) );
  NOR2X1 U588 ( .A(n816), .B(n817), .Y(n815) );
  OAI21X1 U589 ( .A(n818), .B(n645), .C(n819), .Y(n817) );
  OAI21X1 U590 ( .A(n629), .B(n191), .C(n643), .Y(n819) );
  NAND2X1 U591 ( .A(n642), .B(n645), .Y(n191) );
  NAND2X1 U592 ( .A(n820), .B(n626), .Y(n642) );
  NOR2X1 U593 ( .A(n821), .B(n822), .Y(n629) );
  NAND2X1 U594 ( .A(n823), .B(n824), .Y(n645) );
  INVX1 U595 ( .A(n194), .Y(n818) );
  OR2X1 U596 ( .A(n825), .B(n826), .Y(n816) );
  OAI21X1 U597 ( .A(n620), .B(n827), .C(n828), .Y(n826) );
  OAI21X1 U598 ( .A(n446), .B(n829), .C(n188), .Y(n828) );
  NAND2X1 U599 ( .A(n437), .B(n620), .Y(n188) );
  INVX1 U600 ( .A(n444), .Y(n829) );
  NAND2X1 U601 ( .A(n646), .B(n823), .Y(n444) );
  INVX1 U602 ( .A(n176), .Y(n446) );
  NAND3X1 U603 ( .A(n830), .B(n626), .C(n647), .Y(n176) );
  OAI21X1 U604 ( .A(n646), .B(n824), .C(n647), .Y(n827) );
  INVX1 U605 ( .A(n185), .Y(n620) );
  AOI21X1 U606 ( .A(n445), .B(n447), .C(n437), .Y(n825) );
  NAND3X1 U607 ( .A(n831), .B(n832), .C(n833), .Y(n447) );
  AND2X1 U608 ( .A(n834), .B(n830), .Y(n833) );
  INVX1 U609 ( .A(n835), .Y(n445) );
  NAND3X1 U610 ( .A(n177), .B(n640), .C(n644), .Y(n835) );
  NAND3X1 U611 ( .A(n836), .B(n834), .C(n824), .Y(n644) );
  NAND3X1 U612 ( .A(n831), .B(n830), .C(n647), .Y(n177) );
  AOI22X1 U613 ( .A(n179), .B(n837), .C(n187), .D(n435), .Y(n814) );
  NOR2X1 U614 ( .A(n821), .B(n830), .Y(n187) );
  NAND3X1 U615 ( .A(n626), .B(n834), .C(n832), .Y(n821) );
  INVX1 U616 ( .A(n443), .Y(n837) );
  NOR2X1 U617 ( .A(n190), .B(n193), .Y(n443) );
  INVX1 U618 ( .A(n838), .Y(n193) );
  INVX1 U619 ( .A(n623), .Y(n190) );
  NAND3X1 U620 ( .A(n830), .B(n626), .C(n823), .Y(n623) );
  NOR2X1 U621 ( .A(n839), .B(n840), .Y(n170) );
  INVX1 U622 ( .A(n841), .Y(n840) );
  AOI22X1 U623 ( .A(n435), .B(n639), .C(n643), .D(n641), .Y(n841) );
  INVX1 U624 ( .A(n633), .Y(n641) );
  NAND2X1 U625 ( .A(n824), .B(n647), .Y(n633) );
  NOR2X1 U626 ( .A(n834), .B(n832), .Y(n647) );
  NAND2X1 U627 ( .A(n838), .B(n441), .Y(n639) );
  NAND3X1 U628 ( .A(n831), .B(n830), .C(n823), .Y(n441) );
  NOR2X1 U629 ( .A(n834), .B(n836), .Y(n823) );
  NAND3X1 U630 ( .A(n832), .B(n834), .C(n824), .Y(n838) );
  NOR2X1 U631 ( .A(n626), .B(n830), .Y(n824) );
  INVX1 U632 ( .A(n175), .Y(n435) );
  NOR2X1 U633 ( .A(n643), .B(n185), .Y(n175) );
  NOR2X1 U634 ( .A(n842), .B(n843), .Y(n185) );
  OAI21X1 U635 ( .A(n622), .B(n640), .C(n844), .Y(n839) );
  NAND3X1 U636 ( .A(n831), .B(n192), .C(n820), .Y(n844) );
  INVX1 U637 ( .A(n627), .Y(n820) );
  NAND3X1 U638 ( .A(n830), .B(n834), .C(n836), .Y(n627) );
  INVX1 U639 ( .A(n437), .Y(n192) );
  NOR2X1 U640 ( .A(n194), .B(n179), .Y(n437) );
  NOR2X1 U641 ( .A(n842), .B(n845), .Y(n179) );
  NOR2X1 U642 ( .A(n843), .B(n846), .Y(n194) );
  NAND3X1 U643 ( .A(n836), .B(n834), .C(n646), .Y(n640) );
  NOR2X1 U644 ( .A(n830), .B(n831), .Y(n646) );
  INVX1 U645 ( .A(n626), .Y(n831) );
  XOR2X1 U646 ( .A(des_curr[29]), .B(subkey[44]), .Y(n626) );
  INVX1 U647 ( .A(n822), .Y(n830) );
  XNOR2X1 U648 ( .A(des_curr[30]), .B(subkey[45]), .Y(n822) );
  XOR2X1 U649 ( .A(des_curr[31]), .B(subkey[46]), .Y(n834) );
  INVX1 U650 ( .A(n832), .Y(n836) );
  XOR2X1 U651 ( .A(des_curr[0]), .B(subkey[47]), .Y(n832) );
  INVX1 U652 ( .A(n643), .Y(n622) );
  NOR2X1 U653 ( .A(n845), .B(n846), .Y(n643) );
  INVX1 U654 ( .A(n842), .Y(n846) );
  XOR2X1 U655 ( .A(des_curr[27]), .B(subkey[42]), .Y(n842) );
  INVX1 U656 ( .A(n843), .Y(n845) );
  XOR2X1 U657 ( .A(des_curr[28]), .B(subkey[43]), .Y(n843) );
  INVX1 U658 ( .A(des_in[23]), .Y(n810) );
  OAI21X1 U659 ( .A(n74), .B(n847), .C(n848), .Y(n1172) );
  AOI22X1 U660 ( .A(n849), .B(n69), .C(des_curr[24]), .D(n70), .Y(n848) );
  XOR2X1 U661 ( .A(n850), .B(des_curr[57]), .Y(n849) );
  NAND3X1 U662 ( .A(n851), .B(n852), .C(n853), .Y(n850) );
  NOR2X1 U663 ( .A(n854), .B(n855), .Y(n853) );
  OAI21X1 U664 ( .A(n385), .B(n856), .C(n857), .Y(n855) );
  OAI21X1 U665 ( .A(n379), .B(n858), .C(n859), .Y(n857) );
  NAND2X1 U666 ( .A(n860), .B(n367), .Y(n858) );
  INVX1 U667 ( .A(n861), .Y(n379) );
  INVX1 U668 ( .A(n707), .Y(n385) );
  NAND3X1 U669 ( .A(n862), .B(n863), .C(n864), .Y(n854) );
  OAI21X1 U670 ( .A(n865), .B(n866), .C(n867), .Y(n864) );
  INVX1 U671 ( .A(n701), .Y(n865) );
  OAI21X1 U672 ( .A(n866), .B(n705), .C(n377), .Y(n863) );
  INVX1 U673 ( .A(n868), .Y(n705) );
  OAI21X1 U674 ( .A(n710), .B(n713), .C(n711), .Y(n862) );
  AOI21X1 U675 ( .A(n869), .B(n381), .C(n870), .Y(n852) );
  OAI22X1 U676 ( .A(n700), .B(n382), .C(n370), .D(n378), .Y(n870) );
  NOR2X1 U677 ( .A(n711), .B(n707), .Y(n370) );
  NOR2X1 U678 ( .A(n867), .B(n859), .Y(n700) );
  NOR2X1 U679 ( .A(n388), .B(n871), .Y(n851) );
  NAND2X1 U680 ( .A(n872), .B(n873), .Y(n388) );
  AOI21X1 U681 ( .A(n707), .B(n709), .C(n874), .Y(n873) );
  OAI21X1 U682 ( .A(n875), .B(n701), .C(n703), .Y(n874) );
  OR2X1 U683 ( .A(n386), .B(n876), .Y(n703) );
  AOI22X1 U684 ( .A(n877), .B(n867), .C(n376), .D(n711), .Y(n872) );
  INVX1 U685 ( .A(des_in[24]), .Y(n847) );
  OAI21X1 U686 ( .A(n74), .B(n878), .C(n879), .Y(n1171) );
  AOI22X1 U687 ( .A(n880), .B(n69), .C(des_curr[25]), .D(n70), .Y(n879) );
  XOR2X1 U688 ( .A(n881), .B(des_curr[58]), .Y(n880) );
  NAND3X1 U689 ( .A(n882), .B(n883), .C(n884), .Y(n881) );
  NOR2X1 U690 ( .A(n759), .B(n885), .Y(n884) );
  OAI21X1 U691 ( .A(n886), .B(n752), .C(n79), .Y(n885) );
  INVX1 U692 ( .A(n887), .Y(n79) );
  OAI21X1 U693 ( .A(n462), .B(n460), .C(n888), .Y(n887) );
  AOI22X1 U694 ( .A(n758), .B(n96), .C(n469), .D(n763), .Y(n888) );
  NOR2X1 U695 ( .A(n889), .B(n890), .Y(n763) );
  INVX1 U696 ( .A(n886), .Y(n96) );
  INVX1 U697 ( .A(n891), .Y(n758) );
  NAND3X1 U698 ( .A(n892), .B(n893), .C(n894), .Y(n891) );
  NOR2X1 U699 ( .A(n97), .B(n468), .Y(n752) );
  INVX1 U700 ( .A(n895), .Y(n468) );
  NAND3X1 U701 ( .A(n890), .B(n896), .C(n897), .Y(n895) );
  INVX1 U702 ( .A(n898), .Y(n97) );
  NAND3X1 U703 ( .A(n899), .B(n755), .C(n897), .Y(n898) );
  OR2X1 U704 ( .A(n900), .B(n901), .Y(n759) );
  OAI21X1 U705 ( .A(n465), .B(n84), .C(n902), .Y(n901) );
  OAI21X1 U706 ( .A(n98), .B(n477), .C(n99), .Y(n902) );
  OAI21X1 U707 ( .A(n886), .B(n903), .C(n904), .Y(n900) );
  OAI21X1 U708 ( .A(n905), .B(n906), .C(n469), .Y(n904) );
  INVX1 U709 ( .A(n460), .Y(n906) );
  NAND3X1 U710 ( .A(n896), .B(n755), .C(n897), .Y(n460) );
  AOI21X1 U711 ( .A(n907), .B(n890), .C(n86), .Y(n903) );
  NOR2X1 U712 ( .A(n908), .B(n909), .Y(n86) );
  INVX1 U713 ( .A(n756), .Y(n907) );
  NOR2X1 U714 ( .A(n469), .B(n101), .Y(n886) );
  INVX1 U715 ( .A(n751), .Y(n469) );
  NAND2X1 U716 ( .A(n910), .B(n911), .Y(n751) );
  AND2X1 U717 ( .A(n912), .B(n913), .Y(n883) );
  OAI21X1 U718 ( .A(n94), .B(n100), .C(n99), .Y(n913) );
  INVX1 U719 ( .A(n462), .Y(n99) );
  NOR2X1 U720 ( .A(n88), .B(n456), .Y(n462) );
  NOR2X1 U721 ( .A(n914), .B(n755), .Y(n100) );
  INVX1 U722 ( .A(n90), .Y(n94) );
  NAND3X1 U723 ( .A(n893), .B(n909), .C(n894), .Y(n90) );
  OAI21X1 U724 ( .A(n905), .B(n476), .C(n456), .Y(n912) );
  INVX1 U725 ( .A(n84), .Y(n456) );
  NAND2X1 U726 ( .A(n915), .B(n911), .Y(n84) );
  INVX1 U727 ( .A(n757), .Y(n905) );
  NAND3X1 U728 ( .A(n894), .B(n909), .C(n916), .Y(n757) );
  AOI22X1 U729 ( .A(n101), .B(n95), .C(n88), .D(n91), .Y(n882) );
  NAND3X1 U730 ( .A(n465), .B(n753), .C(n762), .Y(n91) );
  OR2X1 U731 ( .A(n908), .B(n892), .Y(n762) );
  NAND3X1 U732 ( .A(n893), .B(n755), .C(n899), .Y(n908) );
  INVX1 U733 ( .A(n896), .Y(n899) );
  INVX1 U734 ( .A(n478), .Y(n753) );
  NOR2X1 U735 ( .A(n914), .B(n890), .Y(n478) );
  NAND3X1 U736 ( .A(n893), .B(n896), .C(n892), .Y(n914) );
  INVX1 U737 ( .A(n909), .Y(n892) );
  NAND2X1 U738 ( .A(n897), .B(n894), .Y(n465) );
  NOR2X1 U739 ( .A(n755), .B(n896), .Y(n894) );
  NOR2X1 U740 ( .A(n893), .B(n909), .Y(n897) );
  NOR2X1 U741 ( .A(n911), .B(n915), .Y(n88) );
  INVX1 U742 ( .A(n910), .Y(n915) );
  NAND2X1 U743 ( .A(n750), .B(n917), .Y(n95) );
  INVX1 U744 ( .A(n98), .Y(n917) );
  NOR2X1 U745 ( .A(n889), .B(n755), .Y(n98) );
  NAND3X1 U746 ( .A(n909), .B(n896), .C(n916), .Y(n889) );
  INVX1 U747 ( .A(n893), .Y(n916) );
  NOR2X1 U748 ( .A(n476), .B(n477), .Y(n750) );
  INVX1 U749 ( .A(n918), .Y(n477) );
  NAND3X1 U750 ( .A(n909), .B(n755), .C(n919), .Y(n918) );
  NOR2X1 U751 ( .A(n893), .B(n896), .Y(n919) );
  NOR2X1 U752 ( .A(n756), .B(n890), .Y(n476) );
  INVX1 U753 ( .A(n755), .Y(n890) );
  XOR2X1 U754 ( .A(des_curr[7]), .B(subkey[10]), .Y(n755) );
  NAND3X1 U755 ( .A(n909), .B(n896), .C(n893), .Y(n756) );
  XOR2X1 U756 ( .A(des_curr[6]), .B(subkey[9]), .Y(n893) );
  XOR2X1 U757 ( .A(des_curr[8]), .B(subkey[11]), .Y(n896) );
  XOR2X1 U758 ( .A(des_curr[5]), .B(subkey[8]), .Y(n909) );
  NOR2X1 U759 ( .A(n911), .B(n910), .Y(n101) );
  XOR2X1 U760 ( .A(des_curr[4]), .B(subkey[7]), .Y(n910) );
  XOR2X1 U761 ( .A(des_curr[3]), .B(subkey[6]), .Y(n911) );
  INVX1 U762 ( .A(des_in[25]), .Y(n878) );
  OAI21X1 U763 ( .A(n74), .B(n920), .C(n921), .Y(n1170) );
  AOI22X1 U764 ( .A(n922), .B(n69), .C(des_curr[26]), .D(n70), .Y(n921) );
  XOR2X1 U765 ( .A(n923), .B(des_curr[59]), .Y(n922) );
  NAND3X1 U766 ( .A(n924), .B(n925), .C(n926), .Y(n923) );
  NOR2X1 U767 ( .A(n927), .B(n928), .Y(n926) );
  OAI21X1 U768 ( .A(n423), .B(n416), .C(n929), .Y(n928) );
  OAI21X1 U769 ( .A(n407), .B(n930), .C(n223), .Y(n929) );
  INVX1 U770 ( .A(n424), .Y(n223) );
  NAND2X1 U771 ( .A(n931), .B(n415), .Y(n930) );
  NAND2X1 U772 ( .A(n932), .B(n933), .Y(n415) );
  NAND2X1 U773 ( .A(n422), .B(n662), .Y(n407) );
  NAND2X1 U774 ( .A(n934), .B(n935), .Y(n662) );
  NAND2X1 U775 ( .A(n936), .B(n937), .Y(n422) );
  NOR2X1 U776 ( .A(n938), .B(n657), .Y(n423) );
  INVX1 U777 ( .A(n931), .Y(n657) );
  NAND2X1 U778 ( .A(n939), .B(n940), .Y(n931) );
  OAI21X1 U779 ( .A(n408), .B(n941), .C(n942), .Y(n927) );
  OAI21X1 U780 ( .A(n943), .B(n219), .C(n210), .Y(n942) );
  INVX1 U781 ( .A(n417), .Y(n943) );
  NOR2X1 U782 ( .A(n412), .B(n944), .Y(n941) );
  NAND2X1 U783 ( .A(n405), .B(n663), .Y(n944) );
  NAND2X1 U784 ( .A(n936), .B(n933), .Y(n663) );
  NAND2X1 U785 ( .A(n932), .B(n937), .Y(n405) );
  INVX1 U786 ( .A(n666), .Y(n412) );
  NAND2X1 U787 ( .A(n934), .B(n932), .Y(n666) );
  NOR2X1 U788 ( .A(n210), .B(n426), .Y(n408) );
  AOI22X1 U789 ( .A(n661), .B(n208), .C(n226), .D(n220), .Y(n925) );
  NAND2X1 U790 ( .A(n945), .B(n416), .Y(n220) );
  INVX1 U791 ( .A(n426), .Y(n416) );
  INVX1 U792 ( .A(n404), .Y(n226) );
  NAND2X1 U793 ( .A(n934), .B(n936), .Y(n404) );
  NAND2X1 U794 ( .A(n946), .B(n224), .Y(n208) );
  NAND2X1 U795 ( .A(n932), .B(n939), .Y(n224) );
  NOR2X1 U796 ( .A(n947), .B(n948), .Y(n932) );
  AOI21X1 U797 ( .A(n425), .B(n207), .C(n664), .Y(n924) );
  NAND3X1 U798 ( .A(n949), .B(n950), .C(n951), .Y(n664) );
  AOI21X1 U799 ( .A(n205), .B(n210), .C(n952), .Y(n951) );
  OAI21X1 U800 ( .A(n424), .B(n417), .C(n953), .Y(n952) );
  OAI21X1 U801 ( .A(n938), .B(n219), .C(n207), .Y(n953) );
  INVX1 U802 ( .A(n658), .Y(n219) );
  NAND2X1 U803 ( .A(n934), .B(n940), .Y(n658) );
  NOR2X1 U804 ( .A(n954), .B(n955), .Y(n934) );
  INVX1 U805 ( .A(n212), .Y(n938) );
  NAND2X1 U806 ( .A(n935), .B(n933), .Y(n212) );
  NAND2X1 U807 ( .A(n939), .B(n936), .Y(n417) );
  NOR2X1 U808 ( .A(n956), .B(n957), .Y(n936) );
  NOR2X1 U809 ( .A(n207), .B(n661), .Y(n424) );
  INVX1 U810 ( .A(n946), .Y(n205) );
  NAND2X1 U811 ( .A(n935), .B(n937), .Y(n946) );
  OAI21X1 U812 ( .A(n958), .B(n425), .C(n426), .Y(n950) );
  NOR2X1 U813 ( .A(n959), .B(n960), .Y(n426) );
  INVX1 U814 ( .A(n406), .Y(n958) );
  NAND2X1 U815 ( .A(n935), .B(n939), .Y(n406) );
  NOR2X1 U816 ( .A(n961), .B(n955), .Y(n939) );
  INVX1 U817 ( .A(n962), .Y(n955) );
  NOR2X1 U818 ( .A(n948), .B(n957), .Y(n935) );
  INVX1 U819 ( .A(n947), .Y(n957) );
  INVX1 U820 ( .A(n956), .Y(n948) );
  NOR2X1 U821 ( .A(n411), .B(n225), .Y(n949) );
  NOR2X1 U822 ( .A(n418), .B(n945), .Y(n225) );
  INVX1 U823 ( .A(n661), .Y(n945) );
  NOR2X1 U824 ( .A(n963), .B(n960), .Y(n661) );
  INVX1 U825 ( .A(n964), .Y(n960) );
  NOR2X1 U826 ( .A(n399), .B(n418), .Y(n411) );
  NAND2X1 U827 ( .A(n940), .B(n933), .Y(n418) );
  NOR2X1 U828 ( .A(n962), .B(n954), .Y(n933) );
  INVX1 U829 ( .A(n210), .Y(n399) );
  NOR2X1 U830 ( .A(n964), .B(n963), .Y(n210) );
  INVX1 U831 ( .A(n959), .Y(n963) );
  NOR2X1 U832 ( .A(n964), .B(n959), .Y(n207) );
  XOR2X1 U833 ( .A(des_curr[19]), .B(subkey[30]), .Y(n959) );
  XOR2X1 U834 ( .A(des_curr[20]), .B(subkey[31]), .Y(n964) );
  INVX1 U835 ( .A(n211), .Y(n425) );
  NAND2X1 U836 ( .A(n937), .B(n940), .Y(n211) );
  NOR2X1 U837 ( .A(n947), .B(n956), .Y(n940) );
  XOR2X1 U838 ( .A(des_curr[21]), .B(subkey[32]), .Y(n956) );
  XOR2X1 U839 ( .A(des_curr[22]), .B(subkey[33]), .Y(n947) );
  NOR2X1 U840 ( .A(n962), .B(n961), .Y(n937) );
  INVX1 U841 ( .A(n954), .Y(n961) );
  XOR2X1 U842 ( .A(des_curr[23]), .B(subkey[34]), .Y(n954) );
  XOR2X1 U843 ( .A(des_curr[24]), .B(subkey[35]), .Y(n962) );
  INVX1 U844 ( .A(des_in[26]), .Y(n920) );
  OAI21X1 U845 ( .A(n74), .B(n965), .C(n966), .Y(n1169) );
  AOI22X1 U846 ( .A(n967), .B(n69), .C(des_curr[27]), .D(n70), .Y(n966) );
  XOR2X1 U847 ( .A(n968), .B(des_curr[60]), .Y(n967) );
  NAND3X1 U848 ( .A(n969), .B(n970), .C(n971), .Y(n968) );
  NOR2X1 U849 ( .A(n972), .B(n973), .Y(n971) );
  OAI21X1 U850 ( .A(n504), .B(n516), .C(n689), .Y(n973) );
  NOR2X1 U851 ( .A(n974), .B(n975), .Y(n689) );
  OAI21X1 U852 ( .A(n688), .B(n308), .C(n976), .Y(n975) );
  AOI22X1 U853 ( .A(n313), .B(n323), .C(n500), .D(n321), .Y(n976) );
  NOR2X1 U854 ( .A(n977), .B(n978), .Y(n500) );
  NAND2X1 U855 ( .A(n680), .B(n310), .Y(n323) );
  INVX1 U856 ( .A(n497), .Y(n310) );
  AND2X1 U857 ( .A(n315), .B(n979), .Y(n313) );
  NAND3X1 U858 ( .A(n978), .B(n980), .C(n316), .Y(n308) );
  NAND3X1 U859 ( .A(n981), .B(n982), .C(n983), .Y(n974) );
  OAI21X1 U860 ( .A(n984), .B(n985), .C(n499), .Y(n983) );
  OR2X1 U861 ( .A(n986), .B(n514), .Y(n985) );
  INVX1 U862 ( .A(n492), .Y(n514) );
  NAND2X1 U863 ( .A(n987), .B(n316), .Y(n492) );
  NAND2X1 U864 ( .A(n516), .B(n682), .Y(n984) );
  NAND3X1 U865 ( .A(n978), .B(n980), .C(n988), .Y(n682) );
  OAI21X1 U866 ( .A(n318), .B(n322), .C(n303), .Y(n982) );
  INVX1 U867 ( .A(n509), .Y(n322) );
  INVX1 U868 ( .A(n515), .Y(n318) );
  NAND3X1 U869 ( .A(n980), .B(n989), .C(n979), .Y(n515) );
  OAI21X1 U870 ( .A(n513), .B(n990), .C(n497), .Y(n981) );
  NAND2X1 U871 ( .A(n991), .B(n992), .Y(n990) );
  INVX1 U872 ( .A(n993), .Y(n513) );
  AOI21X1 U873 ( .A(n316), .B(n315), .C(n301), .Y(n993) );
  INVX1 U874 ( .A(n994), .Y(n301) );
  INVX1 U875 ( .A(n303), .Y(n504) );
  OAI22X1 U876 ( .A(n680), .B(n994), .C(n299), .D(n991), .Y(n972) );
  INVX1 U877 ( .A(n494), .Y(n991) );
  NOR2X1 U878 ( .A(n977), .B(n989), .Y(n494) );
  NAND3X1 U879 ( .A(n980), .B(n995), .C(n996), .Y(n977) );
  NAND2X1 U880 ( .A(n988), .B(n987), .Y(n994) );
  AND2X1 U881 ( .A(n997), .B(n998), .Y(n970) );
  OAI21X1 U882 ( .A(n320), .B(n686), .C(n319), .Y(n998) );
  INVX1 U883 ( .A(n684), .Y(n319) );
  NOR2X1 U884 ( .A(n303), .B(n499), .Y(n684) );
  INVX1 U885 ( .A(n307), .Y(n686) );
  NAND2X1 U886 ( .A(n315), .B(n988), .Y(n307) );
  OAI21X1 U887 ( .A(n320), .B(n683), .C(n497), .Y(n997) );
  NOR2X1 U888 ( .A(n999), .B(n1000), .Y(n497) );
  NAND2X1 U889 ( .A(n516), .B(n509), .Y(n683) );
  NAND3X1 U890 ( .A(n996), .B(n995), .C(n987), .Y(n509) );
  NAND3X1 U891 ( .A(n980), .B(n989), .C(n988), .Y(n516) );
  NOR2X1 U892 ( .A(n995), .B(n996), .Y(n988) );
  INVX1 U893 ( .A(n508), .Y(n320) );
  NAND3X1 U894 ( .A(n978), .B(n980), .C(n979), .Y(n508) );
  AOI22X1 U895 ( .A(n986), .B(n314), .C(n312), .D(n489), .Y(n969) );
  NAND2X1 U896 ( .A(n680), .B(n299), .Y(n489) );
  INVX1 U897 ( .A(n499), .Y(n299) );
  NOR2X1 U898 ( .A(n1001), .B(n1002), .Y(n499) );
  INVX1 U899 ( .A(n321), .Y(n680) );
  INVX1 U900 ( .A(n992), .Y(n312) );
  NAND3X1 U901 ( .A(n980), .B(n989), .C(n316), .Y(n992) );
  NOR2X1 U902 ( .A(n1003), .B(n995), .Y(n316) );
  INVX1 U903 ( .A(n688), .Y(n314) );
  NOR2X1 U904 ( .A(n303), .B(n321), .Y(n688) );
  NOR2X1 U905 ( .A(n1001), .B(n999), .Y(n321) );
  INVX1 U906 ( .A(n1002), .Y(n999) );
  NOR2X1 U907 ( .A(n1002), .B(n1000), .Y(n303) );
  INVX1 U908 ( .A(n1001), .Y(n1000) );
  XOR2X1 U909 ( .A(des_curr[31]), .B(subkey[0]), .Y(n1001) );
  XOR2X1 U910 ( .A(des_curr[0]), .B(subkey[1]), .Y(n1002) );
  NAND2X1 U911 ( .A(n506), .B(n304), .Y(n986) );
  NAND3X1 U912 ( .A(n996), .B(n995), .C(n315), .Y(n304) );
  NOR2X1 U913 ( .A(n989), .B(n980), .Y(n315) );
  INVX1 U914 ( .A(n1003), .Y(n996) );
  NAND2X1 U915 ( .A(n979), .B(n987), .Y(n506) );
  NOR2X1 U916 ( .A(n980), .B(n978), .Y(n987) );
  INVX1 U917 ( .A(n989), .Y(n978) );
  XOR2X1 U918 ( .A(des_curr[4]), .B(subkey[5]), .Y(n989) );
  XNOR2X1 U919 ( .A(des_curr[3]), .B(subkey[4]), .Y(n980) );
  AND2X1 U920 ( .A(n995), .B(n1003), .Y(n979) );
  XOR2X1 U921 ( .A(des_curr[1]), .B(subkey[2]), .Y(n1003) );
  XNOR2X1 U922 ( .A(des_curr[2]), .B(subkey[3]), .Y(n995) );
  INVX1 U923 ( .A(des_in[27]), .Y(n965) );
  OAI21X1 U924 ( .A(n74), .B(n1004), .C(n1005), .Y(n1168) );
  AOI22X1 U925 ( .A(n1006), .B(n69), .C(des_curr[28]), .D(n70), .Y(n1005) );
  XNOR2X1 U926 ( .A(des_curr[61]), .B(n1007), .Y(n1006) );
  NOR2X1 U927 ( .A(n1008), .B(n1009), .Y(n1007) );
  NAND3X1 U928 ( .A(n560), .B(n236), .C(n769), .Y(n1009) );
  INVX1 U929 ( .A(n1010), .Y(n769) );
  NAND3X1 U930 ( .A(n544), .B(n234), .C(n1011), .Y(n1010) );
  AOI21X1 U931 ( .A(n250), .B(n574), .C(n1012), .Y(n1011) );
  OAI21X1 U932 ( .A(n548), .B(n1013), .C(n1014), .Y(n1012) );
  OAI21X1 U933 ( .A(n248), .B(n782), .C(n575), .Y(n1014) );
  INVX1 U934 ( .A(n1015), .Y(n782) );
  AND2X1 U935 ( .A(n1016), .B(n1017), .Y(n248) );
  NOR2X1 U936 ( .A(n247), .B(n552), .Y(n1013) );
  INVX1 U937 ( .A(n1018), .Y(n548) );
  NAND2X1 U938 ( .A(n1015), .B(n243), .Y(n574) );
  NAND3X1 U939 ( .A(n1019), .B(n1020), .C(n1016), .Y(n1015) );
  AOI21X1 U940 ( .A(n250), .B(n780), .C(n1021), .Y(n234) );
  INVX1 U941 ( .A(n1022), .Y(n1021) );
  AOI21X1 U942 ( .A(n575), .B(n551), .C(n1023), .Y(n1022) );
  AOI21X1 U943 ( .A(n559), .B(n1024), .C(n244), .Y(n1023) );
  AND2X1 U944 ( .A(n1025), .B(n1026), .Y(n544) );
  AOI22X1 U945 ( .A(n1027), .B(n250), .C(n557), .D(n575), .Y(n1026) );
  AOI22X1 U946 ( .A(n247), .B(n781), .C(n780), .D(n552), .Y(n1025) );
  NOR2X1 U947 ( .A(n1028), .B(n1029), .Y(n780) );
  INVX1 U948 ( .A(n1024), .Y(n781) );
  NAND3X1 U949 ( .A(n1030), .B(n1031), .C(n1017), .Y(n1024) );
  AOI22X1 U950 ( .A(n777), .B(n552), .C(n1018), .D(n250), .Y(n236) );
  OAI21X1 U951 ( .A(n571), .B(n572), .C(n578), .Y(n1018) );
  NAND3X1 U952 ( .A(n1029), .B(n571), .C(n1032), .Y(n578) );
  AOI21X1 U953 ( .A(n569), .B(n247), .C(n1033), .Y(n560) );
  INVX1 U954 ( .A(n1034), .Y(n1033) );
  OAI21X1 U955 ( .A(n551), .B(n777), .C(n250), .Y(n1034) );
  NOR2X1 U956 ( .A(n1035), .B(n1036), .Y(n250) );
  NOR2X1 U957 ( .A(n572), .B(n1031), .Y(n777) );
  NAND3X1 U958 ( .A(n1019), .B(n1030), .C(n1020), .Y(n572) );
  NOR2X1 U959 ( .A(n1037), .B(n571), .Y(n551) );
  OAI21X1 U960 ( .A(n242), .B(n774), .C(n1038), .Y(n1008) );
  AND2X1 U961 ( .A(n1039), .B(n1040), .Y(n1038) );
  OAI21X1 U962 ( .A(n245), .B(n569), .C(n575), .Y(n1040) );
  INVX1 U963 ( .A(n241), .Y(n575) );
  NAND2X1 U964 ( .A(n1041), .B(n1036), .Y(n241) );
  OAI21X1 U965 ( .A(n1031), .B(n1037), .C(n251), .Y(n569) );
  NAND3X1 U966 ( .A(n1029), .B(n571), .C(n1042), .Y(n251) );
  NOR2X1 U967 ( .A(n1043), .B(n1044), .Y(n1042) );
  NAND2X1 U968 ( .A(n1030), .B(n1032), .Y(n1037) );
  INVX1 U969 ( .A(n571), .Y(n1031) );
  NAND2X1 U970 ( .A(n553), .B(n558), .Y(n245) );
  NAND3X1 U971 ( .A(n1030), .B(n571), .C(n1017), .Y(n558) );
  NAND3X1 U972 ( .A(n1030), .B(n1044), .C(n1045), .Y(n553) );
  NOR2X1 U973 ( .A(n571), .B(n1043), .Y(n1045) );
  OAI21X1 U974 ( .A(n1027), .B(n564), .C(n552), .Y(n1039) );
  INVX1 U975 ( .A(n244), .Y(n552) );
  NAND2X1 U976 ( .A(n1036), .B(n1035), .Y(n244) );
  NAND2X1 U977 ( .A(n1046), .B(n243), .Y(n564) );
  NAND2X1 U978 ( .A(n1016), .B(n1032), .Y(n243) );
  NOR2X1 U979 ( .A(n1044), .B(n1020), .Y(n1032) );
  INVX1 U980 ( .A(n557), .Y(n1046) );
  NOR2X1 U981 ( .A(n1028), .B(n1030), .Y(n557) );
  NAND3X1 U982 ( .A(n571), .B(n1044), .C(n1020), .Y(n1028) );
  INVX1 U983 ( .A(n247), .Y(n774) );
  NOR2X1 U984 ( .A(n1036), .B(n1041), .Y(n247) );
  INVX1 U985 ( .A(n1035), .Y(n1041) );
  XOR2X1 U986 ( .A(des_curr[7]), .B(subkey[12]), .Y(n1035) );
  XOR2X1 U987 ( .A(des_curr[8]), .B(subkey[13]), .Y(n1036) );
  NOR2X1 U988 ( .A(n576), .B(n1027), .Y(n242) );
  INVX1 U989 ( .A(n573), .Y(n1027) );
  NAND3X1 U990 ( .A(n1029), .B(n571), .C(n1017), .Y(n573) );
  NOR2X1 U991 ( .A(n1019), .B(n1020), .Y(n1017) );
  INVX1 U992 ( .A(n1044), .Y(n1019) );
  INVX1 U993 ( .A(n559), .Y(n576) );
  NAND3X1 U994 ( .A(n1020), .B(n1044), .C(n1016), .Y(n559) );
  NOR2X1 U995 ( .A(n571), .B(n1030), .Y(n1016) );
  INVX1 U996 ( .A(n1029), .Y(n1030) );
  XOR2X1 U997 ( .A(des_curr[9]), .B(subkey[14]), .Y(n1029) );
  XOR2X1 U998 ( .A(des_curr[10]), .B(subkey[15]), .Y(n571) );
  XOR2X1 U999 ( .A(des_curr[11]), .B(subkey[16]), .Y(n1044) );
  INVX1 U1000 ( .A(n1043), .Y(n1020) );
  XOR2X1 U1001 ( .A(des_curr[12]), .B(subkey[17]), .Y(n1043) );
  INVX1 U1002 ( .A(des_in[28]), .Y(n1004) );
  OAI21X1 U1003 ( .A(n74), .B(n1047), .C(n1048), .Y(n1167) );
  AOI22X1 U1004 ( .A(n1049), .B(n69), .C(des_curr[29]), .D(n70), .Y(n1048) );
  XOR2X1 U1005 ( .A(n1050), .B(des_curr[62]), .Y(n1049) );
  NAND3X1 U1006 ( .A(n1051), .B(n1052), .C(n1053), .Y(n1050) );
  NOR2X1 U1007 ( .A(n1054), .B(n1055), .Y(n1053) );
  OAI22X1 U1008 ( .A(n715), .B(n868), .C(n366), .D(n701), .Y(n1055) );
  NAND2X1 U1009 ( .A(n1056), .B(n1057), .Y(n701) );
  OAI21X1 U1010 ( .A(n1058), .B(n386), .C(n1059), .Y(n1054) );
  OAI21X1 U1011 ( .A(n709), .B(n713), .C(n377), .Y(n1059) );
  INVX1 U1012 ( .A(n716), .Y(n713) );
  INVX1 U1013 ( .A(n387), .Y(n709) );
  INVX1 U1014 ( .A(n712), .Y(n1058) );
  NAND3X1 U1015 ( .A(n378), .B(n861), .C(n1060), .Y(n712) );
  NOR2X1 U1016 ( .A(n866), .B(n869), .Y(n1060) );
  INVX1 U1017 ( .A(n371), .Y(n869) );
  NAND2X1 U1018 ( .A(n1057), .B(n1061), .Y(n371) );
  NAND2X1 U1019 ( .A(n1062), .B(n1063), .Y(n861) );
  NAND2X1 U1020 ( .A(n1064), .B(n1065), .Y(n378) );
  AOI21X1 U1021 ( .A(n376), .B(n707), .C(n389), .Y(n1052) );
  OR2X1 U1022 ( .A(n1066), .B(n1067), .Y(n389) );
  OAI22X1 U1023 ( .A(n716), .B(n386), .C(n708), .D(n717), .Y(n1067) );
  NAND2X1 U1024 ( .A(n1056), .B(n1062), .Y(n716) );
  OAI21X1 U1025 ( .A(n715), .B(n876), .C(n1068), .Y(n1066) );
  OAI21X1 U1026 ( .A(n866), .B(n877), .C(n377), .Y(n1068) );
  INVX1 U1027 ( .A(n875), .Y(n377) );
  INVX1 U1028 ( .A(n699), .Y(n877) );
  NAND2X1 U1029 ( .A(n1057), .B(n1063), .Y(n699) );
  INVX1 U1030 ( .A(n718), .Y(n866) );
  NAND2X1 U1031 ( .A(n1061), .B(n1069), .Y(n718) );
  INVX1 U1032 ( .A(n859), .Y(n715) );
  NOR2X1 U1033 ( .A(n714), .B(n871), .Y(n1051) );
  OAI21X1 U1034 ( .A(n875), .B(n708), .C(n1070), .Y(n871) );
  AOI22X1 U1035 ( .A(n381), .B(n1071), .C(n710), .D(n859), .Y(n1070) );
  INVX1 U1036 ( .A(n369), .Y(n710) );
  NAND2X1 U1037 ( .A(n1063), .B(n1069), .Y(n369) );
  NAND2X1 U1038 ( .A(n387), .B(n367), .Y(n1071) );
  NAND2X1 U1039 ( .A(n1056), .B(n1069), .Y(n367) );
  NAND2X1 U1040 ( .A(n1065), .B(n1063), .Y(n387) );
  NOR2X1 U1041 ( .A(n1072), .B(n1073), .Y(n1063) );
  NAND2X1 U1042 ( .A(n1064), .B(n1057), .Y(n708) );
  NOR2X1 U1043 ( .A(n1074), .B(n1075), .Y(n1057) );
  OR2X1 U1044 ( .A(n1076), .B(n1077), .Y(n714) );
  OAI22X1 U1045 ( .A(n875), .B(n382), .C(n386), .D(n868), .Y(n1077) );
  NAND2X1 U1046 ( .A(n1062), .B(n1061), .Y(n868) );
  INVX1 U1047 ( .A(n867), .Y(n386) );
  NAND2X1 U1048 ( .A(n1056), .B(n1065), .Y(n382) );
  AND2X1 U1049 ( .A(n1078), .B(n1073), .Y(n1056) );
  NOR2X1 U1050 ( .A(n859), .B(n707), .Y(n875) );
  NOR2X1 U1051 ( .A(n1079), .B(n1080), .Y(n707) );
  NOR2X1 U1052 ( .A(n1081), .B(n1082), .Y(n859) );
  OAI21X1 U1053 ( .A(n876), .B(n717), .C(n1083), .Y(n1076) );
  OAI21X1 U1054 ( .A(n1084), .B(n376), .C(n711), .Y(n1083) );
  INVX1 U1055 ( .A(n366), .Y(n711) );
  NOR2X1 U1056 ( .A(n381), .B(n867), .Y(n366) );
  NOR2X1 U1057 ( .A(n1079), .B(n1081), .Y(n867) );
  INVX1 U1058 ( .A(n1080), .Y(n1081) );
  INVX1 U1059 ( .A(n860), .Y(n376) );
  NAND2X1 U1060 ( .A(n1062), .B(n1064), .Y(n860) );
  NOR2X1 U1061 ( .A(n1085), .B(n1086), .Y(n1062) );
  INVX1 U1062 ( .A(n856), .Y(n1084) );
  NAND2X1 U1063 ( .A(n1064), .B(n1069), .Y(n856) );
  NOR2X1 U1064 ( .A(n1074), .B(n1085), .Y(n1069) );
  NOR2X1 U1065 ( .A(n1073), .B(n1078), .Y(n1064) );
  INVX1 U1066 ( .A(n1072), .Y(n1078) );
  INVX1 U1067 ( .A(n381), .Y(n717) );
  NOR2X1 U1068 ( .A(n1080), .B(n1082), .Y(n381) );
  INVX1 U1069 ( .A(n1079), .Y(n1082) );
  XOR2X1 U1070 ( .A(des_curr[11]), .B(subkey[18]), .Y(n1079) );
  XOR2X1 U1071 ( .A(des_curr[12]), .B(subkey[19]), .Y(n1080) );
  NAND2X1 U1072 ( .A(n1065), .B(n1061), .Y(n876) );
  AND2X1 U1073 ( .A(n1073), .B(n1072), .Y(n1061) );
  XOR2X1 U1074 ( .A(des_curr[15]), .B(subkey[22]), .Y(n1072) );
  XOR2X1 U1075 ( .A(des_curr[16]), .B(subkey[23]), .Y(n1073) );
  NOR2X1 U1076 ( .A(n1075), .B(n1086), .Y(n1065) );
  INVX1 U1077 ( .A(n1074), .Y(n1086) );
  XOR2X1 U1078 ( .A(des_curr[13]), .B(subkey[20]), .Y(n1074) );
  INVX1 U1079 ( .A(n1085), .Y(n1075) );
  XOR2X1 U1080 ( .A(des_curr[14]), .B(subkey[21]), .Y(n1085) );
  INVX1 U1081 ( .A(des_in[29]), .Y(n1047) );
  OAI21X1 U1082 ( .A(n74), .B(n1087), .C(n1088), .Y(n1166) );
  AOI22X1 U1083 ( .A(n1089), .B(n69), .C(des_curr[30]), .D(n70), .Y(n1088) );
  XNOR2X1 U1084 ( .A(des_curr[63]), .B(n1090), .Y(n1089) );
  NOR2X1 U1085 ( .A(n1091), .B(n1092), .Y(n1090) );
  NAND3X1 U1086 ( .A(n725), .B(n605), .C(n1093), .Y(n1092) );
  AOI22X1 U1087 ( .A(n263), .B(n608), .C(n595), .D(n599), .Y(n1093) );
  INVX1 U1088 ( .A(n739), .Y(n595) );
  NAND2X1 U1089 ( .A(n1094), .B(n1095), .Y(n739) );
  NAND2X1 U1090 ( .A(n282), .B(n1096), .Y(n608) );
  NAND2X1 U1091 ( .A(n1097), .B(n1098), .Y(n282) );
  AND2X1 U1092 ( .A(n1099), .B(n1100), .Y(n605) );
  AOI21X1 U1093 ( .A(n265), .B(n263), .C(n1101), .Y(n1100) );
  OAI21X1 U1094 ( .A(n1102), .B(n279), .C(n1103), .Y(n1101) );
  OAI21X1 U1095 ( .A(n590), .B(n269), .C(n288), .Y(n1103) );
  INVX1 U1096 ( .A(n1096), .Y(n269) );
  NAND2X1 U1097 ( .A(n1104), .B(n1095), .Y(n1096) );
  INVX1 U1098 ( .A(n261), .Y(n590) );
  NOR2X1 U1099 ( .A(n275), .B(n287), .Y(n1102) );
  AND2X1 U1100 ( .A(n1105), .B(n1095), .Y(n287) );
  INVX1 U1101 ( .A(n610), .Y(n275) );
  NAND2X1 U1102 ( .A(n1104), .B(n1106), .Y(n610) );
  AOI22X1 U1103 ( .A(n1107), .B(n286), .C(n273), .D(n264), .Y(n1099) );
  INVX1 U1104 ( .A(n1108), .Y(n273) );
  INVX1 U1105 ( .A(n1109), .Y(n725) );
  OAI21X1 U1106 ( .A(n587), .B(n261), .C(n1110), .Y(n1109) );
  AOI22X1 U1107 ( .A(n591), .B(n264), .C(n265), .D(n599), .Y(n1110) );
  AND2X1 U1108 ( .A(n1111), .B(n1094), .Y(n265) );
  NAND2X1 U1109 ( .A(n600), .B(n597), .Y(n591) );
  NAND2X1 U1110 ( .A(n1111), .B(n1105), .Y(n597) );
  NAND2X1 U1111 ( .A(n1097), .B(n1095), .Y(n261) );
  NOR2X1 U1112 ( .A(n1112), .B(n1113), .Y(n1095) );
  NAND3X1 U1113 ( .A(n1114), .B(n1115), .C(n1116), .Y(n1091) );
  AOI22X1 U1114 ( .A(n286), .B(n1117), .C(n1118), .D(n271), .Y(n1116) );
  INVX1 U1115 ( .A(n587), .Y(n271) );
  NOR2X1 U1116 ( .A(n263), .B(n286), .Y(n587) );
  INVX1 U1117 ( .A(n730), .Y(n263) );
  NAND2X1 U1118 ( .A(n1119), .B(n1120), .Y(n730) );
  NAND3X1 U1119 ( .A(n280), .B(n604), .C(n1108), .Y(n1118) );
  NAND2X1 U1120 ( .A(n1106), .B(n1097), .Y(n1108) );
  NAND2X1 U1121 ( .A(n1104), .B(n1111), .Y(n604) );
  NAND2X1 U1122 ( .A(n1111), .B(n1097), .Y(n280) );
  NOR2X1 U1123 ( .A(n1121), .B(n1122), .Y(n1097) );
  NOR2X1 U1124 ( .A(n1123), .B(n1124), .Y(n1111) );
  NAND2X1 U1125 ( .A(n606), .B(n600), .Y(n1117) );
  NAND2X1 U1126 ( .A(n1098), .B(n1094), .Y(n600) );
  NOR2X1 U1127 ( .A(n1119), .B(n1120), .Y(n286) );
  OAI21X1 U1128 ( .A(n276), .B(n1125), .C(n264), .Y(n1115) );
  INVX1 U1129 ( .A(n603), .Y(n264) );
  NOR2X1 U1130 ( .A(n288), .B(n599), .Y(n603) );
  INVX1 U1131 ( .A(n279), .Y(n599) );
  NAND2X1 U1132 ( .A(n1126), .B(n1119), .Y(n279) );
  INVX1 U1133 ( .A(n606), .Y(n1125) );
  NAND2X1 U1134 ( .A(n1105), .B(n1098), .Y(n606) );
  INVX1 U1135 ( .A(n596), .Y(n276) );
  NAND2X1 U1136 ( .A(n1104), .B(n1098), .Y(n596) );
  NOR2X1 U1137 ( .A(n1124), .B(n1113), .Y(n1098) );
  INVX1 U1138 ( .A(n1123), .Y(n1113) );
  INVX1 U1139 ( .A(n1112), .Y(n1124) );
  AND2X1 U1140 ( .A(n1122), .B(n1121), .Y(n1104) );
  INVX1 U1141 ( .A(n1127), .Y(n1122) );
  OAI21X1 U1142 ( .A(n272), .B(n1107), .C(n288), .Y(n1114) );
  NOR2X1 U1143 ( .A(n1119), .B(n1126), .Y(n288) );
  INVX1 U1144 ( .A(n1120), .Y(n1126) );
  XOR2X1 U1145 ( .A(des_curr[23]), .B(subkey[36]), .Y(n1120) );
  XOR2X1 U1146 ( .A(des_curr[24]), .B(subkey[37]), .Y(n1119) );
  INVX1 U1147 ( .A(n593), .Y(n1107) );
  NAND2X1 U1148 ( .A(n1106), .B(n1094), .Y(n593) );
  NOR2X1 U1149 ( .A(n1127), .B(n1121), .Y(n1094) );
  AND2X1 U1150 ( .A(n1106), .B(n1105), .Y(n272) );
  AND2X1 U1151 ( .A(n1121), .B(n1127), .Y(n1105) );
  XOR2X1 U1152 ( .A(des_curr[26]), .B(subkey[39]), .Y(n1127) );
  XOR2X1 U1153 ( .A(des_curr[27]), .B(subkey[40]), .Y(n1121) );
  NOR2X1 U1154 ( .A(n1123), .B(n1112), .Y(n1106) );
  XOR2X1 U1155 ( .A(des_curr[25]), .B(subkey[38]), .Y(n1112) );
  XOR2X1 U1156 ( .A(des_curr[28]), .B(subkey[41]), .Y(n1123) );
  INVX1 U1157 ( .A(des_in[30]), .Y(n1087) );
  OAI21X1 U1158 ( .A(n74), .B(n1128), .C(n1129), .Y(n1165) );
  AOI22X1 U1159 ( .A(n1130), .B(n69), .C(n70), .D(des_curr[31]), .Y(n1129) );
  XOR2X1 U1160 ( .A(n1131), .B(left[31]), .Y(n1130) );
  NAND3X1 U1161 ( .A(n1132), .B(n1133), .C(n1134), .Y(n1131) );
  NOR2X1 U1162 ( .A(n1135), .B(n1136), .Y(n1134) );
  OAI21X1 U1163 ( .A(n1137), .B(n337), .C(n1138), .Y(n1136) );
  OAI21X1 U1164 ( .A(n537), .B(n1139), .C(n351), .Y(n1138) );
  INVX1 U1165 ( .A(n344), .Y(n1139) );
  INVX1 U1166 ( .A(n797), .Y(n1137) );
  NAND2X1 U1167 ( .A(n1140), .B(n536), .Y(n797) );
  OAI21X1 U1168 ( .A(n809), .B(n1141), .C(n1142), .Y(n1135) );
  OAI21X1 U1169 ( .A(n796), .B(n347), .C(n352), .Y(n1142) );
  INVX1 U1170 ( .A(n1143), .Y(n347) );
  INVX1 U1171 ( .A(n535), .Y(n796) );
  NAND3X1 U1172 ( .A(n1144), .B(n1145), .C(n1146), .Y(n535) );
  AND2X1 U1173 ( .A(n792), .B(n791), .Y(n1141) );
  NOR2X1 U1174 ( .A(n526), .B(n538), .Y(n791) );
  INVX1 U1175 ( .A(n335), .Y(n538) );
  INVX1 U1176 ( .A(n1147), .Y(n526) );
  NAND3X1 U1177 ( .A(n1148), .B(n1144), .C(n1146), .Y(n1147) );
  NOR2X1 U1178 ( .A(n349), .B(n529), .Y(n792) );
  INVX1 U1179 ( .A(n1149), .Y(n529) );
  NAND3X1 U1180 ( .A(n1150), .B(n1151), .C(n1152), .Y(n1149) );
  NOR2X1 U1181 ( .A(n1144), .B(n1145), .Y(n1152) );
  NOR2X1 U1182 ( .A(n1153), .B(n1144), .Y(n349) );
  NOR2X1 U1183 ( .A(n351), .B(n801), .Y(n809) );
  AOI22X1 U1184 ( .A(n353), .B(n808), .C(n346), .D(n533), .Y(n1133) );
  INVX1 U1185 ( .A(n334), .Y(n533) );
  NOR2X1 U1186 ( .A(n352), .B(n801), .Y(n334) );
  NOR2X1 U1187 ( .A(n1154), .B(n1155), .Y(n346) );
  NAND3X1 U1188 ( .A(n344), .B(n335), .C(n536), .Y(n808) );
  NAND3X1 U1189 ( .A(n1148), .B(n806), .C(n805), .Y(n536) );
  NAND3X1 U1190 ( .A(n1150), .B(n1145), .C(n805), .Y(n335) );
  NAND3X1 U1191 ( .A(n1148), .B(n1156), .C(n1146), .Y(n344) );
  AOI21X1 U1192 ( .A(n354), .B(n348), .C(n356), .Y(n1132) );
  OAI21X1 U1193 ( .A(n799), .B(n337), .C(n1157), .Y(n356) );
  AOI22X1 U1194 ( .A(n1158), .B(n351), .C(n537), .D(n348), .Y(n1157) );
  INVX1 U1195 ( .A(n336), .Y(n537) );
  NAND2X1 U1196 ( .A(n806), .B(n1159), .Y(n336) );
  OAI21X1 U1197 ( .A(n1151), .B(n1160), .C(n807), .Y(n1159) );
  NAND3X1 U1198 ( .A(n1151), .B(n1145), .C(n1156), .Y(n807) );
  NAND2X1 U1199 ( .A(n1148), .B(n1144), .Y(n1160) );
  INVX1 U1200 ( .A(n1156), .Y(n1144) );
  AND2X1 U1201 ( .A(n1161), .B(n1162), .Y(n351) );
  NOR2X1 U1202 ( .A(n1163), .B(n1228), .Y(n1158) );
  XNOR2X1 U1203 ( .A(n1145), .B(n1150), .Y(n1163) );
  INVX1 U1204 ( .A(n801), .Y(n337) );
  NOR2X1 U1205 ( .A(n1162), .B(n1161), .Y(n801) );
  INVX1 U1206 ( .A(n1229), .Y(n1162) );
  AND2X1 U1207 ( .A(n1143), .B(n803), .Y(n799) );
  OR2X1 U1208 ( .A(n1154), .B(n1151), .Y(n803) );
  NAND3X1 U1209 ( .A(n806), .B(n1156), .C(n1148), .Y(n1154) );
  NAND3X1 U1210 ( .A(n1156), .B(n1145), .C(n1146), .Y(n1143) );
  NOR2X1 U1211 ( .A(n1151), .B(n806), .Y(n1146) );
  INVX1 U1212 ( .A(n793), .Y(n348) );
  NOR2X1 U1213 ( .A(n352), .B(n353), .Y(n793) );
  NOR2X1 U1214 ( .A(n1229), .B(n1161), .Y(n353) );
  INVX1 U1215 ( .A(n527), .Y(n352) );
  NAND2X1 U1216 ( .A(n1161), .B(n1229), .Y(n527) );
  XOR2X1 U1217 ( .A(des_curr[16]), .B(subkey[25]), .Y(n1229) );
  XNOR2X1 U1218 ( .A(des_curr[15]), .B(subkey[24]), .Y(n1161) );
  OAI21X1 U1219 ( .A(n1228), .B(n1230), .C(n1140), .Y(n354) );
  INVX1 U1220 ( .A(n350), .Y(n1140) );
  NOR2X1 U1221 ( .A(n1153), .B(n1156), .Y(n350) );
  NAND3X1 U1222 ( .A(n806), .B(n1145), .C(n1155), .Y(n1153) );
  INVX1 U1223 ( .A(n1150), .Y(n806) );
  NAND2X1 U1224 ( .A(n1148), .B(n1150), .Y(n1230) );
  XOR2X1 U1225 ( .A(des_curr[19]), .B(subkey[28]), .Y(n1150) );
  INVX1 U1226 ( .A(n1145), .Y(n1148) );
  XOR2X1 U1227 ( .A(des_curr[17]), .B(subkey[26]), .Y(n1145) );
  INVX1 U1228 ( .A(n805), .Y(n1228) );
  NOR2X1 U1229 ( .A(n1156), .B(n1155), .Y(n805) );
  INVX1 U1230 ( .A(n1151), .Y(n1155) );
  XOR2X1 U1231 ( .A(des_curr[20]), .B(subkey[29]), .Y(n1151) );
  XOR2X1 U1232 ( .A(des_curr[18]), .B(subkey[27]), .Y(n1156) );
  INVX1 U1233 ( .A(des_in[31]), .Y(n1128) );
  OAI21X1 U1234 ( .A(n74), .B(n1231), .C(n1232), .Y(n1164) );
  AOI22X1 U1235 ( .A(left[32]), .B(n69), .C(des_curr[32]), .D(n70), .Y(n1232)
         );
  INVX1 U1236 ( .A(des_in[32]), .Y(n1231) );
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
  NAND2X1 U33 ( .A(n264), .B(n149), .Y(n147) );
  INVX4 U63 ( .A(n147), .Y(n148) );
  INVX2 U66 ( .A(n158), .Y(n149) );
  BUFX4 U71 ( .A(n157), .Y(n150) );
  INVX2 U74 ( .A(key_rollover), .Y(n279) );
  INVX4 U82 ( .A(n163), .Y(n158) );
  BUFX4 U86 ( .A(n156), .Y(n151) );
  INVX4 U87 ( .A(n152), .Y(n278) );
  NOR2X1 U92 ( .A(key_count[1]), .B(n329), .Y(n153) );
  NOR2X1 U95 ( .A(n153), .B(key_rollover), .Y(n152) );
  NAND2X1 U96 ( .A(n154), .B(n155), .Y(nxtright[9]) );
  AOI22X1 U101 ( .A(keyOutR_19), .B(n151), .C(keyOut[19]), .D(n150), .Y(n155)
         );
  AOI22X1 U109 ( .A(subkey[10]), .B(n148), .C(subkey[12]), .D(n158), .Y(n154)
         );
  NAND2X1 U113 ( .A(n159), .B(n160), .Y(nxtright[8]) );
  AOI22X1 U116 ( .A(keyOutR_27), .B(n151), .C(keyOut[27]), .D(n150), .Y(n160)
         );
  AOI22X1 U120 ( .A(subkey[3]), .B(n148), .C(n158), .D(subkey[10]), .Y(n159)
         );
  NAND2X1 U122 ( .A(n161), .B(n162), .Y(nxtright[7]) );
  AOI22X1 U129 ( .A(keyOutR_35), .B(n151), .C(keyOut[35]), .D(n150), .Y(n162)
         );
  AOI22X1 U135 ( .A(subkey[15]), .B(n148), .C(subkey[3]), .D(n158), .Y(n161)
         );
  OAI21X1 U137 ( .A(n149), .B(n164), .C(n165), .Y(nxtright[6]) );
  AOI22X1 U146 ( .A(keyOut[43]), .B(n150), .C(subkey[22]), .D(n148), .Y(n165)
         );
  INVX1 U147 ( .A(subkey[15]), .Y(n164) );
  NAND2X1 U151 ( .A(n166), .B(n167), .Y(nxtright[5]) );
  AOI22X1 U152 ( .A(keyOutR_51), .B(n151), .C(keyOut[51]), .D(n150), .Y(n167)
         );
  AOI22X1 U161 ( .A(subkey[6]), .B(n148), .C(subkey[22]), .D(n158), .Y(n166)
         );
  NAND2X1 U164 ( .A(n168), .B(n169), .Y(nxtright[4]) );
  AOI22X1 U169 ( .A(keyOutR_59), .B(n151), .C(keyOut[59]), .D(n150), .Y(n169)
         );
  AOI22X1 U172 ( .A(right_2), .B(n148), .C(subkey[6]), .D(n158), .Y(n168) );
  NAND2X1 U174 ( .A(n170), .B(n171), .Y(nxtright[3]) );
  AOI22X1 U178 ( .A(keyOutR_36), .B(n151), .C(keyOut[36]), .D(n150), .Y(n171)
         );
  AOI22X1 U179 ( .A(subkey[18]), .B(n148), .C(right_2), .D(n158), .Y(n170) );
  NAND2X1 U180 ( .A(n172), .B(n173), .Y(nxtright[2]) );
  AOI22X1 U181 ( .A(keyOutR_44), .B(n151), .C(keyOut[44]), .D(n150), .Y(n173)
         );
  AOI22X1 U182 ( .A(subkey[8]), .B(n148), .C(subkey[18]), .D(n158), .Y(n172)
         );
  OAI21X1 U183 ( .A(n149), .B(n174), .C(n175), .Y(nxtright[27]) );
  AOI22X1 U184 ( .A(keyOutR[1]), .B(n151), .C(subkey[21]), .D(n148), .Y(n175)
         );
  INVX1 U185 ( .A(subkey[17]), .Y(n174) );
  NAND2X1 U186 ( .A(n176), .B(n177), .Y(nxtright[26]) );
  AOI22X1 U187 ( .A(keyOutR[9]), .B(n151), .C(keyOut[9]), .D(n150), .Y(n177)
         );
  AOI22X1 U188 ( .A(subkey[0]), .B(n148), .C(subkey[21]), .D(n158), .Y(n176)
         );
  NAND2X1 U189 ( .A(n178), .B(n179), .Y(nxtright[25]) );
  AOI22X1 U190 ( .A(keyOutR[17]), .B(n151), .C(keyOut[17]), .D(n150), .Y(n179)
         );
  AOI22X1 U191 ( .A(subkey[13]), .B(n148), .C(subkey[0]), .D(n158), .Y(n178)
         );
  OAI21X1 U192 ( .A(n149), .B(n180), .C(n181), .Y(nxtright[24]) );
  AOI22X1 U193 ( .A(keyOut[25]), .B(n150), .C(subkey[7]), .D(n148), .Y(n181)
         );
  INVX1 U194 ( .A(subkey[13]), .Y(n180) );
  OAI21X1 U195 ( .A(n149), .B(n182), .C(n183), .Y(nxtright[23]) );
  AOI22X1 U196 ( .A(keyOutR_33), .B(n151), .C(\right[21] ), .D(n148), .Y(n183)
         );
  INVX1 U197 ( .A(subkey[7]), .Y(n182) );
  OAI21X1 U198 ( .A(n149), .B(n184), .C(n185), .Y(nxtright[22]) );
  AOI22X1 U199 ( .A(keyOut[41]), .B(n150), .C(subkey[2]), .D(n148), .Y(n185)
         );
  INVX1 U200 ( .A(\right[21] ), .Y(n184) );
  OAI21X1 U201 ( .A(n149), .B(n186), .C(n187), .Y(nxtright[21]) );
  AOI22X1 U202 ( .A(keyOut[49]), .B(n150), .C(subkey[20]), .D(n148), .Y(n187)
         );
  INVX1 U203 ( .A(subkey[2]), .Y(n186) );
  NAND2X1 U204 ( .A(n188), .B(n189), .Y(nxtright[20]) );
  AOI22X1 U205 ( .A(keyOutR_57), .B(n151), .C(keyOut[57]), .D(n150), .Y(n189)
         );
  AOI22X1 U206 ( .A(right_18), .B(n148), .C(subkey[20]), .D(n158), .Y(n188) );
  NAND2X1 U207 ( .A(n190), .B(n191), .Y(nxtright[1]) );
  AOI22X1 U208 ( .A(keyOutR_52), .B(n151), .C(keyOut[52]), .D(n150), .Y(n191)
         );
  AOI22X1 U209 ( .A(\subkey[27] ), .B(n148), .C(subkey[8]), .D(n158), .Y(n190)
         );
  NAND2X1 U210 ( .A(n192), .B(n193), .Y(nxtright[19]) );
  AOI22X1 U211 ( .A(keyOutR[2]), .B(n151), .C(keyOut[2]), .D(n150), .Y(n193)
         );
  AOI22X1 U212 ( .A(subkey[9]), .B(n148), .C(right_18), .D(n158), .Y(n192) );
  NAND2X1 U213 ( .A(n194), .B(n195), .Y(nxtright[18]) );
  AOI22X1 U214 ( .A(keyOutR[10]), .B(n151), .C(keyOut[10]), .D(n150), .Y(n195)
         );
  AOI22X1 U215 ( .A(subkey[16]), .B(n148), .C(subkey[9]), .D(n158), .Y(n194)
         );
  OAI21X1 U216 ( .A(n149), .B(n196), .C(n197), .Y(nxtright[17]) );
  AOI22X1 U217 ( .A(keyOut[8]), .B(n150), .C(subkey[23]), .D(n148), .Y(n197)
         );
  INVX1 U218 ( .A(subkey[16]), .Y(n196) );
  OAI21X1 U219 ( .A(n149), .B(n198), .C(n199), .Y(nxtright[16]) );
  AOI22X1 U220 ( .A(keyOut[16]), .B(n150), .C(subkey[4]), .D(n148), .Y(n199)
         );
  INVX1 U221 ( .A(subkey[23]), .Y(n198) );
  NAND2X1 U222 ( .A(n200), .B(n201), .Y(nxtright[15]) );
  AOI22X1 U223 ( .A(keyOutR_24), .B(n151), .C(keyOut[24]), .D(n150), .Y(n201)
         );
  AOI22X1 U224 ( .A(right_13), .B(n148), .C(subkey[4]), .D(n158), .Y(n200) );
  OAI21X1 U225 ( .A(n149), .B(n202), .C(n203), .Y(nxtright[14]) );
  AOI22X1 U226 ( .A(keyOutR_32), .B(n151), .C(subkey[11]), .D(n148), .Y(n203)
         );
  INVX1 U227 ( .A(right_13), .Y(n202) );
  OAI21X1 U228 ( .A(n149), .B(n204), .C(n205), .Y(nxtright[13]) );
  AOI22X1 U229 ( .A(keyOutR_50), .B(n151), .C(subkey[14]), .D(n148), .Y(n205)
         );
  INVX1 U230 ( .A(subkey[11]), .Y(n204) );
  OAI21X1 U231 ( .A(n149), .B(n206), .C(n207), .Y(nxtright[11]) );
  AOI22X1 U232 ( .A(keyOut[3]), .B(n150), .C(subkey[19]), .D(n148), .Y(n207)
         );
  INVX1 U233 ( .A(subkey[5]), .Y(n206) );
  NAND2X1 U234 ( .A(n208), .B(n209), .Y(nxtright[10]) );
  AOI22X1 U235 ( .A(keyOutR[11]), .B(n151), .C(keyOut[11]), .D(n150), .Y(n209)
         );
  AOI22X1 U236 ( .A(subkey[12]), .B(n148), .C(subkey[19]), .D(n158), .Y(n208)
         );
  OAI21X1 U237 ( .A(n149), .B(n210), .C(n211), .Y(nxtright[0]) );
  AOI22X1 U238 ( .A(keyOutR_60), .B(n151), .C(subkey[17]), .D(n148), .Y(n211)
         );
  INVX1 U239 ( .A(\subkey[27] ), .Y(n210) );
  NAND2X1 U240 ( .A(n212), .B(n213), .Y(nxtleft[9]) );
  AOI22X1 U241 ( .A(keyOutR_21), .B(n151), .C(keyOut[21]), .D(n150), .Y(n213)
         );
  AOI22X1 U242 ( .A(subkey[37]), .B(n148), .C(subkey[26]), .D(n158), .Y(n212)
         );
  NAND2X1 U243 ( .A(n214), .B(n215), .Y(nxtleft[8]) );
  AOI22X1 U244 ( .A(keyOutR_29), .B(n151), .C(keyOut[29]), .D(n150), .Y(n215)
         );
  AOI22X1 U245 ( .A(left_6), .B(n148), .C(subkey[37]), .D(n158), .Y(n214) );
  NAND2X1 U246 ( .A(n216), .B(n217), .Y(nxtleft[6]) );
  AOI22X1 U247 ( .A(keyOutR_45), .B(n151), .C(keyOut[45]), .D(n150), .Y(n217)
         );
  AOI22X1 U248 ( .A(subkey[44]), .B(n148), .C(subkey[35]), .D(n158), .Y(n216)
         );
  NAND2X1 U249 ( .A(n218), .B(n219), .Y(nxtleft[5]) );
  AOI22X1 U250 ( .A(keyOutR_53), .B(n151), .C(keyOut[53]), .D(n150), .Y(n219)
         );
  AOI22X1 U251 ( .A(left_3), .B(n148), .C(subkey[44]), .D(n158), .Y(n218) );
  NAND2X1 U252 ( .A(n220), .B(n221), .Y(nxtleft[4]) );
  AOI22X1 U253 ( .A(keyOutR_61), .B(n151), .C(keyOut[61]), .D(n150), .Y(n221)
         );
  AOI22X1 U254 ( .A(subkey[31]), .B(n148), .C(left_3), .D(n158), .Y(n220) );
  NAND2X1 U255 ( .A(n222), .B(n223), .Y(nxtleft[3]) );
  AOI22X1 U256 ( .A(keyOutR[4]), .B(n151), .C(keyOut[4]), .D(n150), .Y(n223)
         );
  AOI22X1 U257 ( .A(left_1), .B(n148), .C(subkey[31]), .D(n158), .Y(n222) );
  NAND2X1 U258 ( .A(n224), .B(n225), .Y(nxtleft[2]) );
  AOI22X1 U259 ( .A(keyOutR[12]), .B(n151), .C(keyOut[12]), .D(n150), .Y(n225)
         );
  AOI22X1 U260 ( .A(subkey[40]), .B(n148), .C(left_1), .D(n158), .Y(n224) );
  OAI21X1 U261 ( .A(n149), .B(n226), .C(n227), .Y(nxtleft[27]) );
  AOI22X1 U262 ( .A(keyOutR[7]), .B(n151), .C(subkey[41]), .D(n148), .Y(n227)
         );
  INVX1 U263 ( .A(subkey[24]), .Y(n226) );
  NAND2X1 U264 ( .A(n228), .B(n229), .Y(nxtleft[26]) );
  AOI22X1 U265 ( .A(keyOutR[15]), .B(n151), .C(keyOut[15]), .D(n150), .Y(n229)
         );
  AOI22X1 U266 ( .A(subkey[32]), .B(n148), .C(subkey[41]), .D(n158), .Y(n228)
         );
  NAND2X1 U267 ( .A(n230), .B(n231), .Y(nxtleft[25]) );
  AOI22X1 U268 ( .A(keyOutR_23), .B(n151), .C(keyOut[23]), .D(n150), .Y(n231)
         );
  AOI22X1 U269 ( .A(subkey[42]), .B(n148), .C(subkey[32]), .D(n158), .Y(n230)
         );
  OAI21X1 U270 ( .A(n149), .B(n232), .C(n233), .Y(nxtleft[24]) );
  AOI22X1 U271 ( .A(keyOut[31]), .B(n150), .C(subkey[38]), .D(n148), .Y(n233)
         );
  INVX1 U272 ( .A(subkey[42]), .Y(n232) );
  NAND2X1 U273 ( .A(n234), .B(n235), .Y(nxtleft[23]) );
  AOI22X1 U274 ( .A(keyOutR_39), .B(n151), .C(keyOut[39]), .D(n150), .Y(n235)
         );
  AOI22X1 U275 ( .A(subkey[28]), .B(n148), .C(subkey[38]), .D(n158), .Y(n234)
         );
  OAI21X1 U276 ( .A(n163), .B(n236), .C(n237), .Y(nxtleft[22]) );
  AOI22X1 U277 ( .A(keyOutR_47), .B(n151), .C(subkey[30]), .D(n148), .Y(n237)
         );
  INVX1 U278 ( .A(subkey[28]), .Y(n236) );
  OAI21X1 U279 ( .A(n163), .B(n238), .C(n239), .Y(nxtleft[21]) );
  AOI22X1 U280 ( .A(keyOutR_55), .B(n151), .C(\left[19] ), .D(n148), .Y(n239)
         );
  INVX1 U281 ( .A(subkey[30]), .Y(n238) );
  NAND2X1 U282 ( .A(n240), .B(n241), .Y(nxtleft[20]) );
  AOI22X1 U283 ( .A(keyOutR_63), .B(n151), .C(keyOut[63]), .D(n150), .Y(n241)
         );
  AOI22X1 U284 ( .A(subkey[36]), .B(n148), .C(\left[19] ), .D(n158), .Y(n240)
         );
  OAI21X1 U285 ( .A(n163), .B(n242), .C(n243), .Y(nxtleft[1]) );
  AOI22X1 U286 ( .A(keyOutR_20), .B(n151), .C(subkey[43]), .D(n148), .Y(n243)
         );
  INVX1 U287 ( .A(subkey[40]), .Y(n242) );
  NAND2X1 U288 ( .A(n244), .B(n245), .Y(nxtleft[19]) );
  AOI22X1 U289 ( .A(keyOutR[6]), .B(n151), .C(keyOut[6]), .D(n150), .Y(n245)
         );
  AOI22X1 U290 ( .A(subkey[45]), .B(n148), .C(subkey[36]), .D(n158), .Y(n244)
         );
  OAI21X1 U291 ( .A(n163), .B(n246), .C(n247), .Y(nxtleft[18]) );
  AOI22X1 U292 ( .A(keyOutR[14]), .B(n151), .C(subkey[33]), .D(n148), .Y(n247)
         );
  INVX1 U293 ( .A(subkey[45]), .Y(n246) );
  OAI21X1 U294 ( .A(n163), .B(n248), .C(n249), .Y(nxtleft[17]) );
  AOI22X1 U295 ( .A(keyOutR_22), .B(n151), .C(subkey[25]), .D(n148), .Y(n249)
         );
  INVX1 U296 ( .A(subkey[33]), .Y(n248) );
  OAI21X1 U297 ( .A(n163), .B(n250), .C(n251), .Y(nxtleft[16]) );
  AOI22X1 U298 ( .A(keyOut[30]), .B(n150), .C(subkey[47]), .D(n148), .Y(n251)
         );
  INVX1 U299 ( .A(subkey[25]), .Y(n250) );
  OAI21X1 U300 ( .A(n163), .B(n252), .C(n253), .Y(nxtleft[15]) );
  AOI22X1 U301 ( .A(keyOutR_38), .B(n151), .C(subkey[39]), .D(n148), .Y(n253)
         );
  INVX1 U302 ( .A(subkey[47]), .Y(n252) );
  NAND2X1 U303 ( .A(n254), .B(n255), .Y(nxtleft[14]) );
  AOI22X1 U304 ( .A(keyOutR_46), .B(n151), .C(keyOut[46]), .D(n150), .Y(n255)
         );
  AOI22X1 U305 ( .A(subkey[29]), .B(n148), .C(subkey[39]), .D(n158), .Y(n254)
         );
  NAND2X1 U306 ( .A(n256), .B(n257), .Y(nxtleft[13]) );
  AOI22X1 U307 ( .A(keyOutR_54), .B(n151), .C(keyOut[54]), .D(n150), .Y(n257)
         );
  AOI22X1 U308 ( .A(subkey[46]), .B(n148), .C(subkey[29]), .D(n158), .Y(n256)
         );
  OAI21X1 U309 ( .A(n163), .B(n258), .C(n259), .Y(nxtleft[12]) );
  AOI22X1 U310 ( .A(keyOut[62]), .B(n150), .C(left_10), .D(n148), .Y(n259) );
  INVX1 U311 ( .A(subkey[46]), .Y(n258) );
  OAI21X1 U312 ( .A(n163), .B(n260), .C(n261), .Y(nxtleft[10]) );
  AOI22X1 U313 ( .A(keyOut[13]), .B(n150), .C(subkey[26]), .D(n148), .Y(n261)
         );
  INVX1 U314 ( .A(subkey[34]), .Y(n260) );
  NAND2X1 U315 ( .A(n262), .B(n263), .Y(nxtleft[0]) );
  AOI22X1 U316 ( .A(keyOutR_28), .B(n151), .C(keyOut[28]), .D(n150), .Y(n263)
         );
  NOR2X1 U317 ( .A(n264), .B(reverse), .Y(n157) );
  NOR2X1 U318 ( .A(n265), .B(n264), .Y(n156) );
  INVX1 U319 ( .A(reverse), .Y(n265) );
  AOI22X1 U320 ( .A(subkey[24]), .B(n148), .C(subkey[43]), .D(n158), .Y(n262)
         );
  INVX1 U321 ( .A(n266), .Y(n332) );
  AOI22X1 U322 ( .A(n158), .B(left_10), .C(n148), .D(subkey[34]), .Y(n266) );
  INVX1 U323 ( .A(n267), .Y(n333) );
  AOI22X1 U324 ( .A(n158), .B(left_6), .C(n148), .D(subkey[35]), .Y(n267) );
  INVX1 U325 ( .A(n268), .Y(n334) );
  AOI22X1 U326 ( .A(n158), .B(subkey[14]), .C(n148), .D(subkey[5]), .Y(n268)
         );
  NAND3X1 U327 ( .A(n269), .B(n270), .C(n271), .Y(n264) );
  NOR2X1 U328 ( .A(round_count[1]), .B(round_count[0]), .Y(n271) );
  NOR2X1 U329 ( .A(round_count[4]), .B(round_count[3]), .Y(n269) );
  NAND2X1 U330 ( .A(n272), .B(n270), .Y(n163) );
  INVX1 U331 ( .A(round_count[2]), .Y(n270) );
  MUX2X1 U332 ( .B(n273), .A(n274), .S(round_count[0]), .Y(n272) );
  OR2X1 U333 ( .A(round_count[1]), .B(round_count[4]), .Y(n274) );
  NAND2X1 U334 ( .A(n275), .B(n276), .Y(n273) );
  INVX1 U335 ( .A(round_count[3]), .Y(n276) );
  XOR2X1 U336 ( .A(round_count[4]), .B(round_count[1]), .Y(n275) );
  OAI21X1 U337 ( .A(n277), .B(n278), .C(n279), .Y(keyNext[9]) );
  INVX1 U338 ( .A(keyOut[9]), .Y(n277) );
  OAI21X1 U339 ( .A(n280), .B(n278), .C(n281), .Y(keyNext[8]) );
  INVX1 U340 ( .A(keyOut[8]), .Y(n280) );
  OAI21X1 U341 ( .A(n282), .B(n278), .C(n283), .Y(keyNext[6]) );
  INVX1 U342 ( .A(keyOut[6]), .Y(n282) );
  OAI21X1 U343 ( .A(n284), .B(n278), .C(n279), .Y(keyNext[63]) );
  INVX1 U344 ( .A(keyOut[63]), .Y(n284) );
  OAI21X1 U345 ( .A(n285), .B(n278), .C(n279), .Y(keyNext[62]) );
  INVX1 U346 ( .A(keyOut[62]), .Y(n285) );
  OAI21X1 U347 ( .A(n286), .B(n278), .C(n281), .Y(keyNext[61]) );
  INVX1 U348 ( .A(keyOut[61]), .Y(n286) );
  OAI21X1 U349 ( .A(n287), .B(n278), .C(n279), .Y(keyNext[59]) );
  INVX1 U350 ( .A(keyOut[59]), .Y(n287) );
  OAI21X1 U351 ( .A(n288), .B(n278), .C(n279), .Y(keyNext[57]) );
  INVX1 U352 ( .A(keyOut[57]), .Y(n288) );
  OAI21X1 U353 ( .A(n278), .B(n289), .C(n281), .Y(keyNext[56]) );
  INVX1 U354 ( .A(keyOut[56]), .Y(n289) );
  OAI21X1 U355 ( .A(n290), .B(n278), .C(n281), .Y(keyNext[54]) );
  INVX1 U356 ( .A(keyOut[54]), .Y(n290) );
  OAI21X1 U357 ( .A(n291), .B(n278), .C(n283), .Y(keyNext[53]) );
  INVX1 U358 ( .A(keyOut[53]), .Y(n291) );
  OAI21X1 U359 ( .A(n292), .B(n278), .C(n283), .Y(keyNext[52]) );
  INVX1 U360 ( .A(keyOut[52]), .Y(n292) );
  OAI21X1 U361 ( .A(n293), .B(n278), .C(n279), .Y(keyNext[51]) );
  INVX1 U362 ( .A(keyOut[51]), .Y(n293) );
  OAI21X1 U363 ( .A(n294), .B(n278), .C(n283), .Y(keyNext[4]) );
  INVX1 U364 ( .A(keyOut[4]), .Y(n294) );
  OAI21X1 U365 ( .A(n295), .B(n278), .C(n283), .Y(keyNext[49]) );
  INVX1 U366 ( .A(keyOut[49]), .Y(n295) );
  OAI21X1 U367 ( .A(n278), .B(n296), .C(n281), .Y(keyNext[48]) );
  INVX1 U368 ( .A(keyOut[48]), .Y(n296) );
  OAI21X1 U369 ( .A(n297), .B(n278), .C(n281), .Y(keyNext[46]) );
  INVX1 U370 ( .A(keyOut[46]), .Y(n297) );
  OAI21X1 U371 ( .A(n298), .B(n278), .C(n279), .Y(keyNext[45]) );
  INVX1 U372 ( .A(keyOut[45]), .Y(n298) );
  OAI21X1 U373 ( .A(n299), .B(n278), .C(n283), .Y(keyNext[44]) );
  INVX1 U374 ( .A(keyOut[44]), .Y(n299) );
  OAI21X1 U375 ( .A(n300), .B(n278), .C(n279), .Y(keyNext[43]) );
  INVX1 U376 ( .A(keyOut[43]), .Y(n300) );
  OAI21X1 U377 ( .A(n278), .B(n301), .C(n283), .Y(keyNext[42]) );
  INVX1 U378 ( .A(keyOut[42]), .Y(n301) );
  OAI21X1 U379 ( .A(n302), .B(n278), .C(n279), .Y(keyNext[41]) );
  INVX1 U380 ( .A(keyOut[41]), .Y(n302) );
  OAI21X1 U381 ( .A(n278), .B(n303), .C(n281), .Y(keyNext[40]) );
  INVX1 U382 ( .A(keyOut[40]), .Y(n303) );
  OAI21X1 U383 ( .A(n304), .B(n278), .C(n283), .Y(keyNext[3]) );
  INVX1 U384 ( .A(keyOut[3]), .Y(n304) );
  OAI21X1 U385 ( .A(n305), .B(n278), .C(n279), .Y(keyNext[39]) );
  INVX1 U386 ( .A(keyOut[39]), .Y(n305) );
  OAI21X1 U387 ( .A(n306), .B(n278), .C(n283), .Y(keyNext[36]) );
  INVX1 U388 ( .A(keyOut[36]), .Y(n306) );
  OAI21X1 U389 ( .A(n307), .B(n278), .C(n279), .Y(keyNext[35]) );
  INVX1 U390 ( .A(keyOut[35]), .Y(n307) );
  OAI21X1 U391 ( .A(n278), .B(n308), .C(n281), .Y(keyNext[34]) );
  INVX1 U392 ( .A(keyOut[34]), .Y(n308) );
  OAI21X1 U393 ( .A(n309), .B(n278), .C(n279), .Y(keyNext[31]) );
  INVX1 U394 ( .A(keyOut[31]), .Y(n309) );
  OAI21X1 U395 ( .A(n310), .B(n278), .C(n281), .Y(keyNext[30]) );
  INVX1 U396 ( .A(keyOut[30]), .Y(n310) );
  OAI21X1 U397 ( .A(n311), .B(n278), .C(n281), .Y(keyNext[2]) );
  INVX1 U398 ( .A(keyOut[2]), .Y(n311) );
  OAI21X1 U399 ( .A(n312), .B(n278), .C(n281), .Y(keyNext[29]) );
  INVX1 U400 ( .A(keyOut[29]), .Y(n312) );
  OAI21X1 U401 ( .A(n313), .B(n278), .C(n279), .Y(keyNext[28]) );
  INVX1 U402 ( .A(keyOut[28]), .Y(n313) );
  OAI21X1 U403 ( .A(n314), .B(n278), .C(n279), .Y(keyNext[27]) );
  INVX1 U404 ( .A(keyOut[27]), .Y(n314) );
  OAI21X1 U405 ( .A(n315), .B(n278), .C(n283), .Y(keyNext[25]) );
  INVX1 U406 ( .A(keyOut[25]), .Y(n315) );
  OAI21X1 U407 ( .A(n316), .B(n278), .C(n281), .Y(keyNext[24]) );
  INVX1 U408 ( .A(keyOut[24]), .Y(n316) );
  OAI21X1 U409 ( .A(n317), .B(n278), .C(n279), .Y(keyNext[23]) );
  INVX1 U410 ( .A(keyOut[23]), .Y(n317) );
  OAI21X1 U411 ( .A(n318), .B(n278), .C(n283), .Y(keyNext[21]) );
  INVX1 U412 ( .A(keyOut[21]), .Y(n318) );
  OAI21X1 U413 ( .A(n319), .B(n278), .C(n281), .Y(keyNext[19]) );
  INVX1 U414 ( .A(keyOut[19]), .Y(n319) );
  OAI21X1 U415 ( .A(n278), .B(n320), .C(n283), .Y(keyNext[18]) );
  INVX1 U416 ( .A(keyOut[18]), .Y(n320) );
  OAI21X1 U417 ( .A(n321), .B(n278), .C(n279), .Y(keyNext[17]) );
  INVX1 U418 ( .A(keyOut[17]), .Y(n321) );
  OAI21X1 U419 ( .A(n322), .B(n278), .C(n283), .Y(keyNext[16]) );
  INVX1 U420 ( .A(keyOut[16]), .Y(n322) );
  OAI21X1 U421 ( .A(n323), .B(n278), .C(n279), .Y(keyNext[15]) );
  INVX1 U422 ( .A(keyOut[15]), .Y(n323) );
  OAI21X1 U423 ( .A(n324), .B(n278), .C(n279), .Y(keyNext[13]) );
  INVX1 U424 ( .A(keyOut[13]), .Y(n324) );
  OAI21X1 U425 ( .A(n325), .B(n278), .C(n281), .Y(keyNext[12]) );
  INVX1 U426 ( .A(keyOut[12]), .Y(n325) );
  OAI21X1 U427 ( .A(n326), .B(n278), .C(n279), .Y(keyNext[11]) );
  INVX1 U428 ( .A(keyOut[11]), .Y(n326) );
  OAI21X1 U429 ( .A(n327), .B(n278), .C(n283), .Y(keyNext[10]) );
  AND2X1 U430 ( .A(n281), .B(n279), .Y(n283) );
  NAND3X1 U431 ( .A(key_count[0]), .B(cnt_rollover), .C(n328), .Y(n281) );
  NOR2X1 U432 ( .A(key_rollover), .B(key_count[1]), .Y(n328) );
  INVX1 U433 ( .A(keyOut[10]), .Y(n327) );
  OAI21X1 U434 ( .A(n329), .B(n330), .C(n331), .Y(keyNext[0]) );
  NAND2X1 U435 ( .A(keyOut[0]), .B(n152), .Y(n331) );
  OR2X1 U436 ( .A(key_count[1]), .B(key_rollover), .Y(n330) );
  INVX1 U437 ( .A(cnt_rollover), .Y(n329) );
endmodule


module key_counter ( clk, n_rst, count_enable, key_count, key_rollover );
  output [1:0] key_count;
  input clk, n_rst, count_enable;
  output key_rollover;
  wire   n15, n4, n5, n6, n7, n8, n9, n10, n11, n12;

  DFFSR \key_reg_reg[0]  ( .D(n11), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        key_count[0]) );
  DFFSR \key_reg_reg[1]  ( .D(n15), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        key_count[1]) );
  DFFSR rollover_reg_reg ( .D(n12), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        key_rollover) );
  MUX2X1 U6 ( .B(count_enable), .A(n4), .S(n5), .Y(n11) );
  NAND2X1 U7 ( .A(count_enable), .B(n6), .Y(n4) );
  MUX2X1 U8 ( .B(n6), .A(n7), .S(count_enable), .Y(n12) );
  NAND2X1 U9 ( .A(key_count[1]), .B(n5), .Y(n7) );
  INVX1 U10 ( .A(key_rollover), .Y(n6) );
  OAI22X1 U11 ( .A(count_enable), .B(n8), .C(key_rollover), .D(n9), .Y(n15) );
  MUX2X1 U12 ( .B(n10), .A(key_count[1]), .S(n5), .Y(n9) );
  INVX1 U13 ( .A(key_count[0]), .Y(n5) );
  AND2X1 U14 ( .A(n8), .B(count_enable), .Y(n10) );
  INVX1 U15 ( .A(key_count[1]), .Y(n8) );
endmodule


module round_counter ( clk, n_rst, count_enable, round_count, cnt_rollover );
  output [4:0] round_count;
  input clk, n_rst, count_enable;
  output cnt_rollover;
  wire   n23, n24, n25, n26, n27, n28, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n29, n30, n31, n32;

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
  MUX2X1 U9 ( .B(n7), .A(n8), .S(round_count[0]), .Y(n28) );
  NOR2X1 U10 ( .A(n9), .B(n10), .Y(n27) );
  NAND2X1 U11 ( .A(n11), .B(n12), .Y(n10) );
  NAND3X1 U12 ( .A(n13), .B(n14), .C(n15), .Y(n9) );
  INVX1 U13 ( .A(n16), .Y(n15) );
  MUX2X1 U14 ( .B(n17), .A(n18), .S(round_count[1]), .Y(n26) );
  INVX1 U15 ( .A(n19), .Y(n18) );
  OAI21X1 U16 ( .A(n7), .B(round_count[0]), .C(n8), .Y(n19) );
  NAND2X1 U17 ( .A(n13), .B(round_count[0]), .Y(n17) );
  OAI22X1 U18 ( .A(n11), .B(n7), .C(n8), .D(n20), .Y(n25) );
  XOR2X1 U19 ( .A(n16), .B(round_count[2]), .Y(n11) );
  OAI22X1 U20 ( .A(n8), .B(n21), .C(n12), .D(n7), .Y(n24) );
  XOR2X1 U21 ( .A(n21), .B(n22), .Y(n12) );
  INVX1 U22 ( .A(round_count[3]), .Y(n21) );
  INVX1 U23 ( .A(n29), .Y(n8) );
  INVX1 U24 ( .A(n30), .Y(n23) );
  AOI22X1 U25 ( .A(n14), .B(n13), .C(n29), .D(round_count[4]), .Y(n30) );
  NOR2X1 U26 ( .A(cnt_rollover), .B(count_enable), .Y(n29) );
  INVX1 U27 ( .A(n7), .Y(n13) );
  NAND2X1 U28 ( .A(count_enable), .B(n31), .Y(n7) );
  INVX1 U29 ( .A(cnt_rollover), .Y(n31) );
  XNOR2X1 U30 ( .A(n32), .B(round_count[4]), .Y(n14) );
  NAND2X1 U31 ( .A(round_count[3]), .B(n22), .Y(n32) );
  NOR2X1 U32 ( .A(n16), .B(n20), .Y(n22) );
  INVX1 U33 ( .A(round_count[2]), .Y(n20) );
  NAND2X1 U34 ( .A(round_count[1]), .B(round_count[0]), .Y(n16) );
endmodule


module des_controller ( clk, n_rst, receive, empty, key_rollover, encrypt_sync, 
        count_enable, reverse, des_start, data_out, des_enable );
  input clk, n_rst, receive, empty, key_rollover, encrypt_sync;
  output count_enable, reverse, des_start, data_out, des_enable;
  wire   encrypt_sync, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32;
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
  OAI21X1 U7 ( .A(n5), .B(n6), .C(n7), .Y(nextstate[3]) );
  NAND2X1 U8 ( .A(state[3]), .B(n8), .Y(n7) );
  NAND3X1 U9 ( .A(n6), .B(n5), .C(empty), .Y(n8) );
  NAND3X1 U10 ( .A(n9), .B(n10), .C(n11), .Y(nextstate[2]) );
  AOI22X1 U11 ( .A(key_rollover), .B(n12), .C(n13), .D(state[2]), .Y(n11) );
  INVX1 U12 ( .A(n14), .Y(n13) );
  AND2X1 U13 ( .A(n15), .B(n16), .Y(n9) );
  OAI21X1 U14 ( .A(n17), .B(n14), .C(n18), .Y(nextstate[1]) );
  AOI21X1 U15 ( .A(n19), .B(state[0]), .C(n12), .Y(n18) );
  INVX1 U16 ( .A(state[1]), .Y(n17) );
  NAND3X1 U17 ( .A(n15), .B(n20), .C(n21), .Y(nextstate[0]) );
  NOR2X1 U18 ( .A(n12), .B(n22), .Y(n21) );
  MUX2X1 U19 ( .B(n14), .A(n23), .S(n24), .Y(n22) );
  NAND2X1 U20 ( .A(receive), .B(n19), .Y(n23) );
  OAI21X1 U21 ( .A(state[3]), .B(n25), .C(n26), .Y(n14) );
  NOR2X1 U22 ( .A(n19), .B(count_enable), .Y(n26) );
  INVX1 U23 ( .A(state[2]), .Y(n25) );
  INVX1 U24 ( .A(n27), .Y(n12) );
  NAND3X1 U25 ( .A(state[2]), .B(state[1]), .C(n28), .Y(n27) );
  NOR2X1 U26 ( .A(state[3]), .B(state[0]), .Y(n28) );
  NAND3X1 U27 ( .A(state[2]), .B(n24), .C(n19), .Y(n15) );
  INVX1 U28 ( .A(n20), .Y(des_start) );
  NAND3X1 U29 ( .A(state[1]), .B(n24), .C(n29), .Y(n20) );
  INVX1 U30 ( .A(n10), .Y(des_enable) );
  NAND3X1 U31 ( .A(state[2]), .B(state[0]), .C(n19), .Y(n10) );
  NOR2X1 U32 ( .A(state[1]), .B(state[3]), .Y(n19) );
  INVX1 U33 ( .A(n16), .Y(count_enable) );
  NAND3X1 U34 ( .A(state[0]), .B(state[1]), .C(n29), .Y(n16) );
  NOR2X1 U35 ( .A(state[3]), .B(state[2]), .Y(n29) );
  NOR2X1 U36 ( .A(n30), .B(n31), .Y(data_out) );
  NAND2X1 U37 ( .A(n6), .B(n5), .Y(n31) );
  AOI22X1 U38 ( .A(state[1]), .B(state[0]), .C(n32), .D(state[2]), .Y(n5) );
  XNOR2X1 U39 ( .A(state[2]), .B(n32), .Y(n6) );
  XNOR2X1 U40 ( .A(state[1]), .B(n24), .Y(n32) );
  INVX1 U41 ( .A(state[0]), .Y(n24) );
  INVX1 U42 ( .A(state[3]), .Y(n30) );
endmodule


module sync_high ( clk, n_rst, async_in, sync_out );
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
         count_enable, encrypt_sync;
  wire   [63:0] des_curr;
  wire   [63:0] des_in;
  wire   [47:0] subkey;
  wire   [4:0] round_count;
  wire   [1:0] key_count;

  permutation PERMUTATION ( .rcv_data(rcv_data), .des_curr(des_curr), 
        .tx_data(trans_data), .des_in(des_in) );
  des_round_computations DES_COMP ( .clk(clk), .n_rst(n_rst), .des_start(
        des_start), .des_enable(des_enable), .des_in(des_in), .subkey(subkey), 
        .des_curr(des_curr) );
  key_generator KEYGEN ( .clk(clk), .n_rst(n_rst), .reverse(reverse), 
        .cnt_rollover(cnt_rollover), .key_rollover(key_rollover), 
        .round_count(round_count), .key_count(key_count), .subkey(subkey) );
  key_counter KEYCNTR ( .clk(clk), .n_rst(n_rst), .count_enable(cnt_rollover), 
        .key_count(key_count), .key_rollover(key_rollover) );
  round_counter RNDCNTR ( .clk(clk), .n_rst(n_rst), .count_enable(count_enable), .round_count(round_count), .cnt_rollover(cnt_rollover) );
  des_controller DES_CONTROLLER ( .clk(clk), .n_rst(n_rst), .receive(
        rcv_data_ready), .empty(handshake_ack), .key_rollover(key_rollover), 
        .encrypt_sync(encrypt_sync), .count_enable(count_enable), .reverse(
        reverse), .des_start(des_start), .data_out(trans_data_ready), 
        .des_enable(des_enable) );
  sync_high ENCRYPT_SYNC ( .clk(clk), .n_rst(n_rst), .async_in(encrypt), 
        .sync_out(encrypt_sync) );
endmodule

