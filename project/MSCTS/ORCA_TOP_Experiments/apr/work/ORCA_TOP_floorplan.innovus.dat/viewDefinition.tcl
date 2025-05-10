if {![namespace exists ::IMEX]} { namespace eval ::IMEX {} }
set ::IMEX::dataVar [file dirname [file normalize [info script]]]
set ::IMEX::libVar ${::IMEX::dataVar}/libs

create_library_set -name best_libs\
   -timing\
    [list ${::IMEX::libVar}/mmmc/saed32rvt_ff0p95vn40c.lib\
    ${::IMEX::libVar}/mmmc/saed32rvt_dlvl_ff0p95vn40c_i1p16v.lib\
    ${::IMEX::libVar}/mmmc/saed32rvt_ulvl_ff0p95vn40c_i0p95v.lib\
    ${::IMEX::libVar}/mmmc/saed32rvt_dlvl_ff0p95vn40c_i0p95v.lib\
    ${::IMEX::libVar}/mmmc/saed32rvt_ff1p16vn40c.lib\
    ${::IMEX::libVar}/mmmc/saed32rvt_ulvl_ff1p16vn40c_i1p16v.lib\
    ${::IMEX::libVar}/mmmc/saed32rvt_dlvl_ff1p16vn40c_i1p16v.lib\
    ${::IMEX::libVar}/mmmc/saed32rvt_ulvl_ff1p16vn40c_i0p95v.lib\
    ${::IMEX::libVar}/mmmc/saed32lvt_ff0p95vn40c.lib\
    ${::IMEX::libVar}/mmmc/saed32lvt_dlvl_ff0p95vn40c_i1p16v.lib\
    ${::IMEX::libVar}/mmmc/saed32lvt_ulvl_ff0p95vn40c_i0p95v.lib\
    ${::IMEX::libVar}/mmmc/saed32lvt_dlvl_ff0p95vn40c_i0p95v.lib\
    ${::IMEX::libVar}/mmmc/saed32lvt_ff1p16vn40c.lib\
    ${::IMEX::libVar}/mmmc/saed32lvt_ulvl_ff1p16vn40c_i1p16v.lib\
    ${::IMEX::libVar}/mmmc/saed32lvt_dlvl_ff1p16vn40c_i1p16v.lib\
    ${::IMEX::libVar}/mmmc/saed32lvt_ulvl_ff1p16vn40c_i0p95v.lib\
    ${::IMEX::libVar}/mmmc/saed32hvt_ff0p95vn40c.lib\
    ${::IMEX::libVar}/mmmc/saed32hvt_dlvl_ff0p95vn40c_i1p16v.lib\
    ${::IMEX::libVar}/mmmc/saed32hvt_ulvl_ff0p95vn40c_i0p95v.lib\
    ${::IMEX::libVar}/mmmc/saed32hvt_dlvl_ff0p95vn40c_i0p95v.lib\
    ${::IMEX::libVar}/mmmc/saed32hvt_ff1p16vn40c.lib\
    ${::IMEX::libVar}/mmmc/saed32hvt_ulvl_ff1p16vn40c_i1p16v.lib\
    ${::IMEX::libVar}/mmmc/saed32hvt_dlvl_ff1p16vn40c_i1p16v.lib\
    ${::IMEX::libVar}/mmmc/saed32hvt_ulvl_ff1p16vn40c_i0p95v.lib\
    ${::IMEX::libVar}/mmmc/saed32sram_ff1p16vn40c.lib]
