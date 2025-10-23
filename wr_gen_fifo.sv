class wr_gen_fifo;
  wr_txn_fifo wtxn;
  task run();
    repeat (`DEPTH + 1) begin
      wtxn = new();
      void'(wtxn.randomize() with{wr_en==1;});
      com_fifo::wr_gen2bfm.put(wtxn);
    end
  endtask  
endclass
