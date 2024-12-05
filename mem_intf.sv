interface mem_intf(input reg clk, rst);
logic [`ADDR_WIDTH-1:0]addr;
logic [`WIDTH-1:0]wdata;
logic wr_rd,valid;
logic [`WIDTH-1:0]rdata;
logic ready;



clocking bfm_cb@(posedge clk);
default input #0 output #1;
output  addr;
output  wdata;
output  wr_rd;
output  valid;
input   rdata;
input   ready;
endclocking

clocking mon_cb@(posedge clk);
default input #1 ;
input  addr;
input  wdata;
input  wr_rd;
input  valid;
input   rdata;
input   ready;
endclocking
endinterface
