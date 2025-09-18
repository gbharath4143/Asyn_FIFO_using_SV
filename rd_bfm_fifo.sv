class rd_bfm_fifo;
  virtual interface interface_fifo vif;
  function new();
    vif=$root.top_fifo.pif;
  endfunction
    task run();
      com_fifo::sem.get(1);
      repeat (`DEPTH) begin
        txn_fifo txn;
        com_fifo::gen2bfm.get(txn);
        @(vif.wr_cb);
        vif.wr_en = txn.wr_en;
        vif.rd_en = txn.rd_en;
        @(vif.rd_cb);
        txn.rdata = vif.rdata;
        txn.full = vif.full;
        txn.empty = vif.empty;
        txn.print("BFM");
      end
        vif.wr_en=0;
        vif.rd_en=0;
      com_fifo::sem.put(1);
    endtask  
endclass