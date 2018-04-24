# Step 1:  Read in the source file
analyze -format sverilog -lib WORK {encode.sv t_shift_register.sv t_timer.sv tcu.sv permutation.sv des_round_computations.sv key_generator.sv key_counter.sv round_counter.sv des_controller.sv sync_high.sv sync_low.sv eop_detect.sv decode.sv edge_detect.sv timer.sv shift_register.sv rcu.sv usb_receiver.sv usb_transmitter.sv flex_counter.sv flex_pts_sr.sv flex_stp_sr.sv crc5_gen.sv crc16_gen.sv crc5_valid.sv crc16_valid.sv encryptor_core.sv}
elaborate encryptor_core -lib WORK
uniquify
# Step 2: Set design constraints
# Uncomment below to set timing, area, power, etc. constraints
# set_max_delay <delay> -from "<input>" -to "<output>"
# set_max_area <area>
# set_max_total_power <power> mW


# Step 3: Compile the design
compile -map_effort medium

# Step 4: Output reports
report_timing -path full -delay max -max_paths 1 -nworst 1 > reports/encryptor_core.rep
report_area >> reports/encryptor_core.rep
report_power -hier >> reports/encryptor_core.rep

# Step 5: Output final VHDL and Verilog files
write_file -format verilog -hierarchy -output "mapped/encryptor_core.v"
echo "\nScript Done\n"
echo "\nChecking Design\n"
check_design
quit
