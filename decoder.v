`include "opcodes.vh"

`define INSTR_TYPE_E 3'h0
`define INSTR_TYPE_R 3'h1
`define INSTR_TYPE_M 3'h2
`define INSTR_TYPE_I 3'h3
`define INSTR_TYPE_F 3'h4
`define INSTR_TYPE_B 3'h5
`define INSTR_TYPE_U 3'h6

module decoder (
    input [31:0] instruction,

    output reg [3:0] rde,
    output reg [3:0] rs1,
    output reg [3:0] rs2,
    output reg [3:0] func,
    output reg [23:0] imm,      // Immediate is of variable width
    output reg [7:0] opcode,

    output reg [2:0] instr_type // 3 bits (E, R, M, I, F, B, U)
    );
    always @(*) begin
        opcode = instruction[7:0];
        instr_type = instruction[3:0]; 

        // TODO: error check for unexpected opcode
        // $fatal(1, "Error: unexpected opcode %h from instruction %h", opcode, instruction);
        case (instr_type)
            `INSTR_TYPE_E: begin
                imm  <= instruction[15:8];
                func <= instruction[19:16];
                rs2  <= instruction[23:20];
                rs1  <= instruction[27:24];
                rde  <= instruction[31:28];
            end
            `INSTR_TYPE_R: begin
                imm <= instruction[19:8];
                rs2 <= instruction[23:20];
                rs1 <= instruction[27:24];
                rde <= instruction[31:28];
            end
            `INSTR_TYPE_M: begin
                imm  <= instruction[19:8];
                func <= instruction[23:20];
                rs1  <= instruction[27:24];
                rde  <= instruction[31:28];
            end
            `INSTR_TYPE_I: begin
                imm <= instruction[23:8];
                rs1 <= instruction[27:24];
                rde <= instruction[31:28];
            end
            `INSTR_TYPE_F: begin
                imm  <= instruction[23:8];
                func <= instruction[27:24];
                rde  <= instruction[31:28];
            end
            `INSTR_TYPE_B: begin
                imm  <= instruction[27:8];
                func <= instruction[31:28];
            end
            `INSTR_TYPE_U: begin
                imm <= instruction[31:8];
            end
        endcase
    end
endmodule
