
`ifndef TB_PKG
`define TB_PKG
`include "uvm_macros.svh"
package tb_pkg;
 import uvm_pkg::*;
 `include "tff_sequence_item.sv"        // transaction class
 `include "tff_sequence.sv"             // sequence class
 `include "tff_sequencer.sv"            // sequencer class
 `include "tff_driver.sv"               // driver class
 `include "tff_monitor.sv"              // monitor class
 `include "tff_agent.sv"                // agent class  
 `include "tff_coverage.sv"             // coverage class
 `include "tff_scoreboard.sv"           // scoreboard class
 `include "tff_env.sv"                  // environment class

 `include "tff_test.sv"                         // test1
 //`include "test2.sv"
 //`include "test3.sv"

endpackage
`endif 


