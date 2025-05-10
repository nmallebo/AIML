if {[info exists synopsys_program_name]} {

} else {
  if [is_common_ui_mode ] {
    #set_db [get_pin occ_int2/U_clk_control_i_0/fast_clk_enable_l_reg/CLK ] .cts_pin_insertion_delay 350ps
   #set_db cts_use_inverters false
  set_db cts_buffer_cells [ get_db [get_lib_cells */NBUF*LVT* ] .base_name ] 
   # set_ccopt_property inverter_cells [ get_db [get_lib_cells */IBUF*LVT* ] .base_name ]
  } else {

    #set_ccopt_property insertion_delay 350ps -pin occ_int2/U_clk_control_i_0/fast_clk_enable_l_reg/CLK
   # set_dont_touch [dbGet top.insts.cell.name *NBUFF*]
   # set_ccopt_property use_inverters false 
    set_ccopt_property buffer_cells [ get_db [get_lib_cells */NBUF*LVT* ] .base_name ]
    #set_ccopt_property inverter_cells [ get_db [get_lib_cells */IBUF*LVT* ] .base_name ]
  }
}
