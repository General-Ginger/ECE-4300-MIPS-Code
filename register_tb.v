`timescale 1ns / 1ps
`include "register.v"

module register_tb;

    reg [4:0] rs;
    reg [4:0] rt;
    reg [4:0] rd;
    reg [31:0] write_data;
    reg regWrite;
    reg clk;

    wire [31:0] A;
    wire [31:0] B;

    register uut (
        .rs(rs),
        .rt(rt),
        .rd(rd),
        .write_data(write_data),
        .regWrite(regWrite),
        .A(A),
        .B(B),
        .clk(clk)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin

        $dumpfile("register_tb.vcd");
        $dumpvars(0, register_tb);

        rs = 0;
        rt = 0;
        rd = 0;
        write_data = 0;
        regWrite = 0;

        $monitor("Time = %0dns, rs = %d, rd = %d, write_data = %d, regWrite = %b, A = %d, B = %d",
                 $time, rs, rd, write_data, regWrite, A, B);

        #10;
        rd = 5;
        write_data = 32'hA5A5A5A5;
        regWrite = 1;
        #10;
        regWrite = 0;

        #10;
        rs = 5;

        #10;
        rd = 10;
        write_data = 32'h12345678;
        regWrite = 1;
        #10;
        regWrite = 0;

        #10;
        rs = 10;

        #50;
        $finish;
    end

endmodule
