vlog -lint isodata_cluster_multi_iter.sv
vlog -lint tb_isodata_cluster_scaled_real_output.sv

vsim work.tb_isodata_cluster_scaled_real_output

vsim  -voptargs=+acc work.tb_isodata_cluster_scaled_real_output

run -all