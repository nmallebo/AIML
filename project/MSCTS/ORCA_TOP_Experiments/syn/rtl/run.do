vlog isodata_cluster.sv
#vlog euclidean_distance.sv
#vlog centroid_calc.sv
#vlog cluster_assign.sv
#vlog volume_estimation_unit.sv
#vlog stddev_calc.sv
#vlog isodata_accelerator.sv
#vlog tb_isodata.sv
vlog tb_isodata_cluster_scaled_real_output.sv
vsim work.tb_isodata_cluster
vsim -voptargs=+acc work.tb_isodata_cluster
add wave -r *
run -all
