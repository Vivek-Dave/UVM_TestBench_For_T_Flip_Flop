

class tff_sequencer extends uvm_sequencer#(tff_sequence_item);
  //----------------------------------------------------------------------------
  `uvm_component_utils(tff_sequencer)  
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  function new(string name="tff_sequencer",uvm_component parent);  
    super.new(name,parent);
  endfunction
  //----------------------------------------------------------------------------
  
endclass:tff_sequencer

