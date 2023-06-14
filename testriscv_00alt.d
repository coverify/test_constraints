import std.stdio;
import esdl;

class constraint_ra_c {
  mixin randomization;

  enum riscv_reg_t: ubyte {	// 5'b
    ZERO = 0b00000,
      RA, SP, GP, TP, T0, T1, T2, S0, S1, A0, A1, A2, A3, A4, A5, A6,		A7,
      S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, T3, T4, T5, T6
      }

  riscv_reg_t[2] foo = [riscv_reg_t.T1, riscv_reg_t.T2];
    
  @rand riscv_reg_t       ra;
  @rand riscv_reg_t	  sp;
  @rand riscv_reg_t       tp;	

  //   constraint! q{
  //   sp inside [0:31];
  //   tp inside [0:31];
  //   } sp_tp;

  constraint! q{
    ra dist [riscv_reg_t.RA := 3, riscv_reg_t.T1 := 2, riscv_reg_t.SP..riscv_reg_t.T0 :/ 1, riscv_reg_t.T2..riscv_reg_t.T6 :/ 4];
    sp != ra;
    ra != tp;
    ra != riscv_reg_t.ZERO;
    sp dist [riscv_reg_t.T1 := 2, riscv_reg_t.SP..riscv_reg_t.T0 :/ 1, riscv_reg_t.T2..riscv_reg_t.T6 :/ 4];
    ra !inside [foo, riscv_reg_t.T5];
  } ra_c;

} //Class constraint_ra_c

void main()
{
  constraint_ra_c riscv_default = new constraint_ra_c();
  for (size_t i=0; i!=40; ++i) {
    // simple.randomize();
    riscv_default.randomize();
    writeln(riscv_default.ra, " ", riscv_default.sp, " ", riscv_default.tp);
  }
}
