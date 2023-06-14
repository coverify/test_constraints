import esdl;
import std.stdio;


class Foo {
  mixin randomization;

  @rand uint[] arr;
  uint[] bar = [1, 7, 2, 9];

  void print() {
    writeln(arr);
  }
}


void main()
{
  Foo foo = new Foo;

  uint[] bar = [1, 7, 2, 9];

  foo.randomize_with! q{
    arr.length > bar.length;
    arr.length < 10;

    foreach (j, ele; bar) {
      arr[j] == ele;
    }
  }();

  foo.print();
}
