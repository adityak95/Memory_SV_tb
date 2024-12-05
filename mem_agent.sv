class mem_agent;
	mem_gen gen;
	mem_bfm bfm;
	mem_cov cov;
	mem_mon mon;

	task run();
	$display(" #### running  run task :: MEM_AGENT");
			gen=new();
			bfm=new();
			cov=new();
			mon=new();
			fork
				gen.run();
				bfm.run();
				mon.run();
				cov.run();
			join
	endtask
endclass
