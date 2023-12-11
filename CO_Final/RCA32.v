`timescale 1ns/1ns
module RCA32(a, b, cin, cout, s, ANDOut, OROut, SLTOut);

    input    [31:0]    	a, b;
    input              	cin;
    output   [31:0]    	s;
    output   [31:0]    	cout, ANDOut, OROut, SLTOut;
    wire 		set;
    wire     [31:0]    	c;
    

    FALU       tfa0(.a(a[0]), .b(b[0]), .c(cin), .less(set), .control(cin), .cout(c[0]), .sum(s[0]), .ANDOut(ANDOut[0]), .OROut(OROut[0]));
    FALU       tfa1(.a(a[1]), .b(b[1]), .c(c[0]), .less(1'b0), .control(cin), .cout(c[1]), .sum(s[1]), .ANDOut(ANDOut[1]), .OROut(OROut[1]));
	FALU       tfa2(.a(a[2]), .b(b[2]), .c(c[1]), .less(1'b0), .control(cin), .cout(c[2]), .sum(s[2]), .ANDOut(ANDOut[2]), .OROut(OROut[2]));
	FALU       tfa3(.a(a[3]), .b(b[3]), .c(c[2]), .less(1'b0), .control(cin), .cout(c[3]), .sum(s[3]), .ANDOut(ANDOut[3]), .OROut(OROut[3]));
	FALU       tfa4(.a(a[4]), .b(b[4]), .c(c[3]), .less(1'b0), .control(cin), .cout(c[4]), .sum(s[4]), .ANDOut(ANDOut[4]), .OROut(OROut[4]));
	FALU       tfa5(.a(a[5]), .b(b[5]), .c(c[4]), .less(1'b0), .control(cin), .cout(c[5]), .sum(s[5]), .ANDOut(ANDOut[5]), .OROut(OROut[5]));
	FALU       tfa6(.a(a[6]), .b(b[6]), .c(c[5]), .less(1'b0), .control(cin), .cout(c[6]), .sum(s[6]), .ANDOut(ANDOut[6]), .OROut(OROut[6]));
	FALU       tfa7(.a(a[7]), .b(b[7]), .c(c[6]), .less(1'b0), .control(cin), .cout(c[7]), .sum(s[7]), .ANDOut(ANDOut[7]), .OROut(OROut[7]));
	FALU       tfa8(.a(a[8]), .b(b[8]), .c(c[7]), .less(1'b0), .control(cin), .cout(c[8]), .sum(s[8]), .ANDOut(ANDOut[8]), .OROut(OROut[8]));
	FALU       tfa9(.a(a[9]), .b(b[9]), .c(c[8]), .less(1'b0), .control(cin), .cout(c[9]), .sum(s[9]), .ANDOut(ANDOut[9]), .OROut(OROut[9]));
	FALU       tfa10(.a(a[10]), .b(b[10]), .c(c[9]), .less(1'b0), .control(cin), .cout(c[10]), .sum(s[10]), .ANDOut(ANDOut[10]), .OROut(OROut[10]));
	FALU       tfa11(.a(a[11]), .b(b[11]), .c(c[10]), .less(1'b0), .control(cin), .cout(c[11]), .sum(s[11]), .ANDOut(ANDOut[11]), .OROut(OROut[11]));
	FALU       tfa12(.a(a[12]), .b(b[12]), .c(c[11]), .less(1'b0), .control(cin), .cout(c[12]), .sum(s[12]), .ANDOut(ANDOut[12]), .OROut(OROut[12]));
	FALU       tfa13(.a(a[13]), .b(b[13]), .c(c[12]), .less(1'b0), .control(cin), .cout(c[13]), .sum(s[13]), .ANDOut(ANDOut[13]), .OROut(OROut[13]));
	FALU       tfa14(.a(a[14]), .b(b[14]), .c(c[13]), .less(1'b0), .control(cin), .cout(c[14]), .sum(s[14]), .ANDOut(ANDOut[14]), .OROut(OROut[14]));
	FALU       tfa15(.a(a[15]), .b(b[15]), .c(c[14]), .less(1'b0), .control(cin), .cout(c[15]), .sum(s[15]), .ANDOut(ANDOut[15]), .OROut(OROut[15]));
	FALU       tfa16(.a(a[16]), .b(b[16]), .c(c[15]), .less(1'b0), .control(cin), .cout(c[16]), .sum(s[16]), .ANDOut(ANDOut[16]), .OROut(OROut[16]));
	FALU       tfa17(.a(a[17]), .b(b[17]), .c(c[16]), .less(1'b0), .control(cin), .cout(c[17]), .sum(s[17]), .ANDOut(ANDOut[17]), .OROut(OROut[17]));
	FALU       tfa18(.a(a[18]), .b(b[18]), .c(c[17]), .less(1'b0), .control(cin), .cout(c[18]), .sum(s[18]), .ANDOut(ANDOut[18]), .OROut(OROut[18]));
	FALU       tfa19(.a(a[19]), .b(b[19]), .c(c[18]), .less(1'b0), .control(cin), .cout(c[19]), .sum(s[19]), .ANDOut(ANDOut[19]), .OROut(OROut[19]));
	FALU       tfa20(.a(a[20]), .b(b[20]), .c(c[19]), .less(1'b0), .control(cin), .cout(c[20]), .sum(s[20]), .ANDOut(ANDOut[20]), .OROut(OROut[20]));
	FALU       tfa21(.a(a[21]), .b(b[21]), .c(c[20]), .less(1'b0), .control(cin), .cout(c[21]), .sum(s[21]), .ANDOut(ANDOut[21]), .OROut(OROut[21]));
	FALU       tfa22(.a(a[22]), .b(b[22]), .c(c[21]), .less(1'b0), .control(cin), .cout(c[22]), .sum(s[22]), .ANDOut(ANDOut[22]), .OROut(OROut[22]));
	FALU       tfa23(.a(a[23]), .b(b[23]), .c(c[22]), .less(1'b0), .control(cin), .cout(c[23]), .sum(s[23]), .ANDOut(ANDOut[23]), .OROut(OROut[23]));
	FALU       tfa24(.a(a[24]), .b(b[24]), .c(c[23]), .less(1'b0), .control(cin), .cout(c[24]), .sum(s[24]), .ANDOut(ANDOut[24]), .OROut(OROut[24]));
	FALU       tfa25(.a(a[25]), .b(b[25]), .c(c[24]), .less(1'b0), .control(cin), .cout(c[25]), .sum(s[25]), .ANDOut(ANDOut[25]), .OROut(OROut[25]));
	FALU       tfa26(.a(a[26]), .b(b[26]), .c(c[25]), .less(1'b0), .control(cin), .cout(c[26]), .sum(s[26]), .ANDOut(ANDOut[26]), .OROut(OROut[26]));
	FALU       tfa27(.a(a[27]), .b(b[27]), .c(c[26]), .less(1'b0), .control(cin), .cout(c[27]), .sum(s[27]), .ANDOut(ANDOut[27]), .OROut(OROut[27]));
	FALU       tfa28(.a(a[28]), .b(b[28]), .c(c[27]), .less(1'b0), .control(cin), .cout(c[28]), .sum(s[28]), .ANDOut(ANDOut[28]), .OROut(OROut[28]));
	FALU       tfa29(.a(a[29]), .b(b[29]), .c(c[28]), .less(1'b0), .control(cin), .cout(c[29]), .sum(s[29]), .ANDOut(ANDOut[29]), .OROut(OROut[29]));
	FALU       tfa30(.a(a[30]), .b(b[30]), .c(c[29]), .less(1'b0), .control(cin), .cout(c[30]), .sum(s[30]), .ANDOut(ANDOut[30]), .OROut(OROut[30]));
	FALU       tfa31(.a(a[31]), .b(b[31]), .c(c[30]), .less(1'b0), .control(cin), .cout(c[31]), .sum(s[31]), .ANDOut(ANDOut[31]), .OROut(OROut[31]));
	assign	   SLTOut = s[31];

endmodule
