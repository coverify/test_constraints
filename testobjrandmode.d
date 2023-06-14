import esdl;

class Foo
{
  mixin randomization;

  @rand ubyte a;
  @rand ubyte b;

  constraint!q{
    a < b;
    b < a;
  } impossible;
}

class Bar
{
  this() {
    foo = new Foo();
  }
  
  mixin randomization;

  @rand Foo foo;
  @rand ubyte d;
}

void main()
{
  import std.stdio;
  Bar bar = new Bar();

  bar.rand_mode!q{foo}(false);

  for (size_t i=0; i!=10; ++i) {
    bar.randomize();
    writeln(bar.d);
  }
}
