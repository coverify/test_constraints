import esdl;
import std.stdio;

import std.random;

void main()
{
  import std.stdio;

  rndGen().seed(0);

  CstVecDistSolver!int _dist = new CstVecDistSolver!int(null);
  _dist ~= CstVecDistRange!(int)(1, 6, 10);
  _dist ~= CstVecDistRange!(int)(39, 42, 10, true);
  _dist.purge(1);
  _dist.purge(40);
  _dist.purge(41);
  _dist.purge(2);
  _dist.purge(5);
  _dist.purge(6);
  for (size_t i=0; i!=10; ++i) {
    writeln(_dist.urandom());
  }
  _dist.reset();
  for (size_t i=0; i!=10; ++i) {
    writeln(_dist.urandom());
  }
}
