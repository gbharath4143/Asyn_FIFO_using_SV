class txn_fifo;

  bit res;
  
  rand bit wr_en;
  rand bit rd_en;
  rand bit [`WIDTH-1:0] wdata;

  bit [`WIDTH-1:0] rdata;
  bit empty;
  bit full;
  bit over_flow;
  bit under_flow;

  function void print(string str="TXN");
    if((wr_en && !rd_en) || (rd_en && !wr_en)) begin
      string txn;
      $display("################ %s %s ################",txn == (wr_en && !rd_en) ? "READ" : (rd_en && !wr_en) ? "TXN" : "WRITE" ,str);
      if (wr_en && !rd_en) $display("WRITE with data %0d",wdata);
      if (rd_en && !wr_en) $display("READ with data %0d",rdata);
    end
  endfunction

endclass