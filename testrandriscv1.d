
import std.stdio;
import esdl.rand;

class Riscv_addtrans {
  mixin randomization;

  enum privileged_mode_t: byte
  {
    USER_MODE       = 0b00,
      SUPERVISOR_MODE = 0b01,
      RESERVED_MODE   = 0b10,
      MACHINE_MODE    = 0b11
      }

  enum satp_mode_t: byte {
    BARE = 0b0000,
      SV32 = 0b0001,
      SV39 = 0b1000,
      SV48 = 0b1001,
      SV57 = 0b1010,
      SV64 = 0b1011
      }

  @rand privileged_mode_t init_privileged_mode;
  @rand satp_mode_t SATP_MODE = satp_mode_t.BARE;
  @rand bool virtual_addr_translation_on;
 

  privileged_mode_t[] supported_privileged_mode = [privileged_mode_t.MACHINE_MODE];

  constraint! q{
    //solve init_privileged_mode before virtual_addr_translation_on;
    if ((init_privileged_mode != privileged_mode_t.MACHINE_MODE) &&
	(SATP_MODE != satp_mode_t.BARE)) {
      virtual_addr_translation_on == true;
    } else {
      virtual_addr_translation_on == false;
    }
  } addr_translaction_c;
 
 
}

void main()
{
  Riscv_addtrans riscv_default = new Riscv_addtrans();
  for (size_t i=0; i!=40; ++i) {
    // simple.randomize();
    riscv_default.randomize();
    writeln(riscv_default.init_privileged_mode, " ", riscv_default.virtual_addr_translation_on, " ",riscv_default.SATP_MODE );
  }
}
