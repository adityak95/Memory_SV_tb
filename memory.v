module memory(clk,rst,addr,wdata,wr_rd,valid,rdata,ready);
// parameters
parameter WIDTH=8;
parameter DEPTH=8;
parameter ADDR_WIDTH=$clog2(DEPTH);
// ports direction decalaration
input clk,rst;
input [ADDR_WIDTH-1:0]addr;
input [WIDTH-1:0]wdata;
input wr_rd,valid;
output  reg [WIDTH-1:0]rdata;
output reg ready;
// internal registers
reg [WIDTH-1:0]mem[DEPTH-1:0];
integer i;
//process
always@(posedge clk)begin
	if(rst==1)begin// reset all reg variables to 0 
		rdata=0;
		ready=0;
		for(i=0;i<DEPTH;i=i+1)mem[i]=0;
	end
	else begin //  implement fuctionality
		if(valid==1)begin// hand shaking 
			ready=1;
			if(wr_rd==1)begin// write
				mem[addr]=wdata;
			end
			else//read
				rdata=mem[addr];
		end
		else
			ready=0;
	end
end
endmodule
