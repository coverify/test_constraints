import esdl;
import std.stdio;
import std.conv: to;

void main()
{
  ulvec!18 foo = cast (ulvec!18) bin!"00101101ZZZZ1111XX";
  ubvec!18 bar = cast (ubvec!18) bin!"001011010101111110";
  ubvec!18 hot = cast (ubvec!18) bin!"001000000000000000";
  uint ii = 0xdeadbeef;
  writeln(countbits(foo, LOGIC_1));
  writeln(countones(foo));
  writeln(countones(bar));
  writeln(countones(ii));
  writefln("deadbeef: %b", ii);
  writeln(onehot(ii));
  writeln(onehot(hot));
  writeln(onehot(0));
  writeln(onehot0(0));
  for (size_t i=0; i!=16; ++i) {
    writeln(i, ": ", clog2(i));
  }
  for (size_t i=0; i!=16; ++i) {
    ulvec!128 li =  i.toubvec!128;
    writeln(li, ": ", clog2(li));
  }
}
