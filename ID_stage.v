`include "Control Stuff/control.v"
`include "Register Stuff/register.v"
`include "Decode Stuff/decode.v"
`include "Sign Stuff/sign_Extend.v"

module ID_stage(
    input clk,
    input reset,
    input [31:0] npcout_in,
    input [31:0] instrout_in,
    input [4:0] WriteReg_in,
    input [31:0] writedata,
    input RegWrite,
    output [1:0] wb_ctlout,
    output [2:0] m_ctlout,
    output [3:0] ex_ctlout,
    output [31:0] npcout,
    output [31:0] rdata1out,
    output [31:0] rdata2out,
    output [31:0] s_extendout,
    output [31:0] instrout_2016,
    output [31:0] instrout_1511
);

    wire [5:0] opcode = instrout_in[31:26];
    wire [4:0] read_reg1 = instrout_in[25:21];
    wire [4:0] read_reg2 = instrout_in[20:16];
    wire [4:0] write_reg = instrout_in[15:11];
    wire [15:0] sign_extend_in = instrout_in[15:0];
    wire [1:0] ALUOp;
    wire RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch;

    control control(
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

    register register(
        .clk(clk),
        .reset(reset),
        .rs(read_reg1),
        .rt(read_reg2),
        .rd(WriteReg_in),
        .write_data(writedata),
        .regWrite(RegWrite),
        .A(rdata1out),
        .B(rdata2out)
    );

    // Sign Extend
    sign_Extend sign_Extend(
        .nextend(instrout_in[15:0]),
        .extended(s_extendout)
    );

    assign wb_ctlout = {RegWrite, MemtoReg};
    assign m_ctlout = {Branch, MemRead, MemWrite};
    assign ex_ctlout = {RegDst, ALUOp, ALUSrc};

endmodule
