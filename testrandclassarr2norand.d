import esdl.rand;

class Zoo {
}

class Foo {
  void pre_randomize() {
    import std.stdio;
    // writeln("Foo: pre_randomize()");
  }
  void post_randomize() {
    import std.stdio;
    // writeln("Foo: post_randomize()");
  }
  // mixin randomization;
  @rand private ubyte frop;
  @rand private ubyte paaa;
  @rand private ubyte maaa;
  @rand private ubyte free;
  constraint! q{
    // frop > 50;
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
      foreach (j, ref foo2; foo1) {
	foo2 = new Foo;
	foo2.frop = cast(ubyte) (i * 10 + j);
      }
    }
    bar.length = 4;
    foreach (i, ref f; bar) {
      f.length = 4;
    }
  }

  Zoo zoo;
  @rand Foo[][] foos;

  @rand ubyte[][] bar;

  constraint!q{
    // foos.length == 4;
    // foos.length > 2;
    foreach (i, foo1; foos) {
      foreach (j, foo2; foo1) {
	foo2.frop == bar[i][j];
      }
    }
  } frop_cst;

  void display() {
    import std.stdio;
    writefln("bar: %s", bar);
    foreach (i, foo1; foos) {
      foreach (j, foo2; foo1) {
	writefln("i: %d, j: %d", i, j);
	foo2.display();
      }
    }
  }
  void pre_randomize() {
    import std.stdio;
    // writeln("Bar: pre_randomize()");
  }
  void post_randomize() {
    import std.stdio;
    // writeln("Bar: post_randomize()");
  }
}

void main()
{
  import std.stdio;
  Bar bar = new Bar();

  bar.rand_mode!q{foos}(false);

  for (size_t i=0; i!=1; ++i) {
    bar.randomize();
    bar.display();
  }
  bar.rand_mode!q{foos}(true);
  for (size_t i=0; i!=1; ++i) {
    bar.randomize();
    bar.display();
  }
}
