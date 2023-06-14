import esdl.rand;

class Foo {
  mixin randomization;
  private @rand byte frop;
  @rand ubyte[10] arr;

  constraint! q{
    frop > 50;
  } gt50;
public:
  void display() {
    import std.stdio;
    writeln("frop is: ", frop, " arr: ", arr);
  }
}


class Bar {
  this() {
    foo = new Foo;
  }
  Bar[] bar;
  mixin randomization;
  @rand Foo foo;
  void preRandomize() {
    frop++;
  }
  int frop = 52;

  constraint!q{
    foo.frop < frop;
    foreach (var; foo.arr) {
      var < 10;
    }
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
