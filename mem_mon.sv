class mem_mon;
	mem_tx tx;
	virtual mem_intf vif;
	function  new();
		vif= top.pif;
	endfunction
	task run();
		$display(" #### running  run task :: MEM_MON");
		//  collect data from  interfce
		forever  begin
			@(vif.mon_cb);
			wait(vif.rst==0);
			if(vif.mon_cb.valid && vif.mon_cb.ready)begin
				tx=new();
				tx.addr=vif.mon_cb.addr;
				tx.wr_rd=vif.mon_cb.wr_rd;
				if(vif.mon_cb.wr_rd==1)
					tx.data=vif.mon_cb.wdata;
				else
					tx.data=vif.mon_cb.rdata;
				tx.print("MON");
		// send data to  coverage and  sbd
				mem_common::mon2cov.put(tx);
				mem_common::mon2sbd.put(tx);
			end
		end
	endtask
endclass
