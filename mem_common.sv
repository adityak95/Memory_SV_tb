`define  WIDTH 8
`define  DEPTH 16
`define  ADDR_WIDTH 4
 class mem_common;
		static mailbox gen2bfm=new();
		static mailbox mon2cov=new();
		static mailbox mon2sbd=new();
		static string  testcase="n_WRITES_n_READS";
		static int count =32;
		static int num_txs;
		static int num_miss_matches;
		static int num_matches;
 endclass
