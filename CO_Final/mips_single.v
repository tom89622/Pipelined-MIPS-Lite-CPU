//	Title: MIPS Single-Cycle Processor
//	Editor: Selene (Computer System and Architecture Lab, ICE, CYCU)
`timescale 1ns/1ns
module mips_single( clk, rst );
	input clk, rst;
	
	// instruction bus
	wire[31:0] instr;
	wire[31:0] instr_fromInstrMem;
	
	// break out important fields from instruction
	wire [5:0] opcode, funct;
    wire [4:0] rs, rt, rd, shamt;
	wire [4:0] rt_fromID_EX, rd_fromID_EX;
    wire [15:0] immed;
    wire [31:0] extend_immed, b_offset;
	wire [31:0] extend_immed_fromID_EX;
    wire [25:0] jumpoffset;
	
	// datapath signals
    wire [4:0] rfile_wn;
	wire [4:0] rfile_wn_fromEX_MEM, rfile_wn_fromMEM_WB;
    wire [31:0] rfile_rd1, rfile_rd2, rfile_wd, alu_b, alu_out, pc_next,
                pc, pc_incr, dmem_rdata, jump_addr, jump_addr_imm, branch_addr;
	wire [31:0] dmem_rdata_fromMEM_WB;
	wire [31:0] alu_out_fromEX_MEM, alu_out_fromMEM_WB;
	wire [31:0] rfile_rd1_fromID_EX, rfile_rd2_fromID_EX, rfile_rd2_fromEX_MEM;
	wire [31:0] b_tgt_fromBRADD, b_tgt_fromEX_MEM;
	wire [31:0]	pc_incr_fromIF_ID, pc_incr_fromID_EX;
	// control signals
    wire RegWrite, Branch, PCSrc, RegDst, MemtoReg, MemRead, MemWrite, ALUSrc, Zero, Jump, JumpR;
	wire Zero_fromEX_MEM;
	wire RegWrite_fromID_EX, RegWrite_fromEX_MEM, RegWrite_fromMEM_WB;
	wire MemtoReg_fromID_EX, MemtoReg_fromEX_MEM, MemtoReg_fromMEM_WB;
	wire MemRead_fromID_EX, MemRead_fromEX_MEM;
	wire MemWrite_fromID_EX, MemWrite_fromEX_MEM;
	wire Branch_fromID_EX, Branch_fromEX_MEM;
	wire RegDst_fromID_EX;
	wire ALUSrc_fromID_EX;
	//wire freeze;
	
    wire [5:0] ALUOp;
	wire [5:0] ALUOp_fromID_EX;
	
    assign opcode = instr[31:26];
    assign rs = instr[25:21];
    assign rt = instr[20:16];
    assign rd = instr[15:11];
    assign shamt = instr[10:6];
    assign funct = instr[5:0];
    assign immed = instr[15:0];
    assign jumpoffset = instr[25:0];
	
	// branch offset shifter
    assign b_offset = extend_immed_fromID_EX << 2;
	
	// jump offset shifter & concatenation
	assign jump_addr_imm = { pc_incr[31:28], jumpoffset <<2 };

	// module instantiations
	// IF
	mux2 #(32) JRMUX( .sel(JumpR), .a(jump_addr_imm), .b(rfile_rd1), .y(jump_addr) );
	
	mux2 #(32) JMUX( .sel(Jump), .a(branch_addr), .b(jump_addr), .y(pc_next) );
	
	mux2 #(32) PCMUX( .sel(PCSrc), .a(pc_incr), .b(b_tgt_fromEX_MEM), .y(branch_addr) );
	
	reg32 PC( .clk(clk), .rst(rst), .en_reg(1'b1), .d_in(pc_next), .d_out(pc) );
	
	add32 PCADD( .a(pc), .b(32'd4), .result(pc_incr) );
	
	memory InstrMem(.clk(clk), .MemRead(1'b1), .MemWrite(1'b0), .wd(32'd0), .addr(pc), .rd(instr_fromInstrMem) );
	
	// IF
	IF_ID IF_ID(.clk(clk), .rst(rst), .PCIn(pc_incr), .instructionIn(instr_fromInstrMem), .PC(pc_incr_fromIF_ID), .instruction(instr));
	/*
	hazard_detection Hazard(.Branch(Branch), .Branch_fromID_EX(Branch_fromID_EX), .Branch_fromEX_MEM(Branch_fromEX_MEM), .RN1(rs), .RN2(rt),
							.WN_fromID_EX(rfile_wn), .WN_fromEX_MEM(rfile_wn_fromEX_MEM), .RegWrite_fromID_EX(RegWrite_fromID_EX), 
                            .RegWrite_fromEX_MEM(RegWrite_fromEX_MEM), .freeze(freeze));
	// ID*/
	control_single CTL(.opcode(opcode), .funct(funct), .RegDst(RegDst), .ALUSrc(ALUSrc), .MemtoReg(MemtoReg), 
                       .RegWrite(RegWrite), .MemRead(MemRead), .MemWrite(MemWrite), .Branch(Branch), 
                       .Jump(Jump), .JumpR(JumpR), .ALUOp(ALUOp));
	
	reg_file RegFile(.clk(clk), .RegWrite(RegWrite_fromMEM_WB), .RN1(rs), .RN2(rt), .WN(rfile_wn_fromMEM_WB), 
					 .WD(rfile_wd), .RD1(rfile_rd1), .RD2(rfile_rd2) );

	sign_extend SignExt( .immed_in(immed), .ext_immed_out(extend_immed) );
	// sign-extender
	// ID
	ID_EX ID_EX(.clk(clk), .rst(rst), .RegWrite_In(RegWrite), .RegWrite(RegWrite_fromID_EX), .MemtoReg_In(MemtoReg), .MemtoReg(MemtoReg_fromID_EX),
				.MemRead_In(MemRead), .MemRead(MemRead_fromID_EX), .MemWrite_In(MemWrite), .MemWrite(MemWrite_fromID_EX), .Branch_In(Branch), .Branch(Branch_fromID_EX),
				.ALUOp_In(ALUOp), .ALUOp(ALUOp_fromID_EX), .RegDst_In(RegDst), .RegDst(RegDst_fromID_EX), .ALUSrc_In(ALUSrc), .ALUSrc(ALUSrc_fromID_EX), .PC_In(pc_incr_fromIF_ID),
				.PC(pc_incr_fromID_EX), .RD1_In(rfile_rd1), .RD1(rfile_rd1_fromID_EX), .RD2_In(rfile_rd2), .RD2(rfile_rd2_fromID_EX),
			    .extend_immed_In(extend_immed), .extend_immed(extend_immed_fromID_EX), .rt_In(rt), .rt(rt_fromID_EX), .rd_In(rd), .rd(rd_fromID_EX));
	// EX
    add32 BRADD( .a(pc_incr_fromID_EX), .b(b_offset), .result(b_tgt_fromBRADD) );

	mux2 #(32) ALUMUX( .sel(ALUSrc_fromID_EX), .a(rfile_rd2_fromID_EX), .b(extend_immed_fromID_EX), .y(alu_b) );

	// alu_ctl ALUCTL( .ALUOp(ALUOp_fromID_EX), .Funct(extend_immed_fromID_EX[5:0]), .ALUOperation(Operation) );
	
    //alu ALU( .ctl(ALUOp_fromID_EX), .a(rfile_rd1_fromID_EX), .b(alu_b), .result(alu_out), .zero(Zero) );

	TotalALU ALU( .clk(clk), .reset(rst), .dataA(rfile_rd1_fromID_EX), .dataB(alu_b), .Signal(ALUOp_fromID_EX), .Output(alu_out), .zero(Zero) );
	
	mux2 #(5) RFMUX( .sel(RegDst_fromID_EX), .a(rt_fromID_EX), .b(rd_fromID_EX), .y(rfile_wn) );
	
	// EX
	EX_MEM EX_MEM (.clk(clk), .rst(rst), .RegWrite_In(RegWrite_fromID_EX), .RegWrite(RegWrite_fromEX_MEM), .MemtoReg_In(MemtoReg_fromID_EX), .MemtoReg(MemtoReg_fromEX_MEM),
				   .MemRead_In(MemRead_fromID_EX), .MemRead(MemRead_fromEX_MEM), .MemWrite_In(MemWrite_fromID_EX), .MemWrite(MemWrite_fromEX_MEM),
                   .Branch_In(Branch_fromID_EX), .Branch(Branch_fromEX_MEM), .b_tgt_In(b_tgt_fromBRADD), .b_tgt(b_tgt_fromEX_MEM), .Zero_In(Zero), .Zero(Zero_fromEX_MEM),
				   .alu_out_In(alu_out), .alu_out(alu_out_fromEX_MEM), .RD2_In(rfile_rd2_fromID_EX), .RD2(rfile_rd2_fromEX_MEM), .rfile_wn_In(rfile_wn), .rfile_wn(rfile_wn_fromEX_MEM) );

	// MEM			   
	and BR_AND(PCSrc, Branch_fromEX_MEM, Zero_fromEX_MEM);
	
	memory DatMem( .clk(clk), .MemRead(MemRead_fromEX_MEM), .MemWrite(MemWrite_fromEX_MEM), .wd(rfile_rd2_fromEX_MEM), 
				   .addr(alu_out_fromEX_MEM), .rd(dmem_rdata) );	
	// MEM
	
	MEM_WB MEM_WB (.clk(clk), .rst(rst), .RegWrite_In(RegWrite_fromEX_MEM), .RegWrite(RegWrite_fromMEM_WB), .MemtoReg_In(MemtoReg_fromEX_MEM), .MemtoReg(MemtoReg_fromMEM_WB),
				   .RD_In(dmem_rdata), .RD(dmem_rdata_fromMEM_WB), .alu_out_In(alu_out_fromEX_MEM), .alu_out(alu_out_fromMEM_WB), .rfile_wn_In(rfile_wn_fromEX_MEM), .rfile_wn(rfile_wn_fromMEM_WB) );
	
	mux2 #(32) WRMUX( .sel(MemtoReg_fromMEM_WB), .a(alu_out_fromMEM_WB), .b(dmem_rdata_fromMEM_WB), .y(rfile_wd) );

	
	

	   
				   
endmodule
