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

        case (opcode)
            `INT: instr_type = `INSTR_TYPE_B;
            `LLI: instr_type = `INSTR_TYPE_F;
            `LW: instr_type = `INSTR_TYPE_E;
            `INT: instr_type = `INSTR_TYPE_B;
            `IRET: instr_type = `INSTR_TYPE_B;
            `IRES: instr_type = `INSTR_TYPE_B;
            `WAIT: instr_type = `INSTR_TYPE_B;
            `LCTRL: instr_type = `INSTR_TYPE_F;
            `SCTRL: instr_type = `INSTR_TYPE_F;
            `FLAG: instr_type = `INSTR_TYPE_I;
            `ADDIP: instr_type = `INSTR_TYPE_I;
            `JAL: instr_type = `INSTR_TYPE_I;
            `JALR: instr_type = `INSTR_TYPE_I;
            `RET: instr_type = `INSTR_TYPE_I;
            `RETR: instr_type = `INSTR_TYPE_I;
            `BRA: instr_type = `INSTR_TYPE_B;
            `BEQ: instr_type = `INSTR_TYPE_B;
            `BEZ: instr_type = `INSTR_TYPE_B;
            `BLT: instr_type = `INSTR_TYPE_B;
            `BLE: instr_type = `INSTR_TYPE_B;
            `BLTU: instr_type = `INSTR_TYPE_B;
            `BLEU: instr_type = `INSTR_TYPE_B;
            `BNE: instr_type = `INSTR_TYPE_B;
            `BNZ: instr_type = `INSTR_TYPE_B;
            `BGE: instr_type = `INSTR_TYPE_B;
            `BGT: instr_type = `INSTR_TYPE_B;
            `BGEU: instr_type = `INSTR_TYPE_B;
            `BGTU: instr_type = `INSTR_TYPE_B;
            `PUSH: instr_type = `INSTR_TYPE_I;
            `POP: instr_type = `INSTR_TYPE_I;
            `ENTER: instr_type = `INSTR_TYPE_I;
            `LEAVE: instr_type = `INSTR_TYPE_I;
            `CMP: instr_type = `INSTR_TYPE_I;
            `LLI: instr_type = `INSTR_TYPE_F;
            `LLIP: instr_type = `INSTR_TYPE_F;
            `LNI: instr_type = `INSTR_TYPE_U;
            `LTI: instr_type = `INSTR_TYPE_U;
            `LW: instr_type = `INSTR_TYPE_E;
            `LH: instr_type = `INSTR_TYPE_E;
            `LHS: instr_type = `INSTR_TYPE_E;
            `LQ: instr_type = `INSTR_TYPE_E;
            `LQS: instr_type = `INSTR_TYPE_E;
            `LB: instr_type = `INSTR_TYPE_E;
            `LBS: instr_type = `INSTR_TYPE_E;
            `SW: instr_type = `INSTR_TYPE_E;
            `SH: instr_type = `INSTR_TYPE_E;
            `SQ: instr_type = `INSTR_TYPE_E;
            `SB: instr_type = `INSTR_TYPE_E;
            `LLW: instr_type = `INSTR_TYPE_M;
            `LLH: instr_type = `INSTR_TYPE_M;
            `LLQ: instr_type = `INSTR_TYPE_M;
            `LLB: instr_type = `INSTR_TYPE_M;
            `SCW: instr_type = `INSTR_TYPE_M;
            `SCH: instr_type = `INSTR_TYPE_M;
            `SCQ: instr_type = `INSTR_TYPE_M;
            `SCB: instr_type = `INSTR_TYPE_M;
            `LFENCE: instr_type = `INSTR_TYPE_B;
            `SFENCE: instr_type = `INSTR_TYPE_B;
            `MFENCE: instr_type = `INSTR_TYPE_B;
            `TFLUSHX: instr_type = `INSTR_TYPE_B;
            `TFLUSH: instr_type = `INSTR_TYPE_B;
            `ADDR: instr_type = `INSTR_TYPE_R;
            `ADDI: instr_type = `INSTR_TYPE_I;
            `IADC: instr_type = `INSTR_TYPE_R;
            `UADC: instr_type = `INSTR_TYPE_R;
            `SUBR: instr_type = `INSTR_TYPE_R;
            `SUBI: instr_type = `INSTR_TYPE_I;
            `ISBB: instr_type = `INSTR_TYPE_R;
            `USBB: instr_type = `INSTR_TYPE_R;
            `IMULR: instr_type = `INSTR_TYPE_R;
            `IMULH: instr_type = `INSTR_TYPE_R;
            `IMULI: instr_type = `INSTR_TYPE_I;
            `IDIVR: instr_type = `INSTR_TYPE_R;
            `IDIVI: instr_type = `INSTR_TYPE_I;
            `UMULR: instr_type = `INSTR_TYPE_R;
            `UMULH: instr_type = `INSTR_TYPE_R;
            `UMULI: instr_type = `INSTR_TYPE_I;
            `UDIVR: instr_type = `INSTR_TYPE_R;
            `UDIVI: instr_type = `INSTR_TYPE_I;
            `REMR: instr_type = `INSTR_TYPE_R;
            `REMI: instr_type = `INSTR_TYPE_I;
            `MODR: instr_type = `INSTR_TYPE_R;
            `MODI: instr_type = `INSTR_TYPE_I;
            `ANDR: instr_type = `INSTR_TYPE_R;
            `ANDI: instr_type = `INSTR_TYPE_I;
            `ORR: instr_type = `INSTR_TYPE_R;
            `ORI: instr_type = `INSTR_TYPE_I;
            `NORR: instr_type = `INSTR_TYPE_R;
            `NORI: instr_type = `INSTR_TYPE_I;
            `XORR: instr_type = `INSTR_TYPE_R;
            `XORI: instr_type = `INSTR_TYPE_I;
            `SHL: instr_type = `INSTR_TYPE_R;
            `ASR: instr_type = `INSTR_TYPE_R;
            `LSR: instr_type = `INSTR_TYPE_R;
            `FCMP: instr_type = `INSTR_TYPE_E;
            `FTO: instr_type = `INSTR_TYPE_E;
            `FFROM: instr_type = `INSTR_TYPE_E;
            `FNEG: instr_type = `INSTR_TYPE_E;
            `FABS: instr_type = `INSTR_TYPE_E;
            `FADD: instr_type = `INSTR_TYPE_E;
            `FSUB: instr_type = `INSTR_TYPE_E;
            `FMUL: instr_type = `INSTR_TYPE_E;
            `FDIV: instr_type = `INSTR_TYPE_E;
            `FMA: instr_type = `INSTR_TYPE_E;
            `FSQRT: instr_type = `INSTR_TYPE_E;
            `FMIN: instr_type = `INSTR_TYPE_E;
            `FMAX: instr_type = `INSTR_TYPE_E;
            `FRND: instr_type = `INSTR_TYPE_E;
            `FRNDA: instr_type = `INSTR_TYPE_E;
            `FTRUNC: instr_type = `INSTR_TYPE_E;
            `FCEIL: instr_type = `INSTR_TYPE_E;
            `FFLOOR: instr_type = `INSTR_TYPE_E;
            `FCNV: instr_type = `INSTR_TYPE_E;
            `FCLASS: instr_type = `INSTR_TYPE_E;
            `RORR: instr_type = `INSTR_TYPE_R;
            `RORI: instr_type = `INSTR_TYPE_I;
            `ROLR: instr_type = `INSTR_TYPE_R;
            `ROLI: instr_type = `INSTR_TYPE_I;
            `CSET: instr_type = `INSTR_TYPE_R;
            `CLZ: instr_type = `INSTR_TYPE_R;
            `CTZ: instr_type = `INSTR_TYPE_R;
            `EXT: instr_type = `INSTR_TYPE_R;
            `DEP: instr_type = `INSTR_TYPE_R;
            `ZIP: instr_type = `INSTR_TYPE_I;
            `REV: instr_type = `INSTR_TYPE_I;
            `ANDN: instr_type = `INSTR_TYPE_R;
            `ORN: instr_type = `INSTR_TYPE_R;
            `XORN: instr_type = `INSTR_TYPE_R;
            default: begin
                $fatal(1, "Error: unexpected opcode %h from instruction %h", opcode, instruction);
            end
        endcase

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
