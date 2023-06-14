import std.stdio;
import esdl.rand;
//import riscv.riscv_instr_pkg;
//public import riscv.riscv_vector_config;
class sample {
  mixin randomization;
  enum riscv_vreg_t: ubyte {
    V0, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15,
      V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31
      } 

 
  @rand riscv_vreg_t vd;
  riscv_vreg_t [10] reserved_vregs=[riscv_vreg_t.V0,riscv_vreg_t.V1,riscv_vreg_t.V2,riscv_vreg_t.V3,riscv_vreg_t.V4,riscv_vreg_t.V5,riscv_vreg_t.V6,riscv_vreg_t.V7,riscv_vreg_t.V8,riscv_vreg_t.V9];
  constraint! q{
    if (reserved_vregs.length > 0) {
      vd !inside [reserved_vregs];
    }
  } avoid_reserved_vregs_c;
}

void main()
{sample s = new sample();
  for (size_t i=0; i!=40; ++i) {
    s.randomize();
    writeln(s.vd,"    ",s.reserved_vregs);
  }
}
