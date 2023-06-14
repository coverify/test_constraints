import esdl;
import std.stdio;
import std.conv: to;

void main()
{
  ulvec!18 foo = cast (ulvec!18) bin!"010110100000111101";
  writeln(foo.to!(string, 2));
  foreach (ref bar; foo) {
    writeln(bar);
    bar = ~bar;
  }
  writeln(foo.to!(string, 2));
}
