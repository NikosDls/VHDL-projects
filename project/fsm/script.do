add wave *
force A 00101100
force B 10101000
force clock 0 0, 1 100 -repeat 200
force reset 1
force enable 1
force scrambler_seed 0000000
run 200
force reset 0
force choice 0000
run 200
force choice 0001
run 200
force choice 0010
run 200
force choice 0011
run 200
force choice 0100
run 200
force choice 0101
run 200
force choice 0110
run 200
force choice 0111
run 200
force choice 1000
run 200
force choice 1001
run 200
force reset 1
run 200