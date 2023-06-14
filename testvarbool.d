import esdl;


class Foo {
  mixin randomization;

  @rand ubyte a;
  @rand ubyte c;
  bool b;

  void pre_randomize() {
    b = ! b;
  }
  
  constraint!q{
    if (b) {
      a + c > 0;
      a + c == 10;
    }
    else {
      a + c == 20;
      a + c > 10;
    }
  } const_ab;

  void display() {
    import std.stdio;
    writeln(a, " + ", c, ": ", b);
  }
}

void main() {
  Foo foo = new Foo();
  for (size_t i=0; i!=40; ++i) {
    foo.randomize();
    foo.display();
  }
}
