import std.stdio;
import esdl;

enum e1 {
	 A = 0,
	 B = 1,
	 C = 2
}

enum e2 {
	 A = 0,
	 B = 1,
	 C = 2,
	 D = 3
}

int foo = 0x00;

class Base {
  @rand ubvec!18 *a;
  @rand e1 *xx;
  @rand e2 yy;
  mixin randomization;
  constraint! q{xx < 28;} cst1;
  constraint! q{yy < 28;} cst2;
}

class Simple: Base {
  mixin randomization;
  uint* test;
  @rand uint *b;
  constraint! q{
    // a[0..4]  == foo;
    // a < 128;
    a >= 64;
    @soft!4 a[8..16]  == 0;
    @soft a > 24;
    a + b > 32;
  } csta;
}

void main()
{
  Simple simple = new Simple();
  ubvec!18 a;
  uint b = 42;
  e1 xx;

  uint test = 42;

  simple.b = &b;
  simple.a = &a;
  simple.xx = &xx;
  simple.test = &test;
  
  for (size_t i=0; i!=10; ++i) {
    // simple.randomize();
    simple.randomizeWith! q{a <= $0 + 128; b == $1;}(i*128, i+2);
    writeln(*simple.a, " ", *simple.b);
  }
}
