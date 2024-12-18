module alu_control (
    input [1:0] alu_op,
    input [5:0] funct,
    output reg [3:0] select
);
    always @(*) begin
        case (alu_op)
            2'b00: select = 4'b0010; // Add
            2'b01: select = 4'b0110; // Subtract
            2'b10: begin
                case (funct)
                    6'b100000: select = 4'b0010; // Add
                    6'b100010: select = 4'b0110; // Subtract
                    6'b100100: select = 4'b0000; // AND
                    6'b100101: select = 4'b0001; // OR
                    6'b101010: select = 4'b0111; // SLT
                    default: select = 4'bxxxx;   // Undefined
                endcase
            end
            default: select = 4'bxxxx; // Undefined
        endcase
    end
endmodule