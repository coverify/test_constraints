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

  @rand UBit!4[4] foo;
  // @rand ubyte baz = 12;
  //   @rand ubyte[8] bar;

  void display() {
    writeln("foo: ", foo);
  }

  constraint! q{
    foreach(i, f; foo) {
      f < 10 && f > 8 ||
	f < 4 && f > 0;
    }
  } cstFoo;

  void preRandomize() {
    // foo.length = 4;
  }
}

void main() {
  Bar foo = new Bar;
  for (size_t i=0; i!=10; ++i) {
    foo.randomize();
    foo.display();
  }
  import std.stdio;
  writeln("End of program");
}
