import std.stdio;
import esdl.rand;
//import riscv.riscv_instr_pkg;
//public import riscv.riscv_vector_config;
class sample {
  mixin randomization;
  enum riscv_reg_t: ubyte {
    ZERO = 0b00000,
    RA, SP, GP, TP, T0, T1, T2, S0, S1, A0, A1, A2, A3, A4, A5, A6, A7,
    S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, T3, T4, T5, T6
  } 

  bool useless = true;
  
  @rand riscv_reg_t vd;
  riscv_reg_t [] reserved_regs=[riscv_reg_t.T6,riscv_reg_t.S0,riscv_reg_t.SP];

  riscv_reg_t [] reserved=[ ];

  constraint! q{
    vd !inside [reserved_regs, reserved, riscv_reg_t.ZERO];
    if (useless == true) {
      vd == riscv_reg_t.T5;
    }
  } test_c;
}

void main()
{sample s = new sample();
  s.randomize();
  writeln(s.vd,"    ",s.reserved);
}
