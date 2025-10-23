class wr_bfm_fifo;

	wr_txn_fifo txn;

  virtual interface interface_fifo vif;

  function new();
    vif = $root.top_fifo.pif;
  endfunction

    task run();
    repeat (`DEPTH) begin
        txn	=	new();
        com_fifo::wr_gen2bfm.get(txn);
		 @(posedge vif.wr_clk);    
    vif.wr_cb.wr_en   <=   txn.wr_en;
    vif.wr_cb.wdata   <=   txn.wdata;
    @(posedge vif.wr_clk);  
    vif.wr_cb.wr_en   <=   0;
    vif.wr_cb.wdata   <=   0;
    end
    endtask
endclass
