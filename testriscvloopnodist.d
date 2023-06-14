import esdl;

enum riscv_instr_name_t: ushort {
  // RV32I instructions
  LUI,
  AUIPC,
  JAL,
  JALR,
  BEQ,
  BNE,
  BLT,
  BGE,
  BLTU,
  BGEU,
  LB,
  LH,
  LW,
  LBU,
  LHU,
  SB,
  SH,
  SW,
  ADDI,
  SLTI,
  SLTIU,
  XORI,
  ORI,
  ANDI,
  SLLI,
  SRLI,
  SRAI,
  ADD,
  SUB,
  SLL,
  SLT,
  SLTU,
  XOR,
  SRL,
  SRA,
  OR,
  AND,
  NOP,
  FENCE,
  FENCE_I,
  ECALL,
  EBREAK,
  CSRRW,
  CSRRS,
  CSRRC,
  CSRRWI,
  CSRRSI,
  CSRRCI,
  // RV32B instructions
  ANDN,
  ORN,
  XNOR,
  GORC,
  SLO,
  SRO,
  ROL,
  ROR,
  SBCLR,
  SBSET,
  SBINV,
  SBEXT,
  GREV,
  SLOI,
  SROI,
  RORI,
  SBCLRI,
  SBSETI,
  SBINVI,
  SBEXTI,
  GORCI,
  GREVI,
  CMIX,
  CMOV,
  FSL,
  FSR,
  FSRI,
  CLZ,
  CTZ,
  PCNT,
  SEXT_B,
  SEXT_H,
  CRC32_B,
  CRC32_H,
  CRC32_W,
  CRC32C_B,
  CRC32C_H,
  CRC32C_W,
  CLMUL,
  CLMULR,
  CLMULH,
  MIN,
  MAX,
  MINU,
  MAXU,
  SHFL,
  UNSHFL,
  BDEP,
  BEXT,
  PACK,
  PACKU,
  BMATOR,
  BMATXOR,
  PACKH,
  BFP,
  SHFLI,
  UNSHFLI,
  //RV64B instructions
  ADDIWU,
  SLLIU_W,
  ADDWU,
  SUBWU,
  BMATFLIP,
  CRC32_D,
  CRC32C_D,
  ADDU_W,
  SUBU_W,
  SLOW,
  SROW,
  ROLW,
  RORW,
  SBCLRW,
  SBSETW,
  SBINVW,
  SBEXTW,
  GORCW,
  GREVW,
  SLOIW,
  SROIW,
  RORIW,
  SBCLRIW,
  SBSETIW,
  SBINVIW,
  GORCIW,
  GREVIW,
  FSLW,
  FSRW,
  FSRIW,
  CLZW,
  CTZW,
  PCNTW,
  CLMULW,
  CLMULRW,
  CLMULHW,
  SHFLW,
  UNSHFLW,
  BDEPW,
  BEXTW,
  PACKW,
  PACKUW,
  BFPW,
  // RV32M instructions
  MUL,
  MULH,
  MULHSU,
  MULHU,
  DIV,
  DIVU,
  REM,
  REMU,
  // RV64M instructions
  MULW,
  DIVW,
  DIVUW,
  REMW,
  REMUW,
  // RV32F instructions
  FLW,
  FSW,
  FMADD_S,
  FMSUB_S,
  FNMSUB_S,
  FNMADD_S,
  FADD_S,
  FSUB_S,
  FMUL_S,
  FDIV_S,
  FSQRT_S,
  FSGNJ_S,
  FSGNJN_S,
  FSGNJX_S,
  FMIN_S,
  FMAX_S,
  FCVT_W_S,
  FCVT_WU_S,
  FMV_X_W,
  FEQ_S,
  FLT_S,
  FLE_S,
  FCLASS_S,
  FCVT_S_W,
  FCVT_S_WU,
  FMV_W_X,
  // RV64F instruction
  FCVT_L_S,
  FCVT_LU_S,
  FCVT_S_L,
  FCVT_S_LU,
  // RV32D instructions
  FLD,
  FSD,
  FMADD_D,
  FMSUB_D,
  FNMSUB_D,
  FNMADD_D,
  FADD_D,
  FSUB_D,
  FMUL_D,
  FDIV_D,
  FSQRT_D,
  FSGNJ_D,
  FSGNJN_D,
  FSGNJX_D,
  FMIN_D,
  FMAX_D,
  FCVT_S_D,
  FCVT_D_S,
  FEQ_D,
  FLT_D,
  FLE_D,
  FCLASS_D,
  FCVT_W_D,
  FCVT_WU_D,
  FCVT_D_W,
  FCVT_D_WU,
  // RV64D
  FCVT_L_D,
  FCVT_LU_D,
  FMV_X_D,
  FCVT_D_L,
  FCVT_D_LU,
  FMV_D_X,
  // RV64I
  LWU,
  LD,
  SD,
  ADDIW,
  SLLIW,
  SRLIW,
  SRAIW,
  ADDW,
  SUBW,
  SLLW,
  SRLW,
  SRAW,
  // RV32C
  C_LW,
  C_SW,
  C_LWSP,
  C_SWSP,
  C_ADDI4SPN,
  C_ADDI,
  C_LI,
  C_ADDI16SP,
  C_LUI,
  C_SRLI,
  C_SRAI,
  C_ANDI,
  C_SUB,
  C_XOR,
  C_OR,
  C_AND,
  C_BEQZ,
  C_BNEZ,
  C_SLLI,
  C_MV,
  C_EBREAK,
  C_ADD,
  C_NOP,
  C_J,
  C_JAL,
  C_JR,
  C_JALR,
  // RV64C
  C_ADDIW,
  C_SUBW,
  C_ADDW,
  C_LD,
  C_SD,
  C_LDSP,
  C_SDSP,
  // RV128C
  C_SRLI64,
  C_SRAI64,
  C_SLLI64,
  C_LQ,
  C_SQ,
  C_LQSP,
  C_SQSP,
  // RV32FC
  C_FLW,
  C_FSW,
  C_FLWSP,
  C_FSWSP,
  // RV32DC
  C_FLD,
  C_FSD,
  C_FLDSP,
  C_FSDSP,
  // RV32A
  LR_W,
  SC_W,
  AMOSWAP_W,
  AMOADD_W,
  AMOAND_W,
  AMOOR_W,
  AMOXOR_W,
  AMOMIN_W,
  AMOMAX_W,
  AMOMINU_W,
  AMOMAXU_W,
  // RV64A
  LR_D,
  SC_D,
  AMOSWAP_D,
  AMOADD_D,
  AMOAND_D,
  AMOOR_D,
  AMOXOR_D,
  AMOMIN_D,
  AMOMAX_D,
  AMOMINU_D,
  AMOMAXU_D,
  // Vector instructions
  VSETVL,
  VSETVLI,
  VADD,
  VSUB,
  VRSUB,
  VWADDU,
  VWSUBU,
  VWADD,
  VWSUB,
  VADC,
  VMADC,
  VSBC,
  VMSBC,
  VAND,
  VOR,
  VXOR,
  VSLL,
  VSRL,
  VSRA,
  VNSRL,
  VNSRA,
  VMSEQ,
  VMSNE,
  VMSLTU,
  VMSLT,
  VMSLEU,
  VMSLE,
  VMSGTU,
  VMSGT,
  VMINU,
  VMIN,
  VMAXU,
  VMAX,
  VMUL,
  VMULH,
  VMULHU,
  VMULHSU,
  VDIVU,
  VDIV,
  VREMU,
  VREM,
  VWMUL,
  VWMULU,
  VWMULSU,
  VMACC,
  VNMSAC,
  VMADD,
  VNMSUB,
  VWMACCU,
  VWMACC,
  VWMACCSU,
  VWMACCUS,
  //VQMACCU,
  //VQMACC,
  //VQMACCSU,
  //VQMACCUS,
  VMERGE,
  VMV,
  VSADDU,
  VSADD,
  VSSUBU,
  VSSUB,
  VAADDU,
  VAADD,
  VASUBU,
  VASUB,
  VSSRL,
  VSSRA,
  VNCLIPU,
  VNCLIP,
  // 14. Vector Floating-Point Instructions
  VFADD,
  VFSUB,
  VFRSUB,
  VFMUL,
  VFDIV,
  VFRDIV,
  VFWMUL,
  VFMACC,
  VFNMACC,
  VFMSAC,
  VFNMSAC,
  VFMADD,
  VFNMADD,
  VFMSUB,
  VFNMSUB,
  VFWMACC,
  VFWNMACC,
  VFWMSAC,
  VFWNMSAC,
  VFSQRT_V,
  VFMIN,
  VFMAX,
  VFSGNJ,
  VFSGNJN,
  VFSGNJX,
  VMFEQ,
  VMFNE,
  VMFLT,
  VMFLE,
  VMFGT,
  VMFGE,
  VFCLASS_V,
  VFMERGE,
  VFMV,
  VFCVT_XU_F_V,
  VFCVT_X_F_V,
  VFCVT_F_XU_V,
  VFCVT_F_X_V,
  VFWCVT_XU_F_V,
  VFWCVT_X_F_V,
  VFWCVT_F_XU_V,
  VFWCVT_F_X_V,
  VFWCVT_F_F_V,
  VFNCVT_XU_F_W,
  VFNCVT_X_F_W,
  VFNCVT_F_XU_W,
  VFNCVT_F_X_W,
  VFNCVT_F_F_W,
  VFNCVT_ROD_F_F_W,
  // 15. Vector reduction instruction
  VREDSUM_VS,
  VREDMAXU_VS,
  VREDMAX_VS,
  VREDMINU_VS,
  VREDMIN_VS,
  VREDAND_VS,
  VREDOR_VS,
  VREDXOR_VS,
  VWREDSUMU_VS,
  VWREDSUM_VS,
  VFREDOSUM_VS,
  VFREDSUM_VS,
  VFREDMAX_VS,
  VFWREDOSUM_VS,
  VFWREDSUM_VS,
  // Vector mask instruction
  VMAND_MM,
  VMNAND_MM,
  VMANDNOT_MM,
  VMXOR_MM,
  VMOR_MM,
  VMNOR_MM,
  VMORNOT_MM,
  VMXNOR_MM,
  VPOPC_M,
  VFIRST_M,
  VMSBF_M,
  VMSIF_M,
  VMSOF_M,
  VIOTA_M,
  VID_V,
  // Vector permutation instruction
  VMV_X_S,
  VMV_S_X,
  VFMV_F_S,
  VFMV_S_F,
  VSLIDEUP,
  VSLIDEDOWN,
  VSLIDE1UP,
  VSLIDE1DOWN,
  VRGATHER,
  VCOMPRESS,
  VMV1R_V,
  VMV2R_V,
  VMV4R_V,
  VMV8R_V,
  // Vector load/store instruction
  VLE_V,
  VSE_V,
  VLSE_V,
  VSSE_V,
  VLXEI_V,
  VSXEI_V,
  VSUXEI_V,
  VLEFF_V,
  // Segmented load/store instruction
  VLSEGE_V,
  VSSEGE_V,
  VLSEGEFF_V,
  VLSSEGE_V,
  VSSSEGE_V,
  VLXSEGEI_V,
  VSXSEGEI_V,
  VSUXSEGEI_V,
  // Vector AMO instruction
  // EEW vector AMOs
  VAMOSWAPE_V,
  VAMOADDE_V,
  VAMOXORE_V,
  VAMOANDE_V,
  VAMOORE_V,
  VAMOMINE_V,
  VAMOMAXE_V,
  VAMOMINUE_V,
  VAMOMAXUE_V,
  // Supervisor instruction
  DRET,
  MRET,
  URET,
  SRET,
  WFI,
  SFENCE_VMA,
  // Custom instructions
  // mixin (import ("riscv_custom_instr_enum.d"));
  // You can add other instructions here
  INVALID_INSTR
}

riscv_reg_t[] reserved_regs = [
  riscv_reg_t.ZERO
];

bool disable_compressed_instr = false;

enum riscv_reg_t: ubyte {	// 5'b
  ZERO = 0b00000,
  RA, SP, GP, TP, T0, T1, T2, S0, S1, A0, A1, A2, A3, A4, A5, A6, A7,
  S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, T3, T4, T5, T6
}

riscv_reg_t[] compressed_gpr =
  [riscv_reg_t.S0, riscv_reg_t.S1, riscv_reg_t.A0, riscv_reg_t.A1,
   riscv_reg_t.A2, riscv_reg_t.A3, riscv_reg_t.A4, riscv_reg_t.A5];


class riscv_loop_instr
{
  mixin Randomization;

  @rand riscv_reg_t[]         loop_cnt_reg;
  @rand riscv_reg_t[]         loop_limit_reg;
  @rand int[]                 loop_init_val;
  @rand int[]                 loop_step_val;
  @rand int[]                 loop_limit_val;
  @rand ubvec!3               num_of_nested_loop;
  @rand int                   num_of_instr_in_loop;
  @rand riscv_instr_name_t[]  branch_type;

  constraint! q{
    solve num_of_nested_loop before loop_cnt_reg;
    solve num_of_nested_loop before loop_limit_reg;
    foreach (lcnt; loop_cnt_reg) {
      lcnt != riscv_reg_t.ZERO;
      foreach (resr; reserved_regs) {
        lcnt != resr;
      }
    }
    foreach (llimit; loop_limit_reg) {
      foreach (resr; reserved_regs) {
        llimit != resr;
      }
    }
    unique [loop_cnt_reg, loop_limit_reg];
    loop_cnt_reg.length == num_of_nested_loop;
    loop_limit_reg.length == num_of_nested_loop;
  }  legal_loop_regs_c;

  constraint!  q{
    solve num_of_nested_loop before loop_init_val;
    solve num_of_nested_loop before loop_step_val;
    solve num_of_nested_loop before loop_limit_val;
    solve loop_limit_val before loop_limit_reg;
    solve branch_type before loop_init_val;
    solve branch_type before loop_step_val;
    solve branch_type before loop_limit_val;
    num_of_instr_in_loop inside [1:25];
    num_of_nested_loop inside [1:2];
    loop_init_val.length == num_of_nested_loop;
    loop_step_val.length == num_of_nested_loop;
    loop_limit_val.length == num_of_nested_loop;
    branch_type.length == num_of_nested_loop;
    foreach (btype; branch_type) {
      if (disable_compressed_instr) {
	btype inside [riscv_instr_name_t.C_BNEZ, riscv_instr_name_t.C_BEQZ,
		      riscv_instr_name_t.BEQ, riscv_instr_name_t.BNE,
		      riscv_instr_name_t.BLTU, riscv_instr_name_t.BLT,
		      riscv_instr_name_t.BGEU, riscv_instr_name_t.BGE];
      }
      else {
	btype inside [riscv_instr_name_t.BEQ, riscv_instr_name_t.BNE,
		      riscv_instr_name_t.BLTU, riscv_instr_name_t.BLT,
		      riscv_instr_name_t.BGEU, riscv_instr_name_t.BGE];
      }
    }
    foreach (i, linit; loop_init_val) {
      if (branch_type[i] inside [riscv_instr_name_t.C_BNEZ, riscv_instr_name_t.C_BEQZ]) {
        loop_limit_val[i] == 0;
        loop_limit_reg[i] == riscv_reg_t.ZERO;
	loop_cnt_reg[i] inside [compressed_gpr]; // TBD -- FIXME -- EUVM
      }
      else {
        loop_limit_val[i] inside [-20..20];
        loop_limit_reg[i] != riscv_reg_t.ZERO;
      }
      if (branch_type[i] inside [riscv_instr_name_t.C_BNEZ, riscv_instr_name_t.C_BEQZ,
				 riscv_instr_name_t.BEQ, riscv_instr_name_t.BNE]) {
        ((loop_limit_val[i] - linit) % loop_step_val[i] == 0) &&
	  (loop_limit_val[i] != linit);
      }
      else if (branch_type[i] == riscv_instr_name_t.BGE) {
        loop_step_val[i] < 0;
      }
      else if (branch_type[i] == riscv_instr_name_t.BGEU) {
        loop_step_val[i] < 0;
        linit > 0;
        // Avoid count to negative
        loop_step_val[i] + loop_limit_val[i] > 0;
      }
      else if (branch_type[i] == riscv_instr_name_t.BLT) {
        loop_step_val[i] > 0;
      }
      else if (branch_type[i] == riscv_instr_name_t.BLTU) {
        loop_step_val[i] > 0;
        loop_limit_val[i] > 0;
      }
      linit inside [-10..10];
      loop_step_val[i] inside [-10..10];
      if (linit < loop_limit_val[i]) {
        loop_step_val[i] > 0;
      }
      else {
        loop_step_val[i] < 0;
      }
    }
  } loop_c;

}

void main()
{
  riscv_loop_instr instr = new riscv_loop_instr();
  foreach (i; 0..100) {
    import std.stdio;
    writeln(i);
    writeln(instr.loop_step_val);
    writeln(instr.loop_limit_val);
    writeln(instr.branch_type);
    instr.randomize();
  }
}
