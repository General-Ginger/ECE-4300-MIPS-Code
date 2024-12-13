`timescale 1ns / 1ps
`include "sign_extend.v"

module sign_Extend_tb;

    reg [15:0] nextend;
    wire [31:0] extended;

    sign_Extend uut (
        .nextend(nextend),
        .extended(extended)
    );

    initial begin

        $dumpfile("sign_Extend_tb.vcd");
        $dumpvars(0, sign_Extend_tb);

        $monitor("Time = %0dns, nextend = %b, extended = %b", $time, nextend, extended);

        #10;
        nextend = 16'b0000_0000_0000_1010;

        #10;
        nextend = 16'b1111_1111_1111_1010;

        #10;
        nextend = 16'b0000_0000_0000_0000;

        #10;
        nextend = 16'b0111_1111_1111_1111;

        #10;
        nextend = 16'b1000_0000_0000_0000;

        #10;
        $finish;
    end

endmodule