class mem_sbd;
	mem_tx tx;
//decalre  one register
reg[`WIDTH-1:0]mem[int];
	task run();
		$display(" #### running  run task :: MEM_SBD");
		//  collect data from mailbox
		// compare the  tb and dut data  
		forever begin
			mem_common::mon2sbd.get(tx);
			//replicate the  dut bheviour
			// check for wr_rd signal
			// if wr_rd ==1  store  wdata into registers
			// if wr_rd ==0  read  data from  registers
			 if(tx.wr_rd==1)
			        mem[tx.addr] =tx.data;//storing  wdata into reg in particular addr
			 else begin
			 		 if(tx.data==mem[tx.addr])begin//compare radata [tx.data](dut)to  wdata(tb)[mem(tx.addr)]
							mem_common::num_matches++;
							$display("#####   \ntb_addr=%0d tb_data : =%0d \ndutaddr=%0d dutdata =%0d ",tx.addr,tx.data,tx.addr,mem[tx.addr]);
					 end
					 else begin
							mem_common::num_miss_matches++;
							$display("#####   \ntb_addr=%0d tb_data : =%0d \ndutaddr=%0d dutdata =%0d ",tx.addr,tx.data,tx.addr,mem[tx.addr]);
					 end
			 end
				//$display("@@@@@@@@@@@@ mem_reg =%p",mem);
		end
	endtask
endclass
