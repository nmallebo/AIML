### Start verbose source output (echo mode) for '../../ORCA_TOP.design_config.tcl' ...
# set lib_dir /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib
# set hack_lef_dir /u/bcruik2/hacked_lefs
# set top_design ORCA_TOP
# set FCL 0
# set add_ios 0
# set pad_design 0
# set design_size {1000 644}
# set design_io_border 10
# set dc_floorplanning 1
# set enable_dft  1
# set innovus_enable_manual_macro_placement 1
# set split_constraints 0
# set rtl_list [list ../../syn/rtl/$top_design.sv ]
# set slow_corner "ss0p75vn40c ss0p75vn40c_i0p95v ss0p75vn40c_i0p75v ss0p95vn40c ss0p95vn40c_i0p75v"
# set fast_corner "ff0p95vn40c ff0p95vn40c_i1p16v ff0p95vn40c_i0p95v ff1p16vn40c ff1p16vn40c_i1p16v ff1p16vn40c_i0p95v"
# set synth_corners_slow $slow_corner
# set synth_corners_fast $fast_corner
# set slow_metal Cmax.tlup_-40
# set fast_metal Cmin.tlup_-40
# set lib_types "$lib_dir/stdcell_rvt/db_nldm $lib_dir/stdcell_lvt/db_nldm $lib_dir/stdcell_hvt/db_nldm $lib_dir/io_std/db_nldm $lib_dir/sram/db_nldm $lib_dir/pll/db_nldm"
# set ndm_types "$lib_dir/stdcell_rvt/ndm $lib_dir/stdcell_lvt/ndm $lib_dir/stdcell_hvt/ndm $lib_dir/sram/ndm $lib_dir/io_std/ndm  $lib_dir/pll/ndm"
# set lib_types_target "$lib_dir/stdcell_rvt/db_nldm"
# set sub_lib_type "saed32?vt_ saed32sram_ saed32io_wb_ saed32pll_ saed32?vt_ulvl_ saed32?vt_dlvl_"
# set sub_lib_type_target "saed32rvt_"
# set synth_corners_target "ss0p95vn40c ss0p75vn40c" 
# set tech_lef ${hack_lef_dir}/tech.lef 
# set lef_types [list $hack_lef_dir  \
$lib_dir/sram/lef/ \
$lib_dir/io_std/lef \
$lib_dir/pll/lef \
]
# set sub_lef_type "saed32nm_?vt_*.lef saed32sram.lef saed32io_std_wb saed32_PLL.lef"
# set synth_corners $slow_corner
# set synth_corners_slow $slow_corner
# set synth_corners_fast $fast_corner
# set mwlib_types [list $lib_dir/stdcell_hvt/milkyway \
$lib_dir/stdcell_rvt/milkyway \
$lib_dir/stdcell_lvt/milkyway  \
$lib_dir/io_std/milkyway \
$lib_dir/sram/milkyway $lib_dir/pll/milkyway \
 ]
# set sub_mwlib_type "saed32nm_?vt_* SRAM32NM saed32io_wb_* SAED32_PLL_FR*"
# if { 0 } {
    set corners ""
    #Add Worst corners
    set corners "$corners ss0p75vn40c ss0p75vn40c_i0p95v ss0p75vn40c_i0p75v ss0p95vn40c ss0p95vn40c_i0p75v"
    #Add Best corners
    set corners "$corners ff0p95vn40c ff0p95vn40c_i1p16v ff0p95vn40c_i0p95v ff1p16vn40c ff1p16vn40c_i1p16v ff1p16vn40c_i0p95v"
    #Add Leakage corners
    set corners "$corners ff0p95v125c f0p95v125c_i1p16v ff0p95v125c_i0p95v ff1p16v125c ff1p16v125c_i1p16v ff1p16v125c ff1p16v125c_i0p95v"
    set lib_types "stdcell_hvt stdcell_rvt stdcell_lvt sram_lp"
    # Get the main standard cells, and also the level shifters.  Plus srams.
    set sub_lib_type "saed32?vt_ saed32?vt_ulvl_ saed32?vt_dlvl_ saed32sram_"
}
# set topdir [ lindex [ regexp -inline "(.*)\(syn\|pt\|apr\)" [pwd] ] 1 ]
# set sub_block {SDRAM_TOP 
				BLENDER_0 
				PCI_TOP 
				CONTEXT_MEM 
				RISC_CORE 
				CLOCKING 
				BLENDER_1 
				PARSER 
				}
# set sub_block_I {I_SDRAM_TOP I_BLENDER_1  I_BLENDER_0 I_RISC_CORE I_CONTEXT_MEM I_PCI_TOP I_PARSER I_CLOCKING}
# set macro_block {I_SDRAM_TOP I_PCI_TOP I_RISC_CORE I_CONTEXT_MEM}
# if {[info exists synopsys_program_name]} {
        if { $synopsys_program_name == "dc_shell" } {
           set_host_options -max_cores 4
        } 
        if { ( $synopsys_program_name == "icc2_shell" ) || ($synopsys_program_name == "fc_shell" ) } {
           set_host_options -max_cores 4
        }
} elseif {[get_db root: .program_short_name] == "innovus"} {
        if [is_common_ui_mode ] {set_multi_cpu_usage -local_cpu 8  
        } else { setMultiCpuUsage -localCpu 8 }
} elseif {[get_db root: .program_short_name] == "genus"} {
  set_db / .max_cpus_per_server 8 
}
### End verbose source output for '../../ORCA_TOP.design_config.tcl'.
######## STARTING INITIALIZE and FLOORPLAN #################
set_default_view -setup func_worst_scenario
#% Begin Load MMMC data ... (date=06/12 01:48:28, mem=1516.9M)
#% End Load MMMC data ... (date=06/12 01:48:28, total cpu=0:00:00.1, real=0:00:00.0, peak res=1517.8M, current mem=1517.8M)

Loading LEF file /u/bcruik2/hacked_lefs/tech.lef ...

Loading LEF file saed32sram.lef ...
Set DBUPerIGU to M2 pitch 152.
WARNING (LEFPARS-2003): BUSBITCHARS is a required statement in LEF files with version 5.5 and earlier.
Without BUSBITCHARS defined, the LEF file is technically incorrect.
Refer to the LEF/DEF 5.5 or earlier Language Reference manual on how to define this statement. See file saed32sram.lef at line 197399.

Loading LEF file saed32nm_rvt_1p9m.lef ...
WARNING (LEFPARS-2003): BUSBITCHARS is a required statement in LEF files with version 5.5 and earlier.
Without BUSBITCHARS defined, the LEF file is technically incorrect.
Refer to the LEF/DEF 5.5 or earlier Language Reference manual on how to define this statement. See file saed32nm_rvt_1p9m.lef at line 148040.

Loading LEF file saed32nm_hvt_1p9m.lef ...
WARNING (LEFPARS-2003): BUSBITCHARS is a required statement in LEF files with version 5.5 and earlier.
Without BUSBITCHARS defined, the LEF file is technically incorrect.
Refer to the LEF/DEF 5.5 or earlier Language Reference manual on how to define this statement. See file saed32nm_hvt_1p9m.lef at line 191962.

Loading LEF file saed32_PLL.lef ...
WARNING (LEFPARS-2003): BUSBITCHARS is a required statement in LEF files with version 5.5 and earlier.
Without BUSBITCHARS defined, the LEF file is technically incorrect.
Refer to the LEF/DEF 5.5 or earlier Language Reference manual on how to define this statement. See file saed32_PLL.lef at line 372.

Loading LEF file saed32nm_lvt_1p9m.lef ...
WARNING (LEFPARS-2003): BUSBITCHARS is a required statement in LEF files with version 5.5 and earlier.
Without BUSBITCHARS defined, the LEF file is technically incorrect.
Refer to the LEF/DEF 5.5 or earlier Language Reference manual on how to define this statement. See file saed32nm_lvt_1p9m.lef at line 67466.

##  Check design process and node:  
##  Both design process and tech node are not set.

Loading view definition file from mmmc.tcl
Starting library reading in 'Multi-threaded flow' (with '8' threads)
Reading worst_libs timing library /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ss0p75vn40c.lib.
**WARN: (TECHLIB-1277):	The attribute 'fanout_load' has been defined for output pin 'D'. 'fanout_load' cannot be defined at this level and is being ignored. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ss0p75vn40c.lib, Line 84611)
**WARN: (TECHLIB-1277):	The attribute 'fanout_load' has been defined for output pin 'D'. 'fanout_load' cannot be defined at this level and is being ignored. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ss0p75vn40c.lib, Line 84662)
**WARN: (TECHLIB-1277):	The attribute 'fanout_load' has been defined for output pin 'D'. 'fanout_load' cannot be defined at this level and is being ignored. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ss0p75vn40c.lib, Line 84713)
**WARN: (TECHLIB-313):	Property 'fanout_load' can not be set on pin 'D' of cell 'NMT1_RVT' (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ss0p75vn40c.lib)
**WARN: (TECHLIB-313):	Property 'fanout_load' can not be set on pin 'D' of cell 'NMT2_RVT' (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ss0p75vn40c.lib)
**WARN: (TECHLIB-313):	Property 'fanout_load' can not be set on pin 'D' of cell 'NMT3_RVT' (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ss0p75vn40c.lib)
**WARN: (TECHLIB-1277):	The attribute 'fanout_load' has been defined for output pin 'D'. 'fanout_load' cannot be defined at this level and is being ignored. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ss0p75vn40c.lib, Line 120051)
**WARN: (TECHLIB-1277):	The attribute 'fanout_load' has been defined for output pin 'D'. 'fanout_load' cannot be defined at this level and is being ignored. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ss0p75vn40c.lib, Line 120102)
**WARN: (TECHLIB-1277):	The attribute 'fanout_load' has been defined for output pin 'D'. 'fanout_load' cannot be defined at this level and is being ignored. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ss0p75vn40c.lib, Line 120153)
**WARN: (TECHLIB-313):	Property 'fanout_load' can not be set on pin 'D' of cell 'PMT1_RVT' (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ss0p75vn40c.lib)
**WARN: (TECHLIB-313):	Property 'fanout_load' can not be set on pin 'D' of cell 'PMT2_RVT' (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ss0p75vn40c.lib)
**WARN: (TECHLIB-313):	Property 'fanout_load' can not be set on pin 'D' of cell 'PMT3_RVT' (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ss0p75vn40c.lib)
**WARN: (TECHLIB-302):	No function defined for cell 'PMT3_RVT'. The cell will only be used for analysis. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ss0p75vn40c.lib)
**WARN: (TECHLIB-302):	No function defined for cell 'PMT2_RVT'. The cell will only be used for analysis. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ss0p75vn40c.lib)
**WARN: (TECHLIB-302):	No function defined for cell 'PMT1_RVT'. The cell will only be used for analysis. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ss0p75vn40c.lib)
**WARN: (TECHLIB-302):	No function defined for cell 'NMT3_RVT'. The cell will only be used for analysis. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ss0p75vn40c.lib)
**WARN: (TECHLIB-302):	No function defined for cell 'NMT2_RVT'. The cell will only be used for analysis. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ss0p75vn40c.lib)
**WARN: (TECHLIB-302):	No function defined for cell 'NMT1_RVT'. The cell will only be used for analysis. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ss0p75vn40c.lib)
Read 294 cells in library saed32rvt_ss0p75vn40c.
Reading worst_libs timing library /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_dlvl_ss0p75vn40c_i0p95v.lib.
**WARN: (TECHLIB-1161):	The library level attribute default_operating_conditions on line 6569 is defined after at least one cell definition. The attribute will be ignored. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_dlvl_ss0p75vn40c_i0p95v.lib)
**WARN: (TECHLIB-1161):	The library level attribute default_wire_load on line 6570 is defined after at least one cell definition. The attribute will be ignored. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_dlvl_ss0p75vn40c_i0p95v.lib)
**WARN: (TECHLIB-1161):	The library level attribute default_wire_load_selection on line 6571 is defined after at least one cell definition. The attribute will be ignored. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_dlvl_ss0p75vn40c_i0p95v.lib)
Read 24 cells in library saed32rvt_dlvl_ss0p75vn40c_i0p95v.
Reading worst_libs timing library /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ulvl_ss0p75vn40c_i0p75v.lib.
**WARN: (TECHLIB-1161):	The library level attribute default_operating_conditions on line 3945 is defined after at least one cell definition. The attribute will be ignored. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ulvl_ss0p75vn40c_i0p75v.lib)
**WARN: (TECHLIB-1161):	The library level attribute default_wire_load on line 3946 is defined after at least one cell definition. The attribute will be ignored. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ulvl_ss0p75vn40c_i0p75v.lib)
**WARN: (TECHLIB-1161):	The library level attribute default_wire_load_selection on line 3947 is defined after at least one cell definition. The attribute will be ignored. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ulvl_ss0p75vn40c_i0p75v.lib)
Read 12 cells in library saed32rvt_ulvl_ss0p75vn40c_i0p75v.
Reading worst_libs timing library /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_dlvl_ss0p75vn40c_i0p75v.lib.
**WARN: (TECHLIB-1161):	The library level attribute default_operating_conditions on line 6569 is defined after at least one cell definition. The attribute will be ignored. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_dlvl_ss0p75vn40c_i0p75v.lib)
**WARN: (TECHLIB-1161):	The library level attribute default_wire_load on line 6570 is defined after at least one cell definition. The attribute will be ignored. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_dlvl_ss0p75vn40c_i0p75v.lib)
**WARN: (TECHLIB-1161):	The library level attribute default_wire_load_selection on line 6571 is defined after at least one cell definition. The attribute will be ignored. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_dlvl_ss0p75vn40c_i0p75v.lib)
Read 24 cells in library saed32rvt_dlvl_ss0p75vn40c_i0p75v.
Reading worst_libs timing library /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ss0p95vn40c.lib.
**WARN: (TECHLIB-1277):	The attribute 'fanout_load' has been defined for output pin 'D'. 'fanout_load' cannot be defined at this level and is being ignored. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ss0p95vn40c.lib, Line 84607)
**WARN: (TECHLIB-1277):	The attribute 'fanout_load' has been defined for output pin 'D'. 'fanout_load' cannot be defined at this level and is being ignored. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ss0p95vn40c.lib, Line 84658)
**WARN: (TECHLIB-1277):	The attribute 'fanout_load' has been defined for output pin 'D'. 'fanout_load' cannot be defined at this level and is being ignored. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ss0p95vn40c.lib, Line 84709)
**WARN: (TECHLIB-313):	Property 'fanout_load' can not be set on pin 'D' of cell 'NMT1_RVT' (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ss0p95vn40c.lib)
**WARN: (TECHLIB-313):	Property 'fanout_load' can not be set on pin 'D' of cell 'NMT2_RVT' (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ss0p95vn40c.lib)
**WARN: (TECHLIB-313):	Property 'fanout_load' can not be set on pin 'D' of cell 'NMT3_RVT' (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ss0p95vn40c.lib)
**WARN: (TECHLIB-302):	No function defined for cell 'PMT3_RVT'. The cell will only be used for analysis. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ss0p95vn40c.lib)
**WARN: (TECHLIB-302):	No function defined for cell 'PMT2_RVT'. The cell will only be used for analysis. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ss0p95vn40c.lib)
**WARN: (TECHLIB-302):	No function defined for cell 'PMT1_RVT'. The cell will only be used for analysis. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ss0p95vn40c.lib)
**WARN: (TECHLIB-302):	No function defined for cell 'NMT3_RVT'. The cell will only be used for analysis. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ss0p95vn40c.lib)
**WARN: (TECHLIB-302):	No function defined for cell 'NMT2_RVT'. The cell will only be used for analysis. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ss0p95vn40c.lib)
**WARN: (TECHLIB-302):	No function defined for cell 'NMT1_RVT'. The cell will only be used for analysis. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ss0p95vn40c.lib)
Read 294 cells in library saed32rvt_ss0p95vn40c.
Reading worst_libs timing library /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ulvl_ss0p95vn40c_i0p75v.lib.
**WARN: (TECHLIB-1161):	The library level attribute default_operating_conditions on line 3945 is defined after at least one cell definition. The attribute will be ignored. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ulvl_ss0p95vn40c_i0p75v.lib)
**WARN: (TECHLIB-1161):	The library level attribute default_wire_load on line 3946 is defined after at least one cell definition. The attribute will be ignored. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ulvl_ss0p95vn40c_i0p75v.lib)
**WARN: (TECHLIB-1161):	The library level attribute default_wire_load_selection on line 3947 is defined after at least one cell definition. The attribute will be ignored. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ulvl_ss0p95vn40c_i0p75v.lib)
Read 12 cells in library saed32rvt_ulvl_ss0p95vn40c_i0p75v.
Reading worst_libs timing library /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_ss0p75vn40c.lib.
**WARN: (TECHLIB-1277):	The attribute 'fanout_load' has been defined for output pin 'D'. 'fanout_load' cannot be defined at this level and is being ignored. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_ss0p75vn40c.lib, Line 84607)
**WARN: (TECHLIB-1277):	The attribute 'fanout_load' has been defined for output pin 'D'. 'fanout_load' cannot be defined at this level and is being ignored. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_ss0p75vn40c.lib, Line 84658)
**WARN: (TECHLIB-1277):	The attribute 'fanout_load' has been defined for output pin 'D'. 'fanout_load' cannot be defined at this level and is being ignored. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_ss0p75vn40c.lib, Line 84709)
**WARN: (TECHLIB-313):	Property 'fanout_load' can not be set on pin 'D' of cell 'NMT1_LVT' (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_ss0p75vn40c.lib)
**WARN: (TECHLIB-313):	Property 'fanout_load' can not be set on pin 'D' of cell 'NMT2_LVT' (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_ss0p75vn40c.lib)
**WARN: (TECHLIB-313):	Property 'fanout_load' can not be set on pin 'D' of cell 'NMT3_LVT' (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_ss0p75vn40c.lib)
**WARN: (TECHLIB-1277):	The attribute 'fanout_load' has been defined for output pin 'D'. 'fanout_load' cannot be defined at this level and is being ignored. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_ss0p75vn40c.lib, Line 120047)
**WARN: (TECHLIB-1277):	The attribute 'fanout_load' has been defined for output pin 'D'. 'fanout_load' cannot be defined at this level and is being ignored. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_ss0p75vn40c.lib, Line 120098)
**WARN: (TECHLIB-1277):	The attribute 'fanout_load' has been defined for output pin 'D'. 'fanout_load' cannot be defined at this level and is being ignored. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_ss0p75vn40c.lib, Line 120149)
**WARN: (TECHLIB-313):	Property 'fanout_load' can not be set on pin 'D' of cell 'PMT1_LVT' (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_ss0p75vn40c.lib)
**WARN: (TECHLIB-313):	Property 'fanout_load' can not be set on pin 'D' of cell 'PMT2_LVT' (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_ss0p75vn40c.lib)
**WARN: (TECHLIB-313):	Property 'fanout_load' can not be set on pin 'D' of cell 'PMT3_LVT' (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_ss0p75vn40c.lib)
**WARN: (TECHLIB-302):	No function defined for cell 'PMT3_LVT'. The cell will only be used for analysis. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_ss0p75vn40c.lib)
**WARN: (TECHLIB-302):	No function defined for cell 'PMT2_LVT'. The cell will only be used for analysis. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_ss0p75vn40c.lib)
**WARN: (TECHLIB-302):	No function defined for cell 'PMT1_LVT'. The cell will only be used for analysis. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_ss0p75vn40c.lib)
**WARN: (TECHLIB-302):	No function defined for cell 'NMT3_LVT'. The cell will only be used for analysis. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_ss0p75vn40c.lib)
**WARN: (TECHLIB-302):	No function defined for cell 'NMT2_LVT'. The cell will only be used for analysis. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_ss0p75vn40c.lib)
**WARN: (TECHLIB-302):	No function defined for cell 'NMT1_LVT'. The cell will only be used for analysis. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_ss0p75vn40c.lib)
Read 294 cells in library saed32lvt_ss0p75vn40c.
Reading worst_libs timing library /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_dlvl_ss0p75vn40c_i0p95v.lib.
**WARN: (TECHLIB-1161):	The library level attribute default_operating_conditions on line 6569 is defined after at least one cell definition. The attribute will be ignored. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_dlvl_ss0p75vn40c_i0p95v.lib)
**WARN: (TECHLIB-1161):	The library level attribute default_wire_load on line 6570 is defined after at least one cell definition. The attribute will be ignored. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_dlvl_ss0p75vn40c_i0p95v.lib)
**WARN: (TECHLIB-1161):	The library level attribute default_wire_load_selection on line 6571 is defined after at least one cell definition. The attribute will be ignored. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_dlvl_ss0p75vn40c_i0p95v.lib)
Read 24 cells in library saed32lvt_dlvl_ss0p75vn40c_i0p95v.
Reading worst_libs timing library /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_ulvl_ss0p75vn40c_i0p75v.lib.
**WARN: (TECHLIB-1161):	The library level attribute default_operating_conditions on line 3945 is defined after at least one cell definition. The attribute will be ignored. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_ulvl_ss0p75vn40c_i0p75v.lib)
**WARN: (TECHLIB-1161):	The library level attribute default_wire_load on line 3946 is defined after at least one cell definition. The attribute will be ignored. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_ulvl_ss0p75vn40c_i0p75v.lib)
**WARN: (TECHLIB-1161):	The library level attribute default_wire_load_selection on line 3947 is defined after at least one cell definition. The attribute will be ignored. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_ulvl_ss0p75vn40c_i0p75v.lib)
Read 12 cells in library saed32lvt_ulvl_ss0p75vn40c_i0p75v.
Reading worst_libs timing library /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_dlvl_ss0p75vn40c_i0p75v.lib.
Read 24 cells in library saed32lvt_dlvl_ss0p75vn40c_i0p75v.
Reading worst_libs timing library /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_ss0p95vn40c.lib.
**WARN: (TECHLIB-1277):	The attribute 'fanout_load' has been defined for output pin 'D'. 'fanout_load' cannot be defined at this level and is being ignored. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_ss0p95vn40c.lib, Line 84607)
**WARN: (TECHLIB-1277):	The attribute 'fanout_load' has been defined for output pin 'D'. 'fanout_load' cannot be defined at this level and is being ignored. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_ss0p95vn40c.lib, Line 84658)
**WARN: (TECHLIB-1277):	The attribute 'fanout_load' has been defined for output pin 'D'. 'fanout_load' cannot be defined at this level and is being ignored. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_ss0p95vn40c.lib, Line 84709)
**WARN: (TECHLIB-313):	Property 'fanout_load' can not be set on pin 'D' of cell 'NMT1_LVT' (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_ss0p95vn40c.lib)
**WARN: (TECHLIB-313):	Property 'fanout_load' can not be set on pin 'D' of cell 'NMT2_LVT' (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_ss0p95vn40c.lib)
**WARN: (TECHLIB-313):	Property 'fanout_load' can not be set on pin 'D' of cell 'NMT3_LVT' (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_ss0p95vn40c.lib)
**WARN: (TECHLIB-302):	No function defined for cell 'PMT3_LVT'. The cell will only be used for analysis. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_ss0p95vn40c.lib)
**WARN: (TECHLIB-302):	No function defined for cell 'PMT2_LVT'. The cell will only be used for analysis. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_ss0p95vn40c.lib)
Message <TECHLIB-302> has exceeded the message display limit of '20'. Use 'set_message -no_limit -id list_of_msgIDs' to reset the message limit.
Read 294 cells in library saed32lvt_ss0p95vn40c.
Reading worst_libs timing library /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_ulvl_ss0p95vn40c_i0p75v.lib.
**WARN: (TECHLIB-1161):	The library level attribute default_operating_conditions on line 3945 is defined after at least one cell definition. The attribute will be ignored. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_ulvl_ss0p95vn40c_i0p75v.lib)
**WARN: (TECHLIB-1161):	The library level attribute default_wire_load on line 3946 is defined after at least one cell definition. The attribute will be ignored. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_ulvl_ss0p95vn40c_i0p75v.lib)
Message <TECHLIB-1161> has exceeded the message display limit of '20'. Use 'set_message -no_limit -id list_of_msgIDs' to reset the message limit.
Read 12 cells in library saed32lvt_ulvl_ss0p95vn40c_i0p75v.
Reading worst_libs timing library /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_hvt/db_nldm/saed32hvt_ss0p75vn40c.lib.
**WARN: (TECHLIB-1277):	The attribute 'fanout_load' has been defined for output pin 'D'. 'fanout_load' cannot be defined at this level and is being ignored. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_hvt/db_nldm/saed32hvt_ss0p75vn40c.lib, Line 84713)
**WARN: (TECHLIB-1277):	The attribute 'fanout_load' has been defined for output pin 'D'. 'fanout_load' cannot be defined at this level and is being ignored. (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_hvt/db_nldm/saed32hvt_ss0p75vn40c.lib, Line 84764)
Message <TECHLIB-1277> has exceeded the message display limit of '20'. Use 'set_message -no_limit -id list_of_msgIDs' to reset the message limit.
**WARN: (TECHLIB-313):	Property 'fanout_load' can not be set on pin 'D' of cell 'NMT1_HVT' (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_hvt/db_nldm/saed32hvt_ss0p75vn40c.lib)
**WARN: (TECHLIB-313):	Property 'fanout_load' can not be set on pin 'D' of cell 'NMT2_HVT' (File /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_hvt/db_nldm/saed32hvt_ss0p75vn40c.lib)
Message <TECHLIB-313> has exceeded the message display limit of '20'. Use 'set_message -no_limit -id list_of_msgIDs' to reset the message limit.
Read 294 cells in library saed32hvt_ss0p75vn40c.
Reading worst_libs timing library /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_hvt/db_nldm/saed32hvt_dlvl_ss0p75vn40c_i0p95v.lib.
Read 24 cells in library saed32hvt_dlvl_ss0p75vn40c_i0p95v.
Reading worst_libs timing library /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_hvt/db_nldm/saed32hvt_ulvl_ss0p75vn40c_i0p75v.lib.
Read 12 cells in library saed32hvt_ulvl_ss0p75vn40c_i0p75v.
Reading worst_libs timing library /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_hvt/db_nldm/saed32hvt_dlvl_ss0p75vn40c_i0p75v.lib.
Read 24 cells in library saed32hvt_dlvl_ss0p75vn40c_i0p75v.
Reading worst_libs timing library /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_hvt/db_nldm/saed32hvt_ss0p95vn40c.lib.
Read 294 cells in library saed32hvt_ss0p95vn40c.
Reading worst_libs timing library /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_hvt/db_nldm/saed32hvt_ulvl_ss0p95vn40c_i0p75v.lib.
Read 12 cells in library saed32hvt_ulvl_ss0p95vn40c_i0p75v.
Reading worst_libs timing library /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/sram/db_nldm/saed32sram_ss0p95vn40c.lib.
Read 35 cells in library saed32sram_ss0p95vn40c.
Library reading multithread flow ended.
Starting library reading in 'Multi-threaded flow' (with '8' threads)
Reading best_libs timing library /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ff0p95vn40c.lib.
Read 294 cells in library saed32rvt_ff0p95vn40c.
Reading best_libs timing library /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_dlvl_ff0p95vn40c_i1p16v.lib.
Read 24 cells in library saed32rvt_dlvl_ff0p95vn40c_i1p16v.
Reading best_libs timing library /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ulvl_ff0p95vn40c_i0p95v.lib.
Read 12 cells in library saed32rvt_ulvl_ff0p95vn40c_i0p95v.
Reading best_libs timing library /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_dlvl_ff0p95vn40c_i0p95v.lib.
Read 24 cells in library saed32rvt_dlvl_ff0p95vn40c_i0p95v.
Reading best_libs timing library /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ff1p16vn40c.lib.
Read 294 cells in library saed32rvt_ff1p16vn40c.
Reading best_libs timing library /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ulvl_ff1p16vn40c_i1p16v.lib.
Read 12 cells in library saed32rvt_ulvl_ff1p16vn40c_i1p16v.
Reading best_libs timing library /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_dlvl_ff1p16vn40c_i1p16v.lib.
Read 24 cells in library saed32rvt_dlvl_ff1p16vn40c_i1p16v.
Reading best_libs timing library /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ulvl_ff1p16vn40c_i0p95v.lib.
Read 12 cells in library saed32rvt_ulvl_ff1p16vn40c_i0p95v.
Reading best_libs timing library /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_ff0p95vn40c.lib.
Read 294 cells in library saed32lvt_ff0p95vn40c.
Reading best_libs timing library /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_dlvl_ff0p95vn40c_i1p16v.lib.
Read 24 cells in library saed32lvt_dlvl_ff0p95vn40c_i1p16v.
Reading best_libs timing library /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_ulvl_ff0p95vn40c_i0p95v.lib.
Read 12 cells in library saed32lvt_ulvl_ff0p95vn40c_i0p95v.
Reading best_libs timing library /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_dlvl_ff0p95vn40c_i0p95v.lib.
Read 24 cells in library saed32lvt_dlvl_ff0p95vn40c_i0p95v.
Reading best_libs timing library /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_ff1p16vn40c.lib.
Read 294 cells in library saed32lvt_ff1p16vn40c.
Reading best_libs timing library /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_ulvl_ff1p16vn40c_i1p16v.lib.
Read 12 cells in library saed32lvt_ulvl_ff1p16vn40c_i1p16v.
Reading best_libs timing library /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_dlvl_ff1p16vn40c_i1p16v.lib.
Read 24 cells in library saed32lvt_dlvl_ff1p16vn40c_i1p16v.
Reading best_libs timing library /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_ulvl_ff1p16vn40c_i0p95v.lib.
Read 12 cells in library saed32lvt_ulvl_ff1p16vn40c_i0p95v.
Reading best_libs timing library /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_hvt/db_nldm/saed32hvt_ff0p95vn40c.lib.
Read 294 cells in library saed32hvt_ff0p95vn40c.
Reading best_libs timing library /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_hvt/db_nldm/saed32hvt_dlvl_ff0p95vn40c_i1p16v.lib.
Read 24 cells in library saed32hvt_dlvl_ff0p95vn40c_i1p16v.
Reading best_libs timing library /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_hvt/db_nldm/saed32hvt_ulvl_ff0p95vn40c_i0p95v.lib.
Read 12 cells in library saed32hvt_ulvl_ff0p95vn40c_i0p95v.
Reading best_libs timing library /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_hvt/db_nldm/saed32hvt_dlvl_ff0p95vn40c_i0p95v.lib.
Read 24 cells in library saed32hvt_dlvl_ff0p95vn40c_i0p95v.
Reading best_libs timing library /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_hvt/db_nldm/saed32hvt_ff1p16vn40c.lib.
Read 294 cells in library saed32hvt_ff1p16vn40c.
Reading best_libs timing library /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_hvt/db_nldm/saed32hvt_ulvl_ff1p16vn40c_i1p16v.lib.
Read 12 cells in library saed32hvt_ulvl_ff1p16vn40c_i1p16v.
Reading best_libs timing library /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_hvt/db_nldm/saed32hvt_dlvl_ff1p16vn40c_i1p16v.lib.
Read 24 cells in library saed32hvt_dlvl_ff1p16vn40c_i1p16v.
Reading best_libs timing library /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_hvt/db_nldm/saed32hvt_ulvl_ff1p16vn40c_i0p95v.lib.
Read 12 cells in library saed32hvt_ulvl_ff1p16vn40c_i0p95v.
Reading best_libs timing library /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/sram/db_nldm/saed32sram_ff1p16vn40c.lib.
Read 35 cells in library saed32sram_ff1p16vn40c.
Library reading multithread flow ended.
*** End library_loading (cpu=0.50min, real=0.15min, mem=149.0M, fe_cpu=1.46min, fe_real=3.02min, fe_mem=1937.6M) ***
#% Begin Load netlist data ... (date=06/12 01:48:39, mem=1616.3M)
*** Begin netlist parsing (mem=1937.6M) ***
Created 1025 new cells from 44 timing libraries.
Reading netlist ...
Backslashed names will retain backslash and a trailing blank character.
Reading verilog netlist '../../syn/outputs/ORCA_TOP.dct.vg'

*** Memory Usage v#2 (Current mem = 1937.566M, initial mem = 820.664M) ***
*** End netlist parsing (cpu=0:00:00.5, real=0:00:00.0, mem=1937.6M) ***
#% End Load netlist data ... (date=06/12 01:48:39, total cpu=0:00:00.6, real=0:00:00.0, peak res=1658.8M, current mem=1658.8M)
Set top cell to ORCA_TOP.
Hooked 4138 DB cells to tlib cells.
Starting recursive module instantiation check.
No recursion found.
Building hierarchical netlist for Cell ORCA_TOP ...
***** UseNewTieNetMode *****.
*** Netlist is unique.
** info: there are 4264 modules.
** info: there are 38947 stdCell insts.
** info: there are 404 insts with no signal pins.
** info: there are 40 macros.

*** Memory Usage v#2 (Current mem = 1984.480M, initial mem = 820.664M) ***
**WARN: (IMPFP-3961):	The techSite 'fillSite' has no related standard cells in the LEF/OA library. The calculations for this site type cannot be made unless standard cell models of this type exist in the LEF/OA library. Ignore this warning if the SITE is not used by the library. Alternatively, remove the SITE definition for the LEF/OA library to avoid this message.
Type 'man IMPFP-3961' for more detail.
**WARN: (IMPFP-3961):	The techSite 'cornerSite' has no related standard cells in the LEF/OA library. The calculations for this site type cannot be made unless standard cell models of this type exist in the LEF/OA library. Ignore this warning if the SITE is not used by the library. Alternatively, remove the SITE definition for the LEF/OA library to avoid this message.
Type 'man IMPFP-3961' for more detail.
**WARN: (IMPFP-3961):	The techSite 'ioSiteEW' has no related standard cells in the LEF/OA library. The calculations for this site type cannot be made unless standard cell models of this type exist in the LEF/OA library. Ignore this warning if the SITE is not used by the library. Alternatively, remove the SITE definition for the LEF/OA library to avoid this message.
Type 'man IMPFP-3961' for more detail.
**WARN: (IMPFP-3961):	The techSite 'ioSiteNS' has no related standard cells in the LEF/OA library. The calculations for this site type cannot be made unless standard cell models of this type exist in the LEF/OA library. Ignore this warning if the SITE is not used by the library. Alternatively, remove the SITE definition for the LEF/OA library to avoid this message.
Type 'man IMPFP-3961' for more detail.
Horizontal Layer M1 offset = 0 (derived)
Vertical Layer M2 offset = 0 (derived)
Start create_tracks
Generated pitch 0.228 in M9 is different from 2.432 defined in technology file in preferred direction.
Generated pitch 0.152 in M8 is different from 1.216 defined in technology file in preferred direction.
Generated pitch 0.152 in M7 is different from 1.216 defined in technology file in preferred direction.
Generated pitch 0.152 in M6 is different from 0.608 defined in technology file in preferred direction.
Generated pitch 0.152 in M5 is different from 0.608 defined in technology file in preferred direction.
Generated pitch 0.152 in M4 is different from 0.304 defined in technology file in preferred direction.
Generated pitch 0.152 in M3 is different from 0.304 defined in technology file in preferred direction.
Extraction setup Started for TopCell ORCA_TOP 
Initializing multi-corner RC extraction with 2 active RC Corners ...
Reading Capacitance Table File ../../cadence_cap_tech/saed32nm_1p9m_Cmax.cap ...
Process name: saed32nm_1p9m_Cmax.
Reading Capacitance Table File ../../cadence_cap_tech/saed32nm_1p9m_Cmin.cap ...
Process name: saed32nm_1p9m_Cmin.
Importing multi-corner RC tables ... 
Summary of Active RC-Corners : 
 
 Analysis View: test_worst_scenario
    RC-Corner Name        : cmax
    RC-Corner Index       : 0
    RC-Corner Temperature : -40 Celsius
    RC-Corner Cap Table   : '../../cadence_cap_tech/saed32nm_1p9m_Cmax.cap'
    RC-Corner PreRoute Res Factor         : 1
    RC-Corner PreRoute Cap Factor         : 1
    RC-Corner PostRoute Res Factor        : 1 {1 1 1}
    RC-Corner PostRoute Cap Factor        : 1 {1 1 1}
    RC-Corner PostRoute XCap Factor       : 1 {1 1 1}
    RC-Corner PreRoute Clock Res Factor   : 1	[Derived from postRoute_res (effortLevel low)]
    RC-Corner PreRoute Clock Cap Factor   : 1	[Derived from postRoute_cap (effortLevel low)]
    RC-Corner PostRoute Clock Cap Factor  : 1 {1 1 1} 	[Derived from postRoute_cap (effortLevel low)]
    RC-Corner PostRoute Clock Res Factor  : 1 {1 1 1} 	[Derived from postRoute_res (effortLevel low)]
    RC-Corner PostRoute Clock coupling capacitance Factor : 1 {1 1 1} 
 
 Analysis View: func_worst_scenario
    RC-Corner Name        : cmax
    RC-Corner Index       : 0
    RC-Corner Temperature : -40 Celsius
    RC-Corner Cap Table   : '../../cadence_cap_tech/saed32nm_1p9m_Cmax.cap'
    RC-Corner PreRoute Res Factor         : 1
    RC-Corner PreRoute Cap Factor         : 1
    RC-Corner PostRoute Res Factor        : 1 {1 1 1}
    RC-Corner PostRoute Cap Factor        : 1 {1 1 1}
    RC-Corner PostRoute XCap Factor       : 1 {1 1 1}
    RC-Corner PreRoute Clock Res Factor   : 1	[Derived from postRoute_res (effortLevel low)]
    RC-Corner PreRoute Clock Cap Factor   : 1	[Derived from postRoute_cap (effortLevel low)]
    RC-Corner PostRoute Clock Cap Factor  : 1 {1 1 1} 	[Derived from postRoute_cap (effortLevel low)]
    RC-Corner PostRoute Clock Res Factor  : 1 {1 1 1} 	[Derived from postRoute_res (effortLevel low)]
    RC-Corner PostRoute Clock coupling capacitance Factor : 1 {1 1 1} 
 
 Analysis View: test_best_scenario
    RC-Corner Name        : cmin
    RC-Corner Index       : 1
    RC-Corner Temperature : -40 Celsius
    RC-Corner Cap Table   : '../../cadence_cap_tech/saed32nm_1p9m_Cmin.cap'
    RC-Corner PreRoute Res Factor         : 1
    RC-Corner PreRoute Cap Factor         : 1
    RC-Corner PostRoute Res Factor        : 1 {1 1 1}
    RC-Corner PostRoute Cap Factor        : 1 {1 1 1}
    RC-Corner PostRoute XCap Factor       : 1 {1 1 1}
    RC-Corner PreRoute Clock Res Factor   : 1	[Derived from postRoute_res (effortLevel low)]
    RC-Corner PreRoute Clock Cap Factor   : 1	[Derived from postRoute_cap (effortLevel low)]
    RC-Corner PostRoute Clock Cap Factor  : 1 {1 1 1} 	[Derived from postRoute_cap (effortLevel low)]
    RC-Corner PostRoute Clock Res Factor  : 1 {1 1 1} 	[Derived from postRoute_res (effortLevel low)]
    RC-Corner PostRoute Clock coupling capacitance Factor : 1 {1 1 1} 
 
 Analysis View: func_best_scenario
    RC-Corner Name        : cmin
    RC-Corner Index       : 1
    RC-Corner Temperature : -40 Celsius
    RC-Corner Cap Table   : '../../cadence_cap_tech/saed32nm_1p9m_Cmin.cap'
    RC-Corner PreRoute Res Factor         : 1
    RC-Corner PreRoute Cap Factor         : 1
    RC-Corner PostRoute Res Factor        : 1 {1 1 1}
    RC-Corner PostRoute Cap Factor        : 1 {1 1 1}
    RC-Corner PostRoute XCap Factor       : 1 {1 1 1}
    RC-Corner PreRoute Clock Res Factor   : 1	[Derived from postRoute_res (effortLevel low)]
    RC-Corner PreRoute Clock Cap Factor   : 1	[Derived from postRoute_cap (effortLevel low)]
    RC-Corner PostRoute Clock Cap Factor  : 1 {1 1 1} 	[Derived from postRoute_cap (effortLevel low)]
    RC-Corner PostRoute Clock Res Factor  : 1 {1 1 1} 	[Derived from postRoute_res (effortLevel low)]
    RC-Corner PostRoute Clock coupling capacitance Factor : 1 {1 1 1} 
Updating RC Grid density data for preRoute extraction ...
Initializing multi-corner capacitance tables ... 
Initializing multi-corner resistance tables ...
*Info: initialize multi-corner CTS.
Multithreaded Timing Analysis is initialized with 8 threads

Reading timing constraints file '../../constraints/ORCA_TOP_func_best.sdc' ...
Current (total cpu=0:01:34, real=0:03:09, peak res=2231.2M, current mem=2225.7M)
**WARN: (TCLCMD-1461):	Skipped unsupported command: set_units (File ../../constraints/ORCA_TOP_func_best.sdc, Line 8).

**WARN: (TCLCMD-1142):	Virtual clock 'v_PCI_CLK' is being created with no source objects. (File ../../constraints/ORCA_TOP_func_best.sdc, Line 261).

**WARN: (TCLCMD-1142):	Virtual clock 'v_SDRAM_CLK' is being created with no source objects. (File ../../constraints/ORCA_TOP_func_best.sdc, Line 286).

**WARN: (TCLCMD-1333):	The combinational generated clock SD_DDR_CLK was specified without any of -divide_by, -multiply_by, or -edges options which are normally used to define the output waveform. A -divide_by 1 specification has been inferred for this clock. (File ../../constraints/ORCA_TOP_func_best.sdc, Line 289).

**WARN: (TCLCMD-1333):	The combinational generated clock SD_DDR_CLKn was specified without any of -divide_by, -multiply_by, or -edges options which are normally used to define the output waveform. A -divide_by 1 specification has been inferred for this clock. (File ../../constraints/ORCA_TOP_func_best.sdc, Line 292).

**WARN: (TCLCMD-1015):	The set_timing_derate command is not currently supported as a constraint which can be loaded as part of your SDC file. You can use the set_timing_Derate command interactively or in a Tcl command script. (File ../../constraints/ORCA_TOP_func_best.sdc, Line 786).

**WARN: (TCLCMD-1015):	The set_timing_derate command is not currently supported as a constraint which can be loaded as part of your SDC file. You can use the set_timing_Derate command interactively or in a Tcl command script. (File ../../constraints/ORCA_TOP_func_best.sdc, Line 787).

**ERROR: (DMMMC-271):	The software does not currently support the SDC set_voltage command. You should use operating conditions to control the default operating voltage and any power domain specific voltages.
**ERROR: (DMMMC-271):	The software does not currently support the SDC set_voltage command. You should use operating conditions to control the default operating voltage and any power domain specific voltages.
**ERROR: (DMMMC-271):	The software does not currently support the SDC set_voltage command. You should use operating conditions to control the default operating voltage and any power domain specific voltages.
INFO (CTE): Reading of timing constraints file ../../constraints/ORCA_TOP_func_best.sdc completed, with 7 WARNING
Ending "Constraint file reading stats" (total cpu=0:00:00.2, real=0:00:00.0, peak res=2243.9M, current mem=2241.9M)
Current (total cpu=0:01:34, real=0:03:09, peak res=2243.9M, current mem=2241.9M)
Reading timing constraints file '../../constraints/ORCA_TOP_test_best.sdc' ...
Current (total cpu=0:01:34, real=0:03:09, peak res=2243.9M, current mem=2241.9M)
**WARN: (TCLCMD-1461):	Skipped unsupported command: set_units (File ../../constraints/ORCA_TOP_test_best.sdc, Line 8).

**WARN: (TCLCMD-1142):	Virtual clock 'v_PCI_CLK' is being created with no source objects. (File ../../constraints/ORCA_TOP_test_best.sdc, Line 265).

**WARN: (TCLCMD-1142):	Virtual clock 'v_SDRAM_CLK' is being created with no source objects. (File ../../constraints/ORCA_TOP_test_best.sdc, Line 290).

**WARN: (TCLCMD-1333):	The combinational generated clock SD_DDR_CLK was specified without any of -divide_by, -multiply_by, or -edges options which are normally used to define the output waveform. A -divide_by 1 specification has been inferred for this clock. (File ../../constraints/ORCA_TOP_test_best.sdc, Line 293).

**WARN: (TCLCMD-1333):	The combinational generated clock SD_DDR_CLKn was specified without any of -divide_by, -multiply_by, or -edges options which are normally used to define the output waveform. A -divide_by 1 specification has been inferred for this clock. (File ../../constraints/ORCA_TOP_test_best.sdc, Line 296).

**WARN: (TCLCMD-1015):	The set_timing_derate command is not currently supported as a constraint which can be loaded as part of your SDC file. You can use the set_timing_Derate command interactively or in a Tcl command script. (File ../../constraints/ORCA_TOP_test_best.sdc, Line 822).

**WARN: (TCLCMD-1015):	The set_timing_derate command is not currently supported as a constraint which can be loaded as part of your SDC file. You can use the set_timing_Derate command interactively or in a Tcl command script. (File ../../constraints/ORCA_TOP_test_best.sdc, Line 823).

**ERROR: (DMMMC-271):	The software does not currently support the SDC set_voltage command. You should use operating conditions to control the default operating voltage and any power domain specific voltages.
**ERROR: (DMMMC-271):	The software does not currently support the SDC set_voltage command. You should use operating conditions to control the default operating voltage and any power domain specific voltages.
**ERROR: (DMMMC-271):	The software does not currently support the SDC set_voltage command. You should use operating conditions to control the default operating voltage and any power domain specific voltages.
INFO (CTE): Reading of timing constraints file ../../constraints/ORCA_TOP_test_best.sdc completed, with 7 WARNING
Ending "Constraint file reading stats" (total cpu=0:00:00.2, real=0:00:00.0, peak res=2264.6M, current mem=2264.6M)
Current (total cpu=0:01:34, real=0:03:09, peak res=2264.6M, current mem=2264.6M)
Reading timing constraints file '../../constraints/ORCA_TOP_func_worst.sdc' ...
Current (total cpu=0:01:34, real=0:03:10, peak res=2264.6M, current mem=2264.6M)
**WARN: (TCLCMD-1142):	Virtual clock 'v_PCI_CLK' is being created with no source objects. (File ../../constraints/ORCA_TOP_func_worst.sdc, Line 263).

**WARN: (TCLCMD-1142):	Virtual clock 'v_SDRAM_CLK' is being created with no source objects. (File ../../constraints/ORCA_TOP_func_worst.sdc, Line 288).

**WARN: (TCLCMD-1333):	The combinational generated clock SD_DDR_CLK was specified without any of -divide_by, -multiply_by, or -edges options which are normally used to define the output waveform. A -divide_by 1 specification has been inferred for this clock. (File ../../constraints/ORCA_TOP_func_worst.sdc, Line 291).

**WARN: (TCLCMD-1333):	The combinational generated clock SD_DDR_CLKn was specified without any of -divide_by, -multiply_by, or -edges options which are normally used to define the output waveform. A -divide_by 1 specification has been inferred for this clock. (File ../../constraints/ORCA_TOP_func_worst.sdc, Line 298).

INFO (CTE): Reading of timing constraints file ../../constraints/ORCA_TOP_func_worst.sdc completed, with 4 WARNING
Ending "Constraint file reading stats" (total cpu=0:00:00.1, real=0:00:00.0, peak res=2265.3M, current mem=2265.3M)
Current (total cpu=0:01:35, real=0:03:10, peak res=2265.3M, current mem=2265.3M)
Reading timing constraints file '../../constraints/ORCA_TOP_test_worst.sdc' ...
Current (total cpu=0:01:35, real=0:03:10, peak res=2265.3M, current mem=2265.3M)
**WARN: (TCLCMD-1461):	Skipped unsupported command: set_units (File ../../constraints/ORCA_TOP_test_worst.sdc, Line 8).

**WARN: (TCLCMD-1014):	The SDC set_operating_conditions assertion is not supported. Please use the create_delay_corner command to specify the desired operating enviroment. Use the setAnalysisMode command to control single vs. bestCase/worstCase vs. on-chip variation timing analysis. (File ../../constraints/ORCA_TOP_test_worst.sdc, Line 9).

**WARN: (TCLCMD-1142):	Virtual clock 'v_PCI_CLK' is being created with no source objects. (File ../../constraints/ORCA_TOP_test_worst.sdc, Line 266).

**WARN: (TCLCMD-1142):	Virtual clock 'v_SDRAM_CLK' is being created with no source objects. (File ../../constraints/ORCA_TOP_test_worst.sdc, Line 291).

**WARN: (TCLCMD-1333):	The combinational generated clock SD_DDR_CLK was specified without any of -divide_by, -multiply_by, or -edges options which are normally used to define the output waveform. A -divide_by 1 specification has been inferred for this clock. (File ../../constraints/ORCA_TOP_test_worst.sdc, Line 294).

**WARN: (TCLCMD-1333):	The combinational generated clock SD_DDR_CLKn was specified without any of -divide_by, -multiply_by, or -edges options which are normally used to define the output waveform. A -divide_by 1 specification has been inferred for this clock. (File ../../constraints/ORCA_TOP_test_worst.sdc, Line 301).

**WARN: (TCLCMD-1015):	The set_timing_derate command is not currently supported as a constraint which can be loaded as part of your SDC file. You can use the set_timing_Derate command interactively or in a Tcl command script. (File ../../constraints/ORCA_TOP_test_worst.sdc, Line 831).

**WARN: (TCLCMD-1015):	The set_timing_derate command is not currently supported as a constraint which can be loaded as part of your SDC file. You can use the set_timing_Derate command interactively or in a Tcl command script. (File ../../constraints/ORCA_TOP_test_worst.sdc, Line 832).

**ERROR: (DMMMC-271):	The software does not currently support the SDC set_voltage command. You should use operating conditions to control the default operating voltage and any power domain specific voltages.
**ERROR: (DMMMC-271):	The software does not currently support the SDC set_voltage command. You should use operating conditions to control the default operating voltage and any power domain specific voltages.
**ERROR: (DMMMC-271):	The software does not currently support the SDC set_voltage command. You should use operating conditions to control the default operating voltage and any power domain specific voltages.
INFO (CTE): Reading of timing constraints file ../../constraints/ORCA_TOP_test_worst.sdc completed, with 8 WARNING
Ending "Constraint file reading stats" (total cpu=0:00:00.1, real=0:00:00.0, peak res=2265.7M, current mem=2265.7M)
Current (total cpu=0:01:35, real=0:03:10, peak res=2265.7M, current mem=2265.7M)
Total number of combinational cells: 375
Total number of sequential cells: 396
Total number of tristate cells: 18
Total number of level shifter cells: 108
Total number of power gating cells: 0
Total number of isolation cells: 48
Total number of power switch cells: 0
Total number of pulse generator cells: 0
Total number of always on buffers: 0
Total number of retention cells: 0
Total number of physical cells: 27
List of usable buffers: NBUFFX2_LVT NBUFFX16_LVT NBUFFX32_LVT NBUFFX4_LVT NBUFFX8_LVT
Total number of usable buffers: 5
List of unusable buffers:
Total number of unusable buffers: 0
List of usable inverters: IBUFFX2_HVT IBUFFX16_HVT IBUFFX32_HVT INVX0_HVT IBUFFX4_HVT IBUFFX8_HVT INVX16_HVT INVX1_HVT INVX2_HVT INVX32_HVT INVX4_HVT IBUFFX2_LVT INVX8_HVT IBUFFX16_LVT IBUFFX32_LVT INVX0_LVT IBUFFX4_LVT IBUFFX8_LVT INVX16_LVT INVX1_LVT INVX2_LVT INVX32_LVT INVX4_LVT IBUFFX2_RVT INVX8_LVT IBUFFX16_RVT IBUFFX32_RVT INVX0_RVT IBUFFX4_RVT IBUFFX8_RVT INVX16_RVT INVX1_RVT INVX2_RVT INVX32_RVT INVX4_RVT INVX8_RVT
Total number of usable inverters: 36
List of unusable inverters:
Total number of unusable inverters: 0
List of identified usable delay cells: DELLN1X2_HVT DELLN2X2_HVT DELLN3X2_HVT NBUFFX2_HVT NBUFFX16_HVT NBUFFX32_HVT NBUFFX4_HVT NBUFFX8_HVT DELLN1X2_LVT DELLN2X2_LVT DELLN3X2_LVT DELLN1X2_RVT DELLN2X2_RVT DELLN3X2_RVT NBUFFX2_RVT NBUFFX16_RVT NBUFFX32_RVT NBUFFX4_RVT NBUFFX8_RVT
Total number of identified usable delay cells: 19
List of identified unusable delay cells:
Total number of identified unusable delay cells: 0

*** Summary of all messages that are not suppressed in this session:
Severity  ID               Count  Summary                                  
WARNING   IMPFP-3961           4  The techSite '%s' has no related standar...
ERROR     DMMMC-271            9  The software does not currently support ...
WARNING   TCLCMD-1014          1  The SDC set_operating_conditions asserti...
WARNING   TCLCMD-1015          6  The %s command is not currently supporte...
WARNING   TCLCMD-1142          8  Virtual clock '%s' is being created with...
WARNING   TCLCMD-1333          8  The combinational generated clock %s was...
WARNING   TCLCMD-1461          3  Skipped unsupported command: %s          
WARNING   TECHLIB-302         72  No function defined for cell '%s'. The c...
WARNING   TECHLIB-313         72  Property '%s' can not be set on pin '%s'...
WARNING   TECHLIB-1161       132  The library level attribute %s on line %...
WARNING   TECHLIB-1277        72  The %s '%s' has been defined for %s %s '...
*** Message Summary: 378 warning(s), 9 error(s)

Reading DEF file '../outputs/ORCA_TOP.floorplan.innovus.macros_3B.def', current time is Wed Jun 12 01:48:48 2024 ...
--- DIVIDERCHAR '/'
--- UnitsPerDBU = 1.0000
**WARN: (IMPFP-3961):	The techSite 'fillSite' has no related standard cells in the LEF/OA library. The calculations for this site type cannot be made unless standard cell models of this type exist in the LEF/OA library. Ignore this warning if the SITE is not used by the library. Alternatively, remove the SITE definition for the LEF/OA library to avoid this message.
Type 'man IMPFP-3961' for more detail.
**WARN: (IMPFP-3961):	The techSite 'cornerSite' has no related standard cells in the LEF/OA library. The calculations for this site type cannot be made unless standard cell models of this type exist in the LEF/OA library. Ignore this warning if the SITE is not used by the library. Alternatively, remove the SITE definition for the LEF/OA library to avoid this message.
Type 'man IMPFP-3961' for more detail.
**WARN: (IMPFP-3961):	The techSite 'ioSiteEW' has no related standard cells in the LEF/OA library. The calculations for this site type cannot be made unless standard cell models of this type exist in the LEF/OA library. Ignore this warning if the SITE is not used by the library. Alternatively, remove the SITE definition for the LEF/OA library to avoid this message.
Type 'man IMPFP-3961' for more detail.
**WARN: (IMPFP-3961):	The techSite 'ioSiteNS' has no related standard cells in the LEF/OA library. The calculations for this site type cannot be made unless standard cell models of this type exist in the LEF/OA library. Ignore this warning if the SITE is not used by the library. Alternatively, remove the SITE definition for the LEF/OA library to avoid this message.
Type 'man IMPFP-3961' for more detail.
Horizontal Layer M1 offset = 0 (derived)
Vertical Layer M2 offset = 0 (derived)
Start create_tracks
Generated pitch 0.228 in M9 is different from 2.432 defined in technology file in preferred direction.
Generated pitch 0.152 in M8 is different from 1.216 defined in technology file in preferred direction.
Generated pitch 0.152 in M7 is different from 1.216 defined in technology file in preferred direction.
Generated pitch 0.152 in M6 is different from 0.608 defined in technology file in preferred direction.
Generated pitch 0.152 in M5 is different from 0.608 defined in technology file in preferred direction.
Generated pitch 0.152 in M4 is different from 0.304 defined in technology file in preferred direction.
Generated pitch 0.152 in M3 is different from 0.304 defined in technology file in preferred direction.
--- DIEAREA (0 0) (982528 593712)
**WARN: (IMPDF-247):	Net 'VSS' specified in Pin 'pad_en' is inconsistent with netlist.
**WARN: (IMPDF-247):	Net 'VSS' specified in Pin 'ppar_out' is inconsistent with netlist.
**WARN: (IMPDF-247):	Net 'VSS' specified in Pin 'ppar_en' is inconsistent with netlist.
**WARN: (IMPDF-247):	Net 'VSS' specified in Pin 'pc_be_out[3]' is inconsistent with netlist.
**WARN: (IMPDF-247):	Net 'VSS' specified in Pin 'pc_be_out[2]' is inconsistent with netlist.
**WARN: (IMPDF-247):	Net 'VSS' specified in Pin 'pc_be_out[1]' is inconsistent with netlist.
**WARN: (IMPDF-247):	Net 'VSS' specified in Pin 'pc_be_out[0]' is inconsistent with netlist.
**WARN: (IMPDF-247):	Net 'VSS' specified in Pin 'pc_be_en' is inconsistent with netlist.
**WARN: (IMPDF-247):	Net 'VSS' specified in Pin 'pframe_n_out' is inconsistent with netlist.
**WARN: (IMPDF-247):	Net 'VSS' specified in Pin 'pframe_n_en' is inconsistent with netlist.
**WARN: (IMPDF-247):	Net 'VSS' specified in Pin 'ptrdy_n_out' is inconsistent with netlist.
**WARN: (IMPDF-247):	Net 'VSS' specified in Pin 'ptrdy_n_en' is inconsistent with netlist.
**WARN: (IMPDF-247):	Net 'VSS' specified in Pin 'pirdy_n_out' is inconsistent with netlist.
**WARN: (IMPDF-247):	Net 'VSS' specified in Pin 'pirdy_n_en' is inconsistent with netlist.
**WARN: (IMPDF-247):	Net 'VSS' specified in Pin 'pdevsel_n_out' is inconsistent with netlist.
**WARN: (IMPDF-247):	Net 'VSS' specified in Pin 'pdevsel_n_en' is inconsistent with netlist.
**WARN: (IMPDF-247):	Net 'VSS' specified in Pin 'pstop_n_out' is inconsistent with netlist.
**WARN: (IMPDF-247):	Net 'VSS' specified in Pin 'pstop_n_en' is inconsistent with netlist.
**WARN: (IMPDF-247):	Net 'VSS' specified in Pin 'pperr_n_out' is inconsistent with netlist.
**WARN: (IMPDF-247):	Net 'VSS' specified in Pin 'pperr_n_en' is inconsistent with netlist.
**WARN: (EMS-27):	Message (IMPDF-247) has exceeded the current message display limit of 20.
To increase the message display limit, refer to the product command reference manual.
**WARN: (IMPDF-141):	Linking placement blockage with component 'I_PCI_TOP/I_PCI_READ_FIFO_PCI_FIFO_RAM_8' is only supported by defIn/defOut, but not other applications.
**WARN: (IMPDF-141):	Linking placement blockage with component 'I_PCI_TOP/I_PCI_READ_FIFO_PCI_FIFO_RAM_8' is only supported by defIn/defOut, but not other applications.
**WARN: (IMPDF-141):	Linking placement blockage with component 'I_PCI_TOP/I_PCI_READ_FIFO_PCI_FIFO_RAM_8' is only supported by defIn/defOut, but not other applications.
**WARN: (IMPDF-141):	Linking placement blockage with component 'I_PCI_TOP/I_PCI_READ_FIFO_PCI_FIFO_RAM_8' is only supported by defIn/defOut, but not other applications.
**WARN: (IMPDF-141):	Linking placement blockage with component 'I_PCI_TOP/I_PCI_READ_FIFO_PCI_FIFO_RAM_7' is only supported by defIn/defOut, but not other applications.
**WARN: (IMPDF-141):	Linking placement blockage with component 'I_PCI_TOP/I_PCI_READ_FIFO_PCI_FIFO_RAM_7' is only supported by defIn/defOut, but not other applications.
**WARN: (IMPDF-141):	Linking placement blockage with component 'I_PCI_TOP/I_PCI_READ_FIFO_PCI_FIFO_RAM_7' is only supported by defIn/defOut, but not other applications.
**WARN: (IMPDF-141):	Linking placement blockage with component 'I_PCI_TOP/I_PCI_READ_FIFO_PCI_FIFO_RAM_7' is only supported by defIn/defOut, but not other applications.
**WARN: (IMPDF-141):	Linking placement blockage with component 'I_PCI_TOP/I_PCI_READ_FIFO_PCI_FIFO_RAM_6' is only supported by defIn/defOut, but not other applications.
**WARN: (IMPDF-141):	Linking placement blockage with component 'I_PCI_TOP/I_PCI_READ_FIFO_PCI_FIFO_RAM_6' is only supported by defIn/defOut, but not other applications.
**WARN: (IMPDF-141):	Linking placement blockage with component 'I_PCI_TOP/I_PCI_READ_FIFO_PCI_FIFO_RAM_6' is only supported by defIn/defOut, but not other applications.
**WARN: (IMPDF-141):	Linking placement blockage with component 'I_PCI_TOP/I_PCI_READ_FIFO_PCI_FIFO_RAM_6' is only supported by defIn/defOut, but not other applications.
**WARN: (IMPDF-141):	Linking placement blockage with component 'I_PCI_TOP/I_PCI_READ_FIFO_PCI_FIFO_RAM_5' is only supported by defIn/defOut, but not other applications.
**WARN: (IMPDF-141):	Linking placement blockage with component 'I_PCI_TOP/I_PCI_READ_FIFO_PCI_FIFO_RAM_5' is only supported by defIn/defOut, but not other applications.
**WARN: (IMPDF-141):	Linking placement blockage with component 'I_PCI_TOP/I_PCI_READ_FIFO_PCI_FIFO_RAM_5' is only supported by defIn/defOut, but not other applications.
**WARN: (IMPDF-141):	Linking placement blockage with component 'I_PCI_TOP/I_PCI_READ_FIFO_PCI_FIFO_RAM_5' is only supported by defIn/defOut, but not other applications.
**WARN: (IMPDF-141):	Linking placement blockage with component 'I_PCI_TOP/I_PCI_READ_FIFO_PCI_FIFO_RAM_4' is only supported by defIn/defOut, but not other applications.
**WARN: (IMPDF-141):	Linking placement blockage with component 'I_PCI_TOP/I_PCI_READ_FIFO_PCI_FIFO_RAM_4' is only supported by defIn/defOut, but not other applications.
**WARN: (IMPDF-141):	Linking placement blockage with component 'I_PCI_TOP/I_PCI_READ_FIFO_PCI_FIFO_RAM_4' is only supported by defIn/defOut, but not other applications.
**WARN: (IMPDF-141):	Linking placement blockage with component 'I_PCI_TOP/I_PCI_READ_FIFO_PCI_FIFO_RAM_4' is only supported by defIn/defOut, but not other applications.
**WARN: (EMS-27):	Message (IMPDF-141) has exceeded the current message display limit of 20.
To increase the message display limit, refer to the product command reference manual.
DEF file '../outputs/ORCA_TOP.floorplan.innovus.macros_3B.def' is parsed, current time is Wed Jun 12 01:48:49 2024.
Updating the floorplan ...
Start create_tracks
Generated pitch 2.432 in MRDL is different from previous one 0.228 in unpreferred direction.
Generated pitch 1.216 in M9 is different from previous one 0.152 in unpreferred direction.
Generated pitch 2.432 in M9 is different from previous one 0.228 in preferred direction.
Generated pitch 1.216 in M8 is different from previous one 0.152 in unpreferred direction.
Generated pitch 1.216 in M8 is different from previous one 0.152 in preferred direction.
Generated pitch 0.608 in M7 is different from previous one 0.152 in unpreferred direction.
Generated pitch 1.216 in M7 is different from previous one 0.152 in preferred direction.
Generated pitch 0.608 in M6 is different from previous one 0.152 in unpreferred direction.
Generated pitch 0.608 in M6 is different from previous one 0.152 in preferred direction.
Generated pitch 0.304 in M5 is different from previous one 0.152 in unpreferred direction.
Generated pitch 0.608 in M5 is different from previous one 0.152 in preferred direction.
Generated pitch 0.304 in M4 is different from previous one 0.152 in unpreferred direction.
Generated pitch 0.304 in M4 is different from previous one 0.152 in preferred direction.
Generated pitch 0.304 in M3 is different from previous one 0.152 in preferred direction.
READING SCANDEF
Reading DEF file '/u/nmallebo/ECE530-2024-SPRING/finalprj-group4/syn/outputs/ORCA_TOP.dct.scan.def', current time is Wed Jun 12 01:48:49 2024 ...
--- CASESENSITIVE ON
--- DIVIDERCHAR '/'
DEF file '/u/nmallebo/ECE530-2024-SPRING/finalprj-group4/syn/outputs/ORCA_TOP.dct.scan.def' is parsed, current time is Wed Jun 12 01:48:49 2024.
FINISHED READING SCANDEF
Reading power intent file ../../syn/outputs/ORCA_TOP.dct.upf ...
Checking power intent
Checking scoped supply_net connected to top-level supply_net
IEEE1801_RUNTIME: checking scoped supply_net: cpu=0:00:00.01 real=0:00:00.00
Checking supply_set/supply_net
IEEE1801_RUNTIME: checking pst supplies: cpu=0:00:00.00 real=0:00:00.00
Setting boundaryports(3) from port_attr
IEEE1801_RUNTIME: checking port_attribute: cpu=0:00:00.00 real=0:00:00.00
IEEE1801_RUNTIME: checking related_supply_net: cpu=0:00:00.00 real=0:00:00.00
IEEE1801_RUNTIME: freeTimingGraph: cpu=0:00:00.55 real=0:00:01.00
IEEE1801_RUNTIME: commit_logic_port/net: cpu=0:00:00.01 real=0:00:00.00
IEEE1801_RUNTIME: commit_supply_net: cpu=0:00:00.00 real=0:00:00.00
IEEE1801_RUNTIME: commit_power_domain: cpu=0:00:00.08 real=0:00:00.00
IEEE1801_RUNTIME: commit_global_connect: cpu=0:00:00.04 real=0:00:00.00
IEEE1801_RUNTIME: commit_power_mode: cpu=0:00:00.00 real=0:00:00.00
IEEE1801_RUNTIME: define_low_power_cells: cpu=0:00:00.12 real=0:00:00.00
IEEE1801_RUNTIME: GNC_connect_existing_iso_shifter: cpu=0:00:00.50 real=0:00:01.00
IEEE1801_RUNTIME: connectAlwaysOnBuf: cpu=0:00:00.00 real=0:00:00.00
IEEE1801_RUNTIME: replaceAlwaysOnAssignBuffer: cpu=0:00:00.00 real=0:00:00.00
number of pgNets = 3
IEEE1801_RUNTIME: commit_power_switch: cpu=0:00:00.00 real=0:00:00.00
IEEE1801_RUNTIME: commit_retention: cpu=0:00:00.00 real=0:00:00.00
IEEE1801_RUNTIME: commit_isolation: cpu=0:00:00.00 real=0:00:00.00
INFO: level_shifter strategy ls_out: added 62 level_shifter insts
INFO: level_shifter strategy ls_in: added 36 level_shifter insts
IEEE1801_RUNTIME: commit_level_shifter: cpu=0:00:00.05 real=0:00:00.00
Current (total cpu=0:01:38, real=0:03:13, peak res=2318.2M, current mem=2298.4M)
**ERROR: (DMMMC-271):	The software does not currently support the SDC set_voltage command. You should use operating conditions to control the default operating voltage and any power domain specific voltages.
**ERROR: (DMMMC-271):	The software does not currently support the SDC set_voltage command. You should use operating conditions to control the default operating voltage and any power domain specific voltages.
**ERROR: (DMMMC-271):	The software does not currently support the SDC set_voltage command. You should use operating conditions to control the default operating voltage and any power domain specific voltages.
Ending "Constraint file reading stats" (total cpu=0:00:00.2, real=0:00:00.0, peak res=2313.5M, current mem=2313.5M)
Current (total cpu=0:01:38, real=0:03:14, peak res=2318.2M, current mem=2313.5M)
Current (total cpu=0:01:38, real=0:03:14, peak res=2318.2M, current mem=2313.5M)
**ERROR: (DMMMC-271):	The software does not currently support the SDC set_voltage command. You should use operating conditions to control the default operating voltage and any power domain specific voltages.
**ERROR: (DMMMC-271):	The software does not currently support the SDC set_voltage command. You should use operating conditions to control the default operating voltage and any power domain specific voltages.
**ERROR: (DMMMC-271):	The software does not currently support the SDC set_voltage command. You should use operating conditions to control the default operating voltage and any power domain specific voltages.
Ending "Constraint file reading stats" (total cpu=0:00:00.1, real=0:00:00.0, peak res=2316.3M, current mem=2316.3M)
Current (total cpu=0:01:38, real=0:03:14, peak res=2318.2M, current mem=2316.3M)
Current (total cpu=0:01:39, real=0:03:14, peak res=2318.2M, current mem=2316.3M)
Ending "Constraint file reading stats" (total cpu=0:00:00.1, real=0:00:00.0, peak res=2316.7M, current mem=2316.7M)
Current (total cpu=0:01:39, real=0:03:14, peak res=2318.2M, current mem=2316.7M)
Current (total cpu=0:01:39, real=0:03:14, peak res=2318.2M, current mem=2316.7M)
**ERROR: (DMMMC-271):	The software does not currently support the SDC set_voltage command. You should use operating conditions to control the default operating voltage and any power domain specific voltages.
**ERROR: (DMMMC-271):	The software does not currently support the SDC set_voltage command. You should use operating conditions to control the default operating voltage and any power domain specific voltages.
**ERROR: (DMMMC-271):	The software does not currently support the SDC set_voltage command. You should use operating conditions to control the default operating voltage and any power domain specific voltages.
Ending "Constraint file reading stats" (total cpu=0:00:00.1, real=0:00:00.0, peak res=2317.4M, current mem=2317.4M)
Current (total cpu=0:01:39, real=0:03:14, peak res=2318.2M, current mem=2317.4M)
IEEE1801_RUNTIME: buildTimingGraph: cpu=0:00:01.92 real=0:00:02.00
IEEE1801_RUNTIME: connectAlwaysOnBuf: cpu=0:00:00.00 real=0:00:00.00
IEEE1801_RUNTIME: misc: cpu=0:00:00.00 real=0:00:00.00
IEEE1801_RUNTIME: update_pd_libset_by_voltages: cpu=0:00:00.00 real=0:00:00.00
IEEE1801_RUNTIME: setDenseRecIsoInstToDB: cpu=0:00:00.01 real=0:00:00.00
Total number of combinational cells: 357
Total number of sequential cells: 204
Total number of tristate cells: 18
Total number of level shifter cells: 108
Total number of power gating cells: 0
Total number of isolation cells: 48
Total number of power switch cells: 0
Total number of pulse generator cells: 0
Total number of always on buffers: 30
Total number of retention cells: 180
Total number of physical cells: 27
List of usable buffers: NBUFFX2_LVT NBUFFX16_LVT NBUFFX32_LVT NBUFFX4_LVT NBUFFX8_LVT
Total number of usable buffers: 5
List of unusable buffers:
Total number of unusable buffers: 0
List of usable inverters: IBUFFX2_HVT IBUFFX16_HVT IBUFFX32_HVT INVX0_HVT IBUFFX4_HVT IBUFFX8_HVT INVX16_HVT INVX1_HVT INVX2_HVT INVX32_HVT INVX4_HVT IBUFFX2_LVT INVX8_HVT IBUFFX16_LVT IBUFFX32_LVT INVX0_LVT IBUFFX4_LVT IBUFFX8_LVT INVX16_LVT INVX1_LVT INVX2_LVT INVX32_LVT INVX4_LVT IBUFFX2_RVT INVX8_LVT IBUFFX16_RVT IBUFFX32_RVT INVX0_RVT IBUFFX4_RVT IBUFFX8_RVT INVX16_RVT INVX1_RVT INVX2_RVT INVX32_RVT INVX4_RVT INVX8_RVT
Total number of usable inverters: 36
List of unusable inverters:
Total number of unusable inverters: 0
List of identified usable delay cells: DELLN1X2_HVT DELLN2X2_HVT DELLN3X2_HVT NBUFFX2_HVT NBUFFX16_HVT NBUFFX32_HVT NBUFFX4_HVT NBUFFX8_HVT DELLN1X2_LVT DELLN2X2_LVT DELLN3X2_LVT DELLN1X2_RVT DELLN2X2_RVT DELLN3X2_RVT NBUFFX2_RVT NBUFFX16_RVT NBUFFX32_RVT NBUFFX4_RVT NBUFFX8_RVT
Total number of identified usable delay cells: 19
List of identified unusable delay cells:
Total number of identified unusable delay cells: 0
number of pgNets = 3
**WARN: (IMPMSMV-4010):	The '-box' parameter of the 'modifypowerdomainattr' command is obsolete and will be removed in a future release. Use 'setObjFPlanBox Group <domain_name>' instead.
Type 'man IMPMSMV-4010' for more detail.
Power Domain 'PD_RISC_CORE'.
	  Boundary = 10.0320 10.0320 420.0320 185.0320
	   minGaps = T:0.0560 B:0.0560 L:0.0560 R:0.0560
	   rsExts  = T:0.0000 B:0.0000 L:0.0000 R:0.0000
	   core2Side = T:0.0000 B:0.0000 L:0.0000 R:0.0000
	   rowSpaceType = 0
	   rowSpacing = 0.0000
	   rowFlip = first (fplan:auto)
	   site = unit
**WARN: (TCLCMD-1461):	Skipped unsupported command: set_units
**WARN: (IMPOPT-3593):	The cell DELLN is not defined in any library file. If you wish to use this cell please ensure a timing library file defining this cell is bound to each timing analysis-view.
Type 'man IMPOPT-3593' for more detail.
Created reg2reg path group
Effort level <high> specified for reg2reg path_group
Created reg2cgate path group
Effort level <high> specified for reg2cgate path_group
#% Begin save design ... (date=06/12 01:48:57, mem=2356.2M)
INFO: Current data have to be saved into a temporary db: 'ORCA_TOP_floorplan.innovus.dat.tmp' first. It will be renamed to the correct name 'ORCA_TOP_floorplan.innovus.dat' after the old db was deleted.
% Begin Save ccopt configuration ... (date=06/12 01:48:57, mem=2356.2M)
% End Save ccopt configuration ... (date=06/12 01:48:57, total cpu=0:00:00.1, real=0:00:00.0, peak res=2357.9M, current mem=2357.9M)
% Begin Save netlist data ... (date=06/12 01:48:57, mem=2357.9M)
Writing Binary DB to ORCA_TOP_floorplan.innovus.dat.tmp/vbin/ORCA_TOP.v.bin in multi-threaded mode...
% End Save netlist data ... (date=06/12 01:48:57, total cpu=0:00:00.3, real=0:00:00.0, peak res=2360.0M, current mem=2360.0M)
Saving symbol-table file in separate thread ...
Saving congestion map file in separate thread ...
Saving congestion map file ORCA_TOP_floorplan.innovus.dat.tmp/ORCA_TOP.route.congmap.gz ...
% Begin Save AAE data ... (date=06/12 01:48:57, mem=2361.8M)
Saving AAE Data ...
% End Save AAE data ... (date=06/12 01:48:57, total cpu=0:00:00.1, real=0:00:00.0, peak res=2385.7M, current mem=2361.9M)
Saving preference file ORCA_TOP_floorplan.innovus.dat.tmp/gui.pref.tcl ...
Saving mode setting ...
Saving global file ...
*info - save blackBox cells to lef file ORCA_TOP_floorplan.innovus.dat.tmp/ORCA_TOP.bbox.lef
Saving Drc markers ...
... No Drc file written since there is no markers found.
Saving SCANDEF file ...
**WARN: (IMPSC-1020):	Instance's output pin "snps_clk_chain_1/U2/Y" (Cell "AO22X1_RVT") has multiple corresponding input pins for scan tracing. Please specify the instance in scan DEF.  You can also apply "setScanReorderMode -compLogic true" to trace through the chain but it could be not exactly the chain that user needed.
**WARN: (IMPSC-1001):	Unable to trace scan chain "5". Check the information during tracing.
Type 'man IMPSC-1001' for more detail.
**WARN: (IMPSC-1020):	Instance's output pin "I_CLOCKING/snps_clk_chain_0/U2/Y" (Cell "AO22X1_RVT") has multiple corresponding input pins for scan tracing. Please specify the instance in scan DEF.  You can also apply "setScanReorderMode -compLogic true" to trace through the chain but it could be not exactly the chain that user needed.
**WARN: (IMPSC-1001):	Unable to trace scan chain "6". Check the information during tracing.
Type 'man IMPSC-1001' for more detail.
*** Scan Trace Summary (runtime: cpu: 0:00:00.1 , real: 0:00:01.0): 
Successfully traced 3 scan chains (total 4530 scan bits).
Start applying DEF ordered sections ...
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_PCI_TOP/I_PCI_READ_FIFO_PCI_FIFO_CTL_U1_count_int_reg_5_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_0/s3_op2_reg_25_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_0/R_81" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_0/mega_shift_reg_0__13_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_0/mega_shift_reg_0__4_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/R_540" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/s1_op1_reg_10_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/mega_shift_reg_0__22_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/mega_shift_reg_0__21_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/trans3_reg" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/R_567" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/R_51" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/R_50" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/mega_shift_reg_0__17_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/mega_shift_reg_0__24_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/mega_shift_reg_0__0_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/mega_shift_reg_0__13_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/mega_shift_reg_0__16_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/mega_shift_reg_0__28_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/mega_shift_reg_0__4_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (EMS-27):	Message (IMPSC-1138) has exceeded the current message display limit of 20.
To increase the message display limit, refer to the product command reference manual.
**WARN: (IMPSC-1144):	Scan chain "5" was not traced through. Skip apply DEF ordered section.
**WARN: (IMPSC-1144):	Scan chain "6" was not traced through. Skip apply DEF ordered section.
**WARN: (IMPSC-1143):	Unable to apply DEF ordered sections for 2 scan chain(s). Check previous warning.
*** Scan Sanity Check Summary:
*** 3 scan chains passed sanity check.
Saving special route data file in separate thread ...
Saving PG file in separate thread ...
Saving placement file in separate thread ...
Saving route file in separate thread ...
Saving property file in separate thread ...
TAT_INFO: ::saveSpecialRoute REAL = 0 : CPU = 0 : MEM = 0.
** Saving stdCellPlacement_binary (version# 2) ...
Saving property file ORCA_TOP_floorplan.innovus.dat.tmp/ORCA_TOP.prop
Saving PG file ORCA_TOP_floorplan.innovus.dat.tmp/ORCA_TOP.pg.gz, version#2, (Created by Innovus v23.10-p003_1 on Wed Jun 12 01:49:02 2024)
Save Adaptive View Pruning View Names to Binary file
*** Completed saveProperty (cpu=0:00:00.2 real=0:00:00.0 mem=2846.7M) ***
*** Completed savePGFile (cpu=0:00:00.2 real=0:00:00.0 mem=2846.7M) ***
TAT_INFO: ::savePGFile REAL = 0 : CPU = 0 : MEM = 0.
TAT_INFO: ::savePlace REAL = 0 : CPU = 0 : MEM = 0.
*** Completed saveRoute (cpu=0:00:00.3 real=0:00:00.0 mem=2846.7M) ***
TAT_INFO: ::saveRoute REAL = 0 : CPU = 0 : MEM = 0.
TAT_INFO: ::db::saveAnnotationAndProp REAL = 0 : CPU = 0 : MEM = 0.
Saving power intent database ...
TAT_INFO: ::db::saveSymbolTable REAL = 1 : CPU = 0 : MEM = 0.
TAT_INFO: ::saveCongMap REAL = 1 : CPU = 0 : MEM = 0.
% Begin Save power constraints data ... (date=06/12 01:49:03, mem=2376.2M)
% End Save power constraints data ... (date=06/12 01:49:03, total cpu=0:00:00.0, real=0:00:00.0, peak res=2376.3M, current mem=2376.3M)
Generated self-contained design ORCA_TOP_floorplan.innovus.dat.tmp
#% End save design ... (date=06/12 01:49:09, total cpu=0:00:07.9, real=0:00:12.0, peak res=2404.4M, current mem=2377.7M)

*** Summary of all messages that are not suppressed in this session:
Severity  ID               Count  Summary                                  
WARNING   IMPSC-1001           2  Unable to trace scan chain "%s". Check t...
WARNING   IMPSC-1138         111  In scan chain "%s" DEF ordered section, ...
WARNING   IMPSC-1143           1  Unable to apply DEF ordered sections for...
WARNING   IMPSC-1144           2  Scan chain "%s" was not traced through. ...
WARNING   IMPSC-1020           2  Instance's output pin "%s/%s" (Cell "%s"...
*** Message Summary: 118 warning(s), 0 error(s)

######## FINISHED INTIIALIZE and FLOORPLAN #################
Start create_tracks
Design check done.


---
--- Please refer to file pg.rpt for detailed report.
---
*** Message Summary: 0 warning(s), 0 error(s)

#% Begin addRing (date=06/12 01:49:09, mem=2377.8M)


viaInitial starts at Wed Jun 12 01:49:09 2024
**WARN: (IMPPP-543):	Inconsistent cut size definition in VIARULE 'VIA12BAR_C' and 'VIA12SQ_C'.
Type 'man IMPPP-543' for more detail.
**WARN: (IMPPP-543):	Inconsistent cut size definition in VIARULE 'VIA12LG_C' and 'VIA12SQ_C'.
Type 'man IMPPP-543' for more detail.
**WARN: (IMPPP-543):	Inconsistent cut size definition in VIARULE 'VIA12BAR' and 'VIA12SQ_C'.
Type 'man IMPPP-543' for more detail.
**WARN: (IMPPP-543):	Inconsistent cut size definition in VIARULE 'VIA12LG' and 'VIA12SQ_C'.
Type 'man IMPPP-543' for more detail.
**WARN: (IMPPP-543):	Inconsistent cut size definition in VIARULE 'VIA23BAR_C' and 'VIA23SQ_C'.
Type 'man IMPPP-543' for more detail.
**WARN: (IMPPP-543):	Inconsistent cut size definition in VIARULE 'VIA23LG_C' and 'VIA23SQ_C'.
Type 'man IMPPP-543' for more detail.
**WARN: (IMPPP-543):	Inconsistent cut size definition in VIARULE 'VIA23BAR' and 'VIA23SQ_C'.
Type 'man IMPPP-543' for more detail.
**WARN: (IMPPP-543):	Inconsistent cut size definition in VIARULE 'VIA23LG' and 'VIA23SQ_C'.
Type 'man IMPPP-543' for more detail.
**WARN: (IMPPP-543):	Inconsistent cut size definition in VIARULE 'VIA34BAR_C' and 'VIA34SQ_C'.
Type 'man IMPPP-543' for more detail.
**WARN: (IMPPP-543):	Inconsistent cut size definition in VIARULE 'VIA34LG_C' and 'VIA34SQ_C'.
Type 'man IMPPP-543' for more detail.
**WARN: (IMPPP-543):	Inconsistent cut size definition in VIARULE 'VIA34BAR' and 'VIA34SQ_C'.
Type 'man IMPPP-543' for more detail.
**WARN: (IMPPP-543):	Inconsistent cut size definition in VIARULE 'VIA34LG' and 'VIA34SQ_C'.
Type 'man IMPPP-543' for more detail.
**WARN: (IMPPP-543):	Inconsistent cut size definition in VIARULE 'VIA45BAR_C' and 'VIA45SQ_C'.
Type 'man IMPPP-543' for more detail.
**WARN: (IMPPP-543):	Inconsistent cut size definition in VIARULE 'VIA45LG_C' and 'VIA45SQ_C'.
Type 'man IMPPP-543' for more detail.
**WARN: (IMPPP-543):	Inconsistent cut size definition in VIARULE 'VIA45BAR' and 'VIA45SQ_C'.
Type 'man IMPPP-543' for more detail.
**WARN: (IMPPP-543):	Inconsistent cut size definition in VIARULE 'VIA45LG' and 'VIA45SQ_C'.
Type 'man IMPPP-543' for more detail.
**WARN: (IMPPP-543):	Inconsistent cut size definition in VIARULE 'VIA56BAR_C' and 'VIA56SQ_C'.
Type 'man IMPPP-543' for more detail.
**WARN: (IMPPP-543):	Inconsistent cut size definition in VIARULE 'VIA56LG_C' and 'VIA56SQ_C'.
Type 'man IMPPP-543' for more detail.
**WARN: (IMPPP-543):	Inconsistent cut size definition in VIARULE 'VIA56BAR' and 'VIA56SQ_C'.
Type 'man IMPPP-543' for more detail.
**WARN: (IMPPP-543):	Inconsistent cut size definition in VIARULE 'VIA56LG' and 'VIA56SQ_C'.
Type 'man IMPPP-543' for more detail.
**WARN: (EMS-27):	Message (IMPPP-543) has exceeded the current message display limit of 20.
To increase the message display limit, refer to the product command reference manual.
viaInitial ends at Wed Jun 12 01:49:09 2024
Loading cell geometries (cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2651.1M)
The power planner has cut rows, and such rows will be considered to be placement objects.
**WARN: (IMPPP-220):	The power planner does not create core rings outside the design boundary. Check the design boundary, or specify valid offsets.
**WARN: (IMPPP-4051):	Failed to add rings, because the IO cells might contain gaps. Run the 'addIoFiller' command to fill gaps between the cells and try again.
Type 'man IMPPP-4051' for more detail.
#% End addRing (date=06/12 01:49:09, total cpu=0:00:00.2, real=0:00:00.0, peak res=2378.7M, current mem=2378.7M)
#% Begin addStripe (date=06/12 01:49:09, mem=2378.7M)

Initialize fgc environment(mem: 2651.1M) ...  fail and won't use fgc to check drc(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2651.1M)
Loading cell geometries (cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2651.1M)
Loading wires (cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2651.1M)
Loading via instances (cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2651.1M)
Starting stripe generation ...
Non-Default Mode Option Settings :
  NONE
The core ring for VDD is incomplete. The core ring will not be used as a boundary for stripes. In this situation, the power planner will generate stripes only within the core area.
The core ring for VSS is incomplete. The core ring will not be used as a boundary for stripes. In this situation, the power planner will generate stripes only within the core area.
Completing 10% stripe generation(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2651.1M)
Completing 20% stripe generation(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2651.1M)
Completing 30% stripe generation(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2651.1M)
Completing 40% stripe generation(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2651.1M)
Completing 50% stripe generation(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2651.1M)
Completing 60% stripe generation(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2651.1M)
Completing 70% stripe generation(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2651.1M)
Completing 80% stripe generation(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2651.1M)
Completing 90% stripe generation(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2651.1M)
Completing 100% stripe generation(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2651.1M)
Stripe generation is complete.
vias are now being generated.
addStripe created 216 wires.
ViaGen created 0 via, deleted 0 via to avoid violation.
+--------+----------------+----------------+
|  Layer |     Created    |     Deleted    |
+--------+----------------+----------------+
|   M4   |       216      |       NA       |
+--------+----------------+----------------+
#% End addStripe (date=06/12 01:49:09, total cpu=0:00:00.2, real=0:00:01.0, peak res=2382.6M, current mem=2382.6M)
#% Begin addStripe (date=06/12 01:49:10, mem=2382.6M)

Initialize fgc environment(mem: 2652.1M) ...  fail and won't use fgc to check drc(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2652.1M)
Loading cell geometries (cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2652.1M)
Loading wires (cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2652.1M)
Loading via instances (cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2652.1M)
Starting stripe generation ...
Non-Default Mode Option Settings :
  NONE
The core ring for VDD is incomplete. The core ring will not be used as a boundary for stripes. In this situation, the power planner will generate stripes only within the core area.
The core ring for VSS is incomplete. The core ring will not be used as a boundary for stripes. In this situation, the power planner will generate stripes only within the core area.
Completing 10% stripe generation(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2652.1M)
Completing 20% stripe generation(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2652.1M)
Completing 30% stripe generation(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2652.1M)
Completing 40% stripe generation(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2652.1M)
Completing 50% stripe generation(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2652.1M)
Completing 60% stripe generation(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2652.1M)
Completing 70% stripe generation(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2652.1M)
Completing 80% stripe generation(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2652.1M)
Completing 90% stripe generation(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2652.1M)
Stripe generation is complete.
vias are now being generated.
addStripe created 308 wires.
ViaGen created 1502 vias, deleted 0 via to avoid violation.
+--------+----------------+----------------+
|  Layer |     Created    |     Deleted    |
+--------+----------------+----------------+
|  VIA4  |      1502      |        0       |
|   M5   |       308      |       NA       |
+--------+----------------+----------------+
#% End addStripe (date=06/12 01:49:10, total cpu=0:00:00.3, real=0:00:00.0, peak res=2383.4M, current mem=2383.4M)
#% Begin addStripe (date=06/12 01:49:10, mem=2383.4M)

Initialize fgc environment(mem: 2653.1M) ...  fail and won't use fgc to check drc(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2653.1M)
Loading cell geometries (cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2653.1M)
Loading wires (cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2653.1M)
Loading via instances (cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2653.1M)
Starting stripe generation ...
Non-Default Mode Option Settings :
  NONE
The core ring for VDD is incomplete. The core ring will not be used as a boundary for stripes. In this situation, the power planner will generate stripes only within the core area.
The core ring for VSS is incomplete. The core ring will not be used as a boundary for stripes. In this situation, the power planner will generate stripes only within the core area.
Completing 10% stripe generation(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2653.1M)
Completing 20% stripe generation(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2653.1M)
Completing 30% stripe generation(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2653.1M)
Completing 40% stripe generation(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2653.1M)
Completing 50% stripe generation(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2653.1M)
Completing 60% stripe generation(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2653.1M)
Completing 70% stripe generation(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2653.1M)
Completing 80% stripe generation(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2653.1M)
Completing 90% stripe generation(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2653.1M)
Completing 100% stripe generation(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2653.1M)
Stripe generation is complete.
vias are now being generated.
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M6 & M4 at (10.03, 185.12) (10.09, 414.35).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M6 & M4 at (10.03, 483.97) (10.09, 511.40).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M6 & M4 at (10.03, 581.02) (10.09, 583.68).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M6 & M4 at (30.03, 185.12) (30.09, 405.39).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M6 & M4 at (30.03, 486.71) (30.09, 502.45).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M6 & M4 at (50.03, 185.12) (50.09, 405.39).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M6 & M4 at (50.03, 486.71) (50.09, 502.45).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M6 & M4 at (70.03, 185.12) (70.09, 404.75).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M6 & M4 at (70.03, 486.71) (70.09, 501.80).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M5 & M6 at (69.96, 486.33) (70.26, 486.63).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M5 & M6 at (69.96, 583.38) (70.26, 583.68).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M6 & M4 at (90.03, 185.12) (90.09, 583.68).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M6 & M4 at (110.03, 185.12) (110.09, 404.75).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M6 & M4 at (110.03, 486.71) (110.09, 501.80).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M6 & M4 at (130.03, 185.12) (130.09, 404.49).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M6 & M4 at (130.03, 486.71) (130.09, 501.55).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M5 & M6 at (130.01, 486.33) (130.31, 486.63).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M5 & M6 at (130.01, 583.38) (130.31, 583.68).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M6 & M4 at (150.03, 185.12) (150.09, 404.75).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M6 & M4 at (150.03, 486.71) (150.09, 501.80).
**WARN: (EMS-27):	Message (IMPPP-532) has exceeded the current message display limit of 20.
To increase the message display limit, refer to the product command reference manual.
**WARN: (IMPPP-612):	The intersection area is insufficient to satisfy MINIMUMCUT rule, so no via was created between layer: M5 & M6, size: 0.12 x 0.30 at (350.03, 486.48).
**WARN: (IMPPP-612):	The intersection area is insufficient to satisfy MINIMUMCUT rule, so no via was created between layer: M5 & M6, size: 0.12 x 0.30 at (350.03, 583.53).
**WARN: (IMPPP-612):	The intersection area is insufficient to satisfy MINIMUMCUT rule, so no via was created between layer: M5 & M6, size: 0.12 x 0.12 at (570.03, 30.09).
**WARN: (IMPPP-612):	The intersection area is insufficient to satisfy MINIMUMCUT rule, so no via was created between layer: M5 & M6, size: 0.12 x 0.12 at (570.03, 50.09).
**WARN: (IMPPP-612):	The intersection area is insufficient to satisfy MINIMUMCUT rule, so no via was created between layer: M5 & M6, size: 0.12 x 0.12 at (570.03, 110.09).
**WARN: (IMPPP-612):	The intersection area is insufficient to satisfy MINIMUMCUT rule, so no via was created between layer: M5 & M6, size: 0.12 x 0.12 at (570.03, 130.09).
**WARN: (IMPPP-612):	The intersection area is insufficient to satisfy MINIMUMCUT rule, so no via was created between layer: M5 & M6, size: 0.12 x 0.30 at (590.03, 486.48).
**WARN: (IMPPP-612):	The intersection area is insufficient to satisfy MINIMUMCUT rule, so no via was created between layer: M5 & M6, size: 0.12 x 0.30 at (590.03, 583.53).
**WARN: (IMPPP-612):	The intersection area is insufficient to satisfy MINIMUMCUT rule, so no via was created between layer: M5 & M6, size: 0.12 x 0.30 at (100.15, 486.48).
**WARN: (IMPPP-612):	The intersection area is insufficient to satisfy MINIMUMCUT rule, so no via was created between layer: M5 & M6, size: 0.12 x 0.30 at (100.15, 583.53).
**WARN: (IMPPP-612):	The intersection area is insufficient to satisfy MINIMUMCUT rule, so no via was created between layer: M5 & M6, size: 0.12 x 0.30 at (280.26, 486.48).
**WARN: (IMPPP-612):	The intersection area is insufficient to satisfy MINIMUMCUT rule, so no via was created between layer: M5 & M6, size: 0.12 x 0.30 at (280.26, 583.53).
**WARN: (IMPPP-612):	The intersection area is insufficient to satisfy MINIMUMCUT rule, so no via was created between layer: M5 & M6, size: 0.12 x 0.30 at (380.17, 486.48).
**WARN: (IMPPP-612):	The intersection area is insufficient to satisfy MINIMUMCUT rule, so no via was created between layer: M5 & M6, size: 0.12 x 0.30 at (380.17, 583.53).
**WARN: (IMPPP-612):	The intersection area is insufficient to satisfy MINIMUMCUT rule, so no via was created between layer: M5 & M6, size: 0.12 x 0.12 at (500.16, 20.21).
**WARN: (IMPPP-612):	The intersection area is insufficient to satisfy MINIMUMCUT rule, so no via was created between layer: M5 & M6, size: 0.12 x 0.30 at (520.26, 486.48).
**WARN: (IMPPP-612):	The intersection area is insufficient to satisfy MINIMUMCUT rule, so no via was created between layer: M5 & M6, size: 0.12 x 0.30 at (520.26, 583.53).
**WARN: (IMPPP-612):	The intersection area is insufficient to satisfy MINIMUMCUT rule, so no via was created between layer: M5 & M6, size: 0.12 x 0.30 at (760.15, 80.12).
**WARN: (IMPPP-612):	The intersection area is insufficient to satisfy MINIMUMCUT rule, so no via was created between layer: M5 & M6, size: 0.12 x 0.30 at (780.25, 583.53).
**WARN: (IMPPP-612):	The intersection area is insufficient to satisfy MINIMUMCUT rule, so no via was created between layer: M5 & M6, size: 0.12 x 0.30 at (940.16, 10.18).
**WARN: (EMS-27):	Message (IMPPP-612) has exceeded the current message display limit of 20.
To increase the message display limit, refer to the product command reference manual.
addStripe created 97 wires.
ViaGen created 1577 vias, deleted 0 via to avoid violation.
+--------+----------------+----------------+
|  Layer |     Created    |     Deleted    |
+--------+----------------+----------------+
|  VIA5  |      1577      |        0       |
|   M6   |       97       |       NA       |
+--------+----------------+----------------+
#% End addStripe (date=06/12 01:49:10, total cpu=0:00:00.3, real=0:00:00.0, peak res=2383.5M, current mem=2383.5M)
#% Begin addStripe (date=06/12 01:49:10, mem=2383.5M)

Initialize fgc environment(mem: 2653.1M) ...  fail and won't use fgc to check drc(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2653.1M)
Loading cell geometries (cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2653.1M)
Loading wires (cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2653.1M)
Loading via instances (cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2653.1M)
Starting stripe generation ...
Non-Default Mode Option Settings :
  NONE
The core ring for VDD is incomplete. The core ring will not be used as a boundary for stripes. In this situation, the power planner will generate stripes only within the core area.
The core ring for VSS is incomplete. The core ring will not be used as a boundary for stripes. In this situation, the power planner will generate stripes only within the core area.
Completing 10% stripe generation(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2653.1M)
Completing 20% stripe generation(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2653.1M)
Completing 30% stripe generation(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2653.1M)
Completing 40% stripe generation(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2653.1M)
Completing 50% stripe generation(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2653.1M)
Completing 60% stripe generation(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2653.1M)
Completing 70% stripe generation(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2653.1M)
Completing 80% stripe generation(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2653.1M)
Completing 90% stripe generation(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2653.1M)
Completing 100% stripe generation(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2653.1M)
Stripe generation is complete.
vias are now being generated.
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M7 & M5 at (420.12, 10.03) (431.85, 10.15).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M7 & M5 at (484.52, 10.03) (501.45, 10.15).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M7 & M5 at (554.12, 10.03) (571.06, 10.15).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M7 & M5 at (623.73, 10.03) (640.66, 10.15).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M7 & M5 at (693.33, 10.03) (709.82, 10.15).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M7 & M5 at (762.49, 10.03) (779.87, 10.15).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M7 & M5 at (832.54, 10.03) (849.48, 10.15).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M7 & M5 at (902.15, 10.03) (919.08, 10.15).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M7 & M5 at (971.75, 10.03) (972.50, 10.15).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M5 & M7 at (920.52, 10.03) (920.82, 10.33).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M5 & M7 at (929.52, 10.03) (929.82, 10.33).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M5 & M7 at (928.62, 10.03) (928.92, 10.33).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M5 & M7 at (925.02, 10.03) (925.32, 10.33).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M5 & M7 at (924.12, 10.03) (924.42, 10.33).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M5 & M7 at (947.52, 10.03) (947.82, 10.33).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M5 & M7 at (945.72, 10.03) (946.02, 10.33).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M5 & M7 at (946.62, 10.03) (946.92, 10.33).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M5 & M7 at (944.82, 10.03) (945.12, 10.33).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M5 & M7 at (941.22, 10.03) (941.52, 10.33).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M5 & M7 at (931.32, 10.03) (931.62, 10.33).
**WARN: (EMS-27):	Message (IMPPP-532) has exceeded the current message display limit of 20.
To increase the message display limit, refer to the product command reference manual.
**WARN: (IMPPP-531):	ViaGen Warning: Due to SPACING rule violation, viaGen fail to generate via on layer VIA6 at (480.33, 10.03) (480.38, 10.33).
addStripe created 29 wires.
ViaGen created 3449 vias, deleted 375 vias to avoid violation.
+--------+----------------+----------------+
|  Layer |     Created    |     Deleted    |
+--------+----------------+----------------+
|  VIA4  |       756      |       370      |
|  VIA5  |      1113      |        5       |
|  VIA6  |      1580      |        0       |
|   M7   |       29       |       NA       |
+--------+----------------+----------------+
#% End addStripe (date=06/12 01:49:11, total cpu=0:00:00.4, real=0:00:01.0, peak res=2384.0M, current mem=2384.0M)
#% Begin addStripe (date=06/12 01:49:11, mem=2384.0M)

Initialize fgc environment(mem: 2653.1M) ...  fail and won't use fgc to check drc(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2653.1M)
Loading cell geometries (cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2653.1M)
Loading wires (cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2653.1M)
Loading via instances (cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2653.1M)
Starting stripe generation ...
Non-Default Mode Option Settings :
  NONE
The core ring for VDD is incomplete. The core ring will not be used as a boundary for stripes. In this situation, the power planner will generate stripes only within the core area.
The core ring for VSS is incomplete. The core ring will not be used as a boundary for stripes. In this situation, the power planner will generate stripes only within the core area.
Completing 10% stripe generation(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2653.1M)
Completing 20% stripe generation(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2653.1M)
Completing 30% stripe generation(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2653.1M)
Completing 40% stripe generation(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2653.1M)
Completing 50% stripe generation(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2653.1M)
Completing 60% stripe generation(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2653.1M)
Completing 70% stripe generation(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2653.1M)
Completing 80% stripe generation(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2653.1M)
Completing 90% stripe generation(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2653.1M)
Completing 100% stripe generation(cpu: 0:00:00.0, real: 0:00:00.0, peak mem: 2653.1M)
Stripe generation is complete.
vias are now being generated.
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M8 & M4 at (10.03, 185.12) (10.09, 414.35).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M8 & M4 at (10.03, 483.97) (10.09, 511.40).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M8 & M4 at (10.03, 581.02) (10.09, 583.68).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M8 & M6 at (10.03, 185.12) (10.15, 583.68).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M5 & M8 at (13.27, 486.33) (13.56, 486.63).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M5 & M8 at (11.47, 486.33) (11.77, 486.63).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M5 & M8 at (13.27, 583.38) (13.56, 583.68).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M5 & M8 at (11.47, 583.38) (11.77, 583.68).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M8 & M4 at (90.03, 185.12) (90.09, 583.68).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M8 & M6 at (90.03, 185.12) (90.15, 583.68).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M5 & M8 at (94.01, 486.33) (94.31, 486.63).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M5 & M8 at (92.21, 486.33) (92.51, 486.63).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M5 & M8 at (94.01, 583.38) (94.31, 583.68).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M5 & M8 at (92.21, 583.38) (92.51, 583.68).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M8 & M4 at (170.03, 185.12) (170.09, 583.68).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M8 & M6 at (170.03, 185.12) (170.15, 583.68).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M5 & M8 at (172.95, 486.33) (173.25, 486.63).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M5 & M8 at (172.95, 583.38) (173.25, 583.68).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M8 & M4 at (250.03, 185.12) (250.09, 583.68).
**WARN: (IMPPP-532):	ViaGen Warning: The top layer and bottom layer have same direction but only orthogonal via is allowed between layer M8 & M6 at (250.03, 185.12) (250.15, 583.68).
**WARN: (EMS-27):	Message (IMPPP-532) has exceeded the current message display limit of 20.
To increase the message display limit, refer to the product command reference manual.
**WARN: (IMPPP-612):	The intersection area is insufficient to satisfy MINIMUMCUT rule, so no via was created between layer: M5 & M6, size: 4.00 x 0.12 at (570.03, 30.09).
**WARN: (IMPPP-612):	The intersection area is insufficient to satisfy MINIMUMCUT rule, so no via was created between layer: M5 & M6, size: 4.00 x 0.12 at (570.03, 50.09).
**WARN: (IMPPP-612):	The intersection area is insufficient to satisfy MINIMUMCUT rule, so no via was created between layer: M5 & M6, size: 4.00 x 0.12 at (570.03, 110.09).
**WARN: (IMPPP-612):	The intersection area is insufficient to satisfy MINIMUMCUT rule, so no via was created between layer: M5 & M6, size: 4.00 x 0.12 at (570.03, 130.09).
**WARN: (IMPPP-610):	The power planner failed to find a matching VIARULE, so no via was created between layer: M7 & M8, size: 4.00 x 0.30 at (814.01, 583.53).
Type 'man IMPPP-610' for more detail.
**WARN: (IMPPP-610):	The power planner failed to find a matching VIARULE, so no via was created between layer: M7 & M8, size: 4.00 x 0.30 at (538.01, 80.12).
Type 'man IMPPP-610' for more detail.
**WARN: (IMPPP-610):	The power planner failed to find a matching VIARULE, so no via was created between layer: M7 & M8, size: 4.00 x 0.30 at (534.04, 486.48).
Type 'man IMPPP-610' for more detail.
**WARN: (IMPPP-610):	The power planner failed to find a matching VIARULE, so no via was created between layer: M7 & M8, size: 4.00 x 0.30 at (534.04, 583.53).
Type 'man IMPPP-610' for more detail.
**WARN: (IMPPP-610):	The power planner failed to find a matching VIARULE, so no via was created between layer: M7 & M8, size: 4.00 x 0.30 at (854.04, 583.53).
Type 'man IMPPP-610' for more detail.
addStripe created 24 wires.
ViaGen created 1835 vias, deleted 241 vias to avoid violation.
+--------+----------------+----------------+
|  Layer |     Created    |     Deleted    |
+--------+----------------+----------------+
|  VIA5  |       554      |       238      |
|  VIA6  |       554      |        3       |
|  VIA7  |       727      |        0       |
|   M8   |       24       |       NA       |
+--------+----------------+----------------+
#% End addStripe (date=06/12 01:49:11, total cpu=0:00:00.3, real=0:00:00.0, peak res=2386.4M, current mem=2386.4M)
#% Begin sroute (date=06/12 01:49:11, mem=2386.4M)
*** Begin SPECIAL ROUTE on Wed Jun 12 01:49:11 2024 ***
SPECIAL ROUTE ran on directory: /u/nmallebo/ECE530-2024-SPRING/finalprj-group4/apr/work
SPECIAL ROUTE ran on machine: mo.ece.pdx.edu (Linux 3.10.0-1160.114.2.el7.x86_64 Xeon 2.60Ghz)

Begin option processing ...
srouteConnectPowerBump set to false
routeSpecial set to true
srouteConnectBlockPin set to false
srouteConnectConverterPin set to false
srouteConnectStripe set to false
srouteCrossoverViaBottomLayer set to 1
srouteCrossoverViaTopLayer set to 4
srouteFollowCorePinEnd set to 3
srouteFollowPadPin set to false
srouteJogControl set to "preferWithChanges differentLayer"
sroutePadPinAllPorts set to true
sroutePreserveExistingRoutes set to true
srouteRoutePowerBarPortOnBothDir set to true
End option processing: cpu: 0:00:00, real: 0:00:00, peak: 448.00 megs.

Reading DB technology information...
Finished reading DB technology information.
Reading floorplan and netlist information...
   **WARN: PROPERTY scScanTag not defined
   **WARN: PROPERTY scScanTag not defined
   **WARN: PROPERTY scScanTag not defined
   **WARN: PROPERTY scScanTag not defined
   **WARN: PROPERTY scScanTag not defined
   **WARN: PROPERTY scScanTag not defined
   **WARN: PROPERTY scScanTag not defined
   **WARN: PROPERTY scScanTag not defined
   **WARN: PROPERTY showBlockEdgeNum not defined
   **WARN: PROPERTY scScanTag not defined
   **WARN: PROPERTY scScanTag not defined
   **WARN: PROPERTY scScanTag not defined
   **WARN: PROPERTY showBlockEdgeNum not defined
   **WARN: PROPERTY scScanTag not defined
   **WARN: PROPERTY scScanTag not defined
   **WARN: PROPERTY scScanTag not defined
   **WARN: PROPERTY showBlockEdgeNum not defined
   **WARN: PROPERTY scScanTag not defined
   **WARN: PROPERTY scScanTag not defined
   **WARN: PROPERTY scScanTag not defined
   **WARN: PROPERTY scScanTag not defined
   **WARN: PROPERTY scScanTag not defined
   **WARN: PROPERTY scScanTag not defined
Finished reading floorplan and netlist information.
   A total of 23 warnings.
Read in 21 layers, 10 routing layers, 1 overlap layer
Read in 1054 macros, 114 used
Read in 219 components
  179 core components: 179 unplaced, 0 placed, 0 fixed
  40 block/ring components: 0 unplaced, 0 placed, 40 fixed
Read in 242 physical pins
  242 physical pins: 0 unplaced, 0 placed, 242 fixed
Read in 3 logical pins
Read in 1 blockages
Read in 220 nets
Read in 3 special nets, 2 routed
Read in 681 terminals
Begin power routing ...
**WARN: (IMPSR-1256):	Unable to find any CORE class pad pin of the VDD net due to unavailability of the pin or check netlist in the routing area or layer. Change routing area or layer to include the expected pin or check netlist. Alternatively, change port class in the technology file.
Type 'man IMPSR-1256' for more detail.
Cannot find any AREAIO class pad pin of net VDD. Check net list, or change port class in the technology file, or change option to include pin in given range.
**WARN: (IMPSR-1256):	Unable to find any CORE class pad pin of the VDDH net due to unavailability of the pin or check netlist in the routing area or layer. Change routing area or layer to include the expected pin or check netlist. Alternatively, change port class in the technology file.
Type 'man IMPSR-1256' for more detail.
Cannot find any AREAIO class pad pin of net VDDH. Check net list, or change port class in the technology file, or change option to include pin in given range.
**WARN: (IMPSR-1256):	Unable to find any CORE class pad pin of the VSS net due to unavailability of the pin or check netlist in the routing area or layer. Change routing area or layer to include the expected pin or check netlist. Alternatively, change port class in the technology file.
Type 'man IMPSR-1256' for more detail.
Cannot find any AREAIO class pad pin of net VSS. Check net list, or change port class in the technology file, or change option to include pin in given range.
**WARN: (IMPSR-2031):	For net VDDH, no suitable cell can be taken as reference cell for followpin generation at (97.736 10.032) (112.632 11.704). Specify option -corePinLayer to generate followpin on M3 or above layers. Similar warnings suppressed.
**WARN: (IMPSR-481):	Row/Power/Ground pin overlap with a block or obstruction around (32.235, 501.570), it will not be connected.
**WARN: (IMPSR-481):	Row/Power/Ground pin overlap with a block or obstruction around (33.603, 501.570), it will not be connected.
**WARN: (IMPSR-481):	Row/Power/Ground pin overlap with a block or obstruction around (34.971, 501.570), it will not be connected.
**WARN: (IMPSR-481):	Row/Power/Ground pin overlap with a block or obstruction around (36.339, 501.570), it will not be connected.
**WARN: (IMPSR-481):	Row/Power/Ground pin overlap with a block or obstruction around (37.707, 501.570), it will not be connected.
**WARN: (IMPSR-481):	Row/Power/Ground pin overlap with a block or obstruction around (39.075, 501.570), it will not be connected.
**WARN: (IMPSR-481):	Row/Power/Ground pin overlap with a block or obstruction around (40.443, 501.570), it will not be connected.
**WARN: (IMPSR-481):	Row/Power/Ground pin overlap with a block or obstruction around (41.811, 501.570), it will not be connected.
**WARN: (IMPSR-481):	Row/Power/Ground pin overlap with a block or obstruction around (43.179, 501.570), it will not be connected.
**WARN: (IMPSR-481):	Row/Power/Ground pin overlap with a block or obstruction around (44.547, 501.570), it will not be connected.
**WARN: (IMPSR-481):	Row/Power/Ground pin overlap with a block or obstruction around (45.915, 501.570), it will not be connected.
**WARN: (IMPSR-481):	Row/Power/Ground pin overlap with a block or obstruction around (47.283, 501.570), it will not be connected.
**WARN: (IMPSR-481):	Row/Power/Ground pin overlap with a block or obstruction around (48.651, 501.570), it will not be connected.
**WARN: (IMPSR-481):	Row/Power/Ground pin overlap with a block or obstruction around (50.019, 501.570), it will not be connected.
**WARN: (IMPSR-481):	Row/Power/Ground pin overlap with a block or obstruction around (51.387, 501.570), it will not be connected.
**WARN: (IMPSR-481):	Row/Power/Ground pin overlap with a block or obstruction around (112.977, 501.570), it will not be connected.
**WARN: (IMPSR-481):	Row/Power/Ground pin overlap with a block or obstruction around (114.345, 501.570), it will not be connected.
**WARN: (IMPSR-481):	Row/Power/Ground pin overlap with a block or obstruction around (115.713, 501.570), it will not be connected.
**WARN: (IMPSR-481):	Row/Power/Ground pin overlap with a block or obstruction around (117.081, 501.570), it will not be connected.
**WARN: (IMPSR-481):	Row/Power/Ground pin overlap with a block or obstruction around (118.449, 501.570), it will not be connected.
**WARN: (EMS-27):	Message (IMPSR-481) has exceeded the current message display limit of 20.
To increase the message display limit, refer to the product command reference manual.
CPU time for VDD FollowPin 1 seconds
CPU time for VDDH FollowPin 0 seconds
CPU time for VSS FollowPin 1 seconds
**WARN: (IMPPP-531):	ViaGen Warning: Due to SPACING rule violation, viaGen fail to generate via on layer VIA4 at (560.08, 560.09) (560.35, 560.10).
  Number of IO ports routed: 0
  Number of Core ports routed: 3662  ignored: 123  open: 475
  Number of Followpin connections: 2486
End power routing: cpu: 0:00:26, real: 0:00:26, peak: 674.00 megs.



 Begin updating DB with routing results ...
 Updating DB with 242 io pins ...
 Updating DB with 36 via definition ...Extracting standard cell pins and blockage ...... 
Pin and blockage extraction finished


sroute post-processing starts at Wed Jun 12 01:49:38 2024
The viaGen is rebuilding shadow vias for net VSS.
**WARN: (IMPPP-531):	ViaGen Warning: Due to MINAREA rule violation, viaGen fail to generate via on layer M3 at (880.14, 473.58) (880.27, 473.69).
**WARN: (IMPPP-531):	ViaGen Warning: Due to MINAREA rule violation, viaGen fail to generate via on layer M3 at (880.14, 342.40) (880.27, 342.51).
**WARN: (IMPPP-531):	ViaGen Warning: Due to MINAREA rule violation, viaGen fail to generate via on layer M3 at (20.14, 486.80) (20.27, 486.91).
**WARN: (IMPPP-531):	ViaGen Warning: Due to MINAREA rule violation, viaGen fail to generate via on layer M3 at (100.14, 486.80) (100.27, 486.91).
**WARN: (IMPPP-531):	ViaGen Warning: Due to MINAREA rule violation, viaGen fail to generate via on layer M3 at (180.14, 486.80) (180.27, 486.91).
**WARN: (IMPPP-531):	ViaGen Warning: Due to MINAREA rule violation, viaGen fail to generate via on layer M3 at (20.14, 501.70) (20.27, 501.81).
sroute post-processing ends at Wed Jun 12 01:49:39 2024

sroute post-processing starts at Wed Jun 12 01:49:39 2024
The viaGen is rebuilding shadow vias for net VDD.
**WARN: (IMPPP-531):	ViaGen Warning: Due to SPACING rule violation, viaGen fail to generate via on layer VIA4 at (972.58, 234.12) (972.60, 234.15).
**WARN: (IMPPP-4500):	Extended number of geometries exist around 50.074000, 501.600000 between the M1 and M2 layers. This may increase the run time.
Type 'man IMPPP-4500' for more detail.
**WARN: (IMPPP-4500):	Extended number of geometries exist around 50.040000, 501.875000 between the M1 and M4 layers. This may increase the run time.
Type 'man IMPPP-4500' for more detail.
**WARN: (IMPPP-4500):	Extended number of geometries exist around 130.091000, 502.056000 between the M1 and M6 layers. This may increase the run time.
Type 'man IMPPP-4500' for more detail.
**WARN: (IMPPP-531):	ViaGen Warning: Due to MINAREA rule violation, viaGen fail to generate via on layer M5 at (130.02, 502.00) (130.15, 502.11).
**WARN: (IMPPP-4500):	Extended number of geometries exist around 210.091000, 502.056000 between the M1 and M6 layers. This may increase the run time.
Type 'man IMPPP-4500' for more detail.
**WARN: (IMPPP-531):	ViaGen Warning: Due to MINAREA rule violation, viaGen fail to generate via on layer M5 at (210.02, 502.00) (210.15, 502.11).
**WARN: (IMPPP-4500):	Extended number of geometries exist around 290.130000, 502.121000 between the M1 and M6 layers. This may increase the run time.
Type 'man IMPPP-4500' for more detail.
**WARN: (IMPPP-531):	ViaGen Warning: Due to MINAREA rule violation, viaGen fail to generate via on layer M5 at (290.03, 501.96) (290.16, 502.07).
**WARN: (IMPPP-4500):	Extended number of geometries exist around 370.091000, 502.056000 between the M1 and M6 layers. This may increase the run time.
Type 'man IMPPP-4500' for more detail.
**WARN: (IMPPP-531):	ViaGen Warning: Due to MINAREA rule violation, viaGen fail to generate via on layer M5 at (370.02, 502.00) (370.15, 502.11).
**WARN: (IMPPP-4500):	Extended number of geometries exist around 450.091000, 502.056000 between the M1 and M6 layers. This may increase the run time.
Type 'man IMPPP-4500' for more detail.
**WARN: (IMPPP-531):	ViaGen Warning: Due to MINAREA rule violation, viaGen fail to generate via on layer M5 at (450.02, 502.00) (450.15, 502.11).
**WARN: (IMPPP-4500):	Extended number of geometries exist around 530.091000, 502.056000 between the M1 and M6 layers. This may increase the run time.
Type 'man IMPPP-4500' for more detail.
**WARN: (IMPPP-531):	ViaGen Warning: Due to MINAREA rule violation, viaGen fail to generate via on layer M5 at (530.02, 502.00) (530.15, 502.11).
**WARN: (IMPPP-4500):	Extended number of geometries exist around 610.092000, 502.056000 between the M1 and M6 layers. This may increase the run time.
Type 'man IMPPP-4500' for more detail.
**WARN: (IMPPP-4500):	Extended number of geometries exist around 438.188000, 501.261000 between the M2 and M3 layers. This may increase the run time.
Type 'man IMPPP-4500' for more detail.
**WARN: (IMPPP-4500):	Extended number of geometries exist around 438.188000, 501.331000 between the M1 and M2 layers. This may increase the run time.
Type 'man IMPPP-4500' for more detail.
sroute post-processing ends at Wed Jun 12 01:49:39 2024
sroute created 11109 wires.
ViaGen created 45086 vias, deleted 6 vias to avoid violation.
+--------+----------------+----------------+
|  Layer |     Created    |     Deleted    |
+--------+----------------+----------------+
|   M1   |      6563      |       NA       |
|  VIA1  |      11678     |        0       |
|   M2   |       308      |       NA       |
|  VIA2  |      11652     |        0       |
|   M3   |       931      |       NA       |
|  VIA3  |      11651     |        0       |
|   M4   |       10       |       NA       |
|  VIA4  |      2709      |        0       |
|   M5   |       115      |       NA       |
|  VIA5  |      2703      |        0       |
|   M6   |       762      |       NA       |
|  VIA6  |      4585      |        5       |
|   M7   |      2420      |       NA       |
|  VIA7  |       108      |        1       |
+--------+----------------+----------------+
#% End sroute (date=06/12 01:49:39, total cpu=0:00:28.2, real=0:00:28.0, peak res=2616.8M, current mem=2408.8M)

Logfile message: writing def file completed ...
######## STARTING PLACE #################
### Start verbose source output (echo mode) for '../scripts/ORCA_TOP.pre.place.tcl' ...
# if { [info exists synopsys_program_name ] } {
    source -echo -verbose ../scripts/fix_macro_outputs_place.tcl
    echo READING SCANDEF
    if { ( ! [ info exists fc_rtl ] ) ||  ( ! $fc_rtl ) } {
        echo READING SCANDEF
        read_def ../../syn/outputs/ORCA_TOP.dct.scan.def
        echo FINISHED READING SCANDEF
    }

    # Creating seperate voltage area for core area. 
    remove_voltage_areas *
    create_voltage_area -power_domains PD_RISC_CORE -region {{11 400} {450 640}}
    # Commit the UPF settings for ORCA.
    commit_upf
} else {
  source ../scripts/update_vddh_libs.tcl

  if { [ is_common_ui_mode ] } {  set_db eco_batch_mode true
  } else { setEcoMode -batchMode true }

  foreach_in_collection i [ get_cells -hier -filter "ref_name=~LSD*||ref_name==LSUP" ] {
     set vt [regsub  ".VT" [get_db $i .base_cell.base_name ] LVT ] 
     if { [ is_common_ui_mode ] } {  eco_update_cell -insts [get_db $i .name ] -cells $vt   
     } else { ecoChangeCell -inst [get_db $i .name ] -cell $vt  }
  }
  if { [ is_common_ui_mode ] } {  set_db eco_batch_mode false
  } else { setEcoMode -batchMode false  }
}
**ERROR: (IMPTS-423):	No library found for instance 'I_RISC_CORE/ls_in_35_test_si1', cell 'LSUPX1_RVT', in powerdomain 'PD_RISC_CORE', of view 'test_worst_scenario'
Type 'man IMPTS-423' for more detail.
**ERROR: (IMPTS-423):	No library found for instance 'I_RISC_CORE/ls_in_34_scan_enable', cell 'LSUPX1_RVT', in powerdomain 'PD_RISC_CORE', of view 'test_worst_scenario'
Type 'man IMPTS-423' for more detail.
**ERROR: (IMPTS-423):	No library found for instance 'I_RISC_CORE/ls_in_33_Instrn_0_', cell 'LSUPX1_RVT', in powerdomain 'PD_RISC_CORE', of view 'test_worst_scenario'
Type 'man IMPTS-423' for more detail.
**ERROR: (IMPTS-423):	No library found for instance 'I_RISC_CORE/ls_in_32_Instrn_1_', cell 'LSUPX1_RVT', in powerdomain 'PD_RISC_CORE', of view 'test_worst_scenario'
Type 'man IMPTS-423' for more detail.
**ERROR: (IMPTS-423):	No library found for instance 'I_RISC_CORE/ls_in_31_Instrn_2_', cell 'LSUPX1_RVT', in powerdomain 'PD_RISC_CORE', of view 'test_worst_scenario'
Type 'man IMPTS-423' for more detail.
**ERROR: (IMPTS-423):	No library found for instance 'I_RISC_CORE/ls_in_30_Instrn_3_', cell 'LSUPX1_RVT', in powerdomain 'PD_RISC_CORE', of view 'test_worst_scenario'
Type 'man IMPTS-423' for more detail.
**ERROR: (IMPTS-423):	No library found for instance 'I_RISC_CORE/ls_in_29_Instrn_4_', cell 'LSUPX1_RVT', in powerdomain 'PD_RISC_CORE', of view 'test_worst_scenario'
Type 'man IMPTS-423' for more detail.
**ERROR: (IMPTS-423):	No library found for instance 'I_RISC_CORE/ls_in_28_Instrn_5_', cell 'LSUPX1_RVT', in powerdomain 'PD_RISC_CORE', of view 'test_worst_scenario'
Type 'man IMPTS-423' for more detail.
**ERROR: (IMPTS-423):	No library found for instance 'I_RISC_CORE/ls_in_27_Instrn_6_', cell 'LSUPX1_RVT', in powerdomain 'PD_RISC_CORE', of view 'test_worst_scenario'
Type 'man IMPTS-423' for more detail.
**ERROR: (IMPTS-423):	No library found for instance 'I_RISC_CORE/ls_in_26_Instrn_7_', cell 'LSUPX1_RVT', in powerdomain 'PD_RISC_CORE', of view 'test_worst_scenario'
Type 'man IMPTS-423' for more detail.
**ERROR: (IMPTS-423):	No library found for instance 'I_RISC_CORE/ls_in_25_Instrn_8_', cell 'LSUPX1_RVT', in powerdomain 'PD_RISC_CORE', of view 'test_worst_scenario'
Type 'man IMPTS-423' for more detail.
**ERROR: (IMPTS-423):	No library found for instance 'I_RISC_CORE/ls_in_24_Instrn_9_', cell 'LSUPX1_RVT', in powerdomain 'PD_RISC_CORE', of view 'test_worst_scenario'
Type 'man IMPTS-423' for more detail.
**ERROR: (IMPTS-423):	No library found for instance 'I_RISC_CORE/ls_in_23_Instrn_10_', cell 'LSUPX1_RVT', in powerdomain 'PD_RISC_CORE', of view 'test_worst_scenario'
Type 'man IMPTS-423' for more detail.
**ERROR: (IMPTS-423):	No library found for instance 'I_RISC_CORE/ls_in_22_Instrn_11_', cell 'LSUPX1_RVT', in powerdomain 'PD_RISC_CORE', of view 'test_worst_scenario'
Type 'man IMPTS-423' for more detail.
**ERROR: (IMPTS-423):	No library found for instance 'I_RISC_CORE/ls_in_21_Instrn_12_', cell 'LSUPX1_RVT', in powerdomain 'PD_RISC_CORE', of view 'test_worst_scenario'
Type 'man IMPTS-423' for more detail.
**ERROR: (IMPTS-423):	No library found for instance 'I_RISC_CORE/ls_in_20_Instrn_13_', cell 'LSUPX1_RVT', in powerdomain 'PD_RISC_CORE', of view 'test_worst_scenario'
Type 'man IMPTS-423' for more detail.
**ERROR: (IMPTS-423):	No library found for instance 'I_RISC_CORE/ls_in_19_Instrn_14_', cell 'LSUPX1_RVT', in powerdomain 'PD_RISC_CORE', of view 'test_worst_scenario'
Type 'man IMPTS-423' for more detail.
**ERROR: (IMPTS-423):	No library found for instance 'I_RISC_CORE/ls_in_18_Instrn_15_', cell 'LSUPX1_RVT', in powerdomain 'PD_RISC_CORE', of view 'test_worst_scenario'
Type 'man IMPTS-423' for more detail.
**ERROR: (IMPTS-423):	No library found for instance 'I_RISC_CORE/ls_in_17_Instrn_16_', cell 'LSUPX1_RVT', in powerdomain 'PD_RISC_CORE', of view 'test_worst_scenario'
Type 'man IMPTS-423' for more detail.
**ERROR: (IMPTS-423):	No library found for instance 'I_RISC_CORE/ls_in_16_Instrn_17_', cell 'LSUPX1_RVT', in powerdomain 'PD_RISC_CORE', of view 'test_worst_scenario'
Type 'man IMPTS-423' for more detail.
**ERROR: (IMPTS-424):	 Missing library for some instance found in view(s). Please check the library binding of instances in active views and set the missing library in corresponding views.
**WARN: (IMPOPT-6115):	ECO batch mode has been activated, and '(batch mode)' has been added to the prompt as a reminder of that situation. Specify 'setEcoMode -batchMode false' after all ECOs are over.
Type 'man IMPOPT-6115' for more detail.
**WARN: (IMPOPT-6103):	Timing updates for ECO operations done inside batch mode will happen when exiting batch mode.
**WARN: (IMPSP-362):	Site 'unit' has one std.Cell height, so ignoring its X-symmetry.
Type 'man IMPSP-362' for more detail.

#################################################################################
# Design Stage: PreRoute
# Design Name: ORCA_TOP
# Design Mode: 90nm
# Analysis Mode: MMMC Non-OCV 
# Parasitics Mode: No SPEF/RCDB 
# Signoff Settings: SI Off 
#################################################################################
AAE_INFO: opIsDesignInPostRouteState() is 0
AAE DB initialization (MEM=3025.78 CPU=0:00:00.0 REAL=0:00:00.0) 
#################################################################################
# Design Stage: PreRoute
# Design Name: ORCA_TOP
# Design Mode: 90nm
# Analysis Mode: MMMC Non-OCV 
# Parasitics Mode: No SPEF/RCDB 
# Signoff Settings: SI Off 
#################################################################################
[NR-eGR] Started Early Global Route ( Curr Mem: 2.88 MB )
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
[NR-eGR] Started Early Global Route kernel ( Curr Mem: 2.88 MB )
[NR-eGR] Read 41631 nets ( ignored 41631 )
[NR-eGR] No Net to Route
[NR-eGR] Overflow after Early Global Route 0.00% H + 0.00% V
[NR-eGR] No Net to Route
[NR-eGR] Total eGR-routed clock nets wire length: 0um, number of vias: 0
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR]               Length (um)  Vias 
[NR-eGR] --------------------------------
[NR-eGR]  M1    (1H)             0     0 
[NR-eGR]  M2    (2V)             0     0 
[NR-eGR]  M3    (3H)             0     0 
[NR-eGR]  M4    (4V)             0     0 
[NR-eGR]  M5    (5H)             0     0 
[NR-eGR]  M6    (6V)             0     0 
[NR-eGR]  M7    (7H)             0     0 
[NR-eGR]  M8    (8V)             0     0 
[NR-eGR]  M9    (9H)             0     0 
[NR-eGR]  MRDL  (10V)            0     0 
[NR-eGR] --------------------------------
[NR-eGR]        Total            0     0 
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR] Total half perimeter of net bounding box: 940860um
[NR-eGR] Total length: 0um, number of vias: 0
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR] Finished Early Global Route kernel ( CPU: 0.74 sec, Real: 0.67 sec, Curr Mem: 2.91 MB )
[NR-eGR] Finished Early Global Route ( CPU: 0.75 sec, Real: 0.68 sec, Curr Mem: 2.89 MB )
Extraction called for design 'ORCA_TOP' of instances=39085 and nets=42514 using extraction engine 'preRoute' .
**WARN: (IMPEXT-3530):	The process node is not set. Use the command setDesignMode -process <process node> prior to extraction for maximum accuracy and optimal automatic threshold setting.
Type 'man IMPEXT-3530' for more detail.
PreRoute RC Extraction called for design ORCA_TOP.
RC Extraction called in multi-corner(2) mode.
RCMode: PreRoute
      RC Corner Indexes            0       1   
Capacitance Scaling Factor   : 1.00000 1.00000 
Resistance Scaling Factor    : 1.00000 1.00000 
Clock Cap. Scaling Factor    : 1.00000 1.00000 
Clock Res. Scaling Factor    : 1.00000 1.00000 
Shrink Factor                : 1.00000
PreRoute extraction is honoring NDR/Shielding/ExtraSpace for clock nets.
Using capacitance table file ...
Updating RC Grid density data for preRoute extraction ...
Initializing multi-corner capacitance tables ... 
Initializing multi-corner resistance tables ...
PreRoute RC Extraction DONE (CPU Time: 0:00:00.3  Real Time: 0:00:00.0  MEM: 3003.207M)
Using master clock 'SDRAM_CLK' for generated clock 'SD_DDR_CLKn' in view 'test_worst_scenario'
Using master clock 'SDRAM_CLK' for generated clock 'SD_DDR_CLKn' in view 'func_worst_scenario'
Using master clock 'SYS_2x_CLK' for generated clock 'SYS_CLK' in view 'test_worst_scenario'
Using master clock 'SYS_2x_CLK' for generated clock 'SYS_CLK' in view 'func_worst_scenario'
Using master clock 'SDRAM_CLK' for generated clock 'SD_DDR_CLK' in view 'test_worst_scenario'
Using master clock 'SDRAM_CLK' for generated clock 'SD_DDR_CLK' in view 'func_worst_scenario'
Calculate delays in BcWc mode...
Calculate delays in BcWc mode...
Start delay calculation (fullDC) (8 T). (MEM=2769)
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/n_35, driver I_RISC_CORE/ls_in_34_scan_enable/Y (cell LSUPX1_RVT) voltage 0.95 does not match receiver I_RISC_CORE/U18/A (cell NBUFFX2_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/n_36, driver I_RISC_CORE/ls_in_35_test_si1/Y (cell LSUPX1_RVT) voltage 0.95 does not match receiver I_RISC_CORE/I_STACK_TOP_I1_STACK_MEM_Stack_Mem_reg_5__2_/SI (cell SDFFX1_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/n_27, driver I_RISC_CORE/ls_in_26_Instrn_7_/Y (cell LSUPX1_RVT) voltage 0.95 does not match receiver I_RISC_CORE/I_INSTRN_LAT_Crnt_Instrn_2_reg_7_/D (cell SDFFARX2_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/n_26, driver I_RISC_CORE/ls_in_25_Instrn_8_/Y (cell LSUPX1_RVT) voltage 0.95 does not match receiver I_RISC_CORE/I_INSTRN_LAT_Crnt_Instrn_2_reg_8_/D (cell SDFFARX2_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/n_34, driver I_RISC_CORE/ls_in_33_Instrn_0_/Y (cell LSUPX1_RVT) voltage 0.95 does not match receiver I_RISC_CORE/I_INSTRN_LAT_Crnt_Instrn_2_reg_0_/D (cell SDFFARX2_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/n_33, driver I_RISC_CORE/ls_in_32_Instrn_1_/Y (cell LSUPX1_RVT) voltage 0.95 does not match receiver I_RISC_CORE/I_INSTRN_LAT_Crnt_Instrn_2_reg_1_/D (cell SDFFARX2_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/n_32, driver I_RISC_CORE/ls_in_31_Instrn_2_/Y (cell LSUPX1_RVT) voltage 0.95 does not match receiver I_RISC_CORE/I_INSTRN_LAT_Crnt_Instrn_2_reg_2_/D (cell SDFFARX1_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/n_31, driver I_RISC_CORE/ls_in_30_Instrn_3_/Y (cell LSUPX1_RVT) voltage 0.95 does not match receiver I_RISC_CORE/I_INSTRN_LAT_Crnt_Instrn_2_reg_3_/D (cell SDFFARX2_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/n_21, driver I_RISC_CORE/ls_in_20_Instrn_13_/Y (cell LSUPX1_RVT) voltage 0.95 does not match receiver I_RISC_CORE/I_INSTRN_LAT_Crnt_Instrn_2_reg_13_/D (cell SDFFARX2_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/n_20, driver I_RISC_CORE/ls_in_19_Instrn_14_/Y (cell LSUPX1_RVT) voltage 0.95 does not match receiver I_RISC_CORE/I_INSTRN_LAT_Crnt_Instrn_2_reg_14_/D (cell SDFFARX1_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/n_19, driver I_RISC_CORE/ls_in_18_Instrn_15_/Y (cell LSUPX1_RVT) voltage 0.95 does not match receiver I_RISC_CORE/I_INSTRN_LAT_Crnt_Instrn_2_reg_15_/D (cell SDFFARX1_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/n_18, driver I_RISC_CORE/ls_in_17_Instrn_16_/Y (cell LSUPX1_RVT) voltage 0.95 does not match receiver I_RISC_CORE/I_INSTRN_LAT_Crnt_Instrn_2_reg_16_/D (cell SDFFARX1_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/n_17, driver I_RISC_CORE/ls_in_16_Instrn_17_/Y (cell LSUPX1_RVT) voltage 0.95 does not match receiver I_RISC_CORE/I_INSTRN_LAT_Crnt_Instrn_2_reg_17_/D (cell SDFFARX1_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/n_16, driver I_RISC_CORE/ls_in_15_Instrn_18_/Y (cell LSUPX1_RVT) voltage 0.95 does not match receiver I_RISC_CORE/I_INSTRN_LAT_Crnt_Instrn_2_reg_18_/D (cell SDFFARX1_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/n_15, driver I_RISC_CORE/ls_in_14_Instrn_19_/Y (cell LSUPX1_RVT) voltage 0.95 does not match receiver I_RISC_CORE/I_INSTRN_LAT_Crnt_Instrn_2_reg_19_/D (cell SDFFARX1_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (EMS-27):	Message (IMPMSMV-1810) has exceeded the current message display limit of 20.
To increase the message display limit, refer to the product command reference manual.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/n_30, driver I_RISC_CORE/ls_in_29_Instrn_4_/Y (cell LSUPX1_RVT) voltage 0.95 does not match receiver I_RISC_CORE/I_INSTRN_LAT_Crnt_Instrn_2_reg_4_/D (cell SDFFARX2_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/n_25, driver I_RISC_CORE/ls_in_24_Instrn_9_/Y (cell LSUPX1_RVT) voltage 0.95 does not match receiver I_RISC_CORE/I_INSTRN_LAT_Crnt_Instrn_2_reg_9_/D (cell SDFFARX2_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/n_24, driver I_RISC_CORE/ls_in_23_Instrn_10_/Y (cell LSUPX1_RVT) voltage 0.95 does not match receiver I_RISC_CORE/I_INSTRN_LAT_Crnt_Instrn_2_reg_10_/D (cell SDFFARX2_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/n_23, driver I_RISC_CORE/ls_in_22_Instrn_11_/Y (cell LSUPX1_RVT) voltage 0.95 does not match receiver I_RISC_CORE/I_INSTRN_LAT_Crnt_Instrn_2_reg_11_/D (cell SDFFARX2_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/n_22, driver I_RISC_CORE/ls_in_21_Instrn_12_/Y (cell LSUPX1_RVT) voltage 0.95 does not match receiver I_RISC_CORE/I_INSTRN_LAT_Crnt_Instrn_2_reg_12_/D (cell SDFFARX2_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/n_29, driver I_RISC_CORE/ls_in_28_Instrn_5_/Y (cell LSUPX1_RVT) voltage 0.95 does not match receiver I_RISC_CORE/I_INSTRN_LAT_Crnt_Instrn_2_reg_5_/D (cell SDFFARX2_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/n_28, driver I_RISC_CORE/ls_in_27_Instrn_6_/Y (cell LSUPX1_RVT) voltage 0.95 does not match receiver I_RISC_CORE/I_INSTRN_LAT_Crnt_Instrn_2_reg_6_/D (cell SDFFARX2_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
Total number of fetched objects 48210
AAE_INFO: Total number of nets for which stage creation was skipped for all views 0
End delay calculation. (MEM=2822.88 CPU=0:00:23.3 REAL=0:00:03.0)
End delay calculation (fullDC). (MEM=2775.61 CPU=0:00:32.8 REAL=0:00:15.0)
   _____________________________________________________________
  /  Design State
 +--------------------------------------------------------------
 | unconnected nets:       16
 | signal nets: 
 |    routed nets:        0 (0.0% routed)
 |     total nets:    41543
 | clock nets: 
 |    routed nets:        0 (0.0% routed)
 |     total nets:       88
 +--------------------------------------------------------------
**INFO: Fewer than half of the nets are detail routed, this design is not in postRoute stage
Resize ls_out_61_test_so1 (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_60_STACK_FULL (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_59_OUT_VALID (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_58_RESULT_DATA_0_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_57_RESULT_DATA_1_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_56_RESULT_DATA_2_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_55_RESULT_DATA_3_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_54_RESULT_DATA_4_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_53_RESULT_DATA_5_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_52_RESULT_DATA_6_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_51_RESULT_DATA_7_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_50_RESULT_DATA_8_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_49_RESULT_DATA_9_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_48_RESULT_DATA_10_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_47_RESULT_DATA_11_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_46_RESULT_DATA_12_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_45_RESULT_DATA_13_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_44_RESULT_DATA_14_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_43_RESULT_DATA_15_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_42_Rd_Instr (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_41_PSW_2_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_40_PSW_3_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_39_PSW_4_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_38_PSW_5_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_37_PSW_6_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_36_PSW_7_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_35_PSW_8_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_34_PSW_9_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_33_PSW_10_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_32_EndOfInstrn (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_31_Xecutng_Instrn_0_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_30_Xecutng_Instrn_1_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_29_Xecutng_Instrn_2_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_28_Xecutng_Instrn_3_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_27_Xecutng_Instrn_4_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_26_Xecutng_Instrn_5_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_25_Xecutng_Instrn_6_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_24_Xecutng_Instrn_7_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_23_Xecutng_Instrn_8_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_22_Xecutng_Instrn_9_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_21_Xecutng_Instrn_10_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_20_Xecutng_Instrn_11_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_19_Xecutng_Instrn_12_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_18_Xecutng_Instrn_13_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_17_Xecutng_Instrn_14_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_16_Xecutng_Instrn_15_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_15_Xecutng_Instrn_16_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_14_Xecutng_Instrn_17_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_13_Xecutng_Instrn_18_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_12_Xecutng_Instrn_19_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_11_Xecutng_Instrn_20_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_10_Xecutng_Instrn_21_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_9_Xecutng_Instrn_22_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_8_Xecutng_Instrn_23_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_7_Xecutng_Instrn_24_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_6_Xecutng_Instrn_25_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_5_Xecutng_Instrn_26_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_4_Xecutng_Instrn_27_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_3_Xecutng_Instrn_28_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_2_Xecutng_Instrn_29_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_1_Xecutng_Instrn_30_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.
Resize ls_out_0_Xecutng_Instrn_31_ (LSDNSSX8_RVT) to LSDNSSX8_LVT.

*** Starting refinePlace (0:03:14 mem=3399.2M) ***
Total net bbox length = 8.561e+05 (5.116e+05 3.445e+05) (ext = 6.704e+04)
**WARN: (IMPSP-2022):	No instances to legalize in design.
Type 'man IMPSP-2022' for more detail.
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Total net bbox length = 8.561e+05 (5.116e+05 3.445e+05) (ext = 6.704e+04)
Runtime: CPU: 0:00:00.1 REAL: 0:00:00.0 MEM: 3399.2MB
*** Finished refinePlace (0:03:14 mem=3399.2M) ***
### End verbose source output for '../scripts/ORCA_TOP.pre.place.tcl'.
#% Begin place_opt_design (date=06/12 01:50:02, mem=2763.8M)
**INFO: User settings:
setDesignMode -earlyClockFlow                false
setDesignMode -flowEffort                    standard
setDelayCalMode -engine                      aae
setOptMode -opt_enable_podv2_clock_opt_flow  false
setOptMode -opt_skew                         true
setOptMode -opt_skew_ccopt                   standard
setOptMode -opt_skew_post_route              false
setOptMode -opt_skew_pre_cts                 false
setAnalysisMode -analysisType                bcwc

*** place_opt_design #1 [begin] () : totSession cpu/real = 0:03:14.8/0:04:19.4 (0.8), mem = 3432.6M
No user sequential activity specified, applying default sequential activity of "0.2" for Dynamic Power reporting.
'set_default_switching_activity' finished successfully.
*** Starting GigaPlace ***
#optDebug: fT-E <X 2 3 1 0>

*** GlobalPlace #1 [begin] (place_opt_design #1) : totSession cpu/real = 0:03:15.6/0:04:19.9 (0.8), mem = 3431.2M
**WARN: (IMPSC-1020):	Instance's output pin "snps_clk_chain_1/U2/Y" (Cell "AO22X1_RVT") has multiple corresponding input pins for scan tracing. Please specify the instance in scan DEF.  You can also apply "setScanReorderMode -compLogic true" to trace through the chain but it could be not exactly the chain that user needed.
**WARN: (IMPSC-1001):	Unable to trace scan chain "5". Check the information during tracing.
Type 'man IMPSC-1001' for more detail.
**WARN: (IMPSC-1020):	Instance's output pin "I_CLOCKING/snps_clk_chain_0/U2/Y" (Cell "AO22X1_RVT") has multiple corresponding input pins for scan tracing. Please specify the instance in scan DEF.  You can also apply "setScanReorderMode -compLogic true" to trace through the chain but it could be not exactly the chain that user needed.
**WARN: (IMPSC-1001):	Unable to trace scan chain "6". Check the information during tracing.
Type 'man IMPSC-1001' for more detail.
*** Scan Trace Summary (runtime: cpu: 0:00:00.0 , real: 0:00:00.0): 
Successfully traced 3 scan chains (total 4530 scan bits).
Start applying DEF ordered sections ...
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_PCI_TOP/I_PCI_READ_FIFO_PCI_FIFO_CTL_U1_count_int_reg_5_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_0/s3_op2_reg_25_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_0/R_81" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_0/mega_shift_reg_0__13_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_0/mega_shift_reg_0__4_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/R_540" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/s1_op1_reg_10_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/mega_shift_reg_0__22_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/mega_shift_reg_0__21_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/trans3_reg" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/R_567" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/R_51" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/R_50" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/mega_shift_reg_0__17_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/mega_shift_reg_0__24_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/mega_shift_reg_0__0_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/mega_shift_reg_0__13_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/mega_shift_reg_0__16_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/mega_shift_reg_0__28_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/mega_shift_reg_0__4_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (EMS-27):	Message (IMPSC-1138) has exceeded the current message display limit of 20.
To increase the message display limit, refer to the product command reference manual.
**WARN: (IMPSC-1144):	Scan chain "5" was not traced through. Skip apply DEF ordered section.
**WARN: (IMPSC-1144):	Scan chain "6" was not traced through. Skip apply DEF ordered section.
**WARN: (IMPSC-1143):	Unable to apply DEF ordered sections for 2 scan chain(s). Check previous warning.
*** Scan Sanity Check Summary:
*** 3 scan chains passed sanity check.
**ERROR: (IMPSP-9099):	Scan chains exist in this design but are not defined for 10.48% flops. Placement and timing QoR can be severely impacted in this case!
It is highly recommend to define scan chains either through input scan def (preferred) or specifyScanChain.
**WARN: (IMPEXT-3493):	The design extraction status has been reset by set_analysis_view/update_rc_corner or setExtractRCMode  command. The parasitic data can be regenerated either by extracting the design using the extractRC command or by loading the SPEF or RCDB file(s). To prevent resetting of the extraction status, avoid changing extraction modes.
Type 'man IMPEXT-3493' for more detail.
*** Start deleteBufferTree ***
Using master clock 'SDRAM_CLK' for generated clock 'SD_DDR_CLKn' in view 'test_worst_scenario'
Using master clock 'SDRAM_CLK' for generated clock 'SD_DDR_CLKn' in view 'func_worst_scenario'
Using master clock 'SYS_2x_CLK' for generated clock 'SYS_CLK' in view 'test_worst_scenario'
Using master clock 'SYS_2x_CLK' for generated clock 'SYS_CLK' in view 'func_worst_scenario'
Using master clock 'SDRAM_CLK' for generated clock 'SD_DDR_CLK' in view 'test_worst_scenario'
Using master clock 'SDRAM_CLK' for generated clock 'SD_DDR_CLK' in view 'func_worst_scenario'
Warning: Found 48 MSV violating nets before deleteBufferTree
  Will not remove AON buffers because removing them could give unexpected results
Info: Detect buffers to remove automatically.
Analyzing netlist ...
Updating netlist

*summary: 3434 instances (buffers/inverters) removed
*** Finish deleteBufferTree (0:00:10.1) ***
Deleted 0 physical inst  (cell - / prefix -).
INFO: #ExclusiveGroups=0
INFO: There are no Exclusive Groups.
No user-set net weight.
Net fanout histogram:
2		: 19267 (50.3%) nets
3		: 10980 (28.7%) nets
4     -	14	: 7236 (18.9%) nets
15    -	39	: 760 (2.0%) nets
40    -	79	: 10 (0.0%) nets
80    -	159	: 0 (0.0%) nets
160   -	319	: 3 (0.0%) nets
320   -	639	: 14 (0.0%) nets
640   -	1279	: 5 (0.0%) nets
1280  -	2559	: 4 (0.0%) nets
2560  -	5119	: 3 (0.0%) nets
5120+		: 0 (0.0%) nets
**WARN: (IMPSC-1020):	Instance's output pin "snps_clk_chain_1/U2/Y" (Cell "AO22X1_RVT") has multiple corresponding input pins for scan tracing. Please specify the instance in scan DEF.  You can also apply "setScanReorderMode -compLogic true" to trace through the chain but it could be not exactly the chain that user needed.
**WARN: (IMPSC-1001):	Unable to trace scan chain "5". Check the information during tracing.
Type 'man IMPSC-1001' for more detail.
**WARN: (IMPSC-1020):	Instance's output pin "I_CLOCKING/snps_clk_chain_0/U2/Y" (Cell "AO22X1_RVT") has multiple corresponding input pins for scan tracing. Please specify the instance in scan DEF.  You can also apply "setScanReorderMode -compLogic true" to trace through the chain but it could be not exactly the chain that user needed.
**WARN: (IMPSC-1001):	Unable to trace scan chain "6". Check the information during tracing.
Type 'man IMPSC-1001' for more detail.
*** Scan Trace Summary (runtime: cpu: 0:00:00.1 , real: 0:00:00.0): 
Successfully traced 3 scan chains (total 4530 scan bits).
Start applying DEF ordered sections ...
**WARN: (IMPSC-1144):	Scan chain "5" was not traced through. Skip apply DEF ordered section.
**WARN: (IMPSC-1144):	Scan chain "6" was not traced through. Skip apply DEF ordered section.
**WARN: (IMPSC-1143):	Unable to apply DEF ordered sections for 2 scan chain(s). Check previous warning.
*** Scan Sanity Check Summary:
*** 3 scan chains passed sanity check.
#std cell=35696 (0 fixed + 35696 movable) #buf cell=32 #inv cell=3802 #block=40 (0 floating + 40 preplaced)
#ioInst=0 #net=38229 #term=149448 #term/net=3.91, #fixedIo=0, #floatIo=0, #fixedPin=215, #floatPin=0
stdCell: 35660 single + 36 double + 0 multi
Total standard cell length = 80.6555 (mm), area = 0.1350 (mm^2)

Average module density = 0.566.
Density for module 'CLOCK_GROUP' = 0.570.
       = stdcell_area 2449 sites (622 um^2) / alloc_area 4297 sites (1092 um^2).
Density for module 'PD_RISC_CORE' = 0.473.
       = stdcell_area 22849 sites (5807 um^2) / alloc_area 48331 sites (12283 um^2).
Density for the rest of the design = 0.570.
       = stdcell_area 505834 sites (128555 um^2) / alloc_area 887512 sites (225556 um^2).
Density for the design = 0.565.
       = stdcell_area 531132 sites (134984 um^2) / alloc_area 940140 sites (238931 um^2).
Pin Density = 0.06513.
            = total # of pins 149448 / total area 2294720.
Identified 419 spare or floating instances, with no clusters.




Enabling multi-CPU acceleration with 8 CPU(s) for placement
=== lastAutoLevel = 10 
Clock gating cells determined by native netlist tracing.
Iteration  1: Total net bbox = 5.742e+05 (3.96e+05 1.79e+05)
              Est.  stn bbox = 6.315e+05 (4.34e+05 1.97e+05)
              cpu = 0:00:03.1 real = 0:00:01.0 mem = 3472.3M
Iteration  2: Total net bbox = 5.742e+05 (3.96e+05 1.79e+05)
              Est.  stn bbox = 6.315e+05 (4.34e+05 1.97e+05)
              cpu = 0:00:00.0 real = 0:00:00.0 mem = 3473.3M
*** Finished SKP initialization (cpu=0:00:36.3, real=0:00:14.0)***

Active views After View pruning: 
func_worst_scenario
Iteration  3: Total net bbox = 5.296e+05 (3.82e+05 1.47e+05)
              Est.  stn bbox = 6.353e+05 (4.57e+05 1.78e+05)
              cpu = 0:01:05 real = 0:00:21.0 mem = 4376.9M
Iteration  4: Total net bbox = 4.898e+05 (3.38e+05 1.52e+05)
              Est.  stn bbox = 5.946e+05 (4.09e+05 1.86e+05)
              cpu = 0:01:11 real = 0:00:14.0 mem = 4493.4M
Iteration  5: Total net bbox = 4.898e+05 (3.38e+05 1.52e+05)
              Est.  stn bbox = 5.946e+05 (4.09e+05 1.86e+05)
              cpu = 0:00:00.0 real = 0:00:00.0 mem = 4493.4M
Iteration  6: Total net bbox = 5.846e+05 (3.74e+05 2.11e+05)
              Est.  stn bbox = 7.073e+05 (4.49e+05 2.58e+05)
              cpu = 0:01:31 real = 0:00:18.0 mem = 4519.4M

Iteration  7: Total net bbox = 6.239e+05 (4.06e+05 2.18e+05)
              Est.  stn bbox = 7.485e+05 (4.83e+05 2.65e+05)
              cpu = 0:00:00.1 real = 0:00:00.0 mem = 4295.4M
Iteration  8: Total net bbox = 6.239e+05 (4.06e+05 2.18e+05)
              Est.  stn bbox = 7.485e+05 (4.83e+05 2.65e+05)
              cpu = 0:00:00.1 real = 0:00:00.0 mem = 4295.4M
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Iteration  9: Total net bbox = 6.633e+05 (4.22e+05 2.41e+05)
              Est.  stn bbox = 7.993e+05 (5.02e+05 2.97e+05)
              cpu = 0:01:31 real = 0:00:19.0 mem = 4268.2M
Iteration 10: Total net bbox = 6.633e+05 (4.22e+05 2.41e+05)
              Est.  stn bbox = 7.993e+05 (5.02e+05 2.97e+05)
              cpu = 0:00:00.1 real = 0:00:01.0 mem = 4268.2M
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Iteration 11: Total net bbox = 6.850e+05 (4.35e+05 2.50e+05)
              Est.  stn bbox = 8.288e+05 (5.20e+05 3.09e+05)
              cpu = 0:01:05 real = 0:00:14.0 mem = 4274.9M
Iteration 12: Total net bbox = 6.850e+05 (4.35e+05 2.50e+05)
              Est.  stn bbox = 8.288e+05 (5.20e+05 3.09e+05)
              cpu = 0:00:00.1 real = 0:00:00.0 mem = 4274.9M
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Iteration 13: Total net bbox = 7.159e+05 (4.52e+05 2.64e+05)
              Est.  stn bbox = 8.613e+05 (5.38e+05 3.23e+05)
              cpu = 0:01:15 real = 0:00:16.0 mem = 4258.4M
Iteration 14: Total net bbox = 7.159e+05 (4.52e+05 2.64e+05)
              Est.  stn bbox = 8.613e+05 (5.38e+05 3.23e+05)
              cpu = 0:00:00.1 real = 0:00:00.0 mem = 4258.4M
Iteration 15: Total net bbox = 7.439e+05 (4.67e+05 2.77e+05)
              Est.  stn bbox = 8.883e+05 (5.52e+05 3.36e+05)
              cpu = 0:01:22 real = 0:00:18.0 mem = 4287.6M
Iteration 16: Total net bbox = 7.439e+05 (4.67e+05 2.77e+05)
              Est.  stn bbox = 8.883e+05 (5.52e+05 3.36e+05)
              cpu = 0:00:00.1 real = 0:00:00.0 mem = 4287.6M
Iteration 17: Total net bbox = 7.439e+05 (4.67e+05 2.77e+05)
              Est.  stn bbox = 8.883e+05 (5.52e+05 3.36e+05)
              cpu = 0:00:00.1 real = 0:00:00.0 mem = 4287.6M
Finished Global Placement (cpu=0:09:07, real=0:02:04, mem=4287.6M)
Keep Tdgp Graph and DB for later use
Info: 15 clock gating cells identified, 15 (on average) moved 120/8
Begin: Reorder Scan Chains
**WARN: (IMPSC-1020):	Instance's output pin "snps_clk_chain_1/U2/Y" (Cell "AO22X1_RVT") has multiple corresponding input pins for scan tracing. Please specify the instance in scan DEF.  You can also apply "setScanReorderMode -compLogic true" to trace through the chain but it could be not exactly the chain that user needed.
**WARN: (IMPSC-1001):	Unable to trace scan chain "5". Check the information during tracing.
Type 'man IMPSC-1001' for more detail.
**WARN: (IMPSC-1020):	Instance's output pin "I_CLOCKING/snps_clk_chain_0/U2/Y" (Cell "AO22X1_RVT") has multiple corresponding input pins for scan tracing. Please specify the instance in scan DEF.  You can also apply "setScanReorderMode -compLogic true" to trace through the chain but it could be not exactly the chain that user needed.
**WARN: (IMPSC-1001):	Unable to trace scan chain "6". Check the information during tracing.
Type 'man IMPSC-1001' for more detail.
*** Scan Trace Summary (runtime: cpu: 0:00:00.0 , real: 0:00:00.0): 
Successfully traced 3 scan chains (total 4530 scan bits).
Found 0 hierarchical instance(s) in the file.
**WARN: (IMPSC-1105):	Unable to skip buffer for scan chain "5".
**WARN: (IMPSC-1105):	Unable to skip buffer for scan chain "6".
*** Scan Skip Mode Summary:
INFO: Unable to skip buffers for 2 scan groups!
Start flexRegrouping ...
**WARN: (IMPSC-1020):	Instance's output pin "snps_clk_chain_1/U2/Y" (Cell "AO22X1_RVT") has multiple corresponding input pins for scan tracing. Please specify the instance in scan DEF.  You can also apply "setScanReorderMode -compLogic true" to trace through the chain but it could be not exactly the chain that user needed.
**WARN: (IMPSC-1001):	Unable to trace scan chain "5". Check the information during tracing.
Type 'man IMPSC-1001' for more detail.
**WARN: (IMPSC-1020):	Instance's output pin "I_CLOCKING/snps_clk_chain_0/U2/Y" (Cell "AO22X1_RVT") has multiple corresponding input pins for scan tracing. Please specify the instance in scan DEF.  You can also apply "setScanReorderMode -compLogic true" to trace through the chain but it could be not exactly the chain that user needed.
**WARN: (IMPSC-1001):	Unable to trace scan chain "6". Check the information during tracing.
Type 'man IMPSC-1001' for more detail.
**WARN: (IMPSC-1144):	Scan chain "5" was not traced through. Skip apply DEF ordered section.
**WARN: (IMPSC-1144):	Scan chain "6" was not traced through. Skip apply DEF ordered section.
SC-INFO: saving current scan group ...
**WARN: (IMPSC-1020):	Instance's output pin "snps_clk_chain_1/U2/Y" (Cell "AO22X1_RVT") has multiple corresponding input pins for scan tracing. Please specify the instance in scan DEF.  You can also apply "setScanReorderMode -compLogic true" to trace through the chain but it could be not exactly the chain that user needed.
**WARN: (IMPSC-1001):	Unable to trace scan chain "5". Check the information during tracing.
Type 'man IMPSC-1001' for more detail.
**WARN: (IMPSC-1020):	Instance's output pin "I_CLOCKING/snps_clk_chain_0/U2/Y" (Cell "AO22X1_RVT") has multiple corresponding input pins for scan tracing. Please specify the instance in scan DEF.  You can also apply "setScanReorderMode -compLogic true" to trace through the chain but it could be not exactly the chain that user needed.
**WARN: (IMPSC-1001):	Unable to trace scan chain "6". Check the information during tracing.
Type 'man IMPSC-1001' for more detail.
**WARN: (IMPSC-1144):	Scan chain "5" was not traced through. Skip apply DEF ordered section.
**WARN: (IMPSC-1144):	Scan chain "6" was not traced through. Skip apply DEF ordered section.
**WARN: (IMPSC-1117):	Skip reordering scan chain "5" because tracing did not succeed.
**WARN: (IMPSC-1117):	Skip reordering scan chain "6" because tracing did not succeed.
**WARN: (IMPSC-1020):	Instance's output pin "snps_clk_chain_1/U2/Y" (Cell "AO22X1_RVT") has multiple corresponding input pins for scan tracing. Please specify the instance in scan DEF.  You can also apply "setScanReorderMode -compLogic true" to trace through the chain but it could be not exactly the chain that user needed.
**WARN: (IMPSC-1001):	Unable to trace scan chain "5". Check the information during tracing.
Type 'man IMPSC-1001' for more detail.
**WARN: (IMPSC-1020):	Instance's output pin "I_CLOCKING/snps_clk_chain_0/U2/Y" (Cell "AO22X1_RVT") has multiple corresponding input pins for scan tracing. Please specify the instance in scan DEF.  You can also apply "setScanReorderMode -compLogic true" to trace through the chain but it could be not exactly the chain that user needed.
**WARN: (IMPSC-1001):	Unable to trace scan chain "6". Check the information during tracing.
Type 'man IMPSC-1001' for more detail.
**WARN: (IMPSC-1144):	Scan chain "5" was not traced through. Skip apply DEF ordered section.
**WARN: (IMPSC-1144):	Scan chain "6" was not traced through. Skip apply DEF ordered section.
**WARN: (IMPSC-1020):	Instance's output pin "snps_clk_chain_1/U2/Y" (Cell "AO22X1_RVT") has multiple corresponding input pins for scan tracing. Please specify the instance in scan DEF.  You can also apply "setScanReorderMode -compLogic true" to trace through the chain but it could be not exactly the chain that user needed.
**WARN: (IMPSC-1001):	Unable to trace scan chain "5". Check the information during tracing.
Type 'man IMPSC-1001' for more detail.
**WARN: (IMPSC-1020):	Instance's output pin "I_CLOCKING/snps_clk_chain_0/U2/Y" (Cell "AO22X1_RVT") has multiple corresponding input pins for scan tracing. Please specify the instance in scan DEF.  You can also apply "setScanReorderMode -compLogic true" to trace through the chain but it could be not exactly the chain that user needed.
**WARN: (IMPSC-1001):	Unable to trace scan chain "6". Check the information during tracing.
Type 'man IMPSC-1001' for more detail.
**WARN: (IMPSC-1144):	Scan chain "5" was not traced through. Skip apply DEF ordered section.
**WARN: (IMPSC-1144):	Scan chain "6" was not traced through. Skip apply DEF ordered section.
**WARN: (IMPSC-1117):	Skip reordering scan chain "5" because tracing did not succeed.
**WARN: (IMPSC-1117):	Skip reordering scan chain "6" because tracing did not succeed.
**WARN: (IMPSC-1020):	Instance's output pin "snps_clk_chain_1/U2/Y" (Cell "AO22X1_RVT") has multiple corresponding input pins for scan tracing. Please specify the instance in scan DEF.  You can also apply "setScanReorderMode -compLogic true" to trace through the chain but it could be not exactly the chain that user needed.
**WARN: (IMPSC-1001):	Unable to trace scan chain "5". Check the information during tracing.
Type 'man IMPSC-1001' for more detail.
**WARN: (IMPSC-1020):	Instance's output pin "I_CLOCKING/snps_clk_chain_0/U2/Y" (Cell "AO22X1_RVT") has multiple corresponding input pins for scan tracing. Please specify the instance in scan DEF.  You can also apply "setScanReorderMode -compLogic true" to trace through the chain but it could be not exactly the chain that user needed.
**WARN: (IMPSC-1001):	Unable to trace scan chain "6". Check the information during tracing.
Type 'man IMPSC-1001' for more detail.
*** Scan Trace Summary (runtime: cpu: 0:00:00.0 , real: 0:00:00.0): 
Successfully traced 3 scan chains (total 4530 scan bits).
Start applying DEF ordered sections ...
**WARN: (IMPSC-1144):	Scan chain "5" was not traced through. Skip apply DEF ordered section.
**WARN: (IMPSC-1144):	Scan chain "6" was not traced through. Skip apply DEF ordered section.
**WARN: (IMPSC-1143):	Unable to apply DEF ordered sections for 2 scan chain(s). Check previous warning.
*** Scan Sanity Check Summary:
*** 3 scan chains passed sanity check.
SC-INFO: saving current scan group ...
**WARN: (IMPSC-1020):	Instance's output pin "snps_clk_chain_1/U2/Y" (Cell "AO22X1_RVT") has multiple corresponding input pins for scan tracing. Please specify the instance in scan DEF.  You can also apply "setScanReorderMode -compLogic true" to trace through the chain but it could be not exactly the chain that user needed.
**WARN: (IMPSC-1001):	Unable to trace scan chain "5". Check the information during tracing.
Type 'man IMPSC-1001' for more detail.
**WARN: (IMPSC-1020):	Instance's output pin "I_CLOCKING/snps_clk_chain_0/U2/Y" (Cell "AO22X1_RVT") has multiple corresponding input pins for scan tracing. Please specify the instance in scan DEF.  You can also apply "setScanReorderMode -compLogic true" to trace through the chain but it could be not exactly the chain that user needed.
**WARN: (IMPSC-1001):	Unable to trace scan chain "6". Check the information during tracing.
Type 'man IMPSC-1001' for more detail.
*** Scan Trace Summary (runtime: cpu: 0:00:00.0 , real: 0:00:00.0): 
Successfully traced 3 scan chains (total 4530 scan bits).
Start applying DEF ordered sections ...
**WARN: (IMPSC-1144):	Scan chain "5" was not traced through. Skip apply DEF ordered section.
**WARN: (IMPSC-1144):	Scan chain "6" was not traced through. Skip apply DEF ordered section.
**WARN: (IMPSC-1143):	Unable to apply DEF ordered sections for 2 scan chain(s). Check previous warning.
*** Scan Sanity Check Summary:
*** 3 scan chains passed sanity check.
**WARN: (IMPSC-1117):	Skip reordering scan chain "5" because tracing did not succeed.
**WARN: (IMPSC-1117):	Skip reordering scan chain "6" because tracing did not succeed.
**WARN: (IMPSC-1020):	Instance's output pin "snps_clk_chain_1/U2/Y" (Cell "AO22X1_RVT") has multiple corresponding input pins for scan tracing. Please specify the instance in scan DEF.  You can also apply "setScanReorderMode -compLogic true" to trace through the chain but it could be not exactly the chain that user needed.
**WARN: (IMPSC-1001):	Unable to trace scan chain "5". Check the information during tracing.
Type 'man IMPSC-1001' for more detail.
**WARN: (IMPSC-1020):	Instance's output pin "I_CLOCKING/snps_clk_chain_0/U2/Y" (Cell "AO22X1_RVT") has multiple corresponding input pins for scan tracing. Please specify the instance in scan DEF.  You can also apply "setScanReorderMode -compLogic true" to trace through the chain but it could be not exactly the chain that user needed.
**WARN: (IMPSC-1001):	Unable to trace scan chain "6". Check the information during tracing.
Type 'man IMPSC-1001' for more detail.
*** Scan Trace Summary (runtime: cpu: 0:00:00.0 , real: 0:00:01.0): 
Successfully traced 3 scan chains (total 4530 scan bits).
Start applying DEF ordered sections ...
**WARN: (IMPSC-1144):	Scan chain "5" was not traced through. Skip apply DEF ordered section.
**WARN: (IMPSC-1144):	Scan chain "6" was not traced through. Skip apply DEF ordered section.
**WARN: (IMPSC-1143):	Unable to apply DEF ordered sections for 2 scan chain(s). Check previous warning.
*** Scan Sanity Check Summary:
*** 3 scan chains passed sanity check.
**WARN: (IMPSC-1117):	Skip reordering scan chain "6" because tracing did not succeed.
**WARN: (IMPSC-1117):	Skip reordering scan chain "5" because tracing did not succeed.
Start wep ...
**WARN: (IMPSC-1108):	Unable to update netlist with reordered scan chain connections for scan chain "5".
**WARN: (IMPSC-1108):	Unable to update netlist with reordered scan chain connections for scan chain "6".
INFO: Finished netlist update for 3 scan groups.
INFO: Failed to update netlist for 2 scan groups.
**WARN: (EMS-27):	Message (IMPSC-1020) has exceeded the current message display limit of 20.
To increase the message display limit, refer to the product command reference manual.
**WARN: (EMS-27):	Message (IMPSC-1001) has exceeded the current message display limit of 20.
To increase the message display limit, refer to the product command reference manual.
*** Scan Trace Summary (runtime: cpu: 0:00:00.0 , real: 0:00:00.0): 
Successfully traced 3 scan chains (total 4530 scan bits).
Start applying DEF ordered sections ...
**WARN: (IMPSC-1144):	Scan chain "5" was not traced through. Skip apply DEF ordered section.
**WARN: (IMPSC-1144):	Scan chain "6" was not traced through. Skip apply DEF ordered section.
**WARN: (IMPSC-1143):	Unable to apply DEF ordered sections for 2 scan chain(s). Check previous warning.
*** Scan Sanity Check Summary:
*** 3 scan chains passed sanity check.
**WARN: (IMPSC-1117):	Skip reordering scan chain "6" because tracing did not succeed.
**WARN: (IMPSC-1117):	Skip reordering scan chain "5" because tracing did not succeed.
Finished flexRegrouping
*** Summary: Scan Reorder within scan chain
Initial total scan wire length:   166657.594 (floating:   157757.479)
Final   total scan wire length:    44600.040 (floating:    35699.925)
Improvement:   122057.554   percent 73.24 (floating improvement:   122057.554   percent 77.37)
Initial scan reorder max long connection:      879.532
Final   scan reorder max long connection:      556.087
Improvement:      323.445   percent 36.77
Total net length = 7.453e+05 (4.676e+05 2.777e+05) (ext = 4.914e+04)
*** End of ScanReorder (cpu=0:00:05.7, real=0:00:03.0, mem=4574.2M) ***
End: Reorder Scan Chains

*** Starting refinePlace (0:12:41 mem=4607.6M) ***
Total net bbox length = 7.611e+05 (4.771e+05 2.841e+05) (ext = 4.039e+04)
98 shifters have been successfully placed.
98 shifters were given a new location.
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Move report: Detail placement moves 35594 insts, mean move: 0.86 um, max move: 32.37 um 
	Max move on inst (I_SDRAM_TOP/I_SDRAM_IF/DQ_in_1_reg_20_): (153.38, 369.52) --> (180.73, 364.50)
	Runtime: CPU: 0:00:18.7 REAL: 0:00:09.0 MEM: 4703.6MB
Summary Report:
Instances move: 35692 (out of 35696 movable)
Instances flipped: 3
Mean displacement: 0.97 um
Max displacement: 166.04 um (Instance: ls_out_43_RESULT_DATA_15_) (294.221, 185.594) -> (420.128, 145.464)
	Length: 17 sites, height: 1 rows, site name: unit, cell type: LSDNSSX8_LVT
Physical-only instances move: 0 (out of 0 movable physical-only)
Total net bbox length = 7.190e+05 (4.361e+05 2.829e+05) (ext = 4.038e+04)
Runtime: CPU: 0:00:19.1 REAL: 0:00:09.0 MEM: 4703.6MB
*** Finished refinePlace (0:13:01 mem=4703.6M) ***
*** Finished Initial Placement (cpu=0:09:34, real=0:02:18, mem=4482.2M) ***

powerDomain PD_ORCA_TOP : bins with density > 0.750 = 37.76 % ( 802 / 2124 )
powerDomain PD_RISC_CORE : bins with density > 0.750 = 56.73 % ( 156 / 275 )

*** Start incrementalPlace ***
Active views:
  func_worst_scenario
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
[NR-eGR] Read 38282 nets ( ignored 0 )
[NR-eGR] There are 88 clock nets ( 0 with NDR ).
[NR-eGR] Layer group 1: route 38282 net(s) in layer range [2, 10]
[NR-eGR] Early Global Route overflow of layer group 1: 0.31% H + 0.02% V. EstWL: 8.576156e+05um
[NR-eGR] Overflow after Early Global Route 0.28% H + 0.00% V
[NR-eGR] Finished Early Global Route kernel ( CPU: 5.07 sec, Real: 2.72 sec, Curr Mem: 4.30 MB )
Early Global Route congestion estimation runtime: 2.73 seconds, mem = 4519.3M
Local HotSpot Analysis: normalized max congestion hotspot area = 0.00, normalized total congestion hotspot area = 0.00 (area is in unit of 4 std-cell row bins)
Skipped repairing congestion.
[NR-eGR] Total eGR-routed clock nets wire length: 24845um, number of vias: 11280
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR]               Length (um)    Vias 
[NR-eGR] ----------------------------------
[NR-eGR]  M1    (1H)             0  153565 
[NR-eGR]  M2    (2V)        209680  209088 
[NR-eGR]  M3    (3H)        302996   63003 
[NR-eGR]  M4    (4V)        124961   13751 
[NR-eGR]  M5    (5H)        132859    3726 
[NR-eGR]  M6    (6V)         46601    2021 
[NR-eGR]  M7    (7H)         67375     378 
[NR-eGR]  M8    (8V)          4076     138 
[NR-eGR]  M9    (9H)          9699       0 
[NR-eGR]  MRDL  (10V)            0       0 
[NR-eGR] ----------------------------------
[NR-eGR]        Total       898246  445670 
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR] Total half perimeter of net bounding box: 719019um
[NR-eGR] Total length: 898246um, number of vias: 445670
[NR-eGR] --------------------------------------------------------------------------
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Early Global Route wiring runtime: 0.66 seconds, mem = 4578.9M
0 delay mode for cte disabled.

*** Finished incrementalPlace (cpu=0:00:08.1, real=0:00:04.0)***
**ERROR: (IMPSP-9099):	Scan chains exist in this design but are not defined for 10.48% flops. Placement and timing QoR can be severely impacted in this case!
It is highly recommend to define scan chains either through input scan def (preferred) or specifyScanChain.
***** Total cpu  0:9:54
***** Total real time  0:2:34
Tdgp not enabled or already been cleared! skip clearing
**placeDesign ... cpu = 0: 9:54, real = 0: 2:34, mem = 4121.8M **
*** GlobalPlace #1 [finish] (place_opt_design #1) : cpu/real = 0:09:53.9/0:02:34.2 (3.9), totSession cpu/real = 0:13:09.5/0:06:54.0 (1.9), mem = 4121.8M
Enable CTE adjustment.
Enable Layer aware incrSKP.
**optDesign ... cpu = 0:00:00, real = 0:00:00, mem = 2911.6M, totSessionCpu=0:13:10 **
GigaOpt running with 8 threads.
*** InitOpt #1 [begin] (place_opt_design #1) : totSession cpu/real = 0:13:09.6/0:06:54.1 (1.9), mem = 4121.8M
**INFO: setDesignMode -flowEffort standard -> setting 'setOptMode -allEndPoints true' for the duration of this command.
**WARN: (IMPOPT-3668):	There are 48 nets with MSV violations, timing and DRV optimization of such nets is limited.  Please use verifyPowerDomain to analyze these further.
[GPS-MSV] Msv Violating net with fanout count = 1: I_RISC_CORE/I_REG_FILE_data_out_A[15]
[GPS-MSV] Timing and DRV optimization for this net is limited, Please correct the MSV violation. 
[GPS-MSV] UPF Flow. Number of Power Domains: 2
[GPS-MSV]   Power Domain 'PD_RISC_CORE' (tag=1)
[GPS-MSV]   Power Domain 'PD_ORCA_TOP' (tag=2) Default
RODC: v2.8s

**WARN: (IMPOPT-3564):	The following cells are set dont_use temporarily by the tool because there are no rows defined for their technology site, or they are not placeable in any power domain, or their pins cannot be snapped to the tracks. To avoid this message, review the floorplan, msv setting, the library setting or set manually those cells as dont_use.
	Cell FOOT2X16_HVT, site unit.
	Cell FOOT2X16_LVT, site unit.
	Cell FOOT2X16_RVT, site unit.
	Cell FOOT2X2_HVT, site unit.
	Cell FOOT2X2_LVT, site unit.
	Cell FOOT2X2_RVT, site unit.
	Cell FOOT2X32_HVT, site unit.
	Cell FOOT2X32_LVT, site unit.
	Cell FOOT2X32_RVT, site unit.
	Cell FOOT2X4_HVT, site unit.
	Cell FOOT2X4_LVT, site unit.
	Cell FOOT2X4_RVT, site unit.
	Cell FOOT2X8_HVT, site unit.
	Cell FOOT2X8_LVT, site unit.
	Cell FOOT2X8_RVT, site unit.
	Cell FOOTX16_HVT, site unit.
	Cell FOOTX16_LVT, site unit.
	Cell FOOTX16_RVT, site unit.
	Cell FOOTX2_HVT, site unit.
	Cell FOOTX2_LVT, site unit.
	...
	Reporting only the 20 first cells found...
.
Updating RC Grid density data for preRoute extraction ...
Initializing multi-corner capacitance tables ... 
Initializing multi-corner resistance tables ...
AAE DB initialization (MEM=4117.66 CPU=0:00:00.0 REAL=0:00:00.0) 
Info: Using SynthesisEngine executable '/pkgs/cadence/2024-03/DDI231/INNOVUS231/bin/innovus_'.
      SynthesisEngine workers will not check out additional licenses.

**INFO: Using Advanced Metric Collection system.
**optDesign ... cpu = 0:00:07, real = 0:00:33, mem = 2807.0M, totSessionCpu=0:13:16 **
#optDebug: { P: 90 W: 6195 FE: standard PE: none LDR: 1}
*** optDesign -preCTS ***
DRC Margin: user margin 0.0; extra margin 0.2
Setup Target Slack: user slack 0; extra slack 0.0
Hold Target Slack: user slack 0
**WARN: (IMPOPT-3195):	Analysis mode has changed.
Type 'man IMPOPT-3195' for more detail.

Multi-VT timing optimization disabled based on library information.
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
[NR-eGR] Started Early Global Route ( Curr Mem: 3.85 MB )
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
[NR-eGR] Started Early Global Route kernel ( Curr Mem: 3.85 MB )
[NR-eGR] Read rows... (mem=3.9M)
**WARN: (IMPPSP-1131):	For techSite unit, row: (0, 0) - (982528, 1672) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unit, row: (0, 1672) - (982528, 3344) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unit, row: (0, 3344) - (982528, 5016) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unit, row: (0, 5016) - (982528, 6688) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unit, row: (0, 6688) - (982528, 8360) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unit, row: (0, 8360) - (9880, 10032) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unit, row: (420128, 8360) - (982528, 10032) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unit, row: (0, 10032) - (9880, 11704) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unit, row: (0, 11704) - (9880, 13376) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unit, row: (0, 13376) - (9880, 15048) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unit, row: (0, 15048) - (9880, 16720) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unit, row: (0, 16720) - (9880, 18392) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unit, row: (0, 18392) - (9880, 20064) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unit, row: (0, 20064) - (9880, 21736) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unit, row: (0, 21736) - (9880, 23408) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unit, row: (0, 23408) - (9880, 25080) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unit, row: (0, 25080) - (9880, 26752) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unit, row: (0, 26752) - (9880, 28424) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unit, row: (0, 28424) - (9880, 30096) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unit, row: (0, 30096) - (9880, 31768) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: [NR-eGR] Only the first 20 messages are printed.
**WARN: (IMPPSP-1132):	For techSite unit, have a total of 118 rows defined outside of core-box
[NR-eGR] Done Read rows (cpu=0.000s, mem=3.9M)

[NR-eGR] Read module constraints... (mem=3.9M)
[NR-eGR] Done Read module constraints (cpu=0.000s, mem=3.9M)

[NR-eGR] Read 38282 nets ( ignored 0 )
[NR-eGR] There are 88 clock nets ( 0 with NDR ).
[NR-eGR] Layer group 1: route 38282 net(s) in layer range [2, 10]
[NR-eGR] Early Global Route overflow of layer group 1: 0.16% H + 0.02% V. EstWL: 8.658001e+05um
[NR-eGR] Overflow after Early Global Route 0.13% H + 0.00% V
[NR-eGR] Total eGR-routed clock nets wire length: 25533um, number of vias: 11302
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR]               Length (um)    Vias 
[NR-eGR] ----------------------------------
[NR-eGR]  M1    (1H)             0  153565 
[NR-eGR]  M2    (2V)        215060  210689 
[NR-eGR]  M3    (3H)        313821   62018 
[NR-eGR]  M4    (4V)        125498   13866 
[NR-eGR]  M5    (5H)        131465    3679 
[NR-eGR]  M6    (6V)         44750    2021 
[NR-eGR]  M7    (7H)         63377     371 
[NR-eGR]  M8    (8V)          3003     140 
[NR-eGR]  M9    (9H)         10416       0 
[NR-eGR]  MRDL  (10V)            0       0 
[NR-eGR] ----------------------------------
[NR-eGR]        Total       907390  446349 
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR] Total half perimeter of net bounding box: 719019um
[NR-eGR] Total length: 907390um, number of vias: 446349
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR] Finished Early Global Route kernel ( CPU: 8.52 sec, Real: 3.66 sec, Curr Mem: 3.96 MB )
[NR-eGR] Finished Early Global Route ( CPU: 8.58 sec, Real: 3.71 sec, Curr Mem: 3.86 MB )
Extraction called for design 'ORCA_TOP' of instances=35736 and nets=39266 using extraction engine 'preRoute' .
**WARN: (IMPEXT-3530):	The process node is not set. Use the command setDesignMode -process <process node> prior to extraction for maximum accuracy and optimal automatic threshold setting.
Type 'man IMPEXT-3530' for more detail.
PreRoute RC Extraction called for design ORCA_TOP.
RC Extraction called in multi-corner(2) mode.
RCMode: PreRoute
      RC Corner Indexes            0       1   
Capacitance Scaling Factor   : 1.00000 1.00000 
Resistance Scaling Factor    : 1.00000 1.00000 
Clock Cap. Scaling Factor    : 1.00000 1.00000 
Clock Res. Scaling Factor    : 1.00000 1.00000 
Shrink Factor                : 1.00000
PreRoute extraction is honoring NDR/Shielding/ExtraSpace for clock nets.
Using capacitance table file ...
Updating RC Grid density data for preRoute extraction ...
Initializing multi-corner capacitance tables ... 
Initializing multi-corner resistance tables ...
PreRoute RC Extraction DONE (CPU Time: 0:00:00.9  Real Time: 0:00:01.0  MEM: 4100.277M)
**WARN: (IMPOPT-3668):	There are 48 nets with MSV violations, timing and DRV optimization of such nets is limited.  Please use verifyPowerDomain to analyze these further.

Starting delay calculation for Setup views
AAE_INFO: opIsDesignInPostRouteState() is 0
#################################################################################
# Design Stage: PreRoute
# Design Name: ORCA_TOP
# Design Mode: 90nm
# Analysis Mode: MMMC Non-OCV 
# Parasitics Mode: No SPEF/RCDB 
# Signoff Settings: SI Off 
#################################################################################
Using master clock 'SDRAM_CLK' for generated clock 'SD_DDR_CLKn' in view 'test_worst_scenario'
Using master clock 'SDRAM_CLK' for generated clock 'SD_DDR_CLKn' in view 'func_worst_scenario'
Message <TCLCMD-1005> has exceeded the message display limit of '20'. Use 'set_message -no_limit -id list_of_msgIDs' to reset the message limit.
Calculate delays in BcWc mode...
Calculate delays in BcWc mode...
Start delay calculation (fullDC) (8 T). (MEM=3051.01)
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_DBTN59_n170, driver I_RISC_CORE/FE_DBTC59_n170/Y (cell INVX1_RVT) voltage 0.95 does not match receiver I_RISC_CORE/U1104/A2 (cell AND2X1_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_DBTN61_n169, driver I_RISC_CORE/FE_DBTC61_n169/Y (cell INVX1_RVT) voltage 0.95 does not match receiver I_RISC_CORE/U1104/A1 (cell AND2X1_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_DBTN60_n595, driver I_RISC_CORE/FE_DBTC60_n595/Y (cell INVX1_RVT) voltage 0.95 does not match receiver I_RISC_CORE/U335/A2 (cell OAI22X2_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_DBTN60_n595, driver I_RISC_CORE/FE_DBTC60_n595/Y (cell INVX1_RVT) voltage 0.95 does not match receiver I_RISC_CORE/U326/A1 (cell AND2X1_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_DBTN53_n470, driver I_RISC_CORE/FE_DBTC53_n470/Y (cell INVX1_RVT) voltage 0.95 does not match receiver I_RISC_CORE/U1281/A2 (cell OR3X2_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_DBTN53_n470, driver I_RISC_CORE/FE_DBTC53_n470/Y (cell INVX1_RVT) voltage 0.95 does not match receiver I_RISC_CORE/U764/A1 (cell AND3X1_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_DBTN52_n481, driver I_RISC_CORE/FE_DBTC52_n481/Y (cell INVX1_RVT) voltage 0.95 does not match receiver I_RISC_CORE/U1124/A2 (cell AND3X1_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_DBTN52_n481, driver I_RISC_CORE/FE_DBTC52_n481/Y (cell INVX1_RVT) voltage 0.95 does not match receiver I_RISC_CORE/U764/A2 (cell AND3X1_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_DBTN51_n784, driver I_RISC_CORE/FE_DBTC51_n784/Y (cell INVX1_RVT) voltage 0.95 does not match receiver I_RISC_CORE/U120/A3 (cell OA21X1_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_DBTN55_n304, driver I_RISC_CORE/FE_DBTC55_n304/Y (cell INVX1_RVT) voltage 0.95 does not match receiver I_RISC_CORE/U599/A2 (cell NOR3X0_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_DBTN59_n170, driver I_RISC_CORE/FE_DBTC59_n170/Y (cell INVX1_RVT) voltage 0.95 does not match receiver I_RISC_CORE/U372/A1 (cell NAND2X0_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_DBTN61_n169, driver I_RISC_CORE/FE_DBTC61_n169/Y (cell INVX1_RVT) voltage 0.95 does not match receiver I_RISC_CORE/U307/A2 (cell OR2X1_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_DBTN50_n1118, driver I_RISC_CORE/FE_DBTC50_n1118/Y (cell INVX1_RVT) voltage 0.95 does not match receiver I_RISC_CORE/U1220/A2 (cell XNOR2X1_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_DBTN56_n303, driver I_RISC_CORE/FE_DBTC56_n303/Y (cell INVX1_RVT) voltage 0.95 does not match receiver I_RISC_CORE/U570/A1 (cell XNOR2X1_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_DBTN57_n995, driver I_RISC_CORE/FE_DBTC57_n995/Y (cell INVX1_RVT) voltage 0.95 does not match receiver I_RISC_CORE/U431/A1 (cell AND2X2_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (EMS-27):	Message (IMPMSMV-1810) has exceeded the current message display limit of 20.
To increase the message display limit, refer to the product command reference manual.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_DBTN51_n784, driver I_RISC_CORE/FE_DBTC51_n784/Y (cell INVX1_RVT) voltage 0.95 does not match receiver I_RISC_CORE/U1010/A1 (cell NAND2X0_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_DBTN55_n304, driver I_RISC_CORE/FE_DBTC55_n304/Y (cell INVX1_RVT) voltage 0.95 does not match receiver I_RISC_CORE/U569/A2 (cell NOR2X1_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_DBTN59_n170, driver I_RISC_CORE/FE_DBTC59_n170/Y (cell INVX1_RVT) voltage 0.95 does not match receiver I_RISC_CORE/U310/A2 (cell AO21X1_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_DBTN58_n328, driver I_RISC_CORE/FE_DBTC58_n328/Y (cell INVX1_RVT) voltage 0.95 does not match receiver I_RISC_CORE/U597/A1 (cell XNOR2X1_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_DBTN50_n1118, driver I_RISC_CORE/FE_DBTC50_n1118/Y (cell INVX1_RVT) voltage 0.95 does not match receiver I_RISC_CORE/U1025/A2 (cell OA21X1_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_DBTN56_n303, driver I_RISC_CORE/FE_DBTC56_n303/Y (cell INVX1_RVT) voltage 0.95 does not match receiver I_RISC_CORE/U599/A3 (cell NOR3X0_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_DBTN54_n835, driver I_RISC_CORE/FE_DBTC54_n835/Y (cell INVX1_RVT) voltage 0.95 does not match receiver I_RISC_CORE/U541/A1 (cell NAND2X0_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
Total number of fetched objects 44861
AAE_INFO: Total number of nets for which stage creation was skipped for all views 0
End delay calculation. (MEM=3418.63 CPU=0:00:24.4 REAL=0:00:04.0)
End delay calculation (fullDC). (MEM=3284.01 CPU=0:00:33.1 REAL=0:00:11.0)
*** Done Building Timing Graph (cpu=0:00:52.4 real=0:00:15.0 totSessionCpu=0:14:22 mem=4768.9M)

------------------------------------------------------------------
             Initial Summary
------------------------------------------------------------------

Setup views included:
 test_worst_scenario func_worst_scenario 

+--------------------+---------+
|     Setup mode     |   all   |
+--------------------+---------+
|           WNS (ns):| -18.340 |
|           TNS (ns):|-815.046 |
|    Violating Paths:|   327   |
|          All Paths:|  9697   |
+--------------------+---------+

+----------------+-------------------------------+------------------+
|                |              Real             |       Total      |
|    DRVs        +------------------+------------+------------------|
|                |  Nr nets(terms)  | Worst Vio  |  Nr nets(terms)  |
+----------------+------------------+------------+------------------+
|   max_cap      |   1635 (1635)    |   -8.392   |   1673 (1673)    |
|   max_tran     |   3989 (17044)   |  -52.509   |   3989 (17047)   |
|   max_fanout   |      0 (0)       |     0      |      0 (0)       |
|   max_length   |      0 (0)       |     0      |      0 (0)       |
+----------------+------------------+------------+------------------+

Density: 39.298%
------------------------------------------------------------------
**optDesign ... cpu = 0:01:17, real = 0:00:57, mem = 3008.9M, totSessionCpu=0:14:26 **
*** InitOpt #1 [finish] (place_opt_design #1) : cpu/real = 0:01:17.2/0:00:56.9 (1.4), totSession cpu/real = 0:14:26.8/0:07:51.1 (1.8), mem = 4242.9M
** INFO : this run is activating medium effort placeOptDesign flow


*** Starting optimizing excluded clock nets MEM= 4242.9M) ***
*info: No excluded clock nets to be optimized.
*** Finished optimizing excluded clock nets (CPU Time= 0:00:01.3  MEM= 4242.9M) ***
GigaOpt Checkpoint: Internal congRefineRouteType -preCTS -congThreshold 0.001 -rescheduleForCongestion -numThreads 8 -resetVeryShortNets -resetShortNets -useSpineBased -rescheduleForAdherence -aggressiveCongestionMode
Begin: GigaOpt Route Type Constraints Refinement
*** CongRefineRouteType #1 [begin] (place_opt_design #1) : totSession cpu/real = 0:14:29.4/0:07:52.1 (1.8), mem = 4242.9M
Updated routing constraints on 0 nets.
Bottom Preferred Layer:
    None
Via Pillar Rule:
    None
*** CongRefineRouteType #1 [finish] (place_opt_design #1) : cpu/real = 0:00:00.6/0:00:00.3 (1.7), totSession cpu/real = 0:14:29.9/0:07:52.4 (1.8), mem = 4242.9M
End: GigaOpt Route Type Constraints Refinement
The useful skew maximum allowed delay is: 0.3
*** SimplifyNetlist #1 [begin] (place_opt_design #1) : totSession cpu/real = 0:14:39.4/0:07:56.2 (1.8), mem = 4504.6M
*info: Marking 98 level shifter instances dont touch
*info: Marking 0 isolation instances dont touch
Info: 88 clock nets excluded from IPO operation.



Footprint cell information for calculating maxBufDist
*info: There are 18 candidate always on buffer/inverter cells
*info: There are 23 candidate Buffer cells
*info: There are 15 candidate Inverter cells
Buffers found for each power domain:
	PowerDomain "PD_RISC_CORE" has 38 buffer(s) to use
	PowerDomain "PD_ORCA_TOP" has 38 buffer(s) to use
Always on buffers found for each power domain:
	PowerDomain "PD_RISC_CORE" (pd tag = "1") has 18 always on buffer(s) to use
	PowerDomain "PD_ORCA_TOP" (pd tag = "2") has 18 always on buffer(s) to use

	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 

Netlist preparation processing... 
Removed 0 instance
*info: Marking 0 isolation instances dont touch
*info: Marking 98 level shifter instances dont touch
*** SimplifyNetlist #1 [finish] (place_opt_design #1) : cpu/real = 0:00:07.1/0:00:05.7 (1.2), totSession cpu/real = 0:14:46.5/0:08:02.0 (1.8), mem = 4246.6M
Running new flow changes for HFN
Begin: GigaOpt high fanout net optimization
GigaOpt HFN: use maxLocalDensity 1.2
GigaOpt Checkpoint: Internal optDRV -useLevelizedBufferTreeOnly -auxMaxFanoutCountLimit 500 -largeScaleFixing -maxIter 1 -maxLocalDensity 1.2 -numThreads 8 -preCTS -preRouteDontEndWithRefinePlaceIncrSteinerRouteDC
*** DrvOpt #1 [begin] (place_opt_design #1) : totSession cpu/real = 0:14:46.8/0:08:02.3 (1.8), mem = 4246.6M
*info: Marking 98 level shifter instances dont touch
*info: Marking 0 isolation instances dont touch
Info: 88 clock nets excluded from IPO operation.


	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
**WARN: (IMPOPT-7330):	Net scan_enable has fanout exceed delaycal_use_default_delay_limit 1000, max-tran violations may increase due to buffering.
**WARN: (IMPOPT-7330):	Net n387 has fanout exceed delaycal_use_default_delay_limit 1000, max-tran violations may increase due to buffering.
**WARN: (IMPOPT-7330):	Net n586 has fanout exceed delaycal_use_default_delay_limit 1000, max-tran violations may increase due to buffering.
**WARN: (IMPOPT-7330):	Net n388 has fanout exceed delaycal_use_default_delay_limit 1000, max-tran violations may increase due to buffering.
**WARN: (IMPOPT-7330):	Net n389 has fanout exceed delaycal_use_default_delay_limit 1000, max-tran violations may increase due to buffering.
+---------+---------+--------+--------+------------+--------+
| Density | Commits |  WNS   |  TNS   |    Real    |  Mem   |
+---------+---------+--------+--------+------------+--------+
|   39.40%|        -| -18.340|-815.047|   0:00:00.0| 4636.6M|
**WARN: (IMPOPT-7330):	Net scan_enable has fanout exceed delaycal_use_default_delay_limit 1000, max-tran violations may increase due to buffering.
**WARN: (IMPOPT-7330):	Net n586 has fanout exceed delaycal_use_default_delay_limit 1000, max-tran violations may increase due to buffering.
**WARN: (IMPOPT-7330):	Net n387 has fanout exceed delaycal_use_default_delay_limit 1000, max-tran violations may increase due to buffering.
**WARN: (IMPOPT-7330):	Net n388 has fanout exceed delaycal_use_default_delay_limit 1000, max-tran violations may increase due to buffering.
**WARN: (IMPOPT-7330):	Net n389 has fanout exceed delaycal_use_default_delay_limit 1000, max-tran violations may increase due to buffering.
|   41.05%|     2761| -18.340|-10437.566|   0:00:06.0| 5054.3M|
+---------+---------+--------+--------+------------+--------+

*** Finish pre-CTS High Fanout Net Fixing (cpu=0:00:23.0 real=0:00:06.0 mem=5054.3M) ***
Bottom Preferred Layer:
    None
Via Pillar Rule:
    None


=======================================================================
                Reasons for remaining drv violations
=======================================================================
*info: Total 5 net(s) were new nets created by previous iteration of DRV buffering. Further DRV fixing might remove some violations.

*** DrvOpt #1 [finish] (place_opt_design #1) : cpu/real = 0:00:28.5/0:00:08.3 (3.4), totSession cpu/real = 0:15:15.2/0:08:10.6 (1.9), mem = 4487.0M
GigaOpt HFN: restore maxLocalDensity to 0.98
End: GigaOpt high fanout net optimization
**INFO: Always on buffers available for drv fixing
Begin: GigaOpt DRV Optimization
GigaOpt Checkpoint: Internal optDRV -max_tran -max_cap -maxLocalDensity 1.2 -numThreads 8 -largeScaleFixing -maxIter 2 -preCTS -preRouteDontEndWithRefinePlaceIncrSteinerRouteDC
*** DrvOpt #2 [begin] (place_opt_design #1) : totSession cpu/real = 0:15:17.3/0:08:11.7 (1.9), mem = 4487.0M
*info: Marking 98 level shifter instances dont touch
*info: Marking 0 isolation instances dont touch
Info: 88 clock nets excluded from IPO operation.


	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
|        max-tran       |        max-cap        |  max-fanout |  max-length |       setup       |        |        |        |       |          |         |
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
| nets | terms|  wViol  | nets | terms|  wViol  | nets | terms| nets | terms|   WNS   |   TNS   |  #Buf  |  #Inv  | #Resize|Density|   Real   |   Mem   |
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
|  4544| 15047|   -21.05|  2054|  4108|    -0.58|     0|     0|     0|     0|   -18.34|-10437.57|       0|       0|       0| 41.05%|          |         |
|     5|     5|    -0.04|    31|    62|    -0.00|     0|     0|     0|     0|    -0.46|    -6.55|    1630|     571|     639| 42.87%| 0:00:14.0|  5133.2M|
|     0|     0|     0.00|    10|    20|    -0.00|     0|     0|     0|     0|    -0.46|    -6.55|      11|       0|      19| 42.88%| 0:00:01.0|  5133.2M|
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
**WARN: (IMPOPT-3668):	There are 48 nets with MSV violations, timing and DRV optimization of such nets is limited.  Please use verifyPowerDomain to analyze these further.
Bottom Preferred Layer:
    None
Via Pillar Rule:
    None


=======================================================================
                Reasons for remaining drv violations
=======================================================================
*info: Total 9 net(s) have violations which can't be fixed by DRV optimization.

MultiBuffering failure reasons
------------------------------------------------
*info:     1 net(s): Could not be fixed because the net has MSV violation, use  'reportPowerDomain -net <netname> -verbose' to check details.

*info: Total 1 net(s) were new nets created by previous iteration of DRV buffering. Further DRV fixing might remove some violations.


*** Finish DRV Fixing (cpu=0:01:12 real=0:00:16.0 mem=5133.3M) ***

*** DrvOpt #2 [finish] (place_opt_design #1) : cpu/real = 0:01:18.4/0:00:19.0 (4.1), totSession cpu/real = 0:16:35.8/0:08:30.7 (1.9), mem = 4540.9M
End: GigaOpt DRV Optimization
GigaOpt DRV: restore maxLocalDensity to 0.98
**optDesign ... cpu = 0:03:26, real = 0:01:37, mem = 3294.2M, totSessionCpu=0:16:36 **

Active setup views:
 func_worst_scenario
  Dominating endpoints: 6050
  Dominating TNS: -1.819

 test_worst_scenario
  Dominating endpoints: 2797
  Dominating TNS: -4.899

Begin: GigaOpt Global Optimization
*info: use new DP (enabled)
GigaOpt Checkpoint: Internal globalOpt -maxLocalDensity 1.2 -numThreads 8 -preCTS -rebufferAll -preRouteDontEndWithRefinePlaceIncrSteinerRouteDC -enableHighLayerOpt -maxIter 50 -maxIterForLEPG 50
*info: Marking 98 level shifter instances dont touch
*info: Marking 0 isolation instances dont touch
Info: 88 clock nets excluded from IPO operation.
*** GlobalOpt #1 [begin] (place_opt_design #1) : totSession cpu/real = 0:16:39.1/0:08:32.6 (1.9), mem = 4802.6M


*info: 88 clock nets excluded
*info: Marking 98 level shifter instances dont touch
*info: Marking 0 isolation instances dont touch
*info: 1008 no-driver nets excluded.
** GigaOpt Global Opt WNS Slack -0.457  TNS Slack -6.545 
+--------+--------+---------+------------+--------+-------------------+---------+----------------------------------------------------+
|  WNS   |  TNS   | Density |    Real    |  Mem   |    Worst View     |Pathgroup|                     End Point                      |
+--------+--------+---------+------------+--------+-------------------+---------+----------------------------------------------------+
|  -0.457|  -6.545|   42.88%|   0:00:00.0| 4934.0M|func_worst_scenario|  default| I_SDRAM_TOP/I_SDRAM_WRITE_FIFO_SD_FIFO_CTL_U2_empt |
|        |        |         |            |        |                   |         | y_int_reg/D                                        |
|  -0.245|  -4.990|   42.89%|   0:00:02.0| 5130.1M|func_worst_scenario|  default| I_SDRAM_TOP/I_SDRAM_WRITE_FIFO_SD_FIFO_CTL_U2_empt |
|        |        |         |            |        |                   |         | y_int_reg/D                                        |
|  -0.245|  -4.990|   42.89%|   0:00:00.0| 5132.6M|func_worst_scenario|  default| I_SDRAM_TOP/I_SDRAM_WRITE_FIFO_SD_FIFO_CTL_U2_empt |
|        |        |         |            |        |                   |         | y_int_reg/D                                        |
|  -0.245|  -4.990|   42.89%|   0:00:00.0| 5132.6M|func_worst_scenario|  default| I_SDRAM_TOP/I_SDRAM_WRITE_FIFO_SD_FIFO_CTL_U2_empt |
|        |        |         |            |        |                   |         | y_int_reg/D                                        |
|  -0.172|  -4.652|   42.89%|   0:00:00.0| 5136.3M|test_worst_scenario|  default| sd_DQ_out[30]                                      |
|  -0.172|  -4.652|   42.89%|   0:00:01.0| 5136.4M|test_worst_scenario|  default| sd_DQ_out[30]                                      |
|  -0.172|  -4.652|   42.89%|   0:00:00.0| 5136.3M|test_worst_scenario|  default| sd_DQ_out[30]                                      |
|  -0.172|  -4.652|   42.89%|   0:00:00.0| 5136.3M|test_worst_scenario|  default| sd_DQ_out[30]                                      |
|  -0.172|  -4.652|   42.89%|   0:00:00.0| 5136.3M|test_worst_scenario|  default| sd_DQ_out[30]                                      |
|  -0.172|  -4.652|   42.89%|   0:00:01.0| 5136.4M|test_worst_scenario|  default| sd_DQ_out[30]                                      |
|  -0.172|  -4.652|   42.89%|   0:00:00.0| 5136.3M|test_worst_scenario|  default| sd_DQ_out[30]                                      |
|  -0.172|  -4.652|   42.89%|   0:00:00.0| 5136.3M|test_worst_scenario|  default| sd_DQ_out[30]                                      |
|  -0.172|  -4.652|   42.89%|   0:00:00.0| 5136.3M|test_worst_scenario|  default| sd_DQ_out[30]                                      |
|  -0.172|  -4.652|   42.89%|   0:00:00.0| 5136.4M|test_worst_scenario|  default| sd_DQ_out[30]                                      |
|  -0.172|  -4.652|   42.89%|   0:00:00.0| 5136.3M|test_worst_scenario|  default| sd_DQ_out[30]                                      |
|  -0.172|  -4.652|   42.89%|   0:00:00.0| 5136.3M|test_worst_scenario|  default| sd_DQ_out[30]                                      |
|  -0.172|  -4.652|   42.89%|   0:00:00.0| 5136.3M|test_worst_scenario|  default| sd_DQ_out[30]                                      |
|  -0.172|  -4.652|   42.89%|   0:00:01.0| 5136.4M|test_worst_scenario|  default| sd_DQ_out[30]                                      |
|  -0.172|  -4.652|   42.89%|   0:00:00.0| 5136.3M|test_worst_scenario|  default| sd_DQ_out[30]                                      |
|  -0.172|  -4.652|   42.89%|   0:00:00.0| 5136.3M|test_worst_scenario|  default| sd_DQ_out[30]                                      |
|  -0.172|  -4.652|   42.89%|   0:00:00.0| 5136.3M|test_worst_scenario|  default| sd_DQ_out[30]                                      |
|  -0.172|  -4.652|   42.89%|   0:00:00.0| 5136.4M|test_worst_scenario|  default| sd_DQ_out[30]                                      |
+--------+--------+---------+------------+--------+-------------------+---------+----------------------------------------------------+

*** Finish pre-CTS Global Setup Fixing (cpu=0:00:15.8 real=0:00:05.0 mem=5136.4M) ***

*** Finish pre-CTS Setup Fixing (cpu=0:00:15.8 real=0:00:05.0 mem=5136.4M) ***
Bottom Preferred Layer:
    None
Via Pillar Rule:
    None
** GigaOpt Global Opt End WNS Slack -0.172  TNS Slack -4.652 
*** GlobalOpt #1 [finish] (place_opt_design #1) : cpu/real = 0:00:21.6/0:00:08.9 (2.4), totSession cpu/real = 0:17:00.8/0:08:41.5 (2.0), mem = 4581.0M
End: GigaOpt Global Optimization
*** Timing NOT met, worst failing slack is -0.172
*** Check timing (0:00:00.0)
GigaOpt Checkpoint: Internal reclaim -numThreads 8 -preCTS -force -doRemoveUselessTerm -tgtSlackMult 3 -routeType -noRouteTypeResizePolish -noViewPrune -weedwhack -nonLegal -nativePathGroupFlow -SimpCCIn -GCompAndPhase
*info: Marking 98 level shifter instances dont touch
*info: Marking 0 isolation instances dont touch
Info: 88 clock nets excluded from IPO operation.


Begin: Area Reclaim Optimization
*** AreaOpt #1 [begin] (place_opt_design #1) : totSession cpu/real = 0:17:03.9/0:08:43.3 (2.0), mem = 4971.1M
Reclaim Optimization WNS Slack -0.172  TNS Slack -4.652 Density 42.89
+---------+---------+--------+--------+------------+--------+
| Density | Commits |  WNS   |  TNS   |    Real    |  Mem   |
+---------+---------+--------+--------+------------+--------+
|   42.89%|        -|  -0.172|  -4.652|   0:00:00.0| 4973.1M|
|   42.88%|       51|  -0.172|  -4.652|   0:00:04.0| 5131.2M|
|   42.88%|        1|  -0.172|  -4.652|   0:00:01.0| 5132.7M|
|   42.88%|        0|  -0.172|  -4.652|   0:00:00.0| 5132.7M|
|   42.80%|      127|  -0.172|  -4.652|   0:00:04.0| 5132.7M|
|   42.53%|     1819|  -0.172|  -4.652|   0:00:13.0| 5132.7M|
|   42.52%|       30|  -0.172|  -4.652|   0:00:02.0| 5132.7M|
|   42.52%|        2|  -0.172|  -4.652|   0:00:00.0| 5132.7M|
|   42.52%|        0|  -0.172|  -4.652|   0:00:01.0| 5132.7M|
|   42.52%|        0|  -0.172|  -4.652|   0:00:00.0| 5132.7M|
+---------+---------+--------+--------+------------+--------+
Reclaim Optimization End WNS Slack -0.172  TNS Slack -4.652 Density 42.52
Bottom Preferred Layer:
    None
Via Pillar Rule:
    None

Number of times islegalLocAvaiable called = 0 skipped = 0, called in commitmove = 0, skipped in commitmove = 0
End: Core Area Reclaim Optimization (cpu = 0:01:37) (real = 0:00:26.0) **
*** AreaOpt #1 [finish] (place_opt_design #1) : cpu/real = 0:01:36.7/0:00:26.6 (3.6), totSession cpu/real = 0:18:40.5/0:09:09.9 (2.0), mem = 5132.7M
Executing incremental physical updates
Executing incremental physical updates
End: Area Reclaim Optimization (cpu=0:01:37, real=0:00:26, mem=4584.38M, totSessionCpu=0:18:41).

*** IncrReplace #1 [begin] (place_opt_design #1) : totSession cpu/real = 0:18:42.2/0:09:11.2 (2.0), mem = 4584.4M

*** Start incrementalPlace ***
Active views:
  func_worst_scenario
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
[NR-eGR] Started Early Global Route kernel ( Curr Mem: 4.38 MB )
[NR-eGR] Read 43070 nets ( ignored 0 )
[NR-eGR] There are 88 clock nets ( 0 with NDR ).
[NR-eGR] Layer group 1: route 43070 net(s) in layer range [2, 10]
[NR-eGR] Early Global Route overflow of layer group 1: 0.18% H + 0.03% V. EstWL: 8.853524e+05um
[NR-eGR] Overflow after Early Global Route 0.14% H + 0.00% V
[NR-eGR] Finished Early Global Route kernel ( CPU: 5.05 sec, Real: 2.46 sec, Curr Mem: 4.41 MB )
Early Global Route congestion estimation runtime: 2.48 seconds, mem = 4623.3M
Local HotSpot Analysis: normalized max congestion hotspot area = 0.26, normalized total congestion hotspot area = 0.26 (area is in unit of 4 std-cell row bins)

=== incrementalPlace Internal Loop 1 ===
      flow.cputime  flow.realtime  timing.setup.tns  timing.setup.wns  snapshot
UM:*                                                                   incrNP_iter_start


Identified 419 spare or floating instances, with no clusters.
*** Finished SKP initialization (cpu=0:00:13.7, real=0:00:04.0)***
SKP will use view:
  func_worst_scenario
Iteration  8: Total net bbox = 8.020e+05 (4.86e+05 3.16e+05)
              Est.  stn bbox = 9.346e+05 (5.59e+05 3.75e+05)
              cpu = 0:01:03 real = 0:00:13.0 mem = 5167.6M
Iteration  9: Total net bbox = 8.247e+05 (5.02e+05 3.23e+05)
              Est.  stn bbox = 9.591e+05 (5.77e+05 3.83e+05)
              cpu = 0:01:10 real = 0:00:14.0 mem = 5160.6M
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
[NR-eGR] Started Early Global Route kernel ( Curr Mem: 4.84 MB )
Iteration 10: Total net bbox = 8.224e+05 (5.01e+05 3.21e+05)
              Est.  stn bbox = 9.555e+05 (5.75e+05 3.80e+05)
              cpu = 0:01:47 real = 0:00:19.0 mem = 5165.9M
Iteration 11: Total net bbox = 8.455e+05 (5.14e+05 3.32e+05)
              Est.  stn bbox = 9.789e+05 (5.88e+05 3.90e+05)
              cpu = 0:02:35 real = 0:00:28.0 mem = 5264.7M
Iteration 12: Total net bbox = 8.403e+05 (5.13e+05 3.27e+05)
              Est.  stn bbox = 9.723e+05 (5.87e+05 3.86e+05)
              cpu = 0:00:26.6 real = 0:00:05.0 mem = 5205.7M
Move report: Timing Driven Placement moves 39967 insts, mean move: 14.59 um, max move: 197.59 um 
	Max move on inst (I_SDRAM_TOP/I_SDRAM_IF/FE_OFC3094_sd_DQ_in_16): (1.37, 421.34) --> (147.10, 369.49)

Finished Incremental Placement (cpu=0:07:33, real=0:01:29, mem=4948.3M)
Begin: Reorder Scan Chains
**WARN: (IMPSC-1020):	Instance's output pin "snps_clk_chain_1/U2/Y" (Cell "AO22X1_RVT") has multiple corresponding input pins for scan tracing. Please specify the instance in scan DEF.  You can also apply "setScanReorderMode -compLogic true" to trace through the chain but it could be not exactly the chain that user needed.
**WARN: (IMPSC-1001):	Unable to trace scan chain "5". Check the information during tracing.
Type 'man IMPSC-1001' for more detail.
**WARN: (IMPSC-1020):	Instance's output pin "I_CLOCKING/snps_clk_chain_0/U2/Y" (Cell "AO22X1_RVT") has multiple corresponding input pins for scan tracing. Please specify the instance in scan DEF.  You can also apply "setScanReorderMode -compLogic true" to trace through the chain but it could be not exactly the chain that user needed.
**WARN: (IMPSC-1001):	Unable to trace scan chain "6". Check the information during tracing.
Type 'man IMPSC-1001' for more detail.
*** Scan Trace Summary (runtime: cpu: 0:00:00.0 , real: 0:00:00.0): 
Successfully traced 3 scan chains (total 4530 scan bits).
Start applying DEF ordered sections ...
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_PCI_TOP/I_PCI_READ_FIFO_PCI_FIFO_CTL_U1_count_int_reg_5_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_0/s3_op2_reg_25_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_0/s3_op2_reg_27_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_0/R_81" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_0/R_96_IP" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_0/R_77_IP" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_0/R_79_IP" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_0/mega_shift_reg_0__13_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_0/mega_shift_reg_0__4_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/R_540" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/s1_op1_reg_10_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/mega_shift_reg_0__22_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/mega_shift_reg_0__21_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/R_35_IP" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/R_673" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/R_43_IP" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/trans3_reg" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/R_676_IP" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/R_38_IP" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/R_567" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (EMS-27):	Message (IMPSC-1138) has exceeded the current message display limit of 20.
To increase the message display limit, refer to the product command reference manual.
**WARN: (IMPSC-1144):	Scan chain "5" was not traced through. Skip apply DEF ordered section.
**WARN: (IMPSC-1144):	Scan chain "6" was not traced through. Skip apply DEF ordered section.
**WARN: (IMPSC-1143):	Unable to apply DEF ordered sections for 2 scan chain(s). Check previous warning.
*** Scan Sanity Check Summary:
*** 3 scan chains passed sanity check.
**WARN: (IMPSC-1117):	Skip reordering scan chain "5" because tracing did not succeed.
**WARN: (IMPSC-1117):	Skip reordering scan chain "6" because tracing did not succeed.
*** Summary: Scan Reorder within scan chain
Initial total scan wire length:    44406.296 (floating:    34914.776)
Final   total scan wire length:    42360.926 (floating:    32869.406)
Improvement:     2045.370   percent  4.61 (floating improvement:     2045.370   percent  5.86)
Initial scan reorder max long connection: not available for -stitchChainsAfterFreeMerging
Final   scan reorder max long connection:      481.214
Total net length = 1.454e+06 (9.211e+05 5.330e+05) (ext = 1.762e+04)
*** End of ScanReorder (cpu=0:00:02.1, real=0:00:01.0, mem=5108.3M) ***
End: Reorder Scan Chains

*** Starting refinePlace (0:26:23 mem=5141.7M) ***
Total net bbox length = 8.712e+05 (5.373e+05 3.340e+05) (ext = 1.258e+04)
98 shifters were already placed.
98 shifters have been successfully placed.
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Move report: Detail placement moves 40065 insts, mean move: 0.41 um, max move: 42.56 um 
	Max move on inst (I_CONTEXT_MEM/icc_clock31): (412.69, 499.92) --> (455.24, 499.93)
	Runtime: CPU: 0:00:14.3 REAL: 0:00:06.0 MEM: 5109.7MB
Summary Report:
Instances move: 40065 (out of 40484 movable)
Instances flipped: 4
Mean displacement: 0.41 um
Max displacement: 42.56 um (Instance: I_CONTEXT_MEM/icc_clock31) (412.686, 499.923) -> (455.24, 499.928)
	Length: 5 sites, height: 1 rows, site name: unit, cell type: TIEH_HVT
Physical-only instances move: 0 (out of 0 movable physical-only)
Total net bbox length = 8.269e+05 (4.932e+05 3.338e+05) (ext = 1.273e+04)
Runtime: CPU: 0:00:14.5 REAL: 0:00:06.0 MEM: 5109.7MB
*** Finished refinePlace (0:26:37 mem=5109.7M) ***
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
[NR-eGR] Read 43070 nets ( ignored 0 )
[NR-eGR] There are 88 clock nets ( 0 with NDR ).
[NR-eGR] Layer group 1: route 43070 net(s) in layer range [2, 10]
[NR-eGR] Early Global Route overflow of layer group 1: 0.14% H + 0.03% V. EstWL: 9.113086e+05um
[NR-eGR] Overflow after Early Global Route 0.12% H + 0.00% V
[NR-eGR] Finished Early Global Route kernel ( CPU: 4.97 sec, Real: 2.44 sec, Curr Mem: 4.61 MB )
Early Global Route congestion estimation runtime: 2.49 seconds, mem = 4883.7M
Local HotSpot Analysis: normalized max congestion hotspot area = 0.26, normalized total congestion hotspot area = 0.26 (area is in unit of 4 std-cell row bins)
[NR-eGR] Total eGR-routed clock nets wire length: 23996um, number of vias: 11195
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR]               Length (um)    Vias 
[NR-eGR] ----------------------------------
[NR-eGR]  M1    (1H)             0  163058 
[NR-eGR]  M2    (2V)        228388  219834 
[NR-eGR]  M3    (3H)        337875   67725 
[NR-eGR]  M4    (4V)        138680   15212 
[NR-eGR]  M5    (5H)        140088    3880 
[NR-eGR]  M6    (6V)         43194    2106 
[NR-eGR]  M7    (7H)         60433     351 
[NR-eGR]  M8    (8V)          2511     127 
[NR-eGR]  M9    (9H)          6022       2 
[NR-eGR]  MRDL  (10V)            5       0 
[NR-eGR] ----------------------------------
[NR-eGR]        Total       957195  472295 
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR] Total half perimeter of net bounding box: 826941um
[NR-eGR] Total length: 957195um, number of vias: 472295
[NR-eGR] --------------------------------------------------------------------------
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Early Global Route wiring runtime: 0.89 seconds, mem = 4919.8M
0 delay mode for cte disabled.

*** Finished incrementalPlace (cpu=0:08:04, real=0:01:42)***
Start to check current routing status for nets...
All nets are already routed correctly.
End to check current routing status for nets (mem=4593.3M)
Extraction called for design 'ORCA_TOP' of instances=40524 and nets=44123 using extraction engine 'preRoute' .
**WARN: (IMPEXT-3530):	The process node is not set. Use the command setDesignMode -process <process node> prior to extraction for maximum accuracy and optimal automatic threshold setting.
Type 'man IMPEXT-3530' for more detail.
PreRoute RC Extraction called for design ORCA_TOP.
RC Extraction called in multi-corner(2) mode.
RCMode: PreRoute
      RC Corner Indexes            0       1   
Capacitance Scaling Factor   : 1.00000 1.00000 
Resistance Scaling Factor    : 1.00000 1.00000 
Clock Cap. Scaling Factor    : 1.00000 1.00000 
Clock Res. Scaling Factor    : 1.00000 1.00000 
Shrink Factor                : 1.00000
PreRoute extraction is honoring NDR/Shielding/ExtraSpace for clock nets.
Using capacitance table file ...
Updating RC Grid density data for preRoute extraction ...
Initializing multi-corner capacitance tables ... 
Initializing multi-corner resistance tables ...
PreRoute RC Extraction DONE (CPU Time: 0:00:01.0  Real Time: 0:00:01.0  MEM: 4596.301M)
Compute RC Scale Done ...
**optDesign ... cpu = 0:13:40, real = 0:04:03, mem = 3128.0M, totSessionCpu=0:26:49 **
Starting delay calculation for Setup views
AAE_INFO: opIsDesignInPostRouteState() is 0
#################################################################################
# Design Stage: PreRoute
# Design Name: ORCA_TOP
# Design Mode: 90nm
# Analysis Mode: MMMC Non-OCV 
# Parasitics Mode: No SPEF/RCDB 
# Signoff Settings: SI Off 
#################################################################################
Calculate delays in BcWc mode...
Calculate delays in BcWc mode...
Start delay calculation (fullDC) (8 T). (MEM=3269.25)
Total number of fetched objects 49649
AAE_INFO: Total number of nets for which stage creation was skipped for all views 0
End delay calculation. (MEM=3309.8 CPU=0:00:24.7 REAL=0:00:03.0)
End delay calculation (fullDC). (MEM=3309.8 CPU=0:00:31.5 REAL=0:00:05.0)
*** Done Building Timing Graph (cpu=0:00:43.3 real=0:00:08.0 totSessionCpu=0:27:32 mem=4999.5M)
*** IncrReplace #1 [finish] (place_opt_design #1) : cpu/real = 0:08:50.8/0:01:55.0 (4.6), totSession cpu/real = 0:27:33.0/0:11:06.2 (2.5), mem = 4568.5M
Set ::gpsPrivate::dogPBIsIncrReplaceDoneInMaster 1
**INFO: Always on buffers available for drv fixing
Begin: GigaOpt DRV Optimization
GigaOpt Checkpoint: Internal optDRV -max_tran -max_cap -maxLocalDensity 1.2 -numThreads 8 -smallScaleFixing -maxIter 3 -setupTNSCostFactor 3.0 -preCTS
*** DrvOpt #3 [begin] (place_opt_design #1) : totSession cpu/real = 0:27:36.0/0:11:07.1 (2.5), mem = 4592.5M
*info: Marking 98 level shifter instances dont touch
*info: Marking 0 isolation instances dont touch
Info: 88 clock nets excluded from IPO operation.


	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
|        max-tran       |        max-cap        |  max-fanout |  max-length |       setup       |        |        |        |       |          |         |
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
| nets | terms|  wViol  | nets | terms|  wViol  | nets | terms| nets | terms|   WNS   |   TNS   |  #Buf  |  #Inv  | #Resize|Density|   Real   |   Mem   |
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
|   162|   168|    -0.54|  1016|  2032|    -0.01|     0|     0|     0|     0|    -0.05|    -0.86|       0|       0|       0| 42.52%|          |         |
|     0|     0|     0.00|    13|    26|    -0.00|     0|     0|     0|     0|    -0.05|    -0.86|     307|      10|     791| 42.85%| 0:00:06.0|  5315.5M|
|     0|     0|     0.00|     7|    14|    -0.00|     0|     0|     0|     0|    -0.05|    -0.86|       0|       0|       6| 42.86%| 0:00:00.0|  5315.5M|
|     0|     0|     0.00|     7|    14|    -0.00|     0|     0|     0|     0|    -0.05|    -0.86|       0|       0|       0| 42.86%| 0:00:00.0|  5315.5M|
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
**WARN: (IMPOPT-3668):	There are 48 nets with MSV violations, timing and DRV optimization of such nets is limited.  Please use verifyPowerDomain to analyze these further.
Bottom Preferred Layer:
    None
Via Pillar Rule:
    None


=======================================================================
                Reasons for remaining drv violations
=======================================================================
*info: Total 7 net(s) have violations which can't be fixed by DRV optimization.


*** Finish DRV Fixing (cpu=0:00:39.8 real=0:00:08.0 mem=5315.5M) ***


*** Starting refinePlace (0:28:23 mem=5293.2M) ***
Total net bbox length = 8.295e+05 (4.941e+05 3.355e+05) (ext = 1.196e+04)
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Move report: Detail placement moves 1010 insts, mean move: 0.47 um, max move: 4.26 um 
	Max move on inst (I_RISC_CORE/FE_OFC2915_n_21): (397.18, 180.58) --> (399.76, 178.90)
	Runtime: CPU: 0:00:08.2 REAL: 0:00:03.0 MEM: 5312.0MB
Summary Report:
Instances move: 1010 (out of 40801 movable)
Instances flipped: 0
Mean displacement: 0.47 um
Max displacement: 4.26 um (Instance: I_RISC_CORE/FE_OFC2915_n_21) (397.176, 180.576) -> (399.76, 178.904)
	Length: 8 sites, height: 1 rows, site name: unit, cell type: NBUFFX2_LVT, constraint:Fence
Physical-only instances move: 0 (out of 0 movable physical-only)
Total net bbox length = 8.297e+05 (4.942e+05 3.355e+05) (ext = 1.196e+04)
Runtime: CPU: 0:00:08.4 REAL: 0:00:03.0 MEM: 5312.0MB
*** Finished refinePlace (0:28:31 mem=5312.0M) ***
*** maximum move = 4.26 um ***
*** Finished re-routing un-routed nets (5336.0M) ***


*** Finish Physical Update (cpu=0:00:11.3 real=0:00:05.0 mem=5336.3M) ***
*** DrvOpt #3 [finish] (place_opt_design #1) : cpu/real = 0:00:57.9/0:00:17.0 (3.4), totSession cpu/real = 0:28:34.0/0:11:24.1 (2.5), mem = 4770.0M
End: GigaOpt DRV Optimization
GigaOpt DRV: restore maxLocalDensity to 0.98
**WARN: (IMPOPT-3668):	There are 48 nets with MSV violations, timing and DRV optimization of such nets is limited.  Please use verifyPowerDomain to analyze these further.


------------------------------------------------------------------
     Summary (cpu=0.97min real=0.28min mem=4770.0M)
------------------------------------------------------------------

Setup views included:
 test_worst_scenario func_worst_scenario 

+--------------------+---------+---------+---------+---------+---------+---------+---------+
|     Setup mode     |   all   | reg2reg |reg2cgate| in2reg  | reg2out | in2out  | default |
+--------------------+---------+---------+---------+---------+---------+---------+---------+
|           WNS (ns):| -0.053  |  0.162  |  0.143  |  0.141  |  0.237  | -0.053  |  0.728  |
|           TNS (ns):| -0.857  |  0.000  |  0.000  |  0.000  |  0.000  | -0.857  |  0.000  |
|    Violating Paths:|   26    |    0    |    0    |    0    |    0    |   26    |    0    |
|          All Paths:|  9695   |  9447   |    8    |   126   |   114   |   32    |    8    |
+--------------------+---------+---------+---------+---------+---------+---------+---------+

+----------------+-------------------------------+------------------+
|                |              Real             |       Total      |
|    DRVs        +------------------+------------+------------------|
|                |  Nr nets(terms)  | Worst Vio  |  Nr nets(terms)  |
+----------------+------------------+------------+------------------+
|   max_cap      |      0 (0)       |   0.000    |     35 (35)      |
|   max_tran     |      0 (0)       |   0.000    |      0 (0)       |
|   max_fanout   |      0 (0)       |     0      |      0 (0)       |
|   max_length   |      0 (0)       |     0      |      0 (0)       |
+----------------+------------------+------------+------------------+

Density: 42.745%
Routing Overflow: 0.12% H and 0.00% V
------------------------------------------------------------------
**optDesign ... cpu = 0:15:30, real = 0:04:32, mem = 3359.6M, totSessionCpu=0:28:40 **
*** Timing NOT met, worst failing slack is -0.053
*** Check timing (0:00:00.0)
Begin: GigaOpt Optimization in WNS mode
GigaOpt Checkpoint: Internal optTiming -maxLocalDensity 1.0 -maxLocalDensityForHardenOpt 0.92 -numThreads 8 -preCTS -wtns -integratedAreaOpt -pgMode all -ipoTgtSlackCoef 1.5 -effTgtSlackCoef 1 -nativePathGroupFlow -NDROptEffortAuto -usefulSkew -nonLegalPlaceEcoBumpRecoveryInWNSOpt
*info: Marking 98 level shifter instances dont touch
*info: Marking 0 isolation instances dont touch
Info: 88 clock nets excluded from IPO operation.
*** WnsOpt #1 [begin] (place_opt_design #1) : totSession cpu/real = 0:28:40.5/0:11:26.3 (2.5), mem = 4770.0M


*info: 88 clock nets excluded
*info: Marking 98 level shifter instances dont touch
*info: Marking 0 isolation instances dont touch
*info: 1014 no-driver nets excluded.
** GigaOpt Optimizer WNS Slack -0.053 TNS Slack -0.857 Density 42.86
OptDebug: Start of Optimizer WNS Pass 0:
+-----------------------------+------+------+
|Path Group                   |   WNS|   TNS|
+-----------------------------+------+------+
|in2out in2reg reg2out default|-0.053|-0.857|
|reg2cgate                    | 0.143| 0.000|
|reg2reg                      | 0.162| 0.000|
|HEPG                         | 0.143| 0.000|
|All Paths                    |-0.053|-0.857|
+-----------------------------+------+------+

Active Path Group: in2out in2reg reg2out default 
+--------+---------+--------+---------+---------+------------+--------+-------------------+---------+----------------------------------------------------+
|  WNS   | All WNS |  TNS   | All TNS | Density |    Real    |  Mem   |    Worst View     |Pathgroup|                     End Point                      |
+--------+---------+--------+---------+---------+------------+--------+-------------------+---------+----------------------------------------------------+
|  -0.053|   -0.053|  -0.857|   -0.857|   42.86%|   0:00:00.0| 5160.0M|test_worst_scenario|   in2out| sd_DQ_out[30]                                      |
|   0.017|    0.141|   0.000|    0.000|   42.86%|   0:00:01.0| 5301.6M|                 NA|       NA| NA                                                 |
|   0.017|    0.141|   0.000|    0.000|   42.86%|   0:00:00.0| 5301.6M|test_worst_scenario|       NA| NA                                                 |
+--------+---------+--------+---------+---------+------------+--------+-------------------+---------+----------------------------------------------------+

*** Finish Core Optimize Step (cpu=0:00:00.9 real=0:00:01.0 mem=5301.6M) ***

*** Finished Optimize Step Cumulative (cpu=0:00:01.0 real=0:00:01.0 mem=5301.6M) ***
OptDebug: End of Optimizer WNS Pass 0:
+-----------------------------+-----+-----+
|Path Group                   |  WNS|  TNS|
+-----------------------------+-----+-----+
|in2out in2reg reg2out default|0.141|0.000|
|reg2cgate                    |0.143|0.000|
|reg2reg                      |0.162|0.000|
|HEPG                         |0.143|0.000|
|All Paths                    |0.141|0.000|
+-----------------------------+-----+-----+

** GigaOpt Optimizer WNS Slack 0.017 TNS Slack 0.000 Density 42.86

*** Starting refinePlace (0:28:57 mem=5299.3M) ***
Total net bbox length = 8.297e+05 (4.942e+05 3.355e+05) (ext = 1.196e+04)
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer

Starting Small incrNP...
Skipped incrNP (cpu=0:00:00.1, real=0:00:00.0, mem=5267.3M)
End of Small incrNP (cpu=0:00:00.1, real=0:00:00.0)
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Move report: Detail placement moves 0 insts, mean move: 0.00 um, max move: 0.00 um 
	Runtime: CPU: 0:00:06.4 REAL: 0:00:02.0 MEM: 5276.8MB
Summary Report:
Instances move: 0 (out of 40801 movable)
Instances flipped: 0
Mean displacement: 0.00 um
Max displacement: 0.00 um 
Physical-only instances move: 0 (out of 0 movable physical-only)
Total net bbox length = 8.297e+05 (4.942e+05 3.355e+05) (ext = 1.196e+04)
Runtime: CPU: 0:00:06.7 REAL: 0:00:03.0 MEM: 5276.8MB
*** Finished refinePlace (0:29:04 mem=5276.8M) ***
*** maximum move = 0.00 um ***
*** Finished re-routing un-routed nets (5300.9M) ***


*** Finish Physical Update (cpu=0:00:10.0 real=0:00:05.0 mem=5301.1M) ***
** GigaOpt Optimizer WNS Slack 0.017 TNS Slack 0.000 Density 42.86
OptDebug: End of Setup Fixing:
+-----------------------------+-----+-----+
|Path Group                   |  WNS|  TNS|
+-----------------------------+-----+-----+
|in2out in2reg reg2out default|0.141|0.000|
|reg2cgate                    |0.143|0.000|
|reg2reg                      |0.162|0.000|
|HEPG                         |0.143|0.000|
|All Paths                    |0.141|0.000|
+-----------------------------+-----+-----+

Bottom Preferred Layer:
    None
Via Pillar Rule:
    None

*** Finish pre-CTS Setup Fixing (cpu=0:00:22.4 real=0:00:08.0 mem=5301.1M) ***

*** WnsOpt #1 [finish] (place_opt_design #1) : cpu/real = 0:00:27.4/0:00:11.7 (2.3), totSession cpu/real = 0:29:07.8/0:11:38.1 (2.5), mem = 4776.8M
End: GigaOpt Optimization in WNS mode
*** Timing Is met
*** Check timing (0:00:00.0)
GigaOpt Checkpoint: Internal reclaim -numThreads 8 -customPhyUpdate -noGCompAndPhase -ensureOneAreaReclaim -force -svrReclaim -rtrShortNets -allowDegradingShortNetRemoval -preCTS -tgtSlackMult 2 -wtns -noRouteTypeResizePolish -noViewPrune -nativePathGroupFlow
*info: Marking 98 level shifter instances dont touch
*info: Marking 0 isolation instances dont touch
Info: 88 clock nets excluded from IPO operation.


Begin: Area Reclaim Optimization
*** AreaOpt #2 [begin] (place_opt_design #1) : totSession cpu/real = 0:29:10.2/0:11:39.6 (2.5), mem = 5166.8M
Reclaim Optimization WNS Slack 0.000  TNS Slack 0.000 Density 42.86
+---------+---------+--------+--------+------------+--------+
| Density | Commits |  WNS   |  TNS   |    Real    |  Mem   |
+---------+---------+--------+--------+------------+--------+
|   42.86%|        -|   0.000|   0.000|   0:00:00.0| 5166.8M|
|   42.86%|        0|   0.000|   0.000|   0:00:00.0| 5166.8M|
|   42.72%|      215|   0.000|   0.000|   0:00:07.0| 5319.5M|
|   42.68%|      209|   0.000|   0.000|   0:00:05.0| 5323.2M|
|   42.68%|        5|   0.000|   0.000|   0:00:01.0| 5323.2M|
|   42.68%|        0|   0.000|   0.000|   0:00:00.0| 5323.2M|
|   42.68%|        0|   0.000|   0.000|   0:00:01.0| 5323.2M|
+---------+---------+--------+--------+------------+--------+
Reclaim Optimization End WNS Slack 0.000  TNS Slack 0.000 Density 42.68
Bottom Preferred Layer:
    None
Via Pillar Rule:
    None

Number of times islegalLocAvaiable called = 652 skipped = 0, called in commitmove = 214, skipped in commitmove = 0
End: Core Area Reclaim Optimization (cpu = 0:00:50.2) (real = 0:00:15.0) **

*** Starting refinePlace (0:30:01 mem=5322.9M) ***
Total net bbox length = 8.288e+05 (4.936e+05 3.351e+05) (ext = 1.235e+04)
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Move report: Detail placement moves 0 insts, mean move: 0.00 um, max move: 0.00 um 
	Runtime: CPU: 0:00:04.8 REAL: 0:00:02.0 MEM: 5290.9MB
Summary Report:
Instances move: 0 (out of 40574 movable)
Instances flipped: 0
Mean displacement: 0.00 um
Max displacement: 0.00 um 
Physical-only instances move: 0 (out of 0 movable physical-only)
Total net bbox length = 8.288e+05 (4.936e+05 3.351e+05) (ext = 1.235e+04)
Runtime: CPU: 0:00:05.0 REAL: 0:00:02.0 MEM: 5290.9MB
*** Finished refinePlace (0:30:06 mem=5290.9M) ***
*** maximum move = 0.00 um ***
*** Finished re-routing un-routed nets (5322.9M) ***


*** Finish Physical Update (cpu=0:00:07.7 real=0:00:03.0 mem=5323.2M) ***
*** AreaOpt #2 [finish] (place_opt_design #1) : cpu/real = 0:00:58.0/0:00:18.6 (3.1), totSession cpu/real = 0:30:08.2/0:11:58.2 (2.5), mem = 5323.2M
End: Area Reclaim Optimization (cpu=0:00:58, real=0:00:19, mem=4780.92M, totSessionCpu=0:30:09).
Begin: GigaOpt postEco DRV Optimization
GigaOpt Checkpoint: Internal optDRV -inPostEcoStage -smallScaleFixing -maxIter 3 -max_tran -max_cap -maxLocalDensity 0.98 -numThreads 8 -preRouteDontEndWithRefinePlaceIncrSteinerRouteDC -setupTNSCostFactor 1.0 -preCTS
*** DrvOpt #4 [begin] (place_opt_design #1) : totSession cpu/real = 0:30:09.2/0:11:59.0 (2.5), mem = 4780.9M
*info: Marking 98 level shifter instances dont touch
*info: Marking 0 isolation instances dont touch
Info: 88 clock nets excluded from IPO operation.


	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
|        max-tran       |        max-cap        |  max-fanout |  max-length |       setup       |        |        |        |       |          |         |
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
| nets | terms|  wViol  | nets | terms|  wViol  | nets | terms| nets | terms|   WNS   |   TNS   |  #Buf  |  #Inv  | #Resize|Density|   Real   |   Mem   |
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
|     0|     0|     0.00|     8|    16|    -0.00|     0|     0|     0|     0|     0.14|     0.00|       0|       0|       0| 42.68%|          |         |
|     0|     0|     0.00|     7|    14|    -0.00|     0|     0|     0|     0|     0.14|     0.00|       0|       0|       1| 42.68%| 0:00:01.0|  5344.9M|
|     0|     0|     0.00|     7|    14|    -0.00|     0|     0|     0|     0|     0.14|     0.00|       0|       0|       0| 42.68%| 0:00:00.0|  5348.0M|
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
**WARN: (IMPOPT-3668):	There are 48 nets with MSV violations, timing and DRV optimization of such nets is limited.  Please use verifyPowerDomain to analyze these further.
Bottom Preferred Layer:
    None
Via Pillar Rule:
    None


=======================================================================
                Reasons for remaining drv violations
=======================================================================
*info: Total 7 net(s) have violations which can't be fixed by DRV optimization.


*** Finish DRV Fixing (cpu=0:00:05.3 real=0:00:01.0 mem=5348.0M) ***

*** DrvOpt #4 [finish] (place_opt_design #1) : cpu/real = 0:00:10.8/0:00:04.0 (2.7), totSession cpu/real = 0:30:19.9/0:12:03.0 (2.5), mem = 4782.7M
End: GigaOpt postEco DRV Optimization
Running refinePlace -preserveRouting true

*** Starting refinePlace (0:30:21 mem=4782.7M) ***
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer

Starting Small incrNP...
Skipped incrNP (cpu=0:00:00.1, real=0:00:00.0, mem=4750.7M)
End of Small incrNP (cpu=0:00:00.1, real=0:00:00.0)
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Move report: Detail placement moves 0 insts, mean move: 0.00 um, max move: 0.00 um 
	Runtime: CPU: 0:00:06.6 REAL: 0:00:03.0 MEM: 4760.2MB
Summary Report:
Instances move: 0 (out of 40574 movable)
Instances flipped: 0
Mean displacement: 0.00 um
Max displacement: 0.00 um 
Physical-only instances move: 0 (out of 0 movable physical-only)
Runtime: CPU: 0:00:06.9 REAL: 0:00:03.0 MEM: 4760.2MB
*** Finished refinePlace (0:30:28 mem=4760.2M) ***
Register exp ratio and priority group on 0 nets on 43176 nets : 

Active setup views:
 func_worst_scenario
  Dominating endpoints: 6086
  Dominating TNS: -0.000

 test_worst_scenario
  Dominating endpoints: 2763
  Dominating TNS: -0.000

Extraction called for design 'ORCA_TOP' of instances=40614 and nets=44220 using extraction engine 'preRoute' .
**WARN: (IMPEXT-3530):	The process node is not set. Use the command setDesignMode -process <process node> prior to extraction for maximum accuracy and optimal automatic threshold setting.
Type 'man IMPEXT-3530' for more detail.
PreRoute RC Extraction called for design ORCA_TOP.
RC Extraction called in multi-corner(2) mode.
RCMode: PreRoute
      RC Corner Indexes            0       1   
Capacitance Scaling Factor   : 1.00000 1.00000 
Resistance Scaling Factor    : 1.00000 1.00000 
Clock Cap. Scaling Factor    : 1.00000 1.00000 
Clock Res. Scaling Factor    : 1.00000 1.00000 
Shrink Factor                : 1.00000
PreRoute extraction is honoring NDR/Shielding/ExtraSpace for clock nets.
Using capacitance table file ...
Grid density data update skipped
Initializing multi-corner capacitance tables ... 
Initializing multi-corner resistance tables ...
PreRoute RC Extraction DONE (CPU Time: 0:00:01.0  Real Time: 0:00:01.0  MEM: 4600.250M)
Skewing Data Summary (End_of_FINAL)

Skew summary for view test_worst_scenario:
* Accumulated skew : count = 0

Skew summary for view func_worst_scenario:
* Accumulated skew : count = 0

Starting delay calculation for Setup views
AAE_INFO: opIsDesignInPostRouteState() is 0
#################################################################################
# Design Stage: PreRoute
# Design Name: ORCA_TOP
# Design Mode: 90nm
# Analysis Mode: MMMC Non-OCV 
# Parasitics Mode: No SPEF/RCDB 
# Signoff Settings: SI Off 
#################################################################################
Calculate delays in BcWc mode...
Calculate delays in BcWc mode...
Start delay calculation (fullDC) (8 T). (MEM=3324.79)
Total number of fetched objects 49739
AAE_INFO: Total number of nets for which stage creation was skipped for all views 0
End delay calculation. (MEM=3362.6 CPU=0:00:25.7 REAL=0:00:04.0)
End delay calculation (fullDC). (MEM=3362.6 CPU=0:00:32.3 REAL=0:00:05.0)
*** Done Building Timing Graph (cpu=0:00:43.8 real=0:00:08.0 totSessionCpu=0:31:29 mem=5063.9M)
OPTC: user 20.0
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
[NR-eGR] Read 43160 nets ( ignored 0 )
[NR-eGR] There are 88 clock nets ( 0 with NDR ).
[NR-eGR] Layer group 1: route 43160 net(s) in layer range [2, 10]
[NR-eGR] Early Global Route overflow of layer group 1: 0.14% H + 0.02% V. EstWL: 9.109340e+05um
[NR-eGR] Overflow after Early Global Route 0.12% H + 0.00% V
[NR-eGR] Finished Early Global Route kernel ( CPU: 4.83 sec, Real: 2.45 sec, Curr Mem: 4.39 MB )
[NR-eGR] Finished Early Global Route ( CPU: 4.85 sec, Real: 2.47 sec, Curr Mem: 4.36 MB )
[hotspot] +------------+---------------+---------------+
[hotspot] |            |   max hotspot | total hotspot |
[hotspot] +------------+---------------+---------------+
[hotspot] | normalized |          0.26 |          0.26 |
[hotspot] +------------+---------------+---------------+
Local HotSpot Analysis: normalized max congestion hotspot area = 0.26, normalized total congestion hotspot area = 0.26 (area is in unit of 4 std-cell row bins)
[hotspot] top 1 congestion hotspot bounding boxes and scores of normalized hotspot
[hotspot] +-----+-------------------------------------+---------------+-------------------------------+
[hotspot] | top |            hotspot bbox             | hotspot score |           module              |
[hotspot] +-----+-------------------------------------+---------------+-------------------------------+
[hotspot] |  1  |     0.00   334.40    26.75   361.15 |        0.26   | I_PCI_TOP                     |
[hotspot] +-----+-------------------------------------+---------------+-------------------------------+
[hotspot] Hotspot report including placement blocked areas
[hotspot] +------------+---------------+---------------+
[hotspot] |            |   max hotspot | total hotspot |
[hotspot] +------------+---------------+---------------+
[hotspot] | normalized |          0.79 |          2.36 |
[hotspot] +------------+---------------+---------------+
Local HotSpot Analysis (blockage included): normalized max congestion hotspot area = 0.79, normalized total congestion hotspot area = 2.36 (area is in unit of 4 std-cell row bins)
[hotspot] top 3 congestion hotspot bounding boxes and scores of normalized hotspot
[hotspot] +-----+-------------------------------------+---------------+-------------------------------+
[hotspot] | top |            hotspot bbox             | hotspot score |           module              |
[hotspot] +-----+-------------------------------------+---------------+-------------------------------+
[hotspot] |  1  |   214.02   401.28   240.77   428.03 |        1.31   | I_CONTEXT_MEM                 |
[hotspot] +-----+-------------------------------------+---------------+-------------------------------+
[hotspot] |  2  |   254.14   387.90   280.90   414.66 |        0.79   | I_CONTEXT_MEM                 |
[hotspot] +-----+-------------------------------------+---------------+-------------------------------+
[hotspot] |  3  |     0.00   334.40    26.75   361.15 |        0.26   | I_PCI_TOP                     |
[hotspot] +-----+-------------------------------------+---------------+-------------------------------+
Reported timing to dir ./timingReports
**optDesign ... cpu = 0:18:26, real = 0:05:30, mem = 3297.0M, totSessionCpu=0:31:36 **
**WARN: (IMPOPT-3668):	There are 48 nets with MSV violations, timing and DRV optimization of such nets is limited.  Please use verifyPowerDomain to analyze these further.


------------------------------------------------------------------
     optDesign Final Summary
------------------------------------------------------------------

Setup views included:
 test_worst_scenario func_worst_scenario 

+--------------------+---------+---------+---------+---------+---------+---------+---------+
|     Setup mode     |   all   | reg2reg |reg2cgate| in2reg  | reg2out | in2out  | default |
+--------------------+---------+---------+---------+---------+---------+---------+---------+
|           WNS (ns):|  0.140  |  0.161  |  0.143  |  0.140  |  0.237  |  0.368  |  0.728  |
|           TNS (ns):|  0.000  |  0.000  |  0.000  |  0.000  |  0.000  |  0.000  |  0.000  |
|    Violating Paths:|    0    |    0    |    0    |    0    |    0    |    0    |    0    |
|          All Paths:|  9697   |  9448   |    8    |   127   |   114   |   32    |    8    |
+--------------------+---------+---------+---------+---------+---------+---------+---------+

+----------------+-------------------------------+------------------+
|                |              Real             |       Total      |
|    DRVs        +------------------+------------+------------------|
|                |  Nr nets(terms)  | Worst Vio  |  Nr nets(terms)  |
+----------------+------------------+------------+------------------+
|   max_cap      |      0 (0)       |   0.000    |     35 (35)      |
|   max_tran     |      0 (0)       |   0.000    |      0 (0)       |
|   max_fanout   |      0 (0)       |     0      |      0 (0)       |
|   max_length   |      0 (0)       |     0      |      0 (0)       |
+----------------+------------------+------------+------------------+

Density: 42.570%
Routing Overflow: 0.12% H and 0.00% V
------------------------------------------------------------------
Begin: Collecting metrics
 -------------------------------------------------------------------------------------------------------------------------------------------------------- 
| Snapshot                | WNS                  | TNS                  | Density (%) | Hotspot                   | Resource               | DRVs        |
|                         | HEPG (ns) | ALL (ns) | HEPG (ns) | ALL (ns) |             | Max (bins) | Total (bins) | Real (s) | Memory (MB) | Tran | Cap  |
|-------------------------+-----------+----------+-----------+----------+-------------+------------+--------------+----------+-------------+------+------|
| initial_summary         |           |  -18.340 |           |     -815 |       39.30 |            |              | 0:00:16  |        4247 | 3989 | 1635 |
| route_type_refinement   |           |          |           |          |             |            |              | 0:00:01  |        4243 |      |      |
| simplify_netlist        |           |          |           |          |             |            |              | 0:00:06  |        4247 |      |      |
| drv_fixing              |   -18.340 |  -18.340 |    -10438 |   -10438 |       41.05 |            |              | 0:00:08  |        4487 |      |      |
| drv_fixing_2            |    -0.457 |   -0.457 |        -7 |       -7 |       42.88 |            |              | 0:00:19  |        4541 |    0 |   10 |
| global_opt              |           |   -0.172 |           |       -5 |       42.88 |            |              | 0:00:09  |        4581 |      |      |
| area_reclaiming         |    -0.172 |   -0.172 |        -5 |       -5 |       42.52 |            |              | 0:00:27  |        4584 |      |      |
| incremental_replacement |           |   -0.053 |           |       -1 |             |       0.26 |         0.26 | 0:01:55  |        4623 |      |      |
| drv_fixing_3            |    -0.053 |   -0.053 |        -1 |       -1 |       42.75 |            |              | 0:00:19  |        4770 |    0 |    0 |
| wns_fixing              |     0.143 |    0.000 |         0 |        0 |       42.86 |            |              | 0:00:13  |        5302 |      |      |
| area_reclaiming_2       |     0.143 |    0.141 |         0 |        0 |       42.68 |            |              | 0:00:20  |        4781 |      |      |
| drv_eco_fixing          |     0.143 |    0.141 |         0 |        0 |       42.68 |            |              | 0:00:04  |        4783 |    0 |    7 |
| final_summary           |     0.143 |    0.140 |           |        0 |       42.57 |       0.79 |         2.36 | 0:00:14  |        4640 |    0 |    0 |
 -------------------------------------------------------------------------------------------------------------------------------------------------------- 
End: Collecting metrics
**optDesign ... cpu = 0:18:47, real = 0:05:41, mem = 3321.1M, totSessionCpu=0:31:57 **
**WARN: (IMPOPT-3195):	Analysis mode has changed.
Type 'man IMPOPT-3195' for more detail.
*** Finished optDesign ***
      flow.cputime  flow.realtime  timing.setup.tns  timing.setup.wns  snapshot
UM:*                                                                   final
      flow.cputime  flow.realtime  timing.setup.tns  timing.setup.wns  snapshot
UM:*                                                                   opt_design_prects
Info: final physical memory for 9 CRR processes is 923.48MB.
Info: Summary of CRR changes:
      - Timing transform commits:       0
Removing temporary dont_use automatically set for cells with technology sites with no row.
Disable CTE adjustment.
Disable Layer aware incrSKP.
#optDebug: fT-D <X 1 0 0 0>
**place_opt_design ... cpu = 0:28:46, real = 0:08:37, mem = 4555.8M **
*** Finished GigaPlace ***

*** Summary of all messages that are not suppressed in this session:
Severity  ID               Count  Summary                                  
WARNING   IMPMSMV-1810      2964  Net %s, driver %s (cell %s) voltage %g d...
WARNING   IMPEXT-3493          1  The design extraction status has been re...
WARNING   IMPEXT-3530          3  The process node is not set. Use the com...
ERROR     IMPSP-9099           2  Scan chains exist in this design but are...
WARNING   IMPSC-1001          24  Unable to trace scan chain "%s". Check t...
WARNING   IMPSC-1105           2  Unable to skip buffer for scan chain "%s...
WARNING   IMPSC-1138        1170  In scan chain "%s" DEF ordered section, ...
WARNING   IMPSC-1108           2  Unable to update netlist with reordered ...
WARNING   IMPSC-1143           7  Unable to apply DEF ordered sections for...
WARNING   IMPSC-1144          22  Scan chain "%s" was not traced through. ...
WARNING   IMPSC-1117          12  Skip reordering scan chain "%s" because ...
WARNING   IMPSC-1020          24  Instance's output pin "%s/%s" (Cell "%s"...
WARNING   IMPOPT-3668          7  There are %d nets with MSV violations, t...
WARNING   IMPOPT-3195          2  Analysis mode has changed.               
WARNING   IMPOPT-7330         10  Net %s has fanout exceed delaycal_use_de...
WARNING   IMPOPT-3564          1  The following cells are set dont_use tem...
WARNING   IMPPSP-1131         20  For techSite %s, row: (%d, %d) - (%d, %d...
WARNING   IMPPSP-1132          1  For techSite %s, have a total of %d rows...
*** Message Summary: 4272 warning(s), 2 error(s)

*** place_opt_design #1 [finish] () : cpu/real = 0:28:45.8/0:08:37.1 (3.3), totSession cpu/real = 0:32:00.6/0:12:56.5 (2.5), mem = 4555.8M
#% End place_opt_design (date=06/12 01:58:39, total cpu=0:28:46, real=0:08:37, peak res=3656.1M, current mem=3205.9M)
Usage: (24.4%H 10.0%V) = (5.776e+05um 4.875e+05um) = (345438 291560)
Overflow: 285 = 274 (0.13% H) + 12 (0.01% V)

Congestion distribution:

Remain	cntH		cntV
--------------------------------------
 -5:	1	 0.00%	0	 0.00%
 -4:	1	 0.00%	0	 0.00%
 -3:	22	 0.01%	2	 0.00%
 -2:	17	 0.01%	1	 0.00%
 -1:	207	 0.10%	7	 0.00%
--------------------------------------
  0:	5673	 2.72%	15	 0.01%
  1:	32944	15.80%	323	 0.15%
  2:	32278	15.48%	3257	 1.56%
  3:	19741	 9.47%	18960	 9.06%
  4:	8405	 4.03%	28333	13.54%
  5:	109167	52.37%	158430	75.69%
[hotspot] +------------+---------------+---------------+
[hotspot] |            |   max hotspot | total hotspot |
[hotspot] +------------+---------------+---------------+
[hotspot] | normalized |          0.79 |          2.36 |
[hotspot] +------------+---------------+---------------+
Local HotSpot Analysis (blockage included): normalized max congestion hotspot area = 0.79, normalized total congestion hotspot area = 2.36 (area is in unit of 4 std-cell row bins)
[hotspot] top 3 congestion hotspot bounding boxes and scores of normalized hotspot
[hotspot] +-----+-------------------------------------+---------------+-------------------------------+
[hotspot] | top |            hotspot bbox             | hotspot score |           module              |
[hotspot] +-----+-------------------------------------+---------------+-------------------------------+
[hotspot] |  1  |   214.02   401.28   240.77   428.03 |        1.31   | I_CONTEXT_MEM                 |
[hotspot] +-----+-------------------------------------+---------------+-------------------------------+
[hotspot] |  2  |   254.14   387.90   280.90   414.66 |        0.79   | I_CONTEXT_MEM                 |
[hotspot] +-----+-------------------------------------+---------------+-------------------------------+
[hotspot] |  3  |     0.00   334.40    26.75   361.15 |        0.26   | I_PCI_TOP                     |
[hotspot] +-----+-------------------------------------+---------------+-------------------------------+
                       OverCon           OverCon            
                        #Gcell            #Gcell     %Gcell
       Layer             (1-2)             (3-4)    OverCon
---------------------------------------------------------------
     M1 ( 1)         0( 0.00%)         0( 0.00%)   ( 0.00%) 
     M2 ( 2)        66( 0.05%)         6( 0.00%)   ( 0.06%) 
     M3 ( 3)      1164( 0.93%)        28( 0.02%)   ( 0.95%) 
     M4 ( 4)        15( 0.01%)         1( 0.00%)   ( 0.01%) 
     M5 ( 5)       277( 0.22%)         3( 0.00%)   ( 0.22%) 
     M6 ( 6)        40( 0.02%)         2( 0.00%)   ( 0.02%) 
     M7 ( 7)       258( 0.13%)        26( 0.01%)   ( 0.14%) 
     M8 ( 8)         1( 0.00%)         0( 0.00%)   ( 0.00%) 
     M9 ( 9)         2( 0.00%)         0( 0.00%)   ( 0.00%) 
   MRDL (10)         0( 0.00%)         0( 0.00%)   ( 0.00%) 
---------------------------------------------------------------
       Total      1823( 0.14%)        66( 0.01%)   ( 0.14%) 
---------------------------------------------------------------
2D Overflow 0.12% H + 0.00% V
[hotspot] +----------------+-------------------+-------------------+-------------------------------------+
[hotspot] |      layer     |    max hotspot    |   total hotspot   |            hotspot bbox             |
[hotspot] +----------------+-------------------+-------------------+-------------------------------------+
[hotspot] |       M1(H)    |              0.00 |              0.00 |   (none)                            |
[hotspot] |       M2(V)    |              0.26 |              0.26 |   949.70    40.13   976.45    66.88 |
[hotspot] |       M3(H)    |              7.21 |             22.16 |   240.77   147.14   267.52   173.89 |
[hotspot] |       M4(V)    |              0.00 |              0.00 |   (none)                            |
[hotspot] |       M5(H)    |              0.26 |              0.52 |   227.39   133.76   254.14   160.51 |
[hotspot] |       M6(V)    |              0.00 |              0.00 |   (none)                            |
[hotspot] |       M7(H)    |              4.59 |             14.03 |   214.02   401.28   240.77   428.03 |
[hotspot] |       M8(V)    |              0.00 |              0.00 |   (none)                            |
[hotspot] |       M9(H)    |              0.00 |              0.00 |   (none)                            |
[hotspot] |     MRDL(V)    |              0.00 |              0.00 |   (none)                            |
[hotspot] +----------------+-------------------+-------------------+-------------------------------------+
[hotspot] |      worst     |     (M3)     7.21 |     (M3)    22.16 |                                     |
[hotspot] +----------------+-------------------+-------------------+-------------------------------------+
[hotspot] |   all layers   |              1.05 |              4.46 |                                     |
[hotspot] +----------------+-------------------+-------------------+-------------------------------------+
Local HotSpot Analysis (blockage included) (3d): normalized congestion max/total hotspot area = 1.05/4.46 (area is in unit of 4 std-cell row bins)
[hotspot] top 5 congestion hotspot bounding boxes and scores of all layers hotspot
[hotspot] +-----+-------------------------------------+---------------+-------------------------------+
[hotspot] | top |            hotspot bbox             | hotspot score |           module              |
[hotspot] +-----+-------------------------------------+---------------+-------------------------------+
[hotspot] |  1  |   214.02   401.28   240.77   428.03 |        1.57   | I_CONTEXT_MEM                 |
[hotspot] +-----+-------------------------------------+---------------+-------------------------------+
[hotspot] |  2  |   240.77   133.76   267.52   160.51 |        1.05   | I_RISC_CORE                   |
[hotspot] +-----+-------------------------------------+---------------+-------------------------------+
[hotspot] |  3  |   254.14   387.90   280.90   414.66 |        0.79   | I_CONTEXT_MEM                 |
[hotspot] +-----+-------------------------------------+---------------+-------------------------------+
[hotspot] |  4  |   321.02   160.51   347.78   187.26 |        0.52   | I_RISC_CORE                   |
[hotspot] +-----+-------------------------------------+---------------+-------------------------------+
[hotspot] |  5  |     0.00   334.40    26.75   361.15 |        0.26   | I_PCI_TOP                     |
[hotspot] +-----+-------------------------------------+---------------+-------------------------------+
**WARN: (IMPOPT-3668):	There are 48 nets with MSV violations, timing and DRV optimization of such nets is limited.  Please use verifyPowerDomain to analyze these further.
*** timeDesign #1 [begin] () : totSession cpu/real = 0:32:01.7/0:12:57.5 (2.5), mem = 4555.8M
Start to check current routing status for nets...
All nets are already routed correctly.
End to check current routing status for nets (mem=4555.8M)
**WARN: (IMPOPT-3668):	There are 48 nets with MSV violations, timing and DRV optimization of such nets is limited.  Please use verifyPowerDomain to analyze these further.


------------------------------------------------------------------
          timeDesign Summary
------------------------------------------------------------------

Setup views included:
 test_worst_scenario func_worst_scenario 

+--------------------+---------+---------+---------+---------+---------+---------+---------+
|     Setup mode     |   all   | reg2reg |reg2cgate| in2reg  | reg2out | in2out  | default |
+--------------------+---------+---------+---------+---------+---------+---------+---------+
|           WNS (ns):|  0.140  |  0.161  |  0.143  |  0.140  |  0.237  |  0.368  |  0.728  |
|           TNS (ns):|  0.000  |  0.000  |  0.000  |  0.000  |  0.000  |  0.000  |  0.000  |
|    Violating Paths:|    0    |    0    |    0    |    0    |    0    |    0    |    0    |
|          All Paths:|  9697   |  9448   |    8    |   127   |   114   |   32    |    8    |
+--------------------+---------+---------+---------+---------+---------+---------+---------+
|test_worst_scenario |  0.143  |  0.661  |  0.143  |  0.798  |  0.237  |  0.455  | 14.762  |
|                    |  0.000  |  0.000  |  0.000  |  0.000  |  0.000  |  0.000  |  0.000  |
|                    |    0    |    0    |    0    |    0    |    0    |    0    |    0    |
|                    |  3508   |  3337   |    8    |   53    |   114   |   32    |    4    |
+--------------------+---------+---------+---------+---------+---------+---------+---------+
|func_worst_scenario |  0.140  |  0.161  |   N/A   |  0.140  |  0.237  |  0.368  |  0.728  |
|                    |  0.000  |  0.000  |   N/A   |  0.000  |  0.000  |  0.000  |  0.000  |
|                    |    0    |    0    |   N/A   |    0    |    0    |    0    |    0    |
|                    |  6550   |  6326   |   N/A   |   110   |   110   |   32    |    4    |
+--------------------+---------+---------+---------+---------+---------+---------+---------+

+----------------+-------------------------------+------------------+
|                |              Real             |       Total      |
|    DRVs        +------------------+------------+------------------|
|                |  Nr nets(terms)  | Worst Vio  |  Nr nets(terms)  |
+----------------+------------------+------------+------------------+
|   max_cap      |      0 (0)       |   0.000    |     35 (35)      |
|   max_tran     |      0 (0)       |   0.000    |      0 (0)       |
|   max_fanout   |      0 (0)       |     0      |      0 (0)       |
|   max_length   |      0 (0)       |     0      |      0 (0)       |
+----------------+------------------+------------+------------------+

Density: 42.570%
Routing Overflow: 0.13% H and 0.01% V
------------------------------------------------------------------
Reported timing to dir ../reports/ORCA_TOP.innovus
Total CPU time: 25.11 sec
Total Real time: 11.0 sec
Total Memory Usage: 4557.800781 Mbytes
*** timeDesign #1 [finish] () : cpu/real = 0:00:24.9/0:00:11.5 (2.2), totSession cpu/real = 0:32:26.6/0:13:09.0 (2.5), mem = 4557.8M

powerDomain PD_ORCA_TOP : bins with density > 0.750 = 37.38 % ( 794 / 2124 )
bin size: 110 sites by 10 row(s). total 2124 bins ( 59 by 36 )
  density range     #bins    %
  (0.750 - 0.800]     233  10.97
  (0.800 - 0.850]      37   1.74
  (0.850 - 0.900]      37   1.74
  (0.900 - 0.950]      31   1.46
  (0.950 - 1.000]     456  21.47
  total               794  37.38

powerDomain PD_RISC_CORE : bins with density > 0.750 = 56.00 % ( 154 / 275 )
bin size: 110 sites by 10 row(s). total 275 bins ( 25 by 11 )
  density range     #bins    %
  (0.750 - 0.800]       7   2.55
  (0.800 - 0.850]       3   1.09
  (0.850 - 0.900]       8   2.91
  (0.950 - 1.000]     136  49.45
  total               154  56.00

Density distribution unevenness ratio = 19.965%
Start to collect the design information.
Build netlist information for Cell ORCA_TOP.
Finished collecting the design information.
Generating macro cells used in the design report.
Generating standard cells used in the design report.
Analyze library ... 
Analyze netlist ... 
Generating HFO information report.
Generate no-driven nets information report.
Analyze timing ... 
Analyze floorplan/placement ... 
Analysis Routing ...
Report saved in file ../reports/ORCA_TOP.innovus.place.summary.rpt
#% Begin save design ... (date=06/12 01:58:53, mem=3212.6M)
INFO: Current data have to be saved into a temporary db: 'ORCA_TOP_place.innovus.dat.tmp' first. It will be renamed to the correct name 'ORCA_TOP_place.innovus.dat' after the old db was deleted.
% Begin Save ccopt configuration ... (date=06/12 01:58:53, mem=3212.6M)
% End Save ccopt configuration ... (date=06/12 01:58:53, total cpu=0:00:00.1, real=0:00:00.0, peak res=3212.6M, current mem=3212.5M)
% Begin Save netlist data ... (date=06/12 01:58:53, mem=3212.5M)
Writing Binary DB to ORCA_TOP_place.innovus.dat.tmp/vbin/ORCA_TOP.v.bin in multi-threaded mode...
% End Save netlist data ... (date=06/12 01:58:53, total cpu=0:00:00.4, real=0:00:00.0, peak res=3212.5M, current mem=3212.5M)
Saving symbol-table file in separate thread ...
Saving congestion map file in separate thread ...
Saving congestion map file ORCA_TOP_place.innovus.dat.tmp/ORCA_TOP.route.congmap.gz ...
% Begin Save AAE data ... (date=06/12 01:58:53, mem=3213.3M)
Saving AAE Data ...
% End Save AAE data ... (date=06/12 01:58:53, total cpu=0:00:00.1, real=0:00:00.0, peak res=3213.3M, current mem=3212.6M)
Saving preference file ORCA_TOP_place.innovus.dat.tmp/gui.pref.tcl ...
Saving mode setting ...
Saving global file ...
*info - save blackBox cells to lef file ORCA_TOP_place.innovus.dat.tmp/ORCA_TOP.bbox.lef
Saving Drc markers ...
... 475 markers are saved ...
... 0 geometry drc markers are saved ...
... 0 antenna drc markers are saved ...
Saving SCANDEF file ...
**WARN: (IMPSC-1020):	Instance's output pin "snps_clk_chain_1/U2/Y" (Cell "AO22X1_RVT") has multiple corresponding input pins for scan tracing. Please specify the instance in scan DEF.  You can also apply "setScanReorderMode -compLogic true" to trace through the chain but it could be not exactly the chain that user needed.
**WARN: (IMPSC-1001):	Unable to trace scan chain "5". Check the information during tracing.
Type 'man IMPSC-1001' for more detail.
**WARN: (IMPSC-1020):	Instance's output pin "I_CLOCKING/snps_clk_chain_0/U2/Y" (Cell "AO22X1_RVT") has multiple corresponding input pins for scan tracing. Please specify the instance in scan DEF.  You can also apply "setScanReorderMode -compLogic true" to trace through the chain but it could be not exactly the chain that user needed.
**WARN: (IMPSC-1001):	Unable to trace scan chain "6". Check the information during tracing.
Type 'man IMPSC-1001' for more detail.
*** Scan Trace Summary (runtime: cpu: 0:00:00.1 , real: 0:00:00.0): 
Successfully traced 3 scan chains (total 4530 scan bits).
Start applying DEF ordered sections ...
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_PCI_TOP/I_PCI_READ_FIFO_PCI_FIFO_CTL_U1_count_int_reg_5_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_0/R_573" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_0/s3_op2_reg_25_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_0/s3_op2_reg_27_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_0/R_81" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_0/R_96_IP" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_0/R_77_IP" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_0/R_79_IP" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_0/mega_shift_reg_0__13_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_0/mega_shift_reg_0__4_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/R_540" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/s1_op1_reg_10_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/mega_shift_reg_0__22_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/mega_shift_reg_0__21_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/R_35_IP" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/R_673" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/R_43_IP" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/trans3_reg" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/R_676_IP" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/R_38_IP" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (EMS-27):	Message (IMPSC-1138) has exceeded the current message display limit of 20.
To increase the message display limit, refer to the product command reference manual.
**WARN: (IMPSC-1144):	Scan chain "5" was not traced through. Skip apply DEF ordered section.
**WARN: (IMPSC-1144):	Scan chain "6" was not traced through. Skip apply DEF ordered section.
**WARN: (IMPSC-1143):	Unable to apply DEF ordered sections for 2 scan chain(s). Check previous warning.
*** Scan Sanity Check Summary:
*** 3 scan chains passed sanity check.
Saving special route data file in separate thread ...
Saving PG file in separate thread ...
Saving placement file in separate thread ...
Saving route file in separate thread ...
Saving property file in separate thread ...
Saving property file ORCA_TOP_place.innovus.dat.tmp/ORCA_TOP.prop
Saving PG file ORCA_TOP_place.innovus.dat.tmp/ORCA_TOP.pg.gz, version#2, (Created by Innovus v23.10-p003_1 on Wed Jun 12 01:58:59 2024)
** Saving stdCellPlacement_binary (version# 2) ...
Save Adaptive View Pruning View Names to Binary file
func_worst_scenario
TAT_INFO: ::saveSpecialRoute REAL = 0 : CPU = 0 : MEM = 0.
*** Completed saveProperty (cpu=0:00:00.5 real=0:00:00.0 mem=4828.4M) ***
*** Completed savePGFile (cpu=0:00:00.5 real=0:00:00.0 mem=4828.4M) ***
TAT_INFO: ::savePGFile REAL = 0 : CPU = 0 : MEM = 0.
TAT_INFO: ::savePlace REAL = 0 : CPU = 0 : MEM = 0.
*** Completed saveRoute (cpu=0:00:01.0 real=0:00:01.0 mem=4812.4M) ***
TAT_INFO: ::saveRoute REAL = 1 : CPU = 0 : MEM = 0.
TAT_INFO: ::db::saveAnnotationAndProp REAL = 0 : CPU = 0 : MEM = 0.
Saving rc congestion map ORCA_TOP_place.innovus.dat.tmp/ORCA_TOP.congmap.gz ...
Saving power intent database ...
TAT_INFO: ::db::saveSymbolTable REAL = 1 : CPU = 0 : MEM = 0.
TAT_INFO: ::saveCongMap REAL = 1 : CPU = 0 : MEM = 0.
% Begin Save power constraints data ... (date=06/12 01:59:02, mem=3234.9M)
% End Save power constraints data ... (date=06/12 01:59:02, total cpu=0:00:00.1, real=0:00:00.0, peak res=3234.9M, current mem=3234.9M)
Generated self-contained design ORCA_TOP_place.innovus.dat.tmp
#% End save design ... (date=06/12 01:59:09, total cpu=0:00:09.7, real=0:00:16.0, peak res=3236.1M, current mem=3236.1M)

*** Summary of all messages that are not suppressed in this session:
Severity  ID               Count  Summary                                  
WARNING   IMPSC-1001           2  Unable to trace scan chain "%s". Check t...
WARNING   IMPSC-1138         134  In scan chain "%s" DEF ordered section, ...
WARNING   IMPSC-1143           1  Unable to apply DEF ordered sections for...
WARNING   IMPSC-1144           2  Scan chain "%s" was not traced through. ...
WARNING   IMPSC-1020           2  Instance's output pin "%s/%s" (Cell "%s"...
*** Message Summary: 141 warning(s), 0 error(s)

######## FINISHED PLACE #################
##  Process: 28            (User Set)               
##     Node: (not set)                           

##  Check design process and node:  
##  Design tech node is not set.

Applying the recommended capacitance filtering threshold values for 28nm process node: total_c_th=0, relative_c_th=1 and coupling_c_th=0.1.
	These values will be used by all post-route extraction engines, including TQuantus, IQuantus and Quantus QRC extraction.
	Capacitance filtering mode(-capFilterMode option of the setExtractRCMode) is 'relAndCoup' for all engines.
	The accuracy mode for postRoute effortLevel low extraction will be set to 'high'.
	Default value for EffortLevel(-effortLevel option of the setExtractRCMode) in postRoute extraction mode will be 'medium' if Quantus QRC technology file is specified else 'low'.
**WARN: (IMPEXT-6191):	Using a captable file is not recommended for process nodes less than or equal to 32 nm due to parasitic accuracy concerns. The Quantus QRC technology file should be specified for all RC corners using the command create_rc_corner or update_rc_corner, which will then be used for preRoute and postRoute(effort level medium or high or signoff) extraction engines.
Type 'man IMPEXT-6191' for more detail.
Start generating vias ..
#Skip building auto via since it is not turned on.
Extracting standard cell pins and blockage ...... 
Pin and blockage extraction finished
Via generation completed.
Creating clock tree spec for modes (timing configs): test_worst_mode func_worst_mode test_best_mode func_best_mode
extract_clock_generator_skew_groups=true: create_ccopt_clock_tree_spec will generate skew groups with a name prefix of "_clock_gen" to balance clock generator connected flops with the clock generator they drive.
Reset timing graph...
Ignoring AAE DB Resetting ...
Reset timing graph done.
Ignoring AAE DB Resetting ...
Analyzing clock structure...
**WARN: (IMPCCOPT-4144):	The SDC clock SD_DDR_CLK has source pin sd_CK, which is an input pin. Clock trees for this clock will be defined under the corresponding output pins instead.
Type 'man IMPCCOPT-4144' for more detail.
**WARN: (IMPCCOPT-4144):	The SDC clock SD_DDR_CLKn has source pin sd_CKn, which is an input pin. Clock trees for this clock will be defined under the corresponding output pins instead.
Type 'man IMPCCOPT-4144' for more detail.
**WARN: (IMPCCOPT-4144):	The SDC clock SD_DDR_CLK has source pin sd_CK, which is an input pin. Clock trees for this clock will be defined under the corresponding output pins instead.
Type 'man IMPCCOPT-4144' for more detail.
**WARN: (IMPCCOPT-4144):	The SDC clock SD_DDR_CLKn has source pin sd_CKn, which is an input pin. Clock trees for this clock will be defined under the corresponding output pins instead.
Type 'man IMPCCOPT-4144' for more detail.
**WARN: (IMPCCOPT-4144):	The SDC clock SD_DDR_CLK has source pin sd_CK, which is an input pin. Clock trees for this clock will be defined under the corresponding output pins instead.
Type 'man IMPCCOPT-4144' for more detail.
**WARN: (IMPCCOPT-4144):	The SDC clock SD_DDR_CLKn has source pin sd_CKn, which is an input pin. Clock trees for this clock will be defined under the corresponding output pins instead.
Type 'man IMPCCOPT-4144' for more detail.
**WARN: (IMPCCOPT-4144):	The SDC clock SD_DDR_CLK has source pin sd_CK, which is an input pin. Clock trees for this clock will be defined under the corresponding output pins instead.
Type 'man IMPCCOPT-4144' for more detail.
**WARN: (IMPCCOPT-4144):	The SDC clock SD_DDR_CLKn has source pin sd_CKn, which is an input pin. Clock trees for this clock will be defined under the corresponding output pins instead.
Type 'man IMPCCOPT-4144' for more detail.
Analyzing clock structure done.
Reset timing graph...
Ignoring AAE DB Resetting ...
Reset timing graph done.
Wrote: ccopt.spec
Extracting original clock gating for ate_clk...
  clock_tree ate_clk contains 3514 sinks and 22 clock gates.
    Found 32 clock convergence points while defining clock tree.
Extracting original clock gating for ate_clk done.
Extracting original clock gating for SYS_2x_CLK...
  clock_tree SYS_2x_CLK contains 205 sinks and 17 clock gates.
Extracting original clock gating for SYS_2x_CLK done.
Extracting original clock gating for SDRAM_CLK...
  clock_tree SDRAM_CLK contains 2919 sinks and 3 clock gates.
    Found 32 clock convergence points while defining clock tree.
Extracting original clock gating for SDRAM_CLK done.
Extracting original clock gating for PCI_CLK...
  clock_tree PCI_CLK contains 401 sinks and 1 clock gates.
Extracting original clock gating for PCI_CLK done.
Extracting original clock gating for SYS_CLK...
  clock_tree SYS_CLK contains 10 sinks and 1 clock gates.
Extracting original clock gating for SYS_CLK done.
Found 1 generator input for clock tree SYS_CLK.
The skew group PCI_CLK/test_worst_mode was created. It contains 401 sinks and 1 sources.
The skew group SDRAM_CLK/test_worst_mode was created. It contains 2887 sinks and 1 sources.
The skew group SYS_2x_CLK/test_worst_mode was created. It contains 214 sinks and 1 sources.
Added 1 ignore pin (of 1 specified) to skew group SYS_2x_CLK/test_worst_mode. Skew group now contains 1 ignore pin.
The skew group SYS_CLK/test_worst_mode was created. It contains 10 sinks and 1 sources.
The skew group ate_clk/test_worst_mode was created. It contains 3482 sinks and 1 sources.
Added 1 ignore pin (of 1 specified) to skew group ate_clk/test_worst_mode. Skew group now contains 1 ignore pin.
The skew group PCI_CLK/func_worst_mode was created. It contains 401 sinks and 1 sources.
The skew group SDRAM_CLK/func_worst_mode was created. It contains 2887 sinks and 1 sources.
The skew group SYS_2x_CLK/func_worst_mode was created. It contains 214 sinks and 1 sources.
Added 1 ignore pin (of 1 specified) to skew group SYS_2x_CLK/func_worst_mode. Skew group now contains 1 ignore pin.
The skew group SYS_CLK/func_worst_mode was created. It contains 10 sinks and 1 sources.
The skew group PCI_CLK/test_best_mode was created. It contains 401 sinks and 1 sources.
The skew group SDRAM_CLK/test_best_mode was created. It contains 2887 sinks and 1 sources.
The skew group SYS_2x_CLK/test_best_mode was created. It contains 214 sinks and 1 sources.
The skew group SYS_CLK/test_best_mode was created. It contains 10 sinks and 1 sources.
The skew group ate_clk/test_best_mode was created. It contains 3482 sinks and 1 sources.
The skew group PCI_CLK/func_best_mode was created. It contains 401 sinks and 1 sources.
The skew group SDRAM_CLK/func_best_mode was created. It contains 2887 sinks and 1 sources.
The skew group SYS_2x_CLK/func_best_mode was created. It contains 214 sinks and 1 sources.
The skew group SYS_CLK/func_best_mode was created. It contains 10 sinks and 1 sources.
Checking clock tree convergence...
Checking clock tree convergence done.
**WARN: (IMPCCOPT-2415):	The parameter '-no_symmetry_buffers' for command 'create_ccopt_flexible_htree' is deprecated. It still works, but it may be removed in a future release. Instead, use '-omit_symmetry drivers' (see documentation).
Initializing...
  Validating CTS configuration...
  Using cell based legalization.
  Initializing placement interface...
    Use check_library -place or consult logv if problems occur.
    Leaving CCOpt scope - Initializing placement interface...

    Leaving CCOpt scope - Initializing placement interface done. (took cpu=0:00:00.7 real=0:00:00.4)
  Initializing placement interface done.
  Leaving CCOpt scope - Cleaning up placement interface...
  Leaving CCOpt scope - Cleaning up placement interface done. (took cpu=0:00:00.4 real=0:00:00.1)
  Leaving CCOpt scope - Initializing placement interface...

  Leaving CCOpt scope - Initializing placement interface done. (took cpu=0:00:00.5 real=0:00:00.3)
Max route layer is changed from 127 to 10 because there is no routing track above this layer
[PSP]    Load db... (mem=4.3M)
[PSP]    Read data from FE... (mem=4.3M)
[PSP]    Read rows... (mem=4.3M)
**WARN: (IMPPSP-1131):	For techSite unitdouble, row: (0, 0) - (982528, 3344) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unitdouble, row: (0, 3344) - (982528, 6688) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unitdouble, row: (0, 6688) - (982528, 10032) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unitdouble, row: (0, 581856) - (982528, 585200) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unitdouble, row: (0, 585200) - (982528, 588544) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unitdouble, row: (0, 588544) - (982528, 591888) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1132):	For techSite unitdouble, have a total of 6 rows defined outside of core-box
**WARN: (IMPPSP-1131):	For techSite unit, row: (0, 0) - (982528, 1672) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unit, row: (0, 1672) - (982528, 3344) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unit, row: (0, 3344) - (982528, 5016) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unit, row: (0, 5016) - (982528, 6688) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unit, row: (0, 6688) - (982528, 8360) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unit, row: (0, 8360) - (9880, 10032) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unit, row: (420128, 8360) - (982528, 10032) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unit, row: (0, 10032) - (9880, 11704) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unit, row: (0, 11704) - (9880, 13376) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unit, row: (0, 13376) - (9880, 15048) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unit, row: (0, 15048) - (9880, 16720) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unit, row: (0, 16720) - (9880, 18392) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unit, row: (0, 18392) - (9880, 20064) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unit, row: (0, 20064) - (9880, 21736) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: [PSP]    Only the first 20 messages are printed.
**WARN: (IMPPSP-1132):	For techSite unit, have a total of 118 rows defined outside of core-box
[PSP]    Done Read rows (cpu=0.000s, mem=4.3M)

[PSP]    Read module constraints... (mem=4.3M)
[PSP]    Done Read module constraints (cpu=0.010s, mem=4.3M)

[PSP]    Done Read data from FE (cpu=0.080s, mem=4.3M)

[PSP]    Done Load db (cpu=0.080s, mem=4.3M)

[PSP]    Constructing placeable region... (mem=4.3M)
**WARN: [PSP]    Hinsts PD_RISC_CORE and core region have partial overlap region (10.032 10.032 420.032 185.032)
[PSP]    Compute region effective width... (mem=4.3M)
[PSP]    Done Compute region effective width (cpu=0.000s, mem=4.3M)

[PSP]    Done Constructing placeable region (cpu=0.010s, mem=4.3M)

**WARN: (IMPEXT-6140):	The RC table is not interpolated for wire width '112' on M3. As a result, an RC of wire width '56' is being used instead. This may cause some accuracy degradation.
**WARN: (IMPEXT-6140):	The RC table is not interpolated for wire width '112' on M4. As a result, an RC of wire width '56' is being used instead. This may cause some accuracy degradation.
**WARN: (IMPEXT-6140):	The RC table is not interpolated for wire width '112' on M5. As a result, an RC of wire width '56' is being used instead. This may cause some accuracy degradation.
**WARN: (IMPEXT-6140):	The RC table is not interpolated for wire width '112' on M6. As a result, an RC of wire width '56' is being used instead. This may cause some accuracy degradation.
**WARN: (IMPEXT-6140):	The RC table is not interpolated for wire width '112' on M7. As a result, an RC of wire width '56' is being used instead. This may cause some accuracy degradation.
**WARN: (IMPEXT-6140):	The RC table is not interpolated for wire width '112' on M8. As a result, an RC of wire width '56' is being used instead. This may cause some accuracy degradation.
Turning off fast DC mode.
**WARN: (IMPCCOPT-1183):	The library has no usable balanced buffers for power domain PD_RISC_CORE, while balancing clock_tree SYS_CLK. If this is not intended behavior, you can specify a list of lib_cells to use with the buffer_cells property.
**WARN: (IMPCCOPT-1183):	The library has no usable balanced buffers for power domain PD_ORCA_TOP, while balancing clock_tree SYS_CLK. If this is not intended behavior, you can specify a list of lib_cells to use with the buffer_cells property.
**ERROR: (IMPCCOPT-4334):	The lib cell 'INVX6_LVT' specified in the inverter_cells property was not found.  This cell will not be used when synthesizing -clock_tree SYS_CLK -power_domain PD_RISC_CORE.
**ERROR: (IMPCCOPT-4334):	The lib cell 'INVX6_LVT' specified in the inverter_cells property was not found.  This cell will not be used when synthesizing -clock_tree SYS_CLK -power_domain PD_ORCA_TOP.
**WARN: (IMPCCOPT-1183):	The library has no usable balanced buffers for power domain PD_RISC_CORE, while balancing clock_tree PCI_CLK. If this is not intended behavior, you can specify a list of lib_cells to use with the buffer_cells property.
**WARN: (IMPCCOPT-1183):	The library has no usable balanced buffers for power domain PD_ORCA_TOP, while balancing clock_tree PCI_CLK. If this is not intended behavior, you can specify a list of lib_cells to use with the buffer_cells property.
**ERROR: (IMPCCOPT-4334):	The lib cell 'INVX6_LVT' specified in the inverter_cells property was not found.  This cell will not be used when synthesizing -clock_tree PCI_CLK -power_domain PD_RISC_CORE.
**ERROR: (IMPCCOPT-4334):	The lib cell 'INVX6_LVT' specified in the inverter_cells property was not found.  This cell will not be used when synthesizing -clock_tree PCI_CLK -power_domain PD_ORCA_TOP.
**WARN: (IMPCCOPT-1183):	The library has no usable balanced buffers for power domain PD_RISC_CORE, while balancing clock_tree SDRAM_CLK. If this is not intended behavior, you can specify a list of lib_cells to use with the buffer_cells property.
**WARN: (IMPCCOPT-1183):	The library has no usable balanced buffers for power domain PD_ORCA_TOP, while balancing clock_tree SDRAM_CLK. If this is not intended behavior, you can specify a list of lib_cells to use with the buffer_cells property.
**ERROR: (IMPCCOPT-4334):	The lib cell 'INVX6_LVT' specified in the inverter_cells property was not found.  This cell will not be used when synthesizing -clock_tree SDRAM_CLK -power_domain PD_RISC_CORE.
**ERROR: (IMPCCOPT-4334):	The lib cell 'INVX6_LVT' specified in the inverter_cells property was not found.  This cell will not be used when synthesizing -clock_tree SDRAM_CLK -power_domain PD_ORCA_TOP.
**WARN: (IMPEXT-6140):	The RC table is not interpolated for wire width '112' on M8. As a result, an RC of wire width '56' is being used instead. This may cause some accuracy degradation.
**WARN: (IMPEXT-6140):	The RC table is not interpolated for wire width '112' on M7. As a result, an RC of wire width '56' is being used instead. This may cause some accuracy degradation.
**WARN: (IMPEXT-6140):	The RC table is not interpolated for wire width '112' on M8. As a result, an RC of wire width '56' is being used instead. This may cause some accuracy degradation.
**WARN: (IMPEXT-6140):	The RC table is not interpolated for wire width '112' on M7. As a result, an RC of wire width '56' is being used instead. This may cause some accuracy degradation.
**WARN: (IMPEXT-6140):	The RC table is not interpolated for wire width '112' on M8. As a result, an RC of wire width '56' is being used instead. This may cause some accuracy degradation.
**WARN: (IMPEXT-6140):	The RC table is not interpolated for wire width '112' on M7. As a result, an RC of wire width '56' is being used instead. This may cause some accuracy degradation.
**WARN: (IMPEXT-6140):	The RC table is not interpolated for wire width '112' on M8. As a result, an RC of wire width '56' is being used instead. This may cause some accuracy degradation.
**WARN: (IMPEXT-6140):	The RC table is not interpolated for wire width '112' on M7. As a result, an RC of wire width '56' is being used instead. This may cause some accuracy degradation.
**WARN: (IMPEXT-6140):	The RC table is not interpolated for wire width '112' on M8. As a result, an RC of wire width '56' is being used instead. This may cause some accuracy degradation.
**WARN: (IMPEXT-6140):	The RC table is not interpolated for wire width '112' on M7. As a result, an RC of wire width '56' is being used instead. This may cause some accuracy degradation.
**WARN: (IMPEXT-6140):	The RC table is not interpolated for wire width '112' on M8. As a result, an RC of wire width '56' is being used instead. This may cause some accuracy degradation.
**WARN: (IMPEXT-6140):	The RC table is not interpolated for wire width '112' on M7. As a result, an RC of wire width '56' is being used instead. This may cause some accuracy degradation.
**WARN: (IMPEXT-6140):	The RC table is not interpolated for wire width '112' on M8. As a result, an RC of wire width '56' is being used instead. This may cause some accuracy degradation.
**WARN: (IMPEXT-6140):	The RC table is not interpolated for wire width '112' on M7. As a result, an RC of wire width '56' is being used instead. This may cause some accuracy degradation.
**WARN: (EMS-27):	Message (IMPEXT-6140) has exceeded the current message display limit of 20.
To increase the message display limit, refer to the product command reference manual.
**WARN: (IMPCCOPT-1183):	The library has no usable balanced buffers for power domain PD_RISC_CORE, while balancing clock_tree SYS_2x_CLK. If this is not intended behavior, you can specify a list of lib_cells to use with the buffer_cells property.
**WARN: (IMPCCOPT-1183):	The library has no usable balanced buffers for power domain PD_ORCA_TOP, while balancing clock_tree SYS_2x_CLK. If this is not intended behavior, you can specify a list of lib_cells to use with the buffer_cells property.
**ERROR: (IMPCCOPT-4334):	The lib cell 'INVX6_LVT' specified in the inverter_cells property was not found.  This cell will not be used when synthesizing -clock_tree SYS_2x_CLK -power_domain PD_RISC_CORE.
**ERROR: (IMPCCOPT-4334):	The lib cell 'INVX6_LVT' specified in the inverter_cells property was not found.  This cell will not be used when synthesizing -clock_tree SYS_2x_CLK -power_domain PD_ORCA_TOP.
**WARN: (IMPCCOPT-1183):	The library has no usable balanced buffers for power domain PD_RISC_CORE, while balancing clock_tree ate_clk. If this is not intended behavior, you can specify a list of lib_cells to use with the buffer_cells property.
**WARN: (IMPCCOPT-1183):	The library has no usable balanced buffers for power domain PD_ORCA_TOP, while balancing clock_tree ate_clk. If this is not intended behavior, you can specify a list of lib_cells to use with the buffer_cells property.
**ERROR: (IMPCCOPT-4334):	The lib cell 'INVX6_LVT' specified in the inverter_cells property was not found.  This cell will not be used when synthesizing -clock_tree ate_clk -power_domain PD_RISC_CORE.
**ERROR: (IMPCCOPT-4334):	The lib cell 'INVX6_LVT' specified in the inverter_cells property was not found.  This cell will not be used when synthesizing -clock_tree ate_clk -power_domain PD_ORCA_TOP.
  Primary reporting skew groups are:
  skew_group SDRAM_CLK/func_best_mode with 2887 clock sinks
  No ideal or dont_touch nets found in the clock tree
  No dont_touch hnets found in the clock tree
  
  Total number of dont_touch hpins in the clock network: 1
    Large numbers of dont_touch hpins may damage runtime and QoR.
    Use report_ccopt_clock_tree_structure or the Clock Tree Debugger in unit delay mode to debug these.
  
  Summary of reasons for dont_touch hpins in the clock network:
  
  -----------------------
  Reason            Count
  -----------------------
  upf_constraint      1
  -----------------------
  
  Total number of dont_touch hpins in the clock network with a physical location (typically partition pins): 0
  
  Summary of dont_touch hpins in the clock network representing physical hierarchy:
  
  ---------------------
  Type            Count
  ---------------------
  ilm               0
  partition         0
  power_domain      1
  fence             0
  none              0
  ---------------------
  Total             1
  ---------------------
  
  Checking for illegal sizes of clock logic instances...
  Checking for illegal sizes of clock logic instances done. (took cpu=0:00:00.0 real=0:00:00.0)
  Validating CTS configuration done. (took cpu=0:00:05.4 real=0:00:04.1)
  CCOpt configuration status: all checks passed.
Initializing done.
Using inst based legalization.
#% Begin earlyGlobalRoute (date=06/12 01:59:22, mem=3209.1M)
[NR-eGR] Started Early Global Route ( Curr Mem: 6.06 MB )
[NR-eGR] Started Early Global Route kernel ( Curr Mem: 6.06 MB )
[NR-eGR] Read 43160 nets ( ignored 43160 )
[NR-eGR] No Net to Route
[NR-eGR] Overflow after Early Global Route 0.00% H + 0.00% V
[NR-eGR] No Net to Route
[NR-eGR] Total eGR-routed clock nets wire length: 0um, number of vias: 0
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR] Report for selected net(s) only.
[NR-eGR]               Length (um)  Vias 
[NR-eGR] --------------------------------
[NR-eGR]  M1    (1H)             0     0 
[NR-eGR]  M2    (2V)             0     0 
[NR-eGR]  M3    (3H)             0     0 
[NR-eGR]  M4    (4V)             0     0 
[NR-eGR]  M5    (5H)             0     0 
[NR-eGR]  M6    (6V)             0     0 
[NR-eGR]  M7    (7H)             0     0 
[NR-eGR]  M8    (8V)             0     0 
[NR-eGR]  M9    (9H)             0     0 
[NR-eGR]  MRDL  (10V)            0     0 
[NR-eGR] --------------------------------
[NR-eGR]        Total            0     0 
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR] Total half perimeter of net bounding box: 0um
[NR-eGR] Total length: 0um, number of vias: 0
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR] Total routed clock nets wire length: 0um, number of vias: 0
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR]               Length (um)    Vias 
[NR-eGR] ----------------------------------
[NR-eGR]  M1    (1H)             0  163174 
[NR-eGR]  M2    (2V)        230630  219469 
[NR-eGR]  M3    (3H)        339747   66928 
[NR-eGR]  M4    (4V)        136032   15079 
[NR-eGR]  M5    (5H)        136887    3888 
[NR-eGR]  M6    (6V)         42917    2095 
[NR-eGR]  M7    (7H)         61312     338 
[NR-eGR]  M8    (8V)          2414     147 
[NR-eGR]  M9    (9H)          5983       2 
[NR-eGR]  MRDL  (10V)            5       0 
[NR-eGR] ----------------------------------
[NR-eGR]        Total       955926  471120 
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR] Total half perimeter of net bounding box: 828762um
[NR-eGR] Total length: 955926um, number of vias: 471120
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR] Finished Early Global Route kernel ( CPU: 1.13 sec, Real: 0.81 sec, Curr Mem: 6.07 MB )
[NR-eGR] Finished Early Global Route ( CPU: 1.15 sec, Real: 0.82 sec, Curr Mem: 6.05 MB )
#% End earlyGlobalRoute (date=06/12 01:59:23, total cpu=0:00:01.3, real=0:00:01.0, peak res=3209.1M, current mem=3202.6M)
**WARN: (IMPCCOPT-5076):	Output pin of flexH driver INVX16_LVT has no stack via rule list and stack via required property configured.
Grid density data update skipped
Initializing multi-corner capacitance tables ... 
Initializing multi-corner resistance tables ...
Computing placement data for trunk cell 'INVX16_LVT', final cell 'INVX8_LVT', power domain 'PD_ORCA_TOP'...
Computing placement data for trunk cell 'INVX16_LVT', final cell 'INVX8_LVT', power domain 'PD_ORCA_TOP' done.
**WARN: (IMPCCOPT-1347):	H-tree sink with ideal location (123.728,76.912) cannot be placed or is not required to connected the fanout of the source of the H-tree. This H-tree sink will be ignored. If it is inside a placement blocked area, consider increasing the sink area of the sink grid. It may help to review the sink areas using the -image_directory option of create_ccopt_flexible_htree.
Disconnecting clock tree from netlist...
Disconnecting clock tree from netlist done.
Preparing to synthesize flexible H-tree 'flex_HTREE'...
Preparing to synthesize flexible H-tree 'flex_HTREE' done.
Synthesizing flexible H-tree 'flex_HTREE' (max driver distance 632.016um)...
Synthesizing flexible H-tree 'flex_HTREE' (max driver distance 632.016um) done.
Resynthesising clock tree into netlist...
  Reset timing graph...
Ignoring AAE DB Resetting ...
  Reset timing graph done.
Resynthesising clock tree into netlist done.
Leaving CCOpt scope - ClockRefiner...
Soft fixed 104 clock instances.
Performing a single pass refine place with checks partially disabled for clock sinks and datapath.

*** Starting refinePlace (0:35:14 mem=6649.5M) ***
Total net bbox length = 8.318e+05 (4.957e+05 3.361e+05) (ext = 1.249e+04)
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Move report: Detail placement moves 170 insts, mean move: 1.09 um, max move: 4.26 um 
	Max move on inst (I_RISC_CORE/U1549): (170.39, 163.86) --> (167.81, 162.18)
	Runtime: CPU: 0:00:17.3 REAL: 0:00:06.0 MEM: 6639.2MB
Summary Report:
Instances move: 225 (out of 40574 movable)
Instances flipped: 0
Mean displacement: 1.24 um
Max displacement: 5.02 um (Instance: I_RISC_CORE/FE_OFC2925_n_1) (146.832, 160.512) -> (146.832, 155.496)
	Length: 15 sites, height: 1 rows, site name: unit, cell type: NBUFFX8_LVT, constraint:Fence
Physical-only instances move: 0 (out of 0 movable physical-only)
Total net bbox length = 8.319e+05 (4.957e+05 3.362e+05) (ext = 1.250e+04)
Runtime: CPU: 0:00:17.4 REAL: 0:00:06.0 MEM: 6639.2MB
*** Finished refinePlace (0:35:32 mem=6639.2M) ***
ClockRefiner summary
All clock instances: Moved 87, flipped 36 and cell swapped 0 (out of a total of 3603).
All Clock instances: Average move = 1.61um
The largest move was 5.02 um for I_RISC_CORE/FE_OFC2925_n_1.
Restoring pStatusCts on 104 clock instances.

Leaving CCOpt scope - ClockRefiner done. (took cpu=0:00:19.7 real=0:00:07.1)
Clock implementation routing...
  Leaving CCOpt scope - Routing Tools...
Net route status summary:
  Clock:         7 (unrouted=0, trialRouted=0, noStatus=0, routed=7, fixed=0, [crossesIlmBoundary=0, tooFewTerms=0, (crossesIlmBoundary AND tooFewTerms=0)])
  Non-clock: 45236 (unrouted=2153, trialRouted=42823, noStatus=260, routed=0, fixed=0, [crossesIlmBoundary=0, tooFewTerms=2076, (crossesIlmBoundary AND tooFewTerms=0)])
  Routing using NRHF...

CCOPT: Preparing to route 7 clock nets with NanoRoute.
  0 nets are default rule and 7 are CTS_RULE.
  Preferred NanoRoute mode settings: Current
-route_detail_end_iteration 0
-route_with_via_only_for_stdcell_pin false
    Clock detailed routing...
      NanoRoute...
#% Begin globalDetailRoute (date=06/12 02:01:48, mem=3322.1M)

globalDetailRoute

#Start globalDetailRoute on Wed Jun 12 02:01:48 2024
#
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#NanoRoute Version 23.10-p003_1 NR240109-1512/23_10-UB
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#
#Wire/Via statistics before line assignment ...
#Total number of nets with non-default rule or having extra spacing = 7
#Total wire length = 3651 um.
#Total half perimeter of net bounding box = 2804 um.
#Total wire length on LAYER M1 = 0 um.
#Total wire length on LAYER M2 = 0 um.
#Total wire length on LAYER M3 = 0 um.
#Total wire length on LAYER M4 = 0 um.
#Total wire length on LAYER M5 = 2 um.
#Total wire length on LAYER M6 = 6 um.
#Total wire length on LAYER M7 = 1928 um.
#Total wire length on LAYER M8 = 1714 um.
#Total wire length on LAYER M9 = 0 um.
#Total wire length on LAYER MRDL = 0 um.
#Total number of vias = 259
#Up-Via Summary (total 259):
#           
#-----------------------
# M1                 28
# M2                 28
# M3                 28
# M4                 28
# M5                 74
# M6                 29
# M7                 44
#-----------------------
#                   259 
#
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#Start routing data preparation on Wed Jun 12 02:01:51 2024
#
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#WARNING (NRDB-2040) Rule LEF_DEFAULT doesn't specify any vias that satisfy all of the area rules for layer M2 M3 M4 M5 M6 M7 
#WARNING (NRDB-2040) Rule CTS_RULE doesn't specify any vias that satisfy all of the area rules for layer M2 M3 M4 M5 M6 M7 
#Initial pin access analysis.
#Detail pin access analysis.
# M1           H   Track-Pitch = 0.15200    Line-2-Via Pitch = 0.10500
# M2           V   Track-Pitch = 0.15200    Line-2-Via Pitch = 0.11400
# M3           H   Track-Pitch = 0.30400    Line-2-Via Pitch = 0.11400
# M4           V   Track-Pitch = 0.30400    Line-2-Via Pitch = 0.11400
# M5           H   Track-Pitch = 0.60800    Line-2-Via Pitch = 0.11400
# M6           V   Track-Pitch = 0.60800    Line-2-Via Pitch = 0.11400
# M7           H   Track-Pitch = 1.21600    Line-2-Via Pitch = 0.11400
# M8           V   Track-Pitch = 1.21600    Line-2-Via Pitch = 0.11400
# M9           H   Track-Pitch = 2.43200    Line-2-Via Pitch = 0.21600
# MRDL         V   Track-Pitch = 4.86400    Line-2-Via Pitch = 4.50000
#Bottom routing layer index=1(M1), bottom routing layer for shielding=1(M1), bottom shield layer=1(M1)
#shield_bottom_stripe_layer=1(M1), shield_top_stripe_layer=10(MRDL)
#pin_access_rlayer=2(M2)
#shield_top_dpt_rlayer=-1 top_rlayer=10 top_trim_metal_rlayer=-1 rlayer_lowest=1 bottom_rlayer=1
#enable_trim_layer_shield=F enable_dpt_layer_shield=F has_line_end_grid=F
#enable_dpt_layer_shield=F
#has_line_end_grid=F
#cpu time = 00:00:00, elapsed time = 00:00:00, memory = 3444.33 (MB), peak = 4910.27 (MB)
#Regenerating Ggrids automatically.
#Auto generating G-grids with size=15 tracks, using layer M3's pitch = 0.30400.
#Using automatically generated G-grids.
#Done routing data preparation.
#cpu time = 00:00:06, elapsed time = 00:00:02, memory = 3487.53 (MB), peak = 4910.27 (MB)
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#Start instance access analysis using 8 threads...
#Set layer M1 to be advanced pin access layer.
#Set instance access analysis scope -6.68800, 71.08100, 838.03100, 507.43100
#0 instance pins are hard to access
#Instance access analysis statistics:
#Cpu time = 00:00:02
#Elapsed time = 00:00:01
#Increased memory = 7.52 (MB)
#Total memory = 3495.08 (MB)
#Peak memory = 4910.27 (MB)
#
#Distribution of nets:
#  
# #pin range           #net       % 
#------------------------------------
#          2           21060 ( 46.5%)
#          3           11580 ( 25.6%)
#          4            2715 (  6.0%)
#          5            1654 (  3.7%)
#          6            2933 (  6.5%)
#          7             301 (  0.7%)
#          8             270 (  0.6%)
#          9             391 (  0.9%)
#  10  -  19            1699 (  3.8%)
#  20  -  29             426 (  0.9%)
#  30  -  39              85 (  0.2%)
#  40  -  49              31 (  0.1%)
#  50  -  59              14 (  0.0%)
#  60  -  69               3 (  0.0%)
#  70  -  79               1 (  0.0%)
#  100 - 199               1 (  0.0%)
#  300 - 399               1 (  0.0%)
#  1300-1399               2 (  0.0%)
#     >=2000               0 (  0.0%)
#
#Total: 45243 nets, 43167 non-trivial nets
#                                    #net       % 
#-------------------------------------------------
#  Fully global routed                  7 ( 0.0%)
#  Clock                                7
#  Nondefault rule                      7
#  Prefer layer range               43167
#
#  Rule            #net     #shield
#----------------------------------
#  CTS_RULE           7           0
#
#Nets in 2 layer ranges:
#  Bottom Pref.Layer    Top Pref.Layer       #net       % 
#---------------------------------------------------------
#            -------           6 M6  *      43160 (100.0%)
#             7 M7             8 M8             7 (  0.0%)
#
#7 nets selected.
#
#
#...
#
#Iteration 1.1: cpu:00:00:00, real:00:00:00, mem:3.5 GB, peak:4.8 GB --1.31 [8]--
#Iteration 2.1: cpu:00:00:00, real:00:00:00, mem:3.5 GB, peak:4.8 GB --1.27 [8]--
#Iteration 3.1: cpu:00:00:00, real:00:00:00, mem:3.5 GB, peak:4.8 GB --1.28 [8]--
#
#Line Assignment statistics:
#Cpu time = 00:00:00
#Elapsed time = 00:00:00
#Increased memory = 4.38 (MB)
#Total memory = 3545.27 (MB)
#Peak memory = 4910.27 (MB)
#End Line Assignment: cpu:00:00:02, real:00:00:01, mem:3.5 GB, peak:4.8 GB --2.08 [8]--
#
#Wire/Via statistics after line assignment ...
#Total number of nets with non-default rule or having extra spacing = 7
#Total wire length = 3651 um.
#Total half perimeter of net bounding box = 2804 um.
#Total wire length on LAYER M1 = 0 um.
#Total wire length on LAYER M2 = 0 um.
#Total wire length on LAYER M3 = 0 um.
#Total wire length on LAYER M4 = 0 um.
#Total wire length on LAYER M5 = 2 um.
#Total wire length on LAYER M6 = 6 um.
#Total wire length on LAYER M7 = 1928 um.
#Total wire length on LAYER M8 = 1714 um.
#Total wire length on LAYER M9 = 0 um.
#Total wire length on LAYER MRDL = 0 um.
#Total number of vias = 259
#Up-Via Summary (total 259):
#           
#-----------------------
# M1                 28
# M2                 28
# M3                 28
# M4                 28
# M5                 74
# M6                 29
# M7                 44
#-----------------------
#                   259 
#
#Routing data preparation, pin analysis, line assignment statistics:
#Cpu time = 00:00:09
#Elapsed time = 00:00:03
#Increased memory = 137.98 (MB)
#Total memory = 3520.27 (MB)
#Peak memory = 4910.27 (MB)
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#Skip comparing routing design signature in db-snapshot flow
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#Using multithreading with 8 threads.
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#
#Start Detail Routing..
#start initial detail routing ...
#   number of violations = 0
#cpu time = 00:00:11, elapsed time = 00:00:02, memory = 3637.44 (MB), peak = 4910.27 (MB)
#Complete Detail Routing.
#Total number of nets with non-default rule or having extra spacing = 7
#Total wire length = 3665 um.
#Total half perimeter of net bounding box = 2804 um.
#Total wire length on LAYER M1 = 0 um.
#Total wire length on LAYER M2 = 9 um.
#Total wire length on LAYER M3 = 3 um.
#Total wire length on LAYER M4 = 1 um.
#Total wire length on LAYER M5 = 2 um.
#Total wire length on LAYER M6 = 7 um.
#Total wire length on LAYER M7 = 1941 um.
#Total wire length on LAYER M8 = 1702 um.
#Total wire length on LAYER M9 = 0 um.
#Total wire length on LAYER MRDL = 0 um.
#Total number of vias = 209
#Up-Via Summary (total 209):
#           
#-----------------------
# M1                 28
# M2                 28
# M3                 28
# M4                 28
# M5                 28
# M6                 29
# M7                 40
#-----------------------
#                   209 
#
#Total number of DRC violations = 0
#Cpu time = 00:00:12
#Elapsed time = 00:00:03
#Increased memory = 90.32 (MB)
#Total memory = 3610.63 (MB)
#Peak memory = 4910.27 (MB)
#detailRoute Statistics:
#Cpu time = 00:00:12
#Elapsed time = 00:00:03
#Increased memory = 90.38 (MB)
#Total memory = 3610.64 (MB)
#Peak memory = 4910.27 (MB)
#
#globalDetailRoute statistics:
#Cpu time = 00:00:27
#Elapsed time = 00:00:09
#Increased memory = 243.79 (MB)
#Total memory = 3565.99 (MB)
#Peak memory = 4910.27 (MB)
#Number of warnings = 16
#Total number of warnings = 16
#Number of fails = 0
#Total number of fails = 0
#Complete globalDetailRoute on Wed Jun 12 02:01:57 2024
#
#
#  Scalability Statistics
#
#-------------------------+---------+-------------+------------+
#  globalDetailRoute      | cpu time| elapsed time| scalability|
#-------------------------+---------+-------------+------------+
#  Pre Callback           | 00:00:00|     00:00:00|         1.0|
#  Post Callback          | 00:00:00|     00:00:00|         1.0|
#  Timing Data Generation | 00:00:00|     00:00:00|         1.0|
#  DB Import              | 00:00:05|     00:00:03|         1.7|
#  DB Export              | 00:00:01|     00:00:01|         1.0|
#  Cell Pin Access        | 00:00:04|     00:00:01|         1.0|
#  Instance Pin Access    | 00:00:02|     00:00:01|         1.0|
#  Data Preparation       | 00:00:02|     00:00:01|         1.5|
#  Line Assignment        | 00:00:02|     00:00:01|         1.0|
#  Detail Routing         | 00:00:11|     00:00:02|         4.7|
#  Entire Command         | 00:00:27|     00:00:10|         2.9|
#-------------------------+---------+-------------+------------+
#
#% End globalDetailRoute (date=06/12 02:01:57, total cpu=0:00:27.3, real=0:00:09.0, peak res=3509.4M, current mem=3509.4M)
      NanoRoute done. (took cpu=0:00:27.4 real=0:00:09.8)
    Clock detailed routing done.
Skipping check of guided vs. routed net lengths.
Set FIXED routing status on 7 net(s)
  Routing using NRHF done.
Net route status summary:
  Clock:         7 (unrouted=0, trialRouted=0, noStatus=0, routed=0, fixed=7, [crossesIlmBoundary=0, tooFewTerms=0, (crossesIlmBoundary AND tooFewTerms=0)])
  Non-clock: 45236 (unrouted=45236, trialRouted=0, noStatus=0, routed=0, fixed=0, [crossesIlmBoundary=0, tooFewTerms=2076, (crossesIlmBoundary AND tooFewTerms=0)])

CCOPT: Done with clock implementation routing.


  Leaving CCOpt scope - Routing Tools done. (took cpu=0:00:28.5 real=0:00:10.4)
Clock implementation routing done.
Ignoring AAE DB Resetting ...
Updating timing graph...
  
  Leaving CCOpt scope - BuildTimeGraph...
AAE_INFO: opIsDesignInPostRouteState() is 0
#################################################################################
# Design Stage: PreRoute
# Design Name: ORCA_TOP
# Design Mode: 28nm
# Analysis Mode: MMMC Non-OCV 
# Parasitics Mode: No SPEF/RCDB 
# Signoff Settings: SI Off 
#################################################################################
**WARN: (IMPEXT-6191):	Using a captable file is not recommended for process nodes less than or equal to 32 nm due to parasitic accuracy concerns. The Quantus QRC technology file should be specified for all RC corners using the command create_rc_corner or update_rc_corner, which will then be used for preRoute and postRoute(effort level medium or high or signoff) extraction engines.
Type 'man IMPEXT-6191' for more detail.
Extraction called for design 'ORCA_TOP' of instances=40636 and nets=45242 using extraction engine 'preRoute' .
PreRoute RC Extraction called for design ORCA_TOP.
RC Extraction called in multi-corner(2) mode.
RCMode: PreRoute
      RC Corner Indexes            0       1   
Capacitance Scaling Factor   : 1.00000 1.00000 
Resistance Scaling Factor    : 1.00000 1.00000 
Clock Cap. Scaling Factor    : 1.00000 1.00000 
Clock Res. Scaling Factor    : 1.00000 1.00000 
Shrink Factor                : 1.00000
PreRoute extraction is honoring NDR/Shielding/ExtraSpace for clock nets.
Using capacitance table file ...
Updating RC Grid density data for preRoute extraction ...
Initializing multi-corner capacitance tables ... 
Initializing multi-corner resistance tables ...
PreRoute RC Extraction DONE (CPU Time: 0:00:00.7  Real Time: 0:00:01.0  MEM: 6633.516M)
Calculate delays in BcWc mode...
Calculate delays in BcWc mode...
Start delay calculation (fullDC) (8 T). (MEM=3657.15)
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25667_Addr_A_6, driver I_RISC_CORE/FE_OFC5299_Addr_A_6/Y (cell NBUFFX2_LVT) voltage 0.95 does not match receiver I_RISC_CORE/I_REG_FILE_REG_FILE_A_RAM/A2[6] (cell SRAM2RW128x16) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25667_Addr_A_6, driver I_RISC_CORE/FE_OFC5299_Addr_A_6/Y (cell NBUFFX2_LVT) voltage 0.95 does not match receiver I_RISC_CORE/I_REG_FILE_REG_FILE_C_RAM/A2[6] (cell SRAM2RW128x16) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25603_n1556, driver I_RISC_CORE/FE_OFC5236_n1556/Y (cell NBUFFX2_LVT) voltage 0.95 does not match receiver I_RISC_CORE/U1043/S0 (cell MUX21X1_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25653_I_DATA_PATH_N55, driver I_RISC_CORE/FE_OFC5285_I_DATA_PATH_N55/Y (cell NBUFFX2_LVT) voltage 0.95 does not match receiver I_RISC_CORE/I_DATA_PATH_Oprnd_B_reg_6_/D (cell SDFFX2_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25661_n681, driver I_RISC_CORE/FE_OFC5293_n681/Y (cell NBUFFX2_LVT) voltage 0.95 does not match receiver I_RISC_CORE/I_DATA_PATH_Oprnd_B_reg_7_/D (cell SDFFX2_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25652_n, driver I_RISC_CORE/U1617/Y (cell AO22X1_LVT) voltage 0.75 does not match receiver I_RISC_CORE/FE_OFC5284_n714/A (cell NBUFFX2_LVT) voltage 0.95 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25635_n_12, driver I_RISC_CORE/FE_OFC5267_n_12/Y (cell INVX1_LVT) voltage 0.95 does not match receiver I_RISC_CORE/I_INSTRN_LAT_Crnt_Instrn_2_reg_22_/D (cell SDFFARX1_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25551_Oprnd_A_7, driver I_RISC_CORE/FE_OFC5186_Oprnd_A_7/Y (cell NBUFFX2_LVT) voltage 0.95 does not match receiver I_RISC_CORE/U214/A2 (cell NAND2X0_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25551_Oprnd_A_7, driver I_RISC_CORE/FE_OFC5186_Oprnd_A_7/Y (cell NBUFFX2_LVT) voltage 0.95 does not match receiver I_RISC_CORE/U1618/A (cell INVX2_LVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25665_n1200, driver I_RISC_CORE/FE_OFC5297_n1200/Y (cell NBUFFX4_LVT) voltage 0.95 does not match receiver I_RISC_CORE/U290/A1 (cell OR2X1_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25603_n1556, driver I_RISC_CORE/FE_OFC5236_n1556/Y (cell NBUFFX2_LVT) voltage 0.95 does not match receiver I_RISC_CORE/U1047/S0 (cell MUX21X1_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25603_n1556, driver I_RISC_CORE/FE_OFC5236_n1556/Y (cell NBUFFX2_LVT) voltage 0.95 does not match receiver I_RISC_CORE/U243/A3 (cell OA21X2_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25603_n1556, driver I_RISC_CORE/FE_OFC5236_n1556/Y (cell NBUFFX2_LVT) voltage 0.95 does not match receiver I_RISC_CORE/U1004/A2 (cell OA21X1_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25570_n, driver I_RISC_CORE/FE_OFC5204_n360_1/Y (cell NBUFFX8_LVT) voltage 0.95 does not match receiver I_RISC_CORE/I_INSTRN_LAT_Crnt_Instrn_2_reg_20_/SI (cell SDFFARX1_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25549_n1553, driver I_RISC_CORE/FE_OFC5184_n1553/Y (cell NBUFFX2_LVT) voltage 0.95 does not match receiver I_RISC_CORE/U267/A1 (cell AND2X1_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (EMS-27):	Message (IMPMSMV-1810) has exceeded the current message display limit of 20.
To increase the message display limit, refer to the product command reference manual.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25583_n, driver I_RISC_CORE/FE_OFC5217_n376_1/Y (cell NBUFFX2_LVT) voltage 0.95 does not match receiver I_RISC_CORE/I_REG_FILE_REG_FILE_B_RAM/A2[3] (cell SRAM2RW128x16) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25551_Oprnd_A_7, driver I_RISC_CORE/FE_OFC5186_Oprnd_A_7/Y (cell NBUFFX2_LVT) voltage 0.95 does not match receiver I_RISC_CORE/U767/S0 (cell MUX21X1_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25665_n1200, driver I_RISC_CORE/FE_OFC5297_n1200/Y (cell NBUFFX4_LVT) voltage 0.95 does not match receiver I_RISC_CORE/U757/A1 (cell NOR2X1_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25575_n, driver I_RISC_CORE/FE_OFC5209_n378_1/Y (cell NBUFFX2_LVT) voltage 0.95 does not match receiver I_RISC_CORE/I_REG_FILE_REG_FILE_B_RAM/A2[1] (cell SRAM2RW128x16) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (EMS-27):	Message (IMPMSMV-1810) has exceeded the current message display limit of 20.
To increase the message display limit, refer to the product command reference manual.
**WARN: (EMS-27):	Message (IMPMSMV-1810) has exceeded the current message display limit of 20.
To increase the message display limit, refer to the product command reference manual.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25655_RegPort_C_13, driver I_RISC_CORE/FE_OFC5287_RegPort_C_13/Y (cell NBUFFX2_LVT) voltage 0.95 does not match receiver I_RISC_CORE/I_REG_FILE_REG_FILE_A_RAM/I1[13] (cell SRAM2RW128x16) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
Total number of fetched objects 49761
AAE_INFO: Total number of nets for which stage creation was skipped for all views 0
End delay calculation. (MEM=3707.04 CPU=0:00:23.7 REAL=0:00:03.0)
End delay calculation (fullDC). (MEM=3707.04 CPU=0:00:28.7 REAL=0:00:05.0)
  Leaving CCOpt scope - BuildTimeGraph done. (took cpu=0:00:37.0 real=0:00:07.5)
Updating timing graph done.
Updating latch analysis...
  Leaving CCOpt scope - Updating latch analysis...
  Leaving CCOpt scope - Updating latch analysis done. (took cpu=0:00:06.1 real=0:00:00.9)
Updating latch analysis done.
Clock tree timing engine global stage delay update for worst_corner:setup.late...
Clock tree timing engine global stage delay update for worst_corner:setup.late done. (took cpu=0:00:00.5 real=0:00:00.2)
Clock tree timing engine global stage delay update for worst_corner:setup.late...
Clock tree timing engine global stage delay update for worst_corner:setup.late done. (took cpu=0:00:00.3 real=0:00:00.1)
      flow.cputime  flow.realtime  timing.setup.tns  timing.setup.wns  snapshot
UM:*                                                                   synthesis group 0
Extracting original clock gating for flexible_htree_flex_HTREE_0...
  clock_tree flexible_htree_flex_HTREE_0 contains 2919 sinks and 3 clock gates.
    Found 32 clock convergence points while defining clock tree.
Extracting original clock gating for flexible_htree_flex_HTREE_0 done.
Found 1 generator input for clock tree flexible_htree_flex_HTREE_0.
Extracting original clock gating for flexible_htree_flex_HTREE_1...
  clock_tree flexible_htree_flex_HTREE_1 contains 0 sinks and 0 clock gates.
Extracting original clock gating for flexible_htree_flex_HTREE_1 done.
Found 1 generator input for clock tree flexible_htree_flex_HTREE_1.
Extracting original clock gating for flexible_htree_flex_HTREE_2...
  clock_tree flexible_htree_flex_HTREE_2 contains 0 sinks and 0 clock gates.
Extracting original clock gating for flexible_htree_flex_HTREE_2 done.
Found 1 generator input for clock tree flexible_htree_flex_HTREE_2.
Extracting original clock gating for flexible_htree_flex_HTREE_3...
  clock_tree flexible_htree_flex_HTREE_3 contains 0 sinks and 0 clock gates.
Extracting original clock gating for flexible_htree_flex_HTREE_3 done.
Found 1 generator input for clock tree flexible_htree_flex_HTREE_3.
Extracting original clock gating for flexible_htree_flex_HTREE_4...
  clock_tree flexible_htree_flex_HTREE_4 contains 0 sinks and 0 clock gates.
Extracting original clock gating for flexible_htree_flex_HTREE_4 done.
Found 1 generator input for clock tree flexible_htree_flex_HTREE_4.
Extracting original clock gating for flexible_htree_flex_HTREE_5...
  clock_tree flexible_htree_flex_HTREE_5 contains 0 sinks and 0 clock gates.
Extracting original clock gating for flexible_htree_flex_HTREE_5 done.
Found 1 generator input for clock tree flexible_htree_flex_HTREE_5.
Extracting original clock gating for flexible_htree_flex_HTREE_6...
  clock_tree flexible_htree_flex_HTREE_6 contains 0 sinks and 0 clock gates.
Extracting original clock gating for flexible_htree_flex_HTREE_6 done.
Found 1 generator input for clock tree flexible_htree_flex_HTREE_6.
Extracting original clock gating for flexible_htree_flex_HTREE_7...
  clock_tree flexible_htree_flex_HTREE_7 contains 0 sinks and 0 clock gates.
Extracting original clock gating for flexible_htree_flex_HTREE_7 done.
Found 1 generator input for clock tree flexible_htree_flex_HTREE_7.
Extracting original clock gating for flexible_htree_flex_HTREE_8...
  clock_tree flexible_htree_flex_HTREE_8 contains 0 sinks and 0 clock gates.
Extracting original clock gating for flexible_htree_flex_HTREE_8 done.
Found 1 generator input for clock tree flexible_htree_flex_HTREE_8.
Extracting original clock gating for flexible_htree_flex_HTREE_9...
  clock_tree flexible_htree_flex_HTREE_9 contains 0 sinks and 0 clock gates.
Extracting original clock gating for flexible_htree_flex_HTREE_9 done.
Found 1 generator input for clock tree flexible_htree_flex_HTREE_9.
Extracting original clock gating for flexible_htree_flex_HTREE_10...
  clock_tree flexible_htree_flex_HTREE_10 contains 0 sinks and 0 clock gates.
Extracting original clock gating for flexible_htree_flex_HTREE_10 done.
Found 1 generator input for clock tree flexible_htree_flex_HTREE_10.
Extracting original clock gating for flexible_htree_flex_HTREE_11...
  clock_tree flexible_htree_flex_HTREE_11 contains 0 sinks and 0 clock gates.
Extracting original clock gating for flexible_htree_flex_HTREE_11 done.
Found 1 generator input for clock tree flexible_htree_flex_HTREE_11.
Extracting original clock gating for flexible_htree_flex_HTREE_12...
  clock_tree flexible_htree_flex_HTREE_12 contains 0 sinks and 0 clock gates.
Extracting original clock gating for flexible_htree_flex_HTREE_12 done.
Found 1 generator input for clock tree flexible_htree_flex_HTREE_12.
Extracting original clock gating for flexible_htree_flex_HTREE_13...
  clock_tree flexible_htree_flex_HTREE_13 contains 0 sinks and 0 clock gates.
Extracting original clock gating for flexible_htree_flex_HTREE_13 done.
Found 1 generator input for clock tree flexible_htree_flex_HTREE_13.
Extracting original clock gating for flexible_htree_flex_HTREE_14...
  clock_tree flexible_htree_flex_HTREE_14 contains 0 sinks and 0 clock gates.
Extracting original clock gating for flexible_htree_flex_HTREE_14 done.
Found 1 generator input for clock tree flexible_htree_flex_HTREE_14.
The skew group flexible_htree_flex_HTREE/reporting_only was created. It contains 15 sinks and 1 sources.

Flexible H-Tree Metrics Summary after routing
  Flexible H-Tree: flex_HTREE
    sinks=15, insts=7, levels=3
    wire_length=3665.489, vias=209, nets=7
    insertion_delay (min, max, avg)= (0.259, 0.263, 0.262), skew= 0.004
    transition time violating pins: num=0, max=0.000, sum=0.000
      target=0.243 (total 22 pins): num=0, max=0.000, sum=0.000

      flow.cputime  flow.realtime  timing.setup.tns  timing.setup.wns  snapshot
UM:*                                                                   synthesize_flexible_htrees
Leaving CCOpt scope - Cleaning up placement interface...
Leaving CCOpt scope - Cleaning up placement interface done. (took cpu=0:00:00.2 real=0:00:00.1)
### Start verbose source output (echo mode) for '../scripts/ORCA_TOP.pre.cts.tcl' ...
# if {[info exists synopsys_program_name]} {

} else {
  if [is_common_ui_mode ] {
    #set_db [get_pin occ_int2/U_clk_control_i_0/fast_clk_enable_l_reg/CLK ] .cts_pin_insertion_delay 350ps
   #set_db cts_use_inverters true
  set_db cts_buffer_cells [ get_db [get_lib_cells */NBUF*LVT* ] .base_name ] 
   # set_ccopt_property inverter_cells [ get_db [get_lib_cells */IBUF*LVT* ] .base_name ]
  } else {

    #set_ccopt_property insertion_delay 350ps -pin occ_int2/U_clk_control_i_0/fast_clk_enable_l_reg/CLK
   # set_dont_touch [dbGet top.insts.cell.name *NBUFF*]
   # set_ccopt_property use_inverters true 
    set_ccopt_property buffer_cells [ get_db [get_lib_cells */NBUF*LVT* ] .base_name ]
    #set_ccopt_property inverter_cells [ get_db [get_lib_cells */IBUF*LVT* ] .base_name ]
  }
}
### End verbose source output for '../scripts/ORCA_TOP.pre.cts.tcl'.
#% Begin ccopt_design (date=06/12 02:02:09, mem=3516.4M)
*** ccopt_design #1 [begin] () : totSession cpu/real = 0:36:47.3/0:16:26.5 (2.2), mem = 5123.5M
Runtime...
**INFO: User's settings:
setNanoRouteMode -route_detail_end_iteration                   5
setNanoRouteMode -route_detail_post_route_spread_wire          false
setNanoRouteMode -route_extract_third_party_compatible         false
setNanoRouteMode -route_global_exp_timing_driven_std_delay     11
setNanoRouteMode -route_with_via_only_for_block_cell_pin       false
setNanoRouteMode -route_with_via_only_for_stdcell_pin          1:1
setDesignMode -earlyClockFlow                                  false
setDesignMode -flowEffort                                      standard
setDesignMode -process                                         28
setExtractRCMode -coupling_c_th                                0.1
setExtractRCMode -engine                                       preRoute
setExtractRCMode -relative_c_th                                1
setExtractRCMode -total_c_th                                   0
setDelayCalMode -enable_high_fanout                            true
setDelayCalMode -eng_enablePrePlacedFlow                       false
setDelayCalMode -engine                                        aae
setDelayCalMode -ignoreNetLoad                                 false
setDelayCalMode -socv_accuracy_mode                            low
setOptMode -opt_view_pruning_hold_views_active_list            { test_best_scenario func_best_scenario }
setOptMode -opt_view_pruning_setup_views_active_list           { test_worst_scenario func_worst_scenario }
setOptMode -opt_view_pruning_setup_views_persistent_list       { func_worst_scenario test_worst_scenario}
setOptMode -opt_view_pruning_tdgr_setup_views_persistent_list  { func_worst_scenario test_worst_scenario}
setOptMode -opt_drv_margin                                     0
setOptMode -opt_enable_podv2_clock_opt_flow                    false
setOptMode -opt_exp_buffer_tat_enhancement                     true
setOptMode -opt_exp_global_sizing_tat_fix                      true
setOptMode -opt_exp_pre_cts_new_standard_flow                  true
setOptMode -opt_exp_reclaim_area_rebuffer_tat_fix              true
setOptMode -opt_exp_roi_flow_tat_enhancements                  true
setOptMode -opt_exp_view_pruning_timer_mode                    low
setOptMode -opt_flow_ccopt_extreme_tat_enhancement_v2          true
setOptMode -opt_drv                                            true
setOptMode -opt_post_route_enable_si_attacker_sizing           false
setOptMode -opt_resize_flip_flops                              true
setOptMode -opt_view_pruning_placement_setup_view_list         { func_worst_scenario  }
setOptMode -opt_preserve_all_sequential                        true
setOptMode -opt_setup_target_slack                             0
setOptMode -opt_skew                                           false
setOptMode -opt_skew_ccopt                                     none
setOptMode -opt_skew_post_route                                false
setOptMode -opt_skew_pre_cts                                   false

(ccopt_design): CTS Engine: auto. Used Spec: pre-existing CCOPT spec.
Placement constraints of type 'region' or 'fence' will not be downgraded to 'guide' because the property change_fences_to_guides has been set to false.
Using CCOpt effort none.
Updating ideal nets and annotations...
Clock tree spec update: Ideal nets, transition and delay annotations were updated to match active timing constraints.
Updating ideal nets and annotations done. (took cpu=0:00:00.0 real=0:00:00.0)
CCOpt::Phase::Initialization...
Check Prerequisites...
Net 'sdram_clk' is pre-routed or has the -skip_routing attribute.
Net 'CTS_39' is pre-routed or has the -skip_routing attribute.
Net 'CTS_38' is pre-routed or has the -skip_routing attribute.
Net 'CTS_34' is pre-routed or has the -skip_routing attribute.
Net 'CTS_35' is pre-routed or has the -skip_routing attribute.
Net 'CTS_36' is pre-routed or has the -skip_routing attribute.
Net 'CTS_37' is pre-routed or has the -skip_routing attribute.
Found 7 pre-routed clock net(s). Pre-routed clock nets are treated as dont_touch and their routing geometry will be preserved.
Leaving CCOpt scope - CheckPlace...

Begin checking placement ... (start mem=5123.5M, init mem=4911.9M)
*info: Placed = 40636          (Fixed = 160)
*info: Unplaced = 0           
Placement Density:42.59%(145734/342155)
Placement Density (including fixed std cells):42.68%(146258/342679)
PowerDomain Density <PD_RISC_CORE>:26.16%(5993/22909)
PowerDomain Density <PD_ORCA_TOP>:43.77%(139741/319247)
Finished checkPlace (total: cpu=0:00:02.0, real=0:00:01.0; vio checks: cpu=0:00:01.6, real=0:00:01.0; mem=4878.4M)
Leaving CCOpt scope - CheckPlace done. (took cpu=0:00:02.0 real=0:00:00.7)
**WARN: (IMPCCOPT-2015):	Innovus will not update I/O latencies for the following reason(s):
 * CCOpt property update_io_latency is false

No differences between SDC and CTS ideal net status found.
No differences between SDC and CTS transition time annotations found.
No differences between SDC and CTS delay annotations found.
Found 0 ideal nets, 0 pins with transition annotations, 0 instances with delay annotations, 0 nets with delay annotations, refer to logv for details.

Check Prerequisites done. (took cpu=0:00:02.0 real=0:00:00.7)
CCOpt::Phase::Initialization done. (took cpu=0:00:02.0 real=0:00:00.7)
Executing ccopt post-processing.
Synthesizing clock trees with CCOpt...
*** CTS #1 [begin] (ccopt_design #1) : totSession cpu/real = 0:36:49.5/0:16:27.3 (2.2), mem = 4878.4M
CCOpt::Phase::PreparingToBalance...
Leaving CCOpt scope - Initializing power interface...
Leaving CCOpt scope - Initializing power interface done. (took cpu=0:00:00.0 real=0:00:00.0)
Found 0 advancing pin insertion delay (0.000% of 3515 clock tree sinks)
Found 0 delaying pin insertion delay (0.000% of 3515 clock tree sinks)
**WARN: (IMPCCOPT-1127):	The skew group default.PCI_CLK/func_worst_mode has been identified as a duplicate of: PCI_CLK/func_best_mode
**WARN: (IMPCCOPT-1127):	The skew group default.PCI_CLK/test_best_mode has been identified as a duplicate of: PCI_CLK/func_best_mode
**WARN: (IMPCCOPT-1127):	The skew group default.PCI_CLK/test_worst_mode has been identified as a duplicate of: PCI_CLK/func_best_mode
**WARN: (IMPCCOPT-1127):	The skew group default.SDRAM_CLK/func_worst_mode has been identified as a duplicate of: SDRAM_CLK/func_best_mode
**WARN: (IMPCCOPT-1127):	The skew group default.SDRAM_CLK/test_best_mode has been identified as a duplicate of: SDRAM_CLK/func_best_mode
**WARN: (IMPCCOPT-1127):	The skew group default.SDRAM_CLK/test_worst_mode has been identified as a duplicate of: SDRAM_CLK/func_best_mode
**WARN: (IMPCCOPT-1127):	The skew group default.SYS_2x_CLK/test_best_mode has been identified as a duplicate of: SYS_2x_CLK/func_best_mode
**WARN: (IMPCCOPT-1127):	The skew group default.SYS_2x_CLK/test_worst_mode has been identified as a duplicate of: SYS_2x_CLK/func_worst_mode
The skew group PCI_CLK/func_worst_mode has been identified as a duplicate of: PCI_CLK/func_best_mode, so it will not be cloned.
The skew group PCI_CLK/test_best_mode has been identified as a duplicate of: PCI_CLK/func_best_mode, so it will not be cloned.
The skew group PCI_CLK/test_worst_mode has been identified as a duplicate of: PCI_CLK/func_best_mode, so it will not be cloned.
The skew group SDRAM_CLK/func_worst_mode has been identified as a duplicate of: SDRAM_CLK/func_best_mode, so it will not be cloned.
The skew group SDRAM_CLK/test_best_mode has been identified as a duplicate of: SDRAM_CLK/func_best_mode, so it will not be cloned.
The skew group SDRAM_CLK/test_worst_mode has been identified as a duplicate of: SDRAM_CLK/func_best_mode, so it will not be cloned.
The skew group SYS_2x_CLK/test_best_mode has been identified as a duplicate of: SYS_2x_CLK/func_best_mode, so it will not be cloned.
The skew group SYS_2x_CLK/test_worst_mode has been identified as a duplicate of: SYS_2x_CLK/func_worst_mode, so it will not be cloned.
Leaving CCOpt scope - optDesignGlobalRouteStep...
[PSP]    Started Early Global Route ( Curr Mem: 4.53 MB )
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
[PSP]    Started Early Global Route kernel ( Curr Mem: 4.53 MB )
[NR-eGR] Read 43167 nets ( ignored 7 )
[NR-eGR] There are 88 clock nets ( 0 with NDR ).
[NR-eGR] Layer group 1: route 43160 net(s) in layer range [2, 10]
[NR-eGR] Early Global Route overflow of layer group 1: 0.24% H + 0.02% V. EstWL: 9.112851e+05um
[NR-eGR] Overflow after Early Global Route 0.23% H + 0.00% V
[NR-eGR] Total eGR-routed clock nets wire length: 24270um, number of vias: 11197
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR]               Length (um)    Vias 
[NR-eGR] ----------------------------------
[NR-eGR]  M1    (1H)             0  163267 
[NR-eGR]  M2    (2V)        229490  220059 
[NR-eGR]  M3    (3H)        338566   67982 
[NR-eGR]  M4    (4V)        137104   15243 
[NR-eGR]  M5    (5H)        138393    3964 
[NR-eGR]  M6    (6V)         43464    2160 
[NR-eGR]  M7    (7H)         62824     404 
[NR-eGR]  M8    (8V)          4404     136 
[NR-eGR]  M9    (9H)          6601       2 
[NR-eGR]  MRDL  (10V)            5       0 
[NR-eGR] ----------------------------------
[NR-eGR]        Total       960851  473217 
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR] Total half perimeter of net bounding box: 831884um
[NR-eGR] Total length: 960851um, number of vias: 473217
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR] Finished Early Global Route kernel ( CPU: 8.62 sec, Real: 3.95 sec, Curr Mem: 4.51 MB )
[NR-eGR] Finished Early Global Route ( CPU: 8.68 sec, Real: 4.00 sec, Curr Mem: 4.43 MB )
Leaving CCOpt scope - optDesignGlobalRouteStep done. (took cpu=0:00:08.7 real=0:00:04.1)
Legalization setup...
Using cell based legalization.
Leaving CCOpt scope - Initializing placement interface...

Leaving CCOpt scope - Initializing placement interface done. (took cpu=0:00:00.9 real=0:00:00.5)
Max route layer is changed from 127 to 10 because there is no routing track above this layer
[PSP]    Load db... (mem=4.4M)
[PSP]    Read data from FE... (mem=4.4M)
[PSP]    Read rows... (mem=4.4M)
**WARN: (IMPPSP-1131):	For techSite unitdouble, row: (0, 0) - (982528, 3344) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unitdouble, row: (0, 3344) - (982528, 6688) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unitdouble, row: (0, 6688) - (982528, 10032) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unitdouble, row: (0, 581856) - (982528, 585200) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unitdouble, row: (0, 585200) - (982528, 588544) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unitdouble, row: (0, 588544) - (982528, 591888) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1132):	For techSite unitdouble, have a total of 6 rows defined outside of core-box
**WARN: (IMPPSP-1131):	For techSite unit, row: (0, 0) - (982528, 1672) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unit, row: (0, 1672) - (982528, 3344) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unit, row: (0, 3344) - (982528, 5016) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unit, row: (0, 5016) - (982528, 6688) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unit, row: (0, 6688) - (982528, 8360) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unit, row: (0, 8360) - (9880, 10032) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unit, row: (420128, 8360) - (982528, 10032) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unit, row: (0, 10032) - (9880, 11704) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unit, row: (0, 11704) - (9880, 13376) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unit, row: (0, 13376) - (9880, 15048) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unit, row: (0, 15048) - (9880, 16720) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unit, row: (0, 16720) - (9880, 18392) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unit, row: (0, 18392) - (9880, 20064) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: (IMPPSP-1131):	For techSite unit, row: (0, 20064) - (9880, 21736) is outside of core-box: (10032, 10032) - (972496, 583680)
**WARN: [PSP]    Only the first 20 messages are printed.
**WARN: (IMPPSP-1132):	For techSite unit, have a total of 118 rows defined outside of core-box
[PSP]    Done Read rows (cpu=0.000s, mem=4.4M)

[PSP]    Read module constraints... (mem=4.4M)
[PSP]    Done Read module constraints (cpu=0.010s, mem=4.4M)

[PSP]    Done Read data from FE (cpu=0.080s, mem=4.4M)

[PSP]    Done Load db (cpu=0.080s, mem=4.4M)

[PSP]    Constructing placeable region... (mem=4.4M)
**WARN: [PSP]    Hinsts PD_RISC_CORE and core region have partial overlap region (10.032 10.032 420.032 185.032)
[PSP]    Compute region effective width... (mem=4.4M)
[PSP]    Done Compute region effective width (cpu=0.000s, mem=4.4M)

[PSP]    Done Constructing placeable region (cpu=0.010s, mem=4.4M)

Legalization setup done. (took cpu=0:00:01.0 real=0:00:00.6)
Validating CTS configuration...
CCOpt power management detected and enabled.
Checking module port directions...
Checking module port directions done. (took cpu=0:00:00.0 real=0:00:00.0)
Non-default CCOpt properties:
  Public non-default CCOpt properties:
    buffer_cells is set for at least one object
    cts_merge_clock_gates is set for at least one object
    cts_merge_clock_logic is set for at least one object
    extract_balance_multi_source_clocks: true (default: false)
    inverter_cells is set for at least one object
    primary_delay_corner: worst_corner (default: )
    route_type is set for at least one object
    routing_top_min_fanout is set for at least one object
    source_driver is set for at least one object
    source_group_clock_trees is set for at least one object
    target_insertion_delay is set for at least one object
    target_max_trans is set for at least one object
    target_max_trans_sdc is set for at least one object
    target_skew is set for at least one object
    update_io_latency: 0 (default: true)
    use_inverters is set for at least one object
  Private non-default CCOpt properties:
    clock_nets_detailed_routed: 1 (default: false)
    no_symmetry_buffers is set for at least one object
    single_driver_per_grid_point is set for at least one object
Updating RC Grid density data for preRoute extraction ...
Initializing multi-corner capacitance tables ... 
Initializing multi-corner resistance tables ...
Route type trimming info:
  No route type modifications were made.
Library trimming buffers in power domain PD_RISC_CORE and half-corner worst_corner:setup.late removed 0 of 5 cells
Original list had 5 cells:
NBUFFX32_LVT NBUFFX16_LVT NBUFFX8_LVT NBUFFX4_LVT NBUFFX2_LVT 
Library trimming was not able to trim any cells:
NBUFFX32_LVT NBUFFX16_LVT NBUFFX8_LVT NBUFFX4_LVT NBUFFX2_LVT 
Library trimming buffers in power domain PD_ORCA_TOP and half-corner worst_corner:setup.late removed 0 of 5 cells
Original list had 5 cells:
NBUFFX32_LVT NBUFFX16_LVT NBUFFX8_LVT NBUFFX4_LVT NBUFFX2_LVT 
Library trimming was not able to trim any cells:
NBUFFX32_LVT NBUFFX16_LVT NBUFFX8_LVT NBUFFX4_LVT NBUFFX2_LVT 
**ERROR: (IMPCCOPT-4334):	The lib cell 'INVX6_LVT' specified in the inverter_cells property was not found.  This cell will not be used when synthesizing -clock_tree flexible_htree_flex_HTREE_14 -power_domain PD_RISC_CORE.
Library trimming inverters in power domain PD_RISC_CORE and half-corner worst_corner:setup.late removed 0 of 4 cells
Original list had 4 cells:
INVX16_LVT INVX8_LVT INVX4_LVT INVX2_LVT 
Library trimming was not able to trim any cells:
INVX16_LVT INVX8_LVT INVX4_LVT INVX2_LVT 
**ERROR: (IMPCCOPT-4334):	The lib cell 'INVX6_LVT' specified in the inverter_cells property was not found.  This cell will not be used when synthesizing -clock_tree flexible_htree_flex_HTREE_14 -power_domain PD_ORCA_TOP.
Library trimming inverters in power domain PD_ORCA_TOP and half-corner worst_corner:setup.late removed 0 of 4 cells
Original list had 4 cells:
INVX16_LVT INVX8_LVT INVX4_LVT INVX2_LVT 
Library trimming was not able to trim any cells:
INVX16_LVT INVX8_LVT INVX4_LVT INVX2_LVT 
**ERROR: (IMPCCOPT-4334):	The lib cell 'INVX6_LVT' specified in the inverter_cells property was not found.  This cell will not be used when synthesizing -clock_tree flexible_htree_flex_HTREE_13 -power_domain PD_RISC_CORE.
**ERROR: (IMPCCOPT-4334):	The lib cell 'INVX6_LVT' specified in the inverter_cells property was not found.  This cell will not be used when synthesizing -clock_tree flexible_htree_flex_HTREE_13 -power_domain PD_ORCA_TOP.
**ERROR: (IMPCCOPT-4334):	The lib cell 'INVX6_LVT' specified in the inverter_cells property was not found.  This cell will not be used when synthesizing -clock_tree flexible_htree_flex_HTREE_12 -power_domain PD_RISC_CORE.
**ERROR: (IMPCCOPT-4334):	The lib cell 'INVX6_LVT' specified in the inverter_cells property was not found.  This cell will not be used when synthesizing -clock_tree flexible_htree_flex_HTREE_12 -power_domain PD_ORCA_TOP.
**ERROR: (IMPCCOPT-4334):	The lib cell 'INVX6_LVT' specified in the inverter_cells property was not found.  This cell will not be used when synthesizing -clock_tree flexible_htree_flex_HTREE_11 -power_domain PD_RISC_CORE.
**ERROR: (IMPCCOPT-4334):	The lib cell 'INVX6_LVT' specified in the inverter_cells property was not found.  This cell will not be used when synthesizing -clock_tree flexible_htree_flex_HTREE_11 -power_domain PD_ORCA_TOP.
**ERROR: (IMPCCOPT-4334):	The lib cell 'INVX6_LVT' specified in the inverter_cells property was not found.  This cell will not be used when synthesizing -clock_tree flexible_htree_flex_HTREE_10 -power_domain PD_RISC_CORE.
**ERROR: (IMPCCOPT-4334):	The lib cell 'INVX6_LVT' specified in the inverter_cells property was not found.  This cell will not be used when synthesizing -clock_tree flexible_htree_flex_HTREE_10 -power_domain PD_ORCA_TOP.
**ERROR: (IMPCCOPT-4334):	The lib cell 'INVX6_LVT' specified in the inverter_cells property was not found.  This cell will not be used when synthesizing -clock_tree flexible_htree_flex_HTREE_9 -power_domain PD_RISC_CORE.
**ERROR: (IMPCCOPT-4334):	The lib cell 'INVX6_LVT' specified in the inverter_cells property was not found.  This cell will not be used when synthesizing -clock_tree flexible_htree_flex_HTREE_9 -power_domain PD_ORCA_TOP.
**ERROR: (IMPCCOPT-4334):	The lib cell 'INVX6_LVT' specified in the inverter_cells property was not found.  This cell will not be used when synthesizing -clock_tree flexible_htree_flex_HTREE_8 -power_domain PD_RISC_CORE.
**ERROR: (IMPCCOPT-4334):	The lib cell 'INVX6_LVT' specified in the inverter_cells property was not found.  This cell will not be used when synthesizing -clock_tree flexible_htree_flex_HTREE_8 -power_domain PD_ORCA_TOP.
**ERROR: (IMPCCOPT-4334):	The lib cell 'INVX6_LVT' specified in the inverter_cells property was not found.  This cell will not be used when synthesizing -clock_tree flexible_htree_flex_HTREE_7 -power_domain PD_RISC_CORE.
**ERROR: (IMPCCOPT-4334):	The lib cell 'INVX6_LVT' specified in the inverter_cells property was not found.  This cell will not be used when synthesizing -clock_tree flexible_htree_flex_HTREE_7 -power_domain PD_ORCA_TOP.
**ERROR: (IMPCCOPT-4334):	The lib cell 'INVX6_LVT' specified in the inverter_cells property was not found.  This cell will not be used when synthesizing -clock_tree flexible_htree_flex_HTREE_6 -power_domain PD_RISC_CORE.
**ERROR: (IMPCCOPT-4334):	The lib cell 'INVX6_LVT' specified in the inverter_cells property was not found.  This cell will not be used when synthesizing -clock_tree flexible_htree_flex_HTREE_6 -power_domain PD_ORCA_TOP.
**ERROR: (IMPCCOPT-4334):	The lib cell 'INVX6_LVT' specified in the inverter_cells property was not found.  This cell will not be used when synthesizing -clock_tree flexible_htree_flex_HTREE_5 -power_domain PD_RISC_CORE.
**ERROR: (IMPCCOPT-4334):	The lib cell 'INVX6_LVT' specified in the inverter_cells property was not found.  This cell will not be used when synthesizing -clock_tree flexible_htree_flex_HTREE_5 -power_domain PD_ORCA_TOP.
**WARN: (EMS-27):	Message (IMPCCOPT-4334) has exceeded the current message display limit of 20.
To increase the message display limit, refer to the product command reference manual.
Clock tree balancer configuration for clock_trees flexible_htree_flex_HTREE_14 flexible_htree_flex_HTREE_13 flexible_htree_flex_HTREE_12 flexible_htree_flex_HTREE_11 flexible_htree_flex_HTREE_10 flexible_htree_flex_HTREE_9 flexible_htree_flex_HTREE_8 flexible_htree_flex_HTREE_7 flexible_htree_flex_HTREE_6 flexible_htree_flex_HTREE_5 flexible_htree_flex_HTREE_4 flexible_htree_flex_HTREE_3 flexible_htree_flex_HTREE_2 flexible_htree_flex_HTREE_1 flexible_htree_flex_HTREE_0 SYS_CLK:
Non-default CCOpt properties:
  Public non-default CCOpt properties:
    cts_merge_clock_gates: true (default: false)
    cts_merge_clock_logic: true (default: false)
    route_type (leaf): default_route_type_leaf (default: default)
    route_type (top): topshieldRoute (default: default)
    route_type (trunk): trunkshieldRoute (default: default)
    routing_top_min_fanout: 10000 (default: unset)
    use_inverters: true (default: auto)
  No private non-default CCOpt properties
For power domain PD_RISC_CORE:
  Buffers:     NBUFFX32_LVT NBUFFX16_LVT NBUFFX8_LVT NBUFFX4_LVT NBUFFX2_LVT
  Inverters:   INVX16_LVT INVX8_LVT INVX4_LVT INVX2_LVT
  Clock gates: CGLPPSX16_LVT CGLPPSX16_RVT CGLPPSX8_LVT CGLPPSX8_RVT CGLPPSX4_LVT CGLPPSX4_RVT CGLPPSX16_HVT CGLPPSX8_HVT CGLPPSX2_LVT CGLPPSX4_HVT CGLPPSX2_RVT CGLPPSX2_HVT
For power domain PD_ORCA_TOP:
  Buffers:     NBUFFX32_LVT NBUFFX16_LVT NBUFFX8_LVT NBUFFX4_LVT NBUFFX2_LVT
  Inverters:   INVX16_LVT INVX8_LVT INVX4_LVT INVX2_LVT
  Clock gates: CGLPPSX16_LVT CGLPPSX8_LVT CGLPPSX4_LVT CGLPPSX16_RVT CGLPPSX8_RVT CGLPPSX4_RVT CGLPPSX2_LVT CGLPPSX2_RVT CGLPPSX8_HVT CGLPPSX16_HVT CGLPPSX4_HVT CGLPPSX2_HVT
  Unblocked area available for placement of any clock cells in power_domain PD_RISC_CORE: 23569.889um^2
  Unblocked area available for placement of any clock cells in power_domain PD_ORCA_TOP: 290638.758um^2
Top Routing info:
  Route-type name: topshieldRoute; Top/bottom preferred layer name: M8/M7; 
  Shielded - shield side: Two Side; Mask Constraint: 0; Source: route_type.
Trunk Routing info:
  Route-type name: trunkshieldRoute; Top/bottom preferred layer name: M6/M5; 
  Shielded - shield side: Two Side; Mask Constraint: 0; Source: route_type.
Leaf Routing info:
  Route-type name: default_route_type_leaf; Top/bottom preferred layer name: M4/M3; 
  Unshielded; Preferred extra space: 1; Mask Constraint: 0; Source: route_type.
For timing_corner worst_corner:setup, late and power domain PD_ORCA_TOP:
  Slew time target (leaf):    0.243ns
  Slew time target (trunk):   0.243ns
  Slew time target (top):     0.243ns
  Buffer unit delay: 0.107ns
  Buffer max distance: 760.000um
Fastest wire driving cells and distances:
  For nets routed with trunk routing rules:
    Buffer    : {lib_cell:NBUFFX32_LVT, fastest_considered_half_corner=worst_corner:setup.late, optimalDrivingDistance=1133.302um, saturatedSlew=0.180ns, speed=3854.769um per ns, cellArea=9.419um^2 per 1000um}
    Inverter  : {lib_cell:INVX16_LVT, fastest_considered_half_corner=worst_corner:setup.late, optimalDrivingDistance=566.912um, saturatedSlew=0.096ns, speed=5671.956um per ns, cellArea=8.966um^2 per 1000um}
    Clock gate: {lib_cell:CGLPPSX8_LVT, fastest_considered_half_corner=worst_corner:setup.late, optimalDrivingDistance=610.000um, saturatedSlew=0.242ns, speed=1081.944um per ns, cellArea=13.749um^2 per 1000um}
  For nets routed with top routing rules:
    Buffer    : {lib_cell:NBUFFX32_LVT, fastest_considered_half_corner=worst_corner:setup.late, optimalDrivingDistance=1130.167um, saturatedSlew=0.181ns, speed=3836.276um per ns, cellArea=9.445um^2 per 1000um}
    Inverter  : {lib_cell:INVX16_LVT, fastest_considered_half_corner=worst_corner:setup.late, optimalDrivingDistance=562.732um, saturatedSlew=0.096ns, speed=5644.253um per ns, cellArea=9.033um^2 per 1000um}
    Clock gate: {lib_cell:CGLPPSX8_LVT, fastest_considered_half_corner=worst_corner:setup.late, optimalDrivingDistance=604.888um, saturatedSlew=0.242ns, speed=1072.877um per ns, cellArea=13.865um^2 per 1000um}
For timing_corner worst_corner:setup, late and power domain PD_RISC_CORE:
  Slew time target (leaf):    0.243ns
  Slew time target (trunk):   0.243ns
  Slew time target (top):     0.243ns
  Buffer unit delay: 0.047ns
  Buffer max distance: 760.000um
Fastest wire driving cells and distances:
  For nets routed with trunk routing rules:
    Buffer    : {lib_cell:NBUFFX32_LVT, fastest_considered_half_corner=worst_corner:setup.late, optimalDrivingDistance=788.452um, saturatedSlew=0.083ns, speed=6384.227um per ns, cellArea=13.538um^2 per 1000um}
    Inverter  : {lib_cell:INVX16_LVT, fastest_considered_half_corner=worst_corner:setup.late, optimalDrivingDistance=445.692um, saturatedSlew=0.054ns, speed=8949.639um per ns, cellArea=11.404um^2 per 1000um}
    Clock gate: {lib_cell:CGLPPSX8_LVT, fastest_considered_half_corner=worst_corner:setup.late, optimalDrivingDistance=680.000um, saturatedSlew=0.129ns, speed=2696.273um per ns, cellArea=12.333um^2 per 1000um}
  For nets routed with top routing rules:
    Buffer    : {lib_cell:NBUFFX32_LVT, fastest_considered_half_corner=worst_corner:setup.late, optimalDrivingDistance=789.497um, saturatedSlew=0.084ns, speed=6351.545um per ns, cellArea=13.520um^2 per 1000um}
    Inverter  : {lib_cell:INVX16_LVT, fastest_considered_half_corner=worst_corner:setup.late, optimalDrivingDistance=446.737um, saturatedSlew=0.055ns, speed=8890.289um per ns, cellArea=11.378um^2 per 1000um}
    Clock gate: {lib_cell:CGLPPSX8_LVT, fastest_considered_half_corner=worst_corner:setup.late, optimalDrivingDistance=680.000um, saturatedSlew=0.130ns, speed=2687.747um per ns, cellArea=12.333um^2 per 1000um}

Clock tree balancer configuration for clock_trees PCI_CLK SDRAM_CLK SYS_2x_CLK ate_clk:
Non-default CCOpt properties:
  Public non-default CCOpt properties:
    cts_merge_clock_gates: true (default: false)
    cts_merge_clock_logic: true (default: false)
    route_type (leaf): default_route_type_leaf (default: default)
    route_type (top): topshieldRoute (default: default)
    route_type (trunk): trunkshieldRoute (default: default)
    routing_top_min_fanout: 10000 (default: unset)
    source_driver: INVX8_HVT/A INVX8_HVT/Y (default: )
    use_inverters: true (default: auto)
  No private non-default CCOpt properties
For power domain PD_RISC_CORE:
  Buffers:     NBUFFX32_LVT NBUFFX16_LVT NBUFFX8_LVT NBUFFX4_LVT NBUFFX2_LVT
  Inverters:   INVX16_LVT INVX8_LVT INVX4_LVT INVX2_LVT
  Clock gates: CGLPPSX16_LVT CGLPPSX16_RVT CGLPPSX8_LVT CGLPPSX8_RVT CGLPPSX4_LVT CGLPPSX4_RVT CGLPPSX16_HVT CGLPPSX8_HVT CGLPPSX2_LVT CGLPPSX4_HVT CGLPPSX2_RVT CGLPPSX2_HVT
For power domain PD_ORCA_TOP:
  Buffers:     NBUFFX32_LVT NBUFFX16_LVT NBUFFX8_LVT NBUFFX4_LVT NBUFFX2_LVT
  Inverters:   INVX16_LVT INVX8_LVT INVX4_LVT INVX2_LVT
  Clock gates: CGLPPSX16_LVT CGLPPSX8_LVT CGLPPSX4_LVT CGLPPSX16_RVT CGLPPSX8_RVT CGLPPSX4_RVT CGLPPSX2_LVT CGLPPSX2_RVT CGLPPSX8_HVT CGLPPSX16_HVT CGLPPSX4_HVT CGLPPSX2_HVT
  Unblocked area available for placement of any clock cells in power_domain PD_RISC_CORE: 23569.889um^2
  Unblocked area available for placement of any clock cells in power_domain PD_ORCA_TOP: 290638.758um^2
Top Routing info:
  Route-type name: topshieldRoute; Top/bottom preferred layer name: M8/M7; 
  Shielded - shield side: Two Side; Mask Constraint: 0; Source: route_type.
Trunk Routing info:
  Route-type name: trunkshieldRoute; Top/bottom preferred layer name: M6/M5; 
  Shielded - shield side: Two Side; Mask Constraint: 0; Source: route_type.
Leaf Routing info:
  Route-type name: default_route_type_leaf; Top/bottom preferred layer name: M4/M3; 
  Unshielded; Preferred extra space: 1; Mask Constraint: 0; Source: route_type.
For timing_corner worst_corner:setup, late and power domain PD_ORCA_TOP:
  Slew time target (leaf):    0.243ns
  Slew time target (trunk):   0.243ns
  Slew time target (top):     0.243ns
  Buffer unit delay: 0.107ns
  Buffer max distance: 760.000um
Fastest wire driving cells and distances:
  For nets routed with trunk routing rules:
    Buffer    : {lib_cell:NBUFFX32_LVT, fastest_considered_half_corner=worst_corner:setup.late, optimalDrivingDistance=1133.302um, saturatedSlew=0.180ns, speed=3854.769um per ns, cellArea=9.419um^2 per 1000um}
    Inverter  : {lib_cell:INVX16_LVT, fastest_considered_half_corner=worst_corner:setup.late, optimalDrivingDistance=566.912um, saturatedSlew=0.096ns, speed=5671.956um per ns, cellArea=8.966um^2 per 1000um}
    Clock gate: {lib_cell:CGLPPSX8_LVT, fastest_considered_half_corner=worst_corner:setup.late, optimalDrivingDistance=610.000um, saturatedSlew=0.242ns, speed=1081.944um per ns, cellArea=13.749um^2 per 1000um}
  For nets routed with top routing rules:
    Buffer    : {lib_cell:NBUFFX32_LVT, fastest_considered_half_corner=worst_corner:setup.late, optimalDrivingDistance=1130.167um, saturatedSlew=0.181ns, speed=3836.276um per ns, cellArea=9.445um^2 per 1000um}
    Inverter  : {lib_cell:INVX16_LVT, fastest_considered_half_corner=worst_corner:setup.late, optimalDrivingDistance=562.732um, saturatedSlew=0.096ns, speed=5644.253um per ns, cellArea=9.033um^2 per 1000um}
    Clock gate: {lib_cell:CGLPPSX8_LVT, fastest_considered_half_corner=worst_corner:setup.late, optimalDrivingDistance=604.888um, saturatedSlew=0.242ns, speed=1072.877um per ns, cellArea=13.865um^2 per 1000um}
For timing_corner worst_corner:setup, late and power domain PD_RISC_CORE:
  Slew time target (leaf):    0.243ns
  Slew time target (trunk):   0.243ns
  Slew time target (top):     0.243ns
  Buffer unit delay: 0.047ns
  Buffer max distance: 760.000um
Fastest wire driving cells and distances:
  For nets routed with trunk routing rules:
    Buffer    : {lib_cell:NBUFFX32_LVT, fastest_considered_half_corner=worst_corner:setup.late, optimalDrivingDistance=788.452um, saturatedSlew=0.083ns, speed=6384.227um per ns, cellArea=13.538um^2 per 1000um}
    Inverter  : {lib_cell:INVX16_LVT, fastest_considered_half_corner=worst_corner:setup.late, optimalDrivingDistance=445.692um, saturatedSlew=0.054ns, speed=8949.639um per ns, cellArea=11.404um^2 per 1000um}
    Clock gate: {lib_cell:CGLPPSX8_LVT, fastest_considered_half_corner=worst_corner:setup.late, optimalDrivingDistance=680.000um, saturatedSlew=0.129ns, speed=2696.273um per ns, cellArea=12.333um^2 per 1000um}
  For nets routed with top routing rules:
    Buffer    : {lib_cell:NBUFFX32_LVT, fastest_considered_half_corner=worst_corner:setup.late, optimalDrivingDistance=789.497um, saturatedSlew=0.084ns, speed=6351.545um per ns, cellArea=13.520um^2 per 1000um}
    Inverter  : {lib_cell:INVX16_LVT, fastest_considered_half_corner=worst_corner:setup.late, optimalDrivingDistance=446.737um, saturatedSlew=0.055ns, speed=8890.289um per ns, cellArea=11.378um^2 per 1000um}
    Clock gate: {lib_cell:CGLPPSX8_LVT, fastest_considered_half_corner=worst_corner:setup.late, optimalDrivingDistance=680.000um, saturatedSlew=0.130ns, speed=2687.747um per ns, cellArea=12.333um^2 per 1000um}


Logic Sizing Table:

------------------------------------------------------------------------------------------------------------------
Cell          Instance count    Source         Eligible library cells
------------------------------------------------------------------------------------------------------------------
AO21X1_RVT           4          library set    {AO21X2_LVT AO21X2_RVT AO21X1_LVT AO21X1_RVT AO21X2_HVT AO21X1_HVT}
AO22X1_RVT          16          library set    {AO22X1_RVT AO22X2_HVT}
AO22X2_RVT          16          library set    {AO22X2_RVT AO22X2_HVT}
LSUPX1_RVT           1          library set    {LSUPX8_LVT LSUPX4_LVT LSUPX2_LVT LSUPX1_LVT}
------------------------------------------------------------------------------------------------------------------


Clock tree timing engine global stage delay update for worst_corner:setup.late...
Clock tree timing engine global stage delay update for worst_corner:setup.late done. (took cpu=0:00:00.2 real=0:00:00.0)
Clock tree SDRAM_CLK has 1 max_capacitance violation.
Clock tree balancer configuration for skew_group PCI_CLK/func_best_mode:
 Created from constraint modes: {[]}
  Sources:                     pin pclk
  Total number of sinks:       401
  Delay constrained sinks:     401
  Constrains:                  default
  Non-leaf sinks:              0
  Ignore pins:                 0
 Timing corner worst_corner:setup.late:
  Skew target:                 0.085ns
  Insertion delay target:      0.800ns
Clock tree balancer configuration for skew_group SDRAM_CLK/func_best_mode:
 Created from constraint modes: {[]}
  Sources:                     pin sdram_clk
  Total number of sinks:       2888
  Delay constrained sinks:     2853
  Constrains:                  default
  Non-leaf sinks:              0
  Ignore pins:                 0
 Timing corner worst_corner:setup.late:
  Skew target:                 0.085ns
  Insertion delay target:      0.800ns
Clock tree balancer configuration for skew_group SYS_2x_CLK/func_best_mode:
 Created from constraint modes: {[]}
  Sources:                     pin sys_2x_clk
  Total number of sinks:       214
  Delay constrained sinks:     214
  Constrains:                  default
  Non-leaf sinks:              0
  Ignore pins:                 0
 Timing corner worst_corner:setup.late:
  Skew target:                 0.085ns
  Insertion delay target:      0.800ns
Clock tree balancer configuration for skew_group SYS_2x_CLK/func_worst_mode:
 Created from constraint modes: {[]}
  Sources:                     pin sys_2x_clk
  Total number of sinks:       20
  Delay constrained sinks:     20
  Constrains:                  default
  Non-leaf sinks:              0
  Ignore pins:                 1
 Timing corner worst_corner:setup.late:
  Skew target:                 0.085ns
  Insertion delay target:      0.800ns
Clock tree balancer configuration for skew_group ate_clk/test_best_mode:
 Created from constraint modes: {[]}
  Sources:                     pin ate_clk
  Total number of sinks:       3482
  Delay constrained sinks:     3448
  Constrains:                  default
  Non-leaf sinks:              0
  Ignore pins:                 0
 Timing corner worst_corner:setup.late:
  Skew target:                 0.085ns
  Insertion delay target:      0.800ns
Clock tree balancer configuration for skew_group ate_clk/test_worst_mode:
 Created from constraint modes: {[]}
  Sources:                     pin ate_clk
  Total number of sinks:       3288
  Delay constrained sinks:     3254
  Constrains:                  default
  Non-leaf sinks:              0
  Ignore pins:                 1
 Timing corner worst_corner:setup.late:
  Skew target:                 0.085ns
  Insertion delay target:      0.800ns

Clock Tree Violations Report
============================

The clock tree has violations that CCOpt may not be able to correct due to the design settings.
A common cause is that the violation occurs in a part of the design (e.g. an ILM) that CCOpt cannot change.
Consider reviewing your design and relaunching CCOpt.


Max Capacitance Violations
--------------------------

Did not meet the max_capacitance constraint of 82.000fF below cell CTS_cfh_inv_00002 (a lib_cell INVX16_LVT) at (499.624,287.584), in power domain PD_ORCA_TOP, which drives a net CTS_38 which is user don't touch. Achieved capacitance of 93.249fF.


Primary reporting skew groups are:
skew_group SDRAM_CLK/func_best_mode with 2888 clock sinks


Constraint summary
==================

Transition constraints are active in the following delay corners:

worst_corner:setup.late

Cap constraints are active in the following delay corners:

worst_corner:setup.late

Transition constraint summary:

------------------------------------------------------------------------------------------------------------------------------------------------------
Delay corner                         Target (ns)    Num pins    Target source       Clock tree(s)
------------------------------------------------------------------------------------------------------------------------------------------------------
worst_corner:setup.late (primary)         -            -               -                                            -
                -                       0.243         3781      explicit            all
                -                       0.078            8      liberty explicit    SYS_2x_CLK
                -                       0.110            8      liberty explicit    SYS_2x_CLK
                -                       0.177            9      liberty explicit    ate_clk, SYS_2x_CLK, PCI_CLK, SYS_CLK, flexible_htree_flex_HTREE_0
                -                       0.180            1      liberty explicit    flexible_htree_flex_HTREE_0
                -                       0.184            4      liberty explicit    SYS_2x_CLK
                -                       0.230            1      liberty explicit    SYS_2x_CLK
                -                       0.241            1      liberty explicit    SYS_CLK
------------------------------------------------------------------------------------------------------------------------------------------------------

Capacitance constraint summary:

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Delay corner                         Limit (fF)    Num nets    Target source                Clock tree(s)
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
worst_corner:setup.late (primary)        -            -                    -                                                             -
                -                       8.000         23       library_or_sdc_constraint    SYS_2x_CLK, PCI_CLK, SYS_CLK, flexible_htree_flex_HTREE_0
                -                      16.000         38       library_or_sdc_constraint    ate_clk, SYS_2x_CLK, PCI_CLK, SYS_CLK, flexible_htree_flex_HTREE_0
                -                      32.000         26       library_or_sdc_constraint    flexible_htree_flex_HTREE_0
                -                      64.000         38       library_or_sdc_constraint    ate_clk, SYS_2x_CLK, SDRAM_CLK, PCI_CLK, flexible_htree_flex_HTREE_0
                                                                                             , flexible_htree_flex_HTREE_1, flexible_htree_flex_HTREE_2, flexible_htree_flex_HTREE_3
                                                                                             , flexible_htree_flex_HTREE_4, flexible_htree_flex_HTREE_5, flexible_htree_flex_HTREE_6
                                                                                             , flexible_htree_flex_HTREE_7, flexible_htree_flex_HTREE_8, flexible_htree_flex_HTREE_9
                                                                                             , flexible_htree_flex_HTREE_10, flexible_htree_flex_HTREE_11, flexible_htree_flex_HTREE_12
                                                                                             , flexible_htree_flex_HTREE_13, flexible_htree_flex_HTREE_14
                -                      82.000          6       library_or_sdc_constraint    SDRAM_CLK
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Clock DAG stats initial state:
  cell counts      : b=36, i=11, icg=26, dcg=0, l=37, total=110
  sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
  misc counts      : r=20, pp=1, mci=36
  cell areas       : b=104.199um^2, i=39.646um^2, icg=168.752um^2, dcg=0.000um^2, l=102.674um^2, total=415.271um^2
  hp wire lengths  : top=2584.456um, trunk=5198.248um, leaf=9748.616um, total=17531.320um
Clock DAG library cell distribution initial state {count}:
   Bufs: NBUFFX8_LVT: 4 NBUFFX8_RVT: 6 NBUFFX4_RVT: 26 
   Invs: INVX16_LVT: 6 INVX8_RVT: 1 INVX2_RVT: 4 
   ICGs: CGLPPRX8_LVT: 8 CGLNPRX2_LVT: 9 CGLPPRX2_LVT: 9 
 Logics: AO22X2_RVT: 16 LSUPX1_RVT: 1 AO21X1_RVT: 4 AO22X1_RVT: 16 
      flow.cputime  flow.realtime  timing.setup.tns  timing.setup.wns  snapshot
UM:*                                                                   InitialState

Distribution of half-perimeter wire length by ICG depth:

-----------------------------------------------------------------------------
Min ICG    Max ICG    Count    HPWL
Depth      Depth               (um)
-----------------------------------------------------------------------------
   0          0        98      [min=4, max=816, avg=145, sd=143, total=14214]
   0          1        11      [min=5, max=1205, avg=191, sd=352, total=2106]
   0          2         7      [min=82, max=478, avg=282, sd=157, total=1975]
-----------------------------------------------------------------------------

Have 8 CPUs available for CTS. Selected algorithms will run multithreaded.
**WARN: (IMPCCOPT-2314):	CCOpt found 7 clock tree nets marked as ideal or dont_touch. These will not be buffered.
Type 'man IMPCCOPT-2314' for more detail.

Ideal and dont_touch net fanout counts:

-----------------------------------------------------------
Min fanout    Max fanout    Number of ideal/dont_touch nets
-----------------------------------------------------------
      1            10                      7
     11           100                      0
    101          1000                      0
   1001         10000                      0
  10001           +                        0
-----------------------------------------------------------

Top ideal and dont_touch nets by fanout:

----------------------
Net name     Fanout ()
----------------------
CTS_38           4
CTS_37           4
CTS_36           4
CTS_35           4
CTS_34           4
sdram_clk        1
CTS_39           1
----------------------


No dont_touch hnets found in the clock tree

Total number of dont_touch hpins in the clock network: 1
  Large numbers of dont_touch hpins may damage runtime and QoR.
  Use report_ccopt_clock_tree_structure or the Clock Tree Debugger in unit delay mode to debug these.

Summary of reasons for dont_touch hpins in the clock network:

-----------------------
Reason            Count
-----------------------
upf_constraint      1
-----------------------

Total number of dont_touch hpins in the clock network with a physical location (typically partition pins): 0

Summary of dont_touch hpins in the clock network representing physical hierarchy:

---------------------
Type            Count
---------------------
ilm               0
partition         0
power_domain      1
fence             0
none              0
---------------------
Total             1
---------------------

Checking for illegal sizes of clock logic instances...
Checking for illegal sizes of clock logic instances done. (took cpu=0:00:00.0 real=0:00:00.0)
Validating CTS configuration done. (took cpu=0:00:09.8 real=0:00:08.4)
CCOpt configuration status: all checks passed.
Adding exclusion drivers to pins that are effective_sink_type exclude...
    Adding exclusion drivers (these will be instances of the smallest area library cells).
  No exclusion drivers are needed.
Adding exclusion drivers to pins that are effective_sink_type exclude done.
Antenna diode management...
  Found 0 antenna diodes in the clock trees.
  
Antenna diode management done.
Adding driver cells for primary IOs...
Adding driver cells for primary IOs done.
Adding driver cells for primary IOs...
Adding driver cells for primary IOs done.

----------------------------------------------------------------------------------------------
CCOpt reported the following when adding drivers below input ports and above output ports     
----------------------------------------------------------------------------------------------
  (empty table)
----------------------------------------------------------------------------------------------


Adding driver cell for primary IO roots...
Adding driver cell for primary IO roots done.
Maximizing clock DAG abstraction...
  Removing clock DAG drivers
Maximizing clock DAG abstraction done.
CCOpt::Phase::PreparingToBalance done. (took cpu=0:00:19.6 real=0:00:13.2)
Synthesizing clock trees...
  Preparing To Balance...
  Leaving CCOpt scope - Cleaning up placement interface...
  Leaving CCOpt scope - Cleaning up placement interface done. (took cpu=0:00:00.5 real=0:00:00.1)
  Leaving CCOpt scope - Initializing placement interface...

  Leaving CCOpt scope - Initializing placement interface done. (took cpu=0:00:00.3 real=0:00:00.3)
  Library trimming clock gates in power domain PD_ORCA_TOP and half-corner worst_corner:setup.late removed 4 of 6 cells
  Original list had 6 cells:
  CGLNPRX8_LVT CGLNPRX8_RVT CGLNPRX2_LVT CGLNPRX2_RVT CGLNPRX8_HVT CGLNPRX2_HVT 
  New trimmed list has 2 cells:
  CGLNPRX8_LVT CGLNPRX2_LVT 
  Library trimming clock gates in power domain PD_RISC_CORE and half-corner worst_corner:setup.late removed 3 of 6 cells
  Original list had 6 cells:
  CGLPPRX8_LVT CGLPPRX8_RVT CGLPPRX8_HVT CGLPPRX2_LVT CGLPPRX2_RVT CGLPPRX2_HVT 
  New trimmed list has 3 cells:
  CGLPPRX8_LVT CGLPPRX2_LVT CGLPPRX2_HVT 
  Library trimming clock gates in power domain PD_ORCA_TOP and half-corner worst_corner:setup.late removed 4 of 6 cells
  Original list had 6 cells:
  CGLPPRX8_LVT CGLPPRX8_RVT CGLPPRX2_LVT CGLPPRX2_RVT CGLPPRX8_HVT CGLPPRX2_HVT 
  New trimmed list has 2 cells:
  CGLPPRX8_LVT CGLPPRX2_LVT 
  Merging duplicate siblings in DAG...
    Clock DAG stats before merging:
      cell counts      : b=0, i=8, icg=26, dcg=0, l=37, total=71
      sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
      misc counts      : r=20, pp=1, mci=36
      cell areas       : b=0.000um^2, i=35.072um^2, icg=168.752um^2, dcg=0.000um^2, l=102.674um^2, total=306.498um^2
      hp wire lengths  : top=2584.456um, trunk=149.264um, leaf=14584.597um, total=17318.317um
    Clock DAG library cell distribution before merging {count}:
       Invs: INVX16_LVT: 6 INVX8_RVT: 1 INVX2_RVT: 1 
       ICGs: CGLPPRX8_LVT: 8 CGLNPRX2_LVT: 9 CGLPPRX2_LVT: 9 
     Logics: AO22X2_RVT: 16 LSUPX1_RVT: 1 AO21X1_RVT: 4 AO22X1_RVT: 16 
      flow.cputime  flow.realtime  timing.setup.tns  timing.setup.wns  snapshot
UM:*                                                                   before merging
    Resynthesising clock tree into netlist...
      Reset timing graph...
Ignoring AAE DB Resetting ...
      Reset timing graph done.
    Resynthesising clock tree into netlist done.
    Merging duplicate clock dag driver clones in DAG...
    Merging duplicate clock dag driver clones in DAG done.
    
    Clock gate merging summary:
    
    ----------------------------------------------------------
    Description                          Number of occurrences
    ----------------------------------------------------------
    Total clock gates                             26
    Globally unique enables                       25
    Potentially mergeable clock gates              1
    Actually merged clock gates                    0
    ----------------------------------------------------------
    
    --------------------------------------------
    Cannot merge reason    Number of occurrences
    --------------------------------------------
    GloballyUnique                  24
    UndrivenEnablePins               2
    --------------------------------------------
    
    Clock logic merging summary:
    
    -----------------------------------------------------------
    Description                           Number of occurrences
    -----------------------------------------------------------
    Total clock logics                             37
    Globally unique logic expressions              37
    Potentially mergeable clock logics              0
    Actually merged clock logics                    0
    -----------------------------------------------------------
    
    --------------------------------------------
    Cannot merge reason    Number of occurrences
    --------------------------------------------
    GloballyUnique                  37
    --------------------------------------------
    
    Disconnecting clock tree from netlist...
    Disconnecting clock tree from netlist done.
  Merging duplicate siblings in DAG done.
  Applying movement limits...
  Applying movement limits done.
  Preparing To Balance done. (took cpu=0:00:01.2 real=0:00:00.8)
  CCOpt::Phase::Construction...
  Stage::Clustering...
  Clustering...
    Initialize for clustering...
    Clock DAG stats before clustering:
      cell counts      : b=0, i=8, icg=26, dcg=0, l=37, total=71
      sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
      misc counts      : r=20, pp=1, mci=36
      cell areas       : b=0.000um^2, i=40.663um^2, icg=196.199um^2, dcg=0.000um^2, l=107.757um^2, total=344.619um^2
      hp wire lengths  : top=2584.456um, trunk=149.264um, leaf=14584.597um, total=17318.317um
    Clock DAG library cell distribution before clustering {count}:
       Invs: INVX16_LVT: 8 
       ICGs: CGLNPRX8_LVT: 9 CGLPPRX8_LVT: 17 
     Logics: LSUPX8_LVT: 1 AO21X2_LVT: 4 AO22X2_RVT: 16 AO22X1_RVT: 16 
      flow.cputime  flow.realtime  timing.setup.tns  timing.setup.wns  snapshot
UM:*                                                                   before clustering
    Source group sink pre-allocation...
    
    Allocating sinks for source group: flexible_htree_flex_HTREE
    The target for maximum allowed number of cloned nodes is 7 (38 existing nodes * 0.2 maximum cloned fraction)
    assigning ICG groups for internal nodes...
    Computed default driving distance for flexible_htree_flex_HTREE is 146 microns.
    
    Structure information for source group flexible_htree_flex_HTREE
    ================================================================
    
    Number of source group roots         :   15
    Number of sinks directly under roots :    8
    Total number of sinks                : 2887
    
    Internal objects (ICGs, logics, preserved ports) by level:
    
    ----------------
    Level    Objects
    ----------------
      4         1
      3         1
      2         2
      1        34
    ----------------
    
    Uncloneable objects:
    
    ----------------------------------------------------------------------------------------------------------
    Level    Downstream    Reasons                                         Type    Name
               Sinks                                                               
    ----------------------------------------------------------------------------------------------------------
      2          3         correspondingCell: dont_touch.prevent_assign    inst    I_SDRAM_TOP/I_SDRAM_IF/U303
    ----------------------------------------------------------------------------------------------------------
    
    This source group does not drive any generated clock trees.
    
      parameters: min_sinks_per_tap_ratio=0.2, max_sinks_per_tap_ratio=100, max_cloned_pct=0.2, icg_driving_distances=121.752 146.1024 175.32288 210.387456, icg_optimization_level=3
[CLU] 
[CLU] Tap allocation statistics:
[CLU] tap                                     anchor           size   radius     hpwl       mst   L1ICGs L2ICGs L3ICGs L4ICGs
[CLU] =======================================================================================================================
[CLU] flexible_htree_flex_HTREE_0    (   174.648,   205.808)      0     0.00     0.00      0.00        0      0      0      0
[CLU] flexible_htree_flex_HTREE_1    (   430.008,    78.432)      0     0.00     0.00      0.00        0      0      0      0
[CLU] flexible_htree_flex_HTREE_2    (   428.792,   205.808)      0     0.00     0.00      0.00        0      0      0      0
[CLU] flexible_htree_flex_HTREE_3    (   175.864,   372.704)    736   235.45   436.54   2782.05       33      2      1      1
[CLU] flexible_htree_flex_HTREE_4    (   174.648,   500.080)      0     0.00     0.00      0.00        0      0      0      0
[CLU] flexible_htree_flex_HTREE_5    (   430.008,   372.704)   1345   566.01   878.64   5529.54        2      0      1      1
[CLU] flexible_htree_flex_HTREE_6    (   428.792,   500.080)      0     0.00     0.00      0.00        0      0      0      0
[CLU] flexible_htree_flex_HTREE_7    (   569.848,    78.432)      0     0.00     0.00      0.00        0      0      0      0
[CLU] flexible_htree_flex_HTREE_8    (   569.848,   212.192)    806   428.18   678.68   3873.46        1      0      1      1
[CLU] flexible_htree_flex_HTREE_9    (   831.288,    78.432)      0     0.00     0.00      0.00        0      0      0      0
[CLU] flexible_htree_flex_HTREE_10   (   831.288,   212.192)      0     0.00     0.00      0.00        0      0      0      0
[CLU] flexible_htree_flex_HTREE_11   (   568.632,   366.320)      0     0.00     0.00      0.00        0      0      0      0
[CLU] flexible_htree_flex_HTREE_12   (   568.632,   496.736)      0     0.00     0.00      0.00        0      0      0      0
[CLU] flexible_htree_flex_HTREE_13   (   830.072,   366.320)      0     0.00     0.00      0.00        0      0      0      0
[CLU] flexible_htree_flex_HTREE_14   (   830.072,   496.736)      0     0.00     0.00      0.00        0      0      0      0
[CLU] -----------------------------------------------------------------------------------------------------------------------
[CLU] -----------------------------------------------------------------------------------------------------------------------
[CLU] 
[CLU] ICG Level 1: minExpectedICGs=34     extraICGs=2    (5.88%)  driveDis=251.11
[CLU] ICG Level 2: minExpectedICGs=2      extraICGs=0    (0.00%)  driveDis=301.34
[CLU] ICG Level 3: minExpectedICGs=1      extraICGs=2    (200.00%)  driveDis=361.60
[CLU] ICG Level 4: minExpectedICGs=1      extraICGs=2    (200.00%)  driveDis=433.92
[CLU] Total ICGs : minExpectedICGs=38     extraICGs=6    (15.79%)
[CLU] 
    Source group allocation rewiring/cloning: implement before clustering.
    Performing source group allocation...
      Resynthesising clock tree into netlist...
        Reset timing graph...
Ignoring AAE DB Resetting ...
        Reset timing graph done.
      Resynthesising clock tree into netlist done.
      Disconnecting clock tree from netlist...
      Disconnecting clock tree from netlist done.
      Clock DAG stats after Performing source group allocation:
        cell counts      : b=0, i=8, icg=30, dcg=0, l=39, total=77
        sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
        misc counts      : r=20, pp=1, mci=38
        cell areas       : b=0.000um^2, i=40.663um^2, icg=227.205um^2, dcg=0.000um^2, l=113.348um^2, total=381.216um^2
        hp wire lengths  : top=2584.456um, trunk=161.728um, leaf=16522.826um, total=19269.010um
      Clock DAG library cell distribution after Performing source group allocation {count}:
         Invs: INVX16_LVT: 8 
         ICGs: CGLNPRX8_LVT: 12 CGLPPRX8_LVT: 18 
       Logics: LSUPX8_LVT: 1 AO21X2_LVT: 6 AO22X2_RVT: 16 AO22X1_RVT: 16 
    Performing source group allocation done.
    
    Post-Implementation Source Group Assignment Report
    ==================================================
    
    There are no forced sink assignments.
    
    Unique Root Allocation Summary:
    
    ------------------------------------
    Root Allocation                Sinks
    ------------------------------------
    flexible_htree_flex_HTREE_3     736
    flexible_htree_flex_HTREE_5    1345
    flexible_htree_flex_HTREE_8     806
    ------------------------------------
    Total                          2887
    ------------------------------------
    
    Number of cloned nodes : 6
    
    Source group sink pre-allocation done. (took cpu=0:00:00.4 real=0:00:00.5)
    Computing max distances from locked parents...
      Computing distance_from_locked_parent_restrictions for 0 nodes driven by 0 locked parents
    Computing max distances from locked parents done.
    Computing optimal clock node locations...
    : ...20% ...40% ...60% ...80% ...100% 
    Computing optimal clock node locations done. (took cpu=0:00:00.4 real=0:00:00.1)
    Initialize for clustering done. (took cpu=0:00:01.1 real=0:00:00.8)
    Bottom-up phase...
    Clustering bottom-up starting from leaves...
      Clock tree timing engine global stage delay update for worst_corner:setup.late...
      Clock tree timing engine global stage delay update for worst_corner:setup.late done. (took cpu=0:00:00.0 real=0:00:00.0)
      Clustering clock_tree flexible_htree_flex_HTREE_1...
      Clustering clock_tree flexible_htree_flex_HTREE_1 done.
      Clustering clock_tree flexible_htree_flex_HTREE_2...
      Clustering clock_tree flexible_htree_flex_HTREE_2 done.
      Clustering clock_tree flexible_htree_flex_HTREE_0...
      Clustering clock_tree flexible_htree_flex_HTREE_0 done.
      Clustering clock_tree flexible_htree_flex_HTREE_4...
      Clustering clock_tree flexible_htree_flex_HTREE_4 done.
      Clustering clock_tree flexible_htree_flex_HTREE_6...
      Clustering clock_tree flexible_htree_flex_HTREE_6 done.
      Clustering clock_tree flexible_htree_flex_HTREE_7...
      Clustering clock_tree flexible_htree_flex_HTREE_7 done.
      Clustering clock_tree flexible_htree_flex_HTREE_9...
      Clustering clock_tree flexible_htree_flex_HTREE_9 done.
      Clustering clock_tree flexible_htree_flex_HTREE_10...
      Clustering clock_tree flexible_htree_flex_HTREE_10 done.
      Clustering clock_tree flexible_htree_flex_HTREE_11...
      Clustering clock_tree flexible_htree_flex_HTREE_11 done.
      Clustering clock_tree flexible_htree_flex_HTREE_12...
      Clustering clock_tree flexible_htree_flex_HTREE_12 done.
      Clustering clock_tree flexible_htree_flex_HTREE_13...
      Clustering clock_tree flexible_htree_flex_HTREE_13 done.
      Clustering clock_tree flexible_htree_flex_HTREE_14...
      Clustering clock_tree flexible_htree_flex_HTREE_14 done.
      Clustering clock_tree SYS_CLK...
      Clustering clock_tree SYS_CLK done.
      Clustering clock_tree PCI_CLK...
      Clustering clock_tree PCI_CLK done.
      Clustering clock_tree flexible_htree_flex_HTREE_5...
      Clustering clock_tree flexible_htree_flex_HTREE_5 done.
      Clustering clock_tree flexible_htree_flex_HTREE_8...
      Clustering clock_tree flexible_htree_flex_HTREE_8 done.
      Clustering clock_tree flexible_htree_flex_HTREE_3...
      Clustering clock_tree flexible_htree_flex_HTREE_3 done.
      Clustering clock_tree SYS_2x_CLK...
      Clustering clock_tree SYS_2x_CLK done.
      Clustering clock_tree ate_clk...
      Clustering clock_tree ate_clk done.
      Clustering clock_tree SDRAM_CLK...
      Clustering clock_tree SDRAM_CLK done.
    Clustering bottom-up starting from leaves done.
    Rebuilding the clock tree after clustering...
    Rebuilding the clock tree after clustering done.
    Clock DAG stats after bottom-up phase:
      cell counts      : b=0, i=245, icg=30, dcg=0, l=39, total=314
      sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
      misc counts      : r=20, pp=1, mci=38
      cell areas       : b=0.000um^2, i=1206.676um^2, icg=208.906um^2, dcg=0.000um^2, l=113.348um^2, total=1528.930um^2
      hp wire lengths  : top=2584.456um, trunk=7438.728um, leaf=15556.844um, total=25580.028um
    Clock DAG library cell distribution after bottom-up phase {count}:
       Invs: INVX16_LVT: 228 INVX8_LVT: 13 INVX4_LVT: 4 
       ICGs: CGLNPRX8_LVT: 12 CGLPPRX8_LVT: 6 CGLPPRX2_LVT: 12 
     Logics: LSUPX8_LVT: 1 AO21X2_LVT: 6 AO22X2_RVT: 16 AO22X1_RVT: 16 
      flow.cputime  flow.realtime  timing.setup.tns  timing.setup.wns  snapshot
UM:*                                                                   after bottom-up phase
    Bottom-up phase done. (took cpu=0:00:07.2 real=0:00:03.6)
    Legalizing clock trees...
    Resynthesising clock tree into netlist...
      Reset timing graph...
Ignoring AAE DB Resetting ...
      Reset timing graph done.
    Resynthesising clock tree into netlist done.
    Commiting net attributes....
    Commiting net attributes. done.
    Leaving CCOpt scope - ClockRefiner...
    Performing a single pass refine place with checks partially disabled for clock sinks and datapath.

*** Starting refinePlace (0:37:20 mem=6597.0M) ***
Total net bbox length = 8.642e+05 (5.110e+05 3.532e+05) (ext = 1.334e+04)
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Move report: Detail placement moves 1192 insts, mean move: 2.01 um, max move: 22.95 um 
	Max move on inst (I_SDRAM_TOP/I_SDRAM_IF/U15580): (76.00, 583.53) --> (82.23, 566.81)
	Runtime: CPU: 0:00:15.5 REAL: 0:00:05.0 MEM: 6577.5MB
Summary Report:
Instances move: 1192 (out of 40778 movable)
Instances flipped: 0
Mean displacement: 2.01 um
Max displacement: 22.95 um (Instance: I_SDRAM_TOP/I_SDRAM_IF/U15580) (76, 583.528) -> (82.232, 566.808)
	Length: 10 sites, height: 1 rows, site name: unit, cell type: AO22X1_RVT
Physical-only instances move: 0 (out of 0 movable physical-only)
Total net bbox length = 8.661e+05 (5.120e+05 3.541e+05) (ext = 1.341e+04)
Runtime: CPU: 0:00:15.6 REAL: 0:00:05.0 MEM: 6577.5MB
*** Finished refinePlace (0:37:36 mem=6577.5M) ***
    ClockRefiner summary
    All clock instances: Moved 424, flipped 167 and cell swapped 0 (out of a total of 3807).
    All Clock instances: Average move = 3.75um
    The largest move was 23 um for I_SDRAM_TOP/I_SDRAM_IF/U15580.

    Leaving CCOpt scope - ClockRefiner done. (took cpu=0:00:17.2 real=0:00:06.1)
    Disconnecting clock tree from netlist...
    Disconnecting clock tree from netlist done.
    Leaving CCOpt scope - Cleaning up placement interface...
    Leaving CCOpt scope - Cleaning up placement interface done. (took cpu=0:00:00.4 real=0:00:00.1)
    Leaving CCOpt scope - Initializing placement interface...

    Leaving CCOpt scope - Initializing placement interface done. (took cpu=0:00:00.4 real=0:00:00.3)
    Clock tree timing engine global stage delay update for worst_corner:setup.late...
    Clock tree timing engine global stage delay update for worst_corner:setup.late done. (took cpu=0:00:00.7 real=0:00:00.1)
    
    Clock tree legalization - Histogram:
    ====================================
    
    ----------------------------------
    Movement (um)      Number of cells
    ----------------------------------
    [0.152,2.432)            37
    [2.432,4.712)            62
    [4.712,6.992)            36
    [6.992,9.272)            11
    [9.272,11.552)            6
    [11.552,13.832)           8
    [13.832,16.112)           8
    [16.112,18.392)          16
    [18.392,20.672)           7
    [20.672,22.952)          10
    ----------------------------------
    
    
    Clock tree legalization - Top 10 Movements:
    ===========================================
    
    --------------------------------------------------------------------------------------------------------------------------------------------------------------------
    Movement (um)    Desired             Achieved            Node
                     location            location            
    --------------------------------------------------------------------------------------------------------------------------------------------------------------------
       22.952        (76.000,583.528)    (82.232,566.808)    cell I_SDRAM_TOP/I_SDRAM_IF/U15580 (a lib_cell AO22X1_RVT) at (82.232,566.808), in power domain PD_ORCA_TOP
       22.8          (76.000,583.528)    (90.440,591.888)    cell I_SDRAM_TOP/I_SDRAM_IF/U15577 (a lib_cell AO22X1_RVT) at (90.440,591.888), in power domain PD_ORCA_TOP
       22.8          (76.000,583.528)    (54.872,585.200)    cell I_SDRAM_TOP/I_SDRAM_IF/U15579 (a lib_cell AO22X1_RVT) at (54.872,585.200), in power domain PD_ORCA_TOP
       22.344        (76.000,583.528)    (88.312,573.496)    cell I_SDRAM_TOP/I_SDRAM_IF/U15575 (a lib_cell AO22X1_RVT) at (88.312,573.496), in power domain PD_ORCA_TOP
       22.192        (76.000,583.528)    (96.520,585.200)    cell I_SDRAM_TOP/I_SDRAM_IF/U15574 (a lib_cell AO22X1_RVT) at (96.520,585.200), in power domain PD_ORCA_TOP
       22.04         (76.000,583.528)    (58.976,588.544)    cell I_SDRAM_TOP/I_SDRAM_IF/U15573 (a lib_cell AO22X1_RVT) at (58.976,588.544), in power domain PD_ORCA_TOP
       21.584        (76.000,583.528)    (84.208,570.152)    cell I_SDRAM_TOP/I_SDRAM_IF/U15571 (a lib_cell AO22X1_RVT) at (84.208,570.152), in power domain PD_ORCA_TOP
       21.432        (76.000,583.528)    (92.416,588.544)    cell I_SDRAM_TOP/I_SDRAM_IF/U15570 (a lib_cell AO22X1_RVT) at (92.416,588.544), in power domain PD_ORCA_TOP
       21.28         (76.000,583.528)    (63.080,591.888)    cell I_SDRAM_TOP/I_SDRAM_IF/U15569 (a lib_cell AO22X1_RVT) at (63.080,591.888), in power domain PD_ORCA_TOP
       20.824        (76.000,583.528)    (80.104,566.808)    cell I_SDRAM_TOP/I_SDRAM_IF/U15568 (a lib_cell AO22X1_RVT) at (80.104,566.808), in power domain PD_ORCA_TOP
    --------------------------------------------------------------------------------------------------------------------------------------------------------------------
    
    Legalizing clock trees done. (took cpu=0:00:20.0 real=0:00:07.7)
    Clock DAG stats after 'Clustering':
      cell counts      : b=0, i=245, icg=30, dcg=0, l=39, total=314
      sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
      misc counts      : r=20, pp=1, mci=38
      cell areas       : b=0.000um^2, i=1206.676um^2, icg=208.906um^2, dcg=0.000um^2, l=113.348um^2, total=1528.930um^2
      cell capacitance : b=0.000fF, i=2486.879fF, icg=21.218fF, dcg=0.000fF, l=39.713fF, total=2547.810fF
      sink capacitance : total=2688.728fF, avg=0.765fF, sd=0.890fF, min=0.000fF, max=10.000fF
      wire capacitance : top=331.717fF, trunk=892.268fF, leaf=2088.931fF, total=3312.916fF
      wire lengths     : top=3665.489um, trunk=10148.428um, leaf=21814.838um, total=35628.755um
      hp wire lengths  : top=2584.456um, trunk=8422.472um, leaf=15643.636um, total=26650.564um
    Clock DAG net violations after 'Clustering':
      Remaining Transition : {count=23, worst=[0.153ns, 0.140ns, 0.139ns, 0.130ns, 0.126ns, 0.125ns, 0.124ns, 0.123ns, 0.122ns, 0.118ns, ...]} avg=0.087ns sd=0.054ns sum=2.009ns
      Capacitance          : {count=18, worst=[11.249fF, 5.268fF, 4.726fF, 4.695fF, 4.310fF, 4.167fF, 4.131fF, 4.094fF, 4.049fF, 3.993fF, ...]} avg=4.295fF sd=1.848fF sum=77.315fF
    Clock DAG primary half-corner transition distribution after 'Clustering':
      Top   : target=0.243ns count=7 avg=0.106ns sd=0.033ns min=0.087ns max=0.178ns {6 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
      Trunk : target=0.075ns count=1 avg=0.056ns sd=0.000ns min=0.056ns max=0.056ns {0 <= 0.045ns, 1 <= 0.060ns, 0 <= 0.068ns, 0 <= 0.071ns, 0 <= 0.075ns}
      Trunk : target=0.110ns count=1 avg=0.064ns sd=0.000ns min=0.064ns max=0.064ns {1 <= 0.066ns, 0 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
      Trunk : target=0.184ns count=12 avg=0.124ns sd=0.015ns min=0.109ns max=0.163ns {4 <= 0.111ns, 7 <= 0.148ns, 1 <= 0.166ns, 0 <= 0.175ns, 0 <= 0.184ns}
      Trunk : target=0.235ns count=5 avg=0.128ns sd=0.006ns min=0.121ns max=0.136ns {5 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
      Trunk : target=0.240ns count=2 avg=0.167ns sd=0.046ns min=0.135ns max=0.200ns {1 <= 0.144ns, 0 <= 0.192ns, 1 <= 0.216ns, 0 <= 0.228ns, 0 <= 0.240ns}
      Trunk : target=0.241ns count=1 avg=0.304ns sd=0.000ns min=0.304ns max=0.304ns {0 <= 0.253ns, 0 <= 0.265ns, 0 <= 0.289ns, 1 <= 0.361ns, 0 > 0.361ns}
      Trunk : target=0.243ns count=127 avg=0.101ns sd=0.108ns min=0.000ns max=0.397ns {111 <= 0.146ns, 0 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns} {0 <= 0.255ns, 0 <= 0.267ns, 0 <= 0.292ns, 7 <= 0.364ns, 9 > 0.364ns}
      Leaf  : target=0.078ns count=12 avg=0.062ns sd=0.012ns min=0.040ns max=0.076ns {2 <= 0.047ns, 3 <= 0.062ns, 5 <= 0.070ns, 1 <= 0.074ns, 1 <= 0.078ns}
      Leaf  : target=0.110ns count=3 avg=0.081ns sd=0.001ns min=0.080ns max=0.081ns {0 <= 0.066ns, 3 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
      Leaf  : target=0.235ns count=1 avg=0.062ns sd=0.000ns min=0.062ns max=0.062ns {1 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
      Leaf  : target=0.243ns count=178 avg=0.072ns sd=0.056ns min=0.013ns max=0.250ns {162 <= 0.146ns, 0 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 10 <= 0.243ns} {6 <= 0.255ns, 0 <= 0.267ns, 0 <= 0.292ns, 0 <= 0.364ns, 0 > 0.364ns}
    Clock DAG library cell distribution after 'Clustering' {count}:
       Invs: INVX16_LVT: 228 INVX8_LVT: 13 INVX4_LVT: 4 
       ICGs: CGLNPRX8_LVT: 12 CGLPPRX8_LVT: 6 CGLPPRX2_LVT: 12 
     Logics: LSUPX8_LVT: 1 AO21X2_LVT: 6 AO22X2_RVT: 16 AO22X1_RVT: 16 
    Primary reporting skew groups after 'Clustering':
      skew_group SDRAM_CLK/func_best_mode: insertion delay [min=0.410, max=1.535, avg=1.445, sd=0.107, skn=-4.715, kur=30.622], skew [1.125 vs 0.085*], 84.9% {1.422, 1.507} (wid=0.118 ws=0.081) (gid=1.429 gs=1.056)
    Skew group summary after 'Clustering':
      skew_group PCI_CLK/func_best_mode: insertion delay [min=0.065, max=0.742, avg=0.694, sd=0.092, skn=-6.431, kur=41.682], skew [0.677 vs 0.085*], 98% {0.688, 0.742} (wid=0.029 ws=0.028) (gid=0.713 gs=0.649)
      skew_group SDRAM_CLK/func_best_mode: insertion delay [min=0.410, max=1.535, avg=1.445, sd=0.107, skn=-4.715, kur=30.622], skew [1.125 vs 0.085*], 84.9% {1.422, 1.507} (wid=0.118 ws=0.081) (gid=1.429 gs=1.056)
      skew_group SYS_2x_CLK/func_best_mode: insertion delay [min=0.128, max=1.126, avg=0.918, sd=0.166, skn=-4.115, kur=17.011], skew [0.999 vs 0.085*], 83.6% {0.926, 1.011} (wid=0.017 ws=0.015) (gid=1.124 gs=1.001)
      skew_group SYS_2x_CLK/func_worst_mode: insertion delay [min=0.128, max=1.126, avg=0.547, sd=0.370, skn=-0.082, kur=-1.592], skew [0.999 vs 0.085*], 40% {0.128, 0.213} (wid=0.006 ws=0.004) (gid=1.124 gs=1.001)
      skew_group ate_clk/test_best_mode: insertion delay [min=0.197, max=1.147, avg=1.036, sd=0.142, skn=-1.802, kur=2.549], skew [0.950 vs 0.085*], 77.9% {1.071, 1.147} (wid=0.066 ws=0.064) (gid=1.137 gs=0.945)
      skew_group ate_clk/test_worst_mode: insertion delay [min=0.197, max=1.147, avg=1.041, sd=0.144, skn=-1.916, kur=2.795], skew [0.950 vs 0.085*], 82.5% {1.071, 1.147} (wid=0.066 ws=0.063) (gid=1.137 gs=0.945)
    Legalizer API calls during this step: 4725 succeeded with high effort: 4725 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
  Clustering done. (took cpu=0:00:28.7 real=0:00:12.4)
  Looking for fanout violations...
  Looking for fanout violations done.
  CongRepair After Initial Clustering...
  Reset timing graph...
Ignoring AAE DB Resetting ...
  Reset timing graph done.
  Leaving CCOpt scope - Early Global Route...
  Clock implementation routing...
Net route status summary:
  Clock:       334 (unrouted=327, trialRouted=0, noStatus=0, routed=0, fixed=7, [crossesIlmBoundary=0, tooFewTerms=12, (crossesIlmBoundary AND tooFewTerms=0)])
  Non-clock: 46946 (unrouted=3991, trialRouted=42955, noStatus=0, routed=0, fixed=0, [crossesIlmBoundary=0, tooFewTerms=3895, (crossesIlmBoundary AND tooFewTerms=0)])
    Routing using eGR only...
      Early Global Route - eGR only step...
(ccopt eGR): There are 327 nets to be routed. 0 nets have skip routing designation.
(ccopt eGR): There are 327 nets for routing of which 315 have one or more fixed wires.
(ccopt eGR): Start to route 327 all nets
[PSP]    Started Early Global Route ( Curr Mem: 6.21 MB )
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
[PSP]    Started Early Global Route kernel ( Curr Mem: 6.21 MB )
[NR-eGR] Read 43373 nets ( ignored 43058 )
[NR-eGR] There are 315 clock nets ( 315 with NDR ).
[NR-eGR] Layer group 1: route 133 net(s) in layer range [5, 6]
[NR-eGR] Early Global Route overflow of layer group 1: 0.08% H + 0.05% V. EstWL: 1.037978e+04um
[NR-eGR] Create a new net group with 18 nets and layer range [5, 8]
[NR-eGR] Layer group 2: route 2 net(s) in layer range [4, 5]
[NR-eGR] Early Global Route overflow of layer group 2: 0.19% H + 0.00% V. EstWL: 9.983512e+03um
[NR-eGR] Layer group 3: route 182 net(s) in layer range [3, 4]
[NR-eGR] Early Global Route overflow of layer group 3: 0.02% H + 0.01% V. EstWL: 3.177134e+04um
[NR-eGR] Create a new net group with 16 nets and layer range [3, 6]
[NR-eGR] Layer group 4: route 18 net(s) in layer range [5, 8]
[NR-eGR] Early Global Route overflow of layer group 4: 0.05% H + 0.03% V. EstWL: 3.172286e+04um
[NR-eGR] Create a new net group with 15 nets and layer range [5, 9]
[NR-eGR] Layer group 5: route 16 net(s) in layer range [3, 6]
[NR-eGR] Early Global Route overflow of layer group 5: 0.01% H + 0.01% V. EstWL: 3.352360e+04um
[NR-eGR] Create a new net group with 10 nets and layer range [3, 8]
[NR-eGR] Layer group 6: route 15 net(s) in layer range [5, 9]
[NR-eGR] Early Global Route overflow of layer group 6: 0.04% H + 0.03% V. EstWL: 3.358045e+04um
[NR-eGR] Create a new net group with 9 nets and layer range [3, 9]
[NR-eGR] Layer group 7: route 10 net(s) in layer range [3, 8]
[NR-eGR] Early Global Route overflow of layer group 7: 0.01% H + 0.00% V. EstWL: 3.501335e+04um
[NR-eGR] Move 9 nets to the existing net group with layer range [3, 9]
[NR-eGR] Layer group 8: route 18 net(s) in layer range [3, 9]
[NR-eGR] Early Global Route overflow of layer group 8: 0.01% H + 0.01% V. EstWL: 3.647970e+04um
[NR-eGR] Create a new net group with 11 nets and layer range [2, 9]
[NR-eGR] Layer group 9: route 11 net(s) in layer range [2, 9]
[NR-eGR] Early Global Route overflow of layer group 9: 0.01% H + 0.00% V. EstWL: 3.827710e+04um
[NR-eGR] Overflow after Early Global Route 0.00% H + 0.00% V
[NR-eGR] Total eGR-routed clock nets wire length: 32370um, number of vias: 12817
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR] Report for selected net(s) only.
[NR-eGR]               Length (um)   Vias 
[NR-eGR] ---------------------------------
[NR-eGR]  M1    (1H)             0   4127 
[NR-eGR]  M2    (2V)          2740   4602 
[NR-eGR]  M3    (3H)          9312   3128 
[NR-eGR]  M4    (4V)         10179    459 
[NR-eGR]  M5    (5H)          6392    335 
[NR-eGR]  M6    (6V)          2524    114 
[NR-eGR]  M7    (7H)          1100     52 
[NR-eGR]  M8    (8V)           123      0 
[NR-eGR]  M9    (9H)             0      0 
[NR-eGR]  MRDL  (10V)            0      0 
[NR-eGR] ---------------------------------
[NR-eGR]        Total        32370  12817 
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR] Total half perimeter of net bounding box: 25561um
[NR-eGR] Total length: 32370um, number of vias: 12817
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR] Total routed clock nets wire length: 32370um, number of vias: 12817
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR]               Length (um)    Vias 
[NR-eGR] ----------------------------------
[NR-eGR]  M1    (1H)             0  163249 
[NR-eGR]  M2    (2V)        226481  218297 
[NR-eGR]  M3    (3H)        335468   68849 
[NR-eGR]  M4    (4V)        143998   15308 
[NR-eGR]  M5    (5H)        138053    4202 
[NR-eGR]  M6    (6V)         45487    2196 
[NR-eGR]  M7    (7H)         61988     422 
[NR-eGR]  M8    (8V)          4466     136 
[NR-eGR]  M9    (9H)          6601       2 
[NR-eGR]  MRDL  (10V)            5       0 
[NR-eGR] ----------------------------------
[NR-eGR]        Total       962547  472661 
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR] Total half perimeter of net bounding box: 865633um
[NR-eGR] Total length: 962547um, number of vias: 472661
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR] Finished Early Global Route kernel ( CPU: 7.89 sec, Real: 4.42 sec, Curr Mem: 6.25 MB )
[NR-eGR] Finished Early Global Route ( CPU: 7.91 sec, Real: 4.44 sec, Curr Mem: 6.21 MB )
      Early Global Route - eGR only step done. (took cpu=0:00:08.2 real=0:00:04.7)
    Routing using eGR only done.
Net route status summary:
  Clock:       334 (unrouted=12, trialRouted=0, noStatus=0, routed=315, fixed=7, [crossesIlmBoundary=0, tooFewTerms=12, (crossesIlmBoundary AND tooFewTerms=0)])
  Non-clock: 46946 (unrouted=3991, trialRouted=42955, noStatus=0, routed=0, fixed=0, [crossesIlmBoundary=0, tooFewTerms=3895, (crossesIlmBoundary AND tooFewTerms=0)])

CCOPT: Done with clock implementation routing.

  Clock implementation routing done.
  CCOpt: Starting congestion repair using flow wrapper...
    Congestion Repair...
*** IncrReplace #1 [begin] (CTS #1 / ccopt_design #1) : totSession cpu/real = 0:37:48.8/0:16:59.7 (2.2), mem = 6609.3M
Info: Disable timing driven in postCTS congRepair.

Starting congRepair ...
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
[NR-eGR] Started Early Global Route kernel ( Curr Mem: 6.20 MB )
[NR-eGR] Read 43373 nets ( ignored 322 )
[NR-eGR] Layer group 1: route 43051 net(s) in layer range [2, 10]
[NR-eGR] Early Global Route overflow of layer group 1: 0.18% H + 0.02% V. EstWL: 9.093256e+05um
[NR-eGR] Overflow after Early Global Route 0.15% H + 0.00% V
[NR-eGR] Finished Early Global Route kernel ( CPU: 5.03 sec, Real: 2.47 sec, Curr Mem: 6.23 MB )
Early Global Route congestion estimation runtime: 2.49 seconds, mem = 6635.6M
Local HotSpot Analysis: normalized max congestion hotspot area = 0.00, normalized total congestion hotspot area = 0.00 (area is in unit of 4 std-cell row bins)
Skipped repairing congestion.
[NR-eGR] Total eGR-routed clock nets wire length: 0um, number of vias: 0
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR]               Length (um)    Vias 
[NR-eGR] ----------------------------------
[NR-eGR]  M1    (1H)             0  163673 
[NR-eGR]  M2    (2V)        229619  219155 
[NR-eGR]  M3    (3H)        345601   69309 
[NR-eGR]  M4    (4V)        146328   15868 
[NR-eGR]  M5    (5H)        144858    4409 
[NR-eGR]  M6    (6V)         49204    2282 
[NR-eGR]  M7    (7H)         63889     419 
[NR-eGR]  M8    (8V)          4812     138 
[NR-eGR]  M9    (9H)          6422       2 
[NR-eGR]  MRDL  (10V)            5       0 
[NR-eGR] ----------------------------------
[NR-eGR]        Total       990736  475255 
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR] Total half perimeter of net bounding box: 865633um
[NR-eGR] Total length: 990736um, number of vias: 475255
[NR-eGR] --------------------------------------------------------------------------
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Early Global Route wiring runtime: 0.98 seconds, mem = 6674.6M
Tdgp not enabled or already been cleared! skip clearing
End of congRepair (cpu=0:00:08.3, real=0:00:04.0)
*** IncrReplace #1 [finish] (CTS #1 / ccopt_design #1) : cpu/real = 0:00:08.3/0:00:03.5 (2.3), totSession cpu/real = 0:37:57.0/0:17:03.2 (2.2), mem = 6674.6M
Set ::gpsPrivate::dogPBIsIncrReplaceDoneInMaster 1
    Congestion Repair done. (took cpu=0:00:08.3 real=0:00:03.5)
  CCOpt: Starting congestion repair using flow wrapper done.

  Leaving CCOpt scope - Early Global Route done. (took cpu=0:00:18.4 real=0:00:09.7)
  Leaving CCOpt scope - extractRC...
  Updating RC parasitics by calling: "extractRC -noRouteCheck"...
**WARN: (IMPEXT-6191):	Using a captable file is not recommended for process nodes less than or equal to 32 nm due to parasitic accuracy concerns. The Quantus QRC technology file should be specified for all RC corners using the command create_rc_corner or update_rc_corner, which will then be used for preRoute and postRoute(effort level medium or high or signoff) extraction engines.
Type 'man IMPEXT-6191' for more detail.
Extraction called for design 'ORCA_TOP' of instances=40840 and nets=47280 using extraction engine 'preRoute' .
PreRoute RC Extraction called for design ORCA_TOP.
RC Extraction called in multi-corner(2) mode.
RCMode: PreRoute
      RC Corner Indexes            0       1   
Capacitance Scaling Factor   : 1.00000 1.00000 
Resistance Scaling Factor    : 1.00000 1.00000 
Clock Cap. Scaling Factor    : 1.00000 1.00000 
Clock Res. Scaling Factor    : 1.00000 1.00000 
Shrink Factor                : 1.00000
PreRoute extraction is honoring NDR/Shielding/ExtraSpace for clock nets.
Using capacitance table file ...
Updating RC Grid density data for preRoute extraction ...
Initializing multi-corner capacitance tables ... 
Initializing multi-corner resistance tables ...
PreRoute RC Extraction DONE (CPU Time: 0:00:01.5  Real Time: 0:00:01.0  MEM: 6676.285M)
  Updating RC parasitics by calling: "extractRC -noRouteCheck" done.
  Leaving CCOpt scope - extractRC done. (took cpu=0:00:01.5 real=0:00:01.5)
  Clock tree timing engine global stage delay update for worst_corner:setup.late...
  Clock tree timing engine global stage delay update for worst_corner:setup.late done. (took cpu=0:00:00.6 real=0:00:00.1)
  Clock DAG stats after clustering cong repair call:
    cell counts      : b=0, i=245, icg=30, dcg=0, l=39, total=314
    sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
    misc counts      : r=20, pp=1, mci=38
    cell areas       : b=0.000um^2, i=1206.676um^2, icg=208.906um^2, dcg=0.000um^2, l=113.348um^2, total=1528.930um^2
    cell capacitance : b=0.000fF, i=2486.879fF, icg=21.218fF, dcg=0.000fF, l=39.713fF, total=2547.810fF
    sink capacitance : total=2688.728fF, avg=0.765fF, sd=0.890fF, min=0.000fF, max=10.000fF
    wire capacitance : top=331.822fF, trunk=897.646fF, leaf=2100.649fF, total=3330.117fF
    wire lengths     : top=3665.489um, trunk=10148.428um, leaf=21814.838um, total=35628.755um
    hp wire lengths  : top=2584.456um, trunk=8422.472um, leaf=15643.636um, total=26650.564um
  Clock DAG net violations after clustering cong repair call:
    Remaining Transition : {count=23, worst=[0.155ns, 0.144ns, 0.143ns, 0.136ns, 0.126ns, 0.125ns, 0.124ns, 0.123ns, 0.123ns, 0.123ns, ...]} avg=0.089ns sd=0.055ns sum=2.037ns
    Capacitance          : {count=18, worst=[11.466fF, 5.346fF, 4.908fF, 4.856fF, 4.577fF, 4.186fF, 4.142fF, 4.099fF, 4.055fF, 4.053fF, ...]} avg=4.369fF sd=1.896fF sum=78.641fF
  Clock DAG primary half-corner transition distribution after clustering cong repair call:
    Top   : target=0.243ns count=7 avg=0.107ns sd=0.033ns min=0.087ns max=0.179ns {6 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
    Trunk : target=0.075ns count=1 avg=0.056ns sd=0.000ns min=0.056ns max=0.056ns {0 <= 0.045ns, 1 <= 0.060ns, 0 <= 0.068ns, 0 <= 0.071ns, 0 <= 0.075ns}
    Trunk : target=0.110ns count=1 avg=0.064ns sd=0.000ns min=0.064ns max=0.064ns {1 <= 0.066ns, 0 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
    Trunk : target=0.184ns count=12 avg=0.124ns sd=0.015ns min=0.109ns max=0.163ns {4 <= 0.111ns, 7 <= 0.148ns, 1 <= 0.166ns, 0 <= 0.175ns, 0 <= 0.184ns}
    Trunk : target=0.235ns count=5 avg=0.128ns sd=0.006ns min=0.121ns max=0.136ns {5 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
    Trunk : target=0.240ns count=2 avg=0.167ns sd=0.046ns min=0.135ns max=0.200ns {1 <= 0.144ns, 0 <= 0.192ns, 1 <= 0.216ns, 0 <= 0.228ns, 0 <= 0.240ns}
    Trunk : target=0.241ns count=1 avg=0.304ns sd=0.000ns min=0.304ns max=0.304ns {0 <= 0.253ns, 0 <= 0.265ns, 0 <= 0.289ns, 1 <= 0.361ns, 0 > 0.361ns}
    Trunk : target=0.243ns count=127 avg=0.101ns sd=0.109ns min=0.000ns max=0.399ns {111 <= 0.146ns, 0 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns} {0 <= 0.255ns, 0 <= 0.267ns, 0 <= 0.292ns, 6 <= 0.364ns, 10 > 0.364ns}
    Leaf  : target=0.078ns count=12 avg=0.062ns sd=0.012ns min=0.040ns max=0.076ns {2 <= 0.047ns, 3 <= 0.062ns, 5 <= 0.070ns, 1 <= 0.074ns, 1 <= 0.078ns}
    Leaf  : target=0.110ns count=3 avg=0.081ns sd=0.001ns min=0.080ns max=0.081ns {0 <= 0.066ns, 3 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
    Leaf  : target=0.235ns count=1 avg=0.062ns sd=0.000ns min=0.062ns max=0.062ns {1 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
    Leaf  : target=0.243ns count=178 avg=0.072ns sd=0.056ns min=0.013ns max=0.250ns {162 <= 0.146ns, 0 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 10 <= 0.243ns} {6 <= 0.255ns, 0 <= 0.267ns, 0 <= 0.292ns, 0 <= 0.364ns, 0 > 0.364ns}
  Clock DAG library cell distribution after clustering cong repair call {count}:
     Invs: INVX16_LVT: 228 INVX8_LVT: 13 INVX4_LVT: 4 
     ICGs: CGLNPRX8_LVT: 12 CGLPPRX8_LVT: 6 CGLPPRX2_LVT: 12 
   Logics: LSUPX8_LVT: 1 AO21X2_LVT: 6 AO22X2_RVT: 16 AO22X1_RVT: 16 
  Primary reporting skew groups after clustering cong repair call:
    skew_group SDRAM_CLK/func_best_mode: insertion delay [min=0.412, max=1.537, avg=1.448, sd=0.106, skn=-4.718, kur=30.675], skew [1.125 vs 0.085*], 88% {1.424, 1.509} (wid=0.118 ws=0.081) (gid=1.431 gs=1.057)
  Skew group summary after clustering cong repair call:
    skew_group PCI_CLK/func_best_mode: insertion delay [min=0.067, max=0.746, avg=0.695, sd=0.092, skn=-6.395, kur=41.378], skew [0.679 vs 0.085*], 98% {0.690, 0.746} (wid=0.029 ws=0.028) (gid=0.717 gs=0.651)
    skew_group SDRAM_CLK/func_best_mode: insertion delay [min=0.412, max=1.537, avg=1.448, sd=0.106, skn=-4.718, kur=30.675], skew [1.125 vs 0.085*], 88% {1.424, 1.509} (wid=0.118 ws=0.081) (gid=1.431 gs=1.057)
    skew_group SYS_2x_CLK/func_best_mode: insertion delay [min=0.125, max=1.126, avg=0.916, sd=0.166, skn=-4.118, kur=17.033], skew [1.001 vs 0.085*], 83.6% {0.924, 1.009} (wid=0.017 ws=0.015) (gid=1.124 gs=1.004)
    skew_group SYS_2x_CLK/func_worst_mode: insertion delay [min=0.125, max=1.126, avg=0.545, sd=0.371, skn=-0.083, kur=-1.595], skew [1.001 vs 0.085*], 40% {0.125, 0.210} (wid=0.006 ws=0.004) (gid=1.124 gs=1.004)
    skew_group ate_clk/test_best_mode: insertion delay [min=0.195, max=1.147, avg=1.035, sd=0.142, skn=-1.791, kur=2.518], skew [0.952 vs 0.085*], 77.9% {1.068, 1.147} (wid=0.066 ws=0.064) (gid=1.137 gs=0.947)
    skew_group ate_clk/test_worst_mode: insertion delay [min=0.195, max=1.147, avg=1.040, sd=0.144, skn=-1.908, kur=2.775], skew [0.952 vs 0.085*], 82.5% {1.068, 1.147} (wid=0.066 ws=0.063) (gid=1.137 gs=0.947)
  CongRepair After Initial Clustering done. (took cpu=0:00:21.0 real=0:00:11.8)
  Stage::Clustering done. (took cpu=0:00:49.6 real=0:00:24.2)
  Stage::DRV Fixing...
  Fixing clock tree slew time and max cap violations...
    Fixing clock tree overload: ...20% ...40% ...60% ...80% ...100% 
    Clock DAG stats after 'Fixing clock tree slew time and max cap violations':
      cell counts      : b=0, i=247, icg=30, dcg=0, l=39, total=316
      sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
      misc counts      : r=20, pp=1, mci=38
      cell areas       : b=0.000um^2, i=1174.145um^2, icg=208.906um^2, dcg=0.000um^2, l=113.348um^2, total=1496.400um^2
      cell capacitance : b=0.000fF, i=2398.397fF, icg=21.218fF, dcg=0.000fF, l=39.713fF, total=2459.328fF
      sink capacitance : total=2688.728fF, avg=0.765fF, sd=0.890fF, min=0.000fF, max=10.000fF
      wire capacitance : top=331.822fF, trunk=897.463fF, leaf=2095.620fF, total=3324.905fF
      wire lengths     : top=3665.489um, trunk=10141.437um, leaf=21759.662um, total=35566.588um
      hp wire lengths  : top=2584.456um, trunk=8404.232um, leaf=15585.420um, total=26574.108um
    Clock DAG net violations after 'Fixing clock tree slew time and max cap violations': none
    Clock DAG primary half-corner transition distribution after 'Fixing clock tree slew time and max cap violations':
      Top   : target=0.243ns count=7 avg=0.107ns sd=0.033ns min=0.087ns max=0.179ns {6 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
      Trunk : target=0.075ns count=1 avg=0.056ns sd=0.000ns min=0.056ns max=0.056ns {0 <= 0.045ns, 1 <= 0.060ns, 0 <= 0.068ns, 0 <= 0.071ns, 0 <= 0.075ns}
      Trunk : target=0.110ns count=1 avg=0.064ns sd=0.000ns min=0.064ns max=0.064ns {1 <= 0.066ns, 0 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
      Trunk : target=0.184ns count=12 avg=0.124ns sd=0.015ns min=0.109ns max=0.163ns {4 <= 0.111ns, 7 <= 0.148ns, 1 <= 0.166ns, 0 <= 0.175ns, 0 <= 0.184ns}
      Trunk : target=0.235ns count=5 avg=0.128ns sd=0.006ns min=0.121ns max=0.136ns {5 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
      Trunk : target=0.240ns count=2 avg=0.167ns sd=0.046ns min=0.135ns max=0.200ns {1 <= 0.144ns, 0 <= 0.192ns, 1 <= 0.216ns, 0 <= 0.228ns, 0 <= 0.240ns}
      Trunk : target=0.241ns count=1 avg=0.184ns sd=0.000ns min=0.184ns max=0.184ns {0 <= 0.144ns, 1 <= 0.192ns, 0 <= 0.217ns, 0 <= 0.229ns, 0 <= 0.241ns}
      Trunk : target=0.243ns count=129 avg=0.079ns sd=0.065ns min=0.000ns max=0.237ns {113 <= 0.146ns, 1 <= 0.194ns, 6 <= 0.219ns, 5 <= 0.231ns, 4 <= 0.243ns}
      Leaf  : target=0.078ns count=12 avg=0.062ns sd=0.012ns min=0.040ns max=0.076ns {2 <= 0.047ns, 3 <= 0.062ns, 5 <= 0.070ns, 1 <= 0.074ns, 1 <= 0.078ns}
      Leaf  : target=0.110ns count=3 avg=0.081ns sd=0.001ns min=0.080ns max=0.081ns {0 <= 0.066ns, 3 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
      Leaf  : target=0.235ns count=1 avg=0.062ns sd=0.000ns min=0.062ns max=0.062ns {1 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
      Leaf  : target=0.243ns count=178 avg=0.070ns sd=0.054ns min=0.013ns max=0.242ns {163 <= 0.146ns, 0 <= 0.194ns, 0 <= 0.219ns, 1 <= 0.231ns, 14 <= 0.243ns}
    Clock DAG library cell distribution after 'Fixing clock tree slew time and max cap violations' {count}:
       Invs: INVX16_LVT: 211 INVX8_LVT: 29 INVX4_LVT: 5 INVX2_LVT: 2 
       ICGs: CGLNPRX8_LVT: 12 CGLPPRX8_LVT: 6 CGLPPRX2_LVT: 12 
     Logics: LSUPX8_LVT: 1 AO21X2_LVT: 6 AO22X2_RVT: 16 AO22X1_RVT: 16 
    Primary reporting skew groups after 'Fixing clock tree slew time and max cap violations':
      skew_group SDRAM_CLK/func_best_mode: insertion delay [min=0.412, max=1.537], skew [1.125 vs 0.085*]
    Skew group summary after 'Fixing clock tree slew time and max cap violations':
      skew_group PCI_CLK/func_best_mode: insertion delay [min=0.067, max=0.746], skew [0.679 vs 0.085*]
      skew_group SDRAM_CLK/func_best_mode: insertion delay [min=0.412, max=1.537], skew [1.125 vs 0.085*]
      skew_group SYS_2x_CLK/func_best_mode: insertion delay [min=0.125, max=1.066], skew [0.941 vs 0.085*]
      skew_group SYS_2x_CLK/func_worst_mode: insertion delay [min=0.125, max=1.066], skew [0.941 vs 0.085*]
      skew_group ate_clk/test_best_mode: insertion delay [min=0.195, max=1.147], skew [0.952 vs 0.085*]
      skew_group ate_clk/test_worst_mode: insertion delay [min=0.195, max=1.147], skew [0.952 vs 0.085*]
    Legalizer API calls during this step: 100 succeeded with high effort: 100 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
  Fixing clock tree slew time and max cap violations done. (took cpu=0:00:00.9 real=0:00:00.9)
  Fixing clock tree slew time and max cap violations - detailed pass...
    Fixing clock tree overload: ...20% ...40% ...60% ...80% ...100% 
    Clock DAG stats after 'Fixing clock tree slew time and max cap violations - detailed pass':
      cell counts      : b=0, i=247, icg=30, dcg=0, l=39, total=316
      sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
      misc counts      : r=20, pp=1, mci=38
      cell areas       : b=0.000um^2, i=1174.145um^2, icg=208.906um^2, dcg=0.000um^2, l=113.348um^2, total=1496.400um^2
      cell capacitance : b=0.000fF, i=2398.397fF, icg=21.218fF, dcg=0.000fF, l=39.713fF, total=2459.328fF
      sink capacitance : total=2688.728fF, avg=0.765fF, sd=0.890fF, min=0.000fF, max=10.000fF
      wire capacitance : top=331.822fF, trunk=897.463fF, leaf=2095.620fF, total=3324.905fF
      wire lengths     : top=3665.489um, trunk=10141.437um, leaf=21759.662um, total=35566.588um
      hp wire lengths  : top=2584.456um, trunk=8404.232um, leaf=15585.420um, total=26574.108um
    Clock DAG net violations after 'Fixing clock tree slew time and max cap violations - detailed pass': none
    Clock DAG primary half-corner transition distribution after 'Fixing clock tree slew time and max cap violations - detailed pass':
      Top   : target=0.243ns count=7 avg=0.107ns sd=0.033ns min=0.087ns max=0.179ns {6 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
      Trunk : target=0.075ns count=1 avg=0.056ns sd=0.000ns min=0.056ns max=0.056ns {0 <= 0.045ns, 1 <= 0.060ns, 0 <= 0.068ns, 0 <= 0.071ns, 0 <= 0.075ns}
      Trunk : target=0.110ns count=1 avg=0.064ns sd=0.000ns min=0.064ns max=0.064ns {1 <= 0.066ns, 0 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
      Trunk : target=0.184ns count=12 avg=0.124ns sd=0.015ns min=0.109ns max=0.163ns {4 <= 0.111ns, 7 <= 0.148ns, 1 <= 0.166ns, 0 <= 0.175ns, 0 <= 0.184ns}
      Trunk : target=0.235ns count=5 avg=0.128ns sd=0.006ns min=0.121ns max=0.136ns {5 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
      Trunk : target=0.240ns count=2 avg=0.167ns sd=0.046ns min=0.135ns max=0.200ns {1 <= 0.144ns, 0 <= 0.192ns, 1 <= 0.216ns, 0 <= 0.228ns, 0 <= 0.240ns}
      Trunk : target=0.241ns count=1 avg=0.184ns sd=0.000ns min=0.184ns max=0.184ns {0 <= 0.144ns, 1 <= 0.192ns, 0 <= 0.217ns, 0 <= 0.229ns, 0 <= 0.241ns}
      Trunk : target=0.243ns count=129 avg=0.079ns sd=0.065ns min=0.000ns max=0.237ns {113 <= 0.146ns, 1 <= 0.194ns, 6 <= 0.219ns, 5 <= 0.231ns, 4 <= 0.243ns}
      Leaf  : target=0.078ns count=12 avg=0.062ns sd=0.012ns min=0.040ns max=0.076ns {2 <= 0.047ns, 3 <= 0.062ns, 5 <= 0.070ns, 1 <= 0.074ns, 1 <= 0.078ns}
      Leaf  : target=0.110ns count=3 avg=0.081ns sd=0.001ns min=0.080ns max=0.081ns {0 <= 0.066ns, 3 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
      Leaf  : target=0.235ns count=1 avg=0.062ns sd=0.000ns min=0.062ns max=0.062ns {1 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
      Leaf  : target=0.243ns count=178 avg=0.070ns sd=0.054ns min=0.013ns max=0.242ns {163 <= 0.146ns, 0 <= 0.194ns, 0 <= 0.219ns, 1 <= 0.231ns, 14 <= 0.243ns}
    Clock DAG library cell distribution after 'Fixing clock tree slew time and max cap violations - detailed pass' {count}:
       Invs: INVX16_LVT: 211 INVX8_LVT: 29 INVX4_LVT: 5 INVX2_LVT: 2 
       ICGs: CGLNPRX8_LVT: 12 CGLPPRX8_LVT: 6 CGLPPRX2_LVT: 12 
     Logics: LSUPX8_LVT: 1 AO21X2_LVT: 6 AO22X2_RVT: 16 AO22X1_RVT: 16 
    Primary reporting skew groups after 'Fixing clock tree slew time and max cap violations - detailed pass':
      skew_group SDRAM_CLK/func_best_mode: insertion delay [min=0.412, max=1.537, avg=1.448, sd=0.106, skn=-4.718, kur=30.675], skew [1.125 vs 0.085*], 88% {1.424, 1.509} (wid=0.118 ws=0.081) (gid=1.431 gs=1.057)
    Skew group summary after 'Fixing clock tree slew time and max cap violations - detailed pass':
      skew_group PCI_CLK/func_best_mode: insertion delay [min=0.067, max=0.746, avg=0.695, sd=0.092, skn=-6.395, kur=41.378], skew [0.679 vs 0.085*], 98% {0.690, 0.746} (wid=0.029 ws=0.028) (gid=0.717 gs=0.651)
      skew_group SDRAM_CLK/func_best_mode: insertion delay [min=0.412, max=1.537, avg=1.448, sd=0.106, skn=-4.718, kur=30.675], skew [1.125 vs 0.085*], 88% {1.424, 1.509} (wid=0.118 ws=0.081) (gid=1.431 gs=1.057)
      skew_group SYS_2x_CLK/func_best_mode: insertion delay [min=0.125, max=1.066, avg=0.913, sd=0.167, skn=-4.014, kur=16.149], skew [0.941 vs 0.085*], 83.6% {0.924, 1.009} (wid=0.017 ws=0.015) (gid=1.064 gs=0.943)
      skew_group SYS_2x_CLK/func_worst_mode: insertion delay [min=0.125, max=1.066, avg=0.516, sd=0.344, skn=-0.074, kur=-1.539], skew [0.941 vs 0.085*], 40% {0.125, 0.210} (wid=0.006 ws=0.004) (gid=1.064 gs=0.943)
      skew_group ate_clk/test_best_mode: insertion delay [min=0.195, max=1.147, avg=1.035, sd=0.142, skn=-1.791, kur=2.518], skew [0.952 vs 0.085*], 77.9% {1.068, 1.147} (wid=0.066 ws=0.064) (gid=1.137 gs=0.947)
      skew_group ate_clk/test_worst_mode: insertion delay [min=0.195, max=1.147, avg=1.040, sd=0.144, skn=-1.908, kur=2.775], skew [0.952 vs 0.085*], 82.5% {1.068, 1.147} (wid=0.066 ws=0.063) (gid=1.137 gs=0.947)
    Legalizer API calls during this step: 0 succeeded with high effort: 0 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
  Fixing clock tree slew time and max cap violations - detailed pass done. (took cpu=0:00:00.2 real=0:00:00.2)
  Stage::DRV Fixing done. (took cpu=0:00:01.1 real=0:00:01.1)
  Stage::Insertion Delay Reduction...
  Removing unnecessary root buffering...
    Clock DAG stats after 'Removing unnecessary root buffering':
      cell counts      : b=0, i=245, icg=30, dcg=0, l=39, total=314
      sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
      misc counts      : r=20, pp=1, mci=38
      cell areas       : b=0.000um^2, i=1162.963um^2, icg=207.382um^2, dcg=0.000um^2, l=113.348um^2, total=1483.693um^2
      cell capacitance : b=0.000fF, i=2374.689fF, icg=21.214fF, dcg=0.000fF, l=39.713fF, total=2435.615fF
      sink capacitance : total=2688.728fF, avg=0.765fF, sd=0.890fF, min=0.000fF, max=10.000fF
      wire capacitance : top=331.822fF, trunk=894.534fF, leaf=2095.620fF, total=3321.976fF
      wire lengths     : top=3665.489um, trunk=10109.973um, leaf=21759.662um, total=35535.124um
      hp wire lengths  : top=2584.456um, trunk=8361.368um, leaf=15585.420um, total=26531.244um
    Clock DAG net violations after 'Removing unnecessary root buffering': none
    Clock DAG primary half-corner transition distribution after 'Removing unnecessary root buffering':
      Top   : target=0.243ns count=7 avg=0.107ns sd=0.033ns min=0.087ns max=0.179ns {6 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
      Trunk : target=0.075ns count=1 avg=0.056ns sd=0.000ns min=0.056ns max=0.056ns {0 <= 0.045ns, 1 <= 0.060ns, 0 <= 0.068ns, 0 <= 0.071ns, 0 <= 0.075ns}
      Trunk : target=0.110ns count=1 avg=0.064ns sd=0.000ns min=0.064ns max=0.064ns {1 <= 0.066ns, 0 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
      Trunk : target=0.177ns count=1 avg=0.055ns sd=0.000ns min=0.055ns max=0.055ns {1 <= 0.106ns, 0 <= 0.141ns, 0 <= 0.159ns, 0 <= 0.168ns, 0 <= 0.177ns}
      Trunk : target=0.184ns count=11 avg=0.125ns sd=0.015ns min=0.109ns max=0.163ns {3 <= 0.111ns, 7 <= 0.148ns, 1 <= 0.166ns, 0 <= 0.175ns, 0 <= 0.184ns}
      Trunk : target=0.235ns count=5 avg=0.128ns sd=0.006ns min=0.121ns max=0.136ns {5 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
      Trunk : target=0.240ns count=2 avg=0.167ns sd=0.046ns min=0.135ns max=0.200ns {1 <= 0.144ns, 0 <= 0.192ns, 1 <= 0.216ns, 0 <= 0.228ns, 0 <= 0.240ns}
      Trunk : target=0.241ns count=1 avg=0.177ns sd=0.000ns min=0.177ns max=0.177ns {0 <= 0.144ns, 1 <= 0.192ns, 0 <= 0.217ns, 0 <= 0.229ns, 0 <= 0.241ns}
      Trunk : target=0.243ns count=127 avg=0.080ns sd=0.065ns min=0.000ns max=0.237ns {111 <= 0.146ns, 1 <= 0.194ns, 6 <= 0.219ns, 5 <= 0.231ns, 4 <= 0.243ns}
      Leaf  : target=0.078ns count=12 avg=0.062ns sd=0.012ns min=0.040ns max=0.076ns {2 <= 0.047ns, 3 <= 0.062ns, 5 <= 0.070ns, 1 <= 0.074ns, 1 <= 0.078ns}
      Leaf  : target=0.110ns count=3 avg=0.081ns sd=0.001ns min=0.080ns max=0.081ns {0 <= 0.066ns, 3 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
      Leaf  : target=0.235ns count=1 avg=0.062ns sd=0.000ns min=0.062ns max=0.062ns {1 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
      Leaf  : target=0.243ns count=178 avg=0.070ns sd=0.054ns min=0.013ns max=0.242ns {163 <= 0.146ns, 0 <= 0.194ns, 0 <= 0.219ns, 1 <= 0.231ns, 14 <= 0.243ns}
    Clock DAG library cell distribution after 'Removing unnecessary root buffering' {count}:
       Invs: INVX16_LVT: 209 INVX8_LVT: 28 INVX4_LVT: 6 INVX2_LVT: 2 
       ICGs: CGLNPRX8_LVT: 11 CGLPPRX8_LVT: 6 CGLNPRX2_LVT: 1 CGLPPRX2_LVT: 12 
     Logics: LSUPX8_LVT: 1 AO21X2_LVT: 6 AO22X2_RVT: 16 AO22X1_RVT: 16 
    Primary reporting skew groups after 'Removing unnecessary root buffering':
      skew_group SDRAM_CLK/func_best_mode: insertion delay [min=0.412, max=1.537], skew [1.125 vs 0.085*]
    Skew group summary after 'Removing unnecessary root buffering':
      skew_group PCI_CLK/func_best_mode: insertion delay [min=0.067, max=0.746], skew [0.679 vs 0.085*]
      skew_group SDRAM_CLK/func_best_mode: insertion delay [min=0.412, max=1.537], skew [1.125 vs 0.085*]
      skew_group SYS_2x_CLK/func_best_mode: insertion delay [min=0.125, max=0.998], skew [0.873 vs 0.085*]
      skew_group SYS_2x_CLK/func_worst_mode: insertion delay [min=0.125, max=0.948], skew [0.824 vs 0.085*]
      skew_group ate_clk/test_best_mode: insertion delay [min=0.195, max=1.147], skew [0.952 vs 0.085*]
      skew_group ate_clk/test_worst_mode: insertion delay [min=0.195, max=1.147], skew [0.952 vs 0.085*]
    Legalizer API calls during this step: 4 succeeded with high effort: 4 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
  Removing unnecessary root buffering done. (took cpu=0:00:00.1 real=0:00:00.1)
  Removing unconstrained drivers...
    Have 18 candidate drivers for removal.
    Removing drivers: ...20% ...40% ...60% ...80% ...100% 
    Clock DAG stats after 'Removing unconstrained drivers':
      cell counts      : b=0, i=245, icg=30, dcg=0, l=39, total=314
      sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
      misc counts      : r=20, pp=1, mci=38
      cell areas       : b=0.000um^2, i=1162.963um^2, icg=207.382um^2, dcg=0.000um^2, l=113.348um^2, total=1483.693um^2
      cell capacitance : b=0.000fF, i=2374.689fF, icg=21.214fF, dcg=0.000fF, l=39.713fF, total=2435.615fF
      sink capacitance : total=2688.728fF, avg=0.765fF, sd=0.890fF, min=0.000fF, max=10.000fF
      wire capacitance : top=331.822fF, trunk=894.534fF, leaf=2095.620fF, total=3321.976fF
      wire lengths     : top=3665.489um, trunk=10109.973um, leaf=21759.662um, total=35535.124um
      hp wire lengths  : top=2584.456um, trunk=8361.368um, leaf=15585.420um, total=26531.244um
    Clock DAG net violations after 'Removing unconstrained drivers': none
    Clock DAG primary half-corner transition distribution after 'Removing unconstrained drivers':
      Top   : target=0.243ns count=7 avg=0.107ns sd=0.033ns min=0.087ns max=0.179ns {6 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
      Trunk : target=0.075ns count=1 avg=0.056ns sd=0.000ns min=0.056ns max=0.056ns {0 <= 0.045ns, 1 <= 0.060ns, 0 <= 0.068ns, 0 <= 0.071ns, 0 <= 0.075ns}
      Trunk : target=0.110ns count=1 avg=0.064ns sd=0.000ns min=0.064ns max=0.064ns {1 <= 0.066ns, 0 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
      Trunk : target=0.177ns count=1 avg=0.055ns sd=0.000ns min=0.055ns max=0.055ns {1 <= 0.106ns, 0 <= 0.141ns, 0 <= 0.159ns, 0 <= 0.168ns, 0 <= 0.177ns}
      Trunk : target=0.184ns count=11 avg=0.125ns sd=0.015ns min=0.109ns max=0.163ns {3 <= 0.111ns, 7 <= 0.148ns, 1 <= 0.166ns, 0 <= 0.175ns, 0 <= 0.184ns}
      Trunk : target=0.235ns count=5 avg=0.128ns sd=0.006ns min=0.121ns max=0.136ns {5 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
      Trunk : target=0.240ns count=2 avg=0.167ns sd=0.046ns min=0.135ns max=0.200ns {1 <= 0.144ns, 0 <= 0.192ns, 1 <= 0.216ns, 0 <= 0.228ns, 0 <= 0.240ns}
      Trunk : target=0.241ns count=1 avg=0.177ns sd=0.000ns min=0.177ns max=0.177ns {0 <= 0.144ns, 1 <= 0.192ns, 0 <= 0.217ns, 0 <= 0.229ns, 0 <= 0.241ns}
      Trunk : target=0.243ns count=127 avg=0.080ns sd=0.065ns min=0.000ns max=0.237ns {111 <= 0.146ns, 1 <= 0.194ns, 6 <= 0.219ns, 5 <= 0.231ns, 4 <= 0.243ns}
      Leaf  : target=0.078ns count=12 avg=0.062ns sd=0.012ns min=0.040ns max=0.076ns {2 <= 0.047ns, 3 <= 0.062ns, 5 <= 0.070ns, 1 <= 0.074ns, 1 <= 0.078ns}
      Leaf  : target=0.110ns count=3 avg=0.081ns sd=0.001ns min=0.080ns max=0.081ns {0 <= 0.066ns, 3 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
      Leaf  : target=0.235ns count=1 avg=0.062ns sd=0.000ns min=0.062ns max=0.062ns {1 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
      Leaf  : target=0.243ns count=178 avg=0.070ns sd=0.054ns min=0.013ns max=0.242ns {163 <= 0.146ns, 0 <= 0.194ns, 0 <= 0.219ns, 1 <= 0.231ns, 14 <= 0.243ns}
    Clock DAG library cell distribution after 'Removing unconstrained drivers' {count}:
       Invs: INVX16_LVT: 209 INVX8_LVT: 28 INVX4_LVT: 6 INVX2_LVT: 2 
       ICGs: CGLNPRX8_LVT: 11 CGLPPRX8_LVT: 6 CGLNPRX2_LVT: 1 CGLPPRX2_LVT: 12 
     Logics: LSUPX8_LVT: 1 AO21X2_LVT: 6 AO22X2_RVT: 16 AO22X1_RVT: 16 
    Primary reporting skew groups after 'Removing unconstrained drivers':
      skew_group SDRAM_CLK/func_best_mode: insertion delay [min=0.412, max=1.537], skew [1.125 vs 0.085*]
    Skew group summary after 'Removing unconstrained drivers':
      skew_group PCI_CLK/func_best_mode: insertion delay [min=0.067, max=0.746], skew [0.679 vs 0.085*]
      skew_group SDRAM_CLK/func_best_mode: insertion delay [min=0.412, max=1.537], skew [1.125 vs 0.085*]
      skew_group SYS_2x_CLK/func_best_mode: insertion delay [min=0.125, max=0.998], skew [0.873 vs 0.085*]
      skew_group SYS_2x_CLK/func_worst_mode: insertion delay [min=0.125, max=0.948], skew [0.824 vs 0.085*]
      skew_group ate_clk/test_best_mode: insertion delay [min=0.195, max=1.147], skew [0.952 vs 0.085*]
      skew_group ate_clk/test_worst_mode: insertion delay [min=0.195, max=1.147], skew [0.952 vs 0.085*]
    Legalizer API calls during this step: 0 succeeded with high effort: 0 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
  Removing unconstrained drivers done. (took cpu=0:00:00.1 real=0:00:00.1)
  Reducing insertion delay 1...
    Clock DAG stats after 'Reducing insertion delay 1':
      cell counts      : b=0, i=251, icg=30, dcg=0, l=39, total=320
      sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
      misc counts      : r=20, pp=1, mci=38
      cell areas       : b=0.000um^2, i=1181.770um^2, icg=207.382um^2, dcg=0.000um^2, l=113.348um^2, total=1502.499um^2
      cell capacitance : b=0.000fF, i=2408.012fF, icg=21.214fF, dcg=0.000fF, l=39.713fF, total=2468.938fF
      sink capacitance : total=2688.728fF, avg=0.765fF, sd=0.890fF, min=0.000fF, max=10.000fF
      wire capacitance : top=331.822fF, trunk=899.078fF, leaf=2095.620fF, total=3326.520fF
      wire lengths     : top=3665.489um, trunk=10155.269um, leaf=21759.662um, total=35580.420um
      hp wire lengths  : top=2584.456um, trunk=8416.392um, leaf=15585.420um, total=26586.268um
    Clock DAG net violations after 'Reducing insertion delay 1': none
    Clock DAG primary half-corner transition distribution after 'Reducing insertion delay 1':
      Top   : target=0.243ns count=7 avg=0.107ns sd=0.033ns min=0.087ns max=0.179ns {6 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
      Trunk : target=0.075ns count=1 avg=0.056ns sd=0.000ns min=0.056ns max=0.056ns {0 <= 0.045ns, 1 <= 0.060ns, 0 <= 0.068ns, 0 <= 0.071ns, 0 <= 0.075ns}
      Trunk : target=0.110ns count=1 avg=0.064ns sd=0.000ns min=0.064ns max=0.064ns {1 <= 0.066ns, 0 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
      Trunk : target=0.177ns count=1 avg=0.055ns sd=0.000ns min=0.055ns max=0.055ns {1 <= 0.106ns, 0 <= 0.141ns, 0 <= 0.159ns, 0 <= 0.168ns, 0 <= 0.177ns}
      Trunk : target=0.184ns count=11 avg=0.125ns sd=0.015ns min=0.109ns max=0.163ns {3 <= 0.111ns, 7 <= 0.148ns, 1 <= 0.166ns, 0 <= 0.175ns, 0 <= 0.184ns}
      Trunk : target=0.235ns count=5 avg=0.115ns sd=0.024ns min=0.072ns max=0.131ns {5 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
      Trunk : target=0.240ns count=2 avg=0.134ns sd=0.001ns min=0.133ns max=0.135ns {2 <= 0.144ns, 0 <= 0.192ns, 0 <= 0.216ns, 0 <= 0.228ns, 0 <= 0.240ns}
      Trunk : target=0.241ns count=1 avg=0.098ns sd=0.000ns min=0.098ns max=0.098ns {1 <= 0.144ns, 0 <= 0.192ns, 0 <= 0.217ns, 0 <= 0.229ns, 0 <= 0.241ns}
      Trunk : target=0.243ns count=133 avg=0.077ns sd=0.064ns min=0.000ns max=0.237ns {117 <= 0.146ns, 1 <= 0.194ns, 6 <= 0.219ns, 5 <= 0.231ns, 4 <= 0.243ns}
      Leaf  : target=0.078ns count=12 avg=0.062ns sd=0.012ns min=0.040ns max=0.076ns {2 <= 0.047ns, 3 <= 0.062ns, 5 <= 0.070ns, 1 <= 0.074ns, 1 <= 0.078ns}
      Leaf  : target=0.110ns count=3 avg=0.081ns sd=0.001ns min=0.080ns max=0.081ns {0 <= 0.066ns, 3 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
      Leaf  : target=0.235ns count=1 avg=0.062ns sd=0.000ns min=0.062ns max=0.062ns {1 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
      Leaf  : target=0.243ns count=178 avg=0.067ns sd=0.054ns min=0.013ns max=0.242ns {163 <= 0.146ns, 0 <= 0.194ns, 0 <= 0.219ns, 1 <= 0.231ns, 14 <= 0.243ns}
    Clock DAG library cell distribution after 'Reducing insertion delay 1' {count}:
       Invs: INVX16_LVT: 211 INVX8_LVT: 29 INVX4_LVT: 8 INVX2_LVT: 3 
       ICGs: CGLNPRX8_LVT: 11 CGLPPRX8_LVT: 6 CGLNPRX2_LVT: 1 CGLPPRX2_LVT: 12 
     Logics: LSUPX8_LVT: 1 AO21X2_LVT: 6 AO22X2_RVT: 16 AO22X1_RVT: 16 
    Primary reporting skew groups after 'Reducing insertion delay 1':
      skew_group SDRAM_CLK/func_best_mode: insertion delay [min=0.412, max=1.537], skew [1.125 vs 0.085*]
    Skew group summary after 'Reducing insertion delay 1':
      skew_group PCI_CLK/func_best_mode: insertion delay [min=0.067, max=0.746], skew [0.679 vs 0.085*]
      skew_group SDRAM_CLK/func_best_mode: insertion delay [min=0.412, max=1.537], skew [1.125 vs 0.085*]
      skew_group SYS_2x_CLK/func_best_mode: insertion delay [min=0.125, max=0.998], skew [0.873 vs 0.085*]
      skew_group SYS_2x_CLK/func_worst_mode: insertion delay [min=0.125, max=0.925], skew [0.800 vs 0.085*]
      skew_group ate_clk/test_best_mode: insertion delay [min=0.195, max=1.129], skew [0.934 vs 0.085*]
      skew_group ate_clk/test_worst_mode: insertion delay [min=0.195, max=1.129], skew [0.934 vs 0.085*]
    Legalizer API calls during this step: 164 succeeded with high effort: 164 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
  Reducing insertion delay 1 done. (took cpu=0:00:00.8 real=0:00:00.8)
  Removing longest path buffering...
    Clock DAG stats after 'Removing longest path buffering':
      cell counts      : b=0, i=251, icg=30, dcg=0, l=39, total=320
      sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
      misc counts      : r=20, pp=1, mci=38
      cell areas       : b=0.000um^2, i=1181.770um^2, icg=207.382um^2, dcg=0.000um^2, l=113.348um^2, total=1502.499um^2
      cell capacitance : b=0.000fF, i=2408.012fF, icg=21.214fF, dcg=0.000fF, l=39.713fF, total=2468.938fF
      sink capacitance : total=2688.728fF, avg=0.765fF, sd=0.890fF, min=0.000fF, max=10.000fF
      wire capacitance : top=331.822fF, trunk=899.078fF, leaf=2095.620fF, total=3326.520fF
      wire lengths     : top=3665.489um, trunk=10155.269um, leaf=21759.662um, total=35580.420um
      hp wire lengths  : top=2584.456um, trunk=8416.392um, leaf=15585.420um, total=26586.268um
    Clock DAG net violations after 'Removing longest path buffering': none
    Clock DAG primary half-corner transition distribution after 'Removing longest path buffering':
      Top   : target=0.243ns count=7 avg=0.107ns sd=0.033ns min=0.087ns max=0.179ns {6 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
      Trunk : target=0.075ns count=1 avg=0.056ns sd=0.000ns min=0.056ns max=0.056ns {0 <= 0.045ns, 1 <= 0.060ns, 0 <= 0.068ns, 0 <= 0.071ns, 0 <= 0.075ns}
      Trunk : target=0.110ns count=1 avg=0.064ns sd=0.000ns min=0.064ns max=0.064ns {1 <= 0.066ns, 0 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
      Trunk : target=0.177ns count=1 avg=0.055ns sd=0.000ns min=0.055ns max=0.055ns {1 <= 0.106ns, 0 <= 0.141ns, 0 <= 0.159ns, 0 <= 0.168ns, 0 <= 0.177ns}
      Trunk : target=0.184ns count=11 avg=0.125ns sd=0.015ns min=0.109ns max=0.163ns {3 <= 0.111ns, 7 <= 0.148ns, 1 <= 0.166ns, 0 <= 0.175ns, 0 <= 0.184ns}
      Trunk : target=0.235ns count=5 avg=0.115ns sd=0.024ns min=0.072ns max=0.131ns {5 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
      Trunk : target=0.240ns count=2 avg=0.134ns sd=0.001ns min=0.133ns max=0.135ns {2 <= 0.144ns, 0 <= 0.192ns, 0 <= 0.216ns, 0 <= 0.228ns, 0 <= 0.240ns}
      Trunk : target=0.241ns count=1 avg=0.098ns sd=0.000ns min=0.098ns max=0.098ns {1 <= 0.144ns, 0 <= 0.192ns, 0 <= 0.217ns, 0 <= 0.229ns, 0 <= 0.241ns}
      Trunk : target=0.243ns count=133 avg=0.077ns sd=0.064ns min=0.000ns max=0.237ns {117 <= 0.146ns, 1 <= 0.194ns, 6 <= 0.219ns, 5 <= 0.231ns, 4 <= 0.243ns}
      Leaf  : target=0.078ns count=12 avg=0.062ns sd=0.012ns min=0.040ns max=0.076ns {2 <= 0.047ns, 3 <= 0.062ns, 5 <= 0.070ns, 1 <= 0.074ns, 1 <= 0.078ns}
      Leaf  : target=0.110ns count=3 avg=0.081ns sd=0.001ns min=0.080ns max=0.081ns {0 <= 0.066ns, 3 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
      Leaf  : target=0.235ns count=1 avg=0.062ns sd=0.000ns min=0.062ns max=0.062ns {1 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
      Leaf  : target=0.243ns count=178 avg=0.067ns sd=0.054ns min=0.013ns max=0.242ns {163 <= 0.146ns, 0 <= 0.194ns, 0 <= 0.219ns, 1 <= 0.231ns, 14 <= 0.243ns}
    Clock DAG library cell distribution after 'Removing longest path buffering' {count}:
       Invs: INVX16_LVT: 211 INVX8_LVT: 29 INVX4_LVT: 8 INVX2_LVT: 3 
       ICGs: CGLNPRX8_LVT: 11 CGLPPRX8_LVT: 6 CGLNPRX2_LVT: 1 CGLPPRX2_LVT: 12 
     Logics: LSUPX8_LVT: 1 AO21X2_LVT: 6 AO22X2_RVT: 16 AO22X1_RVT: 16 
    Primary reporting skew groups after 'Removing longest path buffering':
      skew_group SDRAM_CLK/func_best_mode: insertion delay [min=0.412, max=1.537], skew [1.125 vs 0.085*]
    Skew group summary after 'Removing longest path buffering':
      skew_group PCI_CLK/func_best_mode: insertion delay [min=0.067, max=0.746], skew [0.679 vs 0.085*]
      skew_group SDRAM_CLK/func_best_mode: insertion delay [min=0.412, max=1.537], skew [1.125 vs 0.085*]
      skew_group SYS_2x_CLK/func_best_mode: insertion delay [min=0.125, max=0.998], skew [0.873 vs 0.085*]
      skew_group SYS_2x_CLK/func_worst_mode: insertion delay [min=0.125, max=0.925], skew [0.800 vs 0.085*]
      skew_group ate_clk/test_best_mode: insertion delay [min=0.195, max=1.129], skew [0.934 vs 0.085*]
      skew_group ate_clk/test_worst_mode: insertion delay [min=0.195, max=1.129], skew [0.934 vs 0.085*]
    Legalizer API calls during this step: 166 succeeded with high effort: 166 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
  Removing longest path buffering done. (took cpu=0:00:02.0 real=0:00:02.0)
  Reducing delay of long paths...
    Clock DAG stats after 'Reducing delay of long paths':
      cell counts      : b=0, i=252, icg=30, dcg=0, l=39, total=321
      sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
      misc counts      : r=20, pp=1, mci=38
      cell areas       : b=0.000um^2, i=1089.769um^2, icg=201.282um^2, dcg=0.000um^2, l=112.840um^2, total=1403.891um^2
      cell capacitance : b=0.000fF, i=2169.314fF, icg=21.191fF, dcg=0.000fF, l=39.750fF, total=2230.255fF
      sink capacitance : total=2688.728fF, avg=0.765fF, sd=0.890fF, min=0.000fF, max=10.000fF
      wire capacitance : top=331.822fF, trunk=890.587fF, leaf=2137.732fF, total=3360.141fF
      wire lengths     : top=3665.489um, trunk=10057.683um, leaf=22249.555um, total=35972.727um
      hp wire lengths  : top=2584.456um, trunk=8398.304um, leaf=16042.636um, total=27025.396um
    Clock DAG net violations after 'Reducing delay of long paths': none
    Clock DAG primary half-corner transition distribution after 'Reducing delay of long paths':
      Top   : target=0.243ns count=7 avg=0.107ns sd=0.033ns min=0.087ns max=0.179ns {6 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
      Trunk : target=0.075ns count=1 avg=0.056ns sd=0.000ns min=0.056ns max=0.056ns {0 <= 0.045ns, 1 <= 0.060ns, 0 <= 0.068ns, 0 <= 0.071ns, 0 <= 0.075ns}
      Trunk : target=0.078ns count=1 avg=0.060ns sd=0.000ns min=0.060ns max=0.060ns {0 <= 0.047ns, 1 <= 0.062ns, 0 <= 0.070ns, 0 <= 0.074ns, 0 <= 0.078ns}
      Trunk : target=0.177ns count=3 avg=0.069ns sd=0.017ns min=0.055ns max=0.087ns {3 <= 0.106ns, 0 <= 0.141ns, 0 <= 0.159ns, 0 <= 0.168ns, 0 <= 0.177ns}
      Trunk : target=0.180ns count=1 avg=0.135ns sd=0.000ns min=0.135ns max=0.135ns {0 <= 0.108ns, 1 <= 0.144ns, 0 <= 0.162ns, 0 <= 0.171ns, 0 <= 0.180ns}
      Trunk : target=0.184ns count=9 avg=0.126ns sd=0.017ns min=0.109ns max=0.163ns {3 <= 0.111ns, 5 <= 0.148ns, 1 <= 0.166ns, 0 <= 0.175ns, 0 <= 0.184ns}
      Trunk : target=0.209ns count=1 avg=0.072ns sd=0.000ns min=0.072ns max=0.072ns {1 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
      Trunk : target=0.235ns count=4 avg=0.111ns sd=0.026ns min=0.072ns max=0.127ns {4 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
      Trunk : target=0.240ns count=1 avg=0.133ns sd=0.000ns min=0.133ns max=0.133ns {1 <= 0.144ns, 0 <= 0.192ns, 0 <= 0.216ns, 0 <= 0.228ns, 0 <= 0.240ns}
      Trunk : target=0.241ns count=1 avg=0.096ns sd=0.000ns min=0.096ns max=0.096ns {1 <= 0.144ns, 0 <= 0.192ns, 0 <= 0.217ns, 0 <= 0.229ns, 0 <= 0.241ns}
      Trunk : target=0.243ns count=134 avg=0.074ns sd=0.063ns min=0.000ns max=0.237ns {118 <= 0.146ns, 1 <= 0.194ns, 6 <= 0.219ns, 5 <= 0.231ns, 4 <= 0.243ns}
      Leaf  : target=0.078ns count=12 avg=0.062ns sd=0.012ns min=0.040ns max=0.076ns {2 <= 0.047ns, 3 <= 0.062ns, 5 <= 0.070ns, 1 <= 0.074ns, 1 <= 0.078ns}
      Leaf  : target=0.110ns count=3 avg=0.081ns sd=0.001ns min=0.080ns max=0.082ns {0 <= 0.066ns, 3 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
      Leaf  : target=0.209ns count=1 avg=0.059ns sd=0.000ns min=0.059ns max=0.059ns {1 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
      Leaf  : target=0.243ns count=178 avg=0.069ns sd=0.054ns min=0.013ns max=0.242ns {163 <= 0.146ns, 0 <= 0.194ns, 0 <= 0.219ns, 1 <= 0.231ns, 14 <= 0.243ns}
    Clock DAG library cell distribution after 'Reducing delay of long paths' {count}:
       Invs: INVX16_LVT: 165 INVX8_LVT: 75 INVX4_LVT: 8 INVX2_LVT: 4 
       ICGs: CGLNPRX8_LVT: 9 CGLPPRX8_LVT: 4 CGLNPRX2_LVT: 3 CGLPPRX2_LVT: 14 
     Logics: LSUPX8_LVT: 1 AO21X2_LVT: 4 AO22X2_RVT: 16 AO21X1_LVT: 2 AO22X1_RVT: 16 
    Primary reporting skew groups after 'Reducing delay of long paths':
      skew_group SDRAM_CLK/func_best_mode: insertion delay [min=0.412, max=1.441, avg=1.388, sd=0.093, skn=-5.217, kur=38.942], skew [1.029 vs 0.085*], 88.2% {1.361, 1.441} (wid=0.110 ws=0.073) (gid=1.369 gs=0.995)
    Skew group summary after 'Reducing delay of long paths':
      skew_group PCI_CLK/func_best_mode: insertion delay [min=0.067, max=0.746, avg=0.695, sd=0.092, skn=-6.395, kur=41.378], skew [0.679 vs 0.085*], 98% {0.690, 0.746} (wid=0.029 ws=0.028) (gid=0.717 gs=0.651)
      skew_group SDRAM_CLK/func_best_mode: insertion delay [min=0.412, max=1.441, avg=1.388, sd=0.093, skn=-5.217, kur=38.942], skew [1.029 vs 0.085*], 88.2% {1.361, 1.441} (wid=0.110 ws=0.073) (gid=1.369 gs=0.995)
      skew_group SYS_2x_CLK/func_best_mode: insertion delay [min=0.125, max=0.899, avg=0.806, sd=0.142, skn=-4.185, kur=17.247], skew [0.774 vs 0.085*], 84.6% {0.815, 0.899} (wid=0.017 ws=0.016) (gid=0.898 gs=0.778)
      skew_group SYS_2x_CLK/func_worst_mode: insertion delay [min=0.125, max=0.899, avg=0.477, sd=0.307, skn=-0.202, kur=-1.826], skew [0.774 vs 0.085*], 40% {0.125, 0.210} (wid=0.005 ws=0.004) (gid=0.898 gs=0.778)
      skew_group ate_clk/test_best_mode: insertion delay [min=0.195, max=1.082, avg=0.985, sd=0.121, skn=-1.816, kur=3.327], skew [0.887 vs 0.085*], 76.2% {0.995, 1.080} (wid=0.067 ws=0.064) (gid=1.066 gs=0.875)
      skew_group ate_clk/test_worst_mode: insertion delay [min=0.195, max=1.082, avg=0.990, sd=0.123, skn=-1.947, kur=3.651], skew [0.887 vs 0.085*], 80.7% {0.995, 1.080} (wid=0.067 ws=0.064) (gid=1.066 gs=0.875)
    Legalizer API calls during this step: 6467 succeeded with high effort: 6467 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
  Reducing delay of long paths done. (took cpu=0:00:33.3 real=0:00:33.2)
  Stage::Insertion Delay Reduction done. (took cpu=0:00:36.3 real=0:00:36.2)
  CCOpt::Phase::Construction done. (took cpu=0:01:27 real=0:01:01)
  CCOpt::Phase::Implementation...
  Stage::Reducing Power...
  Improving clock tree routing...
    Iteration 1...
    Iteration 1 done.
    Clock DAG stats after 'Improving clock tree routing':
      cell counts      : b=0, i=252, icg=30, dcg=0, l=39, total=321
      sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
      misc counts      : r=20, pp=1, mci=38
      cell areas       : b=0.000um^2, i=1089.769um^2, icg=201.282um^2, dcg=0.000um^2, l=112.840um^2, total=1403.891um^2
      cell capacitance : b=0.000fF, i=2169.314fF, icg=21.191fF, dcg=0.000fF, l=39.750fF, total=2230.255fF
      sink capacitance : total=2688.728fF, avg=0.765fF, sd=0.890fF, min=0.000fF, max=10.000fF
      wire capacitance : top=331.822fF, trunk=883.605fF, leaf=2137.732fF, total=3353.160fF
      wire lengths     : top=3665.489um, trunk=9976.666um, leaf=22249.555um, total=35891.710um
      hp wire lengths  : top=2584.456um, trunk=8315.312um, leaf=16042.636um, total=26942.404um
    Clock DAG net violations after 'Improving clock tree routing': none
    Clock DAG primary half-corner transition distribution after 'Improving clock tree routing':
      Top   : target=0.243ns count=7 avg=0.107ns sd=0.033ns min=0.087ns max=0.179ns {6 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
      Trunk : target=0.075ns count=1 avg=0.056ns sd=0.000ns min=0.056ns max=0.056ns {0 <= 0.045ns, 1 <= 0.060ns, 0 <= 0.068ns, 0 <= 0.071ns, 0 <= 0.075ns}
      Trunk : target=0.078ns count=1 avg=0.060ns sd=0.000ns min=0.060ns max=0.060ns {0 <= 0.047ns, 1 <= 0.062ns, 0 <= 0.070ns, 0 <= 0.074ns, 0 <= 0.078ns}
      Trunk : target=0.177ns count=3 avg=0.069ns sd=0.017ns min=0.055ns max=0.087ns {3 <= 0.106ns, 0 <= 0.141ns, 0 <= 0.159ns, 0 <= 0.168ns, 0 <= 0.177ns}
      Trunk : target=0.180ns count=1 avg=0.135ns sd=0.000ns min=0.135ns max=0.135ns {0 <= 0.108ns, 1 <= 0.144ns, 0 <= 0.162ns, 0 <= 0.171ns, 0 <= 0.180ns}
      Trunk : target=0.184ns count=9 avg=0.125ns sd=0.017ns min=0.109ns max=0.163ns {3 <= 0.111ns, 5 <= 0.148ns, 1 <= 0.166ns, 0 <= 0.175ns, 0 <= 0.184ns}
      Trunk : target=0.209ns count=1 avg=0.072ns sd=0.000ns min=0.072ns max=0.072ns {1 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
      Trunk : target=0.235ns count=4 avg=0.111ns sd=0.026ns min=0.072ns max=0.127ns {4 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
      Trunk : target=0.240ns count=1 avg=0.133ns sd=0.000ns min=0.133ns max=0.133ns {1 <= 0.144ns, 0 <= 0.192ns, 0 <= 0.216ns, 0 <= 0.228ns, 0 <= 0.240ns}
      Trunk : target=0.241ns count=1 avg=0.096ns sd=0.000ns min=0.096ns max=0.096ns {1 <= 0.144ns, 0 <= 0.192ns, 0 <= 0.217ns, 0 <= 0.229ns, 0 <= 0.241ns}
      Trunk : target=0.243ns count=134 avg=0.074ns sd=0.063ns min=0.000ns max=0.237ns {118 <= 0.146ns, 1 <= 0.194ns, 6 <= 0.219ns, 5 <= 0.231ns, 4 <= 0.243ns}
      Leaf  : target=0.078ns count=12 avg=0.062ns sd=0.012ns min=0.040ns max=0.076ns {2 <= 0.047ns, 3 <= 0.062ns, 5 <= 0.070ns, 1 <= 0.074ns, 1 <= 0.078ns}
      Leaf  : target=0.110ns count=3 avg=0.081ns sd=0.001ns min=0.080ns max=0.082ns {0 <= 0.066ns, 3 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
      Leaf  : target=0.209ns count=1 avg=0.059ns sd=0.000ns min=0.059ns max=0.059ns {1 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
      Leaf  : target=0.243ns count=178 avg=0.069ns sd=0.054ns min=0.013ns max=0.242ns {163 <= 0.146ns, 0 <= 0.194ns, 0 <= 0.219ns, 1 <= 0.231ns, 14 <= 0.243ns}
    Clock DAG library cell distribution after 'Improving clock tree routing' {count}:
       Invs: INVX16_LVT: 165 INVX8_LVT: 75 INVX4_LVT: 8 INVX2_LVT: 4 
       ICGs: CGLNPRX8_LVT: 9 CGLPPRX8_LVT: 4 CGLNPRX2_LVT: 3 CGLPPRX2_LVT: 14 
     Logics: LSUPX8_LVT: 1 AO21X2_LVT: 4 AO22X2_RVT: 16 AO21X1_LVT: 2 AO22X1_RVT: 16 
    Primary reporting skew groups after 'Improving clock tree routing':
      skew_group SDRAM_CLK/func_best_mode: insertion delay [min=0.412, max=1.441], skew [1.029 vs 0.085*]
    Skew group summary after 'Improving clock tree routing':
      skew_group PCI_CLK/func_best_mode: insertion delay [min=0.067, max=0.746], skew [0.679 vs 0.085*]
      skew_group SDRAM_CLK/func_best_mode: insertion delay [min=0.412, max=1.441], skew [1.029 vs 0.085*]
      skew_group SYS_2x_CLK/func_best_mode: insertion delay [min=0.125, max=0.899], skew [0.774 vs 0.085*]
      skew_group SYS_2x_CLK/func_worst_mode: insertion delay [min=0.125, max=0.899], skew [0.774 vs 0.085*]
      skew_group ate_clk/test_best_mode: insertion delay [min=0.198, max=1.079], skew [0.881 vs 0.085*]
      skew_group ate_clk/test_worst_mode: insertion delay [min=0.198, max=1.079], skew [0.881 vs 0.085*]
    Legalizer API calls during this step: 224 succeeded with high effort: 224 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
  Improving clock tree routing done. (took cpu=0:00:01.1 real=0:00:00.8)
  Reducing clock tree power 1...
    Resizing gates: 
    ...20% ...40% ...60% ...80% ...Legalizing clock trees...
    Legalizing clock trees done. (took cpu=0:00:00.1 real=0:00:00.1)
    100% 
    Clock DAG stats after reducing clock tree power 1 iteration 1:
      cell counts      : b=0, i=252, icg=30, dcg=0, l=39, total=321
      sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
      misc counts      : r=20, pp=1, mci=38
      cell areas       : b=0.000um^2, i=783.780um^2, icg=199.757um^2, dcg=0.000um^2, l=112.840um^2, total=1096.377um^2
      cell capacitance : b=0.000fF, i=1384.118fF, icg=21.184fF, dcg=0.000fF, l=39.750fF, total=1445.052fF
      sink capacitance : total=2688.728fF, avg=0.765fF, sd=0.890fF, min=0.000fF, max=10.000fF
      wire capacitance : top=331.822fF, trunk=876.358fF, leaf=2138.954fF, total=3347.134fF
      wire lengths     : top=3665.489um, trunk=9891.394um, leaf=22227.971um, total=35784.854um
      hp wire lengths  : top=2584.456um, trunk=8214.536um, leaf=16081.396um, total=26880.388um
    Clock DAG net violations after reducing clock tree power 1 iteration 1: none
    Clock DAG primary half-corner transition distribution after reducing clock tree power 1 iteration 1:
      Top   : target=0.243ns count=7 avg=0.107ns sd=0.033ns min=0.087ns max=0.179ns {6 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
      Trunk : target=0.075ns count=1 avg=0.049ns sd=0.000ns min=0.049ns max=0.049ns {0 <= 0.045ns, 1 <= 0.060ns, 0 <= 0.068ns, 0 <= 0.071ns, 0 <= 0.075ns}
      Trunk : target=0.078ns count=1 avg=0.033ns sd=0.000ns min=0.033ns max=0.033ns {1 <= 0.047ns, 0 <= 0.062ns, 0 <= 0.070ns, 0 <= 0.074ns, 0 <= 0.078ns}
      Trunk : target=0.177ns count=3 avg=0.069ns sd=0.017ns min=0.055ns max=0.087ns {3 <= 0.106ns, 0 <= 0.141ns, 0 <= 0.159ns, 0 <= 0.168ns, 0 <= 0.177ns}
      Trunk : target=0.180ns count=2 avg=0.078ns sd=0.020ns min=0.064ns max=0.092ns {2 <= 0.108ns, 0 <= 0.144ns, 0 <= 0.162ns, 0 <= 0.171ns, 0 <= 0.180ns}
      Trunk : target=0.184ns count=9 avg=0.122ns sd=0.016ns min=0.109ns max=0.162ns {3 <= 0.111ns, 5 <= 0.148ns, 1 <= 0.166ns, 0 <= 0.175ns, 0 <= 0.184ns}
      Trunk : target=0.209ns count=1 avg=0.072ns sd=0.000ns min=0.072ns max=0.072ns {1 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
      Trunk : target=0.235ns count=4 avg=0.111ns sd=0.026ns min=0.072ns max=0.127ns {4 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
      Trunk : target=0.241ns count=1 avg=0.096ns sd=0.000ns min=0.096ns max=0.096ns {1 <= 0.144ns, 0 <= 0.192ns, 0 <= 0.217ns, 0 <= 0.229ns, 0 <= 0.241ns}
      Trunk : target=0.243ns count=134 avg=0.067ns sd=0.038ns min=0.000ns max=0.147ns {133 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
      Leaf  : target=0.078ns count=12 avg=0.062ns sd=0.012ns min=0.040ns max=0.076ns {2 <= 0.047ns, 3 <= 0.062ns, 5 <= 0.070ns, 1 <= 0.074ns, 1 <= 0.078ns}
      Leaf  : target=0.110ns count=3 avg=0.081ns sd=0.001ns min=0.080ns max=0.082ns {0 <= 0.066ns, 3 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
      Leaf  : target=0.209ns count=1 avg=0.059ns sd=0.000ns min=0.059ns max=0.059ns {1 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
      Leaf  : target=0.243ns count=178 avg=0.089ns sd=0.054ns min=0.034ns max=0.243ns {163 <= 0.146ns, 0 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 15 <= 0.243ns}
    Clock DAG library cell distribution after reducing clock tree power 1 iteration 1 {count}:
       Invs: INVX16_LVT: 64 INVX8_LVT: 96 INVX4_LVT: 50 INVX2_LVT: 42 
       ICGs: CGLNPRX8_LVT: 9 CGLPPRX8_LVT: 3 CGLNPRX2_LVT: 3 CGLPPRX2_LVT: 15 
     Logics: LSUPX8_LVT: 1 AO21X2_LVT: 4 AO22X2_RVT: 16 AO21X1_LVT: 2 AO22X1_RVT: 16 
    Primary reporting skew groups after reducing clock tree power 1 iteration 1:
      skew_group SDRAM_CLK/func_best_mode: insertion delay [min=0.460, max=1.440], skew [0.981 vs 0.085*]
    Skew group summary after reducing clock tree power 1 iteration 1:
      skew_group PCI_CLK/func_best_mode: insertion delay [min=0.114, max=0.723], skew [0.609 vs 0.085*]
      skew_group SDRAM_CLK/func_best_mode: insertion delay [min=0.460, max=1.440], skew [0.981 vs 0.085*]
      skew_group SYS_2x_CLK/func_best_mode: insertion delay [min=0.186, max=0.883], skew [0.697 vs 0.085*]
      skew_group SYS_2x_CLK/func_worst_mode: insertion delay [min=0.186, max=0.883], skew [0.697 vs 0.085*]
      skew_group ate_clk/test_best_mode: insertion delay [min=0.395, max=1.060], skew [0.664 vs 0.085*]
      skew_group ate_clk/test_worst_mode: insertion delay [min=0.395, max=1.060], skew [0.664 vs 0.085*]
    Resizing gates: 
    ...20% ...40% ...60% ...80% ...Legalizing clock trees...
    Legalizing clock trees done. (took cpu=0:00:00.1 real=0:00:00.1)
    100% 
    Clock DAG stats after reducing clock tree power 1 iteration 2:
      cell counts      : b=0, i=252, icg=30, dcg=0, l=39, total=321
      sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
      misc counts      : r=20, pp=1, mci=38
      cell areas       : b=0.000um^2, i=748.708um^2, icg=199.757um^2, dcg=0.000um^2, l=112.840um^2, total=1061.305um^2
      cell capacitance : b=0.000fF, i=1294.186fF, icg=21.184fF, dcg=0.000fF, l=39.750fF, total=1355.120fF
      sink capacitance : total=2688.728fF, avg=0.765fF, sd=0.890fF, min=0.000fF, max=10.000fF
      wire capacitance : top=331.822fF, trunk=876.407fF, leaf=2138.768fF, total=3346.996fF
      wire lengths     : top=3665.489um, trunk=9891.700um, leaf=22225.842um, total=35783.031um
      hp wire lengths  : top=2584.456um, trunk=8214.536um, leaf=16081.396um, total=26880.388um
    Clock DAG net violations after reducing clock tree power 1 iteration 2: none
    Clock DAG primary half-corner transition distribution after reducing clock tree power 1 iteration 2:
      Top   : target=0.243ns count=7 avg=0.107ns sd=0.033ns min=0.087ns max=0.179ns {6 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
      Trunk : target=0.075ns count=1 avg=0.049ns sd=0.000ns min=0.049ns max=0.049ns {0 <= 0.045ns, 1 <= 0.060ns, 0 <= 0.068ns, 0 <= 0.071ns, 0 <= 0.075ns}
      Trunk : target=0.078ns count=1 avg=0.028ns sd=0.000ns min=0.028ns max=0.028ns {1 <= 0.047ns, 0 <= 0.062ns, 0 <= 0.070ns, 0 <= 0.074ns, 0 <= 0.078ns}
      Trunk : target=0.177ns count=3 avg=0.069ns sd=0.017ns min=0.055ns max=0.087ns {3 <= 0.106ns, 0 <= 0.141ns, 0 <= 0.159ns, 0 <= 0.168ns, 0 <= 0.177ns}
      Trunk : target=0.180ns count=2 avg=0.078ns sd=0.020ns min=0.064ns max=0.092ns {2 <= 0.108ns, 0 <= 0.144ns, 0 <= 0.162ns, 0 <= 0.171ns, 0 <= 0.180ns}
      Trunk : target=0.184ns count=9 avg=0.122ns sd=0.016ns min=0.109ns max=0.162ns {3 <= 0.111ns, 5 <= 0.148ns, 1 <= 0.166ns, 0 <= 0.175ns, 0 <= 0.184ns}
      Trunk : target=0.209ns count=1 avg=0.072ns sd=0.000ns min=0.072ns max=0.072ns {1 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
      Trunk : target=0.235ns count=4 avg=0.098ns sd=0.030ns min=0.071ns max=0.127ns {4 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
      Trunk : target=0.241ns count=1 avg=0.096ns sd=0.000ns min=0.096ns max=0.096ns {1 <= 0.144ns, 0 <= 0.192ns, 0 <= 0.217ns, 0 <= 0.229ns, 0 <= 0.241ns}
      Trunk : target=0.243ns count=134 avg=0.069ns sd=0.039ns min=0.000ns max=0.147ns {133 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
      Leaf  : target=0.078ns count=12 avg=0.062ns sd=0.012ns min=0.040ns max=0.076ns {2 <= 0.047ns, 3 <= 0.062ns, 5 <= 0.070ns, 1 <= 0.074ns, 1 <= 0.078ns}
      Leaf  : target=0.110ns count=3 avg=0.081ns sd=0.001ns min=0.080ns max=0.082ns {0 <= 0.066ns, 3 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
      Leaf  : target=0.209ns count=1 avg=0.059ns sd=0.000ns min=0.059ns max=0.059ns {1 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
      Leaf  : target=0.243ns count=178 avg=0.092ns sd=0.054ns min=0.034ns max=0.243ns {163 <= 0.146ns, 0 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 15 <= 0.243ns}
    Clock DAG library cell distribution after reducing clock tree power 1 iteration 2 {count}:
       Invs: INVX16_LVT: 56 INVX8_LVT: 88 INVX4_LVT: 61 INVX2_LVT: 47 
       ICGs: CGLNPRX8_LVT: 9 CGLPPRX8_LVT: 3 CGLNPRX2_LVT: 3 CGLPPRX2_LVT: 15 
     Logics: LSUPX8_LVT: 1 AO21X2_LVT: 4 AO22X2_RVT: 16 AO21X1_LVT: 2 AO22X1_RVT: 16 
    Primary reporting skew groups after reducing clock tree power 1 iteration 2:
      skew_group SDRAM_CLK/func_best_mode: insertion delay [min=0.498, max=1.438], skew [0.940 vs 0.085*]
    Skew group summary after reducing clock tree power 1 iteration 2:
      skew_group PCI_CLK/func_best_mode: insertion delay [min=0.114, max=0.711], skew [0.598 vs 0.085*]
      skew_group SDRAM_CLK/func_best_mode: insertion delay [min=0.498, max=1.438], skew [0.940 vs 0.085*]
      skew_group SYS_2x_CLK/func_best_mode: insertion delay [min=0.186, max=0.883], skew [0.697 vs 0.085*]
      skew_group SYS_2x_CLK/func_worst_mode: insertion delay [min=0.186, max=0.883], skew [0.697 vs 0.085*]
      skew_group ate_clk/test_best_mode: insertion delay [min=0.412, max=1.047], skew [0.635 vs 0.085*]
      skew_group ate_clk/test_worst_mode: insertion delay [min=0.412, max=1.047], skew [0.635 vs 0.085*]
    Resizing gates: 
    ...20% ...40% ...60% ...80% ...Legalizing clock trees...
    Legalizing clock trees done. (took cpu=0:00:00.1 real=0:00:00.1)
    100% 
    Clock DAG stats after 'Reducing clock tree power 1':
      cell counts      : b=0, i=252, icg=30, dcg=0, l=39, total=321
      sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
      misc counts      : r=20, pp=1, mci=38
      cell areas       : b=0.000um^2, i=745.150um^2, icg=199.757um^2, dcg=0.000um^2, l=112.840um^2, total=1057.747um^2
      cell capacitance : b=0.000fF, i=1285.078fF, icg=21.184fF, dcg=0.000fF, l=39.750fF, total=1346.013fF
      sink capacitance : total=2688.728fF, avg=0.765fF, sd=0.890fF, min=0.000fF, max=10.000fF
      wire capacitance : top=331.822fF, trunk=876.287fF, leaf=2138.768fF, total=3346.877fF
      wire lengths     : top=3665.489um, trunk=9890.484um, leaf=22225.842um, total=35781.815um
      hp wire lengths  : top=2584.456um, trunk=8214.536um, leaf=16081.396um, total=26880.388um
    Clock DAG net violations after 'Reducing clock tree power 1': none
    Clock DAG primary half-corner transition distribution after 'Reducing clock tree power 1':
      Top   : target=0.243ns count=7 avg=0.107ns sd=0.033ns min=0.087ns max=0.179ns {6 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
      Trunk : target=0.075ns count=1 avg=0.049ns sd=0.000ns min=0.049ns max=0.049ns {0 <= 0.045ns, 1 <= 0.060ns, 0 <= 0.068ns, 0 <= 0.071ns, 0 <= 0.075ns}
      Trunk : target=0.078ns count=1 avg=0.028ns sd=0.000ns min=0.028ns max=0.028ns {1 <= 0.047ns, 0 <= 0.062ns, 0 <= 0.070ns, 0 <= 0.074ns, 0 <= 0.078ns}
      Trunk : target=0.177ns count=3 avg=0.069ns sd=0.017ns min=0.055ns max=0.087ns {3 <= 0.106ns, 0 <= 0.141ns, 0 <= 0.159ns, 0 <= 0.168ns, 0 <= 0.177ns}
      Trunk : target=0.180ns count=2 avg=0.078ns sd=0.020ns min=0.064ns max=0.092ns {2 <= 0.108ns, 0 <= 0.144ns, 0 <= 0.162ns, 0 <= 0.171ns, 0 <= 0.180ns}
      Trunk : target=0.184ns count=9 avg=0.122ns sd=0.016ns min=0.109ns max=0.162ns {3 <= 0.111ns, 5 <= 0.148ns, 1 <= 0.166ns, 0 <= 0.175ns, 0 <= 0.184ns}
      Trunk : target=0.209ns count=1 avg=0.072ns sd=0.000ns min=0.072ns max=0.072ns {1 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
      Trunk : target=0.235ns count=4 avg=0.095ns sd=0.033ns min=0.062ns max=0.127ns {4 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
      Trunk : target=0.241ns count=1 avg=0.096ns sd=0.000ns min=0.096ns max=0.096ns {1 <= 0.144ns, 0 <= 0.192ns, 0 <= 0.217ns, 0 <= 0.229ns, 0 <= 0.241ns}
      Trunk : target=0.243ns count=134 avg=0.070ns sd=0.039ns min=0.000ns max=0.147ns {133 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
      Leaf  : target=0.078ns count=12 avg=0.062ns sd=0.012ns min=0.040ns max=0.076ns {2 <= 0.047ns, 3 <= 0.062ns, 5 <= 0.070ns, 1 <= 0.074ns, 1 <= 0.078ns}
      Leaf  : target=0.110ns count=3 avg=0.081ns sd=0.001ns min=0.080ns max=0.082ns {0 <= 0.066ns, 3 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
      Leaf  : target=0.209ns count=1 avg=0.059ns sd=0.000ns min=0.059ns max=0.059ns {1 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
      Leaf  : target=0.243ns count=178 avg=0.092ns sd=0.054ns min=0.034ns max=0.243ns {163 <= 0.146ns, 0 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 15 <= 0.243ns}
    Clock DAG library cell distribution after 'Reducing clock tree power 1' {count}:
       Invs: INVX16_LVT: 56 INVX8_LVT: 85 INVX4_LVT: 63 INVX2_LVT: 48 
       ICGs: CGLNPRX8_LVT: 9 CGLPPRX8_LVT: 3 CGLNPRX2_LVT: 3 CGLPPRX2_LVT: 15 
     Logics: LSUPX8_LVT: 1 AO21X2_LVT: 4 AO22X2_RVT: 16 AO21X1_LVT: 2 AO22X1_RVT: 16 
    Primary reporting skew groups after 'Reducing clock tree power 1':
      skew_group SDRAM_CLK/func_best_mode: insertion delay [min=0.498, max=1.438], skew [0.940 vs 0.085*]
    Skew group summary after 'Reducing clock tree power 1':
      skew_group PCI_CLK/func_best_mode: insertion delay [min=0.114, max=0.711], skew [0.598 vs 0.085*]
      skew_group SDRAM_CLK/func_best_mode: insertion delay [min=0.498, max=1.438], skew [0.940 vs 0.085*]
      skew_group SYS_2x_CLK/func_best_mode: insertion delay [min=0.186, max=0.883], skew [0.697 vs 0.085*]
      skew_group SYS_2x_CLK/func_worst_mode: insertion delay [min=0.186, max=0.883], skew [0.697 vs 0.085*]
      skew_group ate_clk/test_best_mode: insertion delay [min=0.412, max=1.047], skew [0.635 vs 0.085*]
      skew_group ate_clk/test_worst_mode: insertion delay [min=0.412, max=1.047], skew [0.635 vs 0.085*]
    Legalizer API calls during this step: 2160 succeeded with high effort: 2160 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
  Reducing clock tree power 1 done. (took cpu=0:00:06.7 real=0:00:02.0)
  Reducing clock tree power 2...
    Clock DAG stats after 'Reducing clock tree power 2':
      cell counts      : b=0, i=252, icg=30, dcg=0, l=39, total=321
      sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
      misc counts      : r=20, pp=1, mci=38
      cell areas       : b=0.000um^2, i=745.150um^2, icg=199.757um^2, dcg=0.000um^2, l=112.840um^2, total=1057.747um^2
      cell capacitance : b=0.000fF, i=1285.078fF, icg=21.184fF, dcg=0.000fF, l=39.750fF, total=1346.013fF
      sink capacitance : total=2688.728fF, avg=0.765fF, sd=0.890fF, min=0.000fF, max=10.000fF
      wire capacitance : top=331.822fF, trunk=940.185fF, leaf=2148.038fF, total=3420.044fF
      wire lengths     : top=3665.489um, trunk=10625.554um, leaf=22327.530um, total=36618.573um
      hp wire lengths  : top=2584.456um, trunk=8844.120um, leaf=16187.036um, total=27615.612um
    Clock DAG net violations after 'Reducing clock tree power 2': none
    Clock DAG primary half-corner transition distribution after 'Reducing clock tree power 2':
      Top   : target=0.243ns count=7 avg=0.107ns sd=0.033ns min=0.087ns max=0.179ns {6 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
      Trunk : target=0.075ns count=1 avg=0.049ns sd=0.000ns min=0.049ns max=0.049ns {0 <= 0.045ns, 1 <= 0.060ns, 0 <= 0.068ns, 0 <= 0.071ns, 0 <= 0.075ns}
      Trunk : target=0.078ns count=1 avg=0.028ns sd=0.000ns min=0.028ns max=0.028ns {1 <= 0.047ns, 0 <= 0.062ns, 0 <= 0.070ns, 0 <= 0.074ns, 0 <= 0.078ns}
      Trunk : target=0.177ns count=3 avg=0.069ns sd=0.017ns min=0.055ns max=0.087ns {3 <= 0.106ns, 0 <= 0.141ns, 0 <= 0.159ns, 0 <= 0.168ns, 0 <= 0.177ns}
      Trunk : target=0.180ns count=2 avg=0.078ns sd=0.020ns min=0.064ns max=0.092ns {2 <= 0.108ns, 0 <= 0.144ns, 0 <= 0.162ns, 0 <= 0.171ns, 0 <= 0.180ns}
      Trunk : target=0.184ns count=9 avg=0.122ns sd=0.016ns min=0.109ns max=0.162ns {3 <= 0.111ns, 5 <= 0.148ns, 1 <= 0.166ns, 0 <= 0.175ns, 0 <= 0.184ns}
      Trunk : target=0.209ns count=1 avg=0.072ns sd=0.000ns min=0.072ns max=0.072ns {1 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
      Trunk : target=0.235ns count=4 avg=0.095ns sd=0.033ns min=0.062ns max=0.127ns {4 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
      Trunk : target=0.241ns count=1 avg=0.096ns sd=0.000ns min=0.096ns max=0.096ns {1 <= 0.144ns, 0 <= 0.192ns, 0 <= 0.217ns, 0 <= 0.229ns, 0 <= 0.241ns}
      Trunk : target=0.243ns count=134 avg=0.073ns sd=0.041ns min=0.000ns max=0.147ns {133 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
      Leaf  : target=0.078ns count=12 avg=0.062ns sd=0.012ns min=0.040ns max=0.076ns {2 <= 0.047ns, 3 <= 0.062ns, 5 <= 0.070ns, 1 <= 0.074ns, 1 <= 0.078ns}
      Leaf  : target=0.110ns count=3 avg=0.081ns sd=0.001ns min=0.080ns max=0.082ns {0 <= 0.066ns, 3 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
      Leaf  : target=0.209ns count=1 avg=0.059ns sd=0.000ns min=0.059ns max=0.059ns {1 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
      Leaf  : target=0.243ns count=178 avg=0.092ns sd=0.054ns min=0.034ns max=0.243ns {163 <= 0.146ns, 0 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 15 <= 0.243ns}
    Clock DAG library cell distribution after 'Reducing clock tree power 2' {count}:
       Invs: INVX16_LVT: 56 INVX8_LVT: 85 INVX4_LVT: 63 INVX2_LVT: 48 
       ICGs: CGLNPRX8_LVT: 9 CGLPPRX8_LVT: 3 CGLNPRX2_LVT: 3 CGLPPRX2_LVT: 15 
     Logics: LSUPX8_LVT: 1 AO21X2_LVT: 4 AO22X2_RVT: 16 AO21X1_LVT: 2 AO22X1_RVT: 16 
    Primary reporting skew groups after 'Reducing clock tree power 2':
      skew_group SDRAM_CLK/func_best_mode: insertion delay [min=0.545, max=1.438, avg=1.391, sd=0.073, skn=-5.830, kur=54.016], skew [0.893 vs 0.085*], 90% {1.353, 1.438} (wid=0.115 ws=0.080) (gid=1.360 gs=0.853)
    Skew group summary after 'Reducing clock tree power 2':
      skew_group PCI_CLK/func_best_mode: insertion delay [min=0.135, max=0.719, avg=0.694, sd=0.081, skn=-6.724, kur=44.192], skew [0.584 vs 0.085*], 98% {0.678, 0.719} (wid=0.028 ws=0.026) (gid=0.709 gs=0.576)
      skew_group SDRAM_CLK/func_best_mode: insertion delay [min=0.545, max=1.438, avg=1.391, sd=0.073, skn=-5.830, kur=54.016], skew [0.893 vs 0.085*], 90% {1.353, 1.438} (wid=0.115 ws=0.080) (gid=1.360 gs=0.853)
      skew_group SYS_2x_CLK/func_best_mode: insertion delay [min=0.194, max=0.883, avg=0.826, sd=0.133, skn=-4.125, kur=16.643], skew [0.689 vs 0.085*], 91.6% {0.802, 0.883} (wid=0.016 ws=0.015) (gid=0.882 gs=0.693)
      skew_group SYS_2x_CLK/func_worst_mode: insertion delay [min=0.194, max=0.883, avg=0.497, sd=0.265, skn=-0.162, kur=-1.746], skew [0.689 vs 0.085*], 40% {0.194, 0.279} (wid=0.005 ws=0.004) (gid=0.882 gs=0.693)
      skew_group ate_clk/test_best_mode: insertion delay [min=0.616, max=1.047, avg=1.007, sd=0.048, skn=-4.198, kur=22.259], skew [0.430 vs 0.085*], 94.9% {0.964, 1.047} (wid=0.059 ws=0.058) (gid=1.040 gs=0.427)
      skew_group ate_clk/test_worst_mode: insertion delay [min=0.616, max=1.047, avg=1.006, sd=0.049, skn=-4.128, kur=21.302], skew [0.430 vs 0.085*], 94.6% {0.964, 1.047} (wid=0.059 ws=0.056) (gid=1.035 gs=0.421)
    Legalizer API calls during this step: 1309 succeeded with high effort: 1309 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
  Reducing clock tree power 2 done. (took cpu=0:00:03.0 real=0:00:03.0)
  Stage::Reducing Power done. (took cpu=0:00:10.8 real=0:00:05.8)
  Stage::Balancing...
  Improving subtree skew...
    Clock DAG stats after 'Improving subtree skew':
      cell counts      : b=0, i=252, icg=30, dcg=0, l=39, total=321
      sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
      misc counts      : r=20, pp=1, mci=38
      cell areas       : b=0.000um^2, i=754.808um^2, icg=199.757um^2, dcg=0.000um^2, l=112.840um^2, total=1067.405um^2
      cell capacitance : b=0.000fF, i=1309.824fF, icg=21.184fF, dcg=0.000fF, l=39.750fF, total=1370.758fF
      sink capacitance : total=2688.728fF, avg=0.765fF, sd=0.890fF, min=0.000fF, max=10.000fF
      wire capacitance : top=331.822fF, trunk=939.653fF, leaf=2149.906fF, total=3421.381fF
      wire lengths     : top=3665.489um, trunk=10618.867um, leaf=22329.812um, total=36614.168um
      hp wire lengths  : top=2584.456um, trunk=8830.896um, leaf=16181.108um, total=27596.460um
    Clock DAG net violations after 'Improving subtree skew': none
    Clock DAG primary half-corner transition distribution after 'Improving subtree skew':
      Top   : target=0.243ns count=7 avg=0.107ns sd=0.033ns min=0.087ns max=0.179ns {6 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
      Trunk : target=0.075ns count=1 avg=0.049ns sd=0.000ns min=0.049ns max=0.049ns {0 <= 0.045ns, 1 <= 0.060ns, 0 <= 0.068ns, 0 <= 0.071ns, 0 <= 0.075ns}
      Trunk : target=0.078ns count=1 avg=0.028ns sd=0.000ns min=0.028ns max=0.028ns {1 <= 0.047ns, 0 <= 0.062ns, 0 <= 0.070ns, 0 <= 0.074ns, 0 <= 0.078ns}
      Trunk : target=0.177ns count=3 avg=0.069ns sd=0.017ns min=0.055ns max=0.087ns {3 <= 0.106ns, 0 <= 0.141ns, 0 <= 0.159ns, 0 <= 0.168ns, 0 <= 0.177ns}
      Trunk : target=0.180ns count=2 avg=0.083ns sd=0.012ns min=0.074ns max=0.092ns {2 <= 0.108ns, 0 <= 0.144ns, 0 <= 0.162ns, 0 <= 0.171ns, 0 <= 0.180ns}
      Trunk : target=0.184ns count=9 avg=0.122ns sd=0.016ns min=0.109ns max=0.162ns {3 <= 0.111ns, 5 <= 0.148ns, 1 <= 0.166ns, 0 <= 0.175ns, 0 <= 0.184ns}
      Trunk : target=0.209ns count=1 avg=0.072ns sd=0.000ns min=0.072ns max=0.072ns {1 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
      Trunk : target=0.235ns count=4 avg=0.095ns sd=0.033ns min=0.062ns max=0.127ns {4 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
      Trunk : target=0.241ns count=1 avg=0.096ns sd=0.000ns min=0.096ns max=0.096ns {1 <= 0.144ns, 0 <= 0.192ns, 0 <= 0.217ns, 0 <= 0.229ns, 0 <= 0.241ns}
      Trunk : target=0.243ns count=134 avg=0.072ns sd=0.041ns min=0.000ns max=0.147ns {133 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
      Leaf  : target=0.078ns count=12 avg=0.062ns sd=0.012ns min=0.040ns max=0.076ns {2 <= 0.047ns, 3 <= 0.062ns, 5 <= 0.070ns, 1 <= 0.074ns, 1 <= 0.078ns}
      Leaf  : target=0.110ns count=3 avg=0.081ns sd=0.001ns min=0.080ns max=0.082ns {0 <= 0.066ns, 3 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
      Leaf  : target=0.209ns count=1 avg=0.059ns sd=0.000ns min=0.059ns max=0.059ns {1 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
      Leaf  : target=0.243ns count=178 avg=0.091ns sd=0.054ns min=0.034ns max=0.243ns {163 <= 0.146ns, 0 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 15 <= 0.243ns}
    Clock DAG library cell distribution after 'Improving subtree skew' {count}:
       Invs: INVX16_LVT: 57 INVX8_LVT: 91 INVX4_LVT: 57 INVX2_LVT: 47 
       ICGs: CGLNPRX8_LVT: 9 CGLPPRX8_LVT: 3 CGLNPRX2_LVT: 3 CGLPPRX2_LVT: 15 
     Logics: LSUPX8_LVT: 1 AO21X2_LVT: 4 AO22X2_RVT: 16 AO21X1_LVT: 2 AO22X1_RVT: 16 
    Primary reporting skew groups after 'Improving subtree skew':
      skew_group SDRAM_CLK/func_best_mode: insertion delay [min=0.545, max=1.438, avg=1.379, sd=0.080, skn=-4.189, kur=33.878], skew [0.893 vs 0.085*], 71.9% {1.364, 1.438} (wid=0.115 ws=0.080) (gid=1.360 gs=0.853)
    Skew group summary after 'Improving subtree skew':
      skew_group PCI_CLK/func_best_mode: insertion delay [min=0.135, max=0.719, avg=0.694, sd=0.081, skn=-6.724, kur=44.192], skew [0.584 vs 0.085*], 98% {0.678, 0.719} (wid=0.028 ws=0.026) (gid=0.709 gs=0.576)
      skew_group SDRAM_CLK/func_best_mode: insertion delay [min=0.545, max=1.438, avg=1.379, sd=0.080, skn=-4.189, kur=33.878], skew [0.893 vs 0.085*], 71.9% {1.364, 1.438} (wid=0.115 ws=0.080) (gid=1.360 gs=0.853)
      skew_group SYS_2x_CLK/func_best_mode: insertion delay [min=0.194, max=0.883, avg=0.826, sd=0.133, skn=-4.125, kur=16.643], skew [0.689 vs 0.085*], 91.6% {0.802, 0.883} (wid=0.016 ws=0.015) (gid=0.882 gs=0.693)
      skew_group SYS_2x_CLK/func_worst_mode: insertion delay [min=0.194, max=0.883, avg=0.497, sd=0.265, skn=-0.162, kur=-1.746], skew [0.689 vs 0.085*], 40% {0.194, 0.279} (wid=0.005 ws=0.004) (gid=0.882 gs=0.693)
      skew_group ate_clk/test_best_mode: insertion delay [min=0.616, max=1.047, avg=0.997, sd=0.048, skn=-3.673, kur=19.168], skew [0.430 vs 0.085*], 94.9% {0.962, 1.047} (wid=0.059 ws=0.058) (gid=1.040 gs=0.427)
      skew_group ate_clk/test_worst_mode: insertion delay [min=0.616, max=1.047, avg=0.996, sd=0.049, skn=-3.644, kur=18.628], skew [0.430 vs 0.085*], 94.6% {0.962, 1.047} (wid=0.059 ws=0.056) (gid=1.022 gs=0.408)
    Legalizer API calls during this step: 416 succeeded with high effort: 416 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
  Improving subtree skew done. (took cpu=0:00:02.3 real=0:00:01.1)
  Offloading subtrees by buffering...
    Clock DAG stats after 'Offloading subtrees by buffering':
      cell counts      : b=0, i=262, icg=30, dcg=0, l=39, total=331
      sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
      misc counts      : r=20, pp=1, mci=38
      cell areas       : b=0.000um^2, i=757.349um^2, icg=198.232um^2, dcg=0.000um^2, l=112.586um^2, total=1068.167um^2
      cell capacitance : b=0.000fF, i=1291.585fF, icg=21.180fF, dcg=0.000fF, l=39.769fF, total=1352.533fF
      sink capacitance : total=2688.728fF, avg=0.765fF, sd=0.890fF, min=0.000fF, max=10.000fF
      wire capacitance : top=331.822fF, trunk=967.115fF, leaf=2148.405fF, total=3447.342fF
      wire lengths     : top=3665.489um, trunk=10929.250um, leaf=22313.850um, total=36908.589um
      hp wire lengths  : top=2584.456um, trunk=9144.016um, leaf=16181.108um, total=27909.580um
    Clock DAG net violations after 'Offloading subtrees by buffering': none
    Clock DAG primary half-corner transition distribution after 'Offloading subtrees by buffering':
      Top   : target=0.243ns count=7 avg=0.107ns sd=0.033ns min=0.087ns max=0.179ns {6 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
      Trunk : target=0.075ns count=1 avg=0.049ns sd=0.000ns min=0.049ns max=0.049ns {0 <= 0.045ns, 1 <= 0.060ns, 0 <= 0.068ns, 0 <= 0.071ns, 0 <= 0.075ns}
      Trunk : target=0.078ns count=1 avg=0.028ns sd=0.000ns min=0.028ns max=0.028ns {1 <= 0.047ns, 0 <= 0.062ns, 0 <= 0.070ns, 0 <= 0.074ns, 0 <= 0.078ns}
      Trunk : target=0.177ns count=4 avg=0.078ns sd=0.023ns min=0.055ns max=0.105ns {4 <= 0.106ns, 0 <= 0.141ns, 0 <= 0.159ns, 0 <= 0.168ns, 0 <= 0.177ns}
      Trunk : target=0.180ns count=2 avg=0.083ns sd=0.012ns min=0.074ns max=0.092ns {2 <= 0.108ns, 0 <= 0.144ns, 0 <= 0.162ns, 0 <= 0.171ns, 0 <= 0.180ns}
      Trunk : target=0.184ns count=8 avg=0.122ns sd=0.017ns min=0.110ns max=0.162ns {3 <= 0.111ns, 4 <= 0.148ns, 1 <= 0.166ns, 0 <= 0.175ns, 0 <= 0.184ns}
      Trunk : target=0.209ns count=2 avg=0.067ns sd=0.008ns min=0.062ns max=0.072ns {2 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
      Trunk : target=0.235ns count=3 avg=0.106ns sd=0.030ns min=0.072ns max=0.127ns {3 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
      Trunk : target=0.241ns count=1 avg=0.096ns sd=0.000ns min=0.096ns max=0.096ns {1 <= 0.144ns, 0 <= 0.192ns, 0 <= 0.217ns, 0 <= 0.229ns, 0 <= 0.241ns}
      Trunk : target=0.243ns count=144 avg=0.070ns sd=0.039ns min=0.000ns max=0.147ns {143 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
      Leaf  : target=0.078ns count=12 avg=0.062ns sd=0.012ns min=0.040ns max=0.076ns {2 <= 0.047ns, 3 <= 0.062ns, 5 <= 0.070ns, 1 <= 0.074ns, 1 <= 0.078ns}
      Leaf  : target=0.110ns count=3 avg=0.081ns sd=0.001ns min=0.080ns max=0.082ns {0 <= 0.066ns, 3 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
      Leaf  : target=0.209ns count=1 avg=0.059ns sd=0.000ns min=0.059ns max=0.059ns {1 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
      Leaf  : target=0.243ns count=178 avg=0.093ns sd=0.054ns min=0.034ns max=0.243ns {163 <= 0.146ns, 0 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 15 <= 0.243ns}
    Clock DAG library cell distribution after 'Offloading subtrees by buffering' {count}:
       Invs: INVX16_LVT: 55 INVX8_LVT: 85 INVX4_LVT: 64 INVX2_LVT: 58 
       ICGs: CGLNPRX8_LVT: 8 CGLPPRX8_LVT: 3 CGLNPRX2_LVT: 4 CGLPPRX2_LVT: 15 
     Logics: LSUPX8_LVT: 1 AO21X2_LVT: 3 AO22X2_RVT: 16 AO21X1_LVT: 3 AO22X1_RVT: 16 
    Primary reporting skew groups after 'Offloading subtrees by buffering':
      skew_group SDRAM_CLK/func_best_mode: insertion delay [min=0.545, max=1.436, avg=1.372, sd=0.085, skn=-3.261, kur=24.182], skew [0.891 vs 0.085*], 71.9% {1.357, 1.436} (wid=0.115 ws=0.080) (gid=1.360 gs=0.853)
    Skew group summary after 'Offloading subtrees by buffering':
      skew_group PCI_CLK/func_best_mode: insertion delay [min=0.135, max=0.719, avg=0.694, sd=0.081, skn=-6.724, kur=44.192], skew [0.584 vs 0.085*], 98% {0.678, 0.719} (wid=0.028 ws=0.026) (gid=0.709 gs=0.576)
      skew_group SDRAM_CLK/func_best_mode: insertion delay [min=0.545, max=1.436, avg=1.372, sd=0.085, skn=-3.261, kur=24.182], skew [0.891 vs 0.085*], 71.9% {1.357, 1.436} (wid=0.115 ws=0.080) (gid=1.360 gs=0.853)
      skew_group SYS_2x_CLK/func_best_mode: insertion delay [min=0.247, max=0.883, avg=0.828, sd=0.124, skn=-4.021, kur=15.861], skew [0.636 vs 0.085*], 91.6% {0.802, 0.883} (wid=0.016 ws=0.015) (gid=0.882 gs=0.640)
      skew_group SYS_2x_CLK/func_worst_mode: insertion delay [min=0.247, max=0.883, avg=0.519, sd=0.240, skn=-0.099, kur=-1.670], skew [0.636 vs 0.085*], 40% {0.247, 0.332} (wid=0.005 ws=0.004) (gid=0.882 gs=0.640)
      skew_group ate_clk/test_best_mode: insertion delay [min=0.559, max=1.046, avg=0.983, sd=0.049, skn=-2.065, kur=11.279], skew [0.488 vs 0.085*], 72.7% {0.938, 1.023} (wid=0.059 ws=0.058) (gid=1.021 gs=0.465)
      skew_group ate_clk/test_worst_mode: insertion delay [min=0.559, max=1.046, avg=0.984, sd=0.050, skn=-2.102, kur=11.075], skew [0.488 vs 0.085*], 71.5% {0.938, 1.023} (wid=0.059 ws=0.056) (gid=1.021 gs=0.465)
    Legalizer API calls during this step: 737 succeeded with high effort: 737 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
  Offloading subtrees by buffering done. (took cpu=0:00:02.6 real=0:00:01.4)
  AdjustingMinPinPIDs for balancing...
    Approximately balancing fragments step...
      Resolve constraints - Approximately balancing fragments...
      Resolving skew group constraints...
        Solving LP: 6 skew groups; 158 fragments, 184 fraglets and 150 vertices; 193 variables and 515 constraints; tolerance 1
**WARN: (IMPCCOPT-1059):	Slackened off max insertion delay target for skew_group SDRAM_CLK/func_best_mode from 0.843ns to 1.436ns.
Type 'man IMPCCOPT-1059' for more detail.
**WARN: (IMPCCOPT-1059):	Slackened off max insertion delay target for skew_group SYS_2x_CLK/func_best_mode from 0.843ns to 0.882ns.
Type 'man IMPCCOPT-1059' for more detail.
**WARN: (IMPCCOPT-1059):	Slackened off max insertion delay target for skew_group SYS_2x_CLK/func_worst_mode from 0.843ns to 0.882ns.
Type 'man IMPCCOPT-1059' for more detail.
**WARN: (IMPCCOPT-1059):	Slackened off max insertion delay target for skew_group ate_clk/test_best_mode from 0.843ns to 1.046ns.
Type 'man IMPCCOPT-1059' for more detail.
**WARN: (IMPCCOPT-1059):	Slackened off max insertion delay target for skew_group ate_clk/test_worst_mode from 0.843ns to 1.046ns.
Type 'man IMPCCOPT-1059' for more detail.
        
        Slackened skew group targets:
        
        --------------------------------------------------------------------------
        Skew group                    Desired    Slackened    Desired    Slackened
                                      Target     Target       Target     Target
                                      Max ID     Max ID       Skew       Skew
        --------------------------------------------------------------------------
        SDRAM_CLK/func_best_mode       0.843       1.436         -           -
        SYS_2x_CLK/func_best_mode      0.843       0.882         -           -
        SYS_2x_CLK/func_worst_mode     0.843       0.882         -           -
        ate_clk/test_best_mode         0.843       1.046         -           -
        ate_clk/test_worst_mode        0.843       1.046         -           -
        --------------------------------------------------------------------------
        
        
      Resolving skew group constraints done.
      Resolve constraints - Approximately balancing fragments done. (took cpu=0:00:00.8 real=0:00:00.7)
      Estimate delay to be added in balancing - Approximately balancing fragments...
      Trial balancer estimated the amount of delay to be added in balancing: 3.155ns
      Estimate delay to be added in balancing - Approximately balancing fragments done. (took cpu=0:00:00.4 real=0:00:00.4)
      Approximately balancing fragments...
        Moving gates to improve sub-tree skew...
          Tried: 368 Succeeded: 0
          Topology Tried: 0 Succeeded: 0
          0 Succeeded with SS ratio
          0 Succeeded with Lollipop: 0 with tier one, 0 with tier two. 
          Total reducing skew: 0 Average reducing skew for 0 nets : 0
          Clock DAG stats after 'Moving gates to improve sub-tree skew':
            cell counts      : b=0, i=262, icg=30, dcg=0, l=39, total=331
            sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
            misc counts      : r=20, pp=1, mci=38
            cell areas       : b=0.000um^2, i=757.349um^2, icg=198.232um^2, dcg=0.000um^2, l=112.586um^2, total=1068.167um^2
            cell capacitance : b=0.000fF, i=1291.585fF, icg=21.180fF, dcg=0.000fF, l=39.769fF, total=1352.533fF
            sink capacitance : total=2688.728fF, avg=0.765fF, sd=0.890fF, min=0.000fF, max=10.000fF
            wire capacitance : top=331.822fF, trunk=967.115fF, leaf=2148.405fF, total=3447.342fF
            wire lengths     : top=3665.489um, trunk=10929.250um, leaf=22313.850um, total=36908.589um
            hp wire lengths  : top=2584.456um, trunk=9144.016um, leaf=16181.108um, total=27909.580um
          Clock DAG net violations after 'Moving gates to improve sub-tree skew': none
          Clock DAG primary half-corner transition distribution after 'Moving gates to improve sub-tree skew':
            Top   : target=0.243ns count=7 avg=0.107ns sd=0.033ns min=0.087ns max=0.179ns {6 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
            Trunk : target=0.075ns count=1 avg=0.049ns sd=0.000ns min=0.049ns max=0.049ns {0 <= 0.045ns, 1 <= 0.060ns, 0 <= 0.068ns, 0 <= 0.071ns, 0 <= 0.075ns}
            Trunk : target=0.078ns count=1 avg=0.028ns sd=0.000ns min=0.028ns max=0.028ns {1 <= 0.047ns, 0 <= 0.062ns, 0 <= 0.070ns, 0 <= 0.074ns, 0 <= 0.078ns}
            Trunk : target=0.177ns count=4 avg=0.078ns sd=0.023ns min=0.055ns max=0.105ns {4 <= 0.106ns, 0 <= 0.141ns, 0 <= 0.159ns, 0 <= 0.168ns, 0 <= 0.177ns}
            Trunk : target=0.180ns count=2 avg=0.083ns sd=0.012ns min=0.074ns max=0.092ns {2 <= 0.108ns, 0 <= 0.144ns, 0 <= 0.162ns, 0 <= 0.171ns, 0 <= 0.180ns}
            Trunk : target=0.184ns count=8 avg=0.122ns sd=0.017ns min=0.110ns max=0.162ns {3 <= 0.111ns, 4 <= 0.148ns, 1 <= 0.166ns, 0 <= 0.175ns, 0 <= 0.184ns}
            Trunk : target=0.209ns count=2 avg=0.067ns sd=0.008ns min=0.062ns max=0.072ns {2 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
            Trunk : target=0.235ns count=3 avg=0.106ns sd=0.030ns min=0.072ns max=0.127ns {3 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
            Trunk : target=0.241ns count=1 avg=0.096ns sd=0.000ns min=0.096ns max=0.096ns {1 <= 0.144ns, 0 <= 0.192ns, 0 <= 0.217ns, 0 <= 0.229ns, 0 <= 0.241ns}
            Trunk : target=0.243ns count=144 avg=0.070ns sd=0.039ns min=0.000ns max=0.147ns {143 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
            Leaf  : target=0.078ns count=12 avg=0.062ns sd=0.012ns min=0.040ns max=0.076ns {2 <= 0.047ns, 3 <= 0.062ns, 5 <= 0.070ns, 1 <= 0.074ns, 1 <= 0.078ns}
            Leaf  : target=0.110ns count=3 avg=0.081ns sd=0.001ns min=0.080ns max=0.082ns {0 <= 0.066ns, 3 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
            Leaf  : target=0.209ns count=1 avg=0.059ns sd=0.000ns min=0.059ns max=0.059ns {1 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
            Leaf  : target=0.243ns count=178 avg=0.093ns sd=0.054ns min=0.034ns max=0.243ns {163 <= 0.146ns, 0 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 15 <= 0.243ns}
          Clock DAG library cell distribution after 'Moving gates to improve sub-tree skew' {count}:
             Invs: INVX16_LVT: 55 INVX8_LVT: 85 INVX4_LVT: 64 INVX2_LVT: 58 
             ICGs: CGLNPRX8_LVT: 8 CGLPPRX8_LVT: 3 CGLNPRX2_LVT: 4 CGLPPRX2_LVT: 15 
           Logics: LSUPX8_LVT: 1 AO21X2_LVT: 3 AO22X2_RVT: 16 AO21X1_LVT: 3 AO22X1_RVT: 16 
          Legalizer API calls during this step: 0 succeeded with high effort: 0 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
        Moving gates to improve sub-tree skew done. (took cpu=0:00:00.1 real=0:00:00.1)
        Approximately balancing fragments bottom up...
          Clock DAG stats after 'Approximately balancing fragments bottom up':
            cell counts      : b=0, i=262, icg=30, dcg=0, l=39, total=331
            sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
            misc counts      : r=20, pp=1, mci=38
            cell areas       : b=0.000um^2, i=757.349um^2, icg=198.232um^2, dcg=0.000um^2, l=112.586um^2, total=1068.167um^2
            cell capacitance : b=0.000fF, i=1291.585fF, icg=21.180fF, dcg=0.000fF, l=39.769fF, total=1352.533fF
            sink capacitance : total=2688.728fF, avg=0.765fF, sd=0.890fF, min=0.000fF, max=10.000fF
            wire capacitance : top=331.822fF, trunk=967.115fF, leaf=2148.405fF, total=3447.342fF
            wire lengths     : top=3665.489um, trunk=10929.250um, leaf=22313.850um, total=36908.589um
            hp wire lengths  : top=2584.456um, trunk=9144.016um, leaf=16181.108um, total=27909.580um
          Clock DAG net violations after 'Approximately balancing fragments bottom up': none
          Clock DAG primary half-corner transition distribution after 'Approximately balancing fragments bottom up':
            Top   : target=0.243ns count=7 avg=0.107ns sd=0.033ns min=0.087ns max=0.179ns {6 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
            Trunk : target=0.075ns count=1 avg=0.049ns sd=0.000ns min=0.049ns max=0.049ns {0 <= 0.045ns, 1 <= 0.060ns, 0 <= 0.068ns, 0 <= 0.071ns, 0 <= 0.075ns}
            Trunk : target=0.078ns count=1 avg=0.028ns sd=0.000ns min=0.028ns max=0.028ns {1 <= 0.047ns, 0 <= 0.062ns, 0 <= 0.070ns, 0 <= 0.074ns, 0 <= 0.078ns}
            Trunk : target=0.177ns count=4 avg=0.078ns sd=0.023ns min=0.055ns max=0.105ns {4 <= 0.106ns, 0 <= 0.141ns, 0 <= 0.159ns, 0 <= 0.168ns, 0 <= 0.177ns}
            Trunk : target=0.180ns count=2 avg=0.083ns sd=0.012ns min=0.074ns max=0.092ns {2 <= 0.108ns, 0 <= 0.144ns, 0 <= 0.162ns, 0 <= 0.171ns, 0 <= 0.180ns}
            Trunk : target=0.184ns count=8 avg=0.122ns sd=0.017ns min=0.110ns max=0.162ns {3 <= 0.111ns, 4 <= 0.148ns, 1 <= 0.166ns, 0 <= 0.175ns, 0 <= 0.184ns}
            Trunk : target=0.209ns count=2 avg=0.067ns sd=0.008ns min=0.062ns max=0.072ns {2 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
            Trunk : target=0.235ns count=3 avg=0.106ns sd=0.030ns min=0.072ns max=0.127ns {3 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
            Trunk : target=0.241ns count=1 avg=0.096ns sd=0.000ns min=0.096ns max=0.096ns {1 <= 0.144ns, 0 <= 0.192ns, 0 <= 0.217ns, 0 <= 0.229ns, 0 <= 0.241ns}
            Trunk : target=0.243ns count=144 avg=0.070ns sd=0.039ns min=0.000ns max=0.147ns {143 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
            Leaf  : target=0.078ns count=12 avg=0.062ns sd=0.012ns min=0.040ns max=0.076ns {2 <= 0.047ns, 3 <= 0.062ns, 5 <= 0.070ns, 1 <= 0.074ns, 1 <= 0.078ns}
            Leaf  : target=0.110ns count=3 avg=0.081ns sd=0.001ns min=0.080ns max=0.082ns {0 <= 0.066ns, 3 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
            Leaf  : target=0.209ns count=1 avg=0.059ns sd=0.000ns min=0.059ns max=0.059ns {1 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
            Leaf  : target=0.243ns count=178 avg=0.093ns sd=0.054ns min=0.034ns max=0.243ns {163 <= 0.146ns, 0 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 15 <= 0.243ns}
          Clock DAG library cell distribution after 'Approximately balancing fragments bottom up' {count}:
             Invs: INVX16_LVT: 55 INVX8_LVT: 85 INVX4_LVT: 64 INVX2_LVT: 58 
             ICGs: CGLNPRX8_LVT: 8 CGLPPRX8_LVT: 3 CGLNPRX2_LVT: 4 CGLPPRX2_LVT: 15 
           Logics: LSUPX8_LVT: 1 AO21X2_LVT: 3 AO22X2_RVT: 16 AO21X1_LVT: 3 AO22X1_RVT: 16 
          Legalizer API calls during this step: 0 succeeded with high effort: 0 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
        Approximately balancing fragments bottom up done. (took cpu=0:00:00.1 real=0:00:00.1)
        Approximately balancing fragments, wire and cell delays...
        Approximately balancing fragments, wire and cell delays, iteration 1...
          Clock DAG stats after Approximately balancing fragments, wire and cell delays, iteration 1:
            cell counts      : b=0, i=312, icg=30, dcg=0, l=39, total=381
            sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
            misc counts      : r=20, pp=1, mci=38
            cell areas       : b=0.000um^2, i=839.692um^2, icg=198.232um^2, dcg=0.000um^2, l=112.586um^2, total=1150.510um^2
            cell capacitance : b=0.000fF, i=1378.802fF, icg=21.180fF, dcg=0.000fF, l=39.769fF, total=1439.750fF
            sink capacitance : total=2688.728fF, avg=0.765fF, sd=0.890fF, min=0.000fF, max=10.000fF
            wire capacitance : top=331.822fF, trunk=1280.649fF, leaf=2172.553fF, total=3785.025fF
            wire lengths     : top=3665.489um, trunk=14474.346um, leaf=22583.042um, total=40722.877um
            hp wire lengths  : top=2584.456um, trunk=12869.080um, leaf=16442.396um, total=31895.932um
          Clock DAG net violations after Approximately balancing fragments, wire and cell delays, iteration 1: none
          Clock DAG primary half-corner transition distribution after Approximately balancing fragments, wire and cell delays, iteration 1:
            Top   : target=0.243ns count=7 avg=0.107ns sd=0.033ns min=0.087ns max=0.179ns {6 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
            Trunk : target=0.075ns count=1 avg=0.049ns sd=0.000ns min=0.049ns max=0.049ns {0 <= 0.045ns, 1 <= 0.060ns, 0 <= 0.068ns, 0 <= 0.071ns, 0 <= 0.075ns}
            Trunk : target=0.078ns count=1 avg=0.028ns sd=0.000ns min=0.028ns max=0.028ns {1 <= 0.047ns, 0 <= 0.062ns, 0 <= 0.070ns, 0 <= 0.074ns, 0 <= 0.078ns}
            Trunk : target=0.177ns count=4 avg=0.078ns sd=0.023ns min=0.055ns max=0.106ns {4 <= 0.106ns, 0 <= 0.141ns, 0 <= 0.159ns, 0 <= 0.168ns, 0 <= 0.177ns}
            Trunk : target=0.180ns count=2 avg=0.083ns sd=0.012ns min=0.074ns max=0.092ns {2 <= 0.108ns, 0 <= 0.144ns, 0 <= 0.162ns, 0 <= 0.171ns, 0 <= 0.180ns}
            Trunk : target=0.184ns count=8 avg=0.123ns sd=0.017ns min=0.110ns max=0.162ns {2 <= 0.111ns, 5 <= 0.148ns, 1 <= 0.166ns, 0 <= 0.175ns, 0 <= 0.184ns}
            Trunk : target=0.209ns count=2 avg=0.064ns sd=0.011ns min=0.056ns max=0.072ns {2 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
            Trunk : target=0.235ns count=3 avg=0.106ns sd=0.030ns min=0.072ns max=0.127ns {3 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
            Trunk : target=0.241ns count=1 avg=0.096ns sd=0.000ns min=0.096ns max=0.096ns {1 <= 0.144ns, 0 <= 0.192ns, 0 <= 0.217ns, 0 <= 0.229ns, 0 <= 0.241ns}
            Trunk : target=0.243ns count=194 avg=0.071ns sd=0.036ns min=0.000ns max=0.147ns {193 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
            Leaf  : target=0.078ns count=12 avg=0.062ns sd=0.012ns min=0.040ns max=0.076ns {2 <= 0.047ns, 3 <= 0.062ns, 5 <= 0.070ns, 1 <= 0.074ns, 1 <= 0.078ns}
            Leaf  : target=0.110ns count=3 avg=0.081ns sd=0.001ns min=0.080ns max=0.082ns {0 <= 0.066ns, 3 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
            Leaf  : target=0.209ns count=1 avg=0.059ns sd=0.000ns min=0.059ns max=0.059ns {1 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
            Leaf  : target=0.243ns count=178 avg=0.093ns sd=0.054ns min=0.035ns max=0.243ns {163 <= 0.146ns, 0 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 15 <= 0.243ns}
          Clock DAG library cell distribution after Approximately balancing fragments, wire and cell delays, iteration 1 {count}:
             Invs: INVX16_LVT: 55 INVX8_LVT: 87 INVX4_LVT: 70 INVX2_LVT: 100 
             ICGs: CGLNPRX8_LVT: 8 CGLPPRX8_LVT: 3 CGLNPRX2_LVT: 4 CGLPPRX2_LVT: 15 
           Logics: LSUPX8_LVT: 1 AO21X2_LVT: 3 AO22X2_RVT: 16 AO21X1_LVT: 3 AO22X1_RVT: 16 
        Approximately balancing fragments, wire and cell delays, iteration 1 done.
        Approximately balancing fragments, wire and cell delays, iteration 2...
          Clock DAG stats after Approximately balancing fragments, wire and cell delays, iteration 2:
            cell counts      : b=0, i=312, icg=30, dcg=0, l=39, total=381
            sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
            misc counts      : r=20, pp=1, mci=38
            cell areas       : b=0.000um^2, i=839.692um^2, icg=198.232um^2, dcg=0.000um^2, l=112.586um^2, total=1150.510um^2
            cell capacitance : b=0.000fF, i=1378.802fF, icg=21.180fF, dcg=0.000fF, l=39.769fF, total=1439.750fF
            sink capacitance : total=2688.728fF, avg=0.765fF, sd=0.890fF, min=0.000fF, max=10.000fF
            wire capacitance : top=331.822fF, trunk=1280.649fF, leaf=2172.553fF, total=3785.025fF
            wire lengths     : top=3665.489um, trunk=14474.346um, leaf=22583.042um, total=40722.877um
            hp wire lengths  : top=2584.456um, trunk=12869.080um, leaf=16442.396um, total=31895.932um
          Clock DAG net violations after Approximately balancing fragments, wire and cell delays, iteration 2: none
          Clock DAG primary half-corner transition distribution after Approximately balancing fragments, wire and cell delays, iteration 2:
            Top   : target=0.243ns count=7 avg=0.107ns sd=0.033ns min=0.087ns max=0.179ns {6 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
            Trunk : target=0.075ns count=1 avg=0.049ns sd=0.000ns min=0.049ns max=0.049ns {0 <= 0.045ns, 1 <= 0.060ns, 0 <= 0.068ns, 0 <= 0.071ns, 0 <= 0.075ns}
            Trunk : target=0.078ns count=1 avg=0.028ns sd=0.000ns min=0.028ns max=0.028ns {1 <= 0.047ns, 0 <= 0.062ns, 0 <= 0.070ns, 0 <= 0.074ns, 0 <= 0.078ns}
            Trunk : target=0.177ns count=4 avg=0.078ns sd=0.023ns min=0.055ns max=0.106ns {4 <= 0.106ns, 0 <= 0.141ns, 0 <= 0.159ns, 0 <= 0.168ns, 0 <= 0.177ns}
            Trunk : target=0.180ns count=2 avg=0.083ns sd=0.012ns min=0.074ns max=0.092ns {2 <= 0.108ns, 0 <= 0.144ns, 0 <= 0.162ns, 0 <= 0.171ns, 0 <= 0.180ns}
            Trunk : target=0.184ns count=8 avg=0.123ns sd=0.017ns min=0.110ns max=0.162ns {2 <= 0.111ns, 5 <= 0.148ns, 1 <= 0.166ns, 0 <= 0.175ns, 0 <= 0.184ns}
            Trunk : target=0.209ns count=2 avg=0.064ns sd=0.011ns min=0.056ns max=0.072ns {2 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
            Trunk : target=0.235ns count=3 avg=0.106ns sd=0.030ns min=0.072ns max=0.127ns {3 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
            Trunk : target=0.241ns count=1 avg=0.096ns sd=0.000ns min=0.096ns max=0.096ns {1 <= 0.144ns, 0 <= 0.192ns, 0 <= 0.217ns, 0 <= 0.229ns, 0 <= 0.241ns}
            Trunk : target=0.243ns count=194 avg=0.071ns sd=0.036ns min=0.000ns max=0.147ns {193 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
            Leaf  : target=0.078ns count=12 avg=0.062ns sd=0.012ns min=0.040ns max=0.076ns {2 <= 0.047ns, 3 <= 0.062ns, 5 <= 0.070ns, 1 <= 0.074ns, 1 <= 0.078ns}
            Leaf  : target=0.110ns count=3 avg=0.081ns sd=0.001ns min=0.080ns max=0.082ns {0 <= 0.066ns, 3 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
            Leaf  : target=0.209ns count=1 avg=0.059ns sd=0.000ns min=0.059ns max=0.059ns {1 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
            Leaf  : target=0.243ns count=178 avg=0.093ns sd=0.054ns min=0.035ns max=0.243ns {163 <= 0.146ns, 0 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 15 <= 0.243ns}
          Clock DAG library cell distribution after Approximately balancing fragments, wire and cell delays, iteration 2 {count}:
             Invs: INVX16_LVT: 55 INVX8_LVT: 87 INVX4_LVT: 70 INVX2_LVT: 100 
             ICGs: CGLNPRX8_LVT: 8 CGLPPRX8_LVT: 3 CGLNPRX2_LVT: 4 CGLPPRX2_LVT: 15 
           Logics: LSUPX8_LVT: 1 AO21X2_LVT: 3 AO22X2_RVT: 16 AO21X1_LVT: 3 AO22X1_RVT: 16 
        Approximately balancing fragments, wire and cell delays, iteration 2 done.
        Approximately balancing fragments, wire and cell delays done. (took cpu=0:00:04.0 real=0:00:04.0)
      Approximately balancing fragments done.
      Clock DAG stats after 'Approximately balancing fragments step':
        cell counts      : b=0, i=312, icg=30, dcg=0, l=39, total=381
        sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
        misc counts      : r=20, pp=1, mci=38
        cell areas       : b=0.000um^2, i=839.692um^2, icg=198.232um^2, dcg=0.000um^2, l=112.586um^2, total=1150.510um^2
        cell capacitance : b=0.000fF, i=1378.802fF, icg=21.180fF, dcg=0.000fF, l=39.769fF, total=1439.750fF
        sink capacitance : total=2688.728fF, avg=0.765fF, sd=0.890fF, min=0.000fF, max=10.000fF
        wire capacitance : top=331.822fF, trunk=1280.649fF, leaf=2172.553fF, total=3785.025fF
        wire lengths     : top=3665.489um, trunk=14474.346um, leaf=22583.042um, total=40722.877um
        hp wire lengths  : top=2584.456um, trunk=12869.080um, leaf=16442.396um, total=31895.932um
      Clock DAG net violations after 'Approximately balancing fragments step': none
      Clock DAG primary half-corner transition distribution after 'Approximately balancing fragments step':
        Top   : target=0.243ns count=7 avg=0.107ns sd=0.033ns min=0.087ns max=0.179ns {6 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
        Trunk : target=0.075ns count=1 avg=0.049ns sd=0.000ns min=0.049ns max=0.049ns {0 <= 0.045ns, 1 <= 0.060ns, 0 <= 0.068ns, 0 <= 0.071ns, 0 <= 0.075ns}
        Trunk : target=0.078ns count=1 avg=0.028ns sd=0.000ns min=0.028ns max=0.028ns {1 <= 0.047ns, 0 <= 0.062ns, 0 <= 0.070ns, 0 <= 0.074ns, 0 <= 0.078ns}
        Trunk : target=0.177ns count=4 avg=0.078ns sd=0.023ns min=0.055ns max=0.106ns {4 <= 0.106ns, 0 <= 0.141ns, 0 <= 0.159ns, 0 <= 0.168ns, 0 <= 0.177ns}
        Trunk : target=0.180ns count=2 avg=0.083ns sd=0.012ns min=0.074ns max=0.092ns {2 <= 0.108ns, 0 <= 0.144ns, 0 <= 0.162ns, 0 <= 0.171ns, 0 <= 0.180ns}
        Trunk : target=0.184ns count=8 avg=0.123ns sd=0.017ns min=0.110ns max=0.162ns {2 <= 0.111ns, 5 <= 0.148ns, 1 <= 0.166ns, 0 <= 0.175ns, 0 <= 0.184ns}
        Trunk : target=0.209ns count=2 avg=0.064ns sd=0.011ns min=0.056ns max=0.072ns {2 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
        Trunk : target=0.235ns count=3 avg=0.106ns sd=0.030ns min=0.072ns max=0.127ns {3 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
        Trunk : target=0.241ns count=1 avg=0.096ns sd=0.000ns min=0.096ns max=0.096ns {1 <= 0.144ns, 0 <= 0.192ns, 0 <= 0.217ns, 0 <= 0.229ns, 0 <= 0.241ns}
        Trunk : target=0.243ns count=194 avg=0.071ns sd=0.036ns min=0.000ns max=0.147ns {193 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
        Leaf  : target=0.078ns count=12 avg=0.062ns sd=0.012ns min=0.040ns max=0.076ns {2 <= 0.047ns, 3 <= 0.062ns, 5 <= 0.070ns, 1 <= 0.074ns, 1 <= 0.078ns}
        Leaf  : target=0.110ns count=3 avg=0.081ns sd=0.001ns min=0.080ns max=0.082ns {0 <= 0.066ns, 3 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
        Leaf  : target=0.209ns count=1 avg=0.059ns sd=0.000ns min=0.059ns max=0.059ns {1 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
        Leaf  : target=0.243ns count=178 avg=0.093ns sd=0.054ns min=0.035ns max=0.243ns {163 <= 0.146ns, 0 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 15 <= 0.243ns}
      Clock DAG library cell distribution after 'Approximately balancing fragments step' {count}:
         Invs: INVX16_LVT: 55 INVX8_LVT: 87 INVX4_LVT: 70 INVX2_LVT: 100 
         ICGs: CGLNPRX8_LVT: 8 CGLPPRX8_LVT: 3 CGLNPRX2_LVT: 4 CGLPPRX2_LVT: 15 
       Logics: LSUPX8_LVT: 1 AO21X2_LVT: 3 AO22X2_RVT: 16 AO21X1_LVT: 3 AO22X1_RVT: 16 
      Legalizer API calls during this step: 1994 succeeded with high effort: 1994 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
    Approximately balancing fragments step done. (took cpu=0:00:05.5 real=0:00:05.4)
    Clock DAG stats after Approximately balancing fragments:
      cell counts      : b=0, i=312, icg=30, dcg=0, l=39, total=381
      sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
      misc counts      : r=20, pp=1, mci=38
      cell areas       : b=0.000um^2, i=839.692um^2, icg=198.232um^2, dcg=0.000um^2, l=112.586um^2, total=1150.510um^2
      cell capacitance : b=0.000fF, i=1378.802fF, icg=21.180fF, dcg=0.000fF, l=39.769fF, total=1439.750fF
      sink capacitance : total=2688.728fF, avg=0.765fF, sd=0.890fF, min=0.000fF, max=10.000fF
      wire capacitance : top=331.822fF, trunk=1280.649fF, leaf=2172.553fF, total=3785.025fF
      wire lengths     : top=3665.489um, trunk=14474.346um, leaf=22583.042um, total=40722.877um
      hp wire lengths  : top=2584.456um, trunk=12869.080um, leaf=16442.396um, total=31895.932um
    Clock DAG net violations after Approximately balancing fragments: none
    Clock DAG primary half-corner transition distribution after Approximately balancing fragments:
      Top   : target=0.243ns count=7 avg=0.107ns sd=0.033ns min=0.087ns max=0.179ns {6 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
      Trunk : target=0.075ns count=1 avg=0.049ns sd=0.000ns min=0.049ns max=0.049ns {0 <= 0.045ns, 1 <= 0.060ns, 0 <= 0.068ns, 0 <= 0.071ns, 0 <= 0.075ns}
      Trunk : target=0.078ns count=1 avg=0.028ns sd=0.000ns min=0.028ns max=0.028ns {1 <= 0.047ns, 0 <= 0.062ns, 0 <= 0.070ns, 0 <= 0.074ns, 0 <= 0.078ns}
      Trunk : target=0.177ns count=4 avg=0.078ns sd=0.023ns min=0.055ns max=0.106ns {4 <= 0.106ns, 0 <= 0.141ns, 0 <= 0.159ns, 0 <= 0.168ns, 0 <= 0.177ns}
      Trunk : target=0.180ns count=2 avg=0.083ns sd=0.012ns min=0.074ns max=0.092ns {2 <= 0.108ns, 0 <= 0.144ns, 0 <= 0.162ns, 0 <= 0.171ns, 0 <= 0.180ns}
      Trunk : target=0.184ns count=8 avg=0.123ns sd=0.017ns min=0.110ns max=0.162ns {2 <= 0.111ns, 5 <= 0.148ns, 1 <= 0.166ns, 0 <= 0.175ns, 0 <= 0.184ns}
      Trunk : target=0.209ns count=2 avg=0.064ns sd=0.011ns min=0.056ns max=0.072ns {2 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
      Trunk : target=0.235ns count=3 avg=0.106ns sd=0.030ns min=0.072ns max=0.127ns {3 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
      Trunk : target=0.241ns count=1 avg=0.096ns sd=0.000ns min=0.096ns max=0.096ns {1 <= 0.144ns, 0 <= 0.192ns, 0 <= 0.217ns, 0 <= 0.229ns, 0 <= 0.241ns}
      Trunk : target=0.243ns count=194 avg=0.071ns sd=0.036ns min=0.000ns max=0.147ns {193 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
      Leaf  : target=0.078ns count=12 avg=0.062ns sd=0.012ns min=0.040ns max=0.076ns {2 <= 0.047ns, 3 <= 0.062ns, 5 <= 0.070ns, 1 <= 0.074ns, 1 <= 0.078ns}
      Leaf  : target=0.110ns count=3 avg=0.081ns sd=0.001ns min=0.080ns max=0.082ns {0 <= 0.066ns, 3 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
      Leaf  : target=0.209ns count=1 avg=0.059ns sd=0.000ns min=0.059ns max=0.059ns {1 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
      Leaf  : target=0.243ns count=178 avg=0.093ns sd=0.054ns min=0.035ns max=0.243ns {163 <= 0.146ns, 0 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 15 <= 0.243ns}
    Clock DAG library cell distribution after Approximately balancing fragments {count}:
       Invs: INVX16_LVT: 55 INVX8_LVT: 87 INVX4_LVT: 70 INVX2_LVT: 100 
       ICGs: CGLNPRX8_LVT: 8 CGLPPRX8_LVT: 3 CGLNPRX2_LVT: 4 CGLPPRX2_LVT: 15 
     Logics: LSUPX8_LVT: 1 AO21X2_LVT: 3 AO22X2_RVT: 16 AO21X1_LVT: 3 AO22X1_RVT: 16 
    Primary reporting skew groups after Approximately balancing fragments:
      skew_group SDRAM_CLK/func_best_mode: insertion delay [min=1.352, max=1.437], skew [0.085 vs 0.085]
    Skew group summary after Approximately balancing fragments:
      skew_group PCI_CLK/func_best_mode: insertion delay [min=0.758, max=0.799], skew [0.041 vs 0.085]
      skew_group SDRAM_CLK/func_best_mode: insertion delay [min=1.352, max=1.437], skew [0.085 vs 0.085]
      skew_group SYS_2x_CLK/func_best_mode: insertion delay [min=0.797, max=0.883], skew [0.086 vs 0.086*]
      skew_group SYS_2x_CLK/func_worst_mode: insertion delay [min=0.797, max=0.883], skew [0.086 vs 0.086*]
      skew_group ate_clk/test_best_mode: insertion delay [min=0.962, max=1.046], skew [0.084 vs 0.085]
      skew_group ate_clk/test_worst_mode: insertion delay [min=0.962, max=1.046], skew [0.084 vs 0.085]
    Improving fragments clock skew...
      Iteration 1...
      Iteration 1 done.
      Clock DAG stats after 'Improving fragments clock skew':
        cell counts      : b=0, i=312, icg=30, dcg=0, l=39, total=381
        sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
        misc counts      : r=20, pp=1, mci=38
        cell areas       : b=0.000um^2, i=839.692um^2, icg=198.232um^2, dcg=0.000um^2, l=112.586um^2, total=1150.510um^2
        cell capacitance : b=0.000fF, i=1378.802fF, icg=21.180fF, dcg=0.000fF, l=39.769fF, total=1439.750fF
        sink capacitance : total=2688.728fF, avg=0.765fF, sd=0.890fF, min=0.000fF, max=10.000fF
        wire capacitance : top=331.822fF, trunk=1280.649fF, leaf=2172.553fF, total=3785.025fF
        wire lengths     : top=3665.489um, trunk=14474.346um, leaf=22583.042um, total=40722.877um
        hp wire lengths  : top=2584.456um, trunk=12869.080um, leaf=16442.396um, total=31895.932um
      Clock DAG net violations after 'Improving fragments clock skew': none
      Clock DAG primary half-corner transition distribution after 'Improving fragments clock skew':
        Top   : target=0.243ns count=7 avg=0.107ns sd=0.033ns min=0.087ns max=0.179ns {6 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
        Trunk : target=0.075ns count=1 avg=0.049ns sd=0.000ns min=0.049ns max=0.049ns {0 <= 0.045ns, 1 <= 0.060ns, 0 <= 0.068ns, 0 <= 0.071ns, 0 <= 0.075ns}
        Trunk : target=0.078ns count=1 avg=0.028ns sd=0.000ns min=0.028ns max=0.028ns {1 <= 0.047ns, 0 <= 0.062ns, 0 <= 0.070ns, 0 <= 0.074ns, 0 <= 0.078ns}
        Trunk : target=0.177ns count=4 avg=0.078ns sd=0.023ns min=0.055ns max=0.106ns {4 <= 0.106ns, 0 <= 0.141ns, 0 <= 0.159ns, 0 <= 0.168ns, 0 <= 0.177ns}
        Trunk : target=0.180ns count=2 avg=0.083ns sd=0.012ns min=0.074ns max=0.092ns {2 <= 0.108ns, 0 <= 0.144ns, 0 <= 0.162ns, 0 <= 0.171ns, 0 <= 0.180ns}
        Trunk : target=0.184ns count=8 avg=0.123ns sd=0.017ns min=0.110ns max=0.162ns {2 <= 0.111ns, 5 <= 0.148ns, 1 <= 0.166ns, 0 <= 0.175ns, 0 <= 0.184ns}
        Trunk : target=0.209ns count=2 avg=0.064ns sd=0.011ns min=0.056ns max=0.072ns {2 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
        Trunk : target=0.235ns count=3 avg=0.106ns sd=0.030ns min=0.072ns max=0.127ns {3 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
        Trunk : target=0.241ns count=1 avg=0.096ns sd=0.000ns min=0.096ns max=0.096ns {1 <= 0.144ns, 0 <= 0.192ns, 0 <= 0.217ns, 0 <= 0.229ns, 0 <= 0.241ns}
        Trunk : target=0.243ns count=194 avg=0.071ns sd=0.036ns min=0.000ns max=0.147ns {193 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
        Leaf  : target=0.078ns count=12 avg=0.062ns sd=0.012ns min=0.040ns max=0.076ns {2 <= 0.047ns, 3 <= 0.062ns, 5 <= 0.070ns, 1 <= 0.074ns, 1 <= 0.078ns}
        Leaf  : target=0.110ns count=3 avg=0.081ns sd=0.001ns min=0.080ns max=0.082ns {0 <= 0.066ns, 3 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
        Leaf  : target=0.209ns count=1 avg=0.059ns sd=0.000ns min=0.059ns max=0.059ns {1 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
        Leaf  : target=0.243ns count=178 avg=0.093ns sd=0.054ns min=0.035ns max=0.243ns {163 <= 0.146ns, 0 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 15 <= 0.243ns}
      Clock DAG library cell distribution after 'Improving fragments clock skew' {count}:
         Invs: INVX16_LVT: 55 INVX8_LVT: 87 INVX4_LVT: 70 INVX2_LVT: 100 
         ICGs: CGLNPRX8_LVT: 8 CGLPPRX8_LVT: 3 CGLNPRX2_LVT: 4 CGLPPRX2_LVT: 15 
       Logics: LSUPX8_LVT: 1 AO21X2_LVT: 3 AO22X2_RVT: 16 AO21X1_LVT: 3 AO22X1_RVT: 16 
      Primary reporting skew groups after 'Improving fragments clock skew':
        skew_group SDRAM_CLK/func_best_mode: insertion delay [min=1.352, max=1.437], skew [0.085 vs 0.085]
      Skew group summary after 'Improving fragments clock skew':
        skew_group PCI_CLK/func_best_mode: insertion delay [min=0.758, max=0.799], skew [0.041 vs 0.085]
        skew_group SDRAM_CLK/func_best_mode: insertion delay [min=1.352, max=1.437], skew [0.085 vs 0.085]
        skew_group SYS_2x_CLK/func_best_mode: insertion delay [min=0.797, max=0.883], skew [0.086 vs 0.086*]
        skew_group SYS_2x_CLK/func_worst_mode: insertion delay [min=0.797, max=0.883], skew [0.086 vs 0.086*]
        skew_group ate_clk/test_best_mode: insertion delay [min=0.962, max=1.046], skew [0.084 vs 0.085]
        skew_group ate_clk/test_worst_mode: insertion delay [min=0.962, max=1.046], skew [0.084 vs 0.085]
      Legalizer API calls during this step: 121 succeeded with high effort: 121 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
    Improving fragments clock skew done. (took cpu=0:00:00.5 real=0:00:00.5)
    Legalizer API calls during this step: 2115 succeeded with high effort: 2115 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
  AdjustingMinPinPIDs for balancing done. (took cpu=0:00:06.1 real=0:00:06.1)
  Approximately balancing step...
    Resolve constraints - Approximately balancing...
    Resolving skew group constraints...
      Solving LP: 6 skew groups; 158 fragments, 187 fraglets and 153 vertices; 199 variables and 527 constraints; tolerance 1
    Resolving skew group constraints done.
    Resolve constraints - Approximately balancing done. (took cpu=0:00:00.4 real=0:00:00.4)
    Approximately balancing...
      Approximately balancing, wire and cell delays...
      Approximately balancing, wire and cell delays, iteration 1...
        Clock DAG stats after Approximately balancing, wire and cell delays, iteration 1:
          cell counts      : b=0, i=314, icg=30, dcg=0, l=39, total=383
          sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
          misc counts      : r=20, pp=1, mci=38
          cell areas       : b=0.000um^2, i=842.742um^2, icg=198.232um^2, dcg=0.000um^2, l=112.586um^2, total=1153.560um^2
          cell capacitance : b=0.000fF, i=1381.668fF, icg=21.180fF, dcg=0.000fF, l=39.769fF, total=1442.617fF
          sink capacitance : total=2688.728fF, avg=0.765fF, sd=0.890fF, min=0.000fF, max=10.000fF
          wire capacitance : top=331.822fF, trunk=1281.419fF, leaf=2172.553fF, total=3785.795fF
          wire lengths     : top=3665.489um, trunk=14481.034um, leaf=22583.042um, total=40729.565um
          hp wire lengths  : top=2584.456um, trunk=12875.768um, leaf=16442.396um, total=31902.620um
        Clock DAG net violations after Approximately balancing, wire and cell delays, iteration 1: none
        Clock DAG primary half-corner transition distribution after Approximately balancing, wire and cell delays, iteration 1:
          Top   : target=0.243ns count=7 avg=0.107ns sd=0.033ns min=0.087ns max=0.179ns {6 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
          Trunk : target=0.075ns count=1 avg=0.049ns sd=0.000ns min=0.049ns max=0.049ns {0 <= 0.045ns, 1 <= 0.060ns, 0 <= 0.068ns, 0 <= 0.071ns, 0 <= 0.075ns}
          Trunk : target=0.078ns count=1 avg=0.028ns sd=0.000ns min=0.028ns max=0.028ns {1 <= 0.047ns, 0 <= 0.062ns, 0 <= 0.070ns, 0 <= 0.074ns, 0 <= 0.078ns}
          Trunk : target=0.177ns count=4 avg=0.078ns sd=0.023ns min=0.055ns max=0.106ns {4 <= 0.106ns, 0 <= 0.141ns, 0 <= 0.159ns, 0 <= 0.168ns, 0 <= 0.177ns}
          Trunk : target=0.180ns count=2 avg=0.083ns sd=0.012ns min=0.074ns max=0.092ns {2 <= 0.108ns, 0 <= 0.144ns, 0 <= 0.162ns, 0 <= 0.171ns, 0 <= 0.180ns}
          Trunk : target=0.184ns count=8 avg=0.123ns sd=0.017ns min=0.110ns max=0.162ns {2 <= 0.111ns, 5 <= 0.148ns, 1 <= 0.166ns, 0 <= 0.175ns, 0 <= 0.184ns}
          Trunk : target=0.209ns count=2 avg=0.064ns sd=0.011ns min=0.056ns max=0.072ns {2 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
          Trunk : target=0.235ns count=3 avg=0.106ns sd=0.030ns min=0.072ns max=0.127ns {3 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
          Trunk : target=0.241ns count=1 avg=0.096ns sd=0.000ns min=0.096ns max=0.096ns {1 <= 0.144ns, 0 <= 0.192ns, 0 <= 0.217ns, 0 <= 0.229ns, 0 <= 0.241ns}
          Trunk : target=0.243ns count=196 avg=0.070ns sd=0.037ns min=0.000ns max=0.147ns {195 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
          Leaf  : target=0.078ns count=12 avg=0.062ns sd=0.012ns min=0.040ns max=0.076ns {2 <= 0.047ns, 3 <= 0.062ns, 5 <= 0.070ns, 1 <= 0.074ns, 1 <= 0.078ns}
          Leaf  : target=0.110ns count=3 avg=0.081ns sd=0.001ns min=0.080ns max=0.082ns {0 <= 0.066ns, 3 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
          Leaf  : target=0.209ns count=1 avg=0.059ns sd=0.000ns min=0.059ns max=0.059ns {1 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
          Leaf  : target=0.243ns count=178 avg=0.093ns sd=0.054ns min=0.035ns max=0.243ns {163 <= 0.146ns, 0 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 15 <= 0.243ns}
        Clock DAG library cell distribution after Approximately balancing, wire and cell delays, iteration 1 {count}:
           Invs: INVX16_LVT: 55 INVX8_LVT: 87 INVX4_LVT: 70 INVX2_LVT: 102 
           ICGs: CGLNPRX8_LVT: 8 CGLPPRX8_LVT: 3 CGLNPRX2_LVT: 4 CGLPPRX2_LVT: 15 
         Logics: LSUPX8_LVT: 1 AO21X2_LVT: 3 AO22X2_RVT: 16 AO21X1_LVT: 3 AO22X1_RVT: 16 
      Approximately balancing, wire and cell delays, iteration 1 done.
      Approximately balancing, wire and cell delays, iteration 2...
        Clock DAG stats after Approximately balancing, wire and cell delays, iteration 2:
          cell counts      : b=0, i=314, icg=30, dcg=0, l=39, total=383
          sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
          misc counts      : r=20, pp=1, mci=38
          cell areas       : b=0.000um^2, i=842.742um^2, icg=198.232um^2, dcg=0.000um^2, l=112.586um^2, total=1153.560um^2
          cell capacitance : b=0.000fF, i=1381.668fF, icg=21.180fF, dcg=0.000fF, l=39.769fF, total=1442.617fF
          sink capacitance : total=2688.728fF, avg=0.765fF, sd=0.890fF, min=0.000fF, max=10.000fF
          wire capacitance : top=331.822fF, trunk=1281.419fF, leaf=2172.553fF, total=3785.795fF
          wire lengths     : top=3665.489um, trunk=14481.034um, leaf=22583.042um, total=40729.565um
          hp wire lengths  : top=2584.456um, trunk=12875.768um, leaf=16442.396um, total=31902.620um
        Clock DAG net violations after Approximately balancing, wire and cell delays, iteration 2: none
        Clock DAG primary half-corner transition distribution after Approximately balancing, wire and cell delays, iteration 2:
          Top   : target=0.243ns count=7 avg=0.107ns sd=0.033ns min=0.087ns max=0.179ns {6 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
          Trunk : target=0.075ns count=1 avg=0.049ns sd=0.000ns min=0.049ns max=0.049ns {0 <= 0.045ns, 1 <= 0.060ns, 0 <= 0.068ns, 0 <= 0.071ns, 0 <= 0.075ns}
          Trunk : target=0.078ns count=1 avg=0.028ns sd=0.000ns min=0.028ns max=0.028ns {1 <= 0.047ns, 0 <= 0.062ns, 0 <= 0.070ns, 0 <= 0.074ns, 0 <= 0.078ns}
          Trunk : target=0.177ns count=4 avg=0.078ns sd=0.023ns min=0.055ns max=0.106ns {4 <= 0.106ns, 0 <= 0.141ns, 0 <= 0.159ns, 0 <= 0.168ns, 0 <= 0.177ns}
          Trunk : target=0.180ns count=2 avg=0.083ns sd=0.012ns min=0.074ns max=0.092ns {2 <= 0.108ns, 0 <= 0.144ns, 0 <= 0.162ns, 0 <= 0.171ns, 0 <= 0.180ns}
          Trunk : target=0.184ns count=8 avg=0.123ns sd=0.017ns min=0.110ns max=0.162ns {2 <= 0.111ns, 5 <= 0.148ns, 1 <= 0.166ns, 0 <= 0.175ns, 0 <= 0.184ns}
          Trunk : target=0.209ns count=2 avg=0.064ns sd=0.011ns min=0.056ns max=0.072ns {2 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
          Trunk : target=0.235ns count=3 avg=0.106ns sd=0.030ns min=0.072ns max=0.127ns {3 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
          Trunk : target=0.241ns count=1 avg=0.096ns sd=0.000ns min=0.096ns max=0.096ns {1 <= 0.144ns, 0 <= 0.192ns, 0 <= 0.217ns, 0 <= 0.229ns, 0 <= 0.241ns}
          Trunk : target=0.243ns count=196 avg=0.070ns sd=0.037ns min=0.000ns max=0.147ns {195 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
          Leaf  : target=0.078ns count=12 avg=0.062ns sd=0.012ns min=0.040ns max=0.076ns {2 <= 0.047ns, 3 <= 0.062ns, 5 <= 0.070ns, 1 <= 0.074ns, 1 <= 0.078ns}
          Leaf  : target=0.110ns count=3 avg=0.081ns sd=0.001ns min=0.080ns max=0.082ns {0 <= 0.066ns, 3 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
          Leaf  : target=0.209ns count=1 avg=0.059ns sd=0.000ns min=0.059ns max=0.059ns {1 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
          Leaf  : target=0.243ns count=178 avg=0.093ns sd=0.054ns min=0.035ns max=0.243ns {163 <= 0.146ns, 0 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 15 <= 0.243ns}
        Clock DAG library cell distribution after Approximately balancing, wire and cell delays, iteration 2 {count}:
           Invs: INVX16_LVT: 55 INVX8_LVT: 87 INVX4_LVT: 70 INVX2_LVT: 102 
           ICGs: CGLNPRX8_LVT: 8 CGLPPRX8_LVT: 3 CGLNPRX2_LVT: 4 CGLPPRX2_LVT: 15 
         Logics: LSUPX8_LVT: 1 AO21X2_LVT: 3 AO22X2_RVT: 16 AO21X1_LVT: 3 AO22X1_RVT: 16 
      Approximately balancing, wire and cell delays, iteration 2 done.
      Approximately balancing, wire and cell delays done. (took cpu=0:00:00.4 real=0:00:00.4)
    Approximately balancing done.
    Clock DAG stats after 'Approximately balancing step':
      cell counts      : b=0, i=314, icg=30, dcg=0, l=39, total=383
      sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
      misc counts      : r=20, pp=1, mci=38
      cell areas       : b=0.000um^2, i=842.742um^2, icg=198.232um^2, dcg=0.000um^2, l=112.586um^2, total=1153.560um^2
      cell capacitance : b=0.000fF, i=1381.668fF, icg=21.180fF, dcg=0.000fF, l=39.769fF, total=1442.617fF
      sink capacitance : total=2688.728fF, avg=0.765fF, sd=0.890fF, min=0.000fF, max=10.000fF
      wire capacitance : top=331.822fF, trunk=1281.419fF, leaf=2172.553fF, total=3785.795fF
      wire lengths     : top=3665.489um, trunk=14481.034um, leaf=22583.042um, total=40729.565um
      hp wire lengths  : top=2584.456um, trunk=12875.768um, leaf=16442.396um, total=31902.620um
    Clock DAG net violations after 'Approximately balancing step': none
    Clock DAG primary half-corner transition distribution after 'Approximately balancing step':
      Top   : target=0.243ns count=7 avg=0.107ns sd=0.033ns min=0.087ns max=0.179ns {6 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
      Trunk : target=0.075ns count=1 avg=0.049ns sd=0.000ns min=0.049ns max=0.049ns {0 <= 0.045ns, 1 <= 0.060ns, 0 <= 0.068ns, 0 <= 0.071ns, 0 <= 0.075ns}
      Trunk : target=0.078ns count=1 avg=0.028ns sd=0.000ns min=0.028ns max=0.028ns {1 <= 0.047ns, 0 <= 0.062ns, 0 <= 0.070ns, 0 <= 0.074ns, 0 <= 0.078ns}
      Trunk : target=0.177ns count=4 avg=0.078ns sd=0.023ns min=0.055ns max=0.106ns {4 <= 0.106ns, 0 <= 0.141ns, 0 <= 0.159ns, 0 <= 0.168ns, 0 <= 0.177ns}
      Trunk : target=0.180ns count=2 avg=0.083ns sd=0.012ns min=0.074ns max=0.092ns {2 <= 0.108ns, 0 <= 0.144ns, 0 <= 0.162ns, 0 <= 0.171ns, 0 <= 0.180ns}
      Trunk : target=0.184ns count=8 avg=0.123ns sd=0.017ns min=0.110ns max=0.162ns {2 <= 0.111ns, 5 <= 0.148ns, 1 <= 0.166ns, 0 <= 0.175ns, 0 <= 0.184ns}
      Trunk : target=0.209ns count=2 avg=0.064ns sd=0.011ns min=0.056ns max=0.072ns {2 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
      Trunk : target=0.235ns count=3 avg=0.106ns sd=0.030ns min=0.072ns max=0.127ns {3 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
      Trunk : target=0.241ns count=1 avg=0.096ns sd=0.000ns min=0.096ns max=0.096ns {1 <= 0.144ns, 0 <= 0.192ns, 0 <= 0.217ns, 0 <= 0.229ns, 0 <= 0.241ns}
      Trunk : target=0.243ns count=196 avg=0.070ns sd=0.037ns min=0.000ns max=0.147ns {195 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
      Leaf  : target=0.078ns count=12 avg=0.062ns sd=0.012ns min=0.040ns max=0.076ns {2 <= 0.047ns, 3 <= 0.062ns, 5 <= 0.070ns, 1 <= 0.074ns, 1 <= 0.078ns}
      Leaf  : target=0.110ns count=3 avg=0.081ns sd=0.001ns min=0.080ns max=0.082ns {0 <= 0.066ns, 3 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
      Leaf  : target=0.209ns count=1 avg=0.059ns sd=0.000ns min=0.059ns max=0.059ns {1 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
      Leaf  : target=0.243ns count=178 avg=0.093ns sd=0.054ns min=0.035ns max=0.243ns {163 <= 0.146ns, 0 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 15 <= 0.243ns}
    Clock DAG library cell distribution after 'Approximately balancing step' {count}:
       Invs: INVX16_LVT: 55 INVX8_LVT: 87 INVX4_LVT: 70 INVX2_LVT: 102 
       ICGs: CGLNPRX8_LVT: 8 CGLPPRX8_LVT: 3 CGLNPRX2_LVT: 4 CGLPPRX2_LVT: 15 
     Logics: LSUPX8_LVT: 1 AO21X2_LVT: 3 AO22X2_RVT: 16 AO21X1_LVT: 3 AO22X1_RVT: 16 
    Primary reporting skew groups after 'Approximately balancing step':
      skew_group SDRAM_CLK/func_best_mode: insertion delay [min=1.352, max=1.437], skew [0.085 vs 0.085]
    Skew group summary after 'Approximately balancing step':
      skew_group PCI_CLK/func_best_mode: insertion delay [min=0.758, max=0.799], skew [0.041 vs 0.085]
      skew_group SDRAM_CLK/func_best_mode: insertion delay [min=1.352, max=1.437], skew [0.085 vs 0.085]
      skew_group SYS_2x_CLK/func_best_mode: insertion delay [min=0.800, max=0.883], skew [0.084 vs 0.086]
      skew_group SYS_2x_CLK/func_worst_mode: insertion delay [min=0.800, max=0.883], skew [0.084 vs 0.086]
      skew_group ate_clk/test_best_mode: insertion delay [min=0.962, max=1.046], skew [0.084 vs 0.085]
      skew_group ate_clk/test_worst_mode: insertion delay [min=0.962, max=1.046], skew [0.084 vs 0.085]
    Legalizer API calls during this step: 2 succeeded with high effort: 2 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
  Approximately balancing step done. (took cpu=0:00:00.9 real=0:00:00.9)
  Approximately balancing paths...
    Added 0 buffers.
    Clock DAG stats after 'Approximately balancing paths':
      cell counts      : b=0, i=314, icg=30, dcg=0, l=39, total=383
      sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
      misc counts      : r=20, pp=1, mci=38
      cell areas       : b=0.000um^2, i=842.742um^2, icg=198.232um^2, dcg=0.000um^2, l=112.586um^2, total=1153.560um^2
      cell capacitance : b=0.000fF, i=1381.668fF, icg=21.180fF, dcg=0.000fF, l=39.769fF, total=1442.617fF
      sink capacitance : total=2688.728fF, avg=0.765fF, sd=0.890fF, min=0.000fF, max=10.000fF
      wire capacitance : top=331.822fF, trunk=1281.419fF, leaf=2172.553fF, total=3785.795fF
      wire lengths     : top=3665.489um, trunk=14481.034um, leaf=22583.042um, total=40729.565um
      hp wire lengths  : top=2584.456um, trunk=12875.768um, leaf=16442.396um, total=31902.620um
    Clock DAG net violations after 'Approximately balancing paths': none
    Clock DAG primary half-corner transition distribution after 'Approximately balancing paths':
      Top   : target=0.243ns count=7 avg=0.107ns sd=0.033ns min=0.087ns max=0.179ns {6 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
      Trunk : target=0.075ns count=1 avg=0.049ns sd=0.000ns min=0.049ns max=0.049ns {0 <= 0.045ns, 1 <= 0.060ns, 0 <= 0.068ns, 0 <= 0.071ns, 0 <= 0.075ns}
      Trunk : target=0.078ns count=1 avg=0.028ns sd=0.000ns min=0.028ns max=0.028ns {1 <= 0.047ns, 0 <= 0.062ns, 0 <= 0.070ns, 0 <= 0.074ns, 0 <= 0.078ns}
      Trunk : target=0.177ns count=4 avg=0.078ns sd=0.023ns min=0.055ns max=0.106ns {4 <= 0.106ns, 0 <= 0.141ns, 0 <= 0.159ns, 0 <= 0.168ns, 0 <= 0.177ns}
      Trunk : target=0.180ns count=2 avg=0.083ns sd=0.012ns min=0.074ns max=0.092ns {2 <= 0.108ns, 0 <= 0.144ns, 0 <= 0.162ns, 0 <= 0.171ns, 0 <= 0.180ns}
      Trunk : target=0.184ns count=8 avg=0.123ns sd=0.017ns min=0.110ns max=0.162ns {2 <= 0.111ns, 5 <= 0.148ns, 1 <= 0.166ns, 0 <= 0.175ns, 0 <= 0.184ns}
      Trunk : target=0.209ns count=2 avg=0.064ns sd=0.011ns min=0.056ns max=0.072ns {2 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
      Trunk : target=0.235ns count=3 avg=0.106ns sd=0.030ns min=0.072ns max=0.127ns {3 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
      Trunk : target=0.241ns count=1 avg=0.096ns sd=0.000ns min=0.096ns max=0.096ns {1 <= 0.144ns, 0 <= 0.192ns, 0 <= 0.217ns, 0 <= 0.229ns, 0 <= 0.241ns}
      Trunk : target=0.243ns count=196 avg=0.070ns sd=0.037ns min=0.000ns max=0.147ns {195 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
      Leaf  : target=0.078ns count=12 avg=0.062ns sd=0.012ns min=0.040ns max=0.076ns {2 <= 0.047ns, 3 <= 0.062ns, 5 <= 0.070ns, 1 <= 0.074ns, 1 <= 0.078ns}
      Leaf  : target=0.110ns count=3 avg=0.081ns sd=0.001ns min=0.080ns max=0.082ns {0 <= 0.066ns, 3 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
      Leaf  : target=0.209ns count=1 avg=0.059ns sd=0.000ns min=0.059ns max=0.059ns {1 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
      Leaf  : target=0.243ns count=178 avg=0.093ns sd=0.054ns min=0.035ns max=0.243ns {163 <= 0.146ns, 0 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 15 <= 0.243ns}
    Clock DAG library cell distribution after 'Approximately balancing paths' {count}:
       Invs: INVX16_LVT: 55 INVX8_LVT: 87 INVX4_LVT: 70 INVX2_LVT: 102 
       ICGs: CGLNPRX8_LVT: 8 CGLPPRX8_LVT: 3 CGLNPRX2_LVT: 4 CGLPPRX2_LVT: 15 
     Logics: LSUPX8_LVT: 1 AO21X2_LVT: 3 AO22X2_RVT: 16 AO21X1_LVT: 3 AO22X1_RVT: 16 
    Primary reporting skew groups after 'Approximately balancing paths':
      skew_group SDRAM_CLK/func_best_mode: insertion delay [min=1.352, max=1.437, avg=1.416, sd=0.019, skn=-1.175, kur=1.098], skew [0.085 vs 0.085], 100% {1.352, 1.437} (wid=0.113 ws=0.077) (gid=1.377 gs=0.106)
    Skew group summary after 'Approximately balancing paths':
      skew_group PCI_CLK/func_best_mode: insertion delay [min=0.758, max=0.799, avg=0.785, sd=0.010, skn=-1.063, kur=1.020], skew [0.041 vs 0.085], 100% {0.758, 0.799} (wid=0.030 ws=0.024) (gid=0.788 gs=0.035)
      skew_group SDRAM_CLK/func_best_mode: insertion delay [min=1.352, max=1.437, avg=1.416, sd=0.019, skn=-1.175, kur=1.098], skew [0.085 vs 0.085], 100% {1.352, 1.437} (wid=0.113 ws=0.077) (gid=1.377 gs=0.106)
      skew_group SYS_2x_CLK/func_best_mode: insertion delay [min=0.800, max=0.883, avg=0.858, sd=0.020, skn=-1.096, kur=0.897], skew [0.084 vs 0.086], 100% {0.800, 0.883} (wid=0.016 ws=0.015) (gid=0.882 gs=0.091)
      skew_group SYS_2x_CLK/func_worst_mode: insertion delay [min=0.800, max=0.883, avg=0.840, sd=0.021, skn=0.174, kur=1.001], skew [0.084 vs 0.086], 100% {0.800, 0.883} (wid=0.014 ws=0.013) (gid=0.882 gs=0.091)
      skew_group ate_clk/test_best_mode: insertion delay [min=0.962, max=1.046, avg=1.025, sd=0.018, skn=-1.076, kur=0.371], skew [0.084 vs 0.085], 100% {0.962, 1.046} (wid=0.062 ws=0.062) (gid=1.039 gs=0.114)
      skew_group ate_clk/test_worst_mode: insertion delay [min=0.962, max=1.046, avg=1.026, sd=0.018, skn=-1.061, kur=0.271], skew [0.084 vs 0.085], 100% {0.962, 1.046} (wid=0.062 ws=0.059) (gid=1.034 gs=0.110)
    Legalizer API calls during this step: 0 succeeded with high effort: 0 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
  Approximately balancing paths done. (took cpu=0:00:00.2 real=0:00:00.2)
  Stage::Balancing done. (took cpu=0:00:12.0 real=0:00:09.6)
  Stage::Polishing...
  Clock tree timing engine global stage delay update for worst_corner:setup.late...
  Clock tree timing engine global stage delay update for worst_corner:setup.late done. (took cpu=0:00:00.7 real=0:00:00.1)
  Clock DAG stats before polishing:
    cell counts      : b=0, i=314, icg=30, dcg=0, l=39, total=383
    sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
    misc counts      : r=20, pp=1, mci=38
    cell areas       : b=0.000um^2, i=842.742um^2, icg=198.232um^2, dcg=0.000um^2, l=112.586um^2, total=1153.560um^2
    cell capacitance : b=0.000fF, i=1381.668fF, icg=21.180fF, dcg=0.000fF, l=39.769fF, total=1442.617fF
    sink capacitance : total=2688.728fF, avg=0.765fF, sd=0.890fF, min=0.000fF, max=10.000fF
    wire capacitance : top=331.822fF, trunk=1281.419fF, leaf=2172.553fF, total=3785.795fF
    wire lengths     : top=3665.489um, trunk=14481.034um, leaf=22583.042um, total=40729.565um
    hp wire lengths  : top=2584.456um, trunk=12875.768um, leaf=16442.396um, total=31902.620um
  Clock DAG net violations before polishing: none
  Clock DAG primary half-corner transition distribution before polishing:
    Top   : target=0.243ns count=7 avg=0.107ns sd=0.033ns min=0.087ns max=0.179ns {6 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
    Trunk : target=0.075ns count=1 avg=0.049ns sd=0.000ns min=0.049ns max=0.049ns {0 <= 0.045ns, 1 <= 0.060ns, 0 <= 0.068ns, 0 <= 0.071ns, 0 <= 0.075ns}
    Trunk : target=0.078ns count=1 avg=0.028ns sd=0.000ns min=0.028ns max=0.028ns {1 <= 0.047ns, 0 <= 0.062ns, 0 <= 0.070ns, 0 <= 0.074ns, 0 <= 0.078ns}
    Trunk : target=0.177ns count=4 avg=0.078ns sd=0.023ns min=0.055ns max=0.106ns {4 <= 0.106ns, 0 <= 0.141ns, 0 <= 0.159ns, 0 <= 0.168ns, 0 <= 0.177ns}
    Trunk : target=0.180ns count=2 avg=0.083ns sd=0.012ns min=0.074ns max=0.092ns {2 <= 0.108ns, 0 <= 0.144ns, 0 <= 0.162ns, 0 <= 0.171ns, 0 <= 0.180ns}
    Trunk : target=0.184ns count=8 avg=0.123ns sd=0.017ns min=0.110ns max=0.162ns {2 <= 0.111ns, 5 <= 0.148ns, 1 <= 0.166ns, 0 <= 0.175ns, 0 <= 0.184ns}
    Trunk : target=0.209ns count=2 avg=0.064ns sd=0.011ns min=0.056ns max=0.072ns {2 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
    Trunk : target=0.235ns count=3 avg=0.106ns sd=0.030ns min=0.072ns max=0.127ns {3 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
    Trunk : target=0.241ns count=1 avg=0.096ns sd=0.000ns min=0.096ns max=0.096ns {1 <= 0.144ns, 0 <= 0.192ns, 0 <= 0.217ns, 0 <= 0.229ns, 0 <= 0.241ns}
    Trunk : target=0.243ns count=196 avg=0.070ns sd=0.037ns min=0.000ns max=0.147ns {195 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
    Leaf  : target=0.078ns count=12 avg=0.062ns sd=0.012ns min=0.040ns max=0.076ns {2 <= 0.047ns, 3 <= 0.062ns, 5 <= 0.070ns, 1 <= 0.074ns, 1 <= 0.078ns}
    Leaf  : target=0.110ns count=3 avg=0.081ns sd=0.001ns min=0.080ns max=0.082ns {0 <= 0.066ns, 3 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
    Leaf  : target=0.209ns count=1 avg=0.059ns sd=0.000ns min=0.059ns max=0.059ns {1 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
    Leaf  : target=0.243ns count=178 avg=0.093ns sd=0.054ns min=0.035ns max=0.243ns {163 <= 0.146ns, 0 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 15 <= 0.243ns}
  Clock DAG library cell distribution before polishing {count}:
     Invs: INVX16_LVT: 55 INVX8_LVT: 87 INVX4_LVT: 70 INVX2_LVT: 102 
     ICGs: CGLNPRX8_LVT: 8 CGLPPRX8_LVT: 3 CGLNPRX2_LVT: 4 CGLPPRX2_LVT: 15 
   Logics: LSUPX8_LVT: 1 AO21X2_LVT: 3 AO22X2_RVT: 16 AO21X1_LVT: 3 AO22X1_RVT: 16 
  Primary reporting skew groups before polishing:
    skew_group SDRAM_CLK/func_best_mode: insertion delay [min=1.354, max=1.440], skew [0.086 vs 0.085*]
  Skew group summary before polishing:
    skew_group PCI_CLK/func_best_mode: insertion delay [min=0.760, max=0.801], skew [0.041 vs 0.085]
    skew_group SDRAM_CLK/func_best_mode: insertion delay [min=1.354, max=1.440], skew [0.086 vs 0.085*]
    skew_group SYS_2x_CLK/func_best_mode: insertion delay [min=0.803, max=0.885], skew [0.081 vs 0.086]
    skew_group SYS_2x_CLK/func_worst_mode: insertion delay [min=0.804, max=0.885], skew [0.080 vs 0.086]
    skew_group ate_clk/test_best_mode: insertion delay [min=0.958, max=1.049], skew [0.091 vs 0.085*]
    skew_group ate_clk/test_worst_mode: insertion delay [min=0.959, max=1.049], skew [0.090 vs 0.085*]
  Merging balancing drivers for power...
    Tried: 420 Succeeded: 0
    Clock DAG stats after 'Merging balancing drivers for power':
      cell counts      : b=0, i=314, icg=30, dcg=0, l=39, total=383
      sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
      misc counts      : r=20, pp=1, mci=38
      cell areas       : b=0.000um^2, i=842.742um^2, icg=198.232um^2, dcg=0.000um^2, l=112.586um^2, total=1153.560um^2
      cell capacitance : b=0.000fF, i=1381.668fF, icg=21.180fF, dcg=0.000fF, l=39.769fF, total=1442.617fF
      sink capacitance : total=2688.728fF, avg=0.765fF, sd=0.890fF, min=0.000fF, max=10.000fF
      wire capacitance : top=331.822fF, trunk=1281.419fF, leaf=2172.553fF, total=3785.795fF
      wire lengths     : top=3665.489um, trunk=14481.034um, leaf=22583.042um, total=40729.565um
      hp wire lengths  : top=2584.456um, trunk=12875.768um, leaf=16442.396um, total=31902.620um
    Clock DAG net violations after 'Merging balancing drivers for power': none
    Clock DAG primary half-corner transition distribution after 'Merging balancing drivers for power':
      Top   : target=0.243ns count=7 avg=0.107ns sd=0.033ns min=0.087ns max=0.179ns {6 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
      Trunk : target=0.075ns count=1 avg=0.049ns sd=0.000ns min=0.049ns max=0.049ns {0 <= 0.045ns, 1 <= 0.060ns, 0 <= 0.068ns, 0 <= 0.071ns, 0 <= 0.075ns}
      Trunk : target=0.078ns count=1 avg=0.028ns sd=0.000ns min=0.028ns max=0.028ns {1 <= 0.047ns, 0 <= 0.062ns, 0 <= 0.070ns, 0 <= 0.074ns, 0 <= 0.078ns}
      Trunk : target=0.177ns count=4 avg=0.078ns sd=0.023ns min=0.055ns max=0.106ns {4 <= 0.106ns, 0 <= 0.141ns, 0 <= 0.159ns, 0 <= 0.168ns, 0 <= 0.177ns}
      Trunk : target=0.180ns count=2 avg=0.083ns sd=0.012ns min=0.074ns max=0.092ns {2 <= 0.108ns, 0 <= 0.144ns, 0 <= 0.162ns, 0 <= 0.171ns, 0 <= 0.180ns}
      Trunk : target=0.184ns count=8 avg=0.123ns sd=0.017ns min=0.110ns max=0.162ns {2 <= 0.111ns, 5 <= 0.148ns, 1 <= 0.166ns, 0 <= 0.175ns, 0 <= 0.184ns}
      Trunk : target=0.209ns count=2 avg=0.064ns sd=0.011ns min=0.056ns max=0.072ns {2 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
      Trunk : target=0.235ns count=3 avg=0.106ns sd=0.030ns min=0.072ns max=0.127ns {3 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
      Trunk : target=0.241ns count=1 avg=0.096ns sd=0.000ns min=0.096ns max=0.096ns {1 <= 0.144ns, 0 <= 0.192ns, 0 <= 0.217ns, 0 <= 0.229ns, 0 <= 0.241ns}
      Trunk : target=0.243ns count=196 avg=0.070ns sd=0.037ns min=0.000ns max=0.147ns {195 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
      Leaf  : target=0.078ns count=12 avg=0.062ns sd=0.012ns min=0.040ns max=0.076ns {2 <= 0.047ns, 3 <= 0.062ns, 5 <= 0.070ns, 1 <= 0.074ns, 1 <= 0.078ns}
      Leaf  : target=0.110ns count=3 avg=0.081ns sd=0.001ns min=0.080ns max=0.082ns {0 <= 0.066ns, 3 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
      Leaf  : target=0.209ns count=1 avg=0.059ns sd=0.000ns min=0.059ns max=0.059ns {1 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
      Leaf  : target=0.243ns count=178 avg=0.093ns sd=0.054ns min=0.035ns max=0.243ns {163 <= 0.146ns, 0 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 15 <= 0.243ns}
    Clock DAG library cell distribution after 'Merging balancing drivers for power' {count}:
       Invs: INVX16_LVT: 55 INVX8_LVT: 87 INVX4_LVT: 70 INVX2_LVT: 102 
       ICGs: CGLNPRX8_LVT: 8 CGLPPRX8_LVT: 3 CGLNPRX2_LVT: 4 CGLPPRX2_LVT: 15 
     Logics: LSUPX8_LVT: 1 AO21X2_LVT: 3 AO22X2_RVT: 16 AO21X1_LVT: 3 AO22X1_RVT: 16 
    Primary reporting skew groups after 'Merging balancing drivers for power':
      skew_group SDRAM_CLK/func_best_mode: insertion delay [min=1.354, max=1.440], skew [0.086 vs 0.085*]
    Skew group summary after 'Merging balancing drivers for power':
      skew_group PCI_CLK/func_best_mode: insertion delay [min=0.760, max=0.801], skew [0.041 vs 0.085]
      skew_group SDRAM_CLK/func_best_mode: insertion delay [min=1.354, max=1.440], skew [0.086 vs 0.085*]
      skew_group SYS_2x_CLK/func_best_mode: insertion delay [min=0.803, max=0.885], skew [0.081 vs 0.086]
      skew_group SYS_2x_CLK/func_worst_mode: insertion delay [min=0.804, max=0.885], skew [0.080 vs 0.086]
      skew_group ate_clk/test_best_mode: insertion delay [min=0.958, max=1.049], skew [0.091 vs 0.085*]
      skew_group ate_clk/test_worst_mode: insertion delay [min=0.959, max=1.049], skew [0.090 vs 0.085*]
    Legalizer API calls during this step: 0 succeeded with high effort: 0 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
  Merging balancing drivers for power done. (took cpu=0:00:00.1 real=0:00:00.1)
  Improving clock skew...
    Iteration 1...
    Iteration 1 done.
    Clock DAG stats after 'Improving clock skew':
      cell counts      : b=0, i=314, icg=30, dcg=0, l=39, total=383
      sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
      misc counts      : r=20, pp=1, mci=38
      cell areas       : b=0.000um^2, i=842.233um^2, icg=198.232um^2, dcg=0.000um^2, l=112.586um^2, total=1153.051um^2
      cell capacitance : b=0.000fF, i=1380.374fF, icg=21.180fF, dcg=0.000fF, l=39.769fF, total=1441.323fF
      sink capacitance : total=2688.728fF, avg=0.765fF, sd=0.890fF, min=0.000fF, max=10.000fF
      wire capacitance : top=331.822fF, trunk=1283.083fF, leaf=2172.553fF, total=3787.459fF
      wire lengths     : top=3665.489um, trunk=14500.490um, leaf=22583.042um, total=40749.021um
      hp wire lengths  : top=2584.456um, trunk=12894.616um, leaf=16442.396um, total=31921.468um
    Clock DAG net violations after 'Improving clock skew': none
    Clock DAG primary half-corner transition distribution after 'Improving clock skew':
      Top   : target=0.243ns count=7 avg=0.107ns sd=0.033ns min=0.087ns max=0.179ns {6 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
      Trunk : target=0.075ns count=1 avg=0.049ns sd=0.000ns min=0.049ns max=0.049ns {0 <= 0.045ns, 1 <= 0.060ns, 0 <= 0.068ns, 0 <= 0.071ns, 0 <= 0.075ns}
      Trunk : target=0.078ns count=1 avg=0.028ns sd=0.000ns min=0.028ns max=0.028ns {1 <= 0.047ns, 0 <= 0.062ns, 0 <= 0.070ns, 0 <= 0.074ns, 0 <= 0.078ns}
      Trunk : target=0.177ns count=4 avg=0.078ns sd=0.023ns min=0.055ns max=0.106ns {4 <= 0.106ns, 0 <= 0.141ns, 0 <= 0.159ns, 0 <= 0.168ns, 0 <= 0.177ns}
      Trunk : target=0.180ns count=2 avg=0.083ns sd=0.012ns min=0.074ns max=0.092ns {2 <= 0.108ns, 0 <= 0.144ns, 0 <= 0.162ns, 0 <= 0.171ns, 0 <= 0.180ns}
      Trunk : target=0.184ns count=8 avg=0.123ns sd=0.017ns min=0.110ns max=0.162ns {2 <= 0.111ns, 5 <= 0.148ns, 1 <= 0.166ns, 0 <= 0.175ns, 0 <= 0.184ns}
      Trunk : target=0.209ns count=2 avg=0.064ns sd=0.011ns min=0.056ns max=0.072ns {2 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
      Trunk : target=0.235ns count=3 avg=0.106ns sd=0.030ns min=0.072ns max=0.127ns {3 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
      Trunk : target=0.241ns count=1 avg=0.096ns sd=0.000ns min=0.096ns max=0.096ns {1 <= 0.144ns, 0 <= 0.192ns, 0 <= 0.217ns, 0 <= 0.229ns, 0 <= 0.241ns}
      Trunk : target=0.243ns count=196 avg=0.071ns sd=0.036ns min=0.000ns max=0.147ns {195 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
      Leaf  : target=0.078ns count=12 avg=0.062ns sd=0.012ns min=0.040ns max=0.076ns {2 <= 0.047ns, 3 <= 0.062ns, 5 <= 0.070ns, 1 <= 0.074ns, 1 <= 0.078ns}
      Leaf  : target=0.110ns count=3 avg=0.081ns sd=0.001ns min=0.080ns max=0.082ns {0 <= 0.066ns, 3 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
      Leaf  : target=0.209ns count=1 avg=0.059ns sd=0.000ns min=0.059ns max=0.059ns {1 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
      Leaf  : target=0.243ns count=178 avg=0.093ns sd=0.054ns min=0.035ns max=0.243ns {163 <= 0.146ns, 0 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 15 <= 0.243ns}
    Clock DAG library cell distribution after 'Improving clock skew' {count}:
       Invs: INVX16_LVT: 55 INVX8_LVT: 87 INVX4_LVT: 69 INVX2_LVT: 103 
       ICGs: CGLNPRX8_LVT: 8 CGLPPRX8_LVT: 3 CGLNPRX2_LVT: 4 CGLPPRX2_LVT: 15 
     Logics: LSUPX8_LVT: 1 AO21X2_LVT: 3 AO22X2_RVT: 16 AO21X1_LVT: 3 AO22X1_RVT: 16 
    Primary reporting skew groups after 'Improving clock skew':
      skew_group SDRAM_CLK/func_best_mode: insertion delay [min=1.362, max=1.440, avg=1.422, sd=0.018, skn=-1.519, kur=1.539], skew [0.078 vs 0.085], 100% {1.362, 1.440} (wid=0.112 ws=0.076) (gid=1.399 gs=0.127)
    Skew group summary after 'Improving clock skew':
      skew_group PCI_CLK/func_best_mode: insertion delay [min=0.760, max=0.801, avg=0.787, sd=0.011, skn=-0.763, kur=0.141], skew [0.041 vs 0.085], 100% {0.760, 0.801} (wid=0.030 ws=0.024) (gid=0.790 gs=0.035)
      skew_group SDRAM_CLK/func_best_mode: insertion delay [min=1.362, max=1.440, avg=1.422, sd=0.018, skn=-1.519, kur=1.539], skew [0.078 vs 0.085], 100% {1.362, 1.440} (wid=0.112 ws=0.076) (gid=1.399 gs=0.127)
      skew_group SYS_2x_CLK/func_best_mode: insertion delay [min=0.803, max=0.885, avg=0.860, sd=0.020, skn=-1.191, kur=1.052], skew [0.081 vs 0.086], 100% {0.803, 0.885} (wid=0.017 ws=0.015) (gid=0.883 gs=0.088)
      skew_group SYS_2x_CLK/func_worst_mode: insertion delay [min=0.804, max=0.885, avg=0.842, sd=0.021, skn=0.297, kur=0.363], skew [0.080 vs 0.086], 100% {0.804, 0.885} (wid=0.013 ws=0.012) (gid=0.883 gs=0.088)
      skew_group ate_clk/test_best_mode: insertion delay [min=0.967, max=1.049, avg=1.028, sd=0.018, skn=-1.162, kur=0.663], skew [0.081 vs 0.085], 100% {0.967, 1.049} (wid=0.063 ws=0.062) (gid=1.042 gs=0.116)
      skew_group ate_clk/test_worst_mode: insertion delay [min=0.968, max=1.049, avg=1.028, sd=0.018, skn=-1.143, kur=0.553], skew [0.080 vs 0.085], 100% {0.968, 1.049} (wid=0.063 ws=0.059) (gid=1.038 gs=0.112)
    Legalizer API calls during this step: 41 succeeded with high effort: 41 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
  Improving clock skew done. (took cpu=0:00:00.3 real=0:00:00.3)
  Moving gates to reduce wire capacitance...
    Modified slew target multipliers. Leaf=(1 to 0.9) Trunk=(1 to 0.95) Top=(1 to 0.95)
    Iteration 1...
      Artificially removing short and long paths...
        Legalizer API calls during this step: 0 succeeded with high effort: 0 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
      Artificially removing short and long paths done. (took cpu=0:00:00.1 real=0:00:00.1)
      Moving gates to reduce wire capacitance - iteration 1: WireCapReduction...
        Legalizing clock trees...
        Legalizing clock trees done. (took cpu=0:00:00.2 real=0:00:00.2)
        Legalizer API calls during this step: 1650 succeeded with high effort: 1650 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
      Moving gates to reduce wire capacitance - iteration 1: WireCapReduction done. (took cpu=0:00:03.9 real=0:00:01.2)
      Moving gates to reduce wire capacitance - iteration 1: MoveGates...
        Moving gates: 
        ...20% ...40% ...60% ...80% ...Legalizing clock trees...
        Legalizing clock trees done. (took cpu=0:00:00.2 real=0:00:00.2)
        100% 
        Legalizer API calls during this step: 5178 succeeded with high effort: 5178 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
      Moving gates to reduce wire capacitance - iteration 1: MoveGates done. (took cpu=0:00:12.0 real=0:00:02.1)
    Iteration 1 done.
    Iteration 2...
      Artificially removing short and long paths...
        For skew group SYS_2x_CLK/func_best_mode, artificially shortened or lengthened 2 paths.
        	The smallest offset applied was 0.004ns.
        	The largest offset applied was 0.004ns.
        
        For skew group SYS_2x_CLK/func_worst_mode, artificially shortened or lengthened 2 paths.
        	The smallest offset applied was 0.003ns.
        	The largest offset applied was 0.003ns.
        
        Legalizer API calls during this step: 0 succeeded with high effort: 0 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
      Artificially removing short and long paths done. (took cpu=0:00:00.3 real=0:00:00.1)
      Moving gates to reduce wire capacitance - iteration 2: WireCapReduction...
        Legalizing clock trees...
        Legalizing clock trees done. (took cpu=0:00:00.2 real=0:00:00.2)
        Legalizer API calls during this step: 1543 succeeded with high effort: 1543 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
      Moving gates to reduce wire capacitance - iteration 2: WireCapReduction done. (took cpu=0:00:03.1 real=0:00:00.8)
      Moving gates to reduce wire capacitance - iteration 2: MoveGates...
        Moving gates: 
        ...20% ...40% ...60% ...80% ...Legalizing clock trees...
        Legalizing clock trees done. (took cpu=0:00:00.2 real=0:00:00.2)
        100% 
        Legalizer API calls during this step: 5183 succeeded with high effort: 5183 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
      Moving gates to reduce wire capacitance - iteration 2: MoveGates done. (took cpu=0:00:10.3 real=0:00:01.8)
      Reverting Artificially removing short and long paths...
        Legalizer API calls during this step: 0 succeeded with high effort: 0 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
      Reverting Artificially removing short and long paths done. (took cpu=0:00:00.0 real=0:00:00.0)
    Iteration 2 done.
    Reverted slew target multipliers. Leaf=(0.9 to 1) Trunk=(0.95 to 1) Top=(0.95 to 1)
    Clock DAG stats after 'Moving gates to reduce wire capacitance':
      cell counts      : b=0, i=314, icg=30, dcg=0, l=39, total=383
      sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
      misc counts      : r=20, pp=1, mci=38
      cell areas       : b=0.000um^2, i=842.233um^2, icg=198.232um^2, dcg=0.000um^2, l=112.586um^2, total=1153.051um^2
      cell capacitance : b=0.000fF, i=1380.374fF, icg=21.180fF, dcg=0.000fF, l=39.769fF, total=1441.323fF
      sink capacitance : total=2688.728fF, avg=0.765fF, sd=0.890fF, min=0.000fF, max=10.000fF
      wire capacitance : top=331.822fF, trunk=1222.268fF, leaf=2071.348fF, total=3625.439fF
      wire lengths     : top=3665.489um, trunk=13800.989um, leaf=21411.741um, total=38878.219um
      hp wire lengths  : top=2584.456um, trunk=12334.040um, leaf=15596.516um, total=30515.012um
    Clock DAG net violations after 'Moving gates to reduce wire capacitance':
      Remaining Transition : {count=1, worst=[0.000ns]} avg=0.000ns sd=0.000ns sum=0.000ns
    Clock DAG primary half-corner transition distribution after 'Moving gates to reduce wire capacitance':
      Top   : target=0.243ns count=7 avg=0.107ns sd=0.033ns min=0.087ns max=0.179ns {6 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
      Trunk : target=0.075ns count=1 avg=0.048ns sd=0.000ns min=0.048ns max=0.048ns {0 <= 0.045ns, 1 <= 0.060ns, 0 <= 0.068ns, 0 <= 0.071ns, 0 <= 0.075ns}
      Trunk : target=0.078ns count=1 avg=0.027ns sd=0.000ns min=0.027ns max=0.027ns {1 <= 0.047ns, 0 <= 0.062ns, 0 <= 0.070ns, 0 <= 0.074ns, 0 <= 0.078ns}
      Trunk : target=0.177ns count=4 avg=0.075ns sd=0.018ns min=0.055ns max=0.093ns {4 <= 0.106ns, 0 <= 0.141ns, 0 <= 0.159ns, 0 <= 0.168ns, 0 <= 0.177ns}
      Trunk : target=0.180ns count=2 avg=0.081ns sd=0.014ns min=0.071ns max=0.091ns {2 <= 0.108ns, 0 <= 0.144ns, 0 <= 0.162ns, 0 <= 0.171ns, 0 <= 0.180ns}
      Trunk : target=0.184ns count=8 avg=0.122ns sd=0.017ns min=0.109ns max=0.161ns {2 <= 0.111ns, 5 <= 0.148ns, 1 <= 0.166ns, 0 <= 0.175ns, 0 <= 0.184ns}
      Trunk : target=0.209ns count=2 avg=0.068ns sd=0.008ns min=0.062ns max=0.074ns {2 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
      Trunk : target=0.235ns count=3 avg=0.110ns sd=0.035ns min=0.070ns max=0.132ns {3 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
      Trunk : target=0.241ns count=1 avg=0.096ns sd=0.000ns min=0.096ns max=0.096ns {1 <= 0.144ns, 0 <= 0.192ns, 0 <= 0.217ns, 0 <= 0.229ns, 0 <= 0.241ns}
      Trunk : target=0.243ns count=196 avg=0.069ns sd=0.036ns min=0.000ns max=0.153ns {195 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
      Leaf  : target=0.078ns count=12 avg=0.062ns sd=0.012ns min=0.040ns max=0.076ns {2 <= 0.047ns, 4 <= 0.062ns, 3 <= 0.070ns, 2 <= 0.074ns, 1 <= 0.078ns}
      Leaf  : target=0.110ns count=3 avg=0.081ns sd=0.001ns min=0.081ns max=0.082ns {0 <= 0.066ns, 3 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
      Leaf  : target=0.209ns count=1 avg=0.060ns sd=0.000ns min=0.060ns max=0.060ns {1 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
      Leaf  : target=0.243ns count=178 avg=0.091ns sd=0.054ns min=0.034ns max=0.243ns {163 <= 0.146ns, 0 <= 0.194ns, 0 <= 0.219ns, 1 <= 0.231ns, 13 <= 0.243ns} {1 <= 0.255ns, 0 <= 0.267ns, 0 <= 0.292ns, 0 <= 0.364ns, 0 > 0.364ns}
    Clock DAG library cell distribution after 'Moving gates to reduce wire capacitance' {count}:
       Invs: INVX16_LVT: 55 INVX8_LVT: 87 INVX4_LVT: 69 INVX2_LVT: 103 
       ICGs: CGLNPRX8_LVT: 8 CGLPPRX8_LVT: 3 CGLNPRX2_LVT: 4 CGLPPRX2_LVT: 15 
     Logics: LSUPX8_LVT: 1 AO21X2_LVT: 3 AO22X2_RVT: 16 AO21X1_LVT: 3 AO22X1_RVT: 16 
    Primary reporting skew groups after 'Moving gates to reduce wire capacitance':
      skew_group SDRAM_CLK/func_best_mode: insertion delay [min=1.352, max=1.429, avg=1.406, sd=0.020, skn=-0.911, kur=-0.088], skew [0.077 vs 0.085], 100% {1.352, 1.429} (wid=0.108 ws=0.072) (gid=1.376 gs=0.114)
    Skew group summary after 'Moving gates to reduce wire capacitance':
      skew_group PCI_CLK/func_best_mode: insertion delay [min=0.757, max=0.799, avg=0.785, sd=0.011, skn=-0.967, kur=0.430], skew [0.042 vs 0.085], 100% {0.757, 0.799} (wid=0.031 ws=0.025) (gid=0.788 gs=0.041)
      skew_group SDRAM_CLK/func_best_mode: insertion delay [min=1.352, max=1.429, avg=1.406, sd=0.020, skn=-0.911, kur=-0.088], skew [0.077 vs 0.085], 100% {1.352, 1.429} (wid=0.108 ws=0.072) (gid=1.376 gs=0.114)
      skew_group SYS_2x_CLK/func_best_mode: insertion delay [min=0.800, max=0.884, avg=0.855, sd=0.024, skn=-1.123, kur=0.143], skew [0.084 vs 0.086], 100% {0.800, 0.884} (wid=0.016 ws=0.015) (gid=0.883 gs=0.092)
      skew_group SYS_2x_CLK/func_worst_mode: insertion delay [min=0.801, max=0.884, avg=0.813, sd=0.024, skn=2.804, kur=6.722], skew [0.083 vs 0.086], 100% {0.801, 0.884} (wid=0.012 ws=0.011) (gid=0.883 gs=0.092)
      skew_group ate_clk/test_best_mode: insertion delay [min=0.960, max=1.042, avg=1.016, sd=0.021, skn=-0.805, kur=-0.523], skew [0.082 vs 0.085], 100% {0.960, 1.042} (wid=0.063 ws=0.061) (gid=1.034 gs=0.116)
      skew_group ate_clk/test_worst_mode: insertion delay [min=0.960, max=1.040, avg=1.016, sd=0.021, skn=-0.772, kur=-0.613], skew [0.080 vs 0.085], 100% {0.960, 1.040} (wid=0.063 ws=0.060) (gid=1.030 gs=0.112)
    Legalizer API calls during this step: 13554 succeeded with high effort: 13554 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
  Moving gates to reduce wire capacitance done. (took cpu=0:00:30.1 real=0:00:06.3)
  Reducing clock tree power 3...
    Artificially removing short and long paths...
      Legalizer API calls during this step: 0 succeeded with high effort: 0 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
    Artificially removing short and long paths done. (took cpu=0:00:00.1 real=0:00:00.1)
    Initial gate capacitance is (rise=4210.696fF fall=3945.885fF).
    Resizing gates: 
    ...20% ...40% ...60% ...80% ...Legalizing clock trees...
    Legalizing clock trees done. (took cpu=0:00:00.1 real=0:00:00.1)
    100% 
    Iteration 1: gate capacitance is (rise=4159.872fF fall=3895.465fF).
    Resizing gates: 
    ...20% ...40% ...60% ...80% ...Legalizing clock trees...
    Legalizing clock trees done. (took cpu=0:00:00.1 real=0:00:00.1)
    100% 
    Stopping in iteration 2: unable to make further power recovery in this step.
    Iteration 2: gate capacitance is (rise=4153.386fF fall=3889.033fF).
    Clock DAG stats after 'Reducing clock tree power 3':
      cell counts      : b=0, i=314, icg=30, dcg=0, l=39, total=383
      sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
      misc counts      : r=20, pp=1, mci=38
      cell areas       : b=0.000um^2, i=819.869um^2, icg=196.707um^2, dcg=0.000um^2, l=112.586um^2, total=1129.162um^2
      cell capacitance : b=0.000fF, i=1323.068fF, icg=21.175fF, dcg=0.000fF, l=39.769fF, total=1384.012fF
      sink capacitance : total=2688.728fF, avg=0.765fF, sd=0.890fF, min=0.000fF, max=10.000fF
      wire capacitance : top=331.822fF, trunk=1221.773fF, leaf=2072.878fF, total=3626.473fF
      wire lengths     : top=3665.489um, trunk=13795.365um, leaf=21429.373um, total=38890.227um
      hp wire lengths  : top=2584.456um, trunk=12333.888um, leaf=15614.908um, total=30533.252um
    Clock DAG net violations after 'Reducing clock tree power 3':
      Capacitance : {count=1, worst=[1.592fF]} avg=1.592fF sd=0.000fF sum=1.592fF
    Clock DAG primary half-corner transition distribution after 'Reducing clock tree power 3':
      Top   : target=0.243ns count=7 avg=0.107ns sd=0.033ns min=0.087ns max=0.179ns {6 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
      Trunk : target=0.075ns count=1 avg=0.048ns sd=0.000ns min=0.048ns max=0.048ns {0 <= 0.045ns, 1 <= 0.060ns, 0 <= 0.068ns, 0 <= 0.071ns, 0 <= 0.075ns}
      Trunk : target=0.078ns count=1 avg=0.027ns sd=0.000ns min=0.027ns max=0.027ns {1 <= 0.047ns, 0 <= 0.062ns, 0 <= 0.070ns, 0 <= 0.074ns, 0 <= 0.078ns}
      Trunk : target=0.177ns count=5 avg=0.079ns sd=0.019ns min=0.055ns max=0.097ns {5 <= 0.106ns, 0 <= 0.141ns, 0 <= 0.159ns, 0 <= 0.168ns, 0 <= 0.177ns}
      Trunk : target=0.180ns count=2 avg=0.081ns sd=0.014ns min=0.071ns max=0.091ns {2 <= 0.108ns, 0 <= 0.144ns, 0 <= 0.162ns, 0 <= 0.171ns, 0 <= 0.180ns}
      Trunk : target=0.184ns count=7 avg=0.122ns sd=0.018ns min=0.109ns max=0.161ns {2 <= 0.111ns, 4 <= 0.148ns, 1 <= 0.166ns, 0 <= 0.175ns, 0 <= 0.184ns}
      Trunk : target=0.209ns count=2 avg=0.068ns sd=0.008ns min=0.062ns max=0.074ns {2 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
      Trunk : target=0.235ns count=3 avg=0.110ns sd=0.035ns min=0.070ns max=0.132ns {3 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
      Trunk : target=0.241ns count=1 avg=0.096ns sd=0.000ns min=0.096ns max=0.096ns {1 <= 0.144ns, 0 <= 0.192ns, 0 <= 0.217ns, 0 <= 0.229ns, 0 <= 0.241ns}
      Trunk : target=0.243ns count=196 avg=0.070ns sd=0.037ns min=0.000ns max=0.153ns {195 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
      Leaf  : target=0.078ns count=12 avg=0.062ns sd=0.012ns min=0.040ns max=0.076ns {2 <= 0.047ns, 4 <= 0.062ns, 3 <= 0.070ns, 2 <= 0.074ns, 1 <= 0.078ns}
      Leaf  : target=0.110ns count=3 avg=0.081ns sd=0.001ns min=0.081ns max=0.082ns {0 <= 0.066ns, 3 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
      Leaf  : target=0.209ns count=1 avg=0.060ns sd=0.000ns min=0.060ns max=0.060ns {1 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
      Leaf  : target=0.243ns count=178 avg=0.093ns sd=0.054ns min=0.034ns max=0.243ns {162 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 15 <= 0.243ns}
    Clock DAG library cell distribution after 'Reducing clock tree power 3' {count}:
       Invs: INVX16_LVT: 50 INVX8_LVT: 83 INVX4_LVT: 72 INVX2_LVT: 109 
       ICGs: CGLNPRX8_LVT: 7 CGLPPRX8_LVT: 3 CGLNPRX2_LVT: 5 CGLPPRX2_LVT: 15 
     Logics: LSUPX8_LVT: 1 AO21X2_LVT: 3 AO22X2_RVT: 16 AO21X1_LVT: 3 AO22X1_RVT: 16 
    Primary reporting skew groups after 'Reducing clock tree power 3':
      skew_group SDRAM_CLK/func_best_mode: insertion delay [min=1.344, max=1.429, avg=1.408, sd=0.019, skn=-1.200, kur=1.025], skew [0.085 vs 0.085], 100% {1.344, 1.429} (wid=0.108 ws=0.072) (gid=1.376 gs=0.114)
    Skew group summary after 'Reducing clock tree power 3':
      skew_group PCI_CLK/func_best_mode: insertion delay [min=0.751, max=0.815, avg=0.773, sd=0.023, skn=0.918, kur=-0.932], skew [0.064 vs 0.085], 100% {0.751, 0.815} (wid=0.028 ws=0.022) (gid=0.803 gs=0.067)
      skew_group SDRAM_CLK/func_best_mode: insertion delay [min=1.344, max=1.429, avg=1.408, sd=0.019, skn=-1.200, kur=1.025], skew [0.085 vs 0.085], 100% {1.344, 1.429} (wid=0.108 ws=0.072) (gid=1.376 gs=0.114)
      skew_group SYS_2x_CLK/func_best_mode: insertion delay [min=0.800, max=0.884, avg=0.855, sd=0.024, skn=-1.123, kur=0.143], skew [0.084 vs 0.086], 100% {0.800, 0.884} (wid=0.016 ws=0.015) (gid=0.883 gs=0.092)
      skew_group SYS_2x_CLK/func_worst_mode: insertion delay [min=0.801, max=0.884, avg=0.813, sd=0.024, skn=2.804, kur=6.722], skew [0.083 vs 0.086], 100% {0.801, 0.884} (wid=0.012 ws=0.011) (gid=0.883 gs=0.092)
      skew_group ate_clk/test_best_mode: insertion delay [min=0.960, max=1.042, avg=1.018, sd=0.020, skn=-1.048, kur=-0.080], skew [0.082 vs 0.085], 100% {0.960, 1.042} (wid=0.063 ws=0.061) (gid=1.034 gs=0.116)
      skew_group ate_clk/test_worst_mode: insertion delay [min=0.960, max=1.040, avg=1.018, sd=0.020, skn=-1.027, kur=-0.170], skew [0.080 vs 0.085], 100% {0.960, 1.040} (wid=0.063 ws=0.060) (gid=1.030 gs=0.112)
    Legalizer API calls during this step: 1604 succeeded with high effort: 1604 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
  Reducing clock tree power 3 done. (took cpu=0:00:04.2 real=0:00:01.4)
  Improving insertion delay...
    Clock DAG stats after 'Improving insertion delay':
      cell counts      : b=0, i=314, icg=30, dcg=0, l=39, total=383
      sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
      misc counts      : r=20, pp=1, mci=38
      cell areas       : b=0.000um^2, i=819.869um^2, icg=196.707um^2, dcg=0.000um^2, l=112.586um^2, total=1129.162um^2
      cell capacitance : b=0.000fF, i=1323.068fF, icg=21.175fF, dcg=0.000fF, l=39.769fF, total=1384.012fF
      sink capacitance : total=2688.728fF, avg=0.765fF, sd=0.890fF, min=0.000fF, max=10.000fF
      wire capacitance : top=331.822fF, trunk=1226.999fF, leaf=2072.878fF, total=3631.699fF
      wire lengths     : top=3665.489um, trunk=13855.557um, leaf=21429.373um, total=38950.419um
      hp wire lengths  : top=2584.456um, trunk=12363.984um, leaf=15614.908um, total=30563.348um
    Clock DAG net violations after 'Improving insertion delay':
      Capacitance : {count=1, worst=[1.592fF]} avg=1.592fF sd=0.000fF sum=1.592fF
    Clock DAG primary half-corner transition distribution after 'Improving insertion delay':
      Top   : target=0.243ns count=7 avg=0.107ns sd=0.033ns min=0.087ns max=0.179ns {6 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
      Trunk : target=0.075ns count=1 avg=0.048ns sd=0.000ns min=0.048ns max=0.048ns {0 <= 0.045ns, 1 <= 0.060ns, 0 <= 0.068ns, 0 <= 0.071ns, 0 <= 0.075ns}
      Trunk : target=0.078ns count=1 avg=0.027ns sd=0.000ns min=0.027ns max=0.027ns {1 <= 0.047ns, 0 <= 0.062ns, 0 <= 0.070ns, 0 <= 0.074ns, 0 <= 0.078ns}
      Trunk : target=0.177ns count=5 avg=0.079ns sd=0.019ns min=0.055ns max=0.097ns {5 <= 0.106ns, 0 <= 0.141ns, 0 <= 0.159ns, 0 <= 0.168ns, 0 <= 0.177ns}
      Trunk : target=0.180ns count=2 avg=0.081ns sd=0.014ns min=0.071ns max=0.091ns {2 <= 0.108ns, 0 <= 0.144ns, 0 <= 0.162ns, 0 <= 0.171ns, 0 <= 0.180ns}
      Trunk : target=0.184ns count=7 avg=0.122ns sd=0.018ns min=0.109ns max=0.161ns {2 <= 0.111ns, 4 <= 0.148ns, 1 <= 0.166ns, 0 <= 0.175ns, 0 <= 0.184ns}
      Trunk : target=0.209ns count=2 avg=0.068ns sd=0.008ns min=0.062ns max=0.074ns {2 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
      Trunk : target=0.235ns count=3 avg=0.110ns sd=0.035ns min=0.070ns max=0.132ns {3 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
      Trunk : target=0.241ns count=1 avg=0.096ns sd=0.000ns min=0.096ns max=0.096ns {1 <= 0.144ns, 0 <= 0.192ns, 0 <= 0.217ns, 0 <= 0.229ns, 0 <= 0.241ns}
      Trunk : target=0.243ns count=196 avg=0.070ns sd=0.037ns min=0.000ns max=0.153ns {195 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
      Leaf  : target=0.078ns count=12 avg=0.062ns sd=0.012ns min=0.040ns max=0.076ns {2 <= 0.047ns, 4 <= 0.062ns, 3 <= 0.070ns, 2 <= 0.074ns, 1 <= 0.078ns}
      Leaf  : target=0.110ns count=3 avg=0.081ns sd=0.001ns min=0.081ns max=0.082ns {0 <= 0.066ns, 3 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
      Leaf  : target=0.209ns count=1 avg=0.060ns sd=0.000ns min=0.060ns max=0.060ns {1 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
      Leaf  : target=0.243ns count=178 avg=0.093ns sd=0.054ns min=0.034ns max=0.243ns {162 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 15 <= 0.243ns}
    Clock DAG library cell distribution after 'Improving insertion delay' {count}:
       Invs: INVX16_LVT: 50 INVX8_LVT: 83 INVX4_LVT: 72 INVX2_LVT: 109 
       ICGs: CGLNPRX8_LVT: 7 CGLPPRX8_LVT: 3 CGLNPRX2_LVT: 5 CGLPPRX2_LVT: 15 
     Logics: LSUPX8_LVT: 1 AO21X2_LVT: 3 AO22X2_RVT: 16 AO21X1_LVT: 3 AO22X1_RVT: 16 
    Primary reporting skew groups after 'Improving insertion delay':
      skew_group SDRAM_CLK/func_best_mode: insertion delay [min=1.344, max=1.429, avg=1.408, sd=0.019, skn=-1.200, kur=1.025], skew [0.085 vs 0.085], 100% {1.344, 1.429} (wid=0.108 ws=0.072) (gid=1.376 gs=0.114)
    Skew group summary after 'Improving insertion delay':
      skew_group PCI_CLK/func_best_mode: insertion delay [min=0.776, max=0.839, avg=0.798, sd=0.023, skn=0.916, kur=-0.935], skew [0.064 vs 0.085], 100% {0.776, 0.839} (wid=0.028 ws=0.022) (gid=0.827 gs=0.067)
      skew_group SDRAM_CLK/func_best_mode: insertion delay [min=1.344, max=1.429, avg=1.408, sd=0.019, skn=-1.200, kur=1.025], skew [0.085 vs 0.085], 100% {1.344, 1.429} (wid=0.108 ws=0.072) (gid=1.376 gs=0.114)
      skew_group SYS_2x_CLK/func_best_mode: insertion delay [min=0.800, max=0.884, avg=0.855, sd=0.024, skn=-1.123, kur=0.143], skew [0.084 vs 0.086], 100% {0.800, 0.884} (wid=0.016 ws=0.015) (gid=0.883 gs=0.092)
      skew_group SYS_2x_CLK/func_worst_mode: insertion delay [min=0.801, max=0.884, avg=0.813, sd=0.024, skn=2.804, kur=6.722], skew [0.083 vs 0.086], 100% {0.801, 0.884} (wid=0.012 ws=0.011) (gid=0.883 gs=0.092)
      skew_group ate_clk/test_best_mode: insertion delay [min=0.960, max=1.042, avg=1.018, sd=0.020, skn=-1.048, kur=-0.080], skew [0.082 vs 0.085], 100% {0.960, 1.042} (wid=0.063 ws=0.061) (gid=1.034 gs=0.116)
      skew_group ate_clk/test_worst_mode: insertion delay [min=0.960, max=1.040, avg=1.018, sd=0.020, skn=-1.027, kur=-0.170], skew [0.080 vs 0.085], 100% {0.960, 1.040} (wid=0.063 ws=0.060) (gid=1.030 gs=0.112)
    Legalizer API calls during this step: 78 succeeded with high effort: 78 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
  Improving insertion delay done. (took cpu=0:00:00.3 real=0:00:00.3)
  Wire Opt OverFix...
    Wire Reduction extra effort...
      Modified slew target multipliers. Leaf=(1 to 0.95) Trunk=(1 to 1) Top=(1 to 1)
      Artificially removing short and long paths...
        Legalizer API calls during this step: 0 succeeded with high effort: 0 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
      Artificially removing short and long paths done. (took cpu=0:00:00.1 real=0:00:00.1)
      Global shorten wires A0...
        Legalizer API calls during this step: 309 succeeded with high effort: 309 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
      Global shorten wires A0 done. (took cpu=0:00:00.6 real=0:00:00.4)
      Move For Wirelength - core...
        Move for wirelength. considered=458, filtered=0, permitted=338, cannotCompute=19, computed=319, moveTooSmall=653, resolved=0, predictFail=74, currentlyIllegal=0, legalizationFail=140, legalizedMoveTooSmall=10, ignoredLeafDriver=0, worse=806, accepted=68
        Max accepted move=68.552um, total accepted move=955.624um, average move=14.053um
        Move for wirelength. considered=458, filtered=0, permitted=338, cannotCompute=19, computed=319, moveTooSmall=638, resolved=0, predictFail=80, currentlyIllegal=0, legalizationFail=128, legalizedMoveTooSmall=18, ignoredLeafDriver=0, worse=896, accepted=43
        Max accepted move=37.848um, total accepted move=525.768um, average move=12.227um
        Move for wirelength. considered=458, filtered=0, permitted=338, cannotCompute=24, computed=314, moveTooSmall=656, resolved=0, predictFail=90, currentlyIllegal=0, legalizationFail=132, legalizedMoveTooSmall=20, ignoredLeafDriver=0, worse=934, accepted=23
        Max accepted move=30.096um, total accepted move=303.392um, average move=13.190um
        Legalizer API calls during this step: 4624 succeeded with high effort: 4624 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
      Move For Wirelength - core done. (took cpu=0:00:11.7 real=0:00:04.5)
      Global shorten wires A1...
        Legalizer API calls during this step: 325 succeeded with high effort: 325 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
      Global shorten wires A1 done. (took cpu=0:00:00.4 real=0:00:00.2)
      Move For Wirelength - core...
        Move for wirelength. considered=458, filtered=0, permitted=338, cannotCompute=285, computed=53, moveTooSmall=877, resolved=0, predictFail=1, currentlyIllegal=0, legalizationFail=9, legalizedMoveTooSmall=1, ignoredLeafDriver=0, worse=94, accepted=5
        Max accepted move=6.688um, total accepted move=18.392um, average move=3.678um
        Move for wirelength. considered=458, filtered=0, permitted=338, cannotCompute=285, computed=53, moveTooSmall=885, resolved=0, predictFail=1, currentlyIllegal=0, legalizationFail=10, legalizedMoveTooSmall=1, ignoredLeafDriver=0, worse=95, accepted=0
        Max accepted move=0.000um, total accepted move=0.000um
        Legalizer API calls during this step: 1026 succeeded with high effort: 1026 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
      Move For Wirelength - core done. (took cpu=0:00:01.3 real=0:00:00.6)
      Global shorten wires B...
        Legalizer API calls during this step: 1077 succeeded with high effort: 1077 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
      Global shorten wires B done. (took cpu=0:00:02.1 real=0:00:01.0)
      Move For Wirelength - branch...
        Move for wirelength. considered=458, filtered=0, permitted=338, cannotCompute=0, computed=338, moveTooSmall=0, resolved=0, predictFail=1, currentlyIllegal=0, legalizationFail=412, legalizedMoveTooSmall=0, ignoredLeafDriver=0, worse=106, accepted=4
        Max accepted move=3.344um, total accepted move=8.664um, average move=2.166um
        Move for wirelength. considered=458, filtered=0, permitted=338, cannotCompute=26, computed=312, moveTooSmall=0, resolved=0, predictFail=247, currentlyIllegal=0, legalizationFail=413, legalizedMoveTooSmall=0, ignoredLeafDriver=0, worse=10, accepted=0
        Max accepted move=0.000um, total accepted move=0.000um
        Legalizer API calls during this step: 1755 succeeded with high effort: 1755 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
      Move For Wirelength - branch done. (took cpu=0:00:03.4 real=0:00:01.2)
      Reverted slew target multipliers. Leaf=(0.95 to 1) Trunk=(1 to 1) Top=(1 to 1)
      Clock DAG stats after 'Wire Reduction extra effort':
        cell counts      : b=0, i=314, icg=30, dcg=0, l=39, total=383
        sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
        misc counts      : r=20, pp=1, mci=38
        cell areas       : b=0.000um^2, i=819.869um^2, icg=196.707um^2, dcg=0.000um^2, l=112.586um^2, total=1129.162um^2
        cell capacitance : b=0.000fF, i=1323.068fF, icg=21.175fF, dcg=0.000fF, l=39.769fF, total=1384.012fF
        sink capacitance : total=2688.728fF, avg=0.765fF, sd=0.890fF, min=0.000fF, max=10.000fF
        wire capacitance : top=331.822fF, trunk=1242.810fF, leaf=2019.904fF, total=3594.537fF
        wire lengths     : top=3665.489um, trunk=14022.149um, leaf=20870.620um, total=38558.258um
        hp wire lengths  : top=2584.456um, trunk=12584.992um, leaf=15062.388um, total=30231.836um
      Clock DAG net violations after 'Wire Reduction extra effort':
        Capacitance : {count=1, worst=[1.569fF]} avg=1.569fF sd=0.000fF sum=1.569fF
      Clock DAG primary half-corner transition distribution after 'Wire Reduction extra effort':
        Top   : target=0.243ns count=7 avg=0.107ns sd=0.033ns min=0.087ns max=0.179ns {6 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
        Trunk : target=0.075ns count=1 avg=0.048ns sd=0.000ns min=0.048ns max=0.048ns {0 <= 0.045ns, 1 <= 0.060ns, 0 <= 0.068ns, 0 <= 0.071ns, 0 <= 0.075ns}
        Trunk : target=0.078ns count=1 avg=0.027ns sd=0.000ns min=0.027ns max=0.027ns {1 <= 0.047ns, 0 <= 0.062ns, 0 <= 0.070ns, 0 <= 0.074ns, 0 <= 0.078ns}
        Trunk : target=0.177ns count=5 avg=0.081ns sd=0.021ns min=0.055ns max=0.105ns {5 <= 0.106ns, 0 <= 0.141ns, 0 <= 0.159ns, 0 <= 0.168ns, 0 <= 0.177ns}
        Trunk : target=0.180ns count=2 avg=0.082ns sd=0.015ns min=0.071ns max=0.093ns {2 <= 0.108ns, 0 <= 0.144ns, 0 <= 0.162ns, 0 <= 0.171ns, 0 <= 0.180ns}
        Trunk : target=0.184ns count=7 avg=0.122ns sd=0.018ns min=0.109ns max=0.160ns {2 <= 0.111ns, 4 <= 0.148ns, 1 <= 0.166ns, 0 <= 0.175ns, 0 <= 0.184ns}
        Trunk : target=0.209ns count=2 avg=0.068ns sd=0.008ns min=0.062ns max=0.074ns {2 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
        Trunk : target=0.235ns count=3 avg=0.111ns sd=0.036ns min=0.070ns max=0.134ns {3 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
        Trunk : target=0.241ns count=1 avg=0.096ns sd=0.000ns min=0.096ns max=0.096ns {1 <= 0.144ns, 0 <= 0.192ns, 0 <= 0.217ns, 0 <= 0.229ns, 0 <= 0.241ns}
        Trunk : target=0.243ns count=196 avg=0.072ns sd=0.039ns min=0.000ns max=0.173ns {191 <= 0.146ns, 5 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
        Leaf  : target=0.078ns count=12 avg=0.062ns sd=0.011ns min=0.041ns max=0.076ns {2 <= 0.047ns, 4 <= 0.062ns, 3 <= 0.070ns, 2 <= 0.074ns, 1 <= 0.078ns}
        Leaf  : target=0.110ns count=3 avg=0.081ns sd=0.001ns min=0.081ns max=0.082ns {0 <= 0.066ns, 3 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
        Leaf  : target=0.209ns count=1 avg=0.060ns sd=0.000ns min=0.060ns max=0.060ns {1 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
        Leaf  : target=0.243ns count=178 avg=0.093ns sd=0.054ns min=0.033ns max=0.243ns {162 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 15 <= 0.243ns}
      Clock DAG library cell distribution after 'Wire Reduction extra effort' {count}:
         Invs: INVX16_LVT: 50 INVX8_LVT: 83 INVX4_LVT: 72 INVX2_LVT: 109 
         ICGs: CGLNPRX8_LVT: 7 CGLPPRX8_LVT: 3 CGLNPRX2_LVT: 5 CGLPPRX2_LVT: 15 
       Logics: LSUPX8_LVT: 1 AO21X2_LVT: 3 AO22X2_RVT: 16 AO21X1_LVT: 3 AO22X1_RVT: 16 
      Primary reporting skew groups after 'Wire Reduction extra effort':
        skew_group SDRAM_CLK/func_best_mode: insertion delay [min=1.345, max=1.429, avg=1.407, sd=0.017, skn=-1.567, kur=3.046], skew [0.084 vs 0.085], 100% {1.345, 1.429} (wid=0.106 ws=0.071) (gid=1.377 gs=0.118)
      Skew group summary after 'Wire Reduction extra effort':
        skew_group PCI_CLK/func_best_mode: insertion delay [min=0.758, max=0.822, avg=0.781, sd=0.022, skn=0.919, kur=-0.914], skew [0.064 vs 0.085], 100% {0.758, 0.822} (wid=0.029 ws=0.023) (gid=0.811 gs=0.066)
        skew_group SDRAM_CLK/func_best_mode: insertion delay [min=1.345, max=1.429, avg=1.407, sd=0.017, skn=-1.567, kur=3.046], skew [0.084 vs 0.085], 100% {1.345, 1.429} (wid=0.106 ws=0.071) (gid=1.377 gs=0.118)
        skew_group SYS_2x_CLK/func_best_mode: insertion delay [min=0.798, max=0.884, avg=0.853, sd=0.025, skn=-1.179, kur=0.257], skew [0.085 vs 0.086], 100% {0.798, 0.884} (wid=0.016 ws=0.015) (gid=0.883 gs=0.095)
        skew_group SYS_2x_CLK/func_worst_mode: insertion delay [min=0.798, max=0.884, avg=0.807, sd=0.026, skn=2.888, kur=7.037], skew [0.085 vs 0.086], 100% {0.798, 0.884} (wid=0.011 ws=0.010) (gid=0.883 gs=0.095)
        skew_group ate_clk/test_best_mode: insertion delay [min=0.960, max=1.042, avg=1.019, sd=0.018, skn=-1.439, kur=1.231], skew [0.082 vs 0.085], 100% {0.960, 1.042} (wid=0.062 ws=0.059) (gid=1.034 gs=0.117)
        skew_group ate_clk/test_worst_mode: insertion delay [min=0.960, max=1.038, avg=1.019, sd=0.018, skn=-1.438, kur=1.178], skew [0.077 vs 0.085], 100% {0.960, 1.038} (wid=0.062 ws=0.059) (gid=1.031 gs=0.114)
      Legalizer API calls during this step: 9116 succeeded with high effort: 9116 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
    Wire Reduction extra effort done. (took cpu=0:00:19.7 real=0:00:08.3)
    Optimizing orientation...
    FlipOpt...
    Disconnecting clock tree from netlist...
    Disconnecting clock tree from netlist done.
    Orientation Wirelength Optimization: Attempted = 414 , Succeeded = 41 , Constraints Broken = 373 , CannotMove = 0 , Illegal = 0 , Other = 0
    Resynthesising clock tree into netlist...
      Reset timing graph...
Ignoring AAE DB Resetting ...
      Reset timing graph done.
    Resynthesising clock tree into netlist done.
    FlipOpt done. (took cpu=0:00:07.3 real=0:00:03.0)
    Optimizing orientation done. (took cpu=0:00:07.3 real=0:00:03.0)
    Clock DAG stats after 'Wire Opt OverFix':
      cell counts      : b=0, i=314, icg=30, dcg=0, l=39, total=383
      sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
      misc counts      : r=20, pp=1, mci=38
      cell areas       : b=0.000um^2, i=819.869um^2, icg=196.707um^2, dcg=0.000um^2, l=112.586um^2, total=1129.162um^2
      cell capacitance : b=0.000fF, i=1323.068fF, icg=21.175fF, dcg=0.000fF, l=39.769fF, total=1384.012fF
      sink capacitance : total=2688.728fF, avg=0.765fF, sd=0.890fF, min=0.000fF, max=10.000fF
      wire capacitance : top=331.822fF, trunk=1238.345fF, leaf=2018.937fF, total=3589.105fF
      wire lengths     : top=3665.489um, trunk=13971.230um, leaf=20855.572um, total=38492.291um
      hp wire lengths  : top=2584.456um, trunk=12556.720um, leaf=15063.148um, total=30204.324um
    Clock DAG net violations after 'Wire Opt OverFix':
      Capacitance : {count=1, worst=[1.546fF]} avg=1.546fF sd=0.000fF sum=1.546fF
    Clock DAG primary half-corner transition distribution after 'Wire Opt OverFix':
      Top   : target=0.243ns count=7 avg=0.107ns sd=0.033ns min=0.087ns max=0.179ns {6 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
      Trunk : target=0.075ns count=1 avg=0.048ns sd=0.000ns min=0.048ns max=0.048ns {0 <= 0.045ns, 1 <= 0.060ns, 0 <= 0.068ns, 0 <= 0.071ns, 0 <= 0.075ns}
      Trunk : target=0.078ns count=1 avg=0.027ns sd=0.000ns min=0.027ns max=0.027ns {1 <= 0.047ns, 0 <= 0.062ns, 0 <= 0.070ns, 0 <= 0.074ns, 0 <= 0.078ns}
      Trunk : target=0.177ns count=5 avg=0.079ns sd=0.019ns min=0.055ns max=0.101ns {5 <= 0.106ns, 0 <= 0.141ns, 0 <= 0.159ns, 0 <= 0.168ns, 0 <= 0.177ns}
      Trunk : target=0.180ns count=2 avg=0.082ns sd=0.015ns min=0.071ns max=0.093ns {2 <= 0.108ns, 0 <= 0.144ns, 0 <= 0.162ns, 0 <= 0.171ns, 0 <= 0.180ns}
      Trunk : target=0.184ns count=7 avg=0.122ns sd=0.018ns min=0.110ns max=0.160ns {2 <= 0.111ns, 4 <= 0.148ns, 1 <= 0.166ns, 0 <= 0.175ns, 0 <= 0.184ns}
      Trunk : target=0.209ns count=2 avg=0.068ns sd=0.008ns min=0.062ns max=0.074ns {2 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
      Trunk : target=0.235ns count=3 avg=0.110ns sd=0.036ns min=0.070ns max=0.137ns {3 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
      Trunk : target=0.241ns count=1 avg=0.096ns sd=0.000ns min=0.096ns max=0.096ns {1 <= 0.144ns, 0 <= 0.192ns, 0 <= 0.217ns, 0 <= 0.229ns, 0 <= 0.241ns}
      Trunk : target=0.243ns count=196 avg=0.072ns sd=0.038ns min=0.000ns max=0.173ns {191 <= 0.146ns, 5 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
      Leaf  : target=0.078ns count=12 avg=0.062ns sd=0.012ns min=0.040ns max=0.076ns {2 <= 0.047ns, 4 <= 0.062ns, 3 <= 0.070ns, 2 <= 0.074ns, 1 <= 0.078ns}
      Leaf  : target=0.110ns count=3 avg=0.081ns sd=0.001ns min=0.081ns max=0.082ns {0 <= 0.066ns, 3 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
      Leaf  : target=0.209ns count=1 avg=0.060ns sd=0.000ns min=0.060ns max=0.060ns {1 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
      Leaf  : target=0.243ns count=178 avg=0.093ns sd=0.054ns min=0.033ns max=0.243ns {162 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 15 <= 0.243ns}
    Clock DAG library cell distribution after 'Wire Opt OverFix' {count}:
       Invs: INVX16_LVT: 50 INVX8_LVT: 83 INVX4_LVT: 72 INVX2_LVT: 109 
       ICGs: CGLNPRX8_LVT: 7 CGLPPRX8_LVT: 3 CGLNPRX2_LVT: 5 CGLPPRX2_LVT: 15 
     Logics: LSUPX8_LVT: 1 AO21X2_LVT: 3 AO22X2_RVT: 16 AO21X1_LVT: 3 AO22X1_RVT: 16 
    Primary reporting skew groups after 'Wire Opt OverFix':
      skew_group SDRAM_CLK/func_best_mode: insertion delay [min=1.345, max=1.424, avg=1.405, sd=0.016, skn=-1.852, kur=3.965], skew [0.079 vs 0.085], 100% {1.345, 1.424} (wid=0.106 ws=0.070) (gid=1.377 gs=0.117)
    Skew group summary after 'Wire Opt OverFix':
      skew_group PCI_CLK/func_best_mode: insertion delay [min=0.757, max=0.819, avg=0.779, sd=0.022, skn=0.941, kur=-0.874], skew [0.062 vs 0.085], 100% {0.757, 0.819} (wid=0.029 ws=0.023) (gid=0.808 gs=0.066)
      skew_group SDRAM_CLK/func_best_mode: insertion delay [min=1.345, max=1.424, avg=1.405, sd=0.016, skn=-1.852, kur=3.965], skew [0.079 vs 0.085], 100% {1.345, 1.424} (wid=0.106 ws=0.070) (gid=1.377 gs=0.117)
      skew_group SYS_2x_CLK/func_best_mode: insertion delay [min=0.798, max=0.884, avg=0.853, sd=0.025, skn=-1.175, kur=0.248], skew [0.085 vs 0.086], 100% {0.798, 0.884} (wid=0.016 ws=0.015) (gid=0.883 gs=0.095)
      skew_group SYS_2x_CLK/func_worst_mode: insertion delay [min=0.798, max=0.884, avg=0.807, sd=0.026, skn=2.888, kur=7.037], skew [0.085 vs 0.086], 100% {0.798, 0.884} (wid=0.011 ws=0.010) (gid=0.883 gs=0.095)
      skew_group ate_clk/test_best_mode: insertion delay [min=0.960, max=1.042, avg=1.017, sd=0.018, skn=-1.483, kur=1.340], skew [0.082 vs 0.085], 100% {0.960, 1.042} (wid=0.062 ws=0.059) (gid=1.034 gs=0.117)
      skew_group ate_clk/test_worst_mode: insertion delay [min=0.960, max=1.036, avg=1.017, sd=0.018, skn=-1.493, kur=1.302], skew [0.076 vs 0.085], 100% {0.960, 1.036} (wid=0.062 ws=0.059) (gid=1.030 gs=0.113)
    Legalizer API calls during this step: 11438 succeeded with high effort: 11222 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
  Wire Opt OverFix done. (took cpu=0:00:27.9 real=0:00:11.7)
  Total capacitance is (rise=7742.490fF fall=7478.137fF), of which (rise=3589.105fF fall=3589.105fF) is wire, and (rise=4153.386fF fall=3889.033fF) is gate.
  Stage::Polishing done. (took cpu=0:01:04 real=0:00:20.6)
  Stage::Updating netlist...
  Reset timing graph...
Ignoring AAE DB Resetting ...
  Reset timing graph done.
  Setting non-default rules before calling refine place.
  Leaving CCOpt scope - Cleaning up placement interface...
  Leaving CCOpt scope - Cleaning up placement interface done. (took cpu=0:00:00.4 real=0:00:00.1)
  Leaving CCOpt scope - ClockRefiner...
  Soft fixed 376 clock instances.
  Performing clock and sink only refine place with checks partially disabled for sinks.

*** Starting refinePlace (0:40:06 mem=6627.3M) ***
Total net bbox length = 8.688e+05 (5.127e+05 3.561e+05) (ext = 1.259e+04)
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Move report: Detail placement moves 3 insts, mean move: 1.17 um, max move: 1.82 um 
	Max move on inst (I_RISC_CORE/I_STACK_TOP_I1_STACK_MEM_Stack_Mem_reg_1__3_): (125.70, 178.90) --> (125.86, 180.58)
	Runtime: CPU: 0:00:01.2 REAL: 0:00:00.0 MEM: 6598.3MB
Summary Report:
Instances move: 26 (out of 40847 movable)
Instances flipped: 0
Mean displacement: 1.39 um
Max displacement: 3.34 um (Instance: I_SDRAM_TOP/I_SDRAM_IF/U15567) (76, 583.528) -> (76, 580.184)
	Length: 10 sites, height: 1 rows, site name: unit, cell type: AO22X1_RVT
Physical-only instances move: 0 (out of 0 movable physical-only)
Total net bbox length = 8.688e+05 (5.127e+05 3.561e+05) (ext = 1.260e+04)
Runtime: CPU: 0:00:01.4 REAL: 0:00:01.0 MEM: 6598.3MB
*** Finished refinePlace (0:40:07 mem=6598.3M) ***
  ClockRefiner summary
  All clock instances: Moved 26, flipped 6 and cell swapped 0 (out of a total of 3876).
  All Clock instances: Average move = 1.39um
  The largest move was 3.34 um for I_SDRAM_TOP/I_SDRAM_IF/U15567.
  Restoring pStatusCts on 376 clock instances.
  Leaving CCOpt scope - ClockRefiner done. (took cpu=0:00:02.3 real=0:00:01.1)
  Stage::Updating netlist done. (took cpu=0:00:03.7 real=0:00:02.2)
  CCOpt::Phase::Implementation done. (took cpu=0:01:31 real=0:00:38.2)
  CCOpt::Phase::eGRPC...
  eGR Post Conditioning...
    Clock implementation routing...
      Leaving CCOpt scope - Routing Tools...
Net route status summary:
  Clock:       403 (unrouted=394, trialRouted=0, noStatus=0, routed=2, fixed=7, [crossesIlmBoundary=0, tooFewTerms=12, (crossesIlmBoundary AND tooFewTerms=0)])
  Non-clock: 46946 (unrouted=3989, trialRouted=42957, noStatus=0, routed=0, fixed=0, [crossesIlmBoundary=0, tooFewTerms=3895, (crossesIlmBoundary AND tooFewTerms=0)])
      Routing using eGR only...
        Early Global Route - eGR only step...
(ccopt eGR): There are 396 nets to be routed. 0 nets have skip routing designation.
(ccopt eGR): There are 396 nets for routing of which 384 have one or more fixed wires.
(ccopt eGR): Start to route 396 all nets
[PSP]    Started Early Global Route ( Curr Mem: 6.23 MB )
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
[PSP]    Started Early Global Route kernel ( Curr Mem: 6.23 MB )
[NR-eGR] Read 43442 nets ( ignored 43058 )
[NR-eGR] There are 384 clock nets ( 384 with NDR ).
[NR-eGR] Layer group 1: route 202 net(s) in layer range [5, 6]
[NR-eGR] Early Global Route overflow of layer group 1: 0.04% H + 0.09% V. EstWL: 1.435579e+04um
[NR-eGR] Create a new net group with 24 nets and layer range [5, 8]
[NR-eGR] Layer group 2: route 4 net(s) in layer range [4, 5]
[NR-eGR] Early Global Route overflow of layer group 2: 0.21% H + 0.00% V. EstWL: 1.349471e+04um
[NR-eGR] Layer group 3: route 182 net(s) in layer range [3, 4]
[NR-eGR] Early Global Route overflow of layer group 3: 0.01% H + 0.01% V. EstWL: 3.461040e+04um
[NR-eGR] Create a new net group with 11 nets and layer range [3, 6]
[NR-eGR] Layer group 4: route 24 net(s) in layer range [5, 8]
[NR-eGR] Early Global Route overflow of layer group 4: 0.05% H + 0.06% V. EstWL: 3.477593e+04um
[NR-eGR] Create a new net group with 11 nets and layer range [5, 9]
[NR-eGR] Layer group 5: route 11 net(s) in layer range [3, 6]
[NR-eGR] Early Global Route overflow of layer group 5: 0.03% H + 0.03% V. EstWL: 3.630581e+04um
[NR-eGR] Create a new net group with 9 nets and layer range [3, 8]
[NR-eGR] Layer group 6: route 11 net(s) in layer range [5, 9]
[NR-eGR] Early Global Route overflow of layer group 6: 0.03% H + 0.07% V. EstWL: 3.621050e+04um
[NR-eGR] Create a new net group with 5 nets and layer range [3, 9]
[NR-eGR] Layer group 7: route 9 net(s) in layer range [3, 8]
[NR-eGR] Early Global Route overflow of layer group 7: 0.03% H + 0.01% V. EstWL: 3.770862e+04um
[NR-eGR] Move 8 nets to the existing net group with layer range [3, 9]
[NR-eGR] Layer group 8: route 13 net(s) in layer range [3, 9]
[NR-eGR] Early Global Route overflow of layer group 8: 0.01% H + 0.01% V. EstWL: 3.899940e+04um
[NR-eGR] Create a new net group with 9 nets and layer range [2, 9]
[NR-eGR] Layer group 9: route 9 net(s) in layer range [2, 9]
[NR-eGR] Early Global Route overflow of layer group 9: 0.01% H + 0.00% V. EstWL: 4.096567e+04um
[NR-eGR] Overflow after Early Global Route 0.00% H + 0.00% V
[NR-eGR] Total eGR-routed clock nets wire length: 35530um, number of vias: 13442
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR] Report for selected net(s) only.
[NR-eGR]               Length (um)   Vias 
[NR-eGR] ---------------------------------
[NR-eGR]  M1    (1H)             0   4265 
[NR-eGR]  M2    (2V)          2760   4740 
[NR-eGR]  M3    (3H)          9644   3232 
[NR-eGR]  M4    (4V)          9676    509 
[NR-eGR]  M5    (5H)          6768    438 
[NR-eGR]  M6    (6V)          4556    161 
[NR-eGR]  M7    (7H)          1410     87 
[NR-eGR]  M8    (8V)           684     10 
[NR-eGR]  M9    (9H)            32      0 
[NR-eGR]  MRDL  (10V)            0      0 
[NR-eGR] ---------------------------------
[NR-eGR]        Total        35530  13442 
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR] Total half perimeter of net bounding box: 28847um
[NR-eGR] Total length: 35530um, number of vias: 13442
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR] Total routed clock nets wire length: 35530um, number of vias: 13442
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR]               Length (um)    Vias 
[NR-eGR] ----------------------------------
[NR-eGR]  M1    (1H)             0  163391 
[NR-eGR]  M2    (2V)        226727  218726 
[NR-eGR]  M3    (3H)        337227   69106 
[NR-eGR]  M4    (4V)        142569   15756 
[NR-eGR]  M5    (5H)        137463    4464 
[NR-eGR]  M6    (6V)         48347    2311 
[NR-eGR]  M7    (7H)         62530     454 
[NR-eGR]  M8    (8V)          5373     148 
[NR-eGR]  M9    (9H)          6453       2 
[NR-eGR]  MRDL  (10V)            5       0 
[NR-eGR] ----------------------------------
[NR-eGR]        Total       966695  474358 
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR] Total half perimeter of net bounding box: 868845um
[NR-eGR] Total length: 966695um, number of vias: 474358
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR] Finished Early Global Route kernel ( CPU: 7.65 sec, Real: 4.12 sec, Curr Mem: 6.27 MB )
[NR-eGR] Finished Early Global Route ( CPU: 7.66 sec, Real: 4.14 sec, Curr Mem: 6.23 MB )
        Early Global Route - eGR only step done. (took cpu=0:00:07.9 real=0:00:04.4)
      Routing using eGR only done.
Net route status summary:
  Clock:       403 (unrouted=12, trialRouted=0, noStatus=0, routed=384, fixed=7, [crossesIlmBoundary=0, tooFewTerms=12, (crossesIlmBoundary AND tooFewTerms=0)])
  Non-clock: 46946 (unrouted=3989, trialRouted=42957, noStatus=0, routed=0, fixed=0, [crossesIlmBoundary=0, tooFewTerms=3895, (crossesIlmBoundary AND tooFewTerms=0)])

CCOPT: Done with clock implementation routing.

      Leaving CCOpt scope - Routing Tools done. (took cpu=0:00:08.2 real=0:00:04.6)
    Clock implementation routing done.
    Leaving CCOpt scope - extractRC...
    Updating RC parasitics by calling: "extractRC -noRouteCheck"...
**WARN: (IMPEXT-6191):	Using a captable file is not recommended for process nodes less than or equal to 32 nm due to parasitic accuracy concerns. The Quantus QRC technology file should be specified for all RC corners using the command create_rc_corner or update_rc_corner, which will then be used for preRoute and postRoute(effort level medium or high or signoff) extraction engines.
Type 'man IMPEXT-6191' for more detail.
Extraction called for design 'ORCA_TOP' of instances=40909 and nets=47349 using extraction engine 'preRoute' .
PreRoute RC Extraction called for design ORCA_TOP.
RC Extraction called in multi-corner(2) mode.
RCMode: PreRoute
      RC Corner Indexes            0       1   
Capacitance Scaling Factor   : 1.00000 1.00000 
Resistance Scaling Factor    : 1.00000 1.00000 
Clock Cap. Scaling Factor    : 1.00000 1.00000 
Clock Res. Scaling Factor    : 1.00000 1.00000 
Shrink Factor                : 1.00000
PreRoute extraction is honoring NDR/Shielding/ExtraSpace for clock nets.
Using capacitance table file ...
Updating RC Grid density data for preRoute extraction ...
Initializing multi-corner capacitance tables ... 
Initializing multi-corner resistance tables ...
PreRoute RC Extraction DONE (CPU Time: 0:00:01.6  Real Time: 0:00:01.0  MEM: 6629.109M)
    Updating RC parasitics by calling: "extractRC -noRouteCheck" done.
    Leaving CCOpt scope - extractRC done. (took cpu=0:00:01.6 real=0:00:01.6)
    Leaving CCOpt scope - Initializing placement interface...

    Leaving CCOpt scope - Initializing placement interface done. (took cpu=0:00:00.3 real=0:00:00.3)
    Found 17 placement violations.
    Calling post conditioning for eGRPC...
      eGRPC...
        eGRPC active optimizations:
         - Move Down
         - Downsizing before DRV sizing
         - DRV fixing with sizing
         - Move to fanout
         - Cloning
        
        Currently running CTS, using active skew data
        Loading clock net RC data...
        Preprocessing clock nets...
        Nets initialized for optimization: Seen: 403 Attempted: 403 Successful: 384 Unsuccessful: 19 Invalid: 0
        Preprocessing clock nets done. (took cpu=0:00:00.1 real=0:00:00.1)
        Loading clock net RC data done. (took cpu=0:00:00.1 real=0:00:00.1)
        ProEngine running disconnected to DB
        Disconnecting...
        Disconnecting Clock Trees
        Disconnecting done. (took cpu=0:00:00.0 real=0:00:00.0)
        Reset bufferability constraints...
        Resetting previous bufferability status on all nets so that eGRPC will attempt to fix all clock tree violations.
        Clock tree timing engine global stage delay update for worst_corner:setup.late...
        Clock tree timing engine global stage delay update for worst_corner:setup.late done. (took cpu=0:00:00.4 real=0:00:00.1)
        Reset bufferability constraints done. (took cpu=0:00:00.4 real=0:00:00.1)
        Clock DAG stats eGRPC initial state:
          cell counts      : b=0, i=314, icg=30, dcg=0, l=39, total=383
          sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
          misc counts      : r=20, pp=1, mci=38
          cell areas       : b=0.000um^2, i=819.869um^2, icg=196.707um^2, dcg=0.000um^2, l=112.586um^2, total=1129.162um^2
          cell capacitance : b=0.000fF, i=1323.068fF, icg=21.175fF, dcg=0.000fF, l=39.769fF, total=1384.012fF
          sink capacitance : total=2688.728fF, avg=0.765fF, sd=0.890fF, min=0.000fF, max=10.000fF
          wire capacitance : top=332.158fF, trunk=1303.411fF, leaf=2055.107fF, total=3690.675fF
          wire lengths     : top=3665.489um, trunk=14367.481um, leaf=21162.791um, total=39195.761um
          hp wire lengths  : top=2584.456um, trunk=12566.144um, leaf=15068.164um, total=30218.764um
        Clock DAG net violations eGRPC initial state:
          Remaining Transition : {count=2, worst=[0.003ns, 0.002ns]} avg=0.002ns sd=0.001ns sum=0.005ns
          Capacitance          : {count=12, worst=[11.447fF, 2.784fF, 2.486fF, 1.597fF, 0.802fF, 0.467fF, 0.420fF, 0.390fF, 0.376fF, 0.223fF, ...]} avg=1.781fF sd=3.175fF sum=21.374fF
        Clock DAG primary half-corner transition distribution eGRPC initial state:
          Top   : target=0.243ns count=7 avg=0.107ns sd=0.033ns min=0.087ns max=0.181ns {6 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
          Trunk : target=0.075ns count=1 avg=0.048ns sd=0.000ns min=0.048ns max=0.048ns {0 <= 0.045ns, 1 <= 0.060ns, 0 <= 0.068ns, 0 <= 0.071ns, 0 <= 0.075ns}
          Trunk : target=0.078ns count=1 avg=0.028ns sd=0.000ns min=0.028ns max=0.028ns {1 <= 0.047ns, 0 <= 0.062ns, 0 <= 0.070ns, 0 <= 0.074ns, 0 <= 0.078ns}
          Trunk : target=0.177ns count=5 avg=0.081ns sd=0.019ns min=0.057ns max=0.103ns {5 <= 0.106ns, 0 <= 0.141ns, 0 <= 0.159ns, 0 <= 0.168ns, 0 <= 0.177ns}
          Trunk : target=0.180ns count=2 avg=0.083ns sd=0.014ns min=0.073ns max=0.093ns {2 <= 0.108ns, 0 <= 0.144ns, 0 <= 0.162ns, 0 <= 0.171ns, 0 <= 0.180ns}
          Trunk : target=0.184ns count=7 avg=0.122ns sd=0.018ns min=0.110ns max=0.160ns {2 <= 0.111ns, 4 <= 0.148ns, 1 <= 0.166ns, 0 <= 0.175ns, 0 <= 0.184ns}
          Trunk : target=0.209ns count=2 avg=0.070ns sd=0.007ns min=0.065ns max=0.075ns {2 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
          Trunk : target=0.235ns count=3 avg=0.112ns sd=0.036ns min=0.071ns max=0.139ns {3 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
          Trunk : target=0.241ns count=1 avg=0.096ns sd=0.000ns min=0.096ns max=0.096ns {1 <= 0.144ns, 0 <= 0.192ns, 0 <= 0.217ns, 0 <= 0.229ns, 0 <= 0.241ns}
          Trunk : target=0.243ns count=196 avg=0.074ns sd=0.040ns min=0.000ns max=0.191ns {188 <= 0.146ns, 8 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
          Leaf  : target=0.078ns count=12 avg=0.062ns sd=0.012ns min=0.040ns max=0.076ns {2 <= 0.047ns, 3 <= 0.062ns, 4 <= 0.070ns, 2 <= 0.074ns, 1 <= 0.078ns}
          Leaf  : target=0.110ns count=3 avg=0.081ns sd=0.000ns min=0.081ns max=0.082ns {0 <= 0.066ns, 3 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
          Leaf  : target=0.209ns count=1 avg=0.060ns sd=0.000ns min=0.060ns max=0.060ns {1 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
          Leaf  : target=0.243ns count=178 avg=0.094ns sd=0.054ns min=0.034ns max=0.246ns {162 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 13 <= 0.243ns} {2 <= 0.255ns, 0 <= 0.267ns, 0 <= 0.292ns, 0 <= 0.364ns, 0 > 0.364ns}
        Clock DAG library cell distribution eGRPC initial state {count}:
           Invs: INVX16_LVT: 50 INVX8_LVT: 83 INVX4_LVT: 72 INVX2_LVT: 109 
           ICGs: CGLNPRX8_LVT: 7 CGLPPRX8_LVT: 3 CGLNPRX2_LVT: 5 CGLPPRX2_LVT: 15 
         Logics: LSUPX8_LVT: 1 AO21X2_LVT: 3 AO22X2_RVT: 16 AO21X1_LVT: 3 AO22X1_RVT: 16 
        Primary reporting skew groups eGRPC initial state:
          skew_group SDRAM_CLK/func_best_mode: insertion delay [min=1.351, max=1.435, avg=1.416, sd=0.014, skn=-1.925, kur=4.425], skew [0.085 vs 0.085], 100% {1.351, 1.435} (wid=0.106 ws=0.070) (gid=1.396 gs=0.128)
        Skew group summary eGRPC initial state:
          skew_group PCI_CLK/func_best_mode: insertion delay [min=0.769, max=0.830, avg=0.789, sd=0.021, skn=0.960, kur=-0.863], skew [0.061 vs 0.085], 100% {0.769, 0.830} (wid=0.029 ws=0.023) (gid=0.818 gs=0.066)
          skew_group SDRAM_CLK/func_best_mode: insertion delay [min=1.351, max=1.435, avg=1.416, sd=0.014, skn=-1.925, kur=4.425], skew [0.085 vs 0.085], 100% {1.351, 1.435} (wid=0.106 ws=0.070) (gid=1.396 gs=0.128)
          skew_group SYS_2x_CLK/func_best_mode: insertion delay [min=0.807, max=0.891, avg=0.862, sd=0.024, skn=-1.029, kur=0.030], skew [0.084 vs 0.086], 100% {0.807, 0.891} (wid=0.016 ws=0.015) (gid=0.890 gs=0.086)
          skew_group SYS_2x_CLK/func_worst_mode: insertion delay [min=0.807, max=0.891, avg=0.820, sd=0.025, skn=2.710, kur=6.378], skew [0.084 vs 0.086], 100% {0.807, 0.891} (wid=0.011 ws=0.010) (gid=0.890 gs=0.086)
          skew_group ate_clk/test_best_mode: insertion delay [min=0.967, max=1.056, avg=1.029, sd=0.018, skn=-1.272, kur=0.964], skew [0.089 vs 0.085*], 100% {0.975, 1.056} (wid=0.062 ws=0.060) (gid=1.049 gs=0.118)
          skew_group ate_clk/test_worst_mode: insertion delay [min=0.967, max=1.056, avg=1.029, sd=0.017, skn=-1.293, kur=0.953], skew [0.089 vs 0.085*], 100% {0.975, 1.056} (wid=0.062 ws=0.059) (gid=1.049 gs=0.118)
        eGRPC Moving buffers...
          Violation analysis...
          Violation analysis done. (took cpu=0:00:00.1 real=0:00:00.1)
          Moving buffers down: ...20% ...40% ...60% ...80% ...100% 
          
            Nodes to move:         3
            Processed:             3
            Moved (slew improved): 0
            Moved (slew fixed):    1
            Not moved:             2
          Clock DAG stats after 'eGRPC Moving buffers':
            cell counts      : b=0, i=314, icg=30, dcg=0, l=39, total=383
            sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
            misc counts      : r=20, pp=1, mci=38
            cell areas       : b=0.000um^2, i=819.869um^2, icg=196.707um^2, dcg=0.000um^2, l=112.586um^2, total=1129.162um^2
            cell capacitance : b=0.000fF, i=1323.068fF, icg=21.175fF, dcg=0.000fF, l=39.769fF, total=1384.012fF
            sink capacitance : total=2688.728fF, avg=0.765fF, sd=0.890fF, min=0.000fF, max=10.000fF
            wire capacitance : top=332.158fF, trunk=1303.753fF, leaf=2055.107fF, total=3691.018fF
            wire lengths     : top=3665.489um, trunk=14367.481um, leaf=21162.791um, total=39195.761um
            hp wire lengths  : top=2584.456um, trunk=12556.112um, leaf=15068.164um, total=30208.732um
          Clock DAG net violations after 'eGRPC Moving buffers':
            Remaining Transition : {count=2, worst=[0.003ns, 0.002ns]} avg=0.002ns sd=0.001ns sum=0.005ns
            Capacitance          : {count=11, worst=[11.447fF, 2.784fF, 2.486fF, 0.802fF, 0.467fF, 0.420fF, 0.390fF, 0.376fF, 0.223fF, 0.195fF, ...]} avg=1.798fF sd=3.330fF sum=19.777fF
          Clock DAG primary half-corner transition distribution after 'eGRPC Moving buffers':
            Top   : target=0.243ns count=7 avg=0.107ns sd=0.033ns min=0.087ns max=0.181ns {6 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
            Trunk : target=0.075ns count=1 avg=0.048ns sd=0.000ns min=0.048ns max=0.048ns {0 <= 0.045ns, 1 <= 0.060ns, 0 <= 0.068ns, 0 <= 0.071ns, 0 <= 0.075ns}
            Trunk : target=0.078ns count=1 avg=0.028ns sd=0.000ns min=0.028ns max=0.028ns {1 <= 0.047ns, 0 <= 0.062ns, 0 <= 0.070ns, 0 <= 0.074ns, 0 <= 0.078ns}
            Trunk : target=0.177ns count=5 avg=0.081ns sd=0.019ns min=0.057ns max=0.103ns {5 <= 0.106ns, 0 <= 0.141ns, 0 <= 0.159ns, 0 <= 0.168ns, 0 <= 0.177ns}
            Trunk : target=0.180ns count=2 avg=0.083ns sd=0.014ns min=0.073ns max=0.093ns {2 <= 0.108ns, 0 <= 0.144ns, 0 <= 0.162ns, 0 <= 0.171ns, 0 <= 0.180ns}
            Trunk : target=0.184ns count=7 avg=0.122ns sd=0.018ns min=0.110ns max=0.160ns {2 <= 0.111ns, 4 <= 0.148ns, 1 <= 0.166ns, 0 <= 0.175ns, 0 <= 0.184ns}
            Trunk : target=0.209ns count=2 avg=0.070ns sd=0.007ns min=0.065ns max=0.075ns {2 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
            Trunk : target=0.235ns count=3 avg=0.112ns sd=0.036ns min=0.071ns max=0.139ns {3 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
            Trunk : target=0.241ns count=1 avg=0.096ns sd=0.000ns min=0.096ns max=0.096ns {1 <= 0.144ns, 0 <= 0.192ns, 0 <= 0.217ns, 0 <= 0.229ns, 0 <= 0.241ns}
            Trunk : target=0.243ns count=196 avg=0.074ns sd=0.040ns min=0.000ns max=0.191ns {189 <= 0.146ns, 7 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
            Leaf  : target=0.078ns count=12 avg=0.062ns sd=0.012ns min=0.040ns max=0.076ns {2 <= 0.047ns, 3 <= 0.062ns, 4 <= 0.070ns, 2 <= 0.074ns, 1 <= 0.078ns}
            Leaf  : target=0.110ns count=3 avg=0.081ns sd=0.000ns min=0.081ns max=0.082ns {0 <= 0.066ns, 3 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
            Leaf  : target=0.209ns count=1 avg=0.060ns sd=0.000ns min=0.060ns max=0.060ns {1 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
            Leaf  : target=0.243ns count=178 avg=0.094ns sd=0.054ns min=0.034ns max=0.246ns {162 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 13 <= 0.243ns} {2 <= 0.255ns, 0 <= 0.267ns, 0 <= 0.292ns, 0 <= 0.364ns, 0 > 0.364ns}
          Clock DAG library cell distribution after 'eGRPC Moving buffers' {count}:
             Invs: INVX16_LVT: 50 INVX8_LVT: 83 INVX4_LVT: 72 INVX2_LVT: 109 
             ICGs: CGLNPRX8_LVT: 7 CGLPPRX8_LVT: 3 CGLNPRX2_LVT: 5 CGLPPRX2_LVT: 15 
           Logics: LSUPX8_LVT: 1 AO21X2_LVT: 3 AO22X2_RVT: 16 AO21X1_LVT: 3 AO22X1_RVT: 16 
          Primary reporting skew groups after 'eGRPC Moving buffers':
            skew_group SDRAM_CLK/func_best_mode: insertion delay [min=1.351, max=1.435], skew [0.085 vs 0.085]
          Skew group summary after 'eGRPC Moving buffers':
            skew_group PCI_CLK/func_best_mode: insertion delay [min=0.769, max=0.830], skew [0.061 vs 0.085]
            skew_group SDRAM_CLK/func_best_mode: insertion delay [min=1.351, max=1.435], skew [0.085 vs 0.085]
            skew_group SYS_2x_CLK/func_best_mode: insertion delay [min=0.807, max=0.891], skew [0.084 vs 0.086]
            skew_group SYS_2x_CLK/func_worst_mode: insertion delay [min=0.807, max=0.891], skew [0.084 vs 0.086]
            skew_group ate_clk/test_best_mode: insertion delay [min=0.967, max=1.056], skew [0.089 vs 0.085*]
            skew_group ate_clk/test_worst_mode: insertion delay [min=0.967, max=1.056], skew [0.089 vs 0.085*]
          Legalizer API calls during this step: 7 succeeded with high effort: 7 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
        eGRPC Moving buffers done. (took cpu=0:00:00.2 real=0:00:00.2)
        eGRPC Initial Pass of Downsizing Clock Tree cells...
          Modifying slew-target multiplier from 1 to 0.9
          Artificially removing short and long paths...
            For skew group ate_clk/test_best_mode, artificially shortened or lengthened 1 paths.
            	The smallest offset applied was -0.008ns.
            	The largest offset applied was -0.008ns.
            
            For skew group ate_clk/test_worst_mode, artificially shortened or lengthened 1 paths.
            	The smallest offset applied was -0.008ns.
            	The largest offset applied was -0.008ns.
            
            Legalizer API calls during this step: 0 succeeded with high effort: 0 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
          Artificially removing short and long paths done. (took cpu=0:00:00.1 real=0:00:00.1)
          Downsizing prefiltering...
          Downsizing prefiltering done.
          Prefiltering Summary : numPassedPreFiltering = 331, numSkippedDueToCloseToSlewTarget = 33, numSkippedDueToCloseToSkewTarget = 39
          Downsizing Pass 0...
          Resizing gates: ...20% ...40% ...60% ...80% ...100% 
          Downsizing Pass 0 done. (took cpu=0:00:04.5 real=0:00:01.8)
          Downsizing Pass Summary 0, attempted = 294, resized = 20, running total = 20
          Downsizing Pass 1...
          Resizing gates: ...20% ...40% ...60% ...80% ...100% 
          Downsizing Pass 1 done. (took cpu=0:00:01.1 real=0:00:00.5)
          Downsizing Pass Summary 1, attempted = 39, resized = 1, running total = 21
          Downsizing Pass 2...
          Resizing gates: ...20% ...40% ...60% ...80% ...100% 
          Downsizing Pass 2 done. (took cpu=0:00:00.0 real=0:00:00.0)
          Downsizing Pass Summary 2, attempted = 2, resized = 0, running total = 21
          DoDownSizing Summary : numSized = 21
          Reverting Artificially removing short and long paths...
            Legalizer API calls during this step: 0 succeeded with high effort: 0 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
          Reverting Artificially removing short and long paths done. (took cpu=0:00:00.0 real=0:00:00.0)
          Reverting slew-target multiplier from 0.9 to 1
          Clock DAG stats after 'eGRPC Initial Pass of Downsizing Clock Tree cells':
            cell counts      : b=0, i=314, icg=30, dcg=0, l=39, total=383
            sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
            misc counts      : r=20, pp=1, mci=38
            cell areas       : b=0.000um^2, i=789.371um^2, icg=196.707um^2, dcg=0.000um^2, l=112.586um^2, total=1098.665um^2
            cell capacitance : b=0.000fF, i=1244.838fF, icg=21.175fF, dcg=0.000fF, l=39.769fF, total=1305.782fF
            sink capacitance : total=2688.728fF, avg=0.765fF, sd=0.890fF, min=0.000fF, max=10.000fF
            wire capacitance : top=332.158fF, trunk=1303.753fF, leaf=2055.107fF, total=3691.018fF
            wire lengths     : top=3665.489um, trunk=14367.481um, leaf=21162.791um, total=39195.761um
            hp wire lengths  : top=2584.456um, trunk=12559.912um, leaf=15071.356um, total=30215.724um
          Clock DAG net violations after 'eGRPC Initial Pass of Downsizing Clock Tree cells':
            Remaining Transition : {count=2, worst=[0.003ns, 0.002ns]} avg=0.002ns sd=0.001ns sum=0.005ns
            Capacitance          : {count=11, worst=[11.447fF, 2.784fF, 2.486fF, 0.802fF, 0.467fF, 0.420fF, 0.390fF, 0.376fF, 0.223fF, 0.195fF, ...]} avg=1.798fF sd=3.330fF sum=19.777fF
          Clock DAG primary half-corner transition distribution after 'eGRPC Initial Pass of Downsizing Clock Tree cells':
            Top   : target=0.243ns count=7 avg=0.107ns sd=0.033ns min=0.087ns max=0.181ns {6 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
            Trunk : target=0.075ns count=1 avg=0.048ns sd=0.000ns min=0.048ns max=0.048ns {0 <= 0.045ns, 1 <= 0.060ns, 0 <= 0.068ns, 0 <= 0.071ns, 0 <= 0.075ns}
            Trunk : target=0.078ns count=1 avg=0.028ns sd=0.000ns min=0.028ns max=0.028ns {1 <= 0.047ns, 0 <= 0.062ns, 0 <= 0.070ns, 0 <= 0.074ns, 0 <= 0.078ns}
            Trunk : target=0.177ns count=5 avg=0.076ns sd=0.020ns min=0.057ns max=0.103ns {5 <= 0.106ns, 0 <= 0.141ns, 0 <= 0.159ns, 0 <= 0.168ns, 0 <= 0.177ns}
            Trunk : target=0.180ns count=2 avg=0.083ns sd=0.014ns min=0.073ns max=0.093ns {2 <= 0.108ns, 0 <= 0.144ns, 0 <= 0.162ns, 0 <= 0.171ns, 0 <= 0.180ns}
            Trunk : target=0.184ns count=7 avg=0.122ns sd=0.018ns min=0.110ns max=0.160ns {2 <= 0.111ns, 4 <= 0.148ns, 1 <= 0.166ns, 0 <= 0.175ns, 0 <= 0.184ns}
            Trunk : target=0.209ns count=2 avg=0.061ns sd=0.005ns min=0.058ns max=0.065ns {2 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
            Trunk : target=0.235ns count=3 avg=0.109ns sd=0.041ns min=0.062ns max=0.139ns {3 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
            Trunk : target=0.241ns count=1 avg=0.096ns sd=0.000ns min=0.096ns max=0.096ns {1 <= 0.144ns, 0 <= 0.192ns, 0 <= 0.217ns, 0 <= 0.229ns, 0 <= 0.241ns}
            Trunk : target=0.243ns count=196 avg=0.074ns sd=0.039ns min=0.000ns max=0.191ns {189 <= 0.146ns, 7 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
            Leaf  : target=0.078ns count=12 avg=0.062ns sd=0.012ns min=0.040ns max=0.076ns {2 <= 0.047ns, 3 <= 0.062ns, 4 <= 0.070ns, 2 <= 0.074ns, 1 <= 0.078ns}
            Leaf  : target=0.110ns count=3 avg=0.081ns sd=0.000ns min=0.081ns max=0.082ns {0 <= 0.066ns, 3 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
            Leaf  : target=0.209ns count=1 avg=0.060ns sd=0.000ns min=0.060ns max=0.060ns {1 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
            Leaf  : target=0.243ns count=178 avg=0.097ns sd=0.054ns min=0.034ns max=0.246ns {162 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 13 <= 0.243ns} {2 <= 0.255ns, 0 <= 0.267ns, 0 <= 0.292ns, 0 <= 0.364ns, 0 > 0.364ns}
          Clock DAG library cell distribution after 'eGRPC Initial Pass of Downsizing Clock Tree cells' {count}:
             Invs: INVX16_LVT: 40 INVX8_LVT: 84 INVX4_LVT: 79 INVX2_LVT: 111 
             ICGs: CGLNPRX8_LVT: 7 CGLPPRX8_LVT: 3 CGLNPRX2_LVT: 5 CGLPPRX2_LVT: 15 
           Logics: LSUPX8_LVT: 1 AO21X2_LVT: 3 AO22X2_RVT: 16 AO21X1_LVT: 3 AO22X1_RVT: 16 
          Primary reporting skew groups after 'eGRPC Initial Pass of Downsizing Clock Tree cells':
            skew_group SDRAM_CLK/func_best_mode: insertion delay [min=1.351, max=1.434], skew [0.084 vs 0.085]
          Skew group summary after 'eGRPC Initial Pass of Downsizing Clock Tree cells':
            skew_group PCI_CLK/func_best_mode: insertion delay [min=0.769, max=0.830], skew [0.061 vs 0.085]
            skew_group SDRAM_CLK/func_best_mode: insertion delay [min=1.351, max=1.434], skew [0.084 vs 0.085]
            skew_group SYS_2x_CLK/func_best_mode: insertion delay [min=0.807, max=0.891], skew [0.084 vs 0.086]
            skew_group SYS_2x_CLK/func_worst_mode: insertion delay [min=0.807, max=0.891], skew [0.084 vs 0.086]
            skew_group ate_clk/test_best_mode: insertion delay [min=0.967, max=1.056], skew [0.088 vs 0.085*]
            skew_group ate_clk/test_worst_mode: insertion delay [min=0.967, max=1.052], skew [0.085 vs 0.085]
          Legalizer API calls during this step: 466 succeeded with high effort: 466 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
        eGRPC Initial Pass of Downsizing Clock Tree cells done. (took cpu=0:00:05.9 real=0:00:02.6)
        eGRPC Fixing DRVs...
          Fixing clock tree DRVs: ...20% ...40% ...60% ...80% **WARN: (IMPCCOPT-2256):	CCOpt post-route optimization found legalization moved inst 'null' before optimization. Moved 1.216um, from (7.600,359.480), N (0) to (8.816,359.480), N (0).
...100% 
          CCOpt-eGRPC: considered: 403, tested: 403, violation detected: 13, violation ignored (due to small violation): 0, cannot run: 1, attempted: 12, unsuccessful: 0, sized: 5
          
          Statistics: Fix DRVs (cell sizing):
          ===================================
          
          Cell changes by Net Type:
          
          ---------------------------------------------------------------------------------------------------------------------------
          Net Type    Attempted            Upsized             Downsized    Swapped Same Size    Total Changed       Not Sized
          ---------------------------------------------------------------------------------------------------------------------------
          top                0                    0                   0            0                    0                   0
          trunk              3 [25.0%]            1 (33.3%)           0            0                    1 (33.3%)           2 (66.7%)
          leaf               9 [75.0%]            4 (44.4%)           0            0                    4 (44.4%)           5 (55.6%)
          ---------------------------------------------------------------------------------------------------------------------------
          Total             12 [100.0%]           5 (41.7%)           0            0                    5 (41.7%)           7 (58.3%)
          ---------------------------------------------------------------------------------------------------------------------------
          
          Upsized: 5, Downsized: 0, Sized but same area: 0, Unchanged: 7, Area change: 4.066um^2 (0.370%)
          Max. move: 0.456um (CTS_ccl_a_inv_00240 and 2 others), Min. move: 0.000um, Avg. move: 0.038um
          
          Clock DAG stats after 'eGRPC Fixing DRVs':
            cell counts      : b=0, i=314, icg=30, dcg=0, l=39, total=383
            sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
            misc counts      : r=20, pp=1, mci=38
            cell areas       : b=0.000um^2, i=793.438um^2, icg=196.707um^2, dcg=0.000um^2, l=112.586um^2, total=1102.731um^2
            cell capacitance : b=0.000fF, i=1255.239fF, icg=21.175fF, dcg=0.000fF, l=39.769fF, total=1316.183fF
            sink capacitance : total=2688.728fF, avg=0.765fF, sd=0.890fF, min=0.000fF, max=10.000fF
            wire capacitance : top=332.158fF, trunk=1303.753fF, leaf=2055.107fF, total=3691.018fF
            wire lengths     : top=3665.489um, trunk=14367.481um, leaf=21162.791um, total=39195.761um
            hp wire lengths  : top=2584.456um, trunk=12559.912um, leaf=15071.356um, total=30215.724um
          Clock DAG net violations after 'eGRPC Fixing DRVs':
            Remaining Transition : {count=2, worst=[0.003ns, 0.002ns]} avg=0.003ns sd=0.001ns sum=0.005ns
            Capacitance          : {count=6, worst=[11.447fF, 0.467fF, 0.420fF, 0.390fF, 0.195fF, 0.186fF]} avg=2.184fF sd=4.539fF sum=13.105fF
          Clock DAG primary half-corner transition distribution after 'eGRPC Fixing DRVs':
            Top   : target=0.243ns count=7 avg=0.107ns sd=0.033ns min=0.087ns max=0.181ns {6 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
            Trunk : target=0.075ns count=1 avg=0.048ns sd=0.000ns min=0.048ns max=0.048ns {0 <= 0.045ns, 1 <= 0.060ns, 0 <= 0.068ns, 0 <= 0.071ns, 0 <= 0.075ns}
            Trunk : target=0.078ns count=1 avg=0.028ns sd=0.000ns min=0.028ns max=0.028ns {1 <= 0.047ns, 0 <= 0.062ns, 0 <= 0.070ns, 0 <= 0.074ns, 0 <= 0.078ns}
            Trunk : target=0.177ns count=5 avg=0.076ns sd=0.020ns min=0.057ns max=0.103ns {5 <= 0.106ns, 0 <= 0.141ns, 0 <= 0.159ns, 0 <= 0.168ns, 0 <= 0.177ns}
            Trunk : target=0.180ns count=2 avg=0.083ns sd=0.014ns min=0.073ns max=0.093ns {2 <= 0.108ns, 0 <= 0.144ns, 0 <= 0.162ns, 0 <= 0.171ns, 0 <= 0.180ns}
            Trunk : target=0.184ns count=7 avg=0.122ns sd=0.018ns min=0.110ns max=0.160ns {2 <= 0.111ns, 4 <= 0.148ns, 1 <= 0.166ns, 0 <= 0.175ns, 0 <= 0.184ns}
            Trunk : target=0.209ns count=2 avg=0.061ns sd=0.005ns min=0.058ns max=0.065ns {2 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
            Trunk : target=0.235ns count=3 avg=0.109ns sd=0.041ns min=0.062ns max=0.139ns {3 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
            Trunk : target=0.241ns count=1 avg=0.096ns sd=0.000ns min=0.096ns max=0.096ns {1 <= 0.144ns, 0 <= 0.192ns, 0 <= 0.217ns, 0 <= 0.229ns, 0 <= 0.241ns}
            Trunk : target=0.243ns count=196 avg=0.073ns sd=0.039ns min=0.000ns max=0.191ns {190 <= 0.146ns, 6 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
            Leaf  : target=0.078ns count=12 avg=0.062ns sd=0.012ns min=0.040ns max=0.076ns {2 <= 0.047ns, 3 <= 0.062ns, 4 <= 0.070ns, 2 <= 0.074ns, 1 <= 0.078ns}
            Leaf  : target=0.110ns count=3 avg=0.081ns sd=0.000ns min=0.081ns max=0.082ns {0 <= 0.066ns, 3 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
            Leaf  : target=0.209ns count=1 avg=0.060ns sd=0.000ns min=0.060ns max=0.060ns {1 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
            Leaf  : target=0.243ns count=178 avg=0.095ns sd=0.054ns min=0.034ns max=0.246ns {163 <= 0.146ns, 0 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 13 <= 0.243ns} {2 <= 0.255ns, 0 <= 0.267ns, 0 <= 0.292ns, 0 <= 0.364ns, 0 > 0.364ns}
          Clock DAG library cell distribution after 'eGRPC Fixing DRVs' {count}:
             Invs: INVX16_LVT: 40 INVX8_LVT: 87 INVX4_LVT: 78 INVX2_LVT: 109 
             ICGs: CGLNPRX8_LVT: 7 CGLPPRX8_LVT: 3 CGLNPRX2_LVT: 5 CGLPPRX2_LVT: 15 
           Logics: LSUPX8_LVT: 1 AO21X2_LVT: 3 AO22X2_RVT: 16 AO21X1_LVT: 3 AO22X1_RVT: 16 
          Primary reporting skew groups after 'eGRPC Fixing DRVs':
            skew_group SDRAM_CLK/func_best_mode: insertion delay [min=1.351, max=1.434], skew [0.084 vs 0.085]
          Skew group summary after 'eGRPC Fixing DRVs':
            skew_group PCI_CLK/func_best_mode: insertion delay [min=0.769, max=0.830], skew [0.061 vs 0.085]
            skew_group SDRAM_CLK/func_best_mode: insertion delay [min=1.351, max=1.434], skew [0.084 vs 0.085]
            skew_group SYS_2x_CLK/func_best_mode: insertion delay [min=0.807, max=0.891], skew [0.084 vs 0.086]
            skew_group SYS_2x_CLK/func_worst_mode: insertion delay [min=0.807, max=0.891], skew [0.084 vs 0.086]
            skew_group ate_clk/test_best_mode: insertion delay [min=0.967, max=1.056], skew [0.088 vs 0.085*]
            skew_group ate_clk/test_worst_mode: insertion delay [min=0.967, max=1.052], skew [0.085 vs 0.085]
          Legalizer API calls during this step: 28 succeeded with high effort: 28 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
        eGRPC Fixing DRVs done. (took cpu=0:00:00.3 real=0:00:00.3)
        Reconnecting optimized routes...
        Reset timing graph...
Ignoring AAE DB Resetting ...
        Reset timing graph done.
        Reconnecting optimized routes done. (took cpu=0:00:01.0 real=0:00:01.0)
        Violation analysis...
        Violation analysis done. (took cpu=0:00:00.5 real=0:00:00.3)
        Moving clock insts towards fanout...
        Move to sink centre: considered=4, unsuccessful=0, alreadyClose=0, noImprovementFound=4, degradedSlew=0, degradedSkew=0, insufficientImprovement=0, accepted=0
        Moving clock insts towards fanout done. (took cpu=0:00:00.3 real=0:00:00.3)
        Cloning clock nodes to reduce slew violations....
        Cloning results : Attempted = 4, succeeded = 4, unsuccessful = 0, skipped = 0, ignored = 0
        Cloning attempts on buffers = 0, inverters = 4, gates = 0, logic = 0, other = 0
        Cloning successes on buffers = 0, inverters = 4, gates = 0, logic = 0, other = 0
        Cloning clock nodes to reduce slew violations. done. (took cpu=0:00:00.1 real=0:00:00.1)
        Reset timing graph...
Ignoring AAE DB Resetting ...
        Reset timing graph done.
        Clock DAG stats before routing clock trees:
          cell counts      : b=0, i=318, icg=30, dcg=0, l=39, total=387
          sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
          misc counts      : r=20, pp=1, mci=38
          cell areas       : b=0.000um^2, i=801.570um^2, icg=196.707um^2, dcg=0.000um^2, l=112.586um^2, total=1110.863um^2
          cell capacitance : b=0.000fF, i=1266.148fF, icg=21.175fF, dcg=0.000fF, l=39.769fF, total=1327.092fF
          sink capacitance : total=2688.728fF, avg=0.765fF, sd=0.890fF, min=0.000fF, max=10.000fF
          wire capacitance : top=332.158fF, trunk=1302.107fF, leaf=2060.328fF, total=3694.593fF
          wire lengths     : top=3665.489um, trunk=14369.612um, leaf=21223.585um, total=39258.686um
          hp wire lengths  : top=2584.456um, trunk=12572.528um, leaf=15201.164um, total=30358.148um
        Clock DAG net violations before routing clock trees:
          Remaining Transition : {count=2, worst=[0.003ns, 0.002ns]} avg=0.003ns sd=0.001ns sum=0.005ns
          Capacitance          : {count=3, worst=[11.447fF, 1.212fF, 0.390fF]} avg=4.350fF sd=6.160fF sum=13.049fF
        Clock DAG primary half-corner transition distribution before routing clock trees:
          Top   : target=0.243ns count=7 avg=0.107ns sd=0.033ns min=0.087ns max=0.181ns {6 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
          Trunk : target=0.075ns count=1 avg=0.048ns sd=0.000ns min=0.048ns max=0.048ns {0 <= 0.045ns, 1 <= 0.060ns, 0 <= 0.068ns, 0 <= 0.071ns, 0 <= 0.075ns}
          Trunk : target=0.078ns count=1 avg=0.028ns sd=0.000ns min=0.028ns max=0.028ns {1 <= 0.047ns, 0 <= 0.062ns, 0 <= 0.070ns, 0 <= 0.074ns, 0 <= 0.078ns}
          Trunk : target=0.177ns count=5 avg=0.076ns sd=0.020ns min=0.057ns max=0.103ns {5 <= 0.106ns, 0 <= 0.141ns, 0 <= 0.159ns, 0 <= 0.168ns, 0 <= 0.177ns}
          Trunk : target=0.180ns count=2 avg=0.083ns sd=0.014ns min=0.073ns max=0.093ns {2 <= 0.108ns, 0 <= 0.144ns, 0 <= 0.162ns, 0 <= 0.171ns, 0 <= 0.180ns}
          Trunk : target=0.184ns count=7 avg=0.122ns sd=0.018ns min=0.110ns max=0.160ns {2 <= 0.111ns, 4 <= 0.148ns, 1 <= 0.166ns, 0 <= 0.175ns, 0 <= 0.184ns}
          Trunk : target=0.209ns count=2 avg=0.061ns sd=0.005ns min=0.058ns max=0.065ns {2 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
          Trunk : target=0.235ns count=3 avg=0.109ns sd=0.041ns min=0.062ns max=0.139ns {3 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
          Trunk : target=0.241ns count=1 avg=0.096ns sd=0.000ns min=0.096ns max=0.096ns {1 <= 0.144ns, 0 <= 0.192ns, 0 <= 0.217ns, 0 <= 0.229ns, 0 <= 0.241ns}
          Trunk : target=0.243ns count=197 avg=0.073ns sd=0.039ns min=0.000ns max=0.191ns {191 <= 0.146ns, 6 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
          Leaf  : target=0.078ns count=12 avg=0.062ns sd=0.012ns min=0.040ns max=0.076ns {2 <= 0.047ns, 3 <= 0.062ns, 4 <= 0.070ns, 2 <= 0.074ns, 1 <= 0.078ns}
          Leaf  : target=0.110ns count=3 avg=0.081ns sd=0.000ns min=0.081ns max=0.082ns {0 <= 0.066ns, 3 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
          Leaf  : target=0.209ns count=1 avg=0.060ns sd=0.000ns min=0.060ns max=0.060ns {1 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
          Leaf  : target=0.243ns count=181 avg=0.094ns sd=0.053ns min=0.034ns max=0.246ns {166 <= 0.146ns, 0 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 13 <= 0.243ns} {2 <= 0.255ns, 0 <= 0.267ns, 0 <= 0.292ns, 0 <= 0.364ns, 0 > 0.364ns}
        Clock DAG library cell distribution before routing clock trees {count}:
           Invs: INVX16_LVT: 40 INVX8_LVT: 87 INVX4_LVT: 82 INVX2_LVT: 109 
           ICGs: CGLNPRX8_LVT: 7 CGLPPRX8_LVT: 3 CGLNPRX2_LVT: 5 CGLPPRX2_LVT: 15 
         Logics: LSUPX8_LVT: 1 AO21X2_LVT: 3 AO22X2_RVT: 16 AO21X1_LVT: 3 AO22X1_RVT: 16 
        Primary reporting skew groups before routing clock trees:
          skew_group SDRAM_CLK/func_best_mode: insertion delay [min=1.351, max=1.435, avg=1.418, sd=0.016, skn=-1.687, kur=2.166], skew [0.085 vs 0.085], 100% {1.351, 1.435} (wid=0.106 ws=0.070) (gid=1.393 gs=0.125)
        Skew group summary before routing clock trees:
          skew_group PCI_CLK/func_best_mode: insertion delay [min=0.769, max=0.832, avg=0.791, sd=0.023, skn=0.769, kur=-1.047], skew [0.063 vs 0.085], 100% {0.769, 0.832} (wid=0.029 ws=0.023) (gid=0.821 gs=0.072)
          skew_group SDRAM_CLK/func_best_mode: insertion delay [min=1.351, max=1.435, avg=1.418, sd=0.016, skn=-1.687, kur=2.166], skew [0.085 vs 0.085], 100% {1.351, 1.435} (wid=0.106 ws=0.070) (gid=1.393 gs=0.125)
          skew_group SYS_2x_CLK/func_best_mode: insertion delay [min=0.807, max=0.891, avg=0.860, sd=0.024, skn=-1.008, kur=-0.013], skew [0.084 vs 0.086], 100% {0.807, 0.891} (wid=0.016 ws=0.015) (gid=0.890 gs=0.092)
          skew_group SYS_2x_CLK/func_worst_mode: insertion delay [min=0.807, max=0.891, avg=0.819, sd=0.025, skn=2.748, kur=6.511], skew [0.084 vs 0.086], 100% {0.807, 0.891} (wid=0.011 ws=0.010) (gid=0.890 gs=0.092)
          skew_group ate_clk/test_best_mode: insertion delay [min=0.967, max=1.056, avg=1.032, sd=0.019, skn=-1.210, kur=0.358], skew [0.088 vs 0.085*], 100% {0.976, 1.056} (wid=0.059 ws=0.057) (gid=1.048 gs=0.110)
          skew_group ate_clk/test_worst_mode: insertion delay [min=0.967, max=1.053, avg=1.032, sd=0.019, skn=-1.209, kur=0.305], skew [0.086 vs 0.085*], 100% {0.976, 1.053} (wid=0.059 ws=0.056) (gid=1.047 gs=0.109)
        Legalizer API calls during this step: 529 succeeded with high effort: 529 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
      eGRPC done.
    Calling post conditioning for eGRPC done.
  eGR Post Conditioning done.
  Refine place not called during Post Conditioning. Calling it now the eGR->PC Loop is complete.
  Leaving CCOpt scope - Cleaning up placement interface...
  Leaving CCOpt scope - Cleaning up placement interface done. (took cpu=0:00:00.5 real=0:00:00.1)
  Leaving CCOpt scope - ClockRefiner...
  Soft fixed 380 clock instances.
  Performing Single Pass Refine Place.

*** Starting refinePlace (0:40:29 mem=6677.4M) ***
Total net bbox length = 8.690e+05 (5.128e+05 3.562e+05) (ext = 1.259e+04)
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Move report: Detail placement moves 620 insts, mean move: 1.00 um, max move: 8.06 um 
	Max move on inst (I_RISC_CORE/U1183): (193.80, 170.54) --> (190.76, 175.56)
	Runtime: CPU: 0:00:12.6 REAL: 0:00:05.0 MEM: 6645.4MB
Summary Report:
Instances move: 629 (out of 40851 movable)
Instances flipped: 0
Mean displacement: 1.03 um
Max displacement: 8.06 um (Instance: I_RISC_CORE/U1183) (193.8, 170.544) -> (190.76, 175.56)
	Length: 5 sites, height: 1 rows, site name: unit, cell type: INVX1_RVT, constraint:Fence
Physical-only instances move: 0 (out of 0 movable physical-only)
Total net bbox length = 8.693e+05 (5.130e+05 3.563e+05) (ext = 1.257e+04)
Runtime: CPU: 0:00:12.8 REAL: 0:00:05.0 MEM: 6645.4MB
*** Finished refinePlace (0:40:42 mem=6645.4M) ***
  ClockRefiner summary
  All clock instances: Moved 74, flipped 15 and cell swapped 0 (out of a total of 3880).
  All Clock instances: Average move = 1.2um
  The largest move was 5.93 um for CTS_ccl_inv_00192.
  Restoring pStatusCts on 380 clock instances.
  Leaving CCOpt scope - ClockRefiner done. (took cpu=0:00:13.7 real=0:00:05.1)
  CCOpt::Phase::eGRPC done. (took cpu=0:00:34.7 real=0:00:18.5)
  CCOpt::Phase::Routing...
  Clock implementation routing...
    Leaving CCOpt scope - Routing Tools...
Net route status summary:
  Clock:       407 (unrouted=12, trialRouted=0, noStatus=0, routed=388, fixed=7, [crossesIlmBoundary=0, tooFewTerms=12, (crossesIlmBoundary AND tooFewTerms=0)])
  Non-clock: 46945 (unrouted=3988, trialRouted=42957, noStatus=0, routed=0, fixed=0, [crossesIlmBoundary=0, tooFewTerms=3894, (crossesIlmBoundary AND tooFewTerms=0)])
    Routing using eGR in eGR->NR Step...
      Early Global Route - eGR->Nr High Frequency step...
(ccopt eGR): There are 400 nets to be routed. 0 nets have skip routing designation.
(ccopt eGR): There are 400 nets for routing of which 388 have one or more fixed wires.
(ccopt eGR): Start to route 400 all nets
[PSP]    Started Early Global Route ( Curr Mem: 6.25 MB )
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
[PSP]    Started Early Global Route kernel ( Curr Mem: 6.25 MB )
[NR-eGR] Read 43446 nets ( ignored 43058 )
[NR-eGR] There are 388 clock nets ( 388 with NDR ).
[NR-eGR] Layer group 1: route 203 net(s) in layer range [5, 6]
[NR-eGR] Early Global Route overflow of layer group 1: 0.05% H + 0.13% V. EstWL: 1.437920e+04um
[NR-eGR] Create a new net group with 23 nets and layer range [5, 8]
[NR-eGR] Layer group 2: route 4 net(s) in layer range [4, 5]
[NR-eGR] Early Global Route overflow of layer group 2: 0.19% H + 0.01% V. EstWL: 1.388429e+04um
[NR-eGR] Layer group 3: route 185 net(s) in layer range [3, 4]
[NR-eGR] Early Global Route overflow of layer group 3: 0.01% H + 0.02% V. EstWL: 3.502506e+04um
[NR-eGR] Create a new net group with 14 nets and layer range [3, 6]
[NR-eGR] Layer group 4: route 23 net(s) in layer range [5, 8]
[NR-eGR] Early Global Route overflow of layer group 4: 0.04% H + 0.09% V. EstWL: 3.487792e+04um
[NR-eGR] Create a new net group with 10 nets and layer range [5, 9]
[NR-eGR] Layer group 5: route 14 net(s) in layer range [3, 6]
[NR-eGR] Early Global Route overflow of layer group 5: 0.04% H + 0.01% V. EstWL: 3.673886e+04um
[NR-eGR] Create a new net group with 11 nets and layer range [3, 8]
[NR-eGR] Layer group 6: route 10 net(s) in layer range [5, 9]
[NR-eGR] Early Global Route overflow of layer group 6: 0.02% H + 0.09% V. EstWL: 3.628742e+04um
[NR-eGR] Create a new net group with 7 nets and layer range [3, 9]
[NR-eGR] Layer group 7: route 11 net(s) in layer range [3, 8]
[NR-eGR] Early Global Route overflow of layer group 7: 0.03% H + 0.00% V. EstWL: 3.792598e+04um
[NR-eGR] Move 8 nets to the existing net group with layer range [3, 9]
[NR-eGR] Layer group 8: route 15 net(s) in layer range [3, 9]
[NR-eGR] Early Global Route overflow of layer group 8: 0.01% H + 0.00% V. EstWL: 3.907798e+04um
[NR-eGR] Create a new net group with 9 nets and layer range [2, 9]
[NR-eGR] Layer group 9: route 9 net(s) in layer range [2, 9]
[NR-eGR] Early Global Route overflow of layer group 9: 0.01% H + 0.00% V. EstWL: 4.099744e+04um
[NR-eGR] Overflow after Early Global Route 0.00% H + 0.00% V
[NR-eGR] Total eGR-routed clock nets wire length: 35697um, number of vias: 13454
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR] Report for selected net(s) only.
[NR-eGR]               Length (um)   Vias 
[NR-eGR] ---------------------------------
[NR-eGR]  M1    (1H)             0   4273 
[NR-eGR]  M2    (2V)          2748   4746 
[NR-eGR]  M3    (3H)          9806   3264 
[NR-eGR]  M4    (4V)          9934    540 
[NR-eGR]  M5    (5H)          6454    418 
[NR-eGR]  M6    (6V)          4524    139 
[NR-eGR]  M7    (7H)          1682     70 
[NR-eGR]  M8    (8V)           536      4 
[NR-eGR]  M9    (9H)            13      0 
[NR-eGR]  MRDL  (10V)            0      0 
[NR-eGR] ---------------------------------
[NR-eGR]        Total        35697  13454 
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR] Total half perimeter of net bounding box: 28995um
[NR-eGR] Total length: 35697um, number of vias: 13454
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR] Total routed clock nets wire length: 35697um, number of vias: 13454
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR]               Length (um)    Vias 
[NR-eGR] ----------------------------------
[NR-eGR]  M1    (1H)             0  163399 
[NR-eGR]  M2    (2V)        226715  218732 
[NR-eGR]  M3    (3H)        337389   69138 
[NR-eGR]  M4    (4V)        142827   15787 
[NR-eGR]  M5    (5H)        137149    4444 
[NR-eGR]  M6    (6V)         48315    2289 
[NR-eGR]  M7    (7H)         62802     437 
[NR-eGR]  M8    (8V)          5225     142 
[NR-eGR]  M9    (9H)          6435       2 
[NR-eGR]  MRDL  (10V)            5       0 
[NR-eGR] ----------------------------------
[NR-eGR]        Total       966862  474370 
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR] Total half perimeter of net bounding box: 869336um
[NR-eGR] Total length: 966862um, number of vias: 474370
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR] Finished Early Global Route kernel ( CPU: 7.64 sec, Real: 4.16 sec, Curr Mem: 6.29 MB )
[NR-eGR] Finished Early Global Route ( CPU: 7.66 sec, Real: 4.17 sec, Curr Mem: 6.24 MB )
      Early Global Route - eGR->Nr High Frequency step done. (took cpu=0:00:07.9 real=0:00:04.4)
    Routing using eGR in eGR->NR Step done.
    Routing using NR in eGR->NR Step...
Net 'CTS_34' is pre-routed or has the -skip_routing attribute.
Net 'CTS_35' is pre-routed or has the -skip_routing attribute.
Net 'CTS_36' is pre-routed or has the -skip_routing attribute.
Net 'CTS_37' is pre-routed or has the -skip_routing attribute.
Net 'CTS_38' is pre-routed or has the -skip_routing attribute.
Net 'CTS_39' is pre-routed or has the -skip_routing attribute.
Net 'sdram_clk' is pre-routed or has the -skip_routing attribute.
**WARN: (IMPCCOPT-5038):	7 of 407 net(s) are pre-routed or have the -skip_routing attribute.

CCOPT: Preparing to route 407 clock nets with NanoRoute.
  400 nets are default rule and 7 are CTS_RULE.
  Preferred NanoRoute mode settings: Current
-route_detail_end_iteration 0
-route_detail_post_route_spread_wire auto
-route_with_via_only_for_stdcell_pin false
      Clock detailed routing...
        NanoRoute...
% Begin globalDetailRoute (date=06/12 02:04:27, mem=3530.3M)

globalDetailRoute

#Start globalDetailRoute on Wed Jun 12 02:04:28 2024
#
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#NanoRoute Version 23.10-p003_1 NR240109-1512/23_10-UB
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#
#Wire/Via statistics before line assignment ...
#Total number of nets with non-default rule or having extra spacing = 197
#Total wire length = 35697 um.
#Total half perimeter of net bounding box = 29465 um.
#Total wire length on LAYER M1 = 0 um.
#Total wire length on LAYER M2 = 2748 um.
#Total wire length on LAYER M3 = 9806 um.
#Total wire length on LAYER M4 = 9934 um.
#Total wire length on LAYER M5 = 6454 um.
#Total wire length on LAYER M6 = 4524 um.
#Total wire length on LAYER M7 = 1682 um.
#Total wire length on LAYER M8 = 536 um.
#Total wire length on LAYER M9 = 13 um.
#Total wire length on LAYER MRDL = 0 um.
#Total number of vias = 13454
#Up-Via Summary (total 13454):
#           
#-----------------------
# M1               4273
# M2               4746
# M3               3264
# M4                540
# M5                418
# M6                139
# M7                 70
# M8                  4
#-----------------------
#                 13454 
#
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#Start routing data preparation on Wed Jun 12 02:04:29 2024
#
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#Initial pin access analysis.
#Detail pin access analysis.
# M1           H   Track-Pitch = 0.15200    Line-2-Via Pitch = 0.10500
# M2           V   Track-Pitch = 0.15200    Line-2-Via Pitch = 0.11400
# M3           H   Track-Pitch = 0.30400    Line-2-Via Pitch = 0.11400
# M4           V   Track-Pitch = 0.30400    Line-2-Via Pitch = 0.11400
# M5           H   Track-Pitch = 0.60800    Line-2-Via Pitch = 0.11400
# M6           V   Track-Pitch = 0.60800    Line-2-Via Pitch = 0.11400
# M7           H   Track-Pitch = 1.21600    Line-2-Via Pitch = 0.11400
# M8           V   Track-Pitch = 1.21600    Line-2-Via Pitch = 0.11400
# M9           H   Track-Pitch = 2.43200    Line-2-Via Pitch = 0.21600
# MRDL         V   Track-Pitch = 4.86400    Line-2-Via Pitch = 4.50000
#Bottom routing layer index=1(M1), bottom routing layer for shielding=1(M1), bottom shield layer=1(M1)
#shield_bottom_stripe_layer=1(M1), shield_top_stripe_layer=10(MRDL)
#pin_access_rlayer=2(M2)
#shield_top_dpt_rlayer=-1 top_rlayer=10 top_trim_metal_rlayer=-1 rlayer_lowest=1 bottom_rlayer=1
#enable_trim_layer_shield=F enable_dpt_layer_shield=F has_line_end_grid=F
#enable_dpt_layer_shield=F
#has_line_end_grid=F
#cpu time = 00:00:00, elapsed time = 00:00:00, memory = 3543.21 (MB), peak = 4910.27 (MB)
#Regenerating Ggrids automatically.
#Auto generating G-grids with size=15 tracks, using layer M3's pitch = 0.30400.
#Using automatically generated G-grids.
#Done routing data preparation.
#cpu time = 00:00:02, elapsed time = 00:00:01, memory = 3580.84 (MB), peak = 4910.27 (MB)
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#Start instance access analysis using 8 threads...
#Set layer M1 to be advanced pin access layer.
#Set instance access analysis scope -6.68800, 121.44900, 901.91900, 595.12500
#0 instance pins are hard to access
#Instance access analysis statistics:
#Cpu time = 00:00:02
#Elapsed time = 00:00:01
#Increased memory = 0.84 (MB)
#Total memory = 3581.69 (MB)
#Peak memory = 4910.27 (MB)
Updating RC Grid density data for preRoute extraction ...
Initializing multi-corner capacitance tables ... 
Initializing multi-corner resistance tables ...
#
#Distribution of nets:
#  
# #pin range           #net       % 
#------------------------------------
#          2           21162 ( 44.7%)
#          3           11609 ( 24.5%)
#          4            2718 (  5.7%)
#          5            1658 (  3.5%)
#          6            2942 (  6.2%)
#          7             311 (  0.7%)
#          8             271 (  0.6%)
#          9             393 (  0.8%)
#  10  -  19            1711 (  3.6%)
#  20  -  29             474 (  1.0%)
#  30  -  39             148 (  0.3%)
#  40  -  49              31 (  0.1%)
#  50  -  59              14 (  0.0%)
#  60  -  69               3 (  0.0%)
#  70  -  79               1 (  0.0%)
#     >=2000               0 (  0.0%)
#
#Total: 47352 nets, 43446 non-trivial nets
#                                    #net       % 
#-------------------------------------------------
#  Fully global routed                388 ( 0.9%)
#  Fully detail routed                  7 ( 0.0%)
#  Fixed segments                       7
#  Clock                              395
#  Nondefault rule                      7
#  Shield rule                        203
#  Extra space                        388
#  Prefer layer range               43446
#  Skipped                              7
#
#  Rule            #net     #shield
#----------------------------------
#  DEFAULT        43439         203
#  CTS_RULE           7           0
#
#Nets in 4 layer ranges:
#  Bottom Pref.Layer    Top Pref.Layer       #net       % 
#---------------------------------------------------------
#            -------           6 M6  *      43051 ( 99.1%)
#             3 M3             4 M4           185 (  0.4%)
#             5 M5             6 M6           203 (  0.5%)
#             7 M7             8 M8             7 (  0.0%)
#
#395 nets selected.
#
#
#..
#
#Iteration 1.1: cpu:00:00:02, real:00:00:01, mem:3.6 GB, peak:4.8 GB --2.45 [8]--
#Iteration 1.2: cpu:00:00:00, real:00:00:00, mem:3.6 GB, peak:4.8 GB --1.43 [8]--
#Iteration 1.3: cpu:00:00:00, real:00:00:00, mem:3.6 GB, peak:4.8 GB --1.35 [8]--
#Iteration 1.4: cpu:00:00:00, real:00:00:00, mem:3.6 GB, peak:4.8 GB --1.31 [8]--
#Iteration 2.1: cpu:00:00:01, real:00:00:01, mem:3.6 GB, peak:4.8 GB --2.24 [8]--
#Iteration 2.2: cpu:00:00:00, real:00:00:00, mem:3.6 GB, peak:4.8 GB --1.39 [8]--
#Iteration 2.3: cpu:00:00:00, real:00:00:00, mem:3.6 GB, peak:4.8 GB --1.31 [8]--
#Iteration 2.4: cpu:00:00:00, real:00:00:00, mem:3.6 GB, peak:4.8 GB --1.31 [8]--
#Iteration 3.1: cpu:00:00:02, real:00:00:01, mem:3.6 GB, peak:4.8 GB --2.37 [8]--
#Iteration 3.2: cpu:00:00:00, real:00:00:00, mem:3.6 GB, peak:4.8 GB --1.36 [8]--
#Iteration 3.3: cpu:00:00:00, real:00:00:00, mem:3.6 GB, peak:4.8 GB --1.32 [8]--
#Iteration 3.4: cpu:00:00:00, real:00:00:00, mem:3.6 GB, peak:4.8 GB --1.32 [8]--
#
#Line Assignment statistics:
#Cpu time = 00:00:09
#Elapsed time = 00:00:05
#Increased memory = 14.55 (MB)
#Total memory = 3693.41 (MB)
#Peak memory = 4910.27 (MB)
#End Line Assignment: cpu:00:00:10, real:00:00:05, mem:3.6 GB, peak:4.8 GB --1.96 [8]--
#
#Wire/Via statistics after line assignment ...
#Total number of nets with non-default rule or having extra spacing = 400
#Total wire length = 35785 um.
#Total half perimeter of net bounding box = 29465 um.
#Total wire length on LAYER M1 = 52 um.
#Total wire length on LAYER M2 = 3621 um.
#Total wire length on LAYER M3 = 9741 um.
#Total wire length on LAYER M4 = 9443 um.
#Total wire length on LAYER M5 = 6278 um.
#Total wire length on LAYER M6 = 4412 um.
#Total wire length on LAYER M7 = 1704 um.
#Total wire length on LAYER M8 = 528 um.
#Total wire length on LAYER M9 = 6 um.
#Total wire length on LAYER MRDL = 0 um.
#Total number of vias = 11773
#Up-Via Summary (total 11773):
#           
#-----------------------
# M1               4273
# M2               4377
# M3               2141
# M4                450
# M5                348
# M6                116
# M7                 66
# M8                  2
#-----------------------
#                 11773 
#
#Routing data preparation, pin analysis, line assignment statistics:
#Cpu time = 00:00:15
#Elapsed time = 00:00:08
#Increased memory = 113.84 (MB)
#Total memory = 3651.83 (MB)
#Peak memory = 4910.27 (MB)
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#Skip comparing routing design signature in db-snapshot flow
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#Using multithreading with 8 threads.
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#
#Start Detail Routing..
#start initial detail routing ...
#   number of violations = 2
#
#  By Layer and Type:
#
#---------+------+-------+
#  -      | Short| Totals|
#---------+------+-------+
#  M1     |     0|      0|
#  M2     |     0|      0|
#  M3     |     2|      2|
#  Totals |     2|      2|
#---------+------+-------+
#
#cpu time = 00:01:15, elapsed time = 00:00:11, memory = 3706.11 (MB), peak = 4910.27 (MB)
#start 1st optimization iteration ...
#   number of violations = 0
#cpu time = 00:00:00, elapsed time = 00:00:00, memory = 3705.34 (MB), peak = 4910.27 (MB)
#Complete Detail Routing.
#Total number of nets with non-default rule or having extra spacing = 400
#Total wire length = 36327 um.
#Total half perimeter of net bounding box = 29465 um.
#Total wire length on LAYER M1 = 0 um.
#Total wire length on LAYER M2 = 2378 um.
#Total wire length on LAYER M3 = 10594 um.
#Total wire length on LAYER M4 = 10364 um.
#Total wire length on LAYER M5 = 6287 um.
#Total wire length on LAYER M6 = 4422 um.
#Total wire length on LAYER M7 = 1751 um.
#Total wire length on LAYER M8 = 517 um.
#Total wire length on LAYER M9 = 12 um.
#Total wire length on LAYER MRDL = 0 um.
#Total number of vias = 11740
#Up-Via Summary (total 11740):
#           
#-----------------------
# M1               4273
# M2               3789
# M3               2704
# M4                443
# M5                345
# M6                116
# M7                 62
# M8                  8
#-----------------------
#                 11740 
#
#Total number of DRC violations = 0
#Cpu time = 00:01:17
#Elapsed time = 00:00:11
#Increased memory = 23.63 (MB)
#Total memory = 3675.46 (MB)
#Peak memory = 4910.27 (MB)
#Bottom routing layer index=1(M1), bottom routing layer for shielding=1(M1), bottom shield layer=1(M1)
#shield_bottom_stripe_layer=1(M1), shield_top_stripe_layer=10(MRDL)
#pin_access_rlayer=2(M2)
#shield_top_dpt_rlayer=-1 top_rlayer=10 top_trim_metal_rlayer=-1 rlayer_lowest=1 bottom_rlayer=1
#enable_trim_layer_shield=F enable_dpt_layer_shield=F has_line_end_grid=F
#enable_dpt_layer_shield=F
#has_line_end_grid=F
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#Analyzing shielding information. 
#  Total shield net = 203 (one-side = 0, hf = 0 ), 203 nets need to be shielded.
#  Bottom shield layer is layer 1.
#  Bottom routing layer for shield is layer 1.
#  Start shielding step 1
#  Finished shielding step 1: cpu time = 00:00:00, elapsed time = 00:00:00, memory = 3675.55 (MB), peak = 4910.27 (MB)
#  Start shielding step 2 
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#    Inner loop #1
#    Inner loop #2
#    Inner loop #3
#  Finished shielding step 2:   cpu time = 00:00:15, elapsed time = 00:00:04, memory = 3669.56 (MB), peak = 4910.27 (MB)
#  Start shielding step 3
#WARNING (NRIF-95) Option setNanoRouteMode -routeTopRoutingLayer has invalid value "0". Reset to max routing layer "10".
#WARNING (EMS-27) Message (NRIF-95) has exceeded the current message display limit of 20.
#To increase the message display limit, refer to the product command reference manual.
#    Start loop 1
#    Finished loop 1 cpu time = 00:00:07, elapsed time = 00:00:04, memory = 3686.22 (MB), peak = 4910.27 (MB)
#  Finished shielding step 3: cpu time = 00:00:07, elapsed time = 00:00:04, memory = 3686.22 (MB), peak = 4910.27 (MB)
#  Start shielding step 4
#    Inner loop #1
#  Finished shielding step 4:   cpu time = 00:00:05, elapsed time = 00:00:01, memory = 3684.64 (MB), peak = 4910.27 (MB)
#    cpu time = 00:00:12, elapsed time = 00:00:05, memory = 3662.31 (MB), peak = 4910.27 (MB)
#-------------------------------------------------------------------------------
#
#	Shielding Summary
#-------------------------------------------------------------------------------
#Primary shielding net(s): VSS 
#Opportunistic shielding net(s): VDD VDDH 
#keep_floating_patch_shield:0
#
#
#Number of nets with shield attribute: 203
#Number of nets reported: 203
#Number of nets without shielding: 0
#Average ratio                   : 0.927
#
#Name   Average Length     Shield    Ratio
#   M2:           1.7        3.0     0.885
#   M3:           2.7        4.7     0.868
#   M4:           5.5        9.2     0.829
#   M5:          30.0       56.8     0.945
#   M6:          21.5       39.6     0.923
#   M7:           6.3       12.2     0.967
#   M8:           2.5        4.8     0.960
#-------------------------------------------------------------------------------
#Bottom shield layer (M1) and above: 
#Average (BotShieldLayer) ratio  : 0.927
#
#Name    Actual Length     Shield    Ratio
#   M2:         340.4      602.7     0.885
#   M3:         548.0      951.5     0.868
#   M4:        1126.0     1866.0     0.829
#   M5:        6099.8    11525.3     0.945
#   M6:        4358.8     8043.3     0.923
#   M7:        1285.3     2484.5     0.967
#   M8:         511.9      982.5     0.960
#-------------------------------------------------------------------------------
#Preferred routing layer range: M5 - M8
#Average (PrefLayerOnly) ratio   : 0.940
#
#Name    Actual Length     Shield    Ratio
#   M5:        6099.8    11525.3     0.945
#   M6:        4358.8     8043.3     0.923
#   M7:        1285.3     2484.5     0.967
#   M8:         511.9      982.5     0.960
#-------------------------------------------------------------------------------
#Done Shielding:    cpu time = 00:00:27, elapsed time = 00:00:09, memory = 3662.39 (MB), peak = 4910.27 (MB)
#detailRoute Statistics:
#Cpu time = 00:01:43
#Elapsed time = 00:00:21
#Increased memory = 10.05 (MB)
#Total memory = 3661.88 (MB)
#Peak memory = 4910.27 (MB)
#
#globalDetailRoute statistics:
#Cpu time = 00:02:03
#Elapsed time = 00:00:31
#Increased memory = 83.86 (MB)
#Total memory = 3614.17 (MB)
#Peak memory = 4910.27 (MB)
#Number of warnings = 21
#Total number of warnings = 37
#Number of fails = 0
#Total number of fails = 0
#Complete globalDetailRoute on Wed Jun 12 02:04:59 2024
#
#
#  Scalability Statistics
#
#-------------------------+---------+-------------+------------+
#  globalDetailRoute      | cpu time| elapsed time| scalability|
#-------------------------+---------+-------------+------------+
#  Pre Callback           | 00:00:00|     00:00:00|         1.0|
#  Post Callback          | 00:00:00|     00:00:00|         1.0|
#  Timing Data Generation | 00:00:00|     00:00:00|         1.0|
#  DB Import              | 00:00:03|     00:00:01|         2.2|
#  DB Export              | 00:00:01|     00:00:01|         1.0|
#  Cell Pin Access        | 00:00:01|     00:00:00|         1.0|
#  Instance Pin Access    | 00:00:02|     00:00:01|         1.0|
#  Data Preparation       | 00:00:02|     00:00:01|         1.6|
#  Line Assignment        | 00:00:10|     00:00:05|         1.9|
#  Detail Routing         | 00:01:16|     00:00:11|         6.7|
#  Shielding              | 00:00:26|     00:00:09|         3.0|
#  Entire Command         | 00:02:03|     00:00:31|         4.0|
#-------------------------+---------+-------------+------------+
#
% End globalDetailRoute (date=06/12 02:04:59, total cpu=0:02:03, real=0:00:31.0, peak res=4335.4M, current mem=3598.3M)
        NanoRoute done. (took cpu=0:02:03 real=0:00:31.2)
      Clock detailed routing done.
Skipping check of guided vs. routed net lengths.
Set FIXED routing status on 388 net(s)
Set FIXED placed status on 382 instance(s)
      Route Remaining Unrouted Nets...
Running earlyGlobalRoute to complete any remaining unrouted nets.
[NR-eGR] Started Early Global Route ( Curr Mem: 6.31 MB )
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
[NR-eGR] Started Early Global Route kernel ( Curr Mem: 6.31 MB )
[NR-eGR] Read 43446 nets ( ignored 395 )
[NR-eGR] Layer group 1: route 43051 net(s) in layer range [2, 10]
[NR-eGR] Early Global Route overflow of layer group 1: 0.12% H + 0.03% V. EstWL: 9.100245e+05um
[NR-eGR] Overflow after Early Global Route 0.10% H + 0.00% V
[NR-eGR] Total eGR-routed clock nets wire length: 0um, number of vias: 0
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR]               Length (um)    Vias 
[NR-eGR] ----------------------------------
[NR-eGR]  M1    (1H)             0  163819 
[NR-eGR]  M2    (2V)        232099  218346 
[NR-eGR]  M3    (3H)        351200   68957 
[NR-eGR]  M4    (4V)        147420   15813 
[NR-eGR]  M5    (5H)        141387    4469 
[NR-eGR]  M6    (6V)         47908    2361 
[NR-eGR]  M7    (7H)         63621     439 
[NR-eGR]  M8    (8V)          5261     150 
[NR-eGR]  M9    (9H)          6755       2 
[NR-eGR]  MRDL  (10V)            5       0 
[NR-eGR] ----------------------------------
[NR-eGR]        Total       995655  474356 
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR] Total half perimeter of net bounding box: 869336um
[NR-eGR] Total length: 995655um, number of vias: 474356
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR] Finished Early Global Route kernel ( CPU: 8.48 sec, Real: 3.49 sec, Curr Mem: 6.37 MB )
[NR-eGR] Finished Early Global Route ( CPU: 8.53 sec, Real: 3.55 sec, Curr Mem: 6.29 MB )
      Route Remaining Unrouted Nets done. (took cpu=0:00:08.6 real=0:00:03.6)
    Routing using NR in eGR->NR Step done.
Net route status summary:
  Clock:       407 (unrouted=12, trialRouted=0, noStatus=0, routed=0, fixed=395, [crossesIlmBoundary=0, tooFewTerms=12, (crossesIlmBoundary AND tooFewTerms=0)])
  Non-clock: 46945 (unrouted=3894, trialRouted=43051, noStatus=0, routed=0, fixed=0, [crossesIlmBoundary=0, tooFewTerms=3894, (crossesIlmBoundary AND tooFewTerms=0)])

CCOPT: Done with clock implementation routing.

    Leaving CCOpt scope - Routing Tools done. (took cpu=0:02:20 real=0:00:39.8)
  Clock implementation routing done.
  Leaving CCOpt scope - extractRC...
  Updating RC parasitics by calling: "extractRC -noRouteCheck"...
**WARN: (IMPEXT-6191):	Using a captable file is not recommended for process nodes less than or equal to 32 nm due to parasitic accuracy concerns. The Quantus QRC technology file should be specified for all RC corners using the command create_rc_corner or update_rc_corner, which will then be used for preRoute and postRoute(effort level medium or high or signoff) extraction engines.
Type 'man IMPEXT-6191' for more detail.
Extraction called for design 'ORCA_TOP' of instances=40913 and nets=47352 using extraction engine 'preRoute' .
PreRoute RC Extraction called for design ORCA_TOP.
RC Extraction called in multi-corner(2) mode.
RCMode: PreRoute
      RC Corner Indexes            0       1   
Capacitance Scaling Factor   : 1.00000 1.00000 
Resistance Scaling Factor    : 1.00000 1.00000 
Clock Cap. Scaling Factor    : 1.00000 1.00000 
Clock Res. Scaling Factor    : 1.00000 1.00000 
Shrink Factor                : 1.00000
PreRoute extraction is honoring NDR/Shielding/ExtraSpace for clock nets.
Using capacitance table file ...
Updating RC Grid density data for preRoute extraction ...
Initializing multi-corner capacitance tables ... 
Initializing multi-corner resistance tables ...
PreRoute RC Extraction DONE (CPU Time: 0:00:01.6  Real Time: 0:00:02.0  MEM: 6715.133M)
  Updating RC parasitics by calling: "extractRC -noRouteCheck" done.
  Leaving CCOpt scope - extractRC done. (took cpu=0:00:01.6 real=0:00:01.6)
  Clock tree timing engine global stage delay update for worst_corner:setup.late...
  Clock tree timing engine global stage delay update for worst_corner:setup.late done. (took cpu=0:00:00.4 real=0:00:00.2)
  Clock DAG stats after routing clock trees:
    cell counts      : b=0, i=318, icg=30, dcg=0, l=39, total=387
    sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
    misc counts      : r=20, pp=1, mci=38
    cell areas       : b=0.000um^2, i=801.570um^2, icg=196.707um^2, dcg=0.000um^2, l=112.586um^2, total=1110.863um^2
    cell capacitance : b=0.000fF, i=1266.148fF, icg=21.175fF, dcg=0.000fF, l=39.769fF, total=1327.092fF
    sink capacitance : total=2688.728fF, avg=0.765fF, sd=0.890fF, min=0.000fF, max=10.000fF
    wire capacitance : top=332.892fF, trunk=1312.141fF, leaf=2127.692fF, total=3772.725fF
    wire lengths     : top=3665.489um, trunk=14270.167um, leaf=22056.604um, total=39992.260um
    hp wire lengths  : top=2584.456um, trunk=12595.936um, leaf=15192.348um, total=30372.740um
  Clock DAG net violations after routing clock trees:
    Remaining Transition : {count=3, worst=[0.012ns, 0.003ns, 0.002ns]} avg=0.005ns sd=0.005ns sum=0.016ns
    Capacitance          : {count=10, worst=[11.375fF, 1.769fF, 0.322fF, 0.297fF, 0.263fF, 0.253fF, 0.201fF, 0.048fF, 0.040fF, 0.003fF]} avg=1.457fF sd=3.522fF sum=14.572fF
  Clock DAG primary half-corner transition distribution after routing clock trees:
    Top   : target=0.243ns count=7 avg=0.107ns sd=0.033ns min=0.087ns max=0.181ns {6 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
    Trunk : target=0.075ns count=1 avg=0.048ns sd=0.000ns min=0.048ns max=0.048ns {0 <= 0.045ns, 1 <= 0.060ns, 0 <= 0.068ns, 0 <= 0.071ns, 0 <= 0.075ns}
    Trunk : target=0.078ns count=1 avg=0.028ns sd=0.000ns min=0.028ns max=0.028ns {1 <= 0.047ns, 0 <= 0.062ns, 0 <= 0.070ns, 0 <= 0.074ns, 0 <= 0.078ns}
    Trunk : target=0.177ns count=5 avg=0.077ns sd=0.019ns min=0.056ns max=0.102ns {5 <= 0.106ns, 0 <= 0.141ns, 0 <= 0.159ns, 0 <= 0.168ns, 0 <= 0.177ns}
    Trunk : target=0.180ns count=2 avg=0.084ns sd=0.016ns min=0.072ns max=0.095ns {2 <= 0.108ns, 0 <= 0.144ns, 0 <= 0.162ns, 0 <= 0.171ns, 0 <= 0.180ns}
    Trunk : target=0.184ns count=7 avg=0.123ns sd=0.018ns min=0.110ns max=0.160ns {2 <= 0.111ns, 4 <= 0.148ns, 1 <= 0.166ns, 0 <= 0.175ns, 0 <= 0.184ns}
    Trunk : target=0.209ns count=2 avg=0.063ns sd=0.008ns min=0.057ns max=0.068ns {2 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
    Trunk : target=0.235ns count=3 avg=0.110ns sd=0.041ns min=0.063ns max=0.140ns {3 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
    Trunk : target=0.241ns count=1 avg=0.102ns sd=0.000ns min=0.102ns max=0.102ns {1 <= 0.144ns, 0 <= 0.192ns, 0 <= 0.217ns, 0 <= 0.229ns, 0 <= 0.241ns}
    Trunk : target=0.243ns count=197 avg=0.073ns sd=0.038ns min=0.000ns max=0.181ns {191 <= 0.146ns, 6 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
    Leaf  : target=0.078ns count=12 avg=0.063ns sd=0.012ns min=0.041ns max=0.076ns {2 <= 0.047ns, 3 <= 0.062ns, 3 <= 0.070ns, 3 <= 0.074ns, 1 <= 0.078ns}
    Leaf  : target=0.110ns count=3 avg=0.082ns sd=0.001ns min=0.081ns max=0.082ns {0 <= 0.066ns, 3 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
    Leaf  : target=0.209ns count=1 avg=0.061ns sd=0.000ns min=0.061ns max=0.061ns {1 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
    Leaf  : target=0.243ns count=181 avg=0.095ns sd=0.054ns min=0.034ns max=0.255ns {166 <= 0.146ns, 0 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 12 <= 0.243ns} {3 <= 0.255ns, 0 <= 0.267ns, 0 <= 0.292ns, 0 <= 0.364ns, 0 > 0.364ns}
  Clock DAG library cell distribution after routing clock trees {count}:
     Invs: INVX16_LVT: 40 INVX8_LVT: 87 INVX4_LVT: 82 INVX2_LVT: 109 
     ICGs: CGLNPRX8_LVT: 7 CGLPPRX8_LVT: 3 CGLNPRX2_LVT: 5 CGLPPRX2_LVT: 15 
   Logics: LSUPX8_LVT: 1 AO21X2_LVT: 3 AO22X2_RVT: 16 AO21X1_LVT: 3 AO22X1_RVT: 16 
  Primary reporting skew groups after routing clock trees:
    skew_group SDRAM_CLK/func_best_mode: insertion delay [min=1.353, max=1.449, avg=1.429, sd=0.016, skn=-1.786, kur=2.937], skew [0.096 vs 0.085*], 99.7% {1.368, 1.449} (wid=0.107 ws=0.072) (gid=1.405 gs=0.132)
  Skew group summary after routing clock trees:
    skew_group PCI_CLK/func_best_mode: insertion delay [min=0.766, max=0.834, avg=0.792, sd=0.024, skn=0.760, kur=-1.062], skew [0.068 vs 0.085], 100% {0.766, 0.834} (wid=0.029 ws=0.023) (gid=0.824 gs=0.073)
    skew_group SDRAM_CLK/func_best_mode: insertion delay [min=1.353, max=1.449, avg=1.429, sd=0.016, skn=-1.786, kur=2.937], skew [0.096 vs 0.085*], 99.7% {1.368, 1.449} (wid=0.107 ws=0.072) (gid=1.405 gs=0.132)
    skew_group SYS_2x_CLK/func_best_mode: insertion delay [min=0.811, max=0.902, avg=0.866, sd=0.022, skn=-0.948, kur=-0.009], skew [0.091 vs 0.086*], 99.1% {0.811, 0.897} (wid=0.016 ws=0.015) (gid=0.901 gs=0.097)
    skew_group SYS_2x_CLK/func_worst_mode: insertion delay [min=0.811, max=0.902, avg=0.833, sd=0.025, skn=2.515, kur=5.738], skew [0.091 vs 0.086*], 90% {0.811, 0.897} (wid=0.011 ws=0.010) (gid=0.901 gs=0.097)
    skew_group ate_clk/test_best_mode: insertion delay [min=0.968, max=1.065, avg=1.039, sd=0.019, skn=-1.203, kur=0.619], skew [0.097 vs 0.085*], 99.8% {0.981, 1.065} (wid=0.059 ws=0.056) (gid=1.056 gs=0.117)
    skew_group ate_clk/test_worst_mode: insertion delay [min=0.968, max=1.065, avg=1.040, sd=0.019, skn=-1.197, kur=0.560], skew [0.097 vs 0.085*], 99.8% {0.981, 1.065} (wid=0.059 ws=0.056) (gid=1.056 gs=0.117)
  CCOpt::Phase::Routing done. (took cpu=0:02:23 real=0:00:42.8)
  CCOpt::Phase::PostConditioning...
  Leaving CCOpt scope - Initializing placement interface...

  Leaving CCOpt scope - Initializing placement interface done. (took cpu=0:00:00.6 real=0:00:00.4)
  Found 15 placement violations.
  PostConditioning...
    PostConditioning active optimizations:
     - DRV fixing with initial upsizing, sizing and buffering
     - Skew fixing with sizing
    
    Currently running CTS, using active skew data
    ProEngine running partially connected to DB
    Reset bufferability constraints...
    Resetting previous bufferability status on all nets so that PostConditioning will attempt to fix all clock tree violations.
    Reset bufferability constraints done. (took cpu=0:00:00.0 real=0:00:00.0)
    PostConditioning Upsizing To Fix DRVs...
      Fixing clock tree DRVs with upsizing: ...20% ...40% ...60% ...80% ...100% 
      CCOpt-PostConditioning: considered: 407, tested: 407, violation detected: 13, violation ignored (due to small violation): 0, cannot run: 1, attempted: 12, unsuccessful: 0, sized: 5
      
      Statistics: Fix DRVs (initial upsizing):
      ========================================
      
      Cell changes by Net Type:
      
      ---------------------------------------------------------------------------------------------------------------------------
      Net Type    Attempted            Upsized             Downsized    Swapped Same Size    Total Changed       Not Sized
      ---------------------------------------------------------------------------------------------------------------------------
      top                0                    0                   0            0                    0                   0
      trunk              2 [16.7%]            1 (50.0%)           0            0                    1 (50.0%)           1 (50.0%)
      leaf              10 [83.3%]            4 (40.0%)           0            0                    4 (40.0%)           6 (60.0%)
      ---------------------------------------------------------------------------------------------------------------------------
      Total             12 [100.0%]           5 (41.7%)           0            0                    5 (41.7%)           7 (58.3%)
      ---------------------------------------------------------------------------------------------------------------------------
      
      Upsized: 5, Downsized: 0, Sized but same area: 0, Unchanged: 7, Area change: 5.083um^2 (0.458%)
      Max. move: 0.608um (I_SDRAM_TOP/I_SDRAM_IF/CTS_ccl_a_inv_00085 and 4 others), Min. move: 0.000um, Avg. move: 0.101um
      
      Clock DAG stats after 'PostConditioning Upsizing To Fix DRVs':
        cell counts      : b=0, i=318, icg=30, dcg=0, l=39, total=387
        sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
        misc counts      : r=20, pp=1, mci=38
        cell areas       : b=0.000um^2, i=806.653um^2, icg=196.707um^2, dcg=0.000um^2, l=112.586um^2, total=1115.946um^2
        cell capacitance : b=0.000fF, i=1279.170fF, icg=21.175fF, dcg=0.000fF, l=39.769fF, total=1340.114fF
        sink capacitance : total=2688.728fF, avg=0.765fF, sd=0.890fF, min=0.000fF, max=10.000fF
        wire capacitance : top=332.892fF, trunk=1312.141fF, leaf=2127.692fF, total=3772.725fF
        wire lengths     : top=3665.489um, trunk=14270.167um, leaf=22056.604um, total=39992.260um
        hp wire lengths  : top=2584.456um, trunk=12596.544um, leaf=15192.348um, total=30373.348um
      Clock DAG net violations after 'PostConditioning Upsizing To Fix DRVs':
        Remaining Transition : {count=3, worst=[0.012ns, 0.003ns, 0.002ns]} avg=0.005ns sd=0.005ns sum=0.016ns
        Capacitance          : {count=5, worst=[11.375fF, 0.297fF, 0.263fF, 0.253fF, 0.201fF]} avg=2.478fF sd=4.974fF sum=12.390fF
      Clock DAG primary half-corner transition distribution after 'PostConditioning Upsizing To Fix DRVs':
        Top   : target=0.243ns count=7 avg=0.107ns sd=0.033ns min=0.087ns max=0.181ns {6 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
        Trunk : target=0.075ns count=1 avg=0.048ns sd=0.000ns min=0.048ns max=0.048ns {0 <= 0.045ns, 1 <= 0.060ns, 0 <= 0.068ns, 0 <= 0.071ns, 0 <= 0.075ns}
        Trunk : target=0.078ns count=1 avg=0.028ns sd=0.000ns min=0.028ns max=0.028ns {1 <= 0.047ns, 0 <= 0.062ns, 0 <= 0.070ns, 0 <= 0.074ns, 0 <= 0.078ns}
        Trunk : target=0.177ns count=5 avg=0.077ns sd=0.019ns min=0.056ns max=0.102ns {5 <= 0.106ns, 0 <= 0.141ns, 0 <= 0.159ns, 0 <= 0.168ns, 0 <= 0.177ns}
        Trunk : target=0.180ns count=2 avg=0.084ns sd=0.016ns min=0.072ns max=0.095ns {2 <= 0.108ns, 0 <= 0.144ns, 0 <= 0.162ns, 0 <= 0.171ns, 0 <= 0.180ns}
        Trunk : target=0.184ns count=7 avg=0.123ns sd=0.018ns min=0.110ns max=0.160ns {2 <= 0.111ns, 4 <= 0.148ns, 1 <= 0.166ns, 0 <= 0.175ns, 0 <= 0.184ns}
        Trunk : target=0.209ns count=2 avg=0.063ns sd=0.008ns min=0.057ns max=0.068ns {2 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
        Trunk : target=0.235ns count=3 avg=0.110ns sd=0.041ns min=0.063ns max=0.140ns {3 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
        Trunk : target=0.241ns count=1 avg=0.102ns sd=0.000ns min=0.102ns max=0.102ns {1 <= 0.144ns, 0 <= 0.192ns, 0 <= 0.217ns, 0 <= 0.229ns, 0 <= 0.241ns}
        Trunk : target=0.243ns count=197 avg=0.073ns sd=0.038ns min=0.000ns max=0.181ns {191 <= 0.146ns, 6 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
        Leaf  : target=0.078ns count=12 avg=0.063ns sd=0.012ns min=0.041ns max=0.076ns {2 <= 0.047ns, 3 <= 0.062ns, 3 <= 0.070ns, 3 <= 0.074ns, 1 <= 0.078ns}
        Leaf  : target=0.110ns count=3 avg=0.082ns sd=0.001ns min=0.081ns max=0.082ns {0 <= 0.066ns, 3 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
        Leaf  : target=0.209ns count=1 avg=0.061ns sd=0.000ns min=0.061ns max=0.061ns {1 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
        Leaf  : target=0.243ns count=181 avg=0.093ns sd=0.054ns min=0.034ns max=0.255ns {166 <= 0.146ns, 0 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 12 <= 0.243ns} {3 <= 0.255ns, 0 <= 0.267ns, 0 <= 0.292ns, 0 <= 0.364ns, 0 > 0.364ns}
      Clock DAG library cell distribution after 'PostConditioning Upsizing To Fix DRVs' {count}:
         Invs: INVX16_LVT: 40 INVX8_LVT: 92 INVX4_LVT: 77 INVX2_LVT: 109 
         ICGs: CGLNPRX8_LVT: 7 CGLPPRX8_LVT: 3 CGLNPRX2_LVT: 5 CGLPPRX2_LVT: 15 
       Logics: LSUPX8_LVT: 1 AO21X2_LVT: 3 AO22X2_RVT: 16 AO21X1_LVT: 3 AO22X1_RVT: 16 
      Primary reporting skew groups after 'PostConditioning Upsizing To Fix DRVs':
        skew_group SDRAM_CLK/func_best_mode: insertion delay [min=1.353, max=1.448], skew [0.095 vs 0.085*]
      Skew group summary after 'PostConditioning Upsizing To Fix DRVs':
        skew_group PCI_CLK/func_best_mode: insertion delay [min=0.757, max=0.794], skew [0.037 vs 0.085]
        skew_group SDRAM_CLK/func_best_mode: insertion delay [min=1.353, max=1.448], skew [0.095 vs 0.085*]
        skew_group SYS_2x_CLK/func_best_mode: insertion delay [min=0.811, max=0.902], skew [0.091 vs 0.086*]
        skew_group SYS_2x_CLK/func_worst_mode: insertion delay [min=0.811, max=0.902], skew [0.091 vs 0.086*]
        skew_group ate_clk/test_best_mode: insertion delay [min=0.968, max=1.064], skew [0.095 vs 0.085*]
        skew_group ate_clk/test_worst_mode: insertion delay [min=0.968, max=1.064], skew [0.095 vs 0.085*]
      Legalizer API calls during this step: 31 succeeded with high effort: 31 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
    PostConditioning Upsizing To Fix DRVs done. (took cpu=0:00:00.6 real=0:00:00.6)
    Recomputing CTS skew targets...
    Resolving skew group constraints...
      Solving LP: 6 skew groups; 158 fragments, 187 fraglets and 153 vertices; 199 variables and 527 constraints; tolerance 1
**WARN: (IMPCCOPT-1059):	Slackened off max insertion delay target for skew_group SDRAM_CLK/func_best_mode from 0.843ns to 1.447ns.
Type 'man IMPCCOPT-1059' for more detail.
**WARN: (IMPCCOPT-1059):	Slackened off max insertion delay target for skew_group SYS_2x_CLK/func_best_mode from 0.843ns to 0.901ns.
Type 'man IMPCCOPT-1059' for more detail.
**WARN: (IMPCCOPT-1059):	Slackened off max insertion delay target for skew_group SYS_2x_CLK/func_worst_mode from 0.843ns to 0.901ns.
Type 'man IMPCCOPT-1059' for more detail.
**WARN: (IMPCCOPT-1059):	Slackened off max insertion delay target for skew_group ate_clk/test_best_mode from 0.843ns to 1.063ns.
Type 'man IMPCCOPT-1059' for more detail.
**WARN: (IMPCCOPT-1059):	Slackened off max insertion delay target for skew_group ate_clk/test_worst_mode from 0.843ns to 1.063ns.
Type 'man IMPCCOPT-1059' for more detail.
      
      Slackened skew group targets:
      
      --------------------------------------------------------------------------
      Skew group                    Desired    Slackened    Desired    Slackened
                                    Target     Target       Target     Target
                                    Max ID     Max ID       Skew       Skew
      --------------------------------------------------------------------------
      SDRAM_CLK/func_best_mode       0.843       1.447         -           -
      SYS_2x_CLK/func_best_mode      0.843       0.901         -           -
      SYS_2x_CLK/func_worst_mode     0.843       0.901         -           -
      ate_clk/test_best_mode         0.843       1.063         -           -
      ate_clk/test_worst_mode        0.843       1.063         -           -
      --------------------------------------------------------------------------
      
      
    Resolving skew group constraints done.
    Recomputing CTS skew targets done. (took cpu=0:00:00.8 real=0:00:00.8)
    PostConditioning Fixing DRVs...
      Fixing clock tree DRVs: ...20% ...40% ...60% ...80% ...100% 
      CCOpt-PostConditioning: considered: 407, tested: 407, violation detected: 8, violation ignored (due to small violation): 0, cannot run: 1, attempted: 7, unsuccessful: 0, sized: 0
      
      Statistics: Fix DRVs (cell sizing):
      ===================================
      
      Cell changes by Net Type:
      
      -------------------------------------------------------------------------------------------------------------------
      Net Type    Attempted            Upsized     Downsized    Swapped Same Size    Total Changed      Not Sized
      -------------------------------------------------------------------------------------------------------------------
      top                0                    0           0            0                    0                  0
      trunk              1 [14.3%]            0           0            0                    0 (0.0%)           1 (100.0%)
      leaf               6 [85.7%]            0           0            0                    0 (0.0%)           6 (100.0%)
      -------------------------------------------------------------------------------------------------------------------
      Total              7 [100.0%]           0           0            0                    0 (0.0%)           7 (100.0%)
      -------------------------------------------------------------------------------------------------------------------
      
      Upsized: 0, Downsized: 0, Sized but same area: 0, Unchanged: 7, Area change: 0.000um^2 (0.000%)
      Max. move: 0.000um, Min. move: 0.000um, Avg. move: 0.000um
      
      Clock DAG stats after 'PostConditioning Fixing DRVs':
        cell counts      : b=0, i=318, icg=30, dcg=0, l=39, total=387
        sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
        misc counts      : r=20, pp=1, mci=38
        cell areas       : b=0.000um^2, i=806.653um^2, icg=196.707um^2, dcg=0.000um^2, l=112.586um^2, total=1115.946um^2
        cell capacitance : b=0.000fF, i=1279.170fF, icg=21.175fF, dcg=0.000fF, l=39.769fF, total=1340.114fF
        sink capacitance : total=2688.728fF, avg=0.765fF, sd=0.890fF, min=0.000fF, max=10.000fF
        wire capacitance : top=332.892fF, trunk=1312.141fF, leaf=2127.692fF, total=3772.725fF
        wire lengths     : top=3665.489um, trunk=14270.167um, leaf=22056.604um, total=39992.260um
        hp wire lengths  : top=2584.456um, trunk=12596.544um, leaf=15192.348um, total=30373.348um
      Clock DAG net violations after 'PostConditioning Fixing DRVs':
        Remaining Transition : {count=3, worst=[0.012ns, 0.003ns, 0.002ns]} avg=0.005ns sd=0.005ns sum=0.016ns
        Capacitance          : {count=5, worst=[11.375fF, 0.297fF, 0.263fF, 0.253fF, 0.201fF]} avg=2.478fF sd=4.974fF sum=12.390fF
      Clock DAG primary half-corner transition distribution after 'PostConditioning Fixing DRVs':
        Top   : target=0.243ns count=7 avg=0.107ns sd=0.033ns min=0.087ns max=0.181ns {6 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
        Trunk : target=0.075ns count=1 avg=0.048ns sd=0.000ns min=0.048ns max=0.048ns {0 <= 0.045ns, 1 <= 0.060ns, 0 <= 0.068ns, 0 <= 0.071ns, 0 <= 0.075ns}
        Trunk : target=0.078ns count=1 avg=0.028ns sd=0.000ns min=0.028ns max=0.028ns {1 <= 0.047ns, 0 <= 0.062ns, 0 <= 0.070ns, 0 <= 0.074ns, 0 <= 0.078ns}
        Trunk : target=0.177ns count=5 avg=0.077ns sd=0.019ns min=0.056ns max=0.102ns {5 <= 0.106ns, 0 <= 0.141ns, 0 <= 0.159ns, 0 <= 0.168ns, 0 <= 0.177ns}
        Trunk : target=0.180ns count=2 avg=0.084ns sd=0.016ns min=0.072ns max=0.095ns {2 <= 0.108ns, 0 <= 0.144ns, 0 <= 0.162ns, 0 <= 0.171ns, 0 <= 0.180ns}
        Trunk : target=0.184ns count=7 avg=0.123ns sd=0.018ns min=0.110ns max=0.160ns {2 <= 0.111ns, 4 <= 0.148ns, 1 <= 0.166ns, 0 <= 0.175ns, 0 <= 0.184ns}
        Trunk : target=0.209ns count=2 avg=0.063ns sd=0.008ns min=0.057ns max=0.068ns {2 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
        Trunk : target=0.235ns count=3 avg=0.110ns sd=0.041ns min=0.063ns max=0.140ns {3 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
        Trunk : target=0.241ns count=1 avg=0.102ns sd=0.000ns min=0.102ns max=0.102ns {1 <= 0.144ns, 0 <= 0.192ns, 0 <= 0.217ns, 0 <= 0.229ns, 0 <= 0.241ns}
        Trunk : target=0.243ns count=197 avg=0.073ns sd=0.038ns min=0.000ns max=0.181ns {191 <= 0.146ns, 6 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
        Leaf  : target=0.078ns count=12 avg=0.063ns sd=0.012ns min=0.041ns max=0.076ns {2 <= 0.047ns, 3 <= 0.062ns, 3 <= 0.070ns, 3 <= 0.074ns, 1 <= 0.078ns}
        Leaf  : target=0.110ns count=3 avg=0.082ns sd=0.001ns min=0.081ns max=0.082ns {0 <= 0.066ns, 3 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
        Leaf  : target=0.209ns count=1 avg=0.061ns sd=0.000ns min=0.061ns max=0.061ns {1 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
        Leaf  : target=0.243ns count=181 avg=0.093ns sd=0.054ns min=0.034ns max=0.255ns {166 <= 0.146ns, 0 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 12 <= 0.243ns} {3 <= 0.255ns, 0 <= 0.267ns, 0 <= 0.292ns, 0 <= 0.364ns, 0 > 0.364ns}
      Clock DAG library cell distribution after 'PostConditioning Fixing DRVs' {count}:
         Invs: INVX16_LVT: 40 INVX8_LVT: 92 INVX4_LVT: 77 INVX2_LVT: 109 
         ICGs: CGLNPRX8_LVT: 7 CGLPPRX8_LVT: 3 CGLNPRX2_LVT: 5 CGLPPRX2_LVT: 15 
       Logics: LSUPX8_LVT: 1 AO21X2_LVT: 3 AO22X2_RVT: 16 AO21X1_LVT: 3 AO22X1_RVT: 16 
      Primary reporting skew groups after 'PostConditioning Fixing DRVs':
        skew_group SDRAM_CLK/func_best_mode: insertion delay [min=1.353, max=1.448], skew [0.095 vs 0.085*]
      Skew group summary after 'PostConditioning Fixing DRVs':
        skew_group PCI_CLK/func_best_mode: insertion delay [min=0.757, max=0.794], skew [0.037 vs 0.085]
        skew_group SDRAM_CLK/func_best_mode: insertion delay [min=1.353, max=1.448], skew [0.095 vs 0.085*]
        skew_group SYS_2x_CLK/func_best_mode: insertion delay [min=0.811, max=0.902], skew [0.091 vs 0.086*]
        skew_group SYS_2x_CLK/func_worst_mode: insertion delay [min=0.811, max=0.902], skew [0.091 vs 0.086*]
        skew_group ate_clk/test_best_mode: insertion delay [min=0.968, max=1.064], skew [0.095 vs 0.085*]
        skew_group ate_clk/test_worst_mode: insertion delay [min=0.968, max=1.064], skew [0.095 vs 0.085*]
      Legalizer API calls during this step: 16 succeeded with high effort: 16 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
    PostConditioning Fixing DRVs done. (took cpu=0:00:00.2 real=0:00:00.2)
    Buffering to fix DRVs...
    Fixing DRVs with route buffering pass 1. Quick buffering: enabled
    Rebuffering to fix clock tree DRVs: ...20% ...40% ...60% ...80% ...100% 
    Inserted 8 buffers and inverters.
    success count. Default: 0, QS: 4, QD: 0, FS: 0, MQS: 0
    CCOpt-PostConditioning: nets considered: 407, nets tested: 407, nets violation detected: 8, nets violation ignored (due to small violation): 0, nets cannot run: 0, nets attempted: 8, nets unsuccessful: 4, buffered: 4
    Clock DAG stats PostConditioning after re-buffering DRV fixing:
      cell counts      : b=0, i=326, icg=30, dcg=0, l=39, total=395
      sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
      misc counts      : r=20, pp=1, mci=38
      cell areas       : b=0.000um^2, i=819.360um^2, icg=196.707um^2, dcg=0.000um^2, l=112.586um^2, total=1128.654um^2
      cell capacitance : b=0.000fF, i=1291.929fF, icg=21.175fF, dcg=0.000fF, l=39.769fF, total=1352.873fF
      sink capacitance : total=2688.728fF, avg=0.765fF, sd=0.890fF, min=0.000fF, max=10.000fF
      wire capacitance : top=332.892fF, trunk=1315.993fF, leaf=2128.954fF, total=3777.839fF
      wire lengths     : top=3665.489um, trunk=14273.359um, leaf=22053.412um, total=39992.260um
      hp wire lengths  : top=2584.456um, trunk=12623.752um, leaf=15203.748um, total=30411.956um
    Clock DAG net violations PostConditioning after re-buffering DRV fixing:
      Capacitance : {count=4, worst=[11.375fF, 0.297fF, 0.253fF, 0.201fF]} avg=3.032fF sd=5.563fF sum=12.127fF
    Clock DAG primary half-corner transition distribution PostConditioning after re-buffering DRV fixing:
      Top   : target=0.243ns count=7 avg=0.107ns sd=0.033ns min=0.087ns max=0.181ns {6 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
      Trunk : target=0.075ns count=1 avg=0.048ns sd=0.000ns min=0.048ns max=0.048ns {0 <= 0.045ns, 1 <= 0.060ns, 0 <= 0.068ns, 0 <= 0.071ns, 0 <= 0.075ns}
      Trunk : target=0.078ns count=1 avg=0.028ns sd=0.000ns min=0.028ns max=0.028ns {1 <= 0.047ns, 0 <= 0.062ns, 0 <= 0.070ns, 0 <= 0.074ns, 0 <= 0.078ns}
      Trunk : target=0.177ns count=5 avg=0.077ns sd=0.019ns min=0.056ns max=0.102ns {5 <= 0.106ns, 0 <= 0.141ns, 0 <= 0.159ns, 0 <= 0.168ns, 0 <= 0.177ns}
      Trunk : target=0.180ns count=2 avg=0.084ns sd=0.016ns min=0.072ns max=0.095ns {2 <= 0.108ns, 0 <= 0.144ns, 0 <= 0.162ns, 0 <= 0.171ns, 0 <= 0.180ns}
      Trunk : target=0.184ns count=7 avg=0.123ns sd=0.018ns min=0.110ns max=0.160ns {2 <= 0.111ns, 4 <= 0.148ns, 1 <= 0.166ns, 0 <= 0.175ns, 0 <= 0.184ns}
      Trunk : target=0.209ns count=2 avg=0.063ns sd=0.008ns min=0.057ns max=0.068ns {2 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
      Trunk : target=0.235ns count=3 avg=0.110ns sd=0.041ns min=0.063ns max=0.140ns {3 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
      Trunk : target=0.241ns count=1 avg=0.102ns sd=0.000ns min=0.102ns max=0.102ns {1 <= 0.144ns, 0 <= 0.192ns, 0 <= 0.217ns, 0 <= 0.229ns, 0 <= 0.241ns}
      Trunk : target=0.243ns count=205 avg=0.073ns sd=0.038ns min=0.000ns max=0.181ns {199 <= 0.146ns, 6 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
      Leaf  : target=0.078ns count=12 avg=0.063ns sd=0.012ns min=0.041ns max=0.076ns {2 <= 0.047ns, 3 <= 0.062ns, 3 <= 0.070ns, 3 <= 0.074ns, 1 <= 0.078ns}
      Leaf  : target=0.110ns count=3 avg=0.082ns sd=0.001ns min=0.081ns max=0.082ns {0 <= 0.066ns, 3 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
      Leaf  : target=0.209ns count=1 avg=0.061ns sd=0.000ns min=0.061ns max=0.061ns {1 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
      Leaf  : target=0.243ns count=181 avg=0.091ns sd=0.050ns min=0.034ns max=0.242ns {169 <= 0.146ns, 0 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 12 <= 0.243ns}
    Clock DAG library cell distribution PostConditioning after re-buffering DRV fixing {count}:
       Invs: INVX16_LVT: 40 INVX8_LVT: 92 INVX4_LVT: 78 INVX2_LVT: 116 
       ICGs: CGLNPRX8_LVT: 7 CGLPPRX8_LVT: 3 CGLNPRX2_LVT: 5 CGLPPRX2_LVT: 15 
     Logics: LSUPX8_LVT: 1 AO21X2_LVT: 3 AO22X2_RVT: 16 AO21X1_LVT: 3 AO22X1_RVT: 16 
    Primary reporting skew groups PostConditioning after re-buffering DRV fixing:
      skew_group SDRAM_CLK/func_best_mode: insertion delay [min=1.357, max=1.448, avg=1.429, sd=0.017, skn=-1.701, kur=2.437], skew [0.091 vs 0.085*], 99.7% {1.363, 1.448} (wid=0.107 ws=0.072) (gid=1.405 gs=0.132)
    Skew group summary PostConditioning after re-buffering DRV fixing:
      skew_group PCI_CLK/func_best_mode: insertion delay [min=0.757, max=0.794, avg=0.779, sd=0.010, skn=-0.593, kur=0.173], skew [0.037 vs 0.085], 100% {0.757, 0.794} (wid=0.029 ws=0.023) (gid=0.784 gs=0.034)
      skew_group SDRAM_CLK/func_best_mode: insertion delay [min=1.357, max=1.448, avg=1.429, sd=0.017, skn=-1.701, kur=2.437], skew [0.091 vs 0.085*], 99.7% {1.363, 1.448} (wid=0.107 ws=0.072) (gid=1.405 gs=0.132)
      skew_group SYS_2x_CLK/func_best_mode: insertion delay [min=0.811, max=0.902, avg=0.866, sd=0.022, skn=-0.948, kur=-0.009], skew [0.091 vs 0.086*], 99.1% {0.811, 0.897} (wid=0.016 ws=0.015) (gid=0.901 gs=0.097)
      skew_group SYS_2x_CLK/func_worst_mode: insertion delay [min=0.811, max=0.902, avg=0.833, sd=0.025, skn=2.515, kur=5.738], skew [0.091 vs 0.086*], 90% {0.811, 0.897} (wid=0.011 ws=0.010) (gid=0.901 gs=0.097)
      skew_group ate_clk/test_best_mode: insertion delay [min=0.968, max=1.064, avg=1.038, sd=0.020, skn=-1.047, kur=0.182], skew [0.095 vs 0.085*], 99.8% {0.981, 1.064} (wid=0.059 ws=0.056) (gid=1.056 gs=0.117)
      skew_group ate_clk/test_worst_mode: insertion delay [min=0.968, max=1.064, avg=1.038, sd=0.020, skn=-1.033, kur=0.114], skew [0.095 vs 0.085*], 99.8% {0.981, 1.064} (wid=0.059 ws=0.056) (gid=1.056 gs=0.117)
    Buffering to fix DRVs done. (took cpu=0:00:01.7 real=0:00:01.7)
    PostConditioning Fixing Skew by cell sizing...
      Resized 8 clock insts to decrease delay.
      Resized 2 clock insts to increase delay.
      
      Statistics: Fix Skew (cell sizing):
      ===================================
      
      Cell changes by Net Type:
      
      ---------------------------------------------------------------------------------------------------------------------------------
      Net Type    Attempted            Upsized             Downsized          Swapped Same Size    Total Changed       Not Sized
      ---------------------------------------------------------------------------------------------------------------------------------
      top                0                    0                   0                  0                    0                   0
      trunk             43 [86.0%]            7 (16.3%)           2 (4.7%)           0                    9 (20.9%)          34 (79.1%)
      leaf               7 [14.0%]            1 (14.3%)           0                  0                    1 (14.3%)           6 (85.7%)
      ---------------------------------------------------------------------------------------------------------------------------------
      Total             50 [100.0%]           8 (16.0%)           2 (4.0%)           0                   10 (20.0%)          40 (80.0%)
      ---------------------------------------------------------------------------------------------------------------------------------
      
      Upsized: 8, Downsized: 2, Sized but same area: 0, Unchanged: 40, Area change: 3.558um^2 (0.315%)
      Max. move: 0.608um (I_SDRAM_TOP/CTS_cid_inv_00410 and 8 others), Min. move: 0.000um, Avg. move: 0.012um
      
      Clock DAG stats after 'PostConditioning Fixing Skew by cell sizing':
        cell counts      : b=0, i=326, icg=30, dcg=0, l=39, total=395
        sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
        misc counts      : r=20, pp=1, mci=38
        cell areas       : b=0.000um^2, i=822.918um^2, icg=196.707um^2, dcg=0.000um^2, l=112.586um^2, total=1132.212um^2
        cell capacitance : b=0.000fF, i=1301.032fF, icg=21.175fF, dcg=0.000fF, l=39.769fF, total=1361.976fF
        sink capacitance : total=2688.728fF, avg=0.765fF, sd=0.890fF, min=0.000fF, max=10.000fF
        wire capacitance : top=332.892fF, trunk=1315.993fF, leaf=2128.954fF, total=3777.839fF
        wire lengths     : top=3665.489um, trunk=14273.359um, leaf=22053.412um, total=39992.260um
        hp wire lengths  : top=2584.456um, trunk=12624.968um, leaf=15203.748um, total=30413.172um
      Clock DAG net violations after 'PostConditioning Fixing Skew by cell sizing':
        Capacitance : {count=4, worst=[11.375fF, 0.297fF, 0.253fF, 0.201fF]} avg=3.032fF sd=5.563fF sum=12.127fF
      Clock DAG primary half-corner transition distribution after 'PostConditioning Fixing Skew by cell sizing':
        Top   : target=0.243ns count=7 avg=0.107ns sd=0.033ns min=0.087ns max=0.181ns {6 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
        Trunk : target=0.075ns count=1 avg=0.048ns sd=0.000ns min=0.048ns max=0.048ns {0 <= 0.045ns, 1 <= 0.060ns, 0 <= 0.068ns, 0 <= 0.071ns, 0 <= 0.075ns}
        Trunk : target=0.078ns count=1 avg=0.028ns sd=0.000ns min=0.028ns max=0.028ns {1 <= 0.047ns, 0 <= 0.062ns, 0 <= 0.070ns, 0 <= 0.074ns, 0 <= 0.078ns}
        Trunk : target=0.177ns count=5 avg=0.082ns sd=0.020ns min=0.056ns max=0.102ns {5 <= 0.106ns, 0 <= 0.141ns, 0 <= 0.159ns, 0 <= 0.168ns, 0 <= 0.177ns}
        Trunk : target=0.180ns count=2 avg=0.084ns sd=0.016ns min=0.072ns max=0.095ns {2 <= 0.108ns, 0 <= 0.144ns, 0 <= 0.162ns, 0 <= 0.171ns, 0 <= 0.180ns}
        Trunk : target=0.184ns count=7 avg=0.123ns sd=0.018ns min=0.110ns max=0.160ns {2 <= 0.111ns, 4 <= 0.148ns, 1 <= 0.166ns, 0 <= 0.175ns, 0 <= 0.184ns}
        Trunk : target=0.209ns count=2 avg=0.072ns sd=0.005ns min=0.068ns max=0.075ns {2 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
        Trunk : target=0.235ns count=3 avg=0.113ns sd=0.036ns min=0.072ns max=0.140ns {3 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
        Trunk : target=0.241ns count=1 avg=0.102ns sd=0.000ns min=0.102ns max=0.102ns {1 <= 0.144ns, 0 <= 0.192ns, 0 <= 0.217ns, 0 <= 0.229ns, 0 <= 0.241ns}
        Trunk : target=0.243ns count=205 avg=0.073ns sd=0.038ns min=0.000ns max=0.181ns {199 <= 0.146ns, 6 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
        Leaf  : target=0.078ns count=12 avg=0.063ns sd=0.012ns min=0.041ns max=0.076ns {2 <= 0.047ns, 3 <= 0.062ns, 3 <= 0.070ns, 3 <= 0.074ns, 1 <= 0.078ns}
        Leaf  : target=0.110ns count=3 avg=0.082ns sd=0.001ns min=0.081ns max=0.082ns {0 <= 0.066ns, 3 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
        Leaf  : target=0.209ns count=1 avg=0.061ns sd=0.000ns min=0.061ns max=0.061ns {1 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
        Leaf  : target=0.243ns count=181 avg=0.091ns sd=0.050ns min=0.034ns max=0.242ns {169 <= 0.146ns, 0 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 12 <= 0.243ns}
      Clock DAG library cell distribution after 'PostConditioning Fixing Skew by cell sizing' {count}:
         Invs: INVX16_LVT: 41 INVX8_LVT: 91 INVX4_LVT: 81 INVX2_LVT: 113 
         ICGs: CGLNPRX8_LVT: 7 CGLPPRX8_LVT: 3 CGLNPRX2_LVT: 5 CGLPPRX2_LVT: 15 
       Logics: LSUPX8_LVT: 1 AO21X2_LVT: 3 AO22X2_RVT: 16 AO21X1_LVT: 3 AO22X1_RVT: 16 
      Primary reporting skew groups after 'PostConditioning Fixing Skew by cell sizing':
        skew_group SDRAM_CLK/func_best_mode: insertion delay [min=1.357, max=1.440, avg=1.419, sd=0.018, skn=-1.500, kur=1.631], skew [0.083 vs 0.085], 100% {1.357, 1.440} (wid=0.107 ws=0.072) (gid=1.392 gs=0.119)
      Skew group summary after 'PostConditioning Fixing Skew by cell sizing':
        skew_group PCI_CLK/func_best_mode: insertion delay [min=0.757, max=0.794, avg=0.779, sd=0.010, skn=-0.593, kur=0.173], skew [0.037 vs 0.085], 100% {0.757, 0.794} (wid=0.029 ws=0.023) (gid=0.784 gs=0.034)
        skew_group SDRAM_CLK/func_best_mode: insertion delay [min=1.357, max=1.440, avg=1.419, sd=0.018, skn=-1.500, kur=1.631], skew [0.083 vs 0.085], 100% {1.357, 1.440} (wid=0.107 ws=0.072) (gid=1.392 gs=0.119)
        skew_group SYS_2x_CLK/func_best_mode: insertion delay [min=0.822, max=0.902, avg=0.875, sd=0.023, skn=-1.045, kur=0.146], skew [0.080 vs 0.086], 100% {0.822, 0.902} (wid=0.014 ws=0.013) (gid=0.901 gs=0.084)
        skew_group SYS_2x_CLK/func_worst_mode: insertion delay [min=0.822, max=0.902, avg=0.838, sd=0.024, skn=2.120, kur=4.196], skew [0.080 vs 0.086], 100% {0.822, 0.902} (wid=0.010 ws=0.009) (gid=0.901 gs=0.084)
        skew_group ate_clk/test_best_mode: insertion delay [min=0.972, max=1.059, avg=1.033, sd=0.019, skn=-1.073, kur=0.164], skew [0.087 vs 0.085*], 99.7% {0.972, 1.057} (wid=0.059 ws=0.056) (gid=1.051 gs=0.119)
        skew_group ate_clk/test_worst_mode: insertion delay [min=0.972, max=1.055, avg=1.032, sd=0.019, skn=-1.065, kur=0.103], skew [0.083 vs 0.085], 100% {0.972, 1.055} (wid=0.059 ws=0.056) (gid=1.050 gs=0.119)
      Legalizer API calls during this step: 74 succeeded with high effort: 74 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
    PostConditioning Fixing Skew by cell sizing done. (took cpu=0:00:01.6 real=0:00:01.6)
    Reconnecting optimized routes...
    Reset timing graph...
Ignoring AAE DB Resetting ...
    Reset timing graph done.
    Reconnecting optimized routes done. (took cpu=0:00:00.2 real=0:00:00.2)
    Leaving CCOpt scope - Cleaning up placement interface...
    Leaving CCOpt scope - Cleaning up placement interface done. (took cpu=0:00:00.4 real=0:00:00.1)
    Leaving CCOpt scope - ClockRefiner...
    Soft fixed 388 clock instances.
    Performing Single Pass Refine Place.

*** Starting refinePlace (0:43:13 mem=6715.8M) ***
Total net bbox length = 8.694e+05 (5.130e+05 3.563e+05) (ext = 1.258e+04)
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Move report: Detail placement moves 22 insts, mean move: 2.00 um, max move: 8.36 um 
	Max move on inst (occ_int2/U_clk_control_i_2/U_cycle_ctr_i/add_421/U1): (15.66, 349.45) --> (22.34, 347.78)
	Runtime: CPU: 0:00:15.2 REAL: 0:00:05.0 MEM: 6705.5MB
Summary Report:
Instances move: 23 (out of 40858 movable)
Instances flipped: 0
Mean displacement: 1.99 um
Max displacement: 8.36 um (Instance: occ_int2/U_clk_control_i_2/U_cycle_ctr_i/add_421/U1) (15.656, 349.448) -> (22.344, 347.776)
	Length: 17 sites, height: 1 rows, site name: unit, cell type: XNOR2X1_RVT, constraint:Region
Physical-only instances move: 0 (out of 0 movable physical-only)
Total net bbox length = 8.694e+05 (5.131e+05 3.564e+05) (ext = 1.258e+04)
Runtime: CPU: 0:00:15.4 REAL: 0:00:05.0 MEM: 6705.5MB
*** Finished refinePlace (0:43:28 mem=6705.5M) ***
    ClockRefiner summary
    All clock instances: Moved 2, flipped 0 and cell swapped 0 (out of a total of 3888).
    All Clock instances: Average move = 1.82um
    The largest move was 1.98 um for I_PCI_TOP/I_PCI_CORE_mega_shift_reg_0__30_.
    Restoring pStatusCts on 388 clock instances.
    Leaving CCOpt scope - ClockRefiner done. (took cpu=0:00:16.3 real=0:00:06.0)
    Legalizer API calls during this step: 181 succeeded with high effort: 181 succeeded with medium effort: 0 succeeded with low effort: 0 succeeded with basic effort: 0 succeeded with basic unbounded effort: 0
  PostConditioning done.
Net route status summary:
  Clock:       415 (unrouted=12, trialRouted=0, noStatus=4, routed=0, fixed=399, [crossesIlmBoundary=0, tooFewTerms=12, (crossesIlmBoundary AND tooFewTerms=0)])
  Non-clock: 46945 (unrouted=3894, trialRouted=43051, noStatus=0, routed=0, fixed=0, [crossesIlmBoundary=0, tooFewTerms=3894, (crossesIlmBoundary AND tooFewTerms=0)])
  Update timing and DAG stats after post-conditioning...
  Update timing and DAG stats after post-conditioning done. (took cpu=0:00:00.0 real=0:00:00.0)
  Clock tree timing engine global stage delay update for worst_corner:setup.late...
  Clock tree timing engine global stage delay update for worst_corner:setup.late done. (took cpu=0:00:00.5 real=0:00:00.2)
  Clock DAG stats after post-conditioning:
    cell counts      : b=0, i=326, icg=30, dcg=0, l=39, total=395
    sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
    misc counts      : r=20, pp=1, mci=38
    cell areas       : b=0.000um^2, i=822.918um^2, icg=196.707um^2, dcg=0.000um^2, l=112.586um^2, total=1132.212um^2
    cell capacitance : b=0.000fF, i=1301.032fF, icg=21.175fF, dcg=0.000fF, l=39.769fF, total=1361.976fF
    sink capacitance : total=2688.728fF, avg=0.765fF, sd=0.890fF, min=0.000fF, max=10.000fF
    wire capacitance : top=332.892fF, trunk=1316.060fF, leaf=2128.943fF, total=3777.894fF
    wire lengths     : top=3665.489um, trunk=14299.772um, leaf=22068.467um, total=40033.728um
    hp wire lengths  : top=2584.456um, trunk=12624.968um, leaf=15203.748um, total=30413.172um
  Clock DAG net violations after post-conditioning:
    Capacitance : {count=4, worst=[11.375fF, 0.297fF, 0.253fF, 0.201fF]} avg=3.032fF sd=5.563fF sum=12.127fF
  Clock DAG primary half-corner transition distribution after post-conditioning:
    Top   : target=0.243ns count=7 avg=0.107ns sd=0.033ns min=0.087ns max=0.181ns {6 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
    Trunk : target=0.075ns count=1 avg=0.048ns sd=0.000ns min=0.048ns max=0.048ns {0 <= 0.045ns, 1 <= 0.060ns, 0 <= 0.068ns, 0 <= 0.071ns, 0 <= 0.075ns}
    Trunk : target=0.078ns count=1 avg=0.028ns sd=0.000ns min=0.028ns max=0.028ns {1 <= 0.047ns, 0 <= 0.062ns, 0 <= 0.070ns, 0 <= 0.074ns, 0 <= 0.078ns}
    Trunk : target=0.177ns count=5 avg=0.082ns sd=0.020ns min=0.056ns max=0.102ns {5 <= 0.106ns, 0 <= 0.141ns, 0 <= 0.159ns, 0 <= 0.168ns, 0 <= 0.177ns}
    Trunk : target=0.180ns count=2 avg=0.084ns sd=0.016ns min=0.072ns max=0.095ns {2 <= 0.108ns, 0 <= 0.144ns, 0 <= 0.162ns, 0 <= 0.171ns, 0 <= 0.180ns}
    Trunk : target=0.184ns count=7 avg=0.123ns sd=0.018ns min=0.110ns max=0.160ns {2 <= 0.111ns, 4 <= 0.148ns, 1 <= 0.166ns, 0 <= 0.175ns, 0 <= 0.184ns}
    Trunk : target=0.209ns count=2 avg=0.072ns sd=0.005ns min=0.068ns max=0.075ns {2 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
    Trunk : target=0.235ns count=3 avg=0.113ns sd=0.036ns min=0.072ns max=0.140ns {3 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
    Trunk : target=0.241ns count=1 avg=0.102ns sd=0.000ns min=0.102ns max=0.102ns {1 <= 0.144ns, 0 <= 0.192ns, 0 <= 0.217ns, 0 <= 0.229ns, 0 <= 0.241ns}
    Trunk : target=0.243ns count=205 avg=0.073ns sd=0.038ns min=0.000ns max=0.181ns {199 <= 0.146ns, 6 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
    Leaf  : target=0.078ns count=12 avg=0.063ns sd=0.012ns min=0.041ns max=0.076ns {2 <= 0.047ns, 3 <= 0.062ns, 3 <= 0.070ns, 3 <= 0.074ns, 1 <= 0.078ns}
    Leaf  : target=0.110ns count=3 avg=0.082ns sd=0.001ns min=0.081ns max=0.082ns {0 <= 0.066ns, 3 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
    Leaf  : target=0.209ns count=1 avg=0.061ns sd=0.000ns min=0.061ns max=0.061ns {1 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
    Leaf  : target=0.243ns count=181 avg=0.091ns sd=0.050ns min=0.034ns max=0.242ns {169 <= 0.146ns, 0 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 12 <= 0.243ns}
  Clock DAG library cell distribution after post-conditioning {count}:
     Invs: INVX16_LVT: 41 INVX8_LVT: 91 INVX4_LVT: 81 INVX2_LVT: 113 
     ICGs: CGLNPRX8_LVT: 7 CGLPPRX8_LVT: 3 CGLNPRX2_LVT: 5 CGLPPRX2_LVT: 15 
   Logics: LSUPX8_LVT: 1 AO21X2_LVT: 3 AO22X2_RVT: 16 AO21X1_LVT: 3 AO22X1_RVT: 16 
  Primary reporting skew groups after post-conditioning:
    skew_group SDRAM_CLK/func_best_mode: insertion delay [min=1.357, max=1.440, avg=1.419, sd=0.018, skn=-1.500, kur=1.631], skew [0.083 vs 0.085], 100% {1.357, 1.440} (wid=0.107 ws=0.072) (gid=1.392 gs=0.119)
  Skew group summary after post-conditioning:
    skew_group PCI_CLK/func_best_mode: insertion delay [min=0.757, max=0.794, avg=0.779, sd=0.010, skn=-0.593, kur=0.173], skew [0.037 vs 0.085], 100% {0.757, 0.794} (wid=0.029 ws=0.023) (gid=0.784 gs=0.034)
    skew_group SDRAM_CLK/func_best_mode: insertion delay [min=1.357, max=1.440, avg=1.419, sd=0.018, skn=-1.500, kur=1.631], skew [0.083 vs 0.085], 100% {1.357, 1.440} (wid=0.107 ws=0.072) (gid=1.392 gs=0.119)
    skew_group SYS_2x_CLK/func_best_mode: insertion delay [min=0.822, max=0.902, avg=0.875, sd=0.023, skn=-1.045, kur=0.146], skew [0.080 vs 0.086], 100% {0.822, 0.902} (wid=0.014 ws=0.013) (gid=0.901 gs=0.084)
    skew_group SYS_2x_CLK/func_worst_mode: insertion delay [min=0.822, max=0.902, avg=0.838, sd=0.024, skn=2.120, kur=4.196], skew [0.080 vs 0.086], 100% {0.822, 0.902} (wid=0.010 ws=0.009) (gid=0.901 gs=0.084)
    skew_group ate_clk/test_best_mode: insertion delay [min=0.972, max=1.059, avg=1.033, sd=0.019, skn=-1.073, kur=0.164], skew [0.087 vs 0.085*], 99.7% {0.972, 1.057} (wid=0.059 ws=0.056) (gid=1.051 gs=0.119)
    skew_group ate_clk/test_worst_mode: insertion delay [min=0.972, max=1.055, avg=1.032, sd=0.019, skn=-1.065, kur=0.103], skew [0.083 vs 0.085], 100% {0.972, 1.055} (wid=0.059 ws=0.056) (gid=1.050 gs=0.119)
  CCOpt::Phase::PostConditioning done. (took cpu=0:00:23.5 real=0:00:12.3)
  Post-balance tidy up or trial balance steps...
  
  Clock DAG stats at end of CTS:
  ==============================
  
  ----------------------------------------------------------
  Cell type                 Count    Area        Capacitance
  ----------------------------------------------------------
  Buffers                      0        0.000        0.000
  Inverters                  326      822.918     1301.032
  Integrated Clock Gates      30      196.707       21.175
  Discrete Clock Gates         0        0.000        0.000
  Clock Logic                 39      112.586       39.769
  All                        395     1132.212     1361.976
  ----------------------------------------------------------
  
  Clock DAG miscellaneous counts at end of CTS:
  =============================================
  
  ------------------------------
  Type                     Count
  ------------------------------
  Roots                     20
  Preserved Ports            1
  Multiple Clock Inputs     38
  ------------------------------
  
  
  Clock DAG sink counts at end of CTS:
  ====================================
  
  -------------------------
  Sink type           Count
  -------------------------
  Regular             3515
  Enable Latch           0
  Load Capacitance       0
  Antenna Diode          0
  Node Sink              0
  Total               3515
  -------------------------
  
  
  Clock DAG wire lengths at end of CTS:
  =====================================
  
  --------------------
  Type     Wire Length
  --------------------
  Top        3665.489
  Trunk     14299.772
  Leaf      22068.467
  Total     40033.728
  --------------------
  
  
  Clock DAG hp wire lengths at end of CTS:
  ========================================
  
  -----------------------
  Type     hp Wire Length
  -----------------------
  Top         2584.456
  Trunk      12624.968
  Leaf       15203.748
  Total      30413.172
  -----------------------
  
  
  Clock DAG capacitances at end of CTS:
  =====================================
  
  -----------------------------------------
  Type     Gate        Wire        Total
  -----------------------------------------
  Top       148.617     332.892     481.509
  Trunk    1288.086    1316.060    2604.145
  Leaf     2694.646    2128.943    4823.589
  Total    4131.349    3777.894    7909.244
  -----------------------------------------
  
  
  Clock DAG sink capacitances at end of CTS:
  ==========================================
  
  ---------------------------------------------------
  Total       Average    Std. Dev.    Min      Max
  ---------------------------------------------------
  2688.728     0.765       0.890      0.000    10.000
  ---------------------------------------------------
  
  
  Clock DAG net violations at end of CTS:
  =======================================
  
  ------------------------------------------------------------------------------------------------
  Type           Units    Count    Average    Std. Dev.    Sum       Top 10 violations
  ------------------------------------------------------------------------------------------------
  Capacitance    fF         4       3.032       5.563      12.127    [11.375, 0.297, 0.253, 0.201]
  ------------------------------------------------------------------------------------------------
  
  
  Clock DAG primary half-corner transition distribution at end of CTS:
  ====================================================================
  
  -----------------------------------------------------------------------------------------------------------------------------------------------------------------
  Net Type    Target    Count    Average    Std. Dev.    Min      Max      Distribution                                                                 Over Target
  -----------------------------------------------------------------------------------------------------------------------------------------------------------------
  Top         0.243        7      0.107       0.033      0.087    0.181    {6 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}            -
  Trunk       0.075        1      0.048       0.000      0.048    0.048    {0 <= 0.045ns, 1 <= 0.060ns, 0 <= 0.068ns, 0 <= 0.071ns, 0 <= 0.075ns}            -
  Trunk       0.078        1      0.028       0.000      0.028    0.028    {1 <= 0.047ns, 0 <= 0.062ns, 0 <= 0.070ns, 0 <= 0.074ns, 0 <= 0.078ns}            -
  Trunk       0.177        5      0.082       0.020      0.056    0.102    {5 <= 0.106ns, 0 <= 0.141ns, 0 <= 0.159ns, 0 <= 0.168ns, 0 <= 0.177ns}            -
  Trunk       0.180        2      0.084       0.016      0.072    0.095    {2 <= 0.108ns, 0 <= 0.144ns, 0 <= 0.162ns, 0 <= 0.171ns, 0 <= 0.180ns}            -
  Trunk       0.184        7      0.123       0.018      0.110    0.160    {2 <= 0.111ns, 4 <= 0.148ns, 1 <= 0.166ns, 0 <= 0.175ns, 0 <= 0.184ns}            -
  Trunk       0.209        2      0.072       0.005      0.068    0.075    {2 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}            -
  Trunk       0.235        3      0.113       0.036      0.072    0.140    {3 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}            -
  Trunk       0.241        1      0.102       0.000      0.102    0.102    {1 <= 0.144ns, 0 <= 0.192ns, 0 <= 0.217ns, 0 <= 0.229ns, 0 <= 0.241ns}            -
  Trunk       0.243      205      0.073       0.038      0.000    0.181    {199 <= 0.146ns, 6 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}          -
  Leaf        0.078       12      0.063       0.012      0.041    0.076    {2 <= 0.047ns, 3 <= 0.062ns, 3 <= 0.070ns, 3 <= 0.074ns, 1 <= 0.078ns}            -
  Leaf        0.110        3      0.082       0.001      0.081    0.082    {0 <= 0.066ns, 3 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}            -
  Leaf        0.209        1      0.061       0.000      0.061    0.061    {1 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}            -
  Leaf        0.243      181      0.091       0.050      0.034    0.242    {169 <= 0.146ns, 0 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 12 <= 0.243ns}         -
  -----------------------------------------------------------------------------------------------------------------------------------------------------------------
  
  
  Clock DAG library cell distribution at end of CTS:
  ==================================================
  
  -----------------------------------------------
  Name            Type        Inst     Inst Area 
                              Count    (um^2)
  -----------------------------------------------
  INVX16_LVT      inverter      41      208.398
  INVX8_LVT       inverter      91      277.525
  INVX4_LVT       inverter      81      164.685
  INVX2_LVT       inverter     113      172.310
  CGLNPRX8_LVT    icg            7       55.149
  CGLPPRX8_LVT    icg            3       22.111
  CGLNPRX2_LVT    icg            5       31.768
  CGLPPRX2_LVT    icg           15       87.680
  LSUPX8_LVT      logic          1       11.182
  AO21X2_LVT      logic          3        8.387
  AO22X2_RVT      logic         16       44.729
  AO21X1_LVT      logic          3        7.624
  AO22X1_RVT      logic         16       40.663
  -----------------------------------------------
  
  
  Primary reporting skew groups summary at end of CTS:
  ====================================================
  
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  Half-corner                Skew Group                  Min ID    Max ID    Skew     Skew target    Wire skew    Worst sink skew    Average ID    Std.Dev    Skewness    Kurtosis    Skew window occupancy
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  worst_corner:setup.late    SDRAM_CLK/func_best_mode    1.357     1.440     0.083       0.085         0.072           0.018           1.419        0.018      -1.500      1.631      100% {1.357, 1.440}
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  
  
  Skew group summary at end of CTS:
  =================================
  
  -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  Half-corner                Skew Group                    Min ID    Max ID    Skew     Skew target    Wire skew    Worst sink skew    Average ID    Std.Dev    Skewness    Kurtosis    Skew window occupancy
  -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  worst_corner:setup.late    PCI_CLK/func_best_mode        0.757     0.794     0.037      0.085          0.023           0.004           0.779        0.010      -0.593      0.173      100% {0.757, 0.794}
  worst_corner:setup.late    SDRAM_CLK/func_best_mode      1.357     1.440     0.083      0.085          0.072           0.018           1.419        0.018      -1.500      1.631      100% {1.357, 1.440}
  worst_corner:setup.late    SYS_2x_CLK/func_best_mode     0.822     0.902     0.080      0.086          0.013           0.009           0.875        0.023      -1.045      0.146      100% {0.822, 0.902}
  worst_corner:setup.late    SYS_2x_CLK/func_worst_mode    0.822     0.902     0.080      0.086          0.009           0.000           0.838        0.024       2.120      4.196      100% {0.822, 0.902}
  worst_corner:setup.late    ate_clk/test_best_mode        0.972     1.059     0.087      0.085*         0.056           0.018           1.033        0.019      -1.073      0.164      99.7% {0.972, 1.057}
  worst_corner:setup.late    ate_clk/test_worst_mode       0.972     1.055     0.083      0.085          0.056           0.018           1.032        0.019      -1.065      0.103      100% {0.972, 1.055}
  -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  
  
  Min/max skew group path pins for unmet skew targets:
  ====================================================
  
  ---------------------------------------------------------------------------------------------------------------------------------------
  Half-corner                Skew Group                Min/Max    Delay    Pin
  ---------------------------------------------------------------------------------------------------------------------------------------
  worst_corner:setup.late    ate_clk/test_best_mode    Min        0.972    I_SDRAM_TOP/I_SDRAM_READ_FIFO_SD_FIFO_CTL_U1_syncff_reg_6_/CLK
  worst_corner:setup.late    ate_clk/test_best_mode    Max        1.059    I_RISC_CORE/I_STACK_TOP_I1_STACK_MEM_Stack_Mem_reg_5__2_/CLK
  ---------------------------------------------------------------------------------------------------------------------------------------
  
  
  Found a total of 0 clock tree pins with a slew violation.
  
  Post-balance tidy up or trial balance steps done. (took cpu=0:00:00.2 real=0:00:00.2)
Synthesizing clock trees done.
Tidy Up And Update Timing...
External - Set all clocks to propagated mode...
**WARN: (IMPCCOPT-2015):	Innovus will not update I/O latencies for the following reason(s):
 * CCOpt property update_io_latency is false

Setting all clocks to propagated mode.
External - Set all clocks to propagated mode done. (took cpu=0:00:07.2 real=0:00:01.8)
Clock DAG stats after update timingGraph:
  cell counts      : b=0, i=326, icg=30, dcg=0, l=39, total=395
  sink counts      : regular=3515, enable_latch=0, load_capacitance=0, antenna=0, node_sink=0, total=3515
  misc counts      : r=20, pp=1, mci=38
  cell areas       : b=0.000um^2, i=822.918um^2, icg=196.707um^2, dcg=0.000um^2, l=112.586um^2, total=1132.212um^2
  cell capacitance : b=0.000fF, i=1301.032fF, icg=21.175fF, dcg=0.000fF, l=39.769fF, total=1361.976fF
  sink capacitance : total=2688.728fF, avg=0.765fF, sd=0.890fF, min=0.000fF, max=10.000fF
  wire capacitance : top=332.892fF, trunk=1316.060fF, leaf=2128.943fF, total=3777.894fF
  wire lengths     : top=3665.489um, trunk=14299.772um, leaf=22068.467um, total=40033.728um
  hp wire lengths  : top=2584.456um, trunk=12624.968um, leaf=15203.748um, total=30413.172um
Clock DAG net violations after update timingGraph:
  Capacitance : {count=4, worst=[11.375fF, 0.297fF, 0.253fF, 0.201fF]} avg=3.032fF sd=5.563fF sum=12.127fF
Clock DAG primary half-corner transition distribution after update timingGraph:
  Top   : target=0.243ns count=7 avg=0.107ns sd=0.033ns min=0.087ns max=0.181ns {6 <= 0.146ns, 1 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
  Trunk : target=0.075ns count=1 avg=0.048ns sd=0.000ns min=0.048ns max=0.048ns {0 <= 0.045ns, 1 <= 0.060ns, 0 <= 0.068ns, 0 <= 0.071ns, 0 <= 0.075ns}
  Trunk : target=0.078ns count=1 avg=0.028ns sd=0.000ns min=0.028ns max=0.028ns {1 <= 0.047ns, 0 <= 0.062ns, 0 <= 0.070ns, 0 <= 0.074ns, 0 <= 0.078ns}
  Trunk : target=0.177ns count=5 avg=0.082ns sd=0.020ns min=0.056ns max=0.102ns {5 <= 0.106ns, 0 <= 0.141ns, 0 <= 0.159ns, 0 <= 0.168ns, 0 <= 0.177ns}
  Trunk : target=0.180ns count=2 avg=0.084ns sd=0.016ns min=0.072ns max=0.095ns {2 <= 0.108ns, 0 <= 0.144ns, 0 <= 0.162ns, 0 <= 0.171ns, 0 <= 0.180ns}
  Trunk : target=0.184ns count=7 avg=0.123ns sd=0.018ns min=0.110ns max=0.160ns {2 <= 0.111ns, 4 <= 0.148ns, 1 <= 0.166ns, 0 <= 0.175ns, 0 <= 0.184ns}
  Trunk : target=0.209ns count=2 avg=0.072ns sd=0.005ns min=0.068ns max=0.075ns {2 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
  Trunk : target=0.235ns count=3 avg=0.113ns sd=0.036ns min=0.072ns max=0.140ns {3 <= 0.141ns, 0 <= 0.188ns, 0 <= 0.211ns, 0 <= 0.223ns, 0 <= 0.235ns}
  Trunk : target=0.241ns count=1 avg=0.102ns sd=0.000ns min=0.102ns max=0.102ns {1 <= 0.144ns, 0 <= 0.192ns, 0 <= 0.217ns, 0 <= 0.229ns, 0 <= 0.241ns}
  Trunk : target=0.243ns count=205 avg=0.073ns sd=0.038ns min=0.000ns max=0.181ns {199 <= 0.146ns, 6 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 0 <= 0.243ns}
  Leaf  : target=0.078ns count=12 avg=0.063ns sd=0.012ns min=0.041ns max=0.076ns {2 <= 0.047ns, 3 <= 0.062ns, 3 <= 0.070ns, 3 <= 0.074ns, 1 <= 0.078ns}
  Leaf  : target=0.110ns count=3 avg=0.082ns sd=0.001ns min=0.081ns max=0.082ns {0 <= 0.066ns, 3 <= 0.088ns, 0 <= 0.099ns, 0 <= 0.105ns, 0 <= 0.110ns}
  Leaf  : target=0.209ns count=1 avg=0.061ns sd=0.000ns min=0.061ns max=0.061ns {1 <= 0.126ns, 0 <= 0.167ns, 0 <= 0.188ns, 0 <= 0.199ns, 0 <= 0.209ns}
  Leaf  : target=0.243ns count=181 avg=0.091ns sd=0.050ns min=0.034ns max=0.242ns {169 <= 0.146ns, 0 <= 0.194ns, 0 <= 0.219ns, 0 <= 0.231ns, 12 <= 0.243ns}
Clock DAG library cell distribution after update timingGraph {count}:
   Invs: INVX16_LVT: 41 INVX8_LVT: 91 INVX4_LVT: 81 INVX2_LVT: 113 
   ICGs: CGLNPRX8_LVT: 7 CGLPPRX8_LVT: 3 CGLNPRX2_LVT: 5 CGLPPRX2_LVT: 15 
 Logics: LSUPX8_LVT: 1 AO21X2_LVT: 3 AO22X2_RVT: 16 AO21X1_LVT: 3 AO22X1_RVT: 16 
Primary reporting skew groups after update timingGraph:
  skew_group SDRAM_CLK/func_best_mode: insertion delay [min=1.357, max=1.440, avg=1.419, sd=0.018, skn=-1.500, kur=1.631], skew [0.083 vs 0.085], 100% {1.357, 1.440} (wid=0.107 ws=0.072) (gid=1.392 gs=0.119)
Skew group summary after update timingGraph:
  skew_group PCI_CLK/func_best_mode: insertion delay [min=0.757, max=0.794, avg=0.779, sd=0.010, skn=-0.593, kur=0.173], skew [0.037 vs 0.085], 100% {0.757, 0.794} (wid=0.029 ws=0.023) (gid=0.784 gs=0.034)
  skew_group SDRAM_CLK/func_best_mode: insertion delay [min=1.357, max=1.440, avg=1.419, sd=0.018, skn=-1.500, kur=1.631], skew [0.083 vs 0.085], 100% {1.357, 1.440} (wid=0.107 ws=0.072) (gid=1.392 gs=0.119)
  skew_group SYS_2x_CLK/func_best_mode: insertion delay [min=0.822, max=0.902, avg=0.875, sd=0.023, skn=-1.045, kur=0.146], skew [0.080 vs 0.086], 100% {0.822, 0.902} (wid=0.014 ws=0.013) (gid=0.901 gs=0.084)
  skew_group SYS_2x_CLK/func_worst_mode: insertion delay [min=0.822, max=0.902, avg=0.838, sd=0.024, skn=2.120, kur=4.196], skew [0.080 vs 0.086], 100% {0.822, 0.902} (wid=0.010 ws=0.009) (gid=0.901 gs=0.084)
  skew_group ate_clk/test_best_mode: insertion delay [min=0.972, max=1.059, avg=1.033, sd=0.019, skn=-1.073, kur=0.164], skew [0.087 vs 0.085*], 99.7% {0.972, 1.057} (wid=0.059 ws=0.056) (gid=1.051 gs=0.119)
  skew_group ate_clk/test_worst_mode: insertion delay [min=0.972, max=1.055, avg=1.032, sd=0.019, skn=-1.065, kur=0.103], skew [0.083 vs 0.085], 100% {0.972, 1.055} (wid=0.059 ws=0.056) (gid=1.050 gs=0.119)
Logging CTS constraint violations...
  Clock tree flexible_htree_flex_HTREE_5 has 1 max_capacitance violation.
  Clock tree flexible_htree_flex_HTREE_3 has 2 max_capacitance violations.
  Clock tree SDRAM_CLK has 1 max_capacitance violation.
**WARN: (IMPCCOPT-1033):	Did not meet the max_capacitance constraint of 82.000fF below cell CTS_cfh_inv_00002 (a lib_cell INVX16_LVT) at (499.624,287.584), in power domain PD_ORCA_TOP. Achieved capacitance of 93.375fF.
Type 'man IMPCCOPT-1033' for more detail.
**WARN: (IMPCCOPT-1033):	Did not meet the max_capacitance constraint of 32.000fF below cell I_SDRAM_TOP/I_SDRAM_IF/CTS_ccl_a_inv_00099 (a lib_cell INVX4_LVT) at (383.192,357.808), in power domain PD_ORCA_TOP. Achieved capacitance of 32.297fF.
Type 'man IMPCCOPT-1033' for more detail.
**WARN: (IMPCCOPT-1033):	Did not meet the max_capacitance constraint of 32.000fF below cell I_SDRAM_TOP/I_SDRAM_IF/CTS_ccl_a_inv_00074 (a lib_cell INVX4_LVT) at (255.968,285.912), in power domain PD_ORCA_TOP. Achieved capacitance of 32.253fF.
Type 'man IMPCCOPT-1033' for more detail.
**WARN: (IMPCCOPT-1033):	Did not meet the max_capacitance constraint of 32.000fF below cell I_SDRAM_TOP/I_SDRAM_IF/CTS_ccl_a_inv_00072 (a lib_cell INVX4_LVT) at (260.528,290.928), in power domain PD_ORCA_TOP. Achieved capacitance of 32.201fF.
Type 'man IMPCCOPT-1033' for more detail.
**WARN: (IMPCCOPT-1023):	Did not meet the skew target of 0.085ns for skew group ate_clk/test_best_mode in half corner worst_corner:setup.late. Achieved skew of 0.087ns.
Type 'man IMPCCOPT-1023' for more detail.
**WARN: (IMPCCOPT-1026):	Did not meet the insertion delay target of 0.800ns (+/- 0.043ns) for skew group SDRAM_CLK/func_best_mode. Achieved longest insertion delay of 1.440ns.
Type 'man IMPCCOPT-1026' for more detail.
**WARN: (IMPCCOPT-1026):	Did not meet the insertion delay target of 0.800ns (+/- 0.043ns) for skew group ate_clk/test_worst_mode. Achieved longest insertion delay of 1.055ns.
Type 'man IMPCCOPT-1026' for more detail.
**WARN: (IMPCCOPT-1026):	Did not meet the insertion delay target of 0.800ns for skew group ate_clk/test_best_mode. Achieved shortest insertion delay of 0.972ns.
Type 'man IMPCCOPT-1026' for more detail.
**WARN: (IMPCCOPT-1026):	Did not meet the insertion delay target of 0.800ns (+/- 0.043ns) for skew group SYS_2x_CLK/func_worst_mode. Achieved longest insertion delay of 0.902ns.
Type 'man IMPCCOPT-1026' for more detail.
**WARN: (IMPCCOPT-1026):	Did not meet the insertion delay target of 0.800ns (+/- 0.043ns) for skew group SYS_2x_CLK/func_best_mode. Achieved longest insertion delay of 0.902ns.
Type 'man IMPCCOPT-1026' for more detail.
**WARN: (IMPCCOPT-1026):	Did not meet the insertion delay target of 0.800ns (+/- 0.043ns) for skew group PCI_CLK/func_best_mode. Achieved shortest insertion delay of 0.757ns.
Type 'man IMPCCOPT-1026' for more detail.
Logging CTS constraint violations done.
Tidy Up And Update Timing done. (took cpu=0:00:07.6 real=0:00:02.2)
Copying last skew targets (including wire skew targets) from PCI_CLK/func_best_mode to PCI_CLK/func_worst_mode (the duplicate skew group).
Copying last insertion target (including wire insertion delay target) from PCI_CLK/func_best_mode to PCI_CLK/func_worst_mode (the duplicate skew group).
Copying last skew targets (including wire skew targets) from PCI_CLK/func_best_mode to PCI_CLK/test_best_mode (the duplicate skew group).
Copying last insertion target (including wire insertion delay target) from PCI_CLK/func_best_mode to PCI_CLK/test_best_mode (the duplicate skew group).
Copying last skew targets (including wire skew targets) from PCI_CLK/func_best_mode to PCI_CLK/test_worst_mode (the duplicate skew group).
Copying last insertion target (including wire insertion delay target) from PCI_CLK/func_best_mode to PCI_CLK/test_worst_mode (the duplicate skew group).
Copying last skew targets (including wire skew targets) from SDRAM_CLK/func_best_mode to SDRAM_CLK/func_worst_mode (the duplicate skew group).
Copying last insertion target (including wire insertion delay target) from SDRAM_CLK/func_best_mode to SDRAM_CLK/func_worst_mode (the duplicate skew group).
Copying last skew targets (including wire skew targets) from SDRAM_CLK/func_best_mode to SDRAM_CLK/test_best_mode (the duplicate skew group).
Copying last insertion target (including wire insertion delay target) from SDRAM_CLK/func_best_mode to SDRAM_CLK/test_best_mode (the duplicate skew group).
Copying last skew targets (including wire skew targets) from SDRAM_CLK/func_best_mode to SDRAM_CLK/test_worst_mode (the duplicate skew group).
Copying last insertion target (including wire insertion delay target) from SDRAM_CLK/func_best_mode to SDRAM_CLK/test_worst_mode (the duplicate skew group).
Copying last skew targets (including wire skew targets) from SYS_2x_CLK/func_best_mode to SYS_2x_CLK/test_best_mode (the duplicate skew group).
Copying last insertion target (including wire insertion delay target) from SYS_2x_CLK/func_best_mode to SYS_2x_CLK/test_best_mode (the duplicate skew group).
Copying last skew targets (including wire skew targets) from SYS_2x_CLK/func_worst_mode to SYS_2x_CLK/test_worst_mode (the duplicate skew group).
Copying last insertion target (including wire insertion delay target) from SYS_2x_CLK/func_worst_mode to SYS_2x_CLK/test_worst_mode (the duplicate skew group).
Runtime done. (took cpu=0:06:50 real=0:03:11)
Runtime Summary
===============
Clock Runtime:  (58%) Core CTS         111.99 (Init 9.97, Construction 44.19, Implementation 37.10, eGRPC 7.45, PostConditioning 6.34, Other 6.95)
Clock Runtime:  (33%) CTS services      64.71 (RefinePlace 18.25, EarlyGlobalClock 10.51, NanoRoute 31.24, ExtractRC 4.71, TimingAnalysis 0.00)
Clock Runtime:   (7%) Other CTS         13.77 (Init 4.75, CongRepair/EGR-DP 7.17, TimingUpdate 1.85, Other 0.00)
Clock Runtime: (100%) Total            190.47

*** CTS #1 [finish] (ccopt_design #1) : cpu/real = 0:06:47.9/0:03:09.8 (2.1), totSession cpu/real = 0:43:37.3/0:19:37.2 (2.2), mem = 7159.2M
Synthesizing clock trees with CCOpt done.
      flow.cputime  flow.realtime  timing.setup.tns  timing.setup.wns  snapshot
UM:*                                                                   cts
Begin: Reorder Scan Chains
**WARN: (IMPSC-1020):	Instance's output pin "snps_clk_chain_1/U2/Y" (Cell "AO22X1_RVT") has multiple corresponding input pins for scan tracing. Please specify the instance in scan DEF.  You can also apply "setScanReorderMode -compLogic true" to trace through the chain but it could be not exactly the chain that user needed.
**WARN: (IMPSC-1001):	Unable to trace scan chain "5". Check the information during tracing.
Type 'man IMPSC-1001' for more detail.
**WARN: (IMPSC-1020):	Instance's output pin "I_CLOCKING/snps_clk_chain_0/U2/Y" (Cell "AO22X1_RVT") has multiple corresponding input pins for scan tracing. Please specify the instance in scan DEF.  You can also apply "setScanReorderMode -compLogic true" to trace through the chain but it could be not exactly the chain that user needed.
**WARN: (IMPSC-1001):	Unable to trace scan chain "6". Check the information during tracing.
Type 'man IMPSC-1001' for more detail.
*** Scan Trace Summary (runtime: cpu: 0:00:00.0 , real: 0:00:00.0): 
Successfully traced 3 scan chains (total 4530 scan bits).
Start applying DEF ordered sections ...
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_PCI_TOP/I_PCI_READ_FIFO_PCI_FIFO_CTL_U1_count_int_reg_5_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_0/R_573" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_0/s3_op2_reg_25_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_0/s3_op2_reg_27_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_0/R_81" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_0/R_96_IP" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_0/R_77_IP" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_0/R_79_IP" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_0/mega_shift_reg_0__13_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_0/mega_shift_reg_0__4_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/R_540" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/s1_op1_reg_10_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/mega_shift_reg_0__22_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/mega_shift_reg_0__21_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/R_35_IP" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/R_673" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/R_43_IP" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/trans3_reg" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/R_676_IP" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/R_38_IP" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (EMS-27):	Message (IMPSC-1138) has exceeded the current message display limit of 20.
To increase the message display limit, refer to the product command reference manual.
**WARN: (IMPSC-1144):	Scan chain "5" was not traced through. Skip apply DEF ordered section.
**WARN: (IMPSC-1144):	Scan chain "6" was not traced through. Skip apply DEF ordered section.
**WARN: (IMPSC-1143):	Unable to apply DEF ordered sections for 2 scan chain(s). Check previous warning.
*** Scan Sanity Check Summary:
*** 3 scan chains passed sanity check.
DBG: sciUnitLenDelay = 0.123450
Set analysis mode to hold.
AAE_INFO: opIsDesignInPostRouteState() is 0
#################################################################################
# Design Stage: PreRoute
# Design Name: ORCA_TOP
# Design Mode: 28nm
# Analysis Mode: MMMC Non-OCV 
# Parasitics Mode: No SPEF/RCDB 
# Signoff Settings: SI Off 
#################################################################################
Calculate delays in BcWc mode...
Calculate delays in BcWc mode...
Start delay calculation (fullDC) (8 T). (MEM=3719.98)
*** Calculating scaling factor for best_libs libraries using the default operating condition of each library.
Total number of fetched objects 50050
AAE_INFO: Total number of nets for which stage creation was skipped for all views 0
End delay calculation. (MEM=3736.93 CPU=0:00:25.1 REAL=0:00:03.0)
End delay calculation (fullDC). (MEM=3736.93 CPU=0:00:32.3 REAL=0:00:05.0)
DBG: scgNrActiveHoldView = 2
**WARN: (IMPSC-1020):	Instance's output pin "snps_clk_chain_1/U2/Y" (Cell "AO22X1_RVT") has multiple corresponding input pins for scan tracing. Please specify the instance in scan DEF.  You can also apply "setScanReorderMode -compLogic true" to trace through the chain but it could be not exactly the chain that user needed.
**WARN: (IMPSC-1001):	Unable to trace scan chain "5". Check the information during tracing.
Type 'man IMPSC-1001' for more detail.
**WARN: (IMPSC-1020):	Instance's output pin "I_CLOCKING/snps_clk_chain_0/U2/Y" (Cell "AO22X1_RVT") has multiple corresponding input pins for scan tracing. Please specify the instance in scan DEF.  You can also apply "setScanReorderMode -compLogic true" to trace through the chain but it could be not exactly the chain that user needed.
**WARN: (IMPSC-1001):	Unable to trace scan chain "6". Check the information during tracing.
Type 'man IMPSC-1001' for more detail.
*** Scan Trace Summary (runtime: cpu: 0:00:00.1 , real: 0:00:00.0): 
Successfully traced 3 scan chains (total 4530 scan bits).
Start applying DEF ordered sections ...
**WARN: (IMPSC-1144):	Scan chain "5" was not traced through. Skip apply DEF ordered section.
**WARN: (IMPSC-1144):	Scan chain "6" was not traced through. Skip apply DEF ordered section.
**WARN: (IMPSC-1143):	Unable to apply DEF ordered sections for 2 scan chain(s). Check previous warning.
*** Scan Sanity Check Summary:
*** 3 scan chains passed sanity check.
**WARN: (IMPSC-1117):	Skip reordering scan chain "5" because tracing did not succeed.
**WARN: (IMPSC-1117):	Skip reordering scan chain "6" because tracing did not succeed.
AAE_INFO: opIsDesignInPostRouteState() is 0
#################################################################################
# Design Stage: PreRoute
# Design Name: ORCA_TOP
# Design Mode: 28nm
# Analysis Mode: MMMC Non-OCV 
# Parasitics Mode: No SPEF/RCDB 
# Signoff Settings: SI Off 
#################################################################################
Calculate delays in BcWc mode...
Calculate delays in BcWc mode...
Start delay calculation (fullDC) (8 T). (MEM=3739.18)
Total number of fetched objects 50050
AAE_INFO: Total number of nets for which stage creation was skipped for all views 0
End delay calculation. (MEM=3749.76 CPU=0:00:25.2 REAL=0:00:03.0)
End delay calculation (fullDC). (MEM=3749.76 CPU=0:00:32.8 REAL=0:00:05.0)
Restore timing analysis mode.
*** Summary: Scan Reorder within scan chain
Initial total scan wire length:    37876.120 (floating:    29743.664)
Final   total scan wire length:    37876.120 (floating:    29743.664)
Improvement:        0.000   percent  0.00 (floating improvement:        0.000   percent  0.00)
Initial scan reorder max long connection: not available for -stitchChainsAfterFreeMerging
Final   scan reorder max long connection:      481.232
Total net length = 8.865e+05 (5.195e+05 3.670e+05) (ext = 1.448e+04)
*** End of ScanReorder (cpu=0:01:37, real=0:00:19.0, mem=5604.2M) ***
End: Reorder Scan Chains
**optDesign ... cpu = 0:00:00, real = 0:00:00, mem = 3504.9M, totSessionCpu=0:45:15 **
GigaOpt running with 8 threads.
*** InitOpt #1 [begin] (ccopt_design #1) : totSession cpu/real = 0:45:15.3/0:19:56.6 (2.3), mem = 4916.2M
**INFO: setDesignMode -flowEffort standard -> setting 'setOptMode -allEndPoints true' for the duration of this command.
Need call spDPlaceInit before registerPrioInstLoc.
**WARN: (IMPOPT-3668):	There are 48 nets with MSV violations, timing and DRV optimization of such nets is limited.  Please use verifyPowerDomain to analyze these further.
[GPS-MSV] Msv Violating net with fanout count = 1: I_RISC_CORE/I_REG_FILE_data_out_A[15]
[GPS-MSV] Timing and DRV optimization for this net is limited, Please correct the MSV violation. 
[GPS-MSV] UPF Flow. Number of Power Domains: 2
[GPS-MSV]   Power Domain 'PD_RISC_CORE' (tag=1)
[GPS-MSV]   Power Domain 'PD_ORCA_TOP' (tag=2) Default
RODC: v2.8s

**WARN: (IMPOPT-3564):	The following cells are set dont_use temporarily by the tool because there are no rows defined for their technology site, or they are not placeable in any power domain, or their pins cannot be snapped to the tracks. To avoid this message, review the floorplan, msv setting, the library setting or set manually those cells as dont_use.
	Cell FOOT2X16_HVT, site unit.
	Cell FOOT2X16_LVT, site unit.
	Cell FOOT2X16_RVT, site unit.
	Cell FOOT2X2_HVT, site unit.
	Cell FOOT2X2_LVT, site unit.
	Cell FOOT2X2_RVT, site unit.
	Cell FOOT2X32_HVT, site unit.
	Cell FOOT2X32_LVT, site unit.
	Cell FOOT2X32_RVT, site unit.
	Cell FOOT2X4_HVT, site unit.
	Cell FOOT2X4_LVT, site unit.
	Cell FOOT2X4_RVT, site unit.
	Cell FOOT2X8_HVT, site unit.
	Cell FOOT2X8_LVT, site unit.
	Cell FOOT2X8_RVT, site unit.
	Cell FOOTX16_HVT, site unit.
	Cell FOOTX16_LVT, site unit.
	Cell FOOTX16_RVT, site unit.
	Cell FOOTX2_HVT, site unit.
	Cell FOOTX2_LVT, site unit.
	...
	Reporting only the 20 first cells found...
.
Info: Using SynthesisEngine executable '/pkgs/cadence/2024-03/DDI231/INNOVUS231/bin/innovus_'.
      SynthesisEngine workers will not check out additional licenses.

**INFO: Using Advanced Metric Collection system.
**optDesign ... cpu = 0:00:11, real = 0:00:32, mem = 3626.3M, totSessionCpu=0:45:26 **
#optDebug: { P: 28 W: 6195 FE: standard PE: none LDR: 1}
*** optDesign -postCTS ***
DRC Margin: user margin 0.0; extra margin 0.2
Hold Target Slack: user slack 0
Setup Target Slack: user slack 0; extra slack 0.0

Multi-VT timing optimization disabled based on library information.
Start to check current routing status for nets...
All nets are already routed correctly.
End to check current routing status for nets (mem=4988.2M)
**WARN: (IMPOPT-3668):	There are 48 nets with MSV violations, timing and DRV optimization of such nets is limited.  Please use verifyPowerDomain to analyze these further.

Starting delay calculation for Setup views
AAE_INFO: opIsDesignInPostRouteState() is 0
#################################################################################
# Design Stage: PreRoute
# Design Name: ORCA_TOP
# Design Mode: 28nm
# Analysis Mode: MMMC Non-OCV 
# Parasitics Mode: No SPEF/RCDB 
# Signoff Settings: SI Off 
#################################################################################
Calculate delays in BcWc mode...
Calculate delays in BcWc mode...
Start delay calculation (fullDC) (8 T). (MEM=3643.09)
*** Calculating scaling factor for worst_libs libraries using the default operating condition of each library.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25667_Addr_A_6, driver I_RISC_CORE/FE_OFC5299_Addr_A_6/Y (cell NBUFFX2_LVT) voltage 0.95 does not match receiver I_RISC_CORE/I_REG_FILE_REG_FILE_C_RAM/A2[6] (cell SRAM2RW128x16) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25653_I_DATA_PATH_N55, driver I_RISC_CORE/FE_OFC5285_I_DATA_PATH_N55/Y (cell NBUFFX2_LVT) voltage 0.95 does not match receiver I_RISC_CORE/I_DATA_PATH_Oprnd_B_reg_6_/D (cell SDFFX2_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25665_n1200, driver I_RISC_CORE/FE_OFC5297_n1200/Y (cell NBUFFX4_LVT) voltage 0.95 does not match receiver I_RISC_CORE/U130/A2 (cell OAI22X1_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25661_n681, driver I_RISC_CORE/FE_OFC5293_n681/Y (cell NBUFFX2_LVT) voltage 0.95 does not match receiver I_RISC_CORE/I_DATA_PATH_Oprnd_B_reg_7_/D (cell SDFFX2_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25655_RegPort_C_13, driver I_RISC_CORE/FE_OFC5287_RegPort_C_13/Y (cell NBUFFX2_LVT) voltage 0.95 does not match receiver I_RISC_CORE/I_REG_FILE_REG_FILE_A_RAM/I1[13] (cell SRAM2RW128x16) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25652_n, driver I_RISC_CORE/U1617/Y (cell AO22X1_LVT) voltage 0.75 does not match receiver I_RISC_CORE/FE_OFC5284_n714/A (cell NBUFFX2_LVT) voltage 0.95 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25635_n_12, driver I_RISC_CORE/FE_OFC5267_n_12/Y (cell INVX1_LVT) voltage 0.95 does not match receiver I_RISC_CORE/I_INSTRN_LAT_Crnt_Instrn_2_reg_22_/D (cell SDFFARX1_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25667_Addr_A_6, driver I_RISC_CORE/FE_OFC5299_Addr_A_6/Y (cell NBUFFX2_LVT) voltage 0.95 does not match receiver I_RISC_CORE/I_REG_FILE_REG_FILE_A_RAM/A2[6] (cell SRAM2RW128x16) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25603_n1556, driver I_RISC_CORE/FE_OFC5236_n1556/Y (cell NBUFFX2_LVT) voltage 0.95 does not match receiver I_RISC_CORE/U818/A1 (cell NOR2X1_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25532_n1550, driver I_RISC_CORE/FE_OFC5168_n1550/Y (cell NBUFFX2_LVT) voltage 0.95 does not match receiver I_RISC_CORE/U620/A2 (cell NAND2X0_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25532_n1550, driver I_RISC_CORE/FE_OFC5168_n1550/Y (cell NBUFFX2_LVT) voltage 0.95 does not match receiver I_RISC_CORE/U710/A1 (cell OR2X1_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25532_n1550, driver I_RISC_CORE/FE_OFC5168_n1550/Y (cell NBUFFX2_LVT) voltage 0.95 does not match receiver I_RISC_CORE/U1547/A (cell INVX1_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25532_n1550, driver I_RISC_CORE/FE_OFC5168_n1550/Y (cell NBUFFX2_LVT) voltage 0.95 does not match receiver I_RISC_CORE/U1193/A1 (cell OA21X1_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25532_n1550, driver I_RISC_CORE/FE_OFC5168_n1550/Y (cell NBUFFX2_LVT) voltage 0.95 does not match receiver I_RISC_CORE/U1175/A2 (cell XNOR2X1_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (EMS-27):	Message (IMPMSMV-1810) has exceeded the current message display limit of 20.
To increase the message display limit, refer to the product command reference manual.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25603_n1556, driver I_RISC_CORE/FE_OFC5236_n1556/Y (cell NBUFFX2_LVT) voltage 0.95 does not match receiver I_RISC_CORE/U243/A3 (cell OA21X2_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25583_n, driver I_RISC_CORE/FE_OFC5217_n376_1/Y (cell NBUFFX2_LVT) voltage 0.95 does not match receiver I_RISC_CORE/I_REG_FILE_REG_FILE_B_RAM/A2[3] (cell SRAM2RW128x16) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25665_n1200, driver I_RISC_CORE/FE_OFC5297_n1200/Y (cell NBUFFX4_LVT) voltage 0.95 does not match receiver I_RISC_CORE/U1080/A1 (cell NOR2X1_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25575_n, driver I_RISC_CORE/FE_OFC5209_n378_1/Y (cell NBUFFX2_LVT) voltage 0.95 does not match receiver I_RISC_CORE/I_REG_FILE_REG_FILE_B_RAM/A2[1] (cell SRAM2RW128x16) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25570_n, driver I_RISC_CORE/FE_OFC5204_n360_1/Y (cell NBUFFX8_LVT) voltage 0.95 does not match receiver I_RISC_CORE/I_INSTRN_LAT_Crnt_Instrn_2_reg_20_/SI (cell SDFFARX1_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25551_Oprnd_A_7, driver I_RISC_CORE/FE_OFC5186_Oprnd_A_7/Y (cell NBUFFX2_LVT) voltage 0.95 does not match receiver I_RISC_CORE/U566/A1 (cell XNOR2X1_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25549_n1553, driver I_RISC_CORE/FE_OFC5184_n1553/Y (cell NBUFFX2_LVT) voltage 0.95 does not match receiver I_RISC_CORE/U590/A2 (cell AOI21X1_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
Total number of fetched objects 50050
AAE_INFO: Total number of nets for which stage creation was skipped for all views 0
End delay calculation. (MEM=3670.61 CPU=0:00:25.5 REAL=0:00:03.0)
End delay calculation (fullDC). (MEM=3670.61 CPU=0:00:32.5 REAL=0:00:05.0)
*** Done Building Timing Graph (cpu=0:00:55.8 real=0:00:12.0 totSessionCpu=0:46:24 mem=5433.8M)

------------------------------------------------------------------
             Initial Summary
------------------------------------------------------------------

Setup views included:
 test_worst_scenario func_worst_scenario 

+--------------------+---------+
|     Setup mode     |   all   |
+--------------------+---------+
|           WNS (ns):| -1.095  |
|           TNS (ns):| -13.713 |
|    Violating Paths:|   27    |
|          All Paths:|  10179  |
+--------------------+---------+

+----------------+-------------------------------+------------------+
|                |              Real             |       Total      |
|    DRVs        +------------------+------------+------------------|
|                |  Nr nets(terms)  | Worst Vio  |  Nr nets(terms)  |
+----------------+------------------+------------+------------------+
|   max_cap      |     67 (67)      |   -0.042   |     71 (71)      |
|   max_tran     |     64 (78)      |   -0.901   |     64 (78)      |
|   max_fanout   |      0 (0)       |     0      |      0 (0)       |
|   max_length   |      0 (0)       |     0      |      0 (0)       |
+----------------+------------------+------------+------------------+

Density: 42.804%
------------------------------------------------------------------
**optDesign ... cpu = 0:01:13, real = 0:00:47, mem = 3653.7M, totSessionCpu=0:46:29 **
*** InitOpt #1 [finish] (ccopt_design #1) : cpu/real = 0:01:13.7/0:00:47.3 (1.6), totSession cpu/real = 0:46:29.0/0:20:43.9 (2.2), mem = 5019.8M
** INFO : this run is activating low effort ccoptDesign flow

OPTC: m4 20.0 50.0
OPTC: view 50.0 50.0
#optDebug: fT-E <X 2 0 0 1>
-opt_post_cts_congestion_repair false      # bool, default=false, private
GigaOpt Checkpoint: Internal congRefineRouteType -postCTS -congThreshold 0.001 -rescheduleForCongestion -numThreads 8 -resetVeryShortNets -resetShortNets -useSpineBased -rescheduleForAdherence -minSlack -56.0 -useBottleneckAnalyzer -drvRatio 0.4
Begin: GigaOpt Route Type Constraints Refinement
*** CongRefineRouteType #1 [begin] (ccopt_design #1) : totSession cpu/real = 0:46:44.5/0:20:48.2 (2.2), mem = 4987.8M
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
Updated routing constraints on 0 nets.
Bottom Preferred Layer:
+-----------+------------+------------+----------+
|   Layer   |     DB     |    CLK     |   Rule   |
+-----------+------------+------------+----------+
| M3 (z=3)  |          0 |        185 | default  |
| M5 (z=5)  |          0 |        211 | default  |
+-----------+------------+------------+----------+
| M7 (z=7)  |          2 |          5 | CTS_RULE |
+-----------+------------+------------+----------+
Via Pillar Rule:
    None
*** CongRefineRouteType #1 [finish] (ccopt_design #1) : cpu/real = 0:00:01.7/0:00:01.5 (1.1), totSession cpu/real = 0:46:46.2/0:20:49.7 (2.2), mem = 5199.5M
End: GigaOpt Route Type Constraints Refinement
*** SimplifyNetlist #1 [begin] (ccopt_design #1) : totSession cpu/real = 0:46:46.6/0:20:50.0 (2.2), mem = 5112.5M
Info: 7 don't touch nets, 0 undriven net  excluded from IPO operation.
*info: 7 skip_routing nets excluded.
Info: 399 nets with fixed/cover wires excluded.
*info: Marking 98 level shifter instances dont touch
*info: Marking 0 isolation instances dont touch
Info: 401 clock nets excluded from IPO operation.



Netlist preparation processing... 
Removed 0 instance
*info: Marking 0 isolation instances dont touch
*info: Marking 98 level shifter instances dont touch
*** SimplifyNetlist #1 [finish] (ccopt_design #1) : cpu/real = 0:00:05.0/0:00:03.4 (1.5), totSession cpu/real = 0:46:51.5/0:20:53.4 (2.2), mem = 5113.4M
*** Starting optimizing excluded clock nets MEM= 5113.4M) ***
*info: No excluded clock nets to be optimized.
*** Finished optimizing excluded clock nets (CPU Time= 0:00:00.0  MEM= 5113.4M) ***
*** Starting optimizing excluded clock nets MEM= 5113.4M) ***
*info: No excluded clock nets to be optimized.
*** Finished optimizing excluded clock nets (CPU Time= 0:00:00.0  MEM= 5113.4M) ***
Info: Done creating the CCOpt slew target map.
Begin: GigaOpt high fanout net optimization
GigaOpt HFN: use maxLocalDensity 1.2
GigaOpt Checkpoint: Internal optDRV -useLevelizedBufferTreeOnly -auxMaxFanoutCountLimit 500 -largeScaleFixing -maxIter 1 -maxLocalDensity 1.2 -numThreads 8 -postCTS -preRouteDontEndWithRefinePlaceIncrSteinerRouteDC
*** DrvOpt #1 [begin] (ccopt_design #1) : totSession cpu/real = 0:46:52.3/0:20:54.2 (2.2), mem = 5113.4M
Info: 7 don't touch nets, 0 undriven net  excluded from IPO operation.
*info: 7 skip_routing nets excluded.
Info: 399 nets with fixed/cover wires excluded.
*info: Marking 98 level shifter instances dont touch
*info: Marking 0 isolation instances dont touch
Info: 401 clock nets excluded from IPO operation.


	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
*** DrvOpt #1 [finish] (ccopt_design #1) : cpu/real = 0:00:04.9/0:00:02.4 (2.0), totSession cpu/real = 0:46:57.2/0:20:56.7 (2.2), mem = 5114.2M
GigaOpt HFN: restore maxLocalDensity to 0.98
End: GigaOpt high fanout net optimization
**INFO: Always on buffers available for drv fixing
Begin: GigaOpt DRV Optimization
GigaOpt Checkpoint: Internal optDRV -max_tran -max_cap -maxLocalDensity 0.98 -numThreads 8 -smallScaleFixing -maxIter 3 -setupTNSCostFactor 3.0 -postCTS
*** DrvOpt #2 [begin] (ccopt_design #1) : totSession cpu/real = 0:46:59.0/0:20:57.6 (2.2), mem = 5114.1M
Info: 7 don't touch nets, 0 undriven net  excluded from IPO operation.
*info: 7 skip_routing nets excluded.
Info: 399 nets with fixed/cover wires excluded.
*info: Marking 98 level shifter instances dont touch
*info: Marking 0 isolation instances dont touch
Info: 401 clock nets excluded from IPO operation.


	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
|        max-tran       |        max-cap        |  max-fanout |  max-length |       setup       |        |        |        |       |          |         |
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
| nets | terms|  wViol  | nets | terms|  wViol  | nets | terms| nets | terms|   WNS   |   TNS   |  #Buf  |  #Inv  | #Resize|Density|   Real   |   Mem   |
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
|    68|    98|    -0.95|    94|   188|    -0.04|     0|     0|     0|     0|    -1.10|   -13.71|       0|       0|       0| 42.92%|          |         |
|     0|     0|     0.00|     5|    10|    -0.00|     0|     0|     0|     0|    -0.57|    -0.95|      57|       2|      38| 42.98%| 0:00:01.0|  5796.6M|
|     0|     0|     0.00|     5|    10|    -0.00|     0|     0|     0|     0|    -0.57|    -0.95|       0|       0|       0| 42.98%| 0:00:00.0|  5796.6M|
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
**WARN: (IMPOPT-3668):	There are 48 nets with MSV violations, timing and DRV optimization of such nets is limited.  Please use verifyPowerDomain to analyze these further.
Bottom Preferred Layer:
+-----------+------------+------------+----------+
|   Layer   |     DB     |    CLK     |   Rule   |
+-----------+------------+------------+----------+
| M3 (z=3)  |          0 |        185 | default  |
| M5 (z=5)  |          0 |        211 | default  |
+-----------+------------+------------+----------+
| M7 (z=7)  |          2 |          5 | CTS_RULE |
+-----------+------------+------------+----------+
Via Pillar Rule:
    None


=======================================================================
                Reasons for remaining drv violations
=======================================================================
*info: Total 5 net(s) have violations which can't be fixed by DRV optimization.


*** Finish DRV Fixing (cpu=0:00:11.3 real=0:00:03.0 mem=5796.6M) ***


*** Starting refinePlace (0:47:17 mem=5793.3M) ***
Total net bbox length = 8.696e+05 (5.131e+05 3.564e+05) (ext = 1.258e+04)
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Move report: Detail placement moves 201 insts, mean move: 0.87 um, max move: 7.14 um 
	Max move on inst (I_RISC_CORE/FE_OFC2942_n381_1): (158.23, 182.25) --> (162.03, 178.90)
	Runtime: CPU: 0:00:08.3 REAL: 0:00:03.0 MEM: 5779.3MB
Summary Report:
Instances move: 201 (out of 40528 movable)
Instances flipped: 0
Mean displacement: 0.87 um
Max displacement: 7.14 um (Instance: I_RISC_CORE/FE_OFC2942_n381_1) (158.232, 182.248) -> (162.032, 178.904)
	Length: 8 sites, height: 1 rows, site name: unit, cell type: NBUFFX2_LVT, constraint:Fence
Physical-only instances move: 0 (out of 0 movable physical-only)
Total net bbox length = 8.696e+05 (5.132e+05 3.565e+05) (ext = 1.258e+04)
Runtime: CPU: 0:00:08.5 REAL: 0:00:03.0 MEM: 5779.3MB
*** Finished refinePlace (0:47:26 mem=5779.3M) ***
*** maximum move = 7.14 um ***
*** Finished re-routing un-routed nets (5797.4M) ***


*** Finish Physical Update (cpu=0:00:11.7 real=0:00:05.0 mem=5797.6M) ***
*** DrvOpt #2 [finish] (ccopt_design #1) : cpu/real = 0:00:29.8/0:00:11.1 (2.7), totSession cpu/real = 0:47:28.8/0:21:08.6 (2.2), mem = 5232.3M
End: GigaOpt DRV Optimization
GigaOpt DRV: restore maxLocalDensity to 0.98
**optDesign ... cpu = 0:02:14, real = 0:01:12, mem = 3872.8M, totSessionCpu=0:47:29 **
Number of setup views: 2
Begin: GigaOpt Global Optimization
*info: use new DP (enabled)
GigaOpt Checkpoint: Internal globalOpt -maxLocalDensity 1.2 -numThreads 8 -postCTS -preRouteDontEndWithRefinePlaceIncrSteinerRouteDC -enableHighLayerOpt -maxIter 1 -maxIterForLEPG 1 -maxIterAtSameRoiCutoff 0
Info: 7 don't touch nets, 0 undriven net  excluded from IPO operation.
*info: 7 skip_routing nets excluded.
Info: 399 nets with fixed/cover wires excluded.
*info: Marking 98 level shifter instances dont touch
*info: Marking 0 isolation instances dont touch
Info: 401 clock nets excluded from IPO operation.
*** GlobalOpt #1 [begin] (ccopt_design #1) : totSession cpu/real = 0:47:30.1/0:21:09.7 (2.2), mem = 5494.0M


*info: 7 don't touch nets excluded
*info: 401 clock nets excluded
*info: Marking 98 level shifter instances dont touch
*info: Marking 0 isolation instances dont touch
*info: 7 skip_routing nets excluded.
*info: 1077 no-driver nets excluded.
*info: 399 nets with fixed/cover wires excluded.
** GigaOpt Global Opt WNS Slack -0.575  TNS Slack -0.953 
+--------+--------+---------+------------+--------+-------------------+---------+----------------------------------------------------+
|  WNS   |  TNS   | Density |    Real    |  Mem   |    Worst View     |Pathgroup|                     End Point                      |
+--------+--------+---------+------------+--------+-------------------+---------+----------------------------------------------------+
|  -0.575|  -0.953|   42.98%|   0:00:00.0| 5680.5M|test_worst_scenario|  default| occ_int2/fast_clk_0_clkgt/u_icg/EN                 |
|  -0.575|  -0.680|   42.98%|   0:00:00.0| 5858.7M|test_worst_scenario|  default| occ_int2/fast_clk_0_clkgt/u_icg/EN                 |
|  -0.575|  -0.680|   42.98%|   0:00:00.0| 5858.7M|test_worst_scenario|  default| occ_int2/fast_clk_0_clkgt/u_icg/EN                 |
|  -0.575|  -0.680|   42.98%|   0:00:00.0| 5858.7M|test_worst_scenario|  default| occ_int2/fast_clk_0_clkgt/u_icg/EN                 |
|  -0.258|  -0.258|   42.98%|   0:00:01.0| 5873.5M|test_worst_scenario|  default| occ_int2/fast_clk_0_clkgt/u_icg/EN                 |
|  -0.258|  -0.258|   42.98%|   0:00:00.0| 5875.5M|test_worst_scenario|  default| occ_int2/fast_clk_0_clkgt/u_icg/EN                 |
+--------+--------+---------+------------+--------+-------------------+---------+----------------------------------------------------+

*** Finish post-CTS Global Setup Fixing (cpu=0:00:04.5 real=0:00:01.0 mem=5875.5M) ***

*** Finish post-CTS Setup Fixing (cpu=0:00:04.5 real=0:00:01.0 mem=5875.5M) ***
Bottom Preferred Layer:
+-----------+------------+------------+----------+
|   Layer   |     DB     |    CLK     |   Rule   |
+-----------+------------+------------+----------+
| M3 (z=3)  |          0 |        185 | default  |
| M5 (z=5)  |          0 |        211 | default  |
+-----------+------------+------------+----------+
| M7 (z=7)  |          2 |          5 | CTS_RULE |
+-----------+------------+------------+----------+
Via Pillar Rule:
    None
** GigaOpt Global Opt End WNS Slack -0.258  TNS Slack -0.258 
*** GlobalOpt #1 [finish] (ccopt_design #1) : cpu/real = 0:00:11.1/0:00:05.8 (1.9), totSession cpu/real = 0:47:41.2/0:21:15.5 (2.2), mem = 5284.2M
End: GigaOpt Global Optimization

Active setup views:
 func_worst_scenario
  Dominating endpoints: 6358
  Dominating TNS: -0.000

 test_worst_scenario
  Dominating endpoints: 2952
  Dominating TNS: -0.258

Begin: GigaOpt Global Optimization
*info: use new DP (enabled)
GigaOpt Checkpoint: Internal globalOpt -maxLocalDensity 1.2 -numThreads 8 -postCTS -preRouteDontEndWithRefinePlaceIncrSteinerRouteDC -enableHighLayerOpt -maxIter 50 -maxIterForLEPG 50
Info: 7 don't touch nets, 0 undriven net  excluded from IPO operation.
*info: 7 skip_routing nets excluded.
Info: 399 nets with fixed/cover wires excluded.
*info: Marking 98 level shifter instances dont touch
*info: Marking 0 isolation instances dont touch
Info: 401 clock nets excluded from IPO operation.
*** GlobalOpt #2 [begin] (ccopt_design #1) : totSession cpu/real = 0:47:43.6/0:21:17.0 (2.2), mem = 5545.9M


*info: 7 don't touch nets excluded
*info: 401 clock nets excluded
*info: Marking 98 level shifter instances dont touch
*info: Marking 0 isolation instances dont touch
*info: 7 skip_routing nets excluded.
*info: 1077 no-driver nets excluded.
*info: 399 nets with fixed/cover wires excluded.
** GigaOpt Global Opt WNS Slack -0.258  TNS Slack -0.258 
+--------+--------+---------+------------+--------+-------------------+---------+----------------------------------------------------+
|  WNS   |  TNS   | Density |    Real    |  Mem   |    Worst View     |Pathgroup|                     End Point                      |
+--------+--------+---------+------------+--------+-------------------+---------+----------------------------------------------------+
|  -0.258|  -0.258|   42.98%|   0:00:00.0| 5693.3M|test_worst_scenario|  default| occ_int2/fast_clk_0_clkgt/u_icg/EN                 |
|  -0.258|  -0.258|   42.98%|   0:00:01.0| 5736.9M|test_worst_scenario|  default| occ_int2/fast_clk_0_clkgt/u_icg/EN                 |
|  -0.258|  -0.258|   42.98%|   0:00:00.0| 5736.9M|test_worst_scenario|  default| occ_int2/fast_clk_0_clkgt/u_icg/EN                 |
|  -0.258|  -0.258|   42.98%|   0:00:00.0| 5736.9M|test_worst_scenario|  default| occ_int2/fast_clk_0_clkgt/u_icg/EN                 |
|  -0.258|  -0.258|   42.98%|   0:00:00.0| 5736.9M|test_worst_scenario|  default| occ_int2/fast_clk_0_clkgt/u_icg/EN                 |
|  -0.258|  -0.258|   42.98%|   0:00:00.0| 5761.5M|test_worst_scenario|  default| occ_int2/fast_clk_0_clkgt/u_icg/EN                 |
|  -0.258|  -0.258|   42.98%|   0:00:00.0| 5761.5M|test_worst_scenario|  default| occ_int2/fast_clk_0_clkgt/u_icg/EN                 |
|  -0.258|  -0.258|   42.98%|   0:00:00.0| 5761.5M|test_worst_scenario|  default| occ_int2/fast_clk_0_clkgt/u_icg/EN                 |
|  -0.258|  -0.258|   42.98%|   0:00:00.0| 5761.5M|test_worst_scenario|  default| occ_int2/fast_clk_0_clkgt/u_icg/EN                 |
|  -0.258|  -0.258|   42.98%|   0:00:01.0| 5761.5M|test_worst_scenario|  default| occ_int2/fast_clk_0_clkgt/u_icg/EN                 |
|  -0.258|  -0.258|   42.98%|   0:00:00.0| 5761.5M|test_worst_scenario|  default| occ_int2/fast_clk_0_clkgt/u_icg/EN                 |
|  -0.258|  -0.258|   42.98%|   0:00:00.0| 5761.5M|test_worst_scenario|  default| occ_int2/fast_clk_0_clkgt/u_icg/EN                 |
|  -0.253|  -0.253|   42.98%|   0:00:00.0| 5818.8M|test_worst_scenario|  default| occ_int2/fast_clk_0_clkgt/u_icg/EN                 |
|  -0.253|  -0.253|   42.98%|   0:00:00.0| 5818.8M|test_worst_scenario|  default| occ_int2/fast_clk_0_clkgt/u_icg/EN                 |
|  -0.253|  -0.253|   42.98%|   0:00:00.0| 5818.8M|test_worst_scenario|  default| occ_int2/fast_clk_0_clkgt/u_icg/EN                 |
|  -0.253|  -0.253|   42.98%|   0:00:00.0| 5818.8M|test_worst_scenario|  default| occ_int2/fast_clk_0_clkgt/u_icg/EN                 |
|  -0.253|  -0.253|   42.98%|   0:00:01.0| 5818.8M|test_worst_scenario|  default| occ_int2/fast_clk_0_clkgt/u_icg/EN                 |
|  -0.253|  -0.253|   42.98%|   0:00:00.0| 5818.8M|test_worst_scenario|  default| occ_int2/fast_clk_0_clkgt/u_icg/EN                 |
+--------+--------+---------+------------+--------+-------------------+---------+----------------------------------------------------+

*** Finish post-CTS Global Setup Fixing (cpu=0:00:08.9 real=0:00:03.0 mem=5818.8M) ***

*** Finish post-CTS Setup Fixing (cpu=0:00:08.9 real=0:00:03.0 mem=5818.8M) ***
Bottom Preferred Layer:
+-----------+------------+------------+----------+
|   Layer   |     DB     |    CLK     |   Rule   |
+-----------+------------+------------+----------+
| M3 (z=3)  |          0 |        185 | default  |
| M5 (z=5)  |          0 |        211 | default  |
+-----------+------------+------------+----------+
| M7 (z=7)  |          2 |          5 | CTS_RULE |
+-----------+------------+------------+----------+
Via Pillar Rule:
    None
** GigaOpt Global Opt End WNS Slack -0.253  TNS Slack -0.253 
*** GlobalOpt #2 [finish] (ccopt_design #1) : cpu/real = 0:00:15.5/0:00:07.3 (2.1), totSession cpu/real = 0:47:59.1/0:21:24.3 (2.2), mem = 5314.5M
End: GigaOpt Global Optimization
*** Timing NOT met, worst failing slack is -0.253
*** Check timing (0:00:00.1)
GigaOpt Checkpoint: Internal reclaim -numThreads 8 -postCTS -doRemoveUselessTerm -tgtSlackMult 3 -routeType -noRouteTypeResizePolish -noViewPrune -weedwhack -nonLegal -nativePathGroupFlow -SimpCCIn
Info: 7 don't touch nets, 0 undriven net  excluded from IPO operation.
*info: 7 skip_routing nets excluded.
Info: 399 nets with fixed/cover wires excluded.
*info: Marking 98 level shifter instances dont touch
*info: Marking 0 isolation instances dont touch
Info: 401 clock nets excluded from IPO operation.



Begin: Area Reclaim Optimization
*** AreaOpt #1 [begin] (ccopt_design #1) : totSession cpu/real = 0:48:01.7/0:21:26.0 (2.2), mem = 5704.5M
Reclaim Optimization WNS Slack -0.253  TNS Slack -0.253 Density 42.98
+---------+---------+--------+--------+------------+--------+
| Density | Commits |  WNS   |  TNS   |    Real    |  Mem   |
+---------+---------+--------+--------+------------+--------+
|   42.98%|        -|  -0.253|  -0.253|   0:00:00.0| 5706.5M|
|   42.98%|        0|  -0.253|  -0.253|   0:00:02.0| 5706.5M|
|   42.98%|        0|  -0.253|  -0.253|   0:00:00.0| 5706.5M|
|   42.95%|       54|  -0.253|  -0.253|   0:00:04.0| 5859.1M|
|   42.92%|      158|  -0.253|  -0.253|   0:00:06.0| 5867.1M|
|   42.92%|        6|  -0.253|  -0.253|   0:00:00.0| 5867.1M|
|   42.92%|        0|  -0.253|  -0.253|   0:00:01.0| 5867.1M|
|   42.92%|        0|  -0.253|  -0.253|   0:00:00.0| 5867.1M|
+---------+---------+--------+--------+------------+--------+
Reclaim Optimization End WNS Slack -0.253  TNS Slack -0.253 Density 42.92
Bottom Preferred Layer:
+-----------+------------+------------+----------+
|   Layer   |     DB     |    CLK     |   Rule   |
+-----------+------------+------------+----------+
| M3 (z=3)  |          0 |        185 | default  |
| M5 (z=5)  |          0 |        211 | default  |
+-----------+------------+------------+----------+
| M7 (z=7)  |          2 |          5 | CTS_RULE |
+-----------+------------+------------+----------+
Via Pillar Rule:
    None

Number of times islegalLocAvaiable called = 0 skipped = 0, called in commitmove = 0, skipped in commitmove = 0
End: Core Area Reclaim Optimization (cpu = 0:00:52.1) (real = 0:00:15.0) **
*** AreaOpt #1 [finish] (ccopt_design #1) : cpu/real = 0:00:52.1/0:00:15.0 (3.5), totSession cpu/real = 0:48:53.8/0:21:41.0 (2.3), mem = 5867.1M
Executing incremental physical updates
Executing incremental physical updates
End: Area Reclaim Optimization (cpu=0:00:52, real=0:00:15, mem=5323.80M, totSessionCpu=0:48:54).
Begin: GigaOpt Optimization in WNS mode
GigaOpt Checkpoint: Internal optTiming -maxLocalDensity 1.0 -maxLocalDensityForHardenOpt 0.92 -numThreads 8 -postCTS -wtns -integratedAreaOpt -pgMode all -ipoTgtSlackCoef 1.5 -effTgtSlackCoef 1 -nativePathGroupFlow -NDROptEffortAuto -nonLegalPlaceEcoBumpRecoveryInWNSOpt
Info: 7 don't touch nets, 0 undriven net  excluded from IPO operation.
*info: 7 skip_routing nets excluded.
Info: 399 nets with fixed/cover wires excluded.
*info: Marking 98 level shifter instances dont touch
*info: Marking 0 isolation instances dont touch
Info: 401 clock nets excluded from IPO operation.
*** WnsOpt #1 [begin] (ccopt_design #1) : totSession cpu/real = 0:49:00.9/0:21:45.5 (2.3), mem = 5585.5M


*info: 7 don't touch nets excluded
*info: 401 clock nets excluded
*info: Marking 98 level shifter instances dont touch
*info: Marking 0 isolation instances dont touch
*info: 7 skip_routing nets excluded.
*info: 1077 no-driver nets excluded.
*info: 399 nets with fixed/cover wires excluded.
** GigaOpt Optimizer WNS Slack -0.253 TNS Slack -0.253 Density 42.92
OptDebug: Start of Optimizer WNS Pass 0:
+-----------------------------+------+------+
|Path Group                   |   WNS|   TNS|
+-----------------------------+------+------+
|in2out in2reg reg2out default| 0.105| 0.000|
|reg2cgate                    |-0.253|-0.253|
|reg2reg                      | 0.035| 0.000|
|HEPG                         |-0.253|-0.253|
|All Paths                    |-0.253|-0.253|
+-----------------------------+------+------+

CCOptDebug: Start of Optimizer WNS Pass 0: reg2cgate* WNS -0.253ns TNS -; reg2reg* WNS 0.034ns TNS -; HEPG WNS -0.253ns TNS -; all paths WNS -0.253ns TNS -0.253ns; Real time 0:05:25
Active Path Group: reg2cgate reg2reg  
Info: initial physical memory for 9 CRR processes is 915.97MB.
+--------+---------+--------+---------+---------+------------+--------+-------------------+---------+----------------------------------------------------+
|  WNS   | All WNS |  TNS   | All TNS | Density |    Real    |  Mem   |    Worst View     |Pathgroup|                     End Point                      |
+--------+---------+--------+---------+---------+------------+--------+-------------------+---------+----------------------------------------------------+
|  -0.253|   -0.253|  -0.253|   -0.253|   42.92%|   0:00:00.0| 5713.8M|test_worst_scenario|reg2cgate| occ_int2/fast_clk_0_clkgt/u_icg/EN                 |
|  -0.251|   -0.251|  -0.251|   -0.251|   42.92%|   0:00:00.0| 5926.4M|test_worst_scenario|reg2cgate| occ_int2/fast_clk_0_clkgt/u_icg/EN                 |
+--------+---------+--------+---------+---------+------------+--------+-------------------+---------+----------------------------------------------------+

*** Finish Core Optimize Step (cpu=0:00:01.0 real=0:00:00.0 mem=5926.4M) ***

*** Finished Optimize Step Cumulative (cpu=0:00:01.6 real=0:00:17.0 mem=5926.4M) ***
OptDebug: End of Optimizer WNS Pass 0:
+-----------------------------+------+------+
|Path Group                   |   WNS|   TNS|
+-----------------------------+------+------+
|in2out in2reg reg2out default| 0.105| 0.000|
|reg2cgate                    |-0.251|-0.251|
|reg2reg                      | 0.035| 0.000|
|HEPG                         |-0.251|-0.251|
|All Paths                    |-0.251|-0.251|
+-----------------------------+------+------+

CCOptDebug: End of Optimizer WNS Pass 0: reg2cgate* WNS -0.251ns TNS -; reg2reg* WNS 0.034ns TNS -; HEPG WNS -0.251ns TNS -; all paths WNS -0.251ns TNS -0.251ns; Real time 0:05:42
** GigaOpt Optimizer WNS Slack -0.251 TNS Slack -0.251 Density 42.92

*** Starting refinePlace (0:49:20 mem=5926.1M) ***
Total net bbox length = 8.694e+05 (5.131e+05 3.563e+05) (ext = 1.258e+04)
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer

Starting Small incrNP...
Density distribution unevenness ratio = 36.436%
Skipped incrNP (cpu=0:00:00.1, real=0:00:00.0, mem=5894.1M)
End of Small incrNP (cpu=0:00:00.1, real=0:00:00.0)
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Move report: Detail placement moves 0 insts, mean move: 0.00 um, max move: 0.00 um 
	Runtime: CPU: 0:00:00.3 REAL: 0:00:00.0 MEM: 5937.8MB
Summary Report:
Instances move: 0 (out of 40473 movable)
Instances flipped: 0
Mean displacement: 0.00 um
Max displacement: 0.00 um 
Physical-only instances move: 0 (out of 0 movable physical-only)
Total net bbox length = 8.694e+05 (5.131e+05 3.563e+05) (ext = 1.258e+04)
Runtime: CPU: 0:00:00.6 REAL: 0:00:00.0 MEM: 5937.8MB
*** Finished refinePlace (0:49:21 mem=5937.8M) ***
*** maximum move = 0.00 um ***
*** Finished re-routing un-routed nets (5929.8M) ***


*** Finish Physical Update (cpu=0:00:04.1 real=0:00:03.0 mem=5930.1M) ***
** GigaOpt Optimizer WNS Slack -0.251 TNS Slack -0.251 Density 42.92
OptDebug: Start of Optimizer WNS Pass 1:
+-----------------------------+------+------+
|Path Group                   |   WNS|   TNS|
+-----------------------------+------+------+
|in2out in2reg reg2out default| 0.105| 0.000|
|reg2cgate                    |-0.251|-0.251|
|reg2reg                      | 0.035| 0.000|
|HEPG                         |-0.251|-0.251|
|All Paths                    |-0.251|-0.251|
+-----------------------------+------+------+

CCOptDebug: Start of Optimizer WNS Pass 1: reg2cgate* WNS -0.251ns TNS -; reg2reg* WNS 0.034ns TNS -; HEPG WNS -0.251ns TNS -; all paths WNS -0.251ns TNS -0.251ns; Real time 0:05:45
Active Path Group: reg2cgate reg2reg  
+--------+---------+--------+---------+---------+------------+--------+-------------------+---------+----------------------------------------------------+
|  WNS   | All WNS |  TNS   | All TNS | Density |    Real    |  Mem   |    Worst View     |Pathgroup|                     End Point                      |
+--------+---------+--------+---------+---------+------------+--------+-------------------+---------+----------------------------------------------------+
|  -0.251|   -0.251|  -0.251|   -0.251|   42.92%|   0:00:00.0| 5930.1M|test_worst_scenario|reg2cgate| occ_int2/fast_clk_0_clkgt/u_icg/EN                 |
|  -0.251|   -0.251|  -0.251|   -0.251|   42.92%|   0:00:00.0| 5930.1M|test_worst_scenario|reg2cgate| occ_int2/fast_clk_0_clkgt/u_icg/EN                 |
+--------+---------+--------+---------+---------+------------+--------+-------------------+---------+----------------------------------------------------+

*** Finish Core Optimize Step (cpu=0:00:00.3 real=0:00:00.0 mem=5930.1M) ***

*** Finished Optimize Step Cumulative (cpu=0:00:00.5 real=0:00:00.0 mem=5930.1M) ***
OptDebug: End of Optimizer WNS Pass 1:
+-----------------------------+------+------+
|Path Group                   |   WNS|   TNS|
+-----------------------------+------+------+
|in2out in2reg reg2out default| 0.105| 0.000|
|reg2cgate                    |-0.251|-0.251|
|reg2reg                      | 0.035| 0.000|
|HEPG                         |-0.251|-0.251|
|All Paths                    |-0.251|-0.251|
+-----------------------------+------+------+

CCOptDebug: End of Optimizer WNS Pass 1: reg2cgate* WNS -0.251ns TNS -; reg2reg* WNS 0.034ns TNS -; HEPG WNS -0.251ns TNS -; all paths WNS -0.251ns TNS -0.251ns; Real time 0:05:46
OptDebug: End of Setup Fixing:
+-----------------------------+------+------+
|Path Group                   |   WNS|   TNS|
+-----------------------------+------+------+
|in2out in2reg reg2out default| 0.105| 0.000|
|reg2cgate                    |-0.251|-0.251|
|reg2reg                      | 0.035| 0.000|
|HEPG                         |-0.251|-0.251|
|All Paths                    |-0.251|-0.251|
+-----------------------------+------+------+

Bottom Preferred Layer:
+-----------+------------+------------+----------+
|   Layer   |     DB     |    CLK     |   Rule   |
+-----------+------------+------------+----------+
| M3 (z=3)  |          0 |        185 | default  |
| M5 (z=5)  |          0 |        211 | default  |
+-----------+------------+------------+----------+
| M7 (z=7)  |          2 |          5 | CTS_RULE |
+-----------+------------+------------+----------+
Via Pillar Rule:
    None

*** Finish post-CTS Setup Fixing (cpu=0:00:20.1 real=0:00:24.0 mem=5930.1M) ***

*** WnsOpt #1 [finish] (ccopt_design #1) : cpu/real = 0:00:25.3/0:00:27.8 (0.9), totSession cpu/real = 0:49:26.2/0:22:13.4 (2.2), mem = 5339.8M
End: GigaOpt Optimization in WNS mode
Begin: GigaOpt Optimization in TNS mode
GigaOpt Checkpoint: Internal optTiming -allEndPoints -maxLocalDensity 0.95 -maxLocalDensityForHardenOpt 0.92 -numThreads 8 -postCTS -pgMode all -nativePathGroupFlow -wtns -nonLegalPlaceEcoBumpRecoveryInTNSOpt -NDROptEffortAuto -ipoTgtSlackCoef 1.5 -effTgtSlackCoef 1
Info: 7 don't touch nets, 0 undriven net  excluded from IPO operation.
*info: 7 skip_routing nets excluded.
Info: 399 nets with fixed/cover wires excluded.
*info: Marking 98 level shifter instances dont touch
*info: Marking 0 isolation instances dont touch
Info: 401 clock nets excluded from IPO operation.
*** TnsOpt #1 [begin] (ccopt_design #1) : totSession cpu/real = 0:49:26.9/0:22:14.1 (2.2), mem = 5339.8M


*info: 7 don't touch nets excluded
*info: 401 clock nets excluded
*info: Marking 98 level shifter instances dont touch
*info: Marking 0 isolation instances dont touch
*info: 7 skip_routing nets excluded.
*info: 1077 no-driver nets excluded.
*info: 399 nets with fixed/cover wires excluded.
** GigaOpt Optimizer WNS Slack -0.251 TNS Slack -0.251 Density 42.92
OptDebug: Start of Optimizer TNS Pass:
+-----------------------------+------+------+
|Path Group                   |   WNS|   TNS|
+-----------------------------+------+------+
|in2out in2reg reg2out default| 0.105| 0.000|
|reg2cgate                    |-0.251|-0.251|
|reg2reg                      | 0.035| 0.000|
|HEPG                         |-0.251|-0.251|
|All Paths                    |-0.251|-0.251|
+-----------------------------+------+------+

CCOptDebug: Start of Optimizer TNS Pass: reg2cgate* WNS -0.251ns TNS -; reg2reg* WNS 0.034ns TNS -; HEPG WNS -0.251ns TNS -; all paths WNS -0.251ns TNS -0.251ns; Real time 0:05:50
Active Path Group: reg2cgate  
+--------+---------+--------+---------+---------+------------+--------+-------------------+---------+----------------------------------------------------+
|  WNS   | All WNS |  TNS   | All TNS | Density |    Real    |  Mem   |    Worst View     |Pathgroup|                     End Point                      |
+--------+---------+--------+---------+---------+------------+--------+-------------------+---------+----------------------------------------------------+
|  -0.251|   -0.251|  -0.251|   -0.251|   42.92%|   0:00:00.0| 5731.8M|test_worst_scenario|reg2cgate| occ_int2/fast_clk_0_clkgt/u_icg/EN                 |
|  -0.251|   -0.251|  -0.251|   -0.251|   42.92%|   0:00:00.0| 5785.2M|test_worst_scenario|reg2cgate| occ_int2/fast_clk_0_clkgt/u_icg/EN                 |
+--------+---------+--------+---------+---------+------------+--------+-------------------+---------+----------------------------------------------------+

*** Finish Core Optimize Step (cpu=0:00:00.4 real=0:00:00.0 mem=5785.2M) ***

*** Finished Optimize Step Cumulative (cpu=0:00:00.5 real=0:00:00.0 mem=5785.2M) ***
OptDebug: End of Optimizer TNS Pass:
+-----------------------------+------+------+
|Path Group                   |   WNS|   TNS|
+-----------------------------+------+------+
|in2out in2reg reg2out default| 0.105| 0.000|
|reg2cgate                    |-0.251|-0.251|
|reg2reg                      | 0.035| 0.000|
|HEPG                         |-0.251|-0.251|
|All Paths                    |-0.251|-0.251|
+-----------------------------+------+------+

CCOptDebug: End of Optimizer TNS Pass: reg2cgate* WNS -0.251ns TNS -; reg2reg* WNS 0.034ns TNS -; HEPG WNS -0.251ns TNS -; all paths WNS -0.251ns TNS -0.251ns; Real time 0:05:51
OptDebug: End of Setup Fixing:
+-----------------------------+------+------+
|Path Group                   |   WNS|   TNS|
+-----------------------------+------+------+
|in2out in2reg reg2out default| 0.105| 0.000|
|reg2cgate                    |-0.251|-0.251|
|reg2reg                      | 0.035| 0.000|
|HEPG                         |-0.251|-0.251|
|All Paths                    |-0.251|-0.251|
+-----------------------------+------+------+

Bottom Preferred Layer:
+-----------+------------+------------+----------+
|   Layer   |     DB     |    CLK     |   Rule   |
+-----------+------------+------------+----------+
| M3 (z=3)  |          0 |        185 | default  |
| M5 (z=5)  |          0 |        211 | default  |
+-----------+------------+------------+----------+
| M7 (z=7)  |          2 |          5 | CTS_RULE |
+-----------+------------+------------+----------+
Via Pillar Rule:
    None

*** Finish post-CTS Setup Fixing (cpu=0:00:02.3 real=0:00:02.0 mem=5785.2M) ***

*** TnsOpt #1 [finish] (ccopt_design #1) : cpu/real = 0:00:07.1/0:00:04.6 (1.6), totSession cpu/real = 0:49:34.0/0:22:18.6 (2.2), mem = 5338.9M
End: GigaOpt Optimization in TNS mode
GigaOpt Checkpoint: Internal reclaim -numThreads 8 -customPhyUpdate -noGCompAndPhase -force -svrReclaim -rtrShortNets -allowDegradingShortNetRemoval -postCTS -tgtSlackMult 2 -wtns -noRouteTypeResizePolish -noViewPrune -nativePathGroupFlow -SimpCCIn
Info: 7 don't touch nets, 0 undriven net  excluded from IPO operation.
*info: 7 skip_routing nets excluded.
Info: 399 nets with fixed/cover wires excluded.
*info: Marking 98 level shifter instances dont touch
*info: Marking 0 isolation instances dont touch
Info: 401 clock nets excluded from IPO operation.


Begin: Area Reclaim Optimization
*** AreaOpt #2 [begin] (ccopt_design #1) : totSession cpu/real = 0:49:36.4/0:22:20.2 (2.2), mem = 5729.0M
Reclaim Optimization WNS Slack -0.251  TNS Slack -0.251 Density 42.92
+---------+---------+--------+--------+------------+--------+
| Density | Commits |  WNS   |  TNS   |    Real    |  Mem   |
+---------+---------+--------+--------+------------+--------+
|   42.92%|        -|  -0.251|  -0.251|   0:00:00.0| 5728.9M|
|   42.92%|        0|  -0.251|  -0.251|   0:00:02.0| 5728.9M|
|   42.92%|        0|  -0.251|  -0.251|   0:00:00.0| 5728.9M|
|   42.92%|        5|  -0.251|  -0.251|   0:00:02.0| 5881.6M|
|   42.92%|       11|  -0.251|  -0.251|   0:00:02.0| 5881.6M|
|   42.92%|        0|  -0.251|  -0.251|   0:00:00.0| 5881.6M|
|   42.92%|        0|  -0.251|  -0.251|   0:00:00.0| 5881.6M|
+---------+---------+--------+--------+------------+--------+
Reclaim Optimization End WNS Slack -0.251  TNS Slack -0.251 Density 42.92
Bottom Preferred Layer:
+-----------+------------+------------+----------+
|   Layer   |     DB     |    CLK     |   Rule   |
+-----------+------------+------------+----------+
| M3 (z=3)  |          0 |        185 | default  |
| M5 (z=5)  |          0 |        211 | default  |
+-----------+------------+------------+----------+
| M7 (z=7)  |          2 |          5 | CTS_RULE |
+-----------+------------+------------+----------+
Via Pillar Rule:
    None

Number of times islegalLocAvaiable called = 15 skipped = 0, called in commitmove = 11, skipped in commitmove = 0
End: Core Area Reclaim Optimization (cpu = 0:00:28.3) (real = 0:00:07.0) **

*** Starting refinePlace (0:50:05 mem=5881.3M) ***
Total net bbox length = 8.695e+05 (5.132e+05 3.564e+05) (ext = 1.258e+04)
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Move report: Detail placement moves 2 insts, mean move: 1.52 um, max move: 1.67 um 
	Max move on inst (occ_int2/fast_clk_1_clkgt/FE_OFC5370_n15): (32.53, 339.42) --> (32.53, 341.09)
	Runtime: CPU: 0:00:07.9 REAL: 0:00:03.0 MEM: 5852.3MB
Summary Report:
Instances move: 2 (out of 40468 movable)
Instances flipped: 0
Mean displacement: 1.52 um
Max displacement: 1.67 um (Instance: occ_int2/fast_clk_1_clkgt/FE_OFC5370_n15) (32.528, 339.416) -> (32.528, 341.088)
	Length: 10 sites, height: 1 rows, site name: unit, cell type: NBUFFX4_LVT
Physical-only instances move: 0 (out of 0 movable physical-only)
Total net bbox length = 8.695e+05 (5.132e+05 3.564e+05) (ext = 1.258e+04)
Runtime: CPU: 0:00:08.1 REAL: 0:00:03.0 MEM: 5852.3MB
*** Finished refinePlace (0:50:14 mem=5852.3M) ***
*** maximum move = 1.67 um ***
*** Finished re-routing un-routed nets (5881.4M) ***


*** Finish Physical Update (cpu=0:00:11.4 real=0:00:04.0 mem=5881.6M) ***
*** AreaOpt #2 [finish] (ccopt_design #1) : cpu/real = 0:00:39.7/0:00:11.9 (3.3), totSession cpu/real = 0:50:16.1/0:22:32.2 (2.2), mem = 5881.6M
End: Area Reclaim Optimization (cpu=0:00:40, real=0:00:12, mem=5340.32M, totSessionCpu=0:50:16).
*** LocalWireReclaim #1 [begin] (ccopt_design #1) : totSession cpu/real = 0:50:16.9/0:22:32.7 (2.2), mem = 5340.3M
Starting local wire reclaim

*** Starting refinePlace (0:50:17 mem=5340.3M) ***
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
*** Finished SKP initialization (cpu=0:00:06.2, real=0:00:03.0)***
Timing cost in AAE based: 74543.1269617758662207
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Call icdpEval cleanup ...
Move report: Detail placement moves 17469 insts, mean move: 2.21 um, max move: 33.44 um 
	Max move on inst (FE_OFC4950_n431): (507.22, 394.59) --> (540.66, 394.59)
	Runtime: CPU: 0:02:04 REAL: 0:01:08 MEM: 5424.7MB
Summary Report:
Instances move: 17469 (out of 40468 movable)
Instances flipped: 31
Mean displacement: 2.21 um
Max displacement: 33.44 um (Instance: FE_OFC4950_n431) (507.224, 394.592) -> (540.664, 394.592)
	Length: 12 sites, height: 1 rows, site name: unit, cell type: INVX8_LVT
Physical-only instances move: 0 (out of 0 movable physical-only)
Runtime: CPU: 0:02:04 REAL: 0:01:08 MEM: 5424.7MB
*** Finished refinePlace (0:52:22 mem=5424.7M) ***
*** LocalWireReclaim #1 [finish] (ccopt_design #1) : cpu/real = 0:02:05.2/0:01:08.6 (1.8), totSession cpu/real = 0:52:22.1/0:23:41.3 (2.2), mem = 5347.7M
AAE_INFO: opIsDesignInPostRouteState() is 0
#################################################################################
# Design Stage: PreRoute
# Design Name: ORCA_TOP
# Design Mode: 28nm
# Analysis Mode: MMMC Non-OCV 
# Parasitics Mode: No SPEF/RCDB 
# Signoff Settings: SI Off 
#################################################################################
Calculate delays in BcWc mode...
Calculate delays in BcWc mode...
Start delay calculation (fullDC) (8 T). (MEM=3901.17)
Total number of fetched objects 50049
AAE_INFO: Total number of nets for which stage creation was skipped for all views 0
End delay calculation. (MEM=3927.12 CPU=0:00:25.1 REAL=0:00:03.0)
End delay calculation (fullDC). (MEM=3927.12 CPU=0:00:32.0 REAL=0:00:05.0)
eGR doReRoute: optGuide
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
[NR-eGR] Read 43453 nets ( ignored 399 )
[NR-eGR] There are 4 clock nets ( 1 with NDR ).
[NR-eGR] Layer group 1: route 43054 net(s) in layer range [2, 10]
[NR-eGR] Early Global Route overflow of layer group 1: 0.48% H + 0.02% V. EstWL: 8.998018e+05um
[NR-eGR] Overflow after Early Global Route 0.43% H + 0.00% V
[NR-eGR] Total eGR-routed clock nets wire length: 12um, number of vias: 28
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR]               Length (um)    Vias 
[NR-eGR] ----------------------------------
[NR-eGR]  M1    (1H)            16  163837 
[NR-eGR]  M2    (2V)        234648  213660 
[NR-eGR]  M3    (3H)        343931   65648 
[NR-eGR]  M4    (4V)        139438   15038 
[NR-eGR]  M5    (5H)        139164    4203 
[NR-eGR]  M6    (6V)         47474    2241 
[NR-eGR]  M7    (7H)         66170     376 
[NR-eGR]  M8    (8V)          4917     108 
[NR-eGR]  M9    (9H)          4562       0 
[NR-eGR]  MRDL  (10V)            0       0 
[NR-eGR] ----------------------------------
[NR-eGR]        Total       980320  465111 
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR] Total half perimeter of net bounding box: 859324um
[NR-eGR] Total length: 980320um, number of vias: 465111
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR] Finished Early Global Route kernel ( CPU: 8.93 sec, Real: 3.89 sec, Curr Mem: 4.85 MB )
[NR-eGR] Finished Early Global Route ( CPU: 8.98 sec, Real: 3.94 sec, Curr Mem: 4.77 MB )
**WARN: (IMPEXT-6191):	Using a captable file is not recommended for process nodes less than or equal to 32 nm due to parasitic accuracy concerns. The Quantus QRC technology file should be specified for all RC corners using the command create_rc_corner or update_rc_corner, which will then be used for preRoute and postRoute(effort level medium or high or signoff) extraction engines.
Type 'man IMPEXT-6191' for more detail.
Extraction called for design 'ORCA_TOP' of instances=40920 and nets=44589 using extraction engine 'preRoute' .
PreRoute RC Extraction called for design ORCA_TOP.
RC Extraction called in multi-corner(2) mode.
RCMode: PreRoute
      RC Corner Indexes            0       1   
Capacitance Scaling Factor   : 1.00000 1.00000 
Resistance Scaling Factor    : 1.00000 1.00000 
Clock Cap. Scaling Factor    : 1.00000 1.00000 
Clock Res. Scaling Factor    : 1.00000 1.00000 
Shrink Factor                : 1.00000
PreRoute extraction is honoring NDR/Shielding/ExtraSpace for clock nets.
Using capacitance table file ...
Updating RC Grid density data for preRoute extraction ...
Initializing multi-corner capacitance tables ... 
Initializing multi-corner resistance tables ...
PreRoute RC Extraction DONE (CPU Time: 0:00:01.6  Real Time: 0:00:01.0  MEM: 5176.035M)
Compute RC Scale Done ...
[hotspot] +------------+---------------+---------------+
[hotspot] |            |   max hotspot | total hotspot |
[hotspot] +------------+---------------+---------------+
[hotspot] | normalized |          0.00 |          0.00 |
[hotspot] +------------+---------------+---------------+
Local HotSpot Analysis: normalized max congestion hotspot area = 0.00, normalized total congestion hotspot area = 0.00 (area is in unit of 4 std-cell row bins)
GigaOpt Checkpoint: Internal congRefineRouteType -postCTS -numThreads 8 -resetVeryShortNets -rescheduleForAdherence  
Begin: GigaOpt Route Type Constraints Refinement
*** CongRefineRouteType #2 [begin] (ccopt_design #1) : totSession cpu/real = 0:53:23.6/0:23:59.6 (2.2), mem = 5175.1M
Updated routing constraints on 0 nets.
Bottom Preferred Layer:
+-----------+------------+------------+----------+
|   Layer   |     DB     |    CLK     |   Rule   |
+-----------+------------+------------+----------+
| M3 (z=3)  |          0 |        185 | default  |
| M5 (z=5)  |          0 |        211 | default  |
+-----------+------------+------------+----------+
| M7 (z=7)  |          2 |          5 | CTS_RULE |
+-----------+------------+------------+----------+
Via Pillar Rule:
    None
*** CongRefineRouteType #2 [finish] (ccopt_design #1) : cpu/real = 0:00:00.6/0:00:00.4 (1.5), totSession cpu/real = 0:53:24.2/0:24:00.0 (2.2), mem = 5175.1M
End: GigaOpt Route Type Constraints Refinement
skip EGR on cluster skew clock nets.
Starting delay calculation for Setup views
AAE_INFO: opIsDesignInPostRouteState() is 0
#################################################################################
# Design Stage: PreRoute
# Design Name: ORCA_TOP
# Design Mode: 28nm
# Analysis Mode: MMMC Non-OCV 
# Parasitics Mode: No SPEF/RCDB 
# Signoff Settings: SI Off 
#################################################################################
Calculate delays in BcWc mode...
Calculate delays in BcWc mode...
Start delay calculation (fullDC) (8 T). (MEM=3897.44)
Total number of fetched objects 50049
AAE_INFO: Total number of nets for which stage creation was skipped for all views 0
End delay calculation. (MEM=3924.75 CPU=0:00:25.2 REAL=0:00:03.0)
End delay calculation (fullDC). (MEM=3924.75 CPU=0:00:32.0 REAL=0:00:05.0)
*** Done Building Timing Graph (cpu=0:00:45.5 real=0:00:08.0 totSessionCpu=0:54:10 mem=5664.5M)
Begin: GigaOpt postEco DRV Optimization
GigaOpt Checkpoint: Internal optDRV -inPostEcoStage -smallScaleFixing -maxIter 3 -max_tran -max_cap -maxLocalDensity 0.98 -numThreads 8 -preRouteDontEndWithRefinePlaceIncrSteinerRouteDC -setupTNSCostFactor 1.0 -postCTS
*** DrvOpt #3 [begin] (ccopt_design #1) : totSession cpu/real = 0:54:11.6/0:24:08.9 (2.2), mem = 5664.5M
Info: 7 don't touch nets, 0 undriven net  excluded from IPO operation.
*info: 7 skip_routing nets excluded.
Info: 399 nets with fixed/cover wires excluded.
*info: Marking 98 level shifter instances dont touch
*info: Marking 0 isolation instances dont touch
Info: 401 clock nets excluded from IPO operation.


	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
|        max-tran       |        max-cap        |  max-fanout |  max-length |       setup       |        |        |        |       |          |         |
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
| nets | terms|  wViol  | nets | terms|  wViol  | nets | terms| nets | terms|   WNS   |   TNS   |  #Buf  |  #Inv  | #Resize|Density|   Real   |   Mem   |
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
|     9|     9|    -0.05|   100|   200|    -0.00|     0|     0|     0|     0|    -0.25|    -0.25|       0|       0|       0| 42.92%|          |         |
|     0|     0|     0.00|     4|     8|    -0.00|     0|     0|     0|     0|    -0.25|    -0.25|      29|       0|      77| 42.95%| 0:00:01.0|  5952.4M|
|     0|     0|     0.00|     4|     8|    -0.00|     0|     0|     0|     0|    -0.25|    -0.25|       0|       0|       0| 42.95%| 0:00:00.0|  5952.4M|
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
**WARN: (IMPOPT-3668):	There are 48 nets with MSV violations, timing and DRV optimization of such nets is limited.  Please use verifyPowerDomain to analyze these further.
Bottom Preferred Layer:
+-----------+------------+------------+----------+
|   Layer   |     DB     |    CLK     |   Rule   |
+-----------+------------+------------+----------+
| M3 (z=3)  |          0 |        185 | default  |
| M5 (z=5)  |          0 |        211 | default  |
+-----------+------------+------------+----------+
| M7 (z=7)  |          2 |          5 | CTS_RULE |
+-----------+------------+------------+----------+
Via Pillar Rule:
    None


=======================================================================
                Reasons for remaining drv violations
=======================================================================
*info: Total 4 net(s) have violations which can't be fixed by DRV optimization.


*** Finish DRV Fixing (cpu=0:00:09.8 real=0:00:02.0 mem=5952.4M) ***

*** DrvOpt #3 [finish] (ccopt_design #1) : cpu/real = 0:00:15.2/0:00:05.3 (2.8), totSession cpu/real = 0:54:26.8/0:24:14.2 (2.2), mem = 5349.1M
End: GigaOpt postEco DRV Optimization
GigaOpt: WNS changes after postEco optimization: -0.131 -> -0.134 (bump = 0.003)
GigaOpt: Skipping nonLegal postEco optimization
Design TNS changes after trial route: -0.249 -> -0.255
Begin: GigaOpt TNS non-legal recovery
GigaOpt Checkpoint: Internal optTiming -setupRecovery -newSetupRecovery -allEndPoints -maxLocalDensity 0.92 -numThreads 8 -nativePathGroupFlow  -NDROptEffortAuto  -ipoTgtSlackCoef 0 -effTgtSlackCoef 0 -tnsBumpRecoveryInTNS -integratedAreaOpt -postCTS
Info: 7 don't touch nets, 0 undriven net  excluded from IPO operation.
*info: 7 skip_routing nets excluded.
Info: 399 nets with fixed/cover wires excluded.
*info: Marking 98 level shifter instances dont touch
*info: Marking 0 isolation instances dont touch
Info: 401 clock nets excluded from IPO operation.
*** TnsOpt #2 [begin] (ccopt_design #1) : totSession cpu/real = 0:54:28.1/0:24:15.5 (2.2), mem = 5349.1M


*info: 7 don't touch nets excluded
*info: 401 clock nets excluded
*info: Marking 98 level shifter instances dont touch
*info: Marking 0 isolation instances dont touch
*info: 7 skip_routing nets excluded.
*info: 1078 no-driver nets excluded.
*info: 399 nets with fixed/cover wires excluded.
** GigaOpt Optimizer WNS Slack -0.255 TNS Slack -0.255 Density 42.95
OptDebug: Start of Optimizer TNS Pass:
+-----------------------------+------+------+
|Path Group                   |   WNS|   TNS|
+-----------------------------+------+------+
|in2out in2reg reg2out default| 0.088| 0.000|
|reg2cgate                    |-0.255|-0.255|
|reg2reg                      | 0.033| 0.000|
|HEPG                         |-0.255|-0.255|
|All Paths                    |-0.255|-0.255|
+-----------------------------+------+------+

CCOptDebug: Start of Optimizer TNS Pass: reg2cgate* WNS -0.254ns TNS -; reg2reg* WNS 0.033ns TNS -; HEPG WNS -0.254ns TNS -; all paths WNS -0.254ns TNS -0.254ns; Real time 0:07:51
Active Path Group: reg2cgate  
+--------+---------+--------+---------+---------+------------+--------+-------------------+---------+----------------------------------------------------+
|  WNS   | All WNS |  TNS   | All TNS | Density |    Real    |  Mem   |    Worst View     |Pathgroup|                     End Point                      |
+--------+---------+--------+---------+---------+------------+--------+-------------------+---------+----------------------------------------------------+
|  -0.255|   -0.255|  -0.255|   -0.255|   42.95%|   0:00:00.0| 5778.1M|test_worst_scenario|reg2cgate| occ_int2/fast_clk_0_clkgt/u_icg/EN                 |
|  -0.255|   -0.255|  -0.255|   -0.255|   42.95%|   0:00:00.0| 5897.2M|test_worst_scenario|reg2cgate| occ_int2/fast_clk_0_clkgt/u_icg/EN                 |
+--------+---------+--------+---------+---------+------------+--------+-------------------+---------+----------------------------------------------------+

*** Finish Core Optimize Step (cpu=0:00:00.4 real=0:00:00.0 mem=5897.2M) ***

*** Finished Optimize Step Cumulative (cpu=0:00:00.5 real=0:00:00.0 mem=5897.2M) ***
OptDebug: End of Optimizer TNS Pass:
+-----------------------------+------+------+
|Path Group                   |   WNS|   TNS|
+-----------------------------+------+------+
|in2out in2reg reg2out default| 0.088| 0.000|
|reg2cgate                    |-0.255|-0.255|
|reg2reg                      | 0.033| 0.000|
|HEPG                         |-0.255|-0.255|
|All Paths                    |-0.255|-0.255|
+-----------------------------+------+------+

CCOptDebug: End of Optimizer TNS Pass: reg2cgate* WNS -0.254ns TNS -; reg2reg* WNS 0.033ns TNS -; HEPG WNS -0.254ns TNS -; all paths WNS -0.254ns TNS -0.254ns; Real time 0:07:52
OptDebug: End of Setup Fixing:
+-----------------------------+------+------+
|Path Group                   |   WNS|   TNS|
+-----------------------------+------+------+
|in2out in2reg reg2out default| 0.088| 0.000|
|reg2cgate                    |-0.255|-0.255|
|reg2reg                      | 0.033| 0.000|
|HEPG                         |-0.255|-0.255|
|All Paths                    |-0.255|-0.255|
+-----------------------------+------+------+

Bottom Preferred Layer:
+-----------+------------+------------+----------+
|   Layer   |     DB     |    CLK     |   Rule   |
+-----------+------------+------------+----------+
| M3 (z=3)  |          0 |        185 | default  |
| M5 (z=5)  |          0 |        211 | default  |
+-----------+------------+------------+----------+
| M7 (z=7)  |          2 |          5 | CTS_RULE |
+-----------+------------+------------+----------+
Via Pillar Rule:
    None

*** Finish post-CTS Setup Fixing (cpu=0:00:02.3 real=0:00:02.0 mem=5897.2M) ***

*** TnsOpt #2 [finish] (ccopt_design #1) : cpu/real = 0:00:06.5/0:00:04.2 (1.6), totSession cpu/real = 0:54:34.6/0:24:19.7 (2.2), mem = 5387.9M
End: GigaOpt TNS non-legal recovery
Begin: GigaOpt Optimization in post-eco TNS mode
GigaOpt Checkpoint: Internal optTiming -postEco -postEcoLefSafe -maxLocalDensity 1.0 -numThreads 8  -allEndPoints -nativePathGroupFlow
Info: 7 don't touch nets, 0 undriven net  excluded from IPO operation.
*info: 7 skip_routing nets excluded.
Info: 399 nets with fixed/cover wires excluded.
*info: Marking 98 level shifter instances dont touch
*info: Marking 0 isolation instances dont touch
Info: 401 clock nets excluded from IPO operation.
*** TnsOpt #3 [begin] (ccopt_design #1) : totSession cpu/real = 0:54:35.3/0:24:20.4 (2.2), mem = 5387.9M


*info: 7 don't touch nets excluded
*info: 401 clock nets excluded
*info: Marking 98 level shifter instances dont touch
*info: Marking 0 isolation instances dont touch
*info: 7 skip_routing nets excluded.
*info: 1078 no-driver nets excluded.
*info: 399 nets with fixed/cover wires excluded.
** GigaOpt Optimizer WNS Slack -0.255 TNS Slack -0.255 Density 42.95
OptDebug: Start of Optimizer TNS Pass:
+-----------------------------+------+------+
|Path Group                   |   WNS|   TNS|
+-----------------------------+------+------+
|in2out in2reg reg2out default| 0.088| 0.000|
|reg2cgate                    |-0.255|-0.255|
|reg2reg                      | 0.033| 0.000|
|HEPG                         |-0.255|-0.255|
|All Paths                    |-0.255|-0.255|
+-----------------------------+------+------+

CCOptDebug: Start of Optimizer TNS Pass: reg2cgate* WNS -0.254ns TNS -; reg2reg* WNS 0.033ns TNS -; HEPG WNS -0.254ns TNS -; all paths WNS -0.254ns TNS -0.254ns; Real time 0:07:56
Active Path Group: reg2cgate  
+--------+---------+--------+---------+---------+------------+--------+-------------------+---------+----------------------------------------------------+
|  WNS   | All WNS |  TNS   | All TNS | Density |    Real    |  Mem   |    Worst View     |Pathgroup|                     End Point                      |
+--------+---------+--------+---------+---------+------------+--------+-------------------+---------+----------------------------------------------------+
|  -0.255|   -0.255|  -0.255|   -0.255|   42.95%|   0:00:00.0| 5779.9M|test_worst_scenario|reg2cgate| occ_int2/fast_clk_0_clkgt/u_icg/EN                 |
|  -0.255|   -0.255|  -0.255|   -0.255|   42.95%|   0:00:00.0| 5786.9M|test_worst_scenario|reg2cgate| occ_int2/fast_clk_0_clkgt/u_icg/EN                 |
+--------+---------+--------+---------+---------+------------+--------+-------------------+---------+----------------------------------------------------+

*** Finish Core Optimize Step (cpu=0:00:00.2 real=0:00:00.0 mem=5786.9M) ***

*** Finished Optimize Step Cumulative (cpu=0:00:00.3 real=0:00:00.0 mem=5786.9M) ***
OptDebug: End of Optimizer TNS Pass:
+-----------------------------+------+------+
|Path Group                   |   WNS|   TNS|
+-----------------------------+------+------+
|in2out in2reg reg2out default| 0.088| 0.000|
|reg2cgate                    |-0.255|-0.255|
|reg2reg                      | 0.033| 0.000|
|HEPG                         |-0.255|-0.255|
|All Paths                    |-0.255|-0.255|
+-----------------------------+------+------+

CCOptDebug: End of Optimizer TNS Pass: reg2cgate* WNS -0.254ns TNS -; reg2reg* WNS 0.033ns TNS -; HEPG WNS -0.254ns TNS -; all paths WNS -0.254ns TNS -0.254ns; Real time 0:07:57
OptDebug: End of Setup Fixing:
+-----------------------------+------+------+
|Path Group                   |   WNS|   TNS|
+-----------------------------+------+------+
|in2out in2reg reg2out default| 0.088| 0.000|
|reg2cgate                    |-0.255|-0.255|
|reg2reg                      | 0.033| 0.000|
|HEPG                         |-0.255|-0.255|
|All Paths                    |-0.255|-0.255|
+-----------------------------+------+------+

Bottom Preferred Layer:
+-----------+------------+------------+----------+
|   Layer   |     DB     |    CLK     |   Rule   |
+-----------+------------+------------+----------+
| M3 (z=3)  |          0 |        185 | default  |
| M5 (z=5)  |          0 |        211 | default  |
+-----------+------------+------------+----------+
| M7 (z=7)  |          2 |          5 | CTS_RULE |
+-----------+------------+------------+----------+
Via Pillar Rule:
    None

*** Finish post-CTS Setup Fixing (cpu=0:00:02.2 real=0:00:01.0 mem=5786.9M) ***

*** TnsOpt #3 [finish] (ccopt_design #1) : cpu/real = 0:00:06.1/0:00:03.9 (1.6), totSession cpu/real = 0:54:41.3/0:24:24.3 (2.2), mem = 5386.6M
End: GigaOpt Optimization in post-eco TNS mode
#optDebug: fT-D <X 1 0 0 0>
Register exp ratio and priority group on 0 nets on 43511 nets : 

Active setup views:
 func_worst_scenario
  Dominating endpoints: 6358
  Dominating TNS: -0.000

 test_worst_scenario
  Dominating endpoints: 2952
  Dominating TNS: -0.255

**WARN: (IMPEXT-6191):	Using a captable file is not recommended for process nodes less than or equal to 32 nm due to parasitic accuracy concerns. The Quantus QRC technology file should be specified for all RC corners using the command create_rc_corner or update_rc_corner, which will then be used for preRoute and postRoute(effort level medium or high or signoff) extraction engines.
Type 'man IMPEXT-6191' for more detail.
Extraction called for design 'ORCA_TOP' of instances=40949 and nets=44619 using extraction engine 'preRoute' .
PreRoute RC Extraction called for design ORCA_TOP.
RC Extraction called in multi-corner(2) mode.
RCMode: PreRoute
      RC Corner Indexes            0       1   
Capacitance Scaling Factor   : 1.00000 1.00000 
Resistance Scaling Factor    : 1.00000 1.00000 
Clock Cap. Scaling Factor    : 1.00000 1.00000 
Clock Res. Scaling Factor    : 1.00000 1.00000 
Shrink Factor                : 1.00000
PreRoute extraction is honoring NDR/Shielding/ExtraSpace for clock nets.
Using capacitance table file ...
Grid density data update skipped
Initializing multi-corner capacitance tables ... 
Initializing multi-corner resistance tables ...
PreRoute RC Extraction DONE (CPU Time: 0:00:01.6  Real Time: 0:00:02.0  MEM: 5232.664M)
Starting delay calculation for Setup views
AAE_INFO: opIsDesignInPostRouteState() is 0
#################################################################################
# Design Stage: PreRoute
# Design Name: ORCA_TOP
# Design Mode: 28nm
# Analysis Mode: MMMC Non-OCV 
# Parasitics Mode: No SPEF/RCDB 
# Signoff Settings: SI Off 
#################################################################################
Calculate delays in BcWc mode...
Calculate delays in BcWc mode...
Start delay calculation (fullDC) (8 T). (MEM=3936.06)
Total number of fetched objects 50078
AAE_INFO: Total number of nets for which stage creation was skipped for all views 0
End delay calculation. (MEM=3965.95 CPU=0:00:25.0 REAL=0:00:03.0)
End delay calculation (fullDC). (MEM=3965.95 CPU=0:00:32.0 REAL=0:00:05.0)
*** Done Building Timing Graph (cpu=0:00:45.4 real=0:00:08.0 totSessionCpu=0:55:41 mem=5714.0M)
OPTC: user 20.0
[NR-eGR] Started Early Global Route ( Curr Mem: 4.92 MB )
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
[NR-eGR] Started Early Global Route kernel ( Curr Mem: 4.92 MB )
[NR-eGR] Read 43482 nets ( ignored 399 )
[NR-eGR] There are 4 clock nets ( 1 with NDR ).
[NR-eGR] Layer group 1: route 43083 net(s) in layer range [2, 10]
[NR-eGR] Early Global Route overflow of layer group 1: 0.50% H + 0.02% V. EstWL: 8.997132e+05um
[NR-eGR] Overflow after Early Global Route 0.46% H + 0.00% V
[NR-eGR] Finished Early Global Route kernel ( CPU: 5.05 sec, Real: 2.55 sec, Curr Mem: 4.97 MB )
[NR-eGR] Finished Early Global Route ( CPU: 5.08 sec, Real: 2.57 sec, Curr Mem: 4.94 MB )
[hotspot] +------------+---------------+---------------+
[hotspot] |            |   max hotspot | total hotspot |
[hotspot] +------------+---------------+---------------+
[hotspot] | normalized |          0.26 |          0.26 |
[hotspot] +------------+---------------+---------------+
Local HotSpot Analysis: normalized max congestion hotspot area = 0.26, normalized total congestion hotspot area = 0.26 (area is in unit of 4 std-cell row bins)
[hotspot] top 1 congestion hotspot bounding boxes and scores of normalized hotspot
[hotspot] +-----+-------------------------------------+---------------+-------------------------------+
[hotspot] | top |            hotspot bbox             | hotspot score |           module              |
[hotspot] +-----+-------------------------------------+---------------+-------------------------------+
[hotspot] |  1  |     0.00   347.78    26.75   374.53 |        0.26   | I_PCI_TOP                     |
[hotspot] +-----+-------------------------------------+---------------+-------------------------------+
[hotspot] Hotspot report including placement blocked areas
[hotspot] +------------+---------------+---------------+
[hotspot] |            |   max hotspot | total hotspot |
[hotspot] +------------+---------------+---------------+
[hotspot] | normalized |          0.26 |          0.52 |
[hotspot] +------------+---------------+---------------+
Local HotSpot Analysis (blockage included): normalized max congestion hotspot area = 0.26, normalized total congestion hotspot area = 0.52 (area is in unit of 4 std-cell row bins)
[hotspot] top 2 congestion hotspot bounding boxes and scores of normalized hotspot
[hotspot] +-----+-------------------------------------+---------------+-------------------------------+
[hotspot] | top |            hotspot bbox             | hotspot score |           module              |
[hotspot] +-----+-------------------------------------+---------------+-------------------------------+
[hotspot] |  1  |     0.00   347.78    26.75   374.53 |        0.26   | I_PCI_TOP                     |
[hotspot] +-----+-------------------------------------+---------------+-------------------------------+
[hotspot] |  2  |   240.77   387.90   267.52   414.66 |        0.26   | I_CONTEXT_MEM                 |
[hotspot] +-----+-------------------------------------+---------------+-------------------------------+
Reported timing to dir ./timingReports
**optDesign ... cpu = 0:10:33, real = 0:04:44, mem = 3929.3M, totSessionCpu=0:55:48 **
**WARN: (IMPOPT-3668):	There are 48 nets with MSV violations, timing and DRV optimization of such nets is limited.  Please use verifyPowerDomain to analyze these further.


------------------------------------------------------------------
     optDesign Final Summary
------------------------------------------------------------------

Setup views included:
 test_worst_scenario func_worst_scenario 

+--------------------+---------+---------+---------+---------+---------+---------+---------+
|     Setup mode     |   all   | reg2reg |reg2cgate| in2reg  | reg2out | in2out  | default |
+--------------------+---------+---------+---------+---------+---------+---------+---------+
|           WNS (ns):| -0.254  |  0.033  | -0.254  |  0.925  |  0.088  |  0.821  |  0.934  |
|           TNS (ns):| -0.254  |  0.000  | -0.254  |  0.000  |  0.000  |  0.000  |  0.000  |
|    Violating Paths:|    1    |    0    |    1    |    0    |    0    |    0    |    0    |
|          All Paths:|  10179  |  9907   |   26    |   129   |   115   |   32    |   12    |
+--------------------+---------+---------+---------+---------+---------+---------+---------+

+----------------+-------------------------------+------------------+
|                |              Real             |       Total      |
|    DRVs        +------------------+------------+------------------|
|                |  Nr nets(terms)  | Worst Vio  |  Nr nets(terms)  |
+----------------+------------------+------------+------------------+
|   max_cap      |      0 (0)       |   0.000    |      4 (4)       |
|   max_tran     |      0 (0)       |   0.000    |      0 (0)       |
|   max_fanout   |      0 (0)       |     0      |      0 (0)       |
|   max_length   |      0 (0)       |     0      |      0 (0)       |
+----------------+------------------+------------+------------------+

Density: 42.839%
Routing Overflow: 0.46% H and 0.00% V
------------------------------------------------------------------
Begin: Collecting metrics
 ------------------------------------------------------------------------------------------------------------------------------------------------------- 
| Snapshot                | WNS                  | TNS                  | Density (%) | Hotspot                   | Resource               | DRVs       |
|                         | HEPG (ns) | ALL (ns) | HEPG (ns) | ALL (ns) |             | Max (bins) | Total (bins) | Real (s) | Memory (MB) | Tran | Cap |
|-------------------------+-----------+----------+-----------+----------+-------------+------------+--------------+----------+-------------+------+-----|
| initial_summary         |           |   -1.095 |           |      -14 |       42.80 |            |              | 0:00:13  |        5020 |   64 |  67 |
| route_type_refinement   |           |          |           |          |             |            |              | 0:00:02  |        5112 |      |     |
| simplify_netlist        |           |          |           |          |             |            |              | 0:00:04  |        5113 |      |     |
| excluded_clk_net_fixing |           |          |           |          |             |            |              | 0:00:00  |        5113 |      |     |
| drv_fixing              |     0.000 |   -0.575 |         0 |       -1 |       42.98 |            |              | 0:00:11  |        5232 |    0 |   5 |
| global_opt              |           |   -0.258 |           |       -0 |       42.98 |            |              | 0:00:06  |        5284 |      |     |
| global_opt_2            |           |   -0.253 |           |       -0 |       42.98 |            |              | 0:00:08  |        5314 |      |     |
| area_reclaiming         |     0.000 |   -0.253 |         0 |       -0 |       42.92 |            |              | 0:00:17  |        5324 |      |     |
| wns_fixing              |    -0.251 |   -0.267 |        -0 |       -0 |       42.92 |            |              | 0:00:27  |        5930 |      |     |
| tns_fixing              |    -0.251 |   -0.267 |        -0 |       -0 |       42.92 |            |              | 0:00:05  |        5785 |      |     |
| area_reclaiming_2       |    -0.251 |   -0.251 |        -0 |       -0 |       42.92 |            |              | 0:00:13  |        5340 |      |     |
| local_wire_reclaim      |           |          |           |          |             |            |              | 0:01:09  |        5348 |      |     |
| global_route            |           |          |           |          |             |       0.00 |         0.00 | 0:00:08  |        5175 |      |     |
| route_type_refinement_2 |           |          |           |          |             |            |              | 0:00:00  |        5175 |      |     |
| drv_eco_fixing          |    -0.255 |   -0.255 |        -0 |       -0 |       42.95 |            |              | 0:00:06  |        5349 |    0 |   4 |
| tns_eco_fixing          |    -0.255 |   -0.255 |        -0 |       -0 |       42.95 |            |              | 0:00:04  |        5897 |      |     |
| tns_eco_fixing_2        |    -0.255 |   -0.255 |        -0 |       -0 |       42.95 |            |              | 0:00:04  |        5787 |      |     |
| final_summary           |    -0.254 |   -0.254 |           |       -0 |       42.84 |       0.26 |         0.52 | 0:00:14  |        5296 |    0 |   0 |
 ------------------------------------------------------------------------------------------------------------------------------------------------------- 
End: Collecting metrics
**optDesign ... cpu = 0:10:56, real = 0:04:57, mem = 3951.2M, totSessionCpu=0:56:11 **
*** Finished optDesign ***
      flow.cputime  flow.realtime  timing.setup.tns  timing.setup.wns  snapshot
UM:*                                                                   final
      flow.cputime  flow.realtime  timing.setup.tns  timing.setup.wns  snapshot
UM:*                                                                   opt_design_postcts
Info: final physical memory for 9 CRR processes is 916.08MB.
Info: Summary of CRR changes:
      - Timing transform commits:       0
Info: Destroy the CCOpt slew target map.
Removing temporary dont_use automatically set for cells with technology sites with no row.
(ccopt_design): dumping clock statistics to metric
Updating ideal nets and annotations...
Clock tree spec update: Ideal nets, transition and delay annotations were updated to match active timing constraints.
Updating ideal nets and annotations done. (took cpu=0:00:00.1 real=0:00:00.1)
No differences between SDC and CTS ideal net status found.
Clock tree timing engine global stage delay update for worst_corner:setup.early...
Clock tree timing engine global stage delay update for worst_corner:setup.early done. (took cpu=0:00:00.9 real=0:00:00.2)
Clock tree timing engine global stage delay update for worst_corner:setup.late...
Clock tree timing engine global stage delay update for worst_corner:setup.late done. (took cpu=0:00:00.2 real=0:00:00.0)
Clock tree timing engine global stage delay update for best_corner:hold.early...
Clock tree timing engine global stage delay update for best_corner:hold.early done. (took cpu=0:00:00.2 real=0:00:00.0)
Clock tree timing engine global stage delay update for best_corner:hold.late...
Clock tree timing engine global stage delay update for best_corner:hold.late done. (took cpu=0:00:00.2 real=0:00:00.0)
UM: Running design category ...

      flow.cputime  flow.realtime  timing.setup.tns  timing.setup.wns  snapshot
UM:        1172.96            516         -0.254 ns         -0.254 ns  ccopt_design

*** Summary of all messages that are not suppressed in this session:
Severity  ID               Count  Summary                                  
WARNING   IMPMSMV-1810      5044  Net %s, driver %s (cell %s) voltage %g d...
WARNING   IMPEXT-6191          5  Using a captable file is not recommended...
WARNING   IMPSC-1001           4  Unable to trace scan chain "%s". Check t...
WARNING   IMPSC-1138         268  In scan chain "%s" DEF ordered section, ...
WARNING   IMPSC-1143           2  Unable to apply DEF ordered sections for...
WARNING   IMPSC-1144           4  Scan chain "%s" was not traced through. ...
WARNING   IMPSC-1117           2  Skip reordering scan chain "%s" because ...
WARNING   IMPSC-1020           4  Instance's output pin "%s/%s" (Cell "%s"...
WARNING   IMPOPT-3668          5  There are %d nets with MSV violations, t...
WARNING   IMPOPT-3564          1  The following cells are set dont_use tem...
WARNING   IMPCCOPT-1026        6  Did not meet the insertion delay target ...
WARNING   IMPCCOPT-1033        4  Did not meet the max_capacitance constra...
WARNING   IMPCCOPT-1059       10  Slackened off %s from %s to %s.          
WARNING   IMPCCOPT-1127        8  The skew group %s has been identified as...
WARNING   IMPCCOPT-2256        1  CCOpt post-route optimization found lega...
ERROR     IMPCCOPT-4334       40  The lib cell '%s' specified in %s was no...
WARNING   IMPCCOPT-2314        1  CCOpt found %u clock tree nets marked as...
WARNING   IMPCCOPT-5038        1  %d of %d net(s) are pre-routed or have t...
WARNING   IMPCCOPT-2015        2  %s will not update I/O latencies for the...
WARNING   IMPCCOPT-1023        1  Did not meet the skew target of %s       
WARNING   IMPPSP-1131         20  For techSite %s, row: (%d, %d) - (%d, %d...
WARNING   IMPPSP-1132          2  For techSite %s, have a total of %d rows...
*** Message Summary: 5395 warning(s), 40 error(s)

*** ccopt_design #1 [finish] () : cpu/real = 0:19:32.8/0:08:36.0 (2.3), totSession cpu/real = 0:56:20.2/0:25:02.5 (2.2), mem = 5659.5M
#% End ccopt_design (date=06/12 02:10:45, total cpu=0:19:33, real=0:08:36, peak res=4335.4M, current mem=3830.5M)
**optDesign ... cpu = 0:00:00, real = 0:00:00, mem = 3634.0M, totSessionCpu=0:56:21 **
*** optDesign #1 [begin] () : totSession cpu/real = 0:56:21.5/0:25:04.0 (2.2), mem = 5072.0M
GigaOpt running with 8 threads.
*** InitOpt #1 [begin] (optDesign #1) : totSession cpu/real = 0:56:21.5/0:25:04.0 (2.2), mem = 5072.0M
**INFO: User settings:
setDesignMode -earlyClockFlow                                  false
setDesignMode -flowEffort                                      standard
setDesignMode -process                                         28
setExtractRCMode -coupling_c_th                                0.1
setExtractRCMode -engine                                       preRoute
setExtractRCMode -relative_c_th                                1
setExtractRCMode -total_c_th                                   0
setDelayCalMode -enable_high_fanout                            true
setDelayCalMode -eng_enablePrePlacedFlow                       false
setDelayCalMode -engine                                        aae
setDelayCalMode -ignoreNetLoad                                 false
setDelayCalMode -socv_accuracy_mode                            low
setOptMode -opt_view_pruning_hold_views_active_list            { test_best_scenario func_best_scenario }
setOptMode -opt_view_pruning_setup_views_active_list           { test_worst_scenario func_worst_scenario }
setOptMode -opt_view_pruning_setup_views_persistent_list       { func_worst_scenario test_worst_scenario}
setOptMode -opt_view_pruning_tdgr_setup_views_persistent_list  { func_worst_scenario test_worst_scenario}
setOptMode -opt_drv_margin                                     0
setOptMode -opt_enable_podv2_clock_opt_flow                    false
setOptMode -opt_exp_buffer_tat_enhancement                     true
setOptMode -opt_exp_global_sizing_tat_fix                      true
setOptMode -opt_exp_pre_cts_new_standard_flow                  true
setOptMode -opt_exp_reclaim_area_rebuffer_tat_fix              true
setOptMode -opt_exp_roi_flow_tat_enhancements                  true
setOptMode -opt_exp_view_pruning_timer_mode                    low
setOptMode -opt_flow_ccopt_extreme_tat_enhancement_v2          true
setOptMode -opt_drv                                            true
setOptMode -opt_post_route_enable_si_attacker_sizing           false
setOptMode -opt_resize_flip_flops                              true
setOptMode -opt_view_pruning_placement_setup_view_list         { func_worst_scenario  }
setOptMode -opt_preserve_all_sequential                        false
setOptMode -opt_setup_target_slack                             0
setOptMode -opt_skew                                           false
setOptMode -opt_skew_ccopt                                     none
setOptMode -opt_skew_post_route                                false
setOptMode -opt_skew_pre_cts                                   false
setAnalysisMode -analysisType                                  onChipVariation
setAnalysisMode -checkType                                     setup
setAnalysisMode -clkSrcPath                                    true
setAnalysisMode -clockPropagation                              sdcControl
setAnalysisMode -cppr                                          both
setAnalysisMode -usefulSkew                                    true

**INFO: setDesignMode -flowEffort standard -> setting 'setOptMode -allEndPoints true' for the duration of this command.
Need call spDPlaceInit before registerPrioInstLoc.
**WARN: (IMPOPT-3668):	There are 48 nets with MSV violations, timing and DRV optimization of such nets is limited.  Please use verifyPowerDomain to analyze these further.
[GPS-MSV] Msv Violating net with fanout count = 1: I_RISC_CORE/I_REG_FILE_data_out_A[15]
[GPS-MSV] Timing and DRV optimization for this net is limited, Please correct the MSV violation. 
[GPS-MSV] UPF Flow. Number of Power Domains: 2
[GPS-MSV]   Power Domain 'PD_RISC_CORE' (tag=1)
[GPS-MSV]   Power Domain 'PD_ORCA_TOP' (tag=2) Default
RODC: v2.8s

**WARN: (IMPOPT-3564):	The following cells are set dont_use temporarily by the tool because there are no rows defined for their technology site, or they are not placeable in any power domain, or their pins cannot be snapped to the tracks. To avoid this message, review the floorplan, msv setting, the library setting or set manually those cells as dont_use.
	Cell FOOT2X16_HVT, site unit.
	Cell FOOT2X16_LVT, site unit.
	Cell FOOT2X16_RVT, site unit.
	Cell FOOT2X2_HVT, site unit.
	Cell FOOT2X2_LVT, site unit.
	Cell FOOT2X2_RVT, site unit.
	Cell FOOT2X32_HVT, site unit.
	Cell FOOT2X32_LVT, site unit.
	Cell FOOT2X32_RVT, site unit.
	Cell FOOT2X4_HVT, site unit.
	Cell FOOT2X4_LVT, site unit.
	Cell FOOT2X4_RVT, site unit.
	Cell FOOT2X8_HVT, site unit.
	Cell FOOT2X8_LVT, site unit.
	Cell FOOT2X8_RVT, site unit.
	Cell FOOTX16_HVT, site unit.
	Cell FOOTX16_LVT, site unit.
	Cell FOOTX16_RVT, site unit.
	Cell FOOTX2_HVT, site unit.
	Cell FOOTX2_LVT, site unit.
	...
	Reporting only the 20 first cells found...
.

**INFO: Using Advanced Metric Collection system.
**optDesign ... cpu = 0:00:11, real = 0:00:05, mem = 3815.9M, totSessionCpu=0:56:32 **
#optDebug: { P: 28 W: 2195 FE: standard PE: none LDR: 1}
*** optDesign -postCTS ***
DRC Margin: user margin 0.0
Hold Target Slack: user slack 0
Setup Target Slack: user slack 0;

Start to check current routing status for nets...
All nets are already routed correctly.
End to check current routing status for nets (mem=5159.3M)
*** InitOpt #1 [finish] (optDesign #1) : cpu/real = 0:00:11.6/0:00:05.0 (2.3), totSession cpu/real = 0:56:33.2/0:25:09.1 (2.2), mem = 5159.3M

GigaOpt Hold Optimizer is used
GigaOpt Checkpoint: Internal optHold -postCts -maxLocalDensity 1.0 -numThreads 8 -nativePathGroupFlow -viewPruneEffortLevel 1
AAE DB initialization (MEM=5186.11 CPU=0:00:00.0 REAL=0:00:00.0) 
Starting initialization (fixHold) cpu=0:00:00.0 real=0:00:00.0 totSessionCpu=0:56:36 mem=5416.2M ***
*** BuildHoldData #1 [begin] (optDesign #1) : totSession cpu/real = 0:56:35.7/0:25:11.0 (2.2), mem = 5416.2M
OPTC: user 20.0
Starting delay calculation for Hold views
AAE_INFO: opIsDesignInPostRouteState() is 0
#################################################################################
# Design Stage: PreRoute
# Design Name: ORCA_TOP
# Design Mode: 28nm
# Analysis Mode: MMMC OCV 
# Parasitics Mode: No SPEF/RCDB 
# Signoff Settings: SI Off 
#################################################################################
Start delay calculation (fullDC) (8 T). (MEM=3868.16)
*** Calculating scaling factor for best_libs libraries using the default operating condition of each library.
Total number of fetched objects 50078
AAE_INFO: Total number of nets for which stage creation was skipped for all views 0
End delay calculation. (MEM=3942.04 CPU=0:00:25.3 REAL=0:00:03.0)
End delay calculation (fullDC). (MEM=3801.26 CPU=0:00:35.7 REAL=0:00:12.0)
*** Done Building Timing Graph (cpu=0:00:44.8 real=0:00:15.0 totSessionCpu=0:57:27 mem=5850.3M)

Active hold views:
 func_best_scenario
  Dominating endpoints: 6865
  Dominating TNS: -21.610

 test_best_scenario
  Dominating endpoints: 3312
  Dominating TNS: -1.427

Done building cte hold timing graph (fixHold) cpu=0:00:55.9 real=0:00:18.0 totSessionCpu=0:57:32 mem=5882.4M ***
OPTC: user 20.0
Done building hold timer [3459 node(s), 3753 edge(s), 2 view(s)] (fixHold) cpu=0:00:59.9 real=0:00:20.0 totSessionCpu=0:57:36 mem=5882.4M ***
Starting delay calculation for Setup views
AAE_INFO: opIsDesignInPostRouteState() is 0
#################################################################################
# Design Stage: PreRoute
# Design Name: ORCA_TOP
# Design Mode: 28nm
# Analysis Mode: MMMC OCV 
# Parasitics Mode: No SPEF/RCDB 
# Signoff Settings: SI Off 
#################################################################################
Start delay calculation (fullDC) (8 T). (MEM=3865.52)
*** Calculating scaling factor for worst_libs libraries using the default operating condition of each library.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25764_Oprnd_B_12, driver I_RISC_CORE/FE_OFC5395_Oprnd_B_12/Y (cell NBUFFX2_LVT) voltage 0.95 does not match receiver I_RISC_CORE/U99/A1 (cell OAI22X1_LVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25764_Oprnd_B_12, driver I_RISC_CORE/FE_OFC5395_Oprnd_B_12/Y (cell NBUFFX2_LVT) voltage 0.95 does not match receiver I_RISC_CORE/U717/A2 (cell NAND2X0_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25764_Oprnd_B_12, driver I_RISC_CORE/FE_OFC5395_Oprnd_B_12/Y (cell NBUFFX2_LVT) voltage 0.95 does not match receiver I_RISC_CORE/U712/A1 (cell OR2X1_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25764_Oprnd_B_12, driver I_RISC_CORE/FE_OFC5395_Oprnd_B_12/Y (cell NBUFFX2_LVT) voltage 0.95 does not match receiver I_RISC_CORE/U1548/A (cell INVX2_LVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25757_I_STACK_TOP_TOS_1, driver I_RISC_CORE/FE_OFC5388_I_STACK_TOP_TOS_1/Y (cell NBUFFX2_LVT) voltage 0.95 does not match receiver I_RISC_CORE/I_STACK_TOP_I_STACK_FSM_TOS_int_reg_0_/SI (cell SDFFARX2_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25757_I_STACK_TOP_TOS_1, driver I_RISC_CORE/FE_OFC5388_I_STACK_TOP_TOS_1/Y (cell NBUFFX2_LVT) voltage 0.95 does not match receiver I_RISC_CORE/U1376/A1 (cell NAND2X0_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25757_I_STACK_TOP_TOS_1, driver I_RISC_CORE/FE_OFC5388_I_STACK_TOP_TOS_1/Y (cell NBUFFX2_LVT) voltage 0.95 does not match receiver I_RISC_CORE/U1369/A (cell INVX1_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25757_I_STACK_TOP_TOS_1, driver I_RISC_CORE/FE_OFC5388_I_STACK_TOP_TOS_1/Y (cell NBUFFX2_LVT) voltage 0.95 does not match receiver I_RISC_CORE/U1368/A1 (cell AND3X1_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25661_n681, driver I_RISC_CORE/FE_OFC5293_n681/Y (cell NBUFFX2_LVT) voltage 0.95 does not match receiver I_RISC_CORE/I_DATA_PATH_Oprnd_B_reg_7_/D (cell SDFFX2_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25635_n_12, driver I_RISC_CORE/FE_OFC5267_n_12/Y (cell INVX1_LVT) voltage 0.95 does not match receiver I_RISC_CORE/I_INSTRN_LAT_Crnt_Instrn_2_reg_22_/D (cell SDFFARX1_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25603_n1556, driver I_RISC_CORE/FE_OFC5236_n1556/Y (cell NBUFFX2_LVT) voltage 0.95 does not match receiver I_RISC_CORE/U818/A1 (cell NOR2X1_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25655_RegPort_C_13, driver I_RISC_CORE/FE_OFC5287_RegPort_C_13/Y (cell NBUFFX2_LVT) voltage 0.95 does not match receiver I_RISC_CORE/I_REG_FILE_REG_FILE_A_RAM/I1[13] (cell SRAM2RW128x16) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25665_n1200, driver I_RISC_CORE/FE_OFC5297_n1200/Y (cell NBUFFX4_LVT) voltage 0.95 does not match receiver I_RISC_CORE/U130/A2 (cell OAI22X1_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (EMS-27):	Message (IMPMSMV-1810) has exceeded the current message display limit of 20.
To increase the message display limit, refer to the product command reference manual.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25667_Addr_A_6, driver I_RISC_CORE/FE_OFC5299_Addr_A_6/Y (cell NBUFFX2_LVT) voltage 0.95 does not match receiver I_RISC_CORE/I_REG_FILE_REG_FILE_C_RAM/A2[6] (cell SRAM2RW128x16) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25652_n, driver I_RISC_CORE/U1617/Y (cell AO22X1_LVT) voltage 0.75 does not match receiver I_RISC_CORE/FE_OFC5284_n714/A (cell NBUFFX2_LVT) voltage 0.95 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25757_I_STACK_TOP_TOS_1, driver I_RISC_CORE/FE_OFC5388_I_STACK_TOP_TOS_1/Y (cell NBUFFX2_LVT) voltage 0.95 does not match receiver I_RISC_CORE/U1545/A1 (cell NAND3X2_LVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25741_n, driver I_RISC_CORE/FE_OFC5373_n396_1/Y (cell NBUFFX2_LVT) voltage 0.95 does not match receiver I_RISC_CORE/U1509/A1 (cell AND2X1_LVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25603_n1556, driver I_RISC_CORE/FE_OFC5236_n1556/Y (cell NBUFFX2_LVT) voltage 0.95 does not match receiver I_RISC_CORE/U243/A3 (cell OA21X2_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25583_n, driver I_RISC_CORE/FE_OFC5217_n376_1/Y (cell NBUFFX2_LVT) voltage 0.95 does not match receiver I_RISC_CORE/I_REG_FILE_REG_FILE_B_RAM/A2[3] (cell SRAM2RW128x16) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
**WARN: (IMPMSMV-1810):	Net I_RISC_CORE/FE_OFN25653_I_DATA_PATH_N55, driver I_RISC_CORE/FE_OFC5285_I_DATA_PATH_N55/Y (cell NBUFFX2_LVT) voltage 0.95 does not match receiver I_RISC_CORE/I_DATA_PATH_Oprnd_B_reg_6_/D (cell SDFFX2_RVT) voltage 0.75 for view test_worst_scenario.
Type 'man IMPMSMV-1810' for more detail.
Total number of fetched objects 50078
AAE_INFO: Total number of nets for which stage creation was skipped for all views 0
End delay calculation. (MEM=3912.17 CPU=0:00:26.9 REAL=0:00:04.0)
End delay calculation (fullDC). (MEM=3912.17 CPU=0:00:38.9 REAL=0:00:08.0)
*** Done Building Timing Graph (cpu=0:00:59.5 real=0:00:13.0 totSessionCpu=0:58:43 mem=5850.3M)
Done building cte setup timing graph (fixHold) cpu=0:02:09 real=0:00:36.0 totSessionCpu=0:58:44 mem=5850.3M ***

*Info: minBufDelay = 57.6 ps, libStdDelay = 11.2 ps, minBufSize = 2033152 (8.0)
*Info: worst delay setup view: test_worst_scenario func_worst_scenario


------------------------------------------------------------------
     Hold Opt Initial Summary
------------------------------------------------------------------

Setup views included:
 test_worst_scenario func_worst_scenario
Hold views included:
 test_best_scenario func_best_scenario

+--------------------+---------+---------+---------+---------+---------+---------+---------+
|     Setup mode     |   all   | reg2reg |reg2cgate| in2reg  | reg2out | in2out  | default |
+--------------------+---------+---------+---------+---------+---------+---------+---------+
|           WNS (ns):| -0.266  |  0.016  | -0.266  |  0.883  |  0.040  |  0.697  |  0.916  |
|           TNS (ns):| -0.266  |  0.000  | -0.266  |  0.000  |  0.000  |  0.000  |  0.000  |
|    Violating Paths:|    1    |    0    |    1    |    0    |    0    |    0    |    0    |
|          All Paths:|  10179  |  9907   |   26    |   129   |   115   |   32    |   12    |
+--------------------+---------+---------+---------+---------+---------+---------+---------+

+--------------------+---------+---------+---------+---------+---------+---------+---------+
|     Hold mode      |   all   | reg2reg |reg2cgate| in2reg  | reg2out | in2out  | default |
+--------------------+---------+---------+---------+---------+---------+---------+---------+
|           WNS (ns):| -0.356  | -0.007  |  0.126  | -0.356  | -0.133  |  0.068  | -0.168  |
|           TNS (ns):| -23.038 | -0.054  |  0.000  | -18.687 | -3.586  |  0.000  | -0.710  |
|    Violating Paths:|   158   |    9    |    0    |   108   |   32    |    0    |    9    |
|          All Paths:|  10193  |  9930   |   26    |   125   |   110   |   32    |   12    |
+--------------------+---------+---------+---------+---------+---------+---------+---------+

+----------------+-------------------------------+------------------+
|                |              Real             |       Total      |
|    DRVs        +------------------+------------+------------------|
|                |  Nr nets(terms)  | Worst Vio  |  Nr nets(terms)  |
+----------------+------------------+------------+------------------+
|   max_cap      |      0 (0)       |   0.000    |      4 (4)       |
|   max_tran     |      0 (0)       |   0.000    |      0 (0)       |
|   max_fanout   |      0 (0)       |     0      |      0 (0)       |
|   max_length   |      0 (0)       |     0      |      0 (0)       |
+----------------+------------------+------------+------------------+

Density: 42.839%
Routing Overflow: 0.46% H and 0.00% V
------------------------------------------------------------------
**optDesign ... cpu = 0:02:43, real = 0:00:52, mem = 3881.6M, totSessionCpu=0:59:05 **
*** BuildHoldData #1 [finish] (optDesign #1) : cpu/real = 0:02:29.5/0:00:44.7 (3.3), totSession cpu/real = 0:59:05.2/0:25:55.7 (2.3), mem = 5462.4M
*** HoldOpt #1 [begin] (optDesign #1) : totSession cpu/real = 0:59:05.2/0:25:55.7 (2.3), mem = 5462.4M
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
	CornerforLayerOpt timing analysis view test_worst_scenario has been selected for calibration 
*info: Run optDesign holdfix with 8 threads.
Info: 7 don't touch nets, 0 undriven net  excluded from IPO operation.
*info: 7 skip_routing nets excluded.
Info: 399 nets with fixed/cover wires excluded.
*info: Marking 98 level shifter instances dont touch
*info: Marking 0 isolation instances dont touch
Info: 401 clock nets excluded from IPO operation.
Info: Done creating the CCOpt slew target map.



*** Starting Core Fixing (fixHold) cpu=0:02:36 real=0:00:49.0 totSessionCpu=0:59:11 mem=5928.9M density=42.950% ***

Phase I ......
Executing transform: ECO Safe Resize
+----+--------+---------+--------+-----------+----------------+---------+------------+---------+
|Iter|  WNS   |  TNS    |  #VP   |  #Buffer  |  #Resize(F/F)  | Density |    Real    |   Mem   |
+----+--------+---------+--------+-----------+----------------+---------+------------+---------+
|   0|  -0.356|   -23.04|     158|          0|       0(     0)|   42.95%|   0:00:00.0|  6004.3M|
|   1|  -0.356|   -23.04|     158|          0|       0(     0)|   42.95%|   0:00:00.0|  6004.3M|
+----+--------+---------+--------+-----------+----------------+---------+------------+---------+
Executing transform: AddBuffer + LegalResize
+----+--------+---------+--------+-----------+----------------+---------+------------+---------+
|Iter|  WNS   |  TNS    |  #VP   |  #Buffer  |  #Resize(F/F)  | Density |    Real    |   Mem   |
+----+--------+---------+--------+-----------+----------------+---------+------------+---------+
|   0|  -0.356|   -23.04|     158|          0|       0(     0)|   42.95%|   0:00:00.0|  6004.3M|
|   1|  -0.230|    -5.34|      92|         76|       0(     0)|   43.06%|   0:00:02.0|  6323.3M|
|   2|  -0.147|    -1.07|      24|         35|       0(     0)|   43.11%|   0:00:01.0|  6360.8M|
|   3|  -0.120|    -0.50|      13|         11|       0(     0)|   43.12%|   0:00:00.0|  6360.8M|
|   4|  -0.106|    -0.44|       5|          3|       0(     0)|   43.12%|   0:00:01.0|  6360.8M|
|   5|  -0.091|    -0.41|       5|          1|       0(     0)|   43.12%|   0:00:00.0|  6360.8M|
|   6|  -0.087|    -0.32|       4|          1|       0(     0)|   43.12%|   0:00:00.0|  6360.8M|
|   7|  -0.087|    -0.26|       3|          1|       0(     0)|   43.12%|   0:00:00.0|  6360.8M|
+----+--------+---------+--------+-----------+----------------+---------+------------+---------+

*info:    Total 128 cells added for Phase I
*info:        in which 0 is ripple commits (0.000%)
Bottom Preferred Layer:
+-----------+------------+------------+----------+
|   Layer   |     DB     |    CLK     |   Rule   |
+-----------+------------+------------+----------+
| M3 (z=3)  |          0 |        185 | default  |
| M5 (z=5)  |          0 |        211 | default  |
+-----------+------------+------------+----------+
| M7 (z=7)  |          2 |          5 | CTS_RULE |
+-----------+------------+------------+----------+
Via Pillar Rule:
    None


=======================================================================
                Reasons for remaining hold violations
=======================================================================
*info: Total 2 net(s) have violated hold timing slacks.

Buffering failure reasons
------------------------------------------------
*info:     2 net(s): Could not be fixed because it is clock net.

Resizing failure reasons
------------------------------------------------
*info:     2 net(s): Could not be fixed because it is clock net.


*** Finished Core Fixing (fixHold) cpu=0:02:58 real=0:00:55.0 totSessionCpu=0:59:34 mem=6274.2M density=43.123% ***

*info:
*info: Added a total of 128 cells to fix/reduce hold violation
*info:
*info: Summary: 
*info:           32 cells of type 'DELLN1X2_HVT' used
*info:           41 cells of type 'DELLN1X2_RVT' used
*info:            5 cells of type 'DELLN2X2_HVT' used
*info:            4 cells of type 'DELLN2X2_LVT' used
*info:            9 cells of type 'DELLN2X2_RVT' used
*info:            1 cell  of type 'NBUFFX16_LVT' used
*info:            6 cells of type 'NBUFFX2_HVT' used
*info:           17 cells of type 'NBUFFX2_LVT' used
*info:            2 cells of type 'NBUFFX2_RVT' used
*info:            1 cell  of type 'NBUFFX4_LVT' used
*info:            3 cells of type 'NBUFFX8_LVT' used
*info:            7 cells of type 'NBUFFX8_RVT' used


*** Starting refinePlace (0:59:34 mem=6190.9M) ***
Total net bbox length = 8.619e+05 (5.084e+05 3.535e+05) (ext = 1.166e+04)
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Move report: Detail placement moves 110 insts, mean move: 0.61 um, max move: 5.47 um 
	Max move on inst (I_RISC_CORE/U1645): (197.75, 177.23) --> (201.55, 178.90)
	Runtime: CPU: 0:00:13.6 REAL: 0:00:05.0 MEM: 6189.9MB
Summary Report:
Instances move: 110 (out of 40625 movable)
Instances flipped: 0
Mean displacement: 0.61 um
Max displacement: 5.47 um (Instance: I_RISC_CORE/U1645) (197.752, 177.232) -> (201.552, 178.904)
	Length: 5 sites, height: 1 rows, site name: unit, cell type: INVX1_RVT, constraint:Fence
Physical-only instances move: 0 (out of 0 movable physical-only)
Total net bbox length = 8.619e+05 (5.084e+05 3.535e+05) (ext = 1.166e+04)
Runtime: CPU: 0:00:13.9 REAL: 0:00:05.0 MEM: 6189.9MB
*** Finished refinePlace (0:59:48 mem=6189.9M) ***
*** maximum move = 5.47 um ***
*** Finished re-routing un-routed nets (6195.9M) ***


*** Finish Physical Update (cpu=0:00:17.1 real=0:00:07.0 mem=6196.2M) ***
*** Finish Post CTS Hold Fixing (cpu=0:03:17 real=0:01:03 totSessionCpu=0:59:53 mem=6277.6M density=43.123%) ***
**INFO: total 253 insts, 283 nets marked don't touch
**INFO: total 253 insts, 283 nets marked don't touch DB property
**INFO: total 253 insts, 283 nets unmarked don't touch
*** HoldOpt #1 [finish] (optDesign #1) : cpu/real = 0:00:48.3/0:00:18.2 (2.7), totSession cpu/real = 0:59:53.6/0:26:13.9 (2.3), mem = 5624.3M

*** Steiner Routed Nets: 0.608%; Threshold: 100; Threshold for Hold: 100
Re-routed 0 nets
GigaOpt_HOLD: Recover setup timing after hold fixing
GigaOpt_HOLD: max_tran 0 => 0, max_cap 4 => 4 (threshold 10) - Skip drv recovery
GigaOpt: WNS changes after routing: -0.140 -> -0.140 (bump = 0.0)
GigaOpt: WNS bump threshold: 0.0056
GigaOpt: Skipping postEco optimization
GigaOpt: WNS changes after postEco optimization: -0.140 -> -0.140 (bump = 0.0)
GigaOpt: Skipping nonLegal postEco optimization
HighEffort PG TNS changes after trial route: -0.266 -> -0.266 (threshold = 5.6)
GigaOpt: Skipping post-eco TNS optimization

Active setup views:
 func_worst_scenario
  Dominating endpoints: 6371
  Dominating TNS: -0.000

 test_worst_scenario
  Dominating endpoints: 2991
  Dominating TNS: -0.266

OPTC: user 20.0
OPTC: user 20.0
Max route layer is changed from 127 to 10 because there is no routing track above this layer
Max route layer is changed from 127 to 10 because there is no routing track above this layer
[NR-eGR] Read 43610 nets ( ignored 399 )
[NR-eGR] There are 4 clock nets ( 1 with NDR ).
[NR-eGR] Layer group 1: route 43211 net(s) in layer range [2, 10]
[NR-eGR] Early Global Route overflow of layer group 1: 0.49% H + 0.02% V. EstWL: 9.023533e+05um
[NR-eGR] Overflow after Early Global Route 0.44% H + 0.00% V
[NR-eGR] Finished Early Global Route kernel ( CPU: 5.12 sec, Real: 2.53 sec, Curr Mem: 5.32 MB )
[NR-eGR] Finished Early Global Route ( CPU: 5.14 sec, Real: 2.55 sec, Curr Mem: 5.28 MB )
[hotspot] +------------+---------------+---------------+
[hotspot] |            |   max hotspot | total hotspot |
[hotspot] +------------+---------------+---------------+
[hotspot] | normalized |          0.00 |          0.00 |
[hotspot] +------------+---------------+---------------+
Local HotSpot Analysis: normalized max congestion hotspot area = 0.00, normalized total congestion hotspot area = 0.00 (area is in unit of 4 std-cell row bins)
[hotspot] Hotspot report including placement blocked areas
[hotspot] +------------+---------------+---------------+
[hotspot] |            |   max hotspot | total hotspot |
[hotspot] +------------+---------------+---------------+
[hotspot] | normalized |          0.52 |          0.79 |
[hotspot] +------------+---------------+---------------+
Local HotSpot Analysis (blockage included): normalized max congestion hotspot area = 0.52, normalized total congestion hotspot area = 0.79 (area is in unit of 4 std-cell row bins)
[hotspot] top 2 congestion hotspot bounding boxes and scores of normalized hotspot
[hotspot] +-----+-------------------------------------+---------------+-------------------------------+
[hotspot] | top |            hotspot bbox             | hotspot score |           module              |
[hotspot] +-----+-------------------------------------+---------------+-------------------------------+
[hotspot] |  1  |   374.53   387.90   401.28   414.66 |        0.52   | I_CONTEXT_MEM                 |
[hotspot] +-----+-------------------------------------+---------------+-------------------------------+
[hotspot] |  2  |   401.28   387.90   428.03   414.66 |        0.26   | I_CONTEXT_MEM                 |
[hotspot] +-----+-------------------------------------+---------------+-------------------------------+
Reported timing to dir ./timingReports
**optDesign ... cpu = 0:03:58, real = 0:01:23, mem = 3831.9M, totSessionCpu=1:00:19 **
**WARN: (IMPOPT-3668):	There are 48 nets with MSV violations, timing and DRV optimization of such nets is limited.  Please use verifyPowerDomain to analyze these further.

Starting delay calculation for Hold views
AAE_INFO: opIsDesignInPostRouteState() is 0
#################################################################################
# Design Stage: PreRoute
# Design Name: ORCA_TOP
# Design Mode: 28nm
# Analysis Mode: MMMC OCV 
# Parasitics Mode: No SPEF/RCDB 
# Signoff Settings: SI Off 
#################################################################################
Start delay calculation (fullDC) (8 T). (MEM=4008.15)
*** Calculating scaling factor for best_libs libraries using the default operating condition of each library.
Total number of fetched objects 50206
AAE_INFO: Total number of nets for which stage creation was skipped for all views 0
End delay calculation. (MEM=4053.12 CPU=0:00:24.8 REAL=0:00:04.0)
End delay calculation (fullDC). (MEM=4053.12 CPU=0:00:32.0 REAL=0:00:05.0)
*** Done Building Timing Graph (cpu=0:00:40.7 real=0:00:07.0 totSessionCpu=1:01:08 mem=5999.0M)
Starting delay calculation for Setup views
AAE_INFO: opIsDesignInPostRouteState() is 0
#################################################################################
# Design Stage: PreRoute
# Design Name: ORCA_TOP
# Design Mode: 28nm
# Analysis Mode: MMMC OCV 
# Parasitics Mode: No SPEF/RCDB 
# Signoff Settings: SI Off 
#################################################################################
Start delay calculation (fullDC) (8 T). (MEM=4062.05)
*** Calculating scaling factor for worst_libs libraries using the default operating condition of each library.
Total number of fetched objects 50206
AAE_INFO: Total number of nets for which stage creation was skipped for all views 0
End delay calculation. (MEM=4101.84 CPU=0:00:25.0 REAL=0:00:03.0)
End delay calculation (fullDC). (MEM=4101.84 CPU=0:00:31.8 REAL=0:00:05.0)
*** Done Building Timing Graph (cpu=0:00:39.9 real=0:00:06.0 totSessionCpu=1:01:59 mem=6008.4M)

------------------------------------------------------------------
     optDesign Final Summary
------------------------------------------------------------------

Setup views included:
 test_worst_scenario func_worst_scenario 
Hold views included:
 func_best_scenario test_best_scenario

+--------------------+---------+---------+---------+---------+---------+---------+---------+
|     Setup mode     |   all   | reg2reg |reg2cgate| in2reg  | reg2out | in2out  | default |
+--------------------+---------+---------+---------+---------+---------+---------+---------+
|           WNS (ns):| -0.266  |  0.016  | -0.266  |  0.135  |  0.040  |  0.289  |  0.916  |
|           TNS (ns):| -0.266  |  0.000  | -0.266  |  0.000  |  0.000  |  0.000  |  0.000  |
|    Violating Paths:|    1    |    0    |    1    |    0    |    0    |    0    |    0    |
|          All Paths:|  10179  |  9907   |   26    |   129   |   115   |   32    |   12    |
+--------------------+---------+---------+---------+---------+---------+---------+---------+

+--------------------+---------+---------+---------+---------+---------+---------+---------+
|     Hold mode      |   all   | reg2reg |reg2cgate| in2reg  | reg2out | in2out  | default |
+--------------------+---------+---------+---------+---------+---------+---------+---------+
|           WNS (ns):| -0.087  |  0.001  |  0.126  | -0.012  |  0.002  |  0.068  | -0.087  |
|           TNS (ns):| -0.276  |  0.000  |  0.000  | -0.021  |  0.000  |  0.000  | -0.255  |
|    Violating Paths:|    6    |    0    |    0    |    3    |    0    |    0    |    3    |
|          All Paths:|  10193  |  9930   |   26    |   125   |   110   |   32    |   12    |
+--------------------+---------+---------+---------+---------+---------+---------+---------+

+----------------+-------------------------------+------------------+
|                |              Real             |       Total      |
|    DRVs        +------------------+------------+------------------|
|                |  Nr nets(terms)  | Worst Vio  |  Nr nets(terms)  |
+----------------+------------------+------------+------------------+
|   max_cap      |      0 (0)       |   0.000    |      4 (4)       |
|   max_tran     |      0 (0)       |   0.000    |      0 (0)       |
|   max_fanout   |      0 (0)       |     0      |      0 (0)       |
|   max_length   |      0 (0)       |     0      |      0 (0)       |
+----------------+------------------+------------+------------------+

Density: 43.011%
Routing Overflow: 0.44% H and 0.00% V
------------------------------------------------------------------
Begin: Collecting metrics
 ---------------------------------------------------------------------------------------------------------------------------- 
| Snapshot        | WNS                | TNS | Density (%) | Hotspot                   | Resource               | DRVs       |
|                 | HEPG (ns) | ALL (ns)     |             | Max (bins) | Total (bins) | Real (s) | Memory (MB) | Tran | Cap |
|-----------------+-----------+--------+-----+-------------+------------+--------------+----------+-------------+------+-----|
| initial_summary |    -0.266 | -0.266 |  -0 |       42.84 |            |              | 0:00:45  |        5462 |    0 |   0 |
| hold_fixing     |           | -0.266 |  -0 |       43.12 |            |              | 0:00:18  |        5624 |      |     |
| global_route    |           |        |     |             |            |              | 0:00:01  |        5624 |      |     |
| final_summary   |    -0.266 | -0.266 |  -0 |       43.01 |       0.52 |         0.79 | 0:00:32  |        5583 |    0 |   0 |
 ---------------------------------------------------------------------------------------------------------------------------- 
End: Collecting metrics
**optDesign ... cpu = 0:05:50, real = 0:01:52, mem = 4040.9M, totSessionCpu=1:02:11 **
*** Finished optDesign ***
      flow.cputime  flow.realtime  timing.setup.tns  timing.setup.wns  snapshot
UM:*                                                                   final
      flow.cputime  flow.realtime  timing.setup.tns  timing.setup.wns  snapshot
UM:*                                                                   opt_design_postcts_hold
Info: Summary of CRR changes:
      - Timing transform commits:       0
Info: Destroy the CCOpt slew target map.

*** Summary of all messages that are not suppressed in this session:
Severity  ID               Count  Summary                                  
WARNING   IMPMSMV-1810      2496  Net %s, driver %s (cell %s) voltage %g d...
WARNING   IMPOPT-3668          2  There are %d nets with MSV violations, t...
WARNING   IMPOPT-3564          1  The following cells are set dont_use tem...
*** Message Summary: 2499 warning(s), 0 error(s)

Removing temporary dont_use automatically set for cells with technology sites with no row.
*** optDesign #1 [finish] () : cpu/real = 0:05:50.7/0:01:52.9 (3.1), totSession cpu/real = 1:02:12.3/0:26:56.9 (2.3), mem = 5389.2M
Updating ideal nets and annotations...
Clock tree spec update: Ideal nets, transition and delay annotations were updated to match active timing constraints.
Updating ideal nets and annotations done. (took cpu=0:00:00.0 real=0:00:00.0)
No differences between SDC and CTS ideal net status found.
Clock tree timing engine global stage delay update for worst_corner:setup.early...
Clock tree timing engine global stage delay update for worst_corner:setup.early done. (took cpu=0:00:00.9 real=0:00:00.2)
Clock tree timing engine global stage delay update for worst_corner:setup.late...
Clock tree timing engine global stage delay update for worst_corner:setup.late done. (took cpu=0:00:00.2 real=0:00:00.0)
Clock tree timing engine global stage delay update for best_corner:hold.early...
Clock tree timing engine global stage delay update for best_corner:hold.early done. (took cpu=0:00:00.2 real=0:00:00.0)
Clock tree timing engine global stage delay update for best_corner:hold.late...
Clock tree timing engine global stage delay update for best_corner:hold.late done. (took cpu=0:00:00.2 real=0:00:00.0)
Updating ideal nets and annotations...
Clock tree spec update: Ideal nets, transition and delay annotations were updated to match active timing constraints.
Updating ideal nets and annotations done. (took cpu=0:00:00.0 real=0:00:00.0)
No differences between SDC and CTS ideal net status found.
Clock tree timing engine global stage delay update for worst_corner:setup.early...
Clock tree timing engine global stage delay update for worst_corner:setup.early done. (took cpu=0:00:00.7 real=0:00:00.1)
Clock tree timing engine global stage delay update for worst_corner:setup.late...
Clock tree timing engine global stage delay update for worst_corner:setup.late done. (took cpu=0:00:00.2 real=0:00:00.0)
Clock tree timing engine global stage delay update for best_corner:hold.early...
Clock tree timing engine global stage delay update for best_corner:hold.early done. (took cpu=0:00:00.2 real=0:00:00.0)
Clock tree timing engine global stage delay update for best_corner:hold.late...
Clock tree timing engine global stage delay update for best_corner:hold.late done. (took cpu=0:00:00.2 real=0:00:00.0)
**WARN: (IMPOPT-3668):	There are 48 nets with MSV violations, timing and DRV optimization of such nets is limited.  Please use verifyPowerDomain to analyze these further.
*** timeDesign #2 [begin] () : totSession cpu/real = 1:02:16.6/0:26:58.9 (2.3), mem = 5967.5M
Start to check current routing status for nets...
All nets are already routed correctly.
End to check current routing status for nets (mem=5531.5M)
**WARN: (IMPOPT-3668):	There are 48 nets with MSV violations, timing and DRV optimization of such nets is limited.  Please use verifyPowerDomain to analyze these further.


------------------------------------------------------------------
          timeDesign Summary
------------------------------------------------------------------

Setup views included:
 test_worst_scenario func_worst_scenario 

+--------------------+---------+---------+---------+---------+---------+---------+---------+
|     Setup mode     |   all   | reg2reg |reg2cgate| in2reg  | reg2out | in2out  | default |
+--------------------+---------+---------+---------+---------+---------+---------+---------+
|           WNS (ns):| -0.266  |  0.016  | -0.266  |  0.135  |  0.040  |  0.289  |  0.916  |
|           TNS (ns):| -0.266  |  0.000  | -0.266  |  0.000  |  0.000  |  0.000  |  0.000  |
|    Violating Paths:|    1    |    0    |    1    |    0    |    0    |    0    |    0    |
|          All Paths:|  10179  |  9907   |   26    |   129   |   115   |   32    |   12    |
+--------------------+---------+---------+---------+---------+---------+---------+---------+
|test_worst_scenario | -0.266  |  0.673  | -0.266  |  0.290  |  0.040  |  0.289  | 13.980  |
|                    | -0.266  |  0.000  | -0.266  |  0.000  |  0.000  |  0.000  |  0.000  |
|                    |    1    |    0    |    1    |    0    |    0    |    0    |    0    |
|                    |  3818   |  3642   |   10    |   55    |   115   |   32    |    6    |
+--------------------+---------+---------+---------+---------+---------+---------+---------+
|func_worst_scenario |  0.016  |  0.016  |  0.611  |  0.135  |  0.040  |  0.697  |  0.916  |
|                    |  0.000  |  0.000  |  0.000  |  0.000  |  0.000  |  0.000  |  0.000  |
|                    |    0    |    0    |    0    |    0    |    0    |    0    |    0    |
|                    |  6842   |  6600   |   16    |   110   |   110   |   32    |    6    |
+--------------------+---------+---------+---------+---------+---------+---------+---------+

+----------------+-------------------------------+------------------+
|                |              Real             |       Total      |
|    DRVs        +------------------+------------+------------------|
|                |  Nr nets(terms)  | Worst Vio  |  Nr nets(terms)  |
+----------------+------------------+------------+------------------+
|   max_cap      |      0 (0)       |   0.000    |      4 (4)       |
|   max_tran     |      0 (0)       |   0.000    |      0 (0)       |
|   max_fanout   |      0 (0)       |     0      |      0 (0)       |
|   max_length   |      0 (0)       |     0      |      0 (0)       |
+----------------+------------------+------------+------------------+

Density: 43.011%
Routing Overflow: 0.44% H and 0.00% V
------------------------------------------------------------------
Reported timing to dir ../reports/ORCA_TOP.innovus
Total CPU time: 29.43 sec
Total Real time: 12.0 sec
Total Memory Usage: 5513.292969 Mbytes
*** timeDesign #2 [finish] () : cpu/real = 0:00:29.2/0:00:12.1 (2.4), totSession cpu/real = 1:02:45.8/0:27:10.9 (2.3), mem = 5513.3M
**WARN: (IMPOPT-3668):	There are 48 nets with MSV violations, timing and DRV optimization of such nets is limited.  Please use verifyPowerDomain to analyze these further.
*** timeDesign #3 [begin] () : totSession cpu/real = 1:02:46.1/0:27:11.2 (2.3), mem = 5513.3M
Start to check current routing status for nets...
All nets are already routed correctly.
End to check current routing status for nets (mem=5188.3M)
**WARN: (IMPOPT-3668):	There are 48 nets with MSV violations, timing and DRV optimization of such nets is limited.  Please use verifyPowerDomain to analyze these further.

OPTC: user 20.0
Starting delay calculation for Hold views
AAE_INFO: opIsDesignInPostRouteState() is 0
#################################################################################
# Design Stage: PreRoute
# Design Name: ORCA_TOP
# Design Mode: 28nm
# Analysis Mode: MMMC OCV 
# Parasitics Mode: No SPEF/RCDB 
# Signoff Settings: SI Off 
#################################################################################
Start delay calculation (fullDC) (8 T). (MEM=3893.83)
*** Calculating scaling factor for best_libs libraries using the default operating condition of each library.
Total number of fetched objects 50206
AAE_INFO: Total number of nets for which stage creation was skipped for all views 0
End delay calculation. (MEM=3948.36 CPU=0:00:24.9 REAL=0:00:03.0)
End delay calculation (fullDC). (MEM=3948.36 CPU=0:00:32.1 REAL=0:00:05.0)
*** Done Building Timing Graph (cpu=0:00:45.4 real=0:00:08.0 totSessionCpu=1:03:33 mem=5922.2M)

------------------------------------------------------------------
          timeDesign Summary
------------------------------------------------------------------

Hold views included:
 test_best_scenario func_best_scenario 

+--------------------+---------+---------+---------+---------+---------+---------+---------+
|     Hold mode      |   all   | reg2reg |reg2cgate| in2reg  | reg2out | in2out  | default |
+--------------------+---------+---------+---------+---------+---------+---------+---------+
|           WNS (ns):| -0.087  |  0.001  |  0.126  | -0.012  |  0.002  |  0.068  | -0.087  |
|           TNS (ns):| -0.276  |  0.000  |  0.000  | -0.021  |  0.000  |  0.000  | -0.255  |
|    Violating Paths:|    6    |    0    |    0    |    3    |    0    |    0    |    3    |
|          All Paths:|  10193  |  9930   |   26    |   125   |   110   |   32    |   12    |
+--------------------+---------+---------+---------+---------+---------+---------+---------+
|test_best_scenario  |  0.002  |  0.004  |  1.448  |  0.008  |  0.002  |  0.068  |  0.008  |
|                    |  0.000  |  0.000  |  0.000  |  0.000  |  0.000  |  0.000  |  0.000  |
|                    |    0    |    0    |    0    |    0    |    0    |    0    |    0    |
|                    |  3801   |  3642   |   10    |   43    |   110   |   32    |    6    |
+--------------------+---------+---------+---------+---------+---------+---------+---------+
|func_best_scenario  | -0.087  |  0.001  |  0.126  | -0.012  |  0.002  |  0.068  | -0.087  |
|                    | -0.276  |  0.000  |  0.000  | -0.021  |  0.000  |  0.000  | -0.255  |
|                    |    6    |    0    |    0    |    3    |    0    |    0    |    3    |
|                    |  6865   |  6623   |   16    |   110   |   110   |   32    |    6    |
+--------------------+---------+---------+---------+---------+---------+---------+---------+

Density: 43.011%
Routing Overflow: 0.44% H and 0.00% V
------------------------------------------------------------------
Reported timing to dir ../reports/ORCA_TOP.innovus
Total CPU time: 58.28 sec
Total Real time: 14.0 sec
Total Memory Usage: 5169.03125 Mbytes
*** timeDesign #3 [finish] () : cpu/real = 0:00:58.1/0:00:13.8 (4.2), totSession cpu/real = 1:03:44.2/0:27:24.9 (2.3), mem = 5169.0M

powerDomain PD_ORCA_TOP : bins with density > 0.750 = 38.42 % ( 816 / 2124 )
bin size: 110 sites by 10 row(s). total 2124 bins ( 59 by 36 )
  density range     #bins    %
  (0.750 - 0.800]     248  11.68
  (0.800 - 0.850]      42   1.98
  (0.850 - 0.900]      38   1.79
  (0.900 - 0.950]      32   1.51
  (0.950 - 1.000]     456  21.47
  total               816  38.42

powerDomain PD_RISC_CORE : bins with density > 0.750 = 54.91 % ( 151 / 275 )
bin size: 110 sites by 10 row(s). total 275 bins ( 25 by 11 )
  density range     #bins    %
  (0.750 - 0.800]       6   2.18
  (0.800 - 0.850]       1   0.36
  (0.850 - 0.900]       8   2.91
  (0.950 - 1.000]     136  49.45
  total               151  54.91

Density distribution unevenness ratio = 19.789%
Start to collect the design information.
Build netlist information for Cell ORCA_TOP.
Finished collecting the design information.
Generating macro cells used in the design report.
Generating standard cells used in the design report.
Analyze library ... 
Analyze netlist ... 
Generate no-driven nets information report.
Analyze timing ... 
Analyze floorplan/placement ... 
Analysis Routing ...
Report saved in file ../reports/ORCA_TOP.innovus.postcts.summary.rpt
#% Begin save design ... (date=06/12 02:13:09, mem=3745.0M)
INFO: Current data have to be saved into a temporary db: 'ORCA_TOP_postcts.innovus.dat.tmp' first. It will be renamed to the correct name 'ORCA_TOP_postcts.innovus.dat' after the old db was deleted.
% Begin Save ccopt configuration ... (date=06/12 02:13:09, mem=3745.0M)
% End Save ccopt configuration ... (date=06/12 02:13:09, total cpu=0:00:00.3, real=0:00:00.0, peak res=3745.3M, current mem=3745.3M)
% Begin Save netlist data ... (date=06/12 02:13:09, mem=3745.3M)
Writing Binary DB to ORCA_TOP_postcts.innovus.dat.tmp/vbin/ORCA_TOP.v.bin in multi-threaded mode...
% End Save netlist data ... (date=06/12 02:13:10, total cpu=0:00:00.3, real=0:00:01.0, peak res=3745.3M, current mem=3745.3M)
Saving symbol-table file in separate thread ...
Saving congestion map file in separate thread ...
Saving congestion map file ORCA_TOP_postcts.innovus.dat.tmp/ORCA_TOP.route.congmap.gz ...
% Begin Save AAE data ... (date=06/12 02:13:10, mem=3746.3M)
Saving AAE Data ...
% End Save AAE data ... (date=06/12 02:13:10, total cpu=0:00:00.2, real=0:00:00.0, peak res=3746.3M, current mem=3745.5M)
Saving preference file ORCA_TOP_postcts.innovus.dat.tmp/gui.pref.tcl ...
Saving mode setting ...
Saving global file ...
*info - save blackBox cells to lef file ORCA_TOP_postcts.innovus.dat.tmp/ORCA_TOP.bbox.lef
Saving Drc markers ...
... No Drc file written since there is no markers found.
Saving SCANDEF file ...
**WARN: (IMPSC-1020):	Instance's output pin "snps_clk_chain_1/U2/Y" (Cell "AO22X1_RVT") has multiple corresponding input pins for scan tracing. Please specify the instance in scan DEF.  You can also apply "setScanReorderMode -compLogic true" to trace through the chain but it could be not exactly the chain that user needed.
**WARN: (IMPSC-1001):	Unable to trace scan chain "5". Check the information during tracing.
Type 'man IMPSC-1001' for more detail.
**WARN: (IMPSC-1020):	Instance's output pin "I_CLOCKING/snps_clk_chain_0/U2/Y" (Cell "AO22X1_RVT") has multiple corresponding input pins for scan tracing. Please specify the instance in scan DEF.  You can also apply "setScanReorderMode -compLogic true" to trace through the chain but it could be not exactly the chain that user needed.
**WARN: (IMPSC-1001):	Unable to trace scan chain "6". Check the information during tracing.
Type 'man IMPSC-1001' for more detail.
*** Scan Trace Summary (runtime: cpu: 0:00:00.1 , real: 0:00:00.0): 
Successfully traced 3 scan chains (total 4530 scan bits).
Start applying DEF ordered sections ...
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_PCI_TOP/I_PCI_READ_FIFO_PCI_FIFO_CTL_U1_count_int_reg_5_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_0/R_573" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_0/s3_op2_reg_25_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_0/s3_op2_reg_27_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_0/R_81" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_0/R_96_IP" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_0/R_77_IP" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_0/R_79_IP" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_0/mega_shift_reg_0__13_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_0/mega_shift_reg_0__4_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/R_540" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/s1_op1_reg_10_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/mega_shift_reg_0__22_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/mega_shift_reg_0__21_" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/R_35_IP" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/R_673" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/R_43_IP" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/trans3_reg" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/R_676_IP" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (IMPSC-1138):	In scan chain "3" DEF ordered section, buffers or logics following scan instance "I_BLENDER_1/R_38_IP" are corrected to match the netlist.
Type 'man IMPSC-1138' for more detail.
**WARN: (EMS-27):	Message (IMPSC-1138) has exceeded the current message display limit of 20.
To increase the message display limit, refer to the product command reference manual.
**WARN: (IMPSC-1144):	Scan chain "5" was not traced through. Skip apply DEF ordered section.
**WARN: (IMPSC-1144):	Scan chain "6" was not traced through. Skip apply DEF ordered section.
**WARN: (IMPSC-1143):	Unable to apply DEF ordered sections for 2 scan chain(s). Check previous warning.
*** Scan Sanity Check Summary:
*** 3 scan chains passed sanity check.
Saving special route data file in separate thread ...
Saving PG file in separate thread ...
Saving placement file in separate thread ...
Saving route file in separate thread ...
Saving property file in separate thread ...
Saving PG file ORCA_TOP_postcts.innovus.dat.tmp/ORCA_TOP.pg.gz, version#2, (Created by Innovus v23.10-p003_1 on Wed Jun 12 02:13:15 2024)
Saving property file ORCA_TOP_postcts.innovus.dat.tmp/ORCA_TOP.prop
** Saving stdCellPlacement_binary (version# 2) ...
Save Adaptive View Pruning View Names to Binary file
func_worst_scenario
*** Completed saveProperty (cpu=0:00:00.6 real=0:00:00.0 mem=5471.6M) ***
TAT_INFO: ::saveSpecialRoute REAL = 0 : CPU = 0 : MEM = 0.
*** Completed savePGFile (cpu=0:00:00.6 real=0:00:00.0 mem=5463.6M) ***
TAT_INFO: ::savePGFile REAL = 0 : CPU = 0 : MEM = 0.
TAT_INFO: ::savePlace REAL = 0 : CPU = 0 : MEM = 0.
*** Completed saveRoute (cpu=0:00:01.3 real=0:00:01.0 mem=5447.6M) ***
TAT_INFO: ::saveRoute REAL = 1 : CPU = 0 : MEM = 0.
TAT_INFO: ::db::saveAnnotationAndProp REAL = 0 : CPU = 0 : MEM = 0.
#Saving pin access data to file ORCA_TOP_postcts.innovus.dat.tmp/ORCA_TOP.apa ...
#
Saving rc congestion map ORCA_TOP_postcts.innovus.dat.tmp/ORCA_TOP.congmap.gz ...
Saving power intent database ...
TAT_INFO: ::db::saveSymbolTable REAL = 0 : CPU = 0 : MEM = 0.
TAT_INFO: ::saveCongMap REAL = 0 : CPU = 0 : MEM = 0.
% Begin Save power constraints data ... (date=06/12 02:13:19, mem=3768.8M)
% End Save power constraints data ... (date=06/12 02:13:19, total cpu=0:00:00.1, real=0:00:00.0, peak res=3768.8M, current mem=3768.8M)
Generated self-contained design ORCA_TOP_postcts.innovus.dat.tmp
#% End save design ... (date=06/12 02:13:25, total cpu=0:00:10.7, real=0:00:16.0, peak res=3800.6M, current mem=3769.8M)

*** Summary of all messages that are not suppressed in this session:
Severity  ID               Count  Summary                                  
WARNING   IMPSC-1001           2  Unable to trace scan chain "%s". Check t...
WARNING   IMPSC-1138         134  In scan chain "%s" DEF ordered section, ...
WARNING   IMPSC-1143           1  Unable to apply DEF ordered sections for...
WARNING   IMPSC-1144           2  Scan chain "%s" was not traced through. ...
WARNING   IMPSC-1020           2  Instance's output pin "%s/%s" (Cell "%s"...
*** Message Summary: 141 warning(s), 0 error(s)

######## FINISHING CLOCK_OPT #################