create_library_set -name worst_libs\
   -timing\
    [list ${::IMEX::libVar}/mmmc/saed32rvt_ss0p75vn40c.lib\
    ${::IMEX::libVar}/mmmc/saed32rvt_dlvl_ss0p75vn40c_i0p95v.lib\
    ${::IMEX::libVar}/mmmc/saed32rvt_ulvl_ss0p75vn40c_i0p75v.lib\
    ${::IMEX::libVar}/mmmc/saed32rvt_dlvl_ss0p75vn40c_i0p75v.lib\
    ${::IMEX::libVar}/mmmc/saed32rvt_ss0p95vn40c.lib\
    ${::IMEX::libVar}/mmmc/saed32rvt_ulvl_ss0p95vn40c_i0p75v.lib\
    ${::IMEX::libVar}/mmmc/saed32lvt_ss0p75vn40c.lib\
    ${::IMEX::libVar}/mmmc/saed32lvt_dlvl_ss0p75vn40c_i0p95v.lib\
    ${::IMEX::libVar}/mmmc/saed32lvt_ulvl_ss0p75vn40c_i0p75v.lib\
    ${::IMEX::libVar}/mmmc/saed32lvt_dlvl_ss0p75vn40c_i0p75v.lib\
    ${::IMEX::libVar}/mmmc/saed32lvt_ss0p95vn40c.lib\
    ${::IMEX::libVar}/mmmc/saed32lvt_ulvl_ss0p95vn40c_i0p75v.lib\
    ${::IMEX::libVar}/mmmc/saed32hvt_ss0p75vn40c.lib\
    ${::IMEX::libVar}/mmmc/saed32hvt_dlvl_ss0p75vn40c_i0p95v.lib\
    ${::IMEX::libVar}/mmmc/saed32hvt_ulvl_ss0p75vn40c_i0p75v.lib\
    ${::IMEX::libVar}/mmmc/saed32hvt_dlvl_ss0p75vn40c_i0p75v.lib\
    ${::IMEX::libVar}/mmmc/saed32hvt_ss0p95vn40c.lib\
    ${::IMEX::libVar}/mmmc/saed32hvt_ulvl_ss0p95vn40c_i0p75v.lib\
    ${::IMEX::libVar}/mmmc/saed32sram_ss0p95vn40c.lib]
create_rc_corner -name cmin\
   -cap_table ${::IMEX::libVar}/mmmc/saed32nm_1p9m_Cmin.cap\
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap 1\
   -postRoute_xcap 1\
   -preRoute_clkres 0\
   -preRoute_clkcap 0\
   -T -40
create_rc_corner -name cmax\
   -cap_table ${::IMEX::libVar}/mmmc/saed32nm_1p9m_Cmax.cap\
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap 1\
   -postRoute_xcap 1\
   -preRoute_clkres 0\
   -preRoute_clkcap 0\
   -T -40
create_delay_corner -name worst_corner\
   -library_set worst_libs\
   -rc_corner cmax
create_delay_corner -name best_corner\
   -library_set best_libs\
   -rc_corner cmin
create_constraint_mode -name func_best_mode\
   -sdc_files\
    [list ${::IMEX::dataVar}/mmmc/modes/func_best_mode/func_best_mode.sdc]
create_constraint_mode -name test_best_mode\
   -sdc_files\
    [list ${::IMEX::dataVar}/mmmc/modes/test_best_mode/test_best_mode.sdc]
create_constraint_mode -name func_worst_mode\
   -sdc_files\
    [list ${::IMEX::dataVar}/mmmc/modes/func_worst_mode/func_worst_mode.sdc]
create_constraint_mode -name test_worst_mode\
   -sdc_files\
    [list ${::IMEX::dataVar}/mmmc/modes/test_worst_mode/test_worst_mode.sdc]
create_analysis_view -name func_worst_scenario -constraint_mode func_worst_mode -delay_corner worst_corner
create_analysis_view -name test_best_scenario -constraint_mode test_best_mode -delay_corner best_corner
create_analysis_view -name func_best_scenario -constraint_mode func_best_mode -delay_corner best_corner
create_analysis_view -name test_worst_scenario -constraint_mode test_worst_mode -delay_corner worst_corner
set_analysis_view -setup [list test_worst_scenario func_worst_scenario] -hold [list test_best_scenario func_best_scenario]
catch {set_interactive_constraint_mode [list func_best_mode test_best_mode func_worst_mode test_worst_mode] } 
