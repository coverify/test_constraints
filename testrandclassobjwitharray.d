import esdl;

class Foo
{
  mixin randomization;
  @rand ubyte n = 42;

  constraint!q{
    n < 220;
  } cst;
  void display() {
    import std.stdio;
    writeln(n);
  }
}

void main()
{
  ubyte[] bar = [];
  Foo foo = new Foo;
  for (size_t i=0; i!=100; ++i) {
    foo.randomize_with!q{n inside [0, $0];}(bar);
    foo.display();
    bar ~= cast(ubyte) i;
  }
}
