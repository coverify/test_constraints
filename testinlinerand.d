import std.stdio;
import esdl;

void main()
{
  uint foo;
  ubvec!18 bar;

  int frop = 32;

  for (size_t i=0; i!=100; ++i) {
    randomize!(foo, bar).constraint!q{foo < 12; bar < $0;}(frop);
    import std.stdio;
    writeln("foo: ", foo, " bar: ", bar);
  }
}
