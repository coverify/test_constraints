import esdl;


class Foo {
  mixin randomization;

  uint foo = 23;
  @rand ulong a;
  @rand bool b;
  @rand byte c;

  constraint!q{
    if (b) {
      a dist [foo := 10, 32 := 4];
    }
    else {
      a dist [42 := 1, 24 := 4, 100 := 3];
      // a != 100;
      // 100 != a;
      a !inside [100];
    }
  } const_ab;

  void display() {
    import std.stdio;
    writeln(a, ": ", b);
  }
}

void main() {
  Foo foo = new Foo();
  for (size_t i=0; i!=100; ++i) {
    foo.randomize();
    foo.display();
  }
}
