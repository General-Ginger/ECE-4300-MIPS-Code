`timescale 1ns / 1ps
`include "alu_control.v"

module alu_control_tb;

    reg [1:0] alu_op;
    reg [5:0] funct;
    wire [3:0] select;

    alu_control uut (
        .alu_op(alu_op),
        .funct(funct),
        .select(select)
    );

    initial begin

        $dumpfile("alu_control_tb.vcd");
        $dumpvars(0, alu_control_tb);

        alu_op = 2'b00;
        funct = 6'b000000;
        #10;

        $monitor("Time = %0d, alu_op = %d, funct = %d, select = %d", $time, alu_op, funct, select);

        alu_op = 2'b01;
        funct = 6'b000000;
        #10;

        alu_op = 2'b10;
        funct = 6'b100000;
        #10;

        alu_op = 2'b10;
        funct = 6'b100010;
        #10;

        alu_op = 2'b10;
        funct = 6'b100100;
        #10;

        alu_op = 2'b10;
        funct = 6'b100101;
        #10;

        alu_op = 2'b10;
        funct = 6'b101010;
        #10;

        alu_op = 2'b10;
        funct = 6'b111111;
        #10;

        alu_op = 2'b11;
        funct = 6'b000000;
        #10;

        $finish;
    end

endmodule
