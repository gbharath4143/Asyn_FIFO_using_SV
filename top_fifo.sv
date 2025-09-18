module top_fifo;

  bit wr_clk,rd_clk,res;

  interface_fifo pif(wr_clk,rd_clk,res);

  fifo #(`WIDTH,`DEPTH,`PTR_WIDTH) dut (
    .wr_clk(pif.wr_clk),
    .rd_clk(pif.rd_clk),
    .res(pif.res),
    .wr_en(pif.wr_en),
    .rd_en(pif.rd_en),
    .wdata(pif.wdata),
    .rdata(pif.rdata),
    .empty(pif.empty),
    .full(pif.full),
    .over_flow(pif.over_flow),
    .under_flow(pif.under_flow)
  );


  always #5 wr_clk=~wr_clk;
  always #10 rd_clk=~rd_clk;

  env_fifo env;
  
  initial begin
    wr_clk=0;
    rd_clk=0;
    res=1;
    @(posedge rd_clk);
    res=0;    
    env=new();
    $display("############ TOP ############"); 
    env.run();
  end

  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
    #600;
    $display("############ SBD_S = %0d ############",com_fifo::SBD_S);
    $display("############ SBD_F = %0d ############",com_fifo::SBD_F);
    $finish;
  end

endmodule