
interface intf(input bit clk);
    // ------------------- port declaration-------------------------------------
    logic   t;
    logic rst;
    logic   q;
    //--------------------------------------------------------------------------

    //------------- clocking & modport declaration -----------------------------
    clocking cb @(posedge clk);
      default input #2 output #1step;
      output t,rst; //input of DUT
      input  q;     //output of DUT
    endclocking
    //--------------------------------------------------------------------------
        
endinterface

