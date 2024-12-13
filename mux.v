module mux (
    input [31:0] A,
    input [31:0] B,
    input sel,
    output reg [31:0] Y
);
    always @(*) begin
        if (sel)
            Y = A;
        else
            Y = B;
    end
endmodule