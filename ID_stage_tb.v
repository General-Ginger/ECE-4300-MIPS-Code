`timescale 1ns / 1ps

`include "ID_stage.v"

module tb_ID_stage;

    reg clk;
    reg [31:0] instruction;
    reg [31:0] write_data;
    reg RegWrite;

    wire [31:0] read_data1;
    wire [31:0] read_data2;
    wire [31:0] sign_extended;

    ID_stage uut (
        .clk(clk),
        .instruction(instruction),
        .write_data(write_data),
        .RegWrite(RegWrite),
        .read_data1(read_data1),
        .read_data2(read_data2),
        .sign_extended(sign_extended)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin

        $dumpfile("ID_stage_tb.vcd");
        $dumpvars(0, tb_ID_stage);

        $monitor("Time: %0t | Instruction: %h | Read1: %h | Read2: %h | Sign Extended: %h",
                 $time, instruction, read_data1, read_data2, sign_extended);

        RegWrite = 1;
        instruction = 32'b000000_00001_00010_00011_00000_100000;
        write_data = 32'hA5A5A5A5;
        #10;

        instruction = 32'b100011_00001_00010_0000000000000100;
        RegWrite = 0;
        #10;

        write_data = 32'h5A5A5A5A;
        RegWrite = 1;
        instruction = 32'b000000_00011_00100_00101_00000_100000;
        #10;

        $finish;
    end

endmodule
