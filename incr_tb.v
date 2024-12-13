`include "incr.v"
module test_incr;

wire [31:0] IncrOut;
reg [31:0] A;

incr incr1 (A, IncrOut);

initial begin

    $dumpfile("incr_tb.vcd");
    $dumpvars(0, test_incr);

    
    #10;
    A = 3;
    #10;
    A = 15;
    #10;
    A = 64;
    #5;
end

always @(A)
    #1 $display("Time = %0d\tA=%0d\tIncrOut=%0d", $time,
        A, IncrOut);

endmodule