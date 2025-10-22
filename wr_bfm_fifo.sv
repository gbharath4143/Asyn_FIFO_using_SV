class wr_bfm_fifo;

  virtual interface interface_fifo vif;

  function new();
    vif = $root.top_fifo.pif;
  endfunction

    task run();
      com_fifo::sem.get(1);
      repeat (`DEPTH) begin
        wr_txn_fifo txn;
        txn = new();
        com_fifo::gen2bfm.get(txn);
        vif.wr_en  = txn.wr_en;
        vif.wdata  = txn.wdata;
		@(posedge vif.wr_clk);
		txn.print("WR_BFM");
        vif.wr_en=0;
		end
      com_fifo::sem.put(1);
    endtask
endclass
