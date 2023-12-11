`timescale 1ns/1ns
module ID_EX (clk, rst, RegWrite_In, RegWrite, MemtoReg_In, MemtoReg, MemRead_In, MemRead, MemWrite_In, MemWrite,
              Branch_In, Branch, ALUOp_In, ALUOp, RegDst_In, RegDst, ALUSrc_In, ALUSrc, PC_In, PC, RD1_In, RD1, RD2_In, RD2,
			  extend_immed_In, extend_immed, rt_In, rt, rd_In, rd);
  input clk, rst;

  input RegWrite_In, MemtoReg_In, MemRead_In, MemWrite_In, Branch_In, RegDst_In, ALUSrc_In;
  input [5:0] ALUOp_In;
  input [31:0] PC_In, RD1_In, RD2_In, extend_immed_In;
  input [4:0] rt_In, rd_In;
  output reg RegWrite, MemtoReg, MemRead, MemWrite, Branch, RegDst, ALUSrc;
  output reg [5:0] ALUOp;
  output reg [4:0] rt, rd;
  output reg [31:0] PC, RD1, RD2, extend_immed;
  


  always @ (posedge clk) begin
    if (rst) begin
      {RegWrite, MemtoReg, MemRead, MemWrite, Branch, RegDst, ALUSrc, ALUOp, PC, RD1, RD2} <= 0;
    end
    else begin
      RegWrite <= RegWrite_In;
      MemtoReg <= MemtoReg_In;
      MemRead <= MemRead_In;
      MemWrite <= MemWrite_In;
      Branch <= Branch_In;
      RegDst <= RegDst_In;
      ALUSrc <= ALUSrc_In;
      ALUOp <= ALUOp_In;
      PC <= PC_In;
      RD1 <= RD1_In;
      RD2 <= RD2_In;
	  extend_immed <= extend_immed_In;
	  rt <= rt_In;
	  rd <= rd_In;
    end
  end
endmodule // ID_EX