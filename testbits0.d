// Copyright: Coverify Systems Technology 2013 - 2014
// License:   Distributed under the Boost Software License, Version 1.0.
//            (See accompanying file LICENSE_1_0.txt or copy at
//            http://www.boost.org/LICENSE_1_0.txt)
// Authors:   Puneet Goel <puneet@coverify.com>

import std.stdio;
import esdl.rand;
import esdl.data.bvec;
import std.string: format;


class Bar
{
  mixin randomization;
  uint XLEN = 32;
  @rand UBit!32 addr_offset;

    
  void display()
  {
    import std.stdio;
    writeln("addr_offset    ", addr_offset);
  }

  constraint! q{
    addr_offset[0..11] == 0;
    // (addr_offset & 0x00000111) == 0x00000000;
  } addr_offset_c;


}

void main()
{
  auto test = new Bar;
  for(size_t i=0;i<50;i++)
    {
      test.randomize;
      test.display();
    }
}
