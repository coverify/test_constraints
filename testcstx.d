import esdl.rand;
import std.stdio;

void main()
{
  writeln(constraintXlate("solver", q{
  	foreach (i, x; foo) {
  	  foo[i] == 0;
  	}
      }, __FILE__, __LINE__));
  
  writeln(constraintXlate("solver", q{
	a[0+4] == 0;
      }, __FILE__, __LINE__));
    

  writeln(constraintXlate("solver", q{
  	a == 4;
      }, __FILE__, __LINE__));
  
  writeln(constraintXlate("solver", q{
  	@soft foreach (i, x; a) {
  	  @soft!2 a[i] == 0;
  	}
      }, __FILE__, __LINE__));
  
  writeln(constraintXlate("solver", q{
  	@soft!4 a.b == 4;
      }, __FILE__, __LINE__));
  
  writeln(constraintXlate("solver", q{
  	a.b.c.d == 4;
      }, __FILE__, __LINE__));
  
  writeln(constraintXlate("solver", q{
  	foreach (i, x; a) {
  	  a[i].b == 0;
  	}
  	foreach (i, x; a) {
  	  a[i] == 0;
  	}
  	foreach (i, x; a) {
  	  a[i].b == 0;
  	}
  	foreach (i, x; a) {
  	  a[i] == 0;
  	}
      }, __FILE__, __LINE__));
  
  writeln(constraintXlate("solver", q{
	foo dist [42 := 4, 24 := 1];
      }, __FILE__, __LINE__));

  writeln(constraintXlate("solver", q{
	if (b) {
	  a dist [42 := 4, 24 := 1];
	}
	else {
	  a dist [42 := 1, 24 := 4];
	}
      }, __FILE__, __LINE__));
  
}
