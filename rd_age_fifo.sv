class rd_age_fifo;
  
  rd_gen_fifo rd_gen;
  rd_bfm_fifo rd_bfm;
  
  task run();
    
    rd_gen=new();
    rd_bfm=new();
    
    fork 
      
      rd_gen.run();
      rd_bfm.run();
      
    join
    
  endtask  
endclass