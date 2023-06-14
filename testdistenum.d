import esdl;

enum FOO: byte
{   a = 0b0000,
    b = 0b0001,
    c = 0b0010,
    d = 0b1111
}


class Bar
{
  mixin randomization;
  bool boo;
  @rand FOO bar;
  constraint! q{
    // if (boo) {
    bar dist [FOO.a := 4, FOO.b := 2, FOO.c:FOO.d :/ 3];
    // }
    // else {
    //   bar dist [FOO.a := 2, FOO.b := 4, FOO.c:FOO.d :/ 3];
    // }
      
  } cenum;
  void display() {
    import std.stdio;
    writeln(bar);
  }
}


void main()
{
  Bar bar = new Bar();
  for (size_t i=0; i!=10; ++i)  {
    bar.randomize();
    bar.display();
  }
}
