module  mem_assert(clk,rst,addr,wdata,wr_rd,valid,rdata,ready);
input clk,rst;
input [`ADDR_WIDTH-1:0]addr;
input [`WIDTH-1:0]wdata;
input wr_rd,valid;
input [`WIDTH-1:0]rdata;
input ready;


// handshaking  property
// ready ==1   exactly at  same clock cycles  after  valid is asserted  
property handshaking_pr;
	@(posedge clk) valid==1 |-> ##1 ready==1;
endproperty
HANDSHAKING_PR: assert property(handshaking_pr);

/// wdata property
// at every posedge clk when  wr_rd==1 then my wdata should be known value
property wdata_pr;
		@(posedge clk) wr_rd==1 |->  not($isunknown(wdata));
		//@(posedge clk) wr_rd==1 |->  !($isunknown(wdata));
endproperty
WDATA_PR: assert property(wdata_pr);


// rdata property
// at every posedge clk when  wr_rd==0 then my ddata should be known value
property rdata_pr;
		@(posedge clk) wr_rd==0 |->  not($isunknown(rdata));
		//@(posedge clk) wr_rd==0 |->  !($isunknown(rdata));
endproperty
RDATA_PR: assert property(rdata_pr);


// addr property
//	addr 	should be known value  after exactly handshaing is done  
property addr_pr;
		@(posedge clk)(valid && ready)|-> !($isunknown(addr)); 
endproperty
ADDR_PR: assert property(addr_pr);
//cover property(addr_pr)statement_or_null;


// $rose 
property wr_rd_pr;
		@(posedge clk) rst ==0|->$rose(valid); 
endproperty
WR_RD_PR: assert property(wr_rd_pr);

endmodule
