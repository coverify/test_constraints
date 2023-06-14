// Copyright: Coverify Systems Technology 2013 - 2014
// License:   Distributed under the Boost Software License, Version 1.0.
//            (See accompanying file LICENSE_1_0.txt or copy at
//            http://www.boost.org/LICENSE_1_0.txt)
// Authors:   Puneet Goel <puneet@coverify.com>

import std.stdio;
import esdl.rand;
import esdl.data.bvec;

class Foo
{
  mixin randomization;
  @rand ubyte[][] foo;
  @rand int bar;

  void preRandomize() {
    foo.length = 4;
    foreach (ref f; foo) {
      f.length = 2;
    }
  }
  
  void display() {
    import std.stdio;
    writeln(foo);
  }
}

void main() {
  for (size_t j=0; j!=1; ++j) {
    Foo foo = new Foo;
    foo.seedRandom(0);
    for (size_t i=0; i!=10; ++i) {
      foo.randomize();
      foo.display();
    }
    import std.stdio;
    writeln("End of program");
  }
}
