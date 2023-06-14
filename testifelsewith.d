import std.stdio;
import esdl;

enum NAME: ubyte {
  ZERO, ONE, TWO, THREE, FOUR, FIVE, SIX, SEVEN, EIGHT, NINE, TEN
}


class constraint_aligned_amo {
  mixin randomization;

  @rand NAME instr_name;
  //enum XLEN_t: int {
  //XLEN_32=32,
  //XLEN_64=64,
  //XLEN_128=128
  //}

  @rand ubyte offset;
  // @rand XLEN_t        XLEN;
  int XLEN = 64;

  constraint! q{
    if (instr_name inside [NAME.FOUR, NAME.FIVE, NAME.SIX]) {
      offset[0..4] == 1;
    }
    if (instr_name inside [NAME.SEVEN, NAME.EIGHT, NAME.NINE]) {
      if (XLEN == 32) {
	offset[0..4] == 2;
      }
      else {
	offset[0..4] == 3;
      }
    }
  } aligned_amo_c;
 
} //

void main()
{
  constraint_aligned_amo riscv_default = new constraint_aligned_amo();
  for (size_t i=0; i!=10; ++i) {
      
    riscv_default.randomize_with !q{
      offset == $0;
    } (42 + i);
    writeln(riscv_default.offset, " ", riscv_default.instr_name);
    riscv_default.randomize_with !q{
      offset == $0;
    } (24 - i);
    writeln(riscv_default.offset, " ", riscv_default.instr_name);
  }
}
