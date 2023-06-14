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
  @rand(4,4,4,4,4,16) byte[][][][][][] foo;

  // @rand byte[][][][][][] foo;
  void display() {
    import std.stdio;
    writeln(foo);
  }

  constraint! q{
    foo.length >= 1;
    foreach(ff; foo) {
      // the 1st dimension
      ff.length >= 1;
      foreach(f; ff) {
	f.length >= 1;
	foreach(a; f) {
	  a.length == 2;
	  foreach(b; a) {
	    b.length >= 2;
	    foreach(j, c; b) {
	      foreach(i, d; c) // {
		d == (j + 4) * i;
	      // d < 8;
	      // }
	      c.length >= 10;
	    }
	  }
	}
      }
    }
  } aconst;
}

void main() {
  Foo foo = new Foo;
  foo.seedRandom(0);
  for (size_t i=0; i!=10; ++i) {
    foo.randomize();
    // if (i % 100 == 1) {
    foo.display();
    // }
  }
  import std.stdio;
  writeln("End of program");
}
