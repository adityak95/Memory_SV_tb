
module top;
//declare the  clk and rst
reg clk,rst;
mem_env env;
event e;
 mem_intf pif(clk,rst);
//dut insantation
 memory #(.WIDTH(`WIDTH),.DEPTH(`DEPTH),.ADDR_WIDTH(`ADDR_WIDTH)) dut (.clk(pif.clk),.rst(pif.rst),.addr(pif.addr),.wdata(pif.wdata),.wr_rd(pif.wr_rd),.valid(pif.valid),.rdata(pif.rdata),.ready(pif.ready));
 //assertion insantation

mem_assert mem_asrt(.clk(pif.clk),.rst(pif.rst),.addr(pif.addr),.wdata(pif.wdata),.wr_rd(pif.wr_rd),.valid(pif.valid),.rdata(pif.rdata),.ready(pif.ready));

initial begin
	clk=0;
	forever #5 clk=~clk;
end
initial begin
	rst=1;
	#10;
	rst=0;
	->e;
end
initial begin
	@e;
	env=new();
	env.run();
end
initial begin
		//#500;
		wait(mem_common::num_txs==mem_common::count*2);
		#50;
		if(mem_common::num_matches==mem_common::count &&  mem_common::num_miss_matches==0)begin

			$display("######  TESTCASE IS PAESED ######## \n\t num_matches=%0d \n\t num_miss_matches=%0d ",mem_common::num_matches,mem_common::num_miss_matches);
		end 
		else begin
			$display("###### TESTCASE IS FAILED ############ \n\t num_matches=%0d \n\t num_miss_matches=%0d ",mem_common::num_matches,mem_common::num_miss_matches);
		end
		$display("\n############ overall  functional coverarge =%0f############\n",$get_coverage());
		$finish;
end
endmodule
