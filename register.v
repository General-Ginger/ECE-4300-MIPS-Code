module register (
    input clk,
    input reset, 
    input [4:0] rs,
    input [4:0] rt,
    input [4:0] rd,
    input [31:0] write_data,
    input regWrite,
    output [31:0] A,
    output [31:0] B 
);

    reg [31:0] registers [0:31]; 

    integer i;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            for (i = 0; i < 32; i = i + 1) begin
                registers[i] <= 32'b0;
            end
        end else if (regWrite) begin
            registers[rd] <= write_data;
        end
    end

    assign A = registers[rs]; 
    assign B = registers[rt]; 

endmodule
