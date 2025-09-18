class wr_age_fifo;
  
  wr_gen_fifo wr_gen;
  wr_bfm_fifo wr_bfm;
  
  task run();
    wr_gen=new();
    wr_bfm=new();
    
    fork 
      
      wr_gen.run();
      wr_bfm.run();
      
    join
  endtask  
endclass