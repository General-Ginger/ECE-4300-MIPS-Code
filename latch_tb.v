`timescale 1ns / 1ps
`include "latch.v"

module latch_tb;

    reg [1:0] wb_ctlout_in;
    reg [2:0] m_ctlout_in;
    reg [3:0] ex_ctlout;
    reg [31:0] npcout;
    reg [31:0] rdata1out;
    reg [31:0] rdata2out_in;
    reg [31:0] s_extendout;
    reg [4:0] instrout_2016;
    reg [4:0] instrout_1511;

    wire [1:0] wb_ctlout;
    wire [2:0] m_ctlout;
    wire [31:0] add_result;
    wire zero;
    wire [31:0] alu_result;
    wire [31:0] rdata2out;
    wire [4:0] five_bit_muxout;

    latch uut (
        .wb_ctlout_in(wb_ctlout_in),
        .m_ctlout_in(m_ctlout_in),
        .ex_ctlout(ex_ctlout),
        .npcout(npcout),
        .rdata1out(rdata1out),
        .rdata2out_in(rdata2out_in),
        .s_extendout(s_extendout),
        .instrout_2016(instrout_2016),
        .instrout_1511(instrout_1511),
        .wb_ctlout(wb_ctlout),
        .m_ctlout(m_ctlout),
        .add_result(add_result),
        .zero(zero),
        .alu_result(alu_result),
        .rdata2out(rdata2out),
        .five_bit_muxout(five_bit_muxout)
    );

    initial begin

        $dumpfile("latch_tb.vcd");
        $dumpvars(0, latch_tb);

        wb_ctlout_in = 2'b01;
        m_ctlout_in = 3'b101;
        ex_ctlout = 4'b1100;
        npcout = 32'h00000010;
        rdata1out = 32'h00000005;
        rdata2out_in = 32'h0000000A;
        s_extendout = 32'h00000003;
        instrout_2016 = 5'b00010;
        instrout_1511 = 5'b00101;
        #10;

        wb_ctlout_in = 2'b10;
        m_ctlout_in = 3'b011;
        ex_ctlout = 4'b1010;
        npcout = 32'h00000020;
        rdata1out = 32'h00000015;
        rdata2out_in = 32'h0000001A;
        s_extendout = 32'h00000006;
        instrout_2016 = 5'b01010;
        instrout_1511 = 5'b01111;
        #10;

        wb_ctlout_in = 2'b11;
        m_ctlout_in = 3'b111;
        ex_ctlout = 4'b1111;
        npcout = 32'h00000030;
        rdata1out = 32'h00000025;
        rdata2out_in = 32'h0000002A;
        s_extendout = 32'h00000009;
        instrout_2016 = 5'b10010;
        instrout_1511 = 5'b10101;
        #10;

        $finish;
    end

endmodule
