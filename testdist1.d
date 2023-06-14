import esdl;


class Foo {
  mixin randomization;

  @rand int a;

  constraint!q{
    a dist [0:5 := 1, 50:65 := 1, 100:125 := 1];
  } const_a;

  void display() {
    import std.stdio;
    writeln(a);
  }
}

void main() {
  for (size_t i=0; i!=1000000; ++i) {
    Foo foo = new Foo();
    foo.randomize();
    // foo.display();
  }
}
