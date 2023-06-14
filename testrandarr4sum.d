import esdl;

class Foo
{
  mixin randomization;

  @rand(2,2,2,2) uint[][][][] foo;

  @rand ubyte bar;

  constraint!q{
    foo.sum == 1000;
    foo.length >= 1;
    foreach(ff; foo) {
      ff.length >= 1;
      foreach(f; ff) {
	f.length >= 1;
	foreach(a; f) {
	  a.length >= 1;
	  foreach(b; a) {
	    b != 0;
	    b <= 1000;
	  }
	}
      }
    }
    unique [foo];
  } cst01;

  void display() {
    import std.stdio;
    writeln(foo);
  }
}

void main()
{
  Foo foo = new Foo;

  for (size_t i=0; i!=100; ++i) {
    foo.randomize();
    foo.display();
  }
}
