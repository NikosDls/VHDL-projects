vcom circuit5dataflow.vhd
vsim circuit5
add wave *
force A0 0
force A1 0
run 100
force A0 0
force A1 1
run 100
force A0 1
force A1 0
run 100
force A0 1
force A1 1
run 100

