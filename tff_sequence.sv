
/***************************************************
** class name  : tff_sequence
** description : generate random input for DUT
***************************************************/
class tff_sequence extends uvm_sequence#(tff_sequence_item);
  //----------------------------------------------------------------------------
  `uvm_object_utils(tff_sequence)            
  //----------------------------------------------------------------------------

  tff_sequence_item txn;
  int unsigned LOOP = 100;

  //----------------------------------------------------------------------------
  function new(string name="tff_sequence");  
    super.new(name);
  endfunction
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  virtual task body();
    repeat(LOOP) begin 
      txn=tff_sequence_item::type_id::create("txn");
      start_item(txn);
      txn.randomize();
      txn.rst=0;
      finish_item(txn);
    end
  endtask:body
  //----------------------------------------------------------------------------
endclass:tff_sequence

/***************************************************
** class name  : reset_sequence
** description : reset DUT
***************************************************/
class reset_sequence extends tff_sequence;
  //----------------------------------------------------------------------------   
  `uvm_object_utils(reset_sequence)      
  //----------------------------------------------------------------------------
  
  tff_sequence_item txn;
  
  //----------------------------------------------------------------------------
  function new(string name="reset_sequence");
      super.new(name);
  endfunction
  //----------------------------------------------------------------------------
  
  //----------------------------------------------------------------------------
  task body();
    txn=tff_sequence_item::type_id::create("txn");
    start_item(txn);
    txn.randomize();
    txn.rst = 1;
    finish_item(txn);
  endtask:body
  //----------------------------------------------------------------------------
  
endclass

/***************************************************
** class name  : sequence_2
** description :
***************************************************/
class sequence_2 extends tff_sequence;
  //----------------------------------------------------------------------------   
  `uvm_object_utils(sequence_2)      
  //----------------------------------------------------------------------------
  
  tff_sequence_item txn;
  int unsigned LOOP=50;
  
  //----------------------------------------------------------------------------
  function new(string name="sequence_2");
      super.new(name);
  endfunction
  //----------------------------------------------------------------------------
  
  //----------------------------------------------------------------------------
  task body();
    for(int i=0;i<LOOP;i++) begin 
      if(i<LOOP/2) begin
        txn=tff_sequence_item::type_id::create("txn");
        start_item(txn);
        txn.randomize()with{txn.t==0;};
        txn.rst=0;
        finish_item(txn);
      end
      else begin
        txn=tff_sequence_item::type_id::create("txn");
        start_item(txn);
        txn.randomize()with{txn.t==1;};
        txn.rst=0;
        finish_item(txn);
      end
    end
  endtask:body
  //----------------------------------------------------------------------------
  
endclass