`timescale 1ns / 1ps
`include "mux.v"

module mux_tb;

    reg [31:0] A;
    reg [31:0] B;
    reg sel;

    wire [31:0] Y;

    mux uut (
        .A(A),
        .B(B),
        .sel(sel),
        .Y(Y)
    );

    initial begin

        $dumpfile("mux_ex_tb.vcd");
        $dumpvars(0, mux_tb);

        A = 32'h00000000;
        B = 32'h00000000;
        sel = 1'b0;

        $monitor("Time = %0d, A =  %d, b= %d, sel = %d, Y = %d", $time, A, B, sel, Y);

        A = 32'hAAAAAAAA;
        B = 32'h55555555;
        sel = 1'b0;
        #10;

        sel = 1'b1;
        #10;

        A = 32'h12345678;
        sel = 1'b0;
        #10;

        B = 32'h9ABCDEF0;
        sel = 1'b1;
        #10;

        A = 32'h11111111;
        B = 32'h11111111;
        sel = 1'b0;
        #10;

        sel = 1'b1;
        #10;

        A = 32'h87654321;
        B = 32'hDEADBEEF;
        sel = 1'b0;
        #10;

        sel = 1'b1;
        #10;

        $finish;
    end

endmodule
