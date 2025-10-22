class rd_txn_fifo;

  bit res;
  
  rand bit rd_en;

  bit [`WIDTH-1:0] rdata;
  bit empty;
  bit under_flow;

  function void print(string str="TXN");
      string txn;
      $display("################ %s %s ################","READ",str);
      $display("READ with data %0d",rdata);
  endfunction

endclass
