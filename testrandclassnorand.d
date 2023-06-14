import esdl.rand;

class Foo {
  mixin randomization;
  private @rand byte frop;
  constraint! q{
    frop > 50;
  } gt50;
public:
  void display() {
    import std.stdio;
    writeln("frop is: ", frop);
  }
}

class Frop {
  mixin randomization;
  @rand int frop = 52;
}


int fropfrop = 52;

class Bar {
  this() {
    foo = new Foo;
    fropp = new Frop;
  }
  mixin randomization;
  @rand Foo foo;

  @rand Frop fropp;

  void preRandomize() {
    fropp.frop++;
    fropfrop++;
  }
  // int frop = 52;

  constraint!q{
    foo.frop < fropp.frop;
    // foo.frop < fropfrop;
  } frop_cst;
public:
  void display() {
    foo.display();
  }
}

void main()
{
  Bar bar = new Bar();
  bar.fropp.rand_mode!q{frop}(false);
  for (size_t i=0; i!=10; ++i)
    {
      bar.randomize();
      bar.display();
    }
  bar.fropp.rand_mode!q{frop}(true);
  for (size_t i=0; i!=10; ++i)
    {
      bar.randomize();
      bar.display();
    }
  
}
