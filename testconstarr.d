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
  int XLEN = 1;

  @rand ubyte[10] ff = [0, 25, 50, 75, 100, 125, 150, 175, 200, 225];

  constraint! q{
    offset.length == 10;
    // ff.length == 10;
    foreach (j, i; offset) {
      if (ff[j] < 32) {
	XLEN + i == 20;
      }
      else if (ff[j] < 64) {
	XLEN + i == 40;
      }
      else if (ff[j] < 128) {
	XLEN + i == 80;
      }
      else if (ff[j] <= 255) {
	XLEN + i == 160;
      }
    }
  } aligned_amo_c;
 
} //

void main()
{
  constraint_aligned_amo riscv_default = new constraint_aligned_amo();
  for (size_t i=0; i!=100; ++i) {
    // simple.randomize();
    if (riscv_default.XLEN == 1) {
      riscv_default.XLEN = 0;
    }
    else {
      riscv_default.XLEN = 1;
    }
    riscv_default.randomize();
    writeln(riscv_default.offset, " ff: ", riscv_default.ff);
  }
}
