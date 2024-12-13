`timescale 1ns / 1ps
`include "adder.v"

module adder_tb;

    reg [31:0] A;
    reg [31:0] B;

    wire [31:0] Y;

    adder uut (
        .A(A),
        .B(B),
        .Y(Y)
    );

    initial begin

        $dumpfile("adder_tb_2.vcd");
        $dumpvars(0, adder_tb);

        A = 32'b0;
        B = 32'b0;

        $monitor("Time = %0d, A = %d, B = %d, Y = %d", $time, A, B, Y);

        #10;

        A = 32'h00000000;
        B = 32'h00000000;
        #10;

        A = 32'h0000000A;
        B = 32'h00000014;
        #10;

        A = -32'd10;
        B = -32'd20;
        #10;

        A = 32'd15;
        B = -32'd5;
        #10;

        $finish;
    end

endmodule
