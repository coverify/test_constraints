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
  @rand(4,4,4) byte[][][] foo;
  void display() {
    import std.stdio;
    writeln(foo);
  }
  constraint!q{
    foo.length > 1;
    foreach(ff; foo) {
      ff.length > 1;
      foreach(j, f; ff) {
	f.length > 2;
	foreach(i, a; f) {
	  a == j + i;
	  // a < 10;
	}
      }
    }
  } aconst;
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
