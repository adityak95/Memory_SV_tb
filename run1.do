vlog list.svh
#vopt work.top +cover=fcbest -o n_WRITES_n_READS
vsim  -coverage n_WRITES_n_READS  -sv_seed 512875
add wave  -position insertpoint sim:/top/dut/*
coverage save -onexit n_WRITES_n_READS.ucdb
#do wave.do
run -all
