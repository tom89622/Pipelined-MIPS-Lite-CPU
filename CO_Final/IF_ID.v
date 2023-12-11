`timescale 1ns/1ns
module IF_ID (clk, rst, PCIn, instructionIn, PC, instruction);	// flush, freeze
  input clk, rst;
  input [31:0] PCIn, instructionIn;
  output reg [31:0] PC, instruction;
  always @ (posedge clk) begin
    if (rst) begin
      PC <= 0;
      instruction <= 0;
    end
    else begin
       instruction <= instructionIn;
       PC <= PCIn;
     end
  end
 endmodule // IF_ID
 /*
   always @ (posedge clk) begin
    if (rst) begin
      PC <= 0;
      instruction <= 0;
    end
    else begin
      if (~freeze) begin
        if (flush) begin
          instruction <= 0;
          PC <= 0;
        end
        else begin
          instruction <= instructionIn;
          PC <= PCIn;
        end
      end
    end
  end
 endmodule // IF_ID
 */