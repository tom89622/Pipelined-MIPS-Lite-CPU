`timescale 1ns/1ns
module ALU( dataA, dataB, Signal, dataOut, reset, zero );
input reset ;
input [31:0] dataA ;
input [31:0] dataB ;
input [5:0] Signal ;
output [31:0] dataOut ;
output zero;

wire [31:0] temp;
wire control;
reg less ;
wire  [31:0] ANDOut, OROut, ADDOut, SUBOut, SLTOut, cout;

//   Signal ( 6-bits)?
//   AND  : 36
//   OR   : 37
//   ADD  : 32
//   SUB  : 34
//   SLT  : 42

//   reg [31:0] temp ;

parameter AND = 6'b100100;
parameter OR  = 6'b100101;
parameter ADD = 6'b100000;
parameter SUB = 6'b100010;
parameter SLT = 6'b101010;
/*
??????
*/



assign control = ( Signal == AND ) ? 0 :
	     	 ( Signal == OR  ) ? 0 :
	     	 ( Signal == ADD ) ? 0 :
	     	 ( Signal == SUB ) ? 1 :
	     	 ( Signal == SLT ) ? 1 : 0 ;

RCA32 U_RCA32( .a(dataA), .b(dataB), .cin(control), .cout(cout), .s(temp), .ANDOut(ANDOut), .OROut(OROut), .SLTOut(SLTOut) ) ;


assign dataOut = ( Signal == AND ) ? ANDOut :
	     	 ( Signal == OR  ) ? OROut  :
	     	 ( Signal == ADD ) ? temp :
	     	 ( Signal == SUB ) ? temp :
	     	 ( Signal == SLT ) ? SLTOut : 32'd0 ;
assign zero = SLTOut;
	// assign dataOut = temp ;
/*
=====================================================
??????????????????????????
=====================================================
*/

endmodule
