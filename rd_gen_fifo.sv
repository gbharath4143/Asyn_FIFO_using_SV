class rd_gen_fifo;
  rd_txn_fifo rtxn;
  task run();
    repeat (`DEPTH) begin
      rtxn = new();
      void'(rtxn.randomize() with{rd_en==1;});      
      com_fifo::gen2bfm.put(rtxn);
    end
  endtask  
endclass
