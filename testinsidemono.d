import std.stdio;
import esdl.rand;

class Simple {
  mixin randomization;
  @rand uint a;
  @rand uint b = 42;
  constraint! q{
    b < 32;
    a inside [12, 13, 24..42];
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
