`timescale 1ns/1ns
module FALU(a, b, c, less, control, cout, sum, ANDOut, OROut);

    input a, b, c, less, control;
    output cout, sum, ANDOut, OROut;

    and (ANDOut, a, b);
    or	(OROut,a, b);
    FA FA( .a(a), .b(b^control), .c(c), .cout(cout), .sum(sum));

endmodule
