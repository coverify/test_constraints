import std.stdio;
import esdl.rand;

class Simple {
  mixin randomization;
  @rand ubyte a;
  @rand ubyte b = 42;
  @rand ubyte[] foo;
  constraint! q{
    // a[0..4]  == foo;
    // a < 128;
    a > 0;
    a < 10;

    unique [1, 6, 7, 5, 8, a];
  } csta;
}

void main()
{
  Simple simple = new Simple();
  for (size_t i=0; i!=40; ++i) {
    // simple.randomize();
    simple.randomize();
    writeln(simple.a, " ", simple.b);
  }
}
