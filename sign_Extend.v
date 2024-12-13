module sign_Extend(
    input [15:0] nextend,
    output wire [31:0] extended
);

    assign extended = {{16{nextend[15]}}, nextend};
endmodule