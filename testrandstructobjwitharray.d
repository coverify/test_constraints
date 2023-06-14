import esdl;

struct Foo
{
  mixin randomization;
  @rand ubyte foo;

  void display() {
    import std.stdio;
    writeln(foo);
  }
}

void main()
{
  ubyte[] bar = [0];
  Foo foo;
  for (size_t i=0; i!=100; ++i) {
    foo.rand_mode!q{foo}(true);
    foo.randomizeWith!q{foo inside [$0];}(bar);
    foo.display();
    bar ~= cast(ubyte) i;
  }
}
