class rd_bfm_fifo;
  virtual interface interface_fifo vif;
  function new();
    vif=$root.top_fifo.pif;
  endfunction
    task run();
      com_fifo::sem.get(1);
      repeat (`DEPTH) begin
        rd_txn_fifo txn;
		txn=new();
        com_fifo::gen2bfm.get(txn);
        @(vif.rd_cb);
        vif.rd_cb.rd_en <= txn.rd_en;
        @(vif.rd_cb);
		txn.rdata = vif.rdata;
		txn.empty = vif.empty;
		txn.under_flow = vif.under_flow;
		txn.print("RD_BFM");
        vif.rd_en=0;
      end
      com_fifo::sem.put(1);
    endtask  
endclass
