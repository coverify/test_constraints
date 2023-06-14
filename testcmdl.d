import esdl.base.cmdl;

void main()
{
  uint ver;
  string uvm;
  string UVM1, UVM2;
  
  CommandLine cmdl = new CommandLine(["+UVMVERSION=1", "-uvm=euvm", "+UVM+EUVM", "+UVM=ESDL,EUVM"]);

  assert (cmdl.plusArgs("UVM=%s,%s", UVM1, UVM2));
  assert (cmdl.minusArgs("uvm=%s", uvm));
  cmdl.plusArgs("UVMVERSION=%d", ver);

  import std.stdio;
  writeln("ver: ", ver, " UVM: ", UVM1, UVM2, " uvm: ", uvm);

}
