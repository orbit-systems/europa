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
        $monitor("Instruction %h -> %b(opcode: %h, rde: %d, imm: %h func: %h, rs1: %h rs2: %h)", 
                 instruction, instr_type, opcode, rde, imm, func, rs1, rs2);

        // Format B    OPCODE IMM     FUNC
        instruction = {`INT,  20'h00, 4'h0};                                #10;
        // Format F    OPCODE IMM     FUNC  RDE
        instruction = {`LLI,  16'h01, 4'h0, 4'h2};                          #10;
        // Format E    OPCODE IMM     FUNC  RS2   RS1   RDE
        instruction = {`LW, 8'hff,    4'h2, 4'h3, 4'h4, 4'h5};              #10;
        $finish;
    end
endmodule
