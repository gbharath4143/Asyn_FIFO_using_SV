class wr_txn_fifo;

  bit res;
  
  rand bit wr_en;
  rand bit [`WIDTH-1:0] wdata;

  bit full;
  bit over_flow;

  function void print(string str="TXN");
      string txn;
      $display("################ %s %s ################","WRITE" ,str);
      $display("WRITE with data %0d",wdata);
  endfunction

endclass
