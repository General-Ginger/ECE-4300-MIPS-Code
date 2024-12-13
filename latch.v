`include "branch stuff/branch.v"
`include "memory stuff/memory.v"

module latch (
    input clk,
    input reset,
    input Branch,
    input Zero,
    input MemRead,
    input MemWrite,
    input [31:0] alu_result_in,
    input [31:0] write_data,
    input [4:0] write_reg,
    input [1:0] control_wb_in,
    output PCSrc,
    output [31:0] read_data,
    output [31:0] mem_ALU_result,
    output [4:0] mem_Write_reg,
    output [1:0] mem_control_wb
);

    wire variable = control_wb_in;
    assign mem_control_wb = variable;
    wire variable2 = alu_result_in;
    assign mem_ALU_result = variable2;
    wire variable3 = write_reg;
    assign mem_Write_reg = variable3;
    wire branch_decision;

    branch branch (
        .m_ctlout(Branch),
        .zero(Zero),
        .PCSrc(PCSrc)
    );

    memory memory (
        .clk(clk),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .address(alu_result_in),
        .write_data(write_data),
        .read_data(read_data)
    );

endmodule
