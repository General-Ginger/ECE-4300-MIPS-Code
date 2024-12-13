`timescale 1ns / 1ps
`include "latch.v"

module latch_tb;

    reg clk;
    reg reset;
    reg Branch;
    reg Zero;
    reg MemRead;
    reg MemWrite;
    reg [31:0] alu_result_in;
    reg [31:0] write_data;
    reg [4:0] write_reg;
    reg [1:0] control_wb_in;
    wire PCSrc;
    wire [31:0] read_data;
    wire [31:0] mem_ALU_result;
    wire [4:0] mem_Write_reg;
    wire [1:0] mem_control_wb;

    latch uut (
        .clk(clk),
        .reset(reset),
        .Branch(Branch),
        .Zero(Zero),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .alu_result_in(alu_result_in),
        .write_data(write_data),
        .write_reg(write_reg),
        .control_wb_in(control_wb_in),
        .PCSrc(PCSrc),
        .read_data(read_data),
        .mem_ALU_result(mem_ALU_result),
        .mem_Write_reg(mem_Write_reg),
        .mem_control_wb(mem_control_wb)
    );

    initial begin

        $dumpfile("latch_tb.vcd");
        $dumpvars(0, latch_tb);

        clk = 0;
        reset = 1;
        Branch = 0;
        Zero = 0;
        MemRead = 0;
        MemWrite = 0;
        alu_result_in = 0;
        write_data = 0;
        write_reg = 0;
        control_wb_in = 0;

        #10 reset = 0; Branch = 1; Zero = 1; alu_result_in = 32'h00000010; MemRead = 1; #10;
        MemRead = 0; MemWrite = 1; write_data = 32'hDEADBEEF; alu_result_in = 32'h00000020; #10;
        MemWrite = 0; MemRead = 1; alu_result_in = 32'h00000020; #10;
        Branch = 0; Zero = 0; control_wb_in = 2'b10; write_reg = 5'b10101; #10;

        $finish;
    end

endmodule
