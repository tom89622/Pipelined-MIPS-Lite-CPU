`timescale 1ns/1ns
module MEM_WB (clk, rst, RegWrite_In, RegWrite, MemtoReg_In, MemtoReg, RD_In, RD, alu_out_In, alu_out, rfile_wn_In, rfile_wn );
  input clk, rst;
  
  input RegWrite_In, MemtoReg_In;
  input [4:0] rfile_wn_In;
  input [31:0] RD_In, alu_out_In;
  output reg RegWrite, MemtoReg;
  output reg [4:0] rfile_wn;
  output reg [31:0] RD, alu_out;

  always @ (posedge clk) begin
    if (rst) begin
      {RegWrite, MemtoReg, rfile_wn, RD, alu_out} <= 0;
    end
    else begin
      RegWrite <= RegWrite_In;
      MemtoReg <= MemtoReg_In;
      rfile_wn <= rfile_wn_In;
      RD <= RD_In;
      alu_out <= alu_out_In;
    end
  end
endmodule // MEM_WB