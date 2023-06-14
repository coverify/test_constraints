// Copyright: Coverify Systems Technology 2013 - 2014
// License:   Distributed under the Boost Software License, Version 1.0.
//            (See accompanying file LICENSE_1_0.txt or copy at
//            http://www.boost.org/LICENSE_1_0.txt)
// Authors:   Puneet Goel <puneet@coverify.com>

import std.stdio;
import esdl.rand;
import esdl.data.bvec;

class Bar
{
  mixin randomization;

  @rand ubyte[] foo;
  void display() {
    writeln("foo: ", foo);
  }


  constraint! q{
    foo.length < 10;
    foo.length >= 4;
    foreach (i, f; foo) {
      if (i < foo.length - 1) {
	foo[i] > foo[i+1];
      }
    }
  } cstFoo;

}

void main() {
  Bar foo = new Bar;
  foo.seedRandom(100);
  for (size_t i=0; i!=10; ++i) {
    foo.randomize();
    foo.display();
  }
  import std.stdio;
  writeln("End of program");
}
