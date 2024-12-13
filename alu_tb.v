`timescale 1ns / 1ps
`include "alu.v"

module alu_tb;

    reg [31:0] A;
    reg [31:0] B;
    reg [3:0] control;

    wire [31:0] Y;
    wire zero;

    alu uut (
        .A(A),
        .B(B),
        .control(control),
        .Y(Y),
        .zero(zero)
    );

    initial begin

        $dumpfile("alu_tb.vcd");
        $dumpvars(0, alu_tb);

        A = 32'b0;
        B = 32'b0;
        control = 4'b0000;

        $monitor("Time = %0d, A = %d, B = %d, control = %d, Y = %d, zero = %d", $time, A, B, control, Y, zero);

        control = 4'b0010;
        A = 32'h0000000A;
        B = 32'h00000014;
        #10;

        control = 4'b0110;
        A = 32'h00000020;
        B = 32'h00000010;
        #10;

        control = 4'b0000;
        A = 32'hF0F0F0F0;
        B = 32'h0F0F0F0F;
        #10;

        control = 4'b0001;
        A = 32'hF0F0F0F0;
        B = 32'h0F0F0F0F;
        #10;

        control = 4'b0111;
        A = 32'h00000005;
        B = 32'h0000000A;
        #10;

        control = 4'b0111;
        A = 32'h0000000A;
        B = 32'h00000005;
        #10;

        control = 4'b0110;
        A = 32'h00000020;
        B = 32'h00000020;
        #10;

        control = 4'b1111;
        A = 32'h12345678;
        B = 32'h87654321;
        #10;


        // Finish simulation
        $finish;
    end

endmodule
