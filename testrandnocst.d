// Copyright: Coverify Systems Technology 2013 - 2014
// License:   Distributed under the Boost Software License, Version 1.0.
//            (See accompanying file LICENSE_1_0.txt or copy at
//            http://www.boost.org/LICENSE_1_0.txt)
// Authors:   Puneet Goel <puneet@coverify.com>

import std.stdio;
import esdl;

class Foo
{
  mixin randomization;
  @rand int roo;
  @rand ubyte pop;
}




class Bar: Foo
{
  // mixin(_esdl__randomizable());

  // private @rand!(16) ushort bob[];
  mixin randomization;

  private @rand ubyte bro;

  @rand ubyte pun3 = 0;
  @rand ubyte mom;
  @rand ubyte sis;

  @rand ULogic!18 pun1 = 0;
  // @rand int pun1 = 0;
  @rand ubyte pun2 = 0;

  @rand ubyte bar;
  
  byte foo = -10;

  int* test;
  
  void display() {
    import std.stdio;
    writeln("bro: ", bro, " sis: ", sis, " pop: ", pop, " mom: ", mom,
	    " foo: ", foo, " pun3: ", pun3, " pun1: ", pun1, " pun2: ", pun2,
	    " bar: ", bar);
  }

  void preRandomize() {
    if(foo == 20) foo = 0;
    else foo++;
  }

  // void post_randomize() {
  //   writeln("Post Randomize Called");
  // }
  int nobar = 4;
  

}

void main() {
  for (size_t j=0; j!=1; ++j) {
    auto foo = new Bar;
    foo.seedRandom(100);
    for (size_t i=0; i!=1000; ++i) {
      foo.randomize();
      foo.display();
    }
  }
  import std.stdio;
  writeln("DONE MAIN");
}

