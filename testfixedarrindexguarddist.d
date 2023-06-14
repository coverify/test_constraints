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

  @rand uint bar;
  
  byte[] foo;
  // @rand ubyte baz = 12;
  //   @rand ubyte[8] bar;

  this() {
    foo.length = 1;
    foo[0] = 42;
  }

  void display() {
    writeln("bar: ", bar);
    //     writeln("bar: ", bar);
    // writeln("baz: ", baz);
  }

  constraint! q{
    if (foo.length == 2) {
      bar dist [foo[0] := 2, foo[1] := 3];
    }
    else if (foo.length == 3) {
      bar dist [foo[0] := 4, foo[1] := 3, foo[2] := 3];
    }
    else {
      bar == 42;
    }
  } cstFoo;

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
