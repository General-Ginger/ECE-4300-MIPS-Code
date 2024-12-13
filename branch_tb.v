`timescale 1ns / 1ps
`include "branch.v"

module branch_tb;

    reg m_ctlout;
    reg zero;
    wire PCSrc;

    branch uut (
        .m_ctlout(m_ctlout),
        .zero(zero),
        .PCSrc(PCSrc)
    );

    initial begin

        $dumpfile("branch_tb.vcd");
        $dumpvars(0, branch_tb);

        m_ctlout = 0; zero = 0; #10;
        m_ctlout = 0; zero = 1; #10;
        m_ctlout = 1; zero = 0; #10;
        m_ctlout = 1; zero = 1; #10;
        $finish;
    end

endmodule
