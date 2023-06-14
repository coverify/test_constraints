import esdl.rand;

// @rand(false)
// class Zoo {
// }

class Foo {
  mixin randomization;
  private @rand ubyte frop;
  constraint! q{
    frop > 50;
  } gt50;
public:
  void display() {
    import std.stdio;
    writeln("frop is: ", frop);
  }
}


class Bar {
  mixin randomization;
  this() {
    foos.length = 4;
    foreach (i, ref f; foos) {
      f = new Foo;
    }
  }
  // Zoo zoo;
  @rand Foo[] foos;
  void preRandomize() {
    frop++;
  }
  int frop = 52;

  constraint!q{
    // foos.length == 4;
    // foos.length > 2;
    foreach (i, foo; foos) {
      foo.frop == frop  + i;
    }
  } frop_cst;

  void display() {
    foreach (foo; foos) {
      foo.display();
    }
  }
}

void main()
{
  import std.stdio;
  Bar bar = new Bar();
  for (size_t i=0; i!=10; ++i) {
    bar.randomize();
    bar.display();
  }
}
