import esdl.rand;

@rand(false)
class Zoo {
}

class Foo {
  mixin randomization;
  private @rand uint frop;
  private @rand uint paaa;
  private @rand uint maaa;
  private @rand ubyte free;
  constraint! q{
    frop > 50;
    paaa + frop + maaa == 100;
    paaa < 100;
    maaa < 100;
  } gt50;
public:
  void display() {
    import std.stdio;
    writeln("frop is: ", frop, " paaa is: ", paaa,
	    " maaa is: ", maaa, " free is: ", free);
  }
}


class Bar {
  mixin randomization;
  this() {
    foos.length = 4;
    foreach (i, ref foo1; foos) {
      foo1.length = 4;
      foreach (ref foo2; foo1) {
	foo2 = new Foo;
      }
    }
  }
  Zoo zoo;
  @rand Foo[][] foos;
  void preRandomize() {
    frop++;
  }
  int frop = 52;

  constraint!q{
    // foos.length == 4;
    // foos.length > 2;
    foreach (i, foo1; foos) {
      foreach (j, foo2; foo1) {
	foo2.frop == frop + i * j;
      }
    }
  } frop_cst;

  void display() {
    foreach (i, foo1; foos) {
      foreach (j, foo2; foo1) {
	import std.stdio;
	writefln("frop: %d, i: %d, j: %d", frop, i, j);
	foo2.display();
      }
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
