`timescale 1ns/1ns
module TotalALU( clk, reset, dataA, dataB, Signal, Output, zero );
input reset ;
input clk ;
input [31:0] dataA ;
input [31:0] dataB ;
input [5:0] Signal ;
output [31:0] Output ;
output zero;

//   Signal ( 6-bits)?
//   AND  : 36
//   OR   : 37
//   ADD  : 32
//   SUB  : 34
//   SRL  : 2
//   SLT  : 42
//   DIVU : 27

wire [31:0] temp ;

parameter AND = 6'b100100;
parameter OR  = 6'b100101;
parameter ADD = 6'b100000;
parameter SUB = 6'b100010;
parameter SLT = 6'b101010;

parameter SRL = 6'b000010;

parameter DIVU= 6'b011011;
parameter MFHI= 6'b010000;
parameter MFLO= 6'b010010;
/*
�w�q�U�ذT��
*/
//============================
wire [5:0]  SignaltoALU ;
wire [5:0]  SignaltoSHT ;
wire [5:0]  SignaltoDIV ;
wire [5:0]  SignaltoMUX ;
wire [31:0] ALUOut, HiOut, LoOut, ShifterOut ;
wire [31:0] dataOut ;
wire [63:0] DivAns ;
/*
�w�q�U�ر��u
*/
//============================

ALUControl ALUControl( .clk(clk), .Signal(Signal), .SignaltoALU(SignaltoALU), .SignaltoSHT(SignaltoSHT), .SignaltoDIV(SignaltoDIV), .SignaltoMUX(SignaltoMUX) );
ALU ALU( .dataA(dataA), .dataB(dataB), .Signal(SignaltoALU), .dataOut(ALUOut), .reset(reset), .zero(zero) );
Divider Divider( .clk(clk), .dataA(dataA), .dataB(dataB), .Signal(SignaltoDIV), .dataOut(DivAns), .reset(reset) );
Shifter Shifter( .in(dataA), .ctrl(dataB), .out(ShifterOut));
HiLo HiLo( .clk(clk), .DivAns(DivAns), .HiOut(HiOut), .LoOut(LoOut), .reset(reset) );
MUX MUX( .ALUOut(ALUOut), .HiOut(HiOut), .LoOut(LoOut), .Shifter(ShifterOut), .Signal(SignaltoMUX), .dataOut(dataOut) );
/*
�إߦU��module
*/
assign Output = dataOut ;


endmodule