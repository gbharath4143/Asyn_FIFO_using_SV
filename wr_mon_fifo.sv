class wr_mon_fifo;
  
  wr_txn_fifo wtxn;
  
  virtual interface interface_fifo vif;
    
  function new();
    vif=$root.top_fifo.pif;
  endfunction

  task run();
    forever begin
      @(posedge vif.wr_clk);
	  wtxn = new();
        wtxn.wr_en = vif.wr_en;
        wtxn.wdata = vif.wdata;
        wtxn.full = vif.full;
        wtxn.over_flow = vif.over_flow;
//		wtxn.print("WMON");
        com_fifo::wr_mon2sbd.put(wtxn);
        com_fifo::wr_mon2cov.put(wtxn);
    end
  endtask  
endclass
