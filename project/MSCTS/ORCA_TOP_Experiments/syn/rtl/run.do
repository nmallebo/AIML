vlog sqrt_newton.sv
#vlog euclidean_distance.sv
#vlog centroid_calc.sv
#vlog cluster_assign.sv
#vlog volume_estimation_unit.sv
#vlog stddev_calc.sv
#vlog isodata_accelerator.sv
#vlog tb_isodata.sv
vlog tb_sqrt_newton.sv
vsim work.sqrt_tb
vsim -voptargs=+acc work.sqrt_tb
add wave -r *
run -all
