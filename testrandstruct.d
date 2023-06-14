import esdl.rand;

struct Foo {
  void pre_randomize() {
    // import std.stdio;
    // writeln("pre_randomize");
  }
  private @rand int frop;
public:
  void display() {
    import std.stdio;
    writeln("frop is: ", frop);
  }
}

class Bar {
  mixin randomization;
  @rand Foo foo;
  void preRandomize() {
    zoo++;
  }
  int zoo = 64;

  constraint!q{
    foo.frop == zoo;
  } frop_cst;
public:
  void display() {
    foo.display();
  }
}

void main()
{
  Bar bar = new Bar();
  for (size_t i=0; i!=20; ++i)
    {
      bar.randomize();
      bar.display();
    }
}
