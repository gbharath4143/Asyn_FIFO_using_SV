class env_fifo;

  wr_age_fifo wr_age;
  rd_age_fifo rd_age;

  wr_bfm_fifo wr_bfm;
  rd_bfm_fifo rd_bfm;

  sbd_fifo sbd; 

  task run();

    $display("############ ENV ############");

    wr_age = new();  
    rd_age = new();

    sbd = new();

    fork
      wr_age.run();
      rd_age.run();

      sbd.run();
    join

  endtask

endclass
