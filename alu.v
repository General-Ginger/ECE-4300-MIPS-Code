module alu (
    input [31:0] A,
    input [31:0] B,
    input [3:0] control,
    output reg [31:0] Y,
    output reg zero
);
    always @(*) begin
        case (control)
            4'b0010: Y = A + B;  // Add
            4'b0110: Y = A - B;  // Subtract
            4'b0000: Y = A & B;  // AND
            4'b0001: Y = A | B;  // OR
            4'b0111: Y = (A < B) ? 32'b1 : 32'b0; // SLT
            default: Y = 32'b0;
        endcase
        zero = (Y == 32'b0) ? 1'b1 : 1'b0;
    end
endmodule