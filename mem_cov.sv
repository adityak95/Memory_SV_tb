class mem_cov;
	mem_tx tx;
	 covergroup  mem_cg;
			 ADDR_CP:coverpoint tx.addr{
			 	//	option.auto_bin_max=4;
					 //bins addr0= {3'd0};
			 		 //bins addr1= {3'd1};
			 		 //bins addr2= {3'd2};
			 		 //bins addr3= {3'd3};
			 		 //bins addr4= {3'd4};
			 		 //bins addr5= {3'd5};
			 		 //bins addr6= {3'd6};
			 		 //bins addr7= {3'd7};

			 }
			 WR_RD_CP:coverpoint tx.wr_rd{
			 		bins WRITE ={1'b1};
			 		bins READ  ={1'b0};
			 }
			 CROSS_CP_FOR_ADDR_CP_WR_RD_CP:cross WR_RD_CP ,ADDR_CP;
	 endgroup

function new();
		 mem_cg=new();
endfunction
	task run();
		$display(" #### running  run task :: MEM_COV");
		//  collect tghe data from  mailbox
		// sample the  covergroup
			forever begin
				mem_common::mon2cov.get(tx);
				//addr,data,wr_rd
				mem_cg.sample();
			end
	endtask
endclass
