import esdl.rand;

class Bar {
  mixin randomization;
  @rand ubyte[] foos;

  this() {
    foos.length = 4;
  }

  void preRandomize() {
    frop++;
  }
  int frop = 52;

  constraint!q{
    // foos.length == 4;
    // foos.length > 2;
    foreach (i, foo; foos) {
      foo <= frop + i;
    }
    foreach (foo; foos) {
      foo > 50;
    }
  } frop_cst;

  void display() {
    import std.stdio;
    writeln(foos);
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
