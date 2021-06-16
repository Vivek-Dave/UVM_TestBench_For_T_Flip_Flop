
class tff_monitor extends uvm_monitor;
  //----------------------------------------------------------------------------
  `uvm_component_utils(tff_monitor)
  //----------------------------------------------------------------------------

  //------------------- constructor --------------------------------------------
  function new(string name="tff_monitor",uvm_component parent);
    super.new(name,parent);
  endfunction
  //----------------------------------------------------------------------------
  
  //---------------- sequence_item class ---------------------------------------
  tff_sequence_item  txn;
  //----------------------------------------------------------------------------
  
  //------------------------ virtual interface handle---------------------------  
  virtual interface intf vif;
  //----------------------------------------------------------------------------

  //------------------------ analysis port -------------------------------------
  uvm_analysis_port#(tff_sequence_item) ap_mon;
  //----------------------------------------------------------------------------
  
  //------------------- build phase --------------------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!(uvm_config_db#(virtual intf)::get(this,"","vif",vif)))
    begin
      `uvm_fatal("monitor","unable to get interface")
    end
    
    ap_mon=new("ap_mon",this);
    txn=tff_sequence_item::type_id::create("txn",this);
  endfunction
  //----------------------------------------------------------------------------

  //-------------------- run phase ---------------------------------------------
  task run_phase(uvm_phase phase);
    forever
    begin
      sample_dut(txn);
      ap_mon.write(txn);
    end
  endtask
  //----------------------------------------------------------------------------

  task sample_dut(output tff_sequence_item txn);
    tff_sequence_item t = tff_sequence_item::type_id::create("t");
    @(vif.cb);
    #1;
    t.t   = vif.t;
    t.rst = vif.rst;
    t.q   = vif.cb.q;
    txn   = t;
  endtask

endclass:tff_monitor

