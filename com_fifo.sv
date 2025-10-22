`define WIDTH 8
`define DEPTH 16
`define PTR_WIDTH $clog2(`DEPTH)

class com_fifo;
  
  static mailbox gen2bfm =new(); 
  
  static mailbox wr_mon2cov =new(); 
  static mailbox rd_mon2cov =new(); 
  static mailbox wr_mon2sbd =new();
  static mailbox rd_mon2sbd =new();
  
  static semaphore sem=new(1);
  static semaphore end_sem=new(1);
  
  
  static int SBD_S;
  static int SBD_F;
  
endclass
