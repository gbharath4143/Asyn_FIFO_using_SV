class sbd_fifo;

  txn_fifo txn;

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
      forever begin
        com_fifo::mon2sbd.get(txn);
        if (txn.wr_en && !txn.rd_en) begin
          ref_fifo.push_back(txn.wdata);
        end
        else if (txn.rd_en && !txn.wr_en) begin
            temp = ref_fifo.pop_front();
            if (txn.rdata == temp) com_fifo::SBD_S++ ;
            else com_fifo::SBD_F++ ;
          end
      end
    endtask  
endclass