import esdl;


class Foo {
  mixin randomization;

  @rand ubyte a;
  @rand bool b;

  constraint!q{
    if (b) {
      a > 0;
      a < 10;
    }
    else {
      a < 20;
      a > 10;
    }
  } const_ab;

  void display() {
    import std.stdio;
    writeln(a, ": ", b);
  }
}

void main() {
  Foo foo = new Foo();
  for (size_t i=0; i!=40; ++i) {
    foo.randomize();
    foo.display();
  }
}
