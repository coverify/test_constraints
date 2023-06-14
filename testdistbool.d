import esdl;

class riscv_page_table_exception_cfg
{
  mixin randomization;

  bool enable_exception;

  // Knobs for each type of exception
  @rand bool allow_page_access_control_exception;
  @rand bool allow_superpage_misaligned_exception;
  @rand bool allow_leaf_link_page_exception;
  @rand bool allow_invalid_page_exception;
  @rand bool allow_privileged_mode_exception;
  @rand bool allow_zero_access_bit_exception;
  @rand bool allow_zero_dirty_bit_exception;

  // Exception ratio control
  uint page_access_fault_ratio     = 10;
  uint misaligned_superpage_ratio  = 10;
  uint leaf_link_page_ratio        = 10;
  uint invalid_page_ratio          = 10;
  uint privl_mode_fault_ratio      = 10;
  uint zero_access_fault_ratio     = 5;
  uint zero_dirty_fault_ratio      = 5;

  constraint!q{
    if (! enable_exception) {
      allow_page_access_control_exception  dist [ true := page_access_fault_ratio,
	  false := 100 - page_access_fault_ratio ];
      allow_superpage_misaligned_exception dist [ true := misaligned_superpage_ratio,
	  false := 100 - misaligned_superpage_ratio ];
      allow_leaf_link_page_exception       dist [ true := leaf_link_page_ratio,
	  false := 100 - leaf_link_page_ratio ];
      allow_invalid_page_exception         dist [ true := invalid_page_ratio,
	  false := 100 - invalid_page_ratio ];
      allow_privileged_mode_exception      dist [ true := privl_mode_fault_ratio,
	  false := 100 - privl_mode_fault_ratio ];
      allow_zero_access_bit_exception      dist [ true := zero_access_fault_ratio,
	  false := 100 - zero_access_fault_ratio ];
      allow_zero_dirty_bit_exception       dist [ true := zero_dirty_fault_ratio,
	  false := 100 - zero_dirty_fault_ratio ];
    }
    else {
      allow_page_access_control_exception  == false;
      allow_superpage_misaligned_exception == false;
      allow_leaf_link_page_exception       == false;
      allow_invalid_page_exception         == false;
      allow_privileged_mode_exception      == false;
      allow_zero_access_bit_exception      == false;
      allow_zero_dirty_bit_exception       == false;
    }
  } exception_ratio_c;

  void display() {
    import std.stdio;
    writeln(
	    " allow_page_access_control_exception: ", allow_page_access_control_exception,
	    " allow_superpage_misaligned_exception: ", allow_superpage_misaligned_exception,
	    " allow_leaf_link_page_exception: ", allow_leaf_link_page_exception,
	    " allow_invalid_page_exception: ", allow_invalid_page_exception,
	    " allow_privileged_mode_exception: ", allow_privileged_mode_exception,
	    " allow_zero_access_bit_exception: ", allow_zero_access_bit_exception,
	    " allow_zero_dirty_bit_exception: ", allow_zero_dirty_bit_exception
	    );
  }
}

void main()
{
  riscv_page_table_exception_cfg cfg = new riscv_page_table_exception_cfg();
  for (size_t i=0; i!=100; ++i) {
    cfg.randomize();
    cfg.display();
  }
}
