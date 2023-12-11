`timescale 1ns/1ns
module EX_MEM (clk, rst, RegWrite_In, RegWrite, MemtoReg_In, MemtoReg, MemRead_In, MemRead, MemWrite_In, MemWrite,
                Branch_In, Branch, b_tgt_In, b_tgt, Zero_In, Zero, alu_out_In, alu_out, RD2_In, RD2, rfile_wn_In, rfile_wn );
  input clk, rst;
  // TO BE REGISTERED FOR ID STAGE
  input RegWrite_In, MemtoReg_In, MemRead_In, MemWrite_In, Branch_In, Zero_In;
  input [4:0] rfile_wn_In;
  input [31:0] b_tgt_In, alu_out_In, RD2_In;
  // REGISTERED VALUES FOR ID STAGE
  output reg RegWrite, MemtoReg, MemRead, MemWrite, Branch, Zero;
  output reg [4:0] rfile_wn;
  output reg [31:0] b_tgt, alu_out, RD2;

  always @ (posedge clk) begin
    if (rst) begin
      {RegWrite, MemtoReg, MemRead, MemWrite, Branch, b_tgt, Zero, alu_out, RD2, rfile_wn} <= 0;
    end
    else begin
      RegWrite <= RegWrite_In;
      MemtoReg <= MemtoReg_In;
      MemRead <= MemRead_In;
      MemWrite <= MemWrite_In;
      Branch <= Branch_In;
      b_tgt <= b_tgt_In;
      Zero <= Zero_In;
	  alu_out <= alu_out_In;
	  RD2 <= RD2_In;
	  rfile_wn <= rfile_wn_In;
    end
  end
endmodule // EXE_MEM