import esdl;

class Foo
{
  mixin randomization;

  @rand ubyte[][] foo;

  @rand ubyte bar;

  constraint!q{
    foo.sum == 1000;
    foo.length <= 4;
    foo.length >= 2;
    foreach (fo; foo) {
      fo.length <= 4;
      fo.length >= 4;
      
      foreach (f; fo) {
	f != 0;
      }
    }
    // unique [foo];
  } cst01;

  void display() {
    import std.stdio;
    writeln(foo);
  }
}

void main()
{
  Foo foo = new Foo;

  for (size_t i=0; i!=1000; ++i) {
    foo.randomize();
    foo.display();
  }
}
