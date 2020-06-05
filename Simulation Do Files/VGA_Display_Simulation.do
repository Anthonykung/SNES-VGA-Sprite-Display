quit -sim
vsim -gui work.VGA_Display
add wave *
force -freeze sim:/VGA_Display/reset_n 0 0
force -freeze sim:/VGA_Display/A 1 0
force -freeze sim:/VGA_Display/B 1 0
force -freeze sim:/VGA_Display/X 1 0
force -freeze sim:/VGA_Display/Y 1 0
force -freeze sim:/VGA_Display/Select 1 0
force -freeze sim:/VGA_Display/Start 1 0
force -freeze sim:/VGA_Display/Up 1 0
force -freeze sim:/VGA_Display/Down 1 0
force -freeze sim:/VGA_Display/Left 1 0
force -freeze sim:/VGA_Display/Right 1 0
force -freeze sim:/VGA_Display/Clock_50MHz 1 0, 0 {50 ps} -r 100
run 100ps
force -freeze sim:/VGA_Display/reset_n 1 0
run 100ms
