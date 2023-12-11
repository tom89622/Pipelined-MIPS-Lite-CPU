/*
	Title: MIPS Single-Cycle Control Unit
	Editor: Selene (Computer System and Architecture Lab, ICE, CYCU)
	
	Input Port
		1. opcode: 輸入的指令代號，據此產生對應的控制訊號
	Output Port
		1. RegDst: 控制RFMUX
		2. ALUSrc: 控制ALUMUX
		3. MemtoReg: 控制WRMUX
		4. RegWrite: 控制暫存器是否可寫入
		5. MemRead:  控制記憶體是否可讀出
		6. MemWrite: 控制記憶體是否可寫入
		7. Branch: 與ALU輸出的zero訊號做AND運算控制PCMUX
		8. ALUOp: 輸出至ALU Control
*/
`timescale 1ns/1ns
module control_single( opcode, funct, RegDst, ALUSrc, MemtoReg, RegWrite, 
					   MemRead, MemWrite, Branch, Jump, JumpR, ALUOp);
    input[5:0] opcode,funct;
    output RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, Jump, JumpR;
    output[5:0] ALUOp;
    reg RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, Jump, JumpR;
    reg[5:0] ALUOp;

    parameter R_FORMAT = 6'd0;
	parameter ORI      = 6'd14;
    parameter LW       = 6'd35;
    parameter SW       = 6'd43;
    parameter BEQ      = 6'd4;
	parameter J        = 6'd2;
	
	parameter F_JR     = 6'd8;
	parameter F_NOP    = 6'd0;
	
	// ALUOp 訊號
	parameter AND = 6'b100100;
	parameter OR  = 6'b100101;
	parameter ADD = 6'b100000;
	parameter SUB = 6'b100010;
	parameter SLT = 6'b101010;
	parameter SRL = 6'b000010;
	parameter DIVU= 6'b011011;
	parameter MFHI= 6'b010000;
	parameter MFLO= 6'b010010;
	

    always @( opcode or funct ) begin
        case ( opcode )
          R_FORMAT : 
          begin
			case (funct)
				F_JR : 
				begin
					RegDst = 1'bx; ALUSrc = 1'b0; MemtoReg = 1'bx; RegWrite = 1'b0; MemRead = 1'b0; 
					MemWrite = 1'b0; Branch = 1'b1; Jump = 1'b1; JumpR = 1'b1; ALUOp = 6'bxxxxxx;
				end
				F_NOP :
				begin
					RegDst = 1'b0; ALUSrc = 1'b0; MemtoReg = 1'b0; RegWrite = 1'b0; MemRead = 1'b0; 
					MemWrite = 1'b0; Branch = 1'b0; Jump = 1'b0; JumpR = 1'b0; ALUOp = 6'b000000;
				end
				
				default 
				begin
					RegDst = 1'b1; ALUSrc = 1'b0; MemtoReg = 1'b0; RegWrite = 1'b1; MemRead = 1'b0; 
					MemWrite = 1'b0; Branch = 1'b0; Jump = 1'b0; JumpR = 1'bx; ALUOp = funct;
				end
			endcase
          end
		  ORI :
		  begin
				RegDst = 1'b0; ALUSrc = 1'b1; MemtoReg = 1'b0; RegWrite = 1'b1; MemRead = 1'b0; 
				MemWrite = 1'b0; Branch = 1'b0; Jump = 1'b0; JumpR = 1'bx; ALUOp = OR;
		  end
          LW :
          begin
				RegDst = 1'b0; ALUSrc = 1'b1; MemtoReg = 1'b1; RegWrite = 1'b1; MemRead = 1'b1; 
				MemWrite = 1'b0; Branch = 1'b0; Jump = 1'b0; JumpR = 1'bx; ALUOp = ADD;
          end
          SW :
          begin
				RegDst = 1'bx; ALUSrc = 1'b1; MemtoReg = 1'bx; RegWrite = 1'b0; MemRead = 1'b0; 
				MemWrite = 1'b1; Branch = 1'b0; Jump = 1'b0; JumpR = 1'bx; ALUOp = ADD;
          end
          BEQ :
          begin
				RegDst = 1'bx; ALUSrc = 1'b0; MemtoReg = 1'bx; RegWrite = 1'b0; MemRead = 1'b0; 
				MemWrite = 1'b0; Branch = 1'b1; Jump = 1'b0; JumpR = 1'bx; ALUOp = SUB;
          end
		  J :
		  begin
				RegDst = 1'bx; ALUSrc = 1'b0; MemtoReg = 1'bx; RegWrite = 1'b0; MemRead = 1'b0; 
				MemWrite = 1'b0; Branch = 1'b1; Jump = 1'b1; JumpR = 1'b0; ALUOp = SUB;
		  end
          default
          begin
				$display("control_single unimplemented opcode %d", opcode);
				RegDst=1'bx; ALUSrc=1'bx; MemtoReg=1'bx; RegWrite=1'bx; MemRead=1'bx; 
				MemWrite=1'bx; Branch=1'bx; Jump = 1'bx; JumpR = 1'bx; ALUOp = 6'bxxxxxx;
          end

        endcase
    end
endmodule

