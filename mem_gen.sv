class mem_gen;
	mem_tx tx,tx_t,tx_Q[$];

	task run();
		$display(" #### running  run task :: MEM_GEN");
		//1 write and 1 read
			case(mem_common::testcase)
				"1_WRITE_1_READ":begin
					//write
					tx=new();
					assert(tx.randomize()with {tx.wr_rd==1;});
					tx.print("GEN");
					mem_common:: gen2bfm.put(tx);
					tx_t=tx;
			
					//read
					tx=new();
					assert(tx.randomize()with {tx.wr_rd==0;data==0;tx.addr==tx_t.addr;});
					tx.print("GEN");
					mem_common:: gen2bfm.put(tx);
				end
				"5_WRITES_5_READS":begin
					//5write
					repeat(5)begin
						tx=new();
						assert(tx.randomize()with {tx.wr_rd==1;});
						//tx.print("GEN");
						mem_common:: gen2bfm.put(tx);
						tx_Q.push_back(tx);
					end
			
					//5read
					repeat(5)begin
						tx=new();
						tx_t=new tx;
						tx_t=tx_Q.pop_front();
						assert(tx.randomize()with {tx.wr_rd==0;data==0;tx.addr==tx_t.addr;});
						mem_common:: gen2bfm.put(tx);
						//tx.print("GEN");
					end
				end
				"n_WRITES_n_READS":begin
					//5write
					repeat(mem_common::count)begin
						tx=new();
						assert(tx.randomize()with {tx.wr_rd==1;});
						//tx.print("GEN");
						mem_common:: gen2bfm.put(tx);
						tx_Q.push_back(tx);
					end
			
					//5read
					repeat(mem_common::count)begin
						tx=new();
						tx_t=new tx;
						tx_t=tx_Q.pop_front();
						assert(tx.randomize()with {tx.wr_rd==0;data==0;tx.addr==tx_t.addr;});
						mem_common:: gen2bfm.put(tx);
						//tx.print("GEN");
					end

				end
			endcase
	endtask
endclass
