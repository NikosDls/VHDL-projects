vcom XNOR2(dataflow).vhd
vsim xnor2
add wave *
force A 0
force B 0
run 100
force A 0
force B 1
run 100
force A 1
force B 0
run 100
force A 1
force B 1
run 100