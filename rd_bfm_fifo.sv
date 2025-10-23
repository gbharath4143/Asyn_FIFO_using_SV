class rd_bfm_fifo;
        rd_txn_fifo txn;
  virtual interface interface_fifo vif;
  function new();
    vif=$root.top_fifo.pif;
  endfunction
    task run();
    repeat (`DEPTH) begin
		txn=new();
        com_fifo::rd_gen2bfm.get(txn);
        @(vif.rd_cb);
        vif.rd_cb.rd_en <= txn.rd_en;
        @(vif.rd_cb);
        vif.rd_en=0;
    end
    endtask  
endclass
