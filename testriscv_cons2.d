import std.stdio;
import esdl;

class constraint_cons1 {
  mixin randomization;

  @rand ubyte[]    sub_program_id_pool;
  @rand ubyte[]    next_program_list;
  // int [8] next_program_list = [1, 525, 41, 65, 412, 57, 87, 654];
  int id;

  constraint! q{
    next_program_list.length <= 8;
    next_program_list.length > 4;
    sub_program_id_pool.length == 10;

    unique [next_program_list];
    
    foreach(i, id; sub_program_id_pool) {
      id < 10;
      if ( i < next_program_list.length) {
	id  == next_program_list[i];
      }
      else {
	id inside [next_program_list];
      }
    }
  } cons1; 


} //

void main()
{
  constraint_cons1 riscv_default = new constraint_cons1();
  for (size_t i=0; i!=100; ++i) {
    // simple.randomize();
    riscv_default.randomize();
    writeln("sub_program_id_pool: ", riscv_default.sub_program_id_pool,
	    " next_program_list: ", riscv_default.next_program_list);
  }
}
