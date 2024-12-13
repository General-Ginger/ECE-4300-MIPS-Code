`include "adder stuff/adder.v"
`include "ALU CONTROL stuff/alu_control.v"
`include "ALU stuff/alu.v"
`include "MUX stuff/mux.v"
`include "MUX 2 stuff/mux_5bit.v"

module latch (
    input [1:0] wb_ctlout_in,
    input [2:0] m_ctlout_in,
    input [3:0] ex_ctlout,
    input [31:0] npcout,
    input [31:0] rdata1out,
    input [31:0] rdata2out_in,
    input [31:0] s_extendout,
    input [4:0] instrout_2016,
    input [4:0] instrout_1511,
    output [1:0] wb_ctlout,
    output [2:0] m_ctlout,
    output [31:0] add_result,
    output zero,
    output [31:0] alu_result,
    output [31:0] rdata2out,
    output [4:0] five_bit_muxout
);
    
    wire [31:0] mux1_out;
    wire [3:0] select_wire;
    wire [1:0] variable = wb_ctlout_in;
    assign wb_ctlout = variable;
    wire [1:0] variable2 = m_ctlout_in;
    assign m_ctlout = variable2;
    

    adder adder(
        .A(npcout),
        .B({26'b0, s_extendout[5:0]}),
        .Y(add_result) 
    );

    mux mux1(
        .A({26'b0, s_extendout[5:0]}),
        .B(rdata2out_in),
        .sel(ex_ctlout[3]),
        .Y(mux1_out)
    );

    mux_5bit mux2(
        .A(instrout_1511),
        .B(instrout_2016),
        .sel(ex_ctlout[0]),
        .Y(five_bit_muxout)
    );

    alu_control alu_control(
        .alu_op(ex_ctlout[2:1]),
        .funct(s_extendout[5:0]),
        .select(select_wire)
    );

    alu alu(
        .A(rdata1out),
        .B(mux1_out),
        .control(select_wire),
        .Y(alu_result),
        .zero(zero)
    );

endmodule