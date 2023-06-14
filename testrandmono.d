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

  // void post_randomize() {
  //   writeln("Post Randomize Called");
  // }
  int nobar = 4;
  
  constraint! q{
    foo /* + boo*/  <= 64;
    // pop % 3 == 0;


  } cst02;

  constraint! q{
    // this is a comment
    foo >= 32;
  } cst01;

  // constraint! q{
  //   foo > bar;
  //   foo == 0 || foo == 231243432;
  //   solve foo before bar;
  // }

  // constraint! q{
  //   pop1 + mom2 + kid3 > 64;
  //   pop + kid3 == 24;
  // } cst1;


  // constraint! q{
  //   pop < 64;
  //   mom == 1;
  //   kid == 4;
  // } cst10;

}

void main() {
  for (size_t j=0; j!=1; ++j) {
    auto foo = new Bar;
    foo.seedRandom(100);
    for (uint i=0; i!=100; ++i) {
      foo.randomize();
      foo.display();
    }
  }
  import std.stdio;
  writeln("DONE MAIN");
}

