import std.stdio;
import esdl;

class Simple {
  mixin randomization;
  @rand ubyte foo;
  @rand Bit!4 bar;

  constraint! q{
    foo != bar;
  } foobar;
}

void main()
{
  Simple simple = new Simple();
  for (size_t i=0; i!=10; ++i) {
    // simple.randomize();
    simple.randomize();
    writeln(simple.foo, " ", simple.bar);
  }
}
