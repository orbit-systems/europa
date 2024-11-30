`define INT   8'h01 // Format F
`define IRE   8'h01 // Format F
`define IRE   8'h01 // Format F
`define USR   8'h01 // Format F

`define OUT   8'h02 // Format M
`define OUT   8'h03 // Format M
`define INR   8'h04 // Format M
`define INI   8'h05 // Format M

`define JAL   8'h06 // Format M
`define JAL   8'h07 // Format M
`define RET   8'h08 // Format M
`define RET   8'h09 // Format M
`define BRA   8'h0A // Format B
`define BEQ   8'h0A // Format B
`define BEZ   8'h0A // Format B
`define BLT   8'h0A // Format B
`define BLE   8'h0A // Format B
`define BLT   8'h0A // Format B
`define BLE   8'h0A // Format B
`define BNE   8'h0A // Format B
`define BNZ   8'h0A // Format B
`define BGE   8'h0A // Format B
`define BGT   8'h0A // Format B
`define BGE   8'h0A // Format B
`define BGT   8'h0A // Format B

`define PUS   8'h0B // Format M
`define POP   8'h0C // Format M
`define ENT   8'h0D // Format B
`define LEAVE 8'h0E // Format B

`define LLI   8'h10 // Format F
`define LLIS  8'h10 // Format F
`define LUI   8'h10 // Format F
`define LUIS  8'h10 // Format F
`define LTI   8'h10 // Format F
`define LTIS  8'h10 // Format F
`define LTUI  8'h10 // Format F
`define LTUIS 8'h10 // Format F
`define LW    8'h11 // Format E
`define LH    8'h12 // Format E
`define LHS   8'h13 // Format E
`define LQ    8'h14 // Format E
`define LQS   8'h15 // Format E
`define LB    8'h16 // Format E
`define LBS   8'h17 // Format E
`define SW    8'h18 // Format E
`define SH    8'h19 // Format E
`define SQ    8'h1A // Format E
`define SB    8'h1B // Format E

`define CMPR  8'h1E // Format M
`define CMPI  8'h1F // Format F

`define ADDR  8'h20 // Format R
`define ADDI  8'h21 // Format M
`define SUBR  8'h22 // Format R
`define SUBI  8'h23 // Format M
`define IMULR 8'h24 // Format R
`define IMULI 8'h25 // Format M
`define IDIVR 8'h26 // Format R
`define IDIVI 8'h27 // Format M
`define UMULR 8'h28 // Format R
`define UMULI 8'h29 // Format M
`define UDIVR 8'h2A // Format R
`define UDIVI 8'h2B // Format M
`define REMR  8'h2C // Format R
`define REMI  8'h2D // Format M
`define MODR  8'h2E // Format R
`define MODI  8'h2F // Format M

`define ANDR  8'h30 // Format R
`define ANDI  8'h31 // Format M
`define ORR   8'h32 // Format R
`define ORI   8'h33 // Format M
`define NORR  8'h34 // Format R
`define NORI  8'h35 // Format M
`define XORR  8'h36 // Format R
`define XORI  8'h37 // Format M
`define SHLR  8'h38 // Format R
`define SHLI  8'h39 // Format M
`define ASRR  8'h3A // Format R
`define ASRI  8'h3B // Format M
`define LSRR  8'h3C // Format R
`define LSRI  8'h3D // Format M
`define BITR  8'h3E // Format R
`define BITI  8'h3F // Format M

`define FCMP  8'h40 // Format E
`define FTO   8'h41 // Format E
`define FFROM 8'h42 // Format E
`define FNEG  8'h43 // Format E
`define FABS  8'h44 // Format E
`define FADD  8'h45 // Format E
`define FSUB  8'h46 // Format E
`define FMUL  8'h47 // Format E
`define FDIV  8'h48 // Format E
`define FMA   8'h49 // Format E
`define FSQRT 8'h4A // Format E
`define FMIN  8'h4B // Format E
`define FMAX  8'h4C // Format E
`define FSAT  8'h4D // Format E
`define FCNV  8'h4E // Format E
`define FNAN  8'h4F // Format E
