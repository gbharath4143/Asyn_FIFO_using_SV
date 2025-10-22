class rd_mon_fifo;
  
  rd_txn_fifo rtxn;
  
  virtual interface interface_fifo vif;
    
  function new();
    vif=$root.top_fifo.pif;
  endfunction

  task run();
    forever begin
      @(vif.rd_cb);
      rtxn = new();
      if(vif.rd_en!=vif.rd_en) begin
        rtxn.rd_en = vif.rd_en;
        rtxn.rdata = vif.rdata;
        rtxn.empty = vif.empty;
        rtxn.under_flow = vif.under_flow;
        com_fifo::rd_mon2sbd.put(rtxn);
        com_fifo::rd_mon2cov.put(rtxn);
      end
    end
  endtask  
endclass
