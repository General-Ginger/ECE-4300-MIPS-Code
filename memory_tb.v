`include "memory.v"
module test_memory;

reg [31:0] address;
wire [31:0] instruction;

memory memory1 (address, instruction);

initial begin

    $dumpfile("memory_tb.vcd");
    $dumpvars(0, test_memory);

    address = 4;
    #10;
    address = 8;
    #10;
    address = 12;
    #10;
    address = 15;
    #5;
end

always @(address)
    #1 $display("Time = %0d\taddress=%0d\tinstruction=%0d", $time,
        address, instruction);

endmodule