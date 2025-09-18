module fifo #(

  //   parameters used in the design

  parameter WIDTH = 8,
  parameter DEPTH = 16,
  parameter PTR_WIDTH = $clog2(DEPTH))

  //   Inputs that are used in Asynchronous FIFO

  (
    input  bit wr_clk,
    input  bit rd_clk,
    input  bit res,
    input  bit wr_en,
    input  bit rd_en,
    input  bit [WIDTH-1:0] wdata,

    //     Outputs that are used in Asynchronous FIFO

    output reg [WIDTH-1:0] rdata,
    output reg empty,
    output reg full,
    output reg over_flow,
    output reg under_flow );

  //   Registers requried for storing and pointers(address)

  reg [WIDTH-1:0] fifo [DEPTH-1:0];

  reg [PTR_WIDTH-1:0] wr_ptr, rd_ptr;
  reg wr_toggle_f,rd_toggle_f;

  always @(posedge wr_clk) begin

    //     Before writing need to clear all the registers by applying reset

    if(res) begin
      foreach(fifo[i]) fifo[i]=0;
      wr_ptr = 0;
      rd_ptr = 0;
      rdata  = 0;
      empty  = 1;
      full   = 0;
      over_flow = 0;
      under_flow = 0;
      wr_toggle_f = 0;
      rd_toggle_f = 0;
    end 

    //   After reset writes can be done
    //   Write operation

    else begin

      if(wr_en==1) begin
        if(full==1) over_flow=1;
        else begin
          fifo[wr_ptr]= wdata;
          if(wr_ptr==(DEPTH-1)) begin
            wr_ptr=0;
            wr_toggle_f=1;
          end
          else wr_ptr=wr_ptr+1;
        end
      end
    end
  end

  //   After reset reads can be done
  //   Read operations

  always @(posedge rd_clk) begin
    if(rd_en==1) begin
      if(empty==1) under_flow=1;
      else begin
        rdata=fifo[rd_ptr];
        if(rd_ptr==(DEPTH-1)) begin
          rd_ptr=0;
          rd_toggle_f=1;
        end
        else rd_ptr=rd_ptr+1;
      end    
    end
  end

  //   After all reads and writes are done then we need to enable the flags of full and empty

  always @(*) begin
    if(wr_ptr==rd_ptr && wr_toggle_f!=rd_toggle_f) full=1;
    else full=0;
    if(wr_ptr==rd_ptr && wr_toggle_f==rd_toggle_f) empty=1;
    else empty=0;
  end

endmodule