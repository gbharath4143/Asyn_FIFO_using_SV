class rd_gen_fifo;
  txn_fifo rtxn;
  task run();
    repeat (`DEPTH) begin
      rtxn = new();
      void'(rtxn.randomize() with{wr_en==0;rd_en==1;});      
      com_fifo::gen2bfm.put(rtxn);
    end
  endtask  
endclass