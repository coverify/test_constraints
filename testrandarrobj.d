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
  @rand Bar bar;
  this() {
    bar = new Bar();
  }
  
  void display() {
    bar.display();
  }
}

class Bar
{
  mixin randomization;

  @rand byte[] bar;
  void display() {
    writeln("bar: ", bar);
  }

  // this() {
  //   bar.length = 10;
  // }
  constraint! q{
    bar.length < 10;
    bar.length >= 0;
    foreach(i, f; bar) {
      f < 24 && f >= 16 ||
  	f < 100 && f > 80;
    }
  } cstBar;

}

void main() {
  Foo foo = new Foo;
  for (size_t i=0; i!=10; ++i) {
    foo.randomize();
    foo.display();
  }
  import std.stdio;
  writeln("End of program");
}
