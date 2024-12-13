module branch (
    input m_ctlout,
    input zero,
    output PCSrc
);
    assign PCSrc = m_ctlout & zero;
endmodule