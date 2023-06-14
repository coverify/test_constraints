import std.stdio;
import esdl;

struct ffff {
  enum _esdl__TypeHasRandBarrier = true;
}

class Simple {
  mixin randomization;
  @rand ubyte foo;
  @rand ubvec!4 bar;

  constraint! q{
    foo == bar;
  } foobar;

  ffff ff;
}

void main()
{
  Simple simple = new Simple();
  for (size_t i=0; i!=10; ++i) {
    // simple.randomize();
    if (simple.foobar.constraint_mode())
      simple.foobar.constraint_mode(false);
    else
      simple.foobar.constraint_mode(true);
    simple.randomize();
    writeln(simple.foo, " ", simple.bar);
  }
  // writeln("DONE");
}
