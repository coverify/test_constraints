import esdl.rand;
import esdl.data.packed;
import esdl.data.bvec;

struct Packed {
  mixin packed!q{
    @rand int x;
    @rand ubvec!4 helo;
    @rand ubvec!3 nohelo;
    @rand bool yo;
  };

  // pragma(msg, (packed!q{
  // 	@rand int x;
  // 	@rand bvec!4 helo;
  // 	@rand ubvec!3 nohelo;
  // 	ubvec!1 yo;
  //     }));
}

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
  @rand Packed pak;
  
  void preRandomize() {
    zoo++;
  }
  int zoo = 64;

  constraint!q{
    // pak.nohelo == 4;
    pak.helo <= pak.nohelo;
    foo.frop == zoo;
  } frop_cst;
public:
  void display() {
    import std.stdio;
    foo.display();
    writeln("helo is: ", pak.helo);
    writeln("nohelo is: ", pak.nohelo);
    writeln("yo is: ", pak.yo);
    writeln("helo is: ", pak);
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
