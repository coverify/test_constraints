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
    a + b < 32;
    a < 32;
    b < 32;
    unique [a, b, foo];
    foo.length < 10;
    foo.length >= 4;
    a inside [12, 13, 20..30];
    foreach (f; foo) {
      f >= 0;
      f < 10;
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
