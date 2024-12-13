`include "add.v"
`timescale 1ns / 1ps

module add_tb;

    reg [31:0] a;
    reg [31:0] b;
    wire [31:0] sum;

    add uut (
        .a(a),
        .b(b),
        .sum(sum)
    );

    initial begin

        $dumpfile("add_tb.vcd");
        $dumpvars(0, add_tb);

        a = 32'h00000001;
        b = 32'h00000002;
        #10;

        a = 32'hFFFFFFFF;
        b = 32'h00000001;
        #10;

        a = 32'h7FFFFFFF;
        b = 32'h00000001;
        #10;

        a = 32'h80000000;
        b = 32'h80000000;
        #10;

        $finish;
    end

endmodule
