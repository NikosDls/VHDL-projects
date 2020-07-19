vcom circuit3dataflow.vhd
vsim circuit3
add wave *
force A 0
force B 0
force C 0
run 100
force A 0
force B 0
force C 1
run 100
force A 0
force B 1
force C 0
run 100
force A 0
force B 1
force C 1
run 100
force A 1
force B 0
force C 0
run 100
force A 1
force B 0
force C 1
run 100
force A 1
force B 1
force C 0
run 100
force A 1
force B 1
force C 1
run 100