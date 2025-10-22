class rd_age_fifo;
  
  rd_gen_fifo rd_gen;
  rd_bfm_fifo rd_bfm;
  rd_cov_fifo rd_cov;
  rd_mon_fifo rd_mon;

  task run();
    
    rd_gen=new();
    rd_bfm=new();
    rd_cov=new();
	rd_mon=new();

    fork 
      
      rd_gen.run();
      rd_bfm.run();
      rd_cov.run();
	  rd_mon.run();

    join
    
  endtask  
  
endclass
