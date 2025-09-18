interface interface_fifo (input bit wr_clk,rd_clk,res);

  bit wr_en;
  bit rd_en;
  bit [`WIDTH-1:0] wdata;
  bit [`WIDTH-1:0] rdata;
  bit empty;
  bit full;
  bit over_flow;
  bit under_flow;


  clocking wr_cb @(posedge wr_clk);
    default input #0 output #0;
    output wr_en;
    output wdata;
    input full;
    input over_flow;
  endclocking

  clocking rd_cb @(posedge rd_clk);
    default input #0 output #1;
    output rd_en;
    input rdata;
    input empty;
    input under_flow;
  endclocking

endinterface