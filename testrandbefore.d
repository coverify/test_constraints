// Copyright: Coverify Systems Technology 2013 - 2014
// License:   Distributed under the Boost Software License, Version 1.0.
//            (See accompanying file LICENSE_1_0.txt or copy at
//            http://www.boost.org/LICENSE_1_0.txt)
// Authors:   Puneet Goel <puneet@coverify.com>

import esdl;

class Foo
{
  mixin randomization;
  @rand bool roo;
  @rand ubyte pop;
  @rand(false) string dontCareForString;
  string dontCareForString2;
  constraint! q{
    solve roo before pop;
    if (roo) pop == 0;
    else pop > 0;
  } rooc;

  void display() {
    import std.stdio;
    writeln("roo: ", roo, " pop: ", pop);
  }
}




void main() {
  for (size_t j=0; j!=1; ++j) {
    auto foo = new Foo;
    foo.seedRandom(100);
    for (uint i=0; i!=100; ++i) {
      foo.randomize();
      foo.display();
    }
  }
}

