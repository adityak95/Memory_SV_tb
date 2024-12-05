class mem_bfm;
	mem_tx tx;
	 virtual mem_intf vif;
	 function new();
			//	vif=new();//by doing this it ccreates new memory allocation
			vif =top.pif;//top module  interfce handle is assigned to vif ,now both  bfm and  top will refrece to same memory
	 endfunction

	task run();
		$display(" #### running  run task :: MEM_BFM");
		// collect  data from mailbox
			forever begin
					mem_common:: gen2bfm.get(tx);
					drive_tx(tx);
					mem_common::num_txs++;
					//tx.print("BFM");
			end
	endtask

	task drive_tx(mem_tx tx);
	// driving tx data to dut
		//$display(" driving  the  tx data to dut ");
		@(vif.bfm_cb);
		vif.bfm_cb.addr<=tx.addr;
		vif.bfm_cb.wr_rd<=tx.wr_rd;
		if(vif.bfm_cb.wr_rd==1)
				vif.bfm_cb.wdata<=tx.data;
		vif.bfm_cb.valid<=1;
		wait(vif.bfm_cb.ready==1);
			if(vif.bfm_cb.wr_rd==0)
			tx.data=vif.bfm_cb.rdata;
		@( vif.bfm_cb);
		vif.bfm_cb.addr <=0;
		vif.bfm_cb.wr_rd<=0;
		vif.bfm_cb.valid<=0;
		vif.bfm_cb.wdata<=0;

	endtask
endclass
