`timescale 1ns / 1ps
`include "latch.v"


module latch_tb;

    reg clk;
    reg reset;
    reg PCSrc;
    reg [31:0] npcout_in;
    wire [31:0] npcout;
    wire [31:0] instrout;

    latch uut (
        .clk(clk),
        .reset(reset),
        .PCSrc(PCSrc),
        .npcout_in(npcout_in),
        .npcout(npcout),
        .instrout(instrout)
    );

    initial begin

        $dumpfile("latch_tb.vcd");
        $dumpvars(0, latch_tb);

        clk = 0;
        reset = 1;
        PCSrc = 0;
        npcout_in = 32'h00000000;
        #10 reset = 0;

        #10 npcout_in = 32'h00000004;
        #10 PCSrc = 1;
        #10 PCSrc = 0;

        #10 npcout_in = 32'h00000008;
        #10 PCSrc = 1;

        #10 $finish;
    end

    always #5 clk = ~clk;

endmodule
