class wr_age_fifo;
  
  wr_gen_fifo wr_gen;
  wr_bfm_fifo wr_bfm;
  wr_mon_fifo wr_mon;
  wr_cov_fifo wr_cov;
  
  task run();
    wr_gen=new();
    wr_bfm=new();
	wr_mon=new();
    wr_cov=new();

    fork 
      
      wr_gen.run();
      wr_bfm.run();
      wr_mon.run();
	  wr_cov.run();

    join
	
  endtask  
endclass
