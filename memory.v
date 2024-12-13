module memory (
    input [31:0] address,
    output [31:0] instruction
);
    reg [31:0] memory [0:255];
    assign instruction = memory[address[7:2]];
endmodule
