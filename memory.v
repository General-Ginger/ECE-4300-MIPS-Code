module memory (
    input clk,
    input MemRead,
    input MemWrite,
    input [31:0] address,
    input [31:0] write_data,
    output reg [31:0] read_data
);
    reg [31:0] memory [0:255];

    always @(*) begin
        if (MemRead)
            read_data = memory[address[7:0]];
        else
            read_data = 32'b0;
    end

    always @(posedge clk) begin
        if (MemWrite)
            memory[address[7:0]] <= write_data;
    end
endmodule
