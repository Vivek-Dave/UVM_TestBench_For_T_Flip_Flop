class tff_sequence_item extends uvm_sequence_item;

  //------------ i/p || o/p field declaration-----------------

  rand logic t;  //i/p
  logic rst;

  logic q;        //o/p
  
  //---------------- register tff_sequence_item class with factory --------
  `uvm_object_utils_begin(tff_sequence_item) 
     `uvm_field_int( t   ,UVM_ALL_ON)
     `uvm_field_int( rst ,UVM_ALL_ON)
     `uvm_field_int( q   ,UVM_ALL_ON)
  `uvm_object_utils_end
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  function new(string name="tff_sequence_item");
    super.new(name);
  endfunction
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // write DUT inputs here for printing
  function string input2string();
    return($sformatf(" t=%0b  rst=%0b",t,rst));
  endfunction
  
  // write DUT outputs here for printing
  function string output2string();
    return($sformatf(" q=%0b ", q));
  endfunction
    
  function string convert2string();
    return($sformatf({input2string(), " || ", output2string()}));
  endfunction
  //----------------------------------------------------------------------------

endclass:tff_sequence_item
