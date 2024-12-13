`include "add stuff/add.v"
`include "incr stuff/incr.v"
`include "memory stuff/memory.v"
`include "mux stuff/mux.v"

module latch (
    input clk,
    input reset,
    input PCSrc,
    input [31:0] npcout_in,
    output [31:0] npcout,
    output [31:0] instrout
);

    wire [31:0] mux_out, add_out, pc_out;

    incr incr (
        .clk(clk), 
        .reset(reset), 
        .pc_in(mux_out), 
        .pc_out(pc_out)
        );

    add add (
        .a(pc_out), 
        .b(1), 
        .sum(add_out)
        );

    mux mux (
        .a(npcout_in), 
        .b(add_out), 
        .sel(PCSrc), 
        .y(mux_out)
        );

    memory memory (
        .address(pc_out), 
        .instruction(instrout)
        );

    assign npcout = add_out;
endmodule
