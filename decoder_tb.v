`include "opcodes.vh"

module decoder_tb;
    reg [31:0] instruction;

    wire [7:0] opcode;
    wire [3:0] rde;
    wire [3:0] rs1;
    wire [3:0] rs2;
    wire [3:0] func;
    wire [23:0] imm;
    wire [2:0] instr_type;

    decoder uut (
        .instruction(instruction),
        .rde(rde),
        .rs1(rs1),
        .rs2(rs2),
        .func(func),
        .imm(imm),
        .opcode(opcode),
        .instr_type(instr_type)
    );

    initial begin
        $monitor("Instruction %h -> (rde: %d, opcode: %h, imm: %h func: %h, rs1: %h rs2: %h Format: %b)", instruction, rde, opcode, imm, func, rs1, rs2, instr_type);
        instruction = 32'h00000401; #10;
        instruction = 32'h20011410; #10;
        instruction = 32'h5432FF13; #10;
        $finish;
    end
endmodule
