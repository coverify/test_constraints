// Copyright: Coverify Systems Technology 2013 - 2014
// License:   Distributed under the Boost Software License, Version 1.0.
//            (See accompanying file LICENSE_1_0.txt or copy at
//            http://www.boost.org/LICENSE_1_0.txt)
// Authors:   Puneet Goel <puneet@coverify.com>

import std.stdio;
import esdl.rand;
import esdl.data.bvec;

enum Foo: ubyte {
  AA, BB, CC, DD, EE, FF, GG, HH
}

class Bar
{
  mixin randomization;

  this() {
    foo = [Foo.AA: 1, Foo.BB: 2, Foo.EE: 3, Foo.HH: 7];
  }
  
  @rand ubyte[Foo] foo;
  
  // @rand ubyte baz = 12;
  //   @rand ubyte[8] bar;

  void display() {
    writeln("foo: ", foo);
  }


  constraint! q{
    foreach(i, f; foo) {
      // if (i == 1) f == 24;
      if (i == Foo.EE) {
	f == 42;
      }
      else {
	f < 20 && f > 16 ||
	  f < 100 && f > 90;
      }
    }
    foo[Foo.HH] == 18;
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
