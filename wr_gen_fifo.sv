class wr_gen_fifo;
  txn_fifo wtxn;
  task run();
    repeat (`DEPTH) begin
      wtxn = new();
      void'(wtxn.randomize() with{wr_en==1;rd_en==0;});
      com_fifo::gen2bfm.put(wtxn);
      wtxn.print("Gen");
    end
  endtask  
endclass