class mem_tx;
//clk,rst,addr,wdata,wr_rd,valid,rdata,ready
rand bit [`ADDR_WIDTH-1:0]addr;
rand bit [`WIDTH-1:0]data;//  indicates both wdata and rdata
rand bit wr_rd;

 constraint addr_c{
 
 //	addr.size() ==`DEPTH;
	unique {addr};
 }

function  void print(input string  str="mem_tx");
	$display(" ######## priniting  %0s  txs ###### ",str);
	$display("\t addr=%0h ",addr);
	$display("\t wr_rd=%0s",wr_rd?"WRITE":"READ");
	$display("\t data=%0h",data);
endfunction
endclass
