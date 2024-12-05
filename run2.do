vlog list.svh
vopt work.top +cover=fcbest -o  n_WRITES_n_READS
vsim  -coverage -suppress 12110  n_WRITES_n_READS -sv_seed 123456789
coverage save -onexit n_WRITES_n_READS.ucdb
#add wave -position insertpoint sim:/top/dut/*
do wave.do
do exclusion.do
run -all
