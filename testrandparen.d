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
  constraint! q{
    (roo > 0);
    ! (roo < 0 || ! (roo > 32));
  } rooc;
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
  
  constraint! q{
    // bar dist [1 := 4, 2 := 2, 6:8 :/ 3];

    bar != nobar + 4;

    foo /* + boo*/ + pop + mom == 64;
    // pop % 3 == 0;

    // foo + pop + mom == 64 ? pop > 40 : mom > 24;

    (foo + pop + mom == 64 && pop > 40) || (foo + pop + mom != 64 && mom > 24);

    mom > 8 || mom < 25;

    pun1[11] == 0;
    pun1[10] == 0;
    pun1[9] == 0;
    pun1[8] == 0;
    @soft pun1[0..4] == 0;
    // pun1[0:3] == 0;
    pun1 >= 32;

  } cst02;

  constraint! q{
    // this is a comment
    foo + bro + sis + bar == 64;
    pop > 40;
    bro > 24;
    bar != bro;
    @soft bro < 80;
    sis < 24;
    if (pop >= 48) {
      // bro == pop;
      // if (sis <= 1) pun2 == mom + 5;
      pun2 == 2;
    }
    else {
      pun2 == 4;
    }
    // pop + kid3 == 24;
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
    for (size_t i=0; i!=100; ++i) {
      foo.randomize();
      foo.display();
    }
  }
  import std.stdio;
  writeln("DONE MAIN");
}

