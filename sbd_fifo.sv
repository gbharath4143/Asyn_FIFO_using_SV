class sbd_fifo;

  wr_txn_fifo wtxn;
  rd_txn_fifo rtxn;

  virtual interface interface_fifo vif;

  function new();
    vif = $root.top_fifo.pif;
  endfunction
    
    bit [`WIDTH-1:0] ref_fifo [$];
    bit [`WIDTH-1:0] temp;

    task run();
      $display("SBD");
      com_fifo::SBD_S=0;
      com_fifo::SBD_F=0;
	  fork
      forever begin
        com_fifo::wr_mon2sbd.get(wtxn);
        if (wtxn.wr_en) begin
          ref_fifo.push_back(wtxn.wdata);
        end
      end
	  forever begin
        com_fifo::rd_mon2sbd.get(rtxn);
        if (rtxn.rd_en) begin
            temp = ref_fifo.pop_front();
            if (rtxn.rdata == temp) com_fifo::SBD_S++ ;
            else com_fifo::SBD_F++ ;
          end
      end
	  join
    endtask  
endclass
