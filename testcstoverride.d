import std.stdio;
import esdl;

int foo = 0x00;

class Base {
  @rand UBit!18 a;
  @rand uint xx;
  @rand uint yy;
  mixin randomization;
  constraint! q{xx < 28;} cst1;
  constraint! q{yy < 28;} cst2;
}

class Derived: Base {
  mixin randomization;

  @constraint_override
  constraint! q{xx < 42;} cst1;
  constraint! q{xx > 32;} cst1a;
}

class Final: Derived {
  mixin randomization;

  @constraint_override
  constraint! q{yy < 42;} cst2;
  constraint! q{yy > 32;} cst2a;
}

void main()
{
  Final ff = new Final();
  for (size_t i=0; i!=100; ++i) {
    // ff.randomize();
    ff.randomize();
    writeln(ff.xx, " ", ff.yy);
  }
}
