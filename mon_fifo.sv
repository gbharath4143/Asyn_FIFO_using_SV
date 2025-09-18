class mon_fifo;
  
  txn_fifo txn;
  
  virtual interface interface_fifo vif;
    
  function new();
    vif=$root.top_fifo.pif;
  endfunction

  task run();
    forever begin
      @(vif.wr_cb);
      txn = new();
      if(vif.wr_en!=vif.rd_en) begin
        txn.wr_en = vif.wr_en;
        txn.rd_en = vif.rd_en;
        txn.wdata = vif.wdata;
        txn.rdata = vif.rdata;
        txn.empty = vif.empty;
        txn.full = vif.full;
        txn.under_flow = vif.under_flow;
        txn.over_flow = vif.over_flow;
        com_fifo::mon2sbd.put(txn);
        com_fifo::mon2cov.put(txn);
      end
    end
  endtask  
endclass