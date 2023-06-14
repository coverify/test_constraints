import std.stdio;
import esdl;

class constraint_aligned_amo {
  mixin randomization;

  //enum XLEN_t: int {
  //XLEN_32=32,
  //XLEN_64=64,
  //XLEN_128=128
  //}

  @rand ubyte[] offset;
  // @rand XLEN_t        XLEN;
  int XLEN = 64;

  constraint! q{
    offset.length == 10;
    foreach (j, i; offset) {
      i <= 64;
      if (XLEN == 64) {
	if (j == 0) {
	  i[0..4] == 0;
	}
	else {
	  i[0..4] == 2;
	}
      }
      else {
	if (j == 0) {
	  i[0..4] == 1;
	}
	else {
	  i[0..4] == 3;
	}
      }
    }
  } aligned_amo_c;
 
} //

void main()
{
  // constraint_aligned_amo riscv_default = new constraint_aligned_amo();
  for (size_t i=0; i!=100; ++i) {
    constraint_aligned_amo riscv_default = new constraint_aligned_amo();
    // simple.randomize();
    riscv_default.randomize();
    writeln(riscv_default.offset);
  }
}
