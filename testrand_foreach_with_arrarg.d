import esdl;
import std.stdio;


class Foo {
  mixin randomization;

  @rand uint[] arr;

  void print() {
    writeln(arr);
  }
}


void main()
{
  Foo foo = new Foo;

  uint[] bar = [1, 7, 2, 9, 0];
  for (size_t i=0; i!=10; ++i) {
    bar[4] = cast(uint) i;
    foo.randomize_with! q{
      arr.length > $0.length;
      arr.length < 10;
      foreach (j, ele; $0) {
	arr[j] == ele;
      }
      foreach (ele; arr) {
	ele < 10;
      }
    }(bar);
    foo.print();
  }
}
