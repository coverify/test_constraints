import std.stdio;
import esdl;

class constraint_ra_c {
  mixin randomization;

  enum riscv_reg_t: uint {	// 5'b
    ZERO = 0b00000,
      RA, T1, T2, T3, T4, T5}

  riscv_reg_t[4]   arr = [riscv_reg_t.T1, riscv_reg_t.T2,
			  riscv_reg_t.T3, riscv_reg_t.T4];
  
  @rand riscv_reg_t       ra;
  @rand riscv_reg_t	   sp;
  @rand riscv_reg_t       tp;	

  //   constraint! q{
  //   sp inside [0:31];
  //   tp inside [0:31];
  //   } sp_tp;

  constraint! q{
    // arr.length == 6;
    
    ra dist [riscv_reg_t.RA := 3, riscv_reg_t.T1 := 2];
    // ra != sp;
    // ra != tp;
    // ra != riscv_reg_t.ZERO;
    // sp dist [riscv_reg_t.RA := 3, riscv_reg_t.T1 := 2, riscv_reg_t.SP..riscv_reg_t.T0 :/ 1, riscv_reg_t.T2..riscv_reg_t.T6 :/ 4];
    ra !inside [arr];
  } ra_c;

} //Class constraint_ra_c

void main()
{
  constraint_ra_c riscv_default = new constraint_ra_c();
  for (size_t i=0; i!=1; ++i) {
    // simple.randomize();
    riscv_default.randomize();
    writeln(riscv_default.ra, " ", riscv_default.arr);
  }
}
