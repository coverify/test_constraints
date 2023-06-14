import esdl;
import std.stdio;

enum Bar: bool {
  READ, WRITE
}

class Foo {
  mixin randomization;

  @rand Bar bar;
  void display() {
    writeln(bar);
  }
}


void main()
{
  Foo foo = new Foo;
  for (size_t i=0; i!=32; ++i) {
      foo.randomize();
      foo.display();
  }
}
