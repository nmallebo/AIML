vlog -lint isodata_cluster.sv
vlog -lint tb_isodata_cluster.sv

vsim work.tb_isodata_cluster

vsim  -voptargs=+acc work.tb_isodata_cluster

run -all
