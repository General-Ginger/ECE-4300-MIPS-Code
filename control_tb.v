`timescale 1ns / 1ps
`include "control.v"

module control_tb;

    reg [5:0] opcode;
    wire RegDst;
    wire ALUSrc;
    wire MemtoReg;
    wire RegWrite;
    wire MemRead;
    wire MemWrite;
    wire Branch;
    wire [1:0] ALUOp;

    control uut (
        .opcode(opcode),
        .RegDst(RegDst),
        .ALUSrc(ALUSrc),
        .MemtoReg(MemtoReg),
        .RegWrite(RegWrite),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .Branch(Branch),
        .ALUOp(ALUOp)
    );

    initial begin

        $dumpfile("control_tb.vcd");
        $dumpvars(0, control_tb);

        $monitor("Time = %0dns, opcode = %b, RegDst = %b, ALUSrc = %b, MemtoReg = %b, RegWrite = %b, MemRead = %b, MemWrite = %b, Branch = %b, ALUOp = %b",
                 $time, opcode, RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp);

        #10;
        opcode = 6'b000000;
        #10;

        opcode = 6'b100011;
        #10;

        opcode = 6'b101011;
        #10;

        opcode = 6'b000100;
        #10;

        opcode = 6'b111111;
        #10;

        $finish;
    end

endmodule
