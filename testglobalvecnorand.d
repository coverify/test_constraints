import esdl;
import std.stdio;

bvec!16 foo;

class Foo
{
  mixin randomization;
  void pre_randomize() {
    foo += 1;
  }

  @rand bvec!16 bar;
  @rand ubyte frop;

  constraint!q{
    bar == foo;
    frop >= foo + 240;
  } eq_foo;

  void display() {
    writeln(bar, " ", frop);
  }
}

void main() {
  Foo foo = new Foo();
  for (size_t i=0; i!=10; ++i) {
    foo.randomize();
    foo.display();
  }
}
