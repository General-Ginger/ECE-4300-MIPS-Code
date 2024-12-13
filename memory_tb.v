`timescale 1ns / 1ps
`include "memory.v"

module memory_tb;

    reg clk;
    reg MemRead;
    reg MemWrite;
    reg [31:0] address;
    reg [31:0] write_data;
    wire [31:0] read_data;

    memory uut (
        .clk(clk),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .address(address),
        .write_data(write_data),
        .read_data(read_data)
    );

    initial begin

        $dumpfile("memory_tb.vcd");
        $dumpvars(0, memory_tb);

        clk = 0;
        MemRead = 0;
        MemWrite = 0;
        address = 0;
        write_data = 0;

        #10 MemWrite = 1; address = 32'h00000010; write_data = 32'hDEADBEEF; #10;
        MemWrite = 0; MemRead = 1; address = 32'h00000010; #10;
        MemRead = 0; address = 32'h00000020; #10;
        MemWrite = 1; address = 32'h00000020; write_data = 32'hCAFEBABE; #10;
        MemWrite = 0; MemRead = 1; address = 32'h00000020; #10;

        $finish;
    end

endmodule
