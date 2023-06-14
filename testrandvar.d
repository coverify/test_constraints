// Copyright: Coverify Systems Technology 2013 - 2014
// License:   Distributed under the Boost Software License, Version 1.0.
//            (See accompanying file LICENSE_1_0.txt or copy at
//            http://www.boost.org/LICENSE_1_0.txt)
// Authors:   Puneet Goel <puneet@coverify.com>

import std.stdio;
import esdl;

class Bar
{
  // mixin(_esdl__randomizable());

  // private @rand!(16) ushort bob[];
  mixin randomization;

  private @rand ubyte foo;

  void display() {
    import std.stdio;
    writeln("foo: ", foo,);
  }

  constraint! q{
    foo <= 64;
  } cst02;

  constraint! q{
    foo >= 32;
  } cst01;

}

void main() {
  for (size_t j=0; j!=1; ++j) {
    auto foo = new Bar;
    foo.seedRandom(100);
    for (uint i=0; i!=10; ++i) {
      foo.randomize();
      foo.display();
    }
  }
  import std.stdio;
  writeln("DONE MAIN");
}

