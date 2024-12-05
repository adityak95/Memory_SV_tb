vlog list.svh
vsim  -assertdebug -novopt -suppress 12110 top -sv_seed 1234567
#add wave  -position insertpoint sim:/top/pif/*
#add wave  -position insertpoint sim:/top/dut/*
#add wave  -position insertpoint sim:/top/mem_asrt/ HANDSHAKING_PR WDATA_PR RDATA_PR ADDR_PR
do wave.do
run -all
