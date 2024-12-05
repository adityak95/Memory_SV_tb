onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top/pif/clk
add wave -noupdate /top/pif/rst
add wave -noupdate /top/pif/addr
add wave -noupdate /top/pif/wdata
add wave -noupdate /top/pif/wr_rd
add wave -noupdate /top/pif/valid
add wave -noupdate /top/pif/rdata
add wave -noupdate /top/pif/ready
add wave -noupdate /top/mem_asrt/HANDSHAKING_PR
add wave -noupdate /top/mem_asrt/WDATA_PR
add wave -noupdate /top/mem_asrt/RDATA_PR
add wave -noupdate /top/mem_asrt/ADDR_PR
add wave -noupdate -expand /top/mem_asrt/WR_RD_PR
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {963 ns} {2029 ns}
