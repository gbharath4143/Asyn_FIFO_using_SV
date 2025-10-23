class rd_mon_fifo;
  
  rd_txn_fifo rtxn;
  
  virtual interface interface_fifo vif;
    
  function new();
    vif=$root.top_fifo.pif;
  endfunction

  task run();
    forever begin
      @(posedge vif.rd_clk);
      rtxn = new();
      if(vif.rd_en) begin
        rtxn.rd_en = vif.rd_en;
      @(vif.rd_cb);
        rtxn.rdata = vif.rdata;
        rtxn.empty = vif.empty;
        rtxn.under_flow = vif.under_flow;
	//	rtxn.print("RMON");
        com_fifo::rd_mon2sbd.put(rtxn);
        com_fifo::rd_mon2cov.put(rtxn);
      end
    end
  endtask  
endclass
