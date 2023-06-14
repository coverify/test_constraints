import std.stdio;
import esdl.rand;

class Simple {
  mixin randomization;
  @rand uint a;
  @rand uint b = 42;
  @rand ubyte[][] foo;
  constraint! q{
    // a[0..4]  == foo;
    // a < 128;
    a + b == 32;
    a < 32;
    b < 32;
    foo.length < 5;
    foo.length >= 2;
    foreach (f; foo) {
      f.length == 2;
      foreach (g; f) {
	g > 2;
	g < 10;
      }
    }
    a inside [12, 13, 20..24, foo];
    b !inside [12, 13, 20..24, foo];
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
