`timescale 1ns/1ns
module Shifter (in, ctrl, out) ;

  input  [31:0]  in;
  input  [31:0]  ctrl;
  output [31:0]  out;
  wire   [31:0]  t4, t3, t2, t1 ;  // 從t4開始存輸出


  //16 bits shift right
  mux2X1  temp5_31 (.in0(in[31]), .in1(1'b0),   .sel(ctrl[4]), .out(t4[31]));
  mux2X1  temp5_30 (.in0(in[30]), .in1(1'b0),   .sel(ctrl[4]), .out(t4[30]));
  mux2X1  temp5_29 (.in0(in[29]), .in1(1'b0),   .sel(ctrl[4]), .out(t4[29]));
  mux2X1  temp5_28 (.in0(in[28]), .in1(1'b0),   .sel(ctrl[4]), .out(t4[28]));
  mux2X1  temp5_27 (.in0(in[27]), .in1(1'b0),   .sel(ctrl[4]), .out(t4[27]));
  mux2X1  temp5_26 (.in0(in[26]), .in1(1'b0),   .sel(ctrl[4]), .out(t4[26]));
  mux2X1  temp5_25 (.in0(in[25]), .in1(1'b0),   .sel(ctrl[4]), .out(t4[25]));
  mux2X1  temp5_24 (.in0(in[24]), .in1(1'b0),   .sel(ctrl[4]), .out(t4[24]));

  mux2X1  temp5_23 (.in0(in[23]), .in1(1'b0), .sel(ctrl[4]), .out(t4[23]));
  mux2X1  temp5_22 (.in0(in[22]), .in1(1'b0), .sel(ctrl[4]), .out(t4[22]));
  mux2X1  temp5_21 (.in0(in[21]), .in1(1'b0), .sel(ctrl[4]), .out(t4[21]));
  mux2X1  temp5_20 (.in0(in[20]), .in1(1'b0), .sel(ctrl[4]), .out(t4[20]));
  mux2X1  temp5_19 (.in0(in[19]), .in1(1'b0), .sel(ctrl[4]), .out(t4[19]));
  mux2X1  temp5_18 (.in0(in[18]), .in1(1'b0), .sel(ctrl[4]), .out(t4[18]));
  mux2X1  temp5_17 (.in0(in[17]), .in1(1'b0), .sel(ctrl[4]), .out(t4[17]));
  mux2X1  temp5_16 (.in0(in[16]), .in1(1'b0), .sel(ctrl[4]), .out(t4[16]));

  mux2X1  temp5_15 (.in0(in[15]), .in1(in[31]), .sel(ctrl[4]), .out(t4[15]));
  mux2X1  temp5_14 (.in0(in[14]), .in1(in[30]), .sel(ctrl[4]), .out(t4[14]));
  mux2X1  temp5_13 (.in0(in[13]), .in1(in[29]), .sel(ctrl[4]), .out(t4[13]));
  mux2X1  temp5_12 (.in0(in[12]), .in1(in[28]), .sel(ctrl[4]), .out(t4[12]));
  mux2X1  temp5_11 (.in0(in[11]), .in1(in[27]), .sel(ctrl[4]), .out(t4[11]));
  mux2X1  temp5_10 (.in0(in[10]), .in1(in[26]), .sel(ctrl[4]), .out(t4[10]));
  mux2X1  temp5_09 (.in0(in[9]),  .in1(in[25]), .sel(ctrl[4]), .out(t4[9]));
  mux2X1  temp5_08 (.in0(in[8]),  .in1(in[24]), .sel(ctrl[4]), .out(t4[8]));

  mux2X1  temp5_07 (.in0(in[7]), .in1(in[23]),  .sel(ctrl[4]), .out(t4[7]));
  mux2X1  temp5_06 (.in0(in[6]), .in1(in[22]),  .sel(ctrl[4]), .out(t4[6]));
  mux2X1  temp5_05 (.in0(in[5]), .in1(in[21]),  .sel(ctrl[4]), .out(t4[5]));
  mux2X1  temp5_04 (.in0(in[4]), .in1(in[20]),  .sel(ctrl[4]), .out(t4[4]));
  mux2X1  temp5_03 (.in0(in[3]), .in1(in[19]),  .sel(ctrl[4]), .out(t4[3]));
  mux2X1  temp5_02 (.in0(in[2]), .in1(in[18]),  .sel(ctrl[4]), .out(t4[2]));
  mux2X1  temp5_01 (.in0(in[1]), .in1(in[17]),   .sel(ctrl[4]), .out(t4[1]));
  mux2X1  temp5_00 (.in0(in[0]), .in1(in[16]),   .sel(ctrl[4]), .out(t4[0]));


  //8 bits shift right
  mux2X1  temp4_31 (.in0(t4[31]), .in1(1'b0),   .sel(ctrl[3]), .out(t3[31]));
  mux2X1  temp4_30 (.in0(t4[30]), .in1(1'b0),   .sel(ctrl[3]), .out(t3[30]));
  mux2X1  temp4_29 (.in0(t4[29]), .in1(1'b0),   .sel(ctrl[3]), .out(t3[29]));
  mux2X1  temp4_28 (.in0(t4[28]), .in1(1'b0),   .sel(ctrl[3]), .out(t3[28]));
  mux2X1  temp4_27 (.in0(t4[27]), .in1(1'b0),   .sel(ctrl[3]), .out(t3[27]));
  mux2X1  temp4_26 (.in0(t4[26]), .in1(1'b0),   .sel(ctrl[3]), .out(t3[26]));
  mux2X1  temp4_25 (.in0(t4[25]), .in1(1'b0),   .sel(ctrl[3]), .out(t3[25]));
  mux2X1  temp4_24 (.in0(t4[24]), .in1(1'b0),   .sel(ctrl[3]), .out(t3[24]));

  mux2X1  temp4_23 (.in0(t4[23]), .in1(t4[31]), .sel(ctrl[3]), .out(t3[23]));
  mux2X1  temp4_22 (.in0(t4[22]), .in1(t4[30]), .sel(ctrl[3]), .out(t3[22]));
  mux2X1  temp4_21 (.in0(t4[21]), .in1(t4[29]), .sel(ctrl[3]), .out(t3[21]));
  mux2X1  temp4_20 (.in0(t4[20]), .in1(t4[28]), .sel(ctrl[3]), .out(t3[20]));
  mux2X1  temp4_19 (.in0(t4[19]), .in1(t4[27]), .sel(ctrl[3]), .out(t3[19]));
  mux2X1  temp4_18 (.in0(t4[18]), .in1(t4[26]), .sel(ctrl[3]), .out(t3[18]));
  mux2X1  temp4_17 (.in0(t4[17]), .in1(t4[25]), .sel(ctrl[3]), .out(t3[17]));
  mux2X1  temp4_16 (.in0(t4[16]), .in1(t4[24]), .sel(ctrl[3]), .out(t3[16]));

  mux2X1  temp4_15 (.in0(t4[15]), .in1(t4[23]), .sel(ctrl[3]), .out(t3[15]));
  mux2X1  temp4_14 (.in0(t4[14]), .in1(t4[22]), .sel(ctrl[3]), .out(t3[14]));
  mux2X1  temp4_13 (.in0(t4[13]), .in1(t4[21]), .sel(ctrl[3]), .out(t3[13]));
  mux2X1  temp4_12 (.in0(t4[12]), .in1(t4[20]), .sel(ctrl[3]), .out(t3[12]));
  mux2X1  temp4_11 (.in0(t4[11]), .in1(t4[19]), .sel(ctrl[3]), .out(t3[11]));
  mux2X1  temp4_10 (.in0(t4[10]), .in1(t4[18]), .sel(ctrl[3]), .out(t3[10]));
  mux2X1  temp4_09 (.in0(t4[9]),  .in1(t4[17]), .sel(ctrl[3]), .out(t3[9]));
  mux2X1  temp4_08 (.in0(t4[8]),  .in1(t4[16]), .sel(ctrl[3]), .out(t3[8]));

  mux2X1  temp4_07 (.in0(t4[7]), .in1(t4[15]),  .sel(ctrl[3]), .out(t3[7]));
  mux2X1  temp4_06 (.in0(t4[6]), .in1(t4[14]),  .sel(ctrl[3]), .out(t3[6]));
  mux2X1  temp4_05 (.in0(t4[5]), .in1(t4[13]),  .sel(ctrl[3]), .out(t3[5]));
  mux2X1  temp4_04 (.in0(t4[4]), .in1(t4[12]),  .sel(ctrl[3]), .out(t3[4]));
  mux2X1  temp4_03 (.in0(t4[3]), .in1(t4[11]),  .sel(ctrl[3]), .out(t3[3]));
  mux2X1  temp4_02 (.in0(t4[2]), .in1(t4[10]),  .sel(ctrl[3]), .out(t3[2]));
  mux2X1  temp4_01 (.in0(t4[1]), .in1(t4[9]),   .sel(ctrl[3]), .out(t3[1]));
  mux2X1  temp4_00 (.in0(t4[0]), .in1(t4[8]),   .sel(ctrl[3]), .out(t3[0]));




  //4 bits shift right
  mux2X1  temp3_31 (.in0(t3[31]), .in1(1'b0),   .sel(ctrl[2]), .out(t2[31]));
  mux2X1  temp3_30 (.in0(t3[30]), .in1(1'b0),   .sel(ctrl[2]), .out(t2[30]));
  mux2X1  temp3_29 (.in0(t3[29]), .in1(1'b0),   .sel(ctrl[2]), .out(t2[29]));
  mux2X1  temp3_28 (.in0(t3[28]), .in1(1'b0),   .sel(ctrl[2]), .out(t2[28]));
  mux2X1  temp3_27 (.in0(t3[27]), .in1(t3[31]), .sel(ctrl[2]), .out(t2[27]));
  mux2X1  temp3_26 (.in0(t3[26]), .in1(t3[30]), .sel(ctrl[2]), .out(t2[26]));
  mux2X1  temp3_25 (.in0(t3[25]), .in1(t3[29]), .sel(ctrl[2]), .out(t2[25]));
  mux2X1  temp3_24 (.in0(t3[24]), .in1(t3[28]), .sel(ctrl[2]), .out(t2[24]));

  mux2X1  temp3_23 (.in0(t3[23]), .in1(t3[27]), .sel(ctrl[2]), .out(t2[23]));
  mux2X1  temp3_22 (.in0(t3[22]), .in1(t3[26]), .sel(ctrl[2]), .out(t2[22]));
  mux2X1  temp3_21 (.in0(t3[21]), .in1(t3[25]), .sel(ctrl[2]), .out(t2[21]));
  mux2X1  temp3_20 (.in0(t3[20]), .in1(t3[24]), .sel(ctrl[2]), .out(t2[20]));
  mux2X1  temp3_19 (.in0(t3[19]), .in1(t3[23]), .sel(ctrl[2]), .out(t2[19]));
  mux2X1  temp3_18 (.in0(t3[18]), .in1(t3[22]), .sel(ctrl[2]), .out(t2[18]));
  mux2X1  temp3_17 (.in0(t3[17]), .in1(t3[21]), .sel(ctrl[2]), .out(t2[17]));
  mux2X1  temp3_16 (.in0(t3[16]), .in1(t3[20]), .sel(ctrl[2]), .out(t2[16]));

  mux2X1  temp3_15 (.in0(t3[15]), .in1(t3[19]), .sel(ctrl[2]), .out(t2[15]));
  mux2X1  temp3_14 (.in0(t3[14]), .in1(t3[18]), .sel(ctrl[2]), .out(t2[14]));
  mux2X1  temp3_13 (.in0(t3[13]), .in1(t3[17]), .sel(ctrl[2]), .out(t2[13]));
  mux2X1  temp3_12 (.in0(t3[12]), .in1(t3[16]), .sel(ctrl[2]), .out(t2[12]));
  mux2X1  temp3_11 (.in0(t3[11]), .in1(t3[15]), .sel(ctrl[2]), .out(t2[11]));
  mux2X1  temp3_10 (.in0(t3[10]), .in1(t3[14]), .sel(ctrl[2]), .out(t2[10]));
  mux2X1  temp3_09 (.in0(t3[9]),  .in1(t3[13]), .sel(ctrl[2]), .out(t2[9]));
  mux2X1  temp3_08 (.in0(t3[8]),  .in1(t3[12]), .sel(ctrl[2]), .out(t2[8]));

  mux2X1  temp3_07 (.in0(t3[7]), .in1(t3[11]), .sel(ctrl[2]), .out(t2[7]));
  mux2X1  temp3_06 (.in0(t3[6]), .in1(t3[10]), .sel(ctrl[2]), .out(t2[6]));
  mux2X1  temp3_05 (.in0(t3[5]), .in1(t3[9]), .sel(ctrl[2]), .out(t2[5]));
  mux2X1  temp3_04 (.in0(t3[4]), .in1(t3[8]), .sel(ctrl[2]), .out(t2[4]));
  mux2X1  temp3_03 (.in0(t3[3]), .in1(t3[7]), .sel(ctrl[2]), .out(t2[3]));
  mux2X1  temp3_02 (.in0(t3[2]), .in1(t3[6]), .sel(ctrl[2]), .out(t2[2]));
  mux2X1  temp3_01 (.in0(t3[1]), .in1(t3[5]), .sel(ctrl[2]), .out(t2[1]));
  mux2X1  temp3_00 (.in0(t3[0]), .in1(t3[4]), .sel(ctrl[2]), .out(t2[0]));



  //2 bits shift right
  mux2X1  temp2_31 (.in0(t2[31]), .in1(1'b0),   .sel(ctrl[1]), .out(t1[31]));
  mux2X1  temp2_30 (.in0(t2[30]), .in1(1'b0),   .sel(ctrl[1]), .out(t1[30]));
  mux2X1  temp2_29 (.in0(t2[29]), .in1(t2[31]), .sel(ctrl[1]), .out(t1[29]));
  mux2X1  temp2_28 (.in0(t2[28]), .in1(t2[30]), .sel(ctrl[1]), .out(t1[28]));
  mux2X1  temp2_27 (.in0(t2[27]), .in1(t2[29]), .sel(ctrl[1]), .out(t1[27]));
  mux2X1  temp2_26 (.in0(t2[26]), .in1(t2[28]), .sel(ctrl[1]), .out(t1[26]));
  mux2X1  temp2_25 (.in0(t2[25]), .in1(t2[27]), .sel(ctrl[1]), .out(t1[25]));
  mux2X1  temp2_24 (.in0(t2[24]), .in1(t2[26]), .sel(ctrl[1]), .out(t1[24]));

  mux2X1  temp2_23 (.in0(t2[23]), .in1(t2[25]), .sel(ctrl[1]), .out(t1[23]));
  mux2X1  temp2_22 (.in0(t2[22]), .in1(t2[24]), .sel(ctrl[1]), .out(t1[22]));
  mux2X1  temp2_21 (.in0(t2[21]), .in1(t2[23]), .sel(ctrl[1]), .out(t1[21]));
  mux2X1  temp2_20 (.in0(t2[20]), .in1(t2[22]), .sel(ctrl[1]), .out(t1[20]));
  mux2X1  temp2_19 (.in0(t2[19]), .in1(t2[21]), .sel(ctrl[1]), .out(t1[19]));
  mux2X1  temp2_18 (.in0(t2[18]), .in1(t2[20]), .sel(ctrl[1]), .out(t1[18]));
  mux2X1  temp2_17 (.in0(t2[17]), .in1(t2[19]), .sel(ctrl[1]), .out(t1[17]));
  mux2X1  temp2_16 (.in0(t2[16]), .in1(t2[18]), .sel(ctrl[1]), .out(t1[16]));

  mux2X1  temp2_15 (.in0(t2[15]), .in1(t2[17]), .sel(ctrl[1]), .out(t1[15]));
  mux2X1  temp2_14 (.in0(t2[14]), .in1(t2[16]), .sel(ctrl[1]), .out(t1[14]));
  mux2X1  temp2_13 (.in0(t2[13]), .in1(t2[15]), .sel(ctrl[1]), .out(t1[13]));
  mux2X1  temp2_12 (.in0(t2[12]), .in1(t2[14]), .sel(ctrl[1]), .out(t1[12]));
  mux2X1  temp2_11 (.in0(t2[11]), .in1(t2[13]), .sel(ctrl[1]), .out(t1[11]));
  mux2X1  temp2_10 (.in0(t2[10]), .in1(t2[12]), .sel(ctrl[1]), .out(t1[10]));
  mux2X1  temp2_09 (.in0(t2[9]),  .in1(t2[11]), .sel(ctrl[1]), .out(t1[9]));
  mux2X1  temp2_08 (.in0(t2[8]),  .in1(t2[10]), .sel(ctrl[1]), .out(t1[8]));

  mux2X1  temp2_07 (.in0(t2[7]), .in1(t2[9]), .sel(ctrl[1]), .out(t1[7]));
  mux2X1  temp2_06 (.in0(t2[6]), .in1(t2[8]), .sel(ctrl[1]), .out(t1[6]));
  mux2X1  temp2_05 (.in0(t2[5]), .in1(t2[7]), .sel(ctrl[1]), .out(t1[5]));
  mux2X1  temp2_04 (.in0(t2[4]), .in1(t2[6]), .sel(ctrl[1]), .out(t1[4]));
  mux2X1  temp2_03 (.in0(t2[3]), .in1(t2[5]), .sel(ctrl[1]), .out(t1[3]));
  mux2X1  temp2_02 (.in0(t2[2]), .in1(t2[4]), .sel(ctrl[1]), .out(t1[2]));
  mux2X1  temp2_01 (.in0(t2[1]), .in1(t2[3]), .sel(ctrl[1]), .out(t1[1]));
  mux2X1  temp2_00 (.in0(t2[0]), .in1(t2[2]), .sel(ctrl[1]), .out(t1[0]));


  //1 bit shift right
  mux2X1  temp1_31 (.in0(t1[31]), .in1(1'b0),   .sel(ctrl[0]), .out(out[31]));
  mux2X1  temp1_30 (.in0(t1[30]), .in1(t1[31]), .sel(ctrl[0]), .out(out[30]));
  mux2X1  temp1_29 (.in0(t1[29]), .in1(t1[30]), .sel(ctrl[0]), .out(out[29]));
  mux2X1  temp1_28 (.in0(t1[28]), .in1(t1[29]), .sel(ctrl[0]), .out(out[28]));
  mux2X1  temp1_27 (.in0(t1[27]), .in1(t1[28]), .sel(ctrl[0]), .out(out[27]));
  mux2X1  temp1_26 (.in0(t1[26]), .in1(t1[27]), .sel(ctrl[0]), .out(out[26]));
  mux2X1  temp1_25 (.in0(t1[25]), .in1(t1[26]), .sel(ctrl[0]), .out(out[25]));
  mux2X1  temp1_24 (.in0(t1[24]), .in1(t1[25]), .sel(ctrl[0]), .out(out[24]));

  mux2X1  temp1_23 (.in0(t1[23]), .in1(t1[24]), .sel(ctrl[0]), .out(out[23]));
  mux2X1  temp1_22 (.in0(t1[22]), .in1(t1[23]), .sel(ctrl[0]), .out(out[22]));
  mux2X1  temp1_21 (.in0(t1[21]), .in1(t1[22]), .sel(ctrl[0]), .out(out[21]));
  mux2X1  temp1_20 (.in0(t1[20]), .in1(t1[21]), .sel(ctrl[0]), .out(out[20]));
  mux2X1  temp1_19 (.in0(t1[19]), .in1(t1[20]), .sel(ctrl[0]), .out(out[19]));
  mux2X1  temp1_18 (.in0(t1[18]), .in1(t1[19]), .sel(ctrl[0]), .out(out[18]));
  mux2X1  temp1_17 (.in0(t1[17]), .in1(t1[18]), .sel(ctrl[0]), .out(out[17]));
  mux2X1  temp1_16 (.in0(t1[16]), .in1(t1[17]), .sel(ctrl[0]), .out(out[16]));

  mux2X1  temp1_15 (.in0(t1[15]), .in1(t1[16]), .sel(ctrl[0]), .out(out[15]));
  mux2X1  temp1_14 (.in0(t1[14]), .in1(t1[15]), .sel(ctrl[0]), .out(out[14]));
  mux2X1  temp1_13 (.in0(t1[13]), .in1(t1[14]), .sel(ctrl[0]), .out(out[13]));
  mux2X1  temp1_12 (.in0(t1[12]), .in1(t1[13]), .sel(ctrl[0]), .out(out[12]));
  mux2X1  temp1_11 (.in0(t1[11]), .in1(t1[12]), .sel(ctrl[0]), .out(out[11]));
  mux2X1  temp1_10 (.in0(t1[10]), .in1(t1[11]), .sel(ctrl[0]), .out(out[10]));
  mux2X1  temp1_09 (.in0(t1[9]),  .in1(t1[10]), .sel(ctrl[0]), .out(out[9]));
  mux2X1  temp1_08 (.in0(t1[8]),  .in1(t1[9]),  .sel(ctrl[0]), .out(out[8]));

  mux2X1  temp1_07 (.in0(t1[7]), .in1(t1[8]), .sel(ctrl[0]), .out(out[7]));
  mux2X1  temp1_06 (.in0(t1[6]), .in1(t1[7]), .sel(ctrl[0]), .out(out[6]));
  mux2X1  temp1_05 (.in0(t1[5]), .in1(t1[6]), .sel(ctrl[0]), .out(out[5]));
  mux2X1  temp1_04 (.in0(t1[4]), .in1(t1[5]), .sel(ctrl[0]), .out(out[4]));
  mux2X1  temp1_03 (.in0(t1[3]), .in1(t1[4]), .sel(ctrl[0]), .out(out[3]));
  mux2X1  temp1_02 (.in0(t1[2]), .in1(t1[3]), .sel(ctrl[0]), .out(out[2]));
  mux2X1  temp1_01 (.in0(t1[1]), .in1(t1[2]), .sel(ctrl[0]), .out(out[1]));
  mux2X1  temp1_00 (.in0(t1[0]), .in1(t1[1]), .sel(ctrl[0]), .out(out[0]));



		
 
endmodule