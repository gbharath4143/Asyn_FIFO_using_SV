class wr_gen_fifo;
  wr_txn_fifo wtxn;
  task run();
    repeat (`DEPTH) begin
      wtxn = new();
      void'(wtxn.randomize() with{wr_en==1;});
      com_fifo::gen2bfm.put(wtxn);
    end
  endtask  
endclass
