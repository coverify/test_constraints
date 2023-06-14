import std.stdio;
import esdl.rand;

class Simple {
  mixin randomization;
  @rand uint a;
  @rand uint b = 42;
  @rand ubyte[] foo;
  constraint! q{
    a + b < 42;
    a < 32;
    b < 32;
    foo.length < 10;
    foo.length > 4;
    (a + b) inside [12, 13, 20..24, foo];
    unique [foo];
    foreach (f; foo) {
      f >= 36;
      f < 100;
    }
  } csta;
}

void main()
{
  Simple simple = new Simple();
  for (size_t i=0; i!=40; ++i) {
    // simple.randomize();
    simple.randomize();
    writeln(simple.a, " ", simple.b, " ", simple.foo);
  }
}
