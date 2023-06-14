import esdl;
import std.stdio;


class Foo
{
  mixin Randomization;
  @rand uint foo;
  @rand uint bar;

  void print() {
    import std.stdio: writeln;
    writeln("foo: ", foo, " bar: ", bar);
  }

  constraint! q{
    foo <= 64;
    foo > 0;
    bar > 0;
    bar <= 64;
    @soft bar >= 64;
    foo + bar == 64;
  } cst;
}

class Bar: Entity
{
  Foo[] foos;

  uint len = 16;  
  uint threadCnt = 8;


  void randFoo() {
    foos.length = len;
    Fork[] forks;

    for (size_t i=0; i!=threadCnt; ++i) {
      forks ~= (Foo[] fs, size_t i) {
	return fork (() {
	    randomizeSome(fs, i);
	  });
      } (foos[], i);
    }
    foreach (i, f; forks) f.set_thread_affinity(i);
    foreach (f; forks) f.join();

    // wait (10.nsec);
    foreach (i, foo; foos) {
      import std.stdio;
      writeln(i);
      assert (foo !is null);
      foo.print();
    }

  }

  Task!randFoo rfoo;

  void randomizeSome(Foo[] foos, size_t i) {
    import std.stdio;
    writeln("Thread: ", i);
    foreach (ref foo; foos[i*len/threadCnt..(i+1)*len/threadCnt]) {
      foo = new Foo;
      foo.randomize();
    }
  }
}

class Top: RootEntity {
  Bar bar;
}


void main(string[] args) {
  Top top = new Top;
  top.multicore(0, 1);
  top.elaborate("top", args);
  top.simulate();

}
