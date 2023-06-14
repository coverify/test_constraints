import esdl;
import std.stdio;

bvec!12[] foo;

class Foo
{
  mixin randomization;
  void pre_randomize() {
    foreach (i, ref f; foo) {
      f += i;
    }
  }

  @rand bvec!16[] bar;
  @rand ubyte frop;

  constraint!q{
    bar.length == foo.length;
    foreach (i, f; foo) {
      bar[i] == f + 1;
    }
    frop >= foo[0] + 240;
  } eq_foo;

  void display() {
    writeln(bar, " ", frop);
  }
}

void main() {
  foo.length = 4;
  Foo bar = new Foo();
  for (size_t i=0; i!=10; ++i) {
    bar.randomize();
    bar.display();
  }
}
