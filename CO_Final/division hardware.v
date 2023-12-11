`timescale 1ns/1ns
module Divider( clk, dataA, dataB, Signal, dataOut, reset );
input clk ;
input reset ;
input [31:0] dataA ;
input [31:0] dataB ;
input [5:0] Signal ;
output [63:0] dataOut ;

//   Signal ( 6-bits)?
//   DIVU  : 27

reg [63:0] temp, divisor, remainder, dataOut;
reg [31:0] quot;
reg [6:0] cycle;
reg start;
reg rst;
parameter DIVU = 6'b011011;
parameter OUT = 6'b111111;
/*
定義各種訊號
*/
always@( posedge clk or reset ) begin
	if (reset) begin
		temp = 64'd0;
		divisor = 64'd0;
		remainder = 64'd0;
		quot = 32'd0;
		start = 1'b1;
		dataOut = 64'd0;
	end
	if (rst) begin
		temp = 64'd0;
		divisor = 64'd0;
		remainder = 64'd0;
		quot = 32'd0;
		start = 1'b1;
		rst = 1'b0;
	end
	else begin
		case (Signal)          
		DIVU:
		begin
			if(start) begin
				remainder[31:0] = dataA;
				start = 1'b0;
				divisor[63:32] = dataB;
			end
			remainder = remainder - divisor; 
			if (remainder[63] == 1'b0) begin
				quot = quot << 1;
				quot[0] = 1 ; 
				//dataOut = {quot,remainder[31:0]};
				//dataOut = remainder;
			end
			else begin
				remainder = remainder + divisor;
				quot = quot << 1;
				//dataOut = {quot,remainder[31:0]};
				//dataOut = remainder;
			end
			divisor = divisor >> 1;
			//divisor = {1'b0, divisor[63:1]};
		end
			
		OUT:
		begin
			dataOut <= {quot[31:0],remainder[31:0]};
			rst = 1'b1;
			//dataOut = remainder;
		end
		endcase
	end
end

/*
=====================================================
上面為模擬範例，程式撰寫請遵照老師上課說明的方法來寫
=====================================================
*/
endmodule