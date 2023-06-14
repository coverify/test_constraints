// Copyright: Coverify Systems Technology 2013 - 2014
// License:   Distributed under the Boost Software License, Version 1.0.
//            (See accompanying file LICENSE_1_0.txt or copy at
//            http://www.boost.org/LICENSE_1_0.txt)
// Authors:   Puneet Goel <puneet@coverify.com>

import std.stdio;
import esdl.rand;
import esdl.data.bvec;

int FFFF = 20;

class Foo
{
  mixin randomization;
  @rand(4,4) byte[][] foo;
  @rand int bar;
  void display() {
    import std.stdio;
    writeln(foo, " : ", bar);
  }
  constraint!q{
    foo.length == 4;
    foo[0].length == 2;
    foreach(i, ff; foo) {
      // if (i == 0) ff.length == 2;
      // foo[i].length > 4;
      // ff.length > 4;
      foreach(j, f; ff) {
	f == j + 2;
	f < 20;
      }
    }
  } aconst;
}

void main() {
  Foo foo = new Foo;
  int bar = 10;
  for (size_t i=0; i!=10; ++i) {
    foo.randomizeWith!q{bar == $0;}(i);
    foo.display();
  }
  import std.stdio;
  writeln("End of program");
}
