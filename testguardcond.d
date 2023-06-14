import std.stdio;
import esdl.rand;


class Foo { }

class sample {
  bool fool(int bar) {
    return bar >= 0;
  }
  
  mixin randomization;
  enum riscv_reg_t: ubyte {	// 5'b
    ZERO = 0b00000,
      RA, SP, GP, TP, T0, T1, T2, S0, S1, A0, A1, A2, A3, A4, A5, A6, A7,
      S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, T3, T4, T5, T6
      }

  
  Foo                     foo;
  @rand bool              fix_sp;
  @rand riscv_reg_t       sp;
  @rand riscv_reg_t       tp;

  int bar = -5;
  
  constraint! q{
    // solve fix_sp before sp;
    
    if $(fool(bar)) {
      sp == riscv_reg_t.SP;
    }
    sp != tp;
    // !(sp inside {GP, RA, ZERO});
    // !(tp inside {GP, RA, ZERO});
  }  sp_tp_c;

  void post_randomize() {
    bar++;
  }
}

void main()
{sample s = new sample();
  for (size_t i=0; i!=10; ++i) {
    s.randomize();
    writeln(s.sp, " ", s.fix_sp," ",s.tp);
  }
}
