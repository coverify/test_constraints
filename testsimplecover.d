import std.stdio;
import esdl.rand;
import esdl.data.bvec;
import esdl.base.core: getCoverGroups;


class Foo
{
  @rand byte bar;
}

class Bar: Foo
{
  import std.stdio;

  mixin Randomization;

  @rand byte frop;
  @rand byte[] foo;

  @rand Foo ff;

  void display() {
    writeln("frop: ", frop);
  }

  constraint! q{
    foo.length <= 8;
    foo.length > 1;
    foo[1] == 24;
  } cstFooLength;

  this() {
    init_coverage();
    ff = new Foo;
  }

  covergroup! q{
    coverpoint frop
      {
	bins x1 = {1,2,3};
	bins x2 = {1};
	bins x3 = default;
      }
    coverpoint ff.bar;
  } cg;
}

void main() {
  Bar foo = new Bar();
  for (size_t i=0; i!=64; ++i) {
    foo.randomize();
    foo.cg.sample();
    foo.display();
  }
  writeln(foo.cg.get_coverage());
  foreach (cg; getCoverGroups()) {
    writeln(cg.get_coverage());
  }
}
