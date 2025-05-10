######
## WARNING!!!
## you must start innovus from the INNOVUS area and not the GENUS area
## /pkgs/cadence/2019-03/INNOVUS171/bin/innovus
## not /pkgs/cadence/2019-03/GENUS171/bin/innovus
##
## You need this as well in your .profile to get your libraries loaded correctly
## LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/pkgs/cadence/2019-03/SSV171/tools.lnx86/lib/64bit/"
## You might see this error otherwise.
## **ERROR: (IMPCCOPT-3092):	Couldn't load external LP solver library. Error returned:

proc innovus_reporting { stage postcts postroute} {
global top_design
   if { !$postcts && !$postroute } {
     redirect -tee ../reports/$top_design.innovus.$stage.congestion.2d.rpt { reportCongestion -hotSpot -overflow -includeBlockage }
     redirect -tee ../reports/$top_design.innovus.$stage.congestion.3d.rpt { reportCongestion -hotSpot -overflow -includeBlockage -3d }
    timeDesign -preCTS -prefix $stage -outDir ../reports/${top_design}.innovus -expandedViews
   }
   if { $postcts } {
     report_ccopt_skew_groups -summary -file ../reports/$top_design.innovus.$stage.ccopt_skew_groups.rpt
     report_ccopt_clock_trees -summary -file ../reports/$top_design.innovus.$stage.ccopt_clock_trees.rpt
     if { ! $postroute } {
        timeDesign -postCTS -prefix $stage -outDir ../reports/${top_design}.innovus -expandedViews
        timeDesign -postCTS -hold -prefix $stage -outDir ../reports/${top_design}.innovus -expandedViews
     }
   }
   if { $postroute } {
     verify_drc -limit 100000 -report ../reports/$top_design.innovus.$stage.drc.all.rpt
     verify_drc -limit 100000 -check_only regular -report ../reports/$top_design.innovus.$stage.drc.regular.rpt
     verifyConnectivity -error 100000 -noAntenna -report ../reports/$top_design.innovus.$stage.connectivity.rpt 
     timeDesign -postRoute -prefix $stage -outDir ../reports/${top_design}.innovus -expandedViews
     timeDesign -postRoute -si -prefix ${stage}_si -outDir ../reports/${top_design}.innovus -expandedViews
     timeDesign -postRoute -hold -prefix $stage -outDir ../reports/${top_design}.innovus -expandedViews
     timeDesign -postRoute -hold -si -prefix ${stage}_si -outDir ../reports/${top_design}.innovus -expandedViews
     #report_power > ../reports/${top_design}.ROUTE_power_from_innovus_tcl.rpt
     #report_area > ../reports/${top_design}.ROUTE_area_from_innovus_tcl.rpt
     report_power > ../reports/${top_design}.innovus.${stage}.power.rpt
   }
   
   redirect -tee ../reports/${top_design}.innovus.$stage.density.rpt { reportDensityMap }
   summaryReport -noHtml -outfile ../reports/${top_design}.innovus.$stage.summary.rpt
}

source -echo -verbose ../../$top_design.design_config.tcl

set designs [get_db designs * ]
if { $designs != "" } {
  delete_gui_object $designs
}

if { ! [ info exists flow ] } { set flow "fpcr" }

####### STARTING INITIALIZE and FLOORPLAN #################
if { [regexp -nocase "f" $flow ] } {
    puts "######## STARTING INITIALIZE and FLOORPLAN #################"

    set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default

    source ../scripts/innovus-get-timlibslefs.tcl
    source ../../constraints/${top_design}.mmmc.sdc

    set init_design_netlisttype Verilog
    set init_verilog ../../syn/outputs/${top_design}.dct.vg
    set init_top_cell $top_design
    set init_pwr_net VDD
    set init_gnd_net VSS


    init_design

   if { [file exists ../scripts/${top_design}.pre.floorplan.tcl ] } { source -echo -verbose ../scripts/${top_design}.pre.floorplan.tcl }

    #defIn "../outputs/${top_design}.floorplan.innovus.def" 
    defIn ../outputs/ORCA_TOP.floorplan.innovus.macros_3B.def
    #defIn "../outputs/${top_design}.floorplan.innovus.macros.def" 
     #defIn "../outputs/${top_design}.floorplan.innovus.def"

    add_tracks -honor_pitch

   if { [file exists ../scripts/${top_design}.post.floorplan.tcl ] } { source -echo -verbose ../scripts/${top_design}.post.floorplan.tcl }


    if { $enable_dft == 1} {
    	echo READING SCANDEF
   	defIn /u/nmallebo/ECE530-2024-SPRING/finalprj-group4/syn/outputs/ORCA_TOP.dct.scan.def
   	#defIn "../outputs/${top_design}.floorplan.innovus.def"
    	#defIn ../../syn/outputs/${top_design}.genus_phys.scan.def
    	echo FINISHED READING SCANDEF

       # Source SDC file with DFT constraints. 
       #source ../../syn/outputs/${top_design}.genus.sdc
    }

    source /u/nmallebo/ECE530-2024-SPRING/finalprj-group4/ORCA_TOP.design_options.tcl
    #source ../../${top_design}.design_options.tcl
    # Add dcap boundary cells on the left and right side of design and macros
    #set_boundary_cell_rules -left_boundary_cell [get_lib_cell */DCAP_HVT]
    #set_boundary_cell_rules -right_boundary_cell [get_lib_cell */DCAP_HVT]
    # Tap Cells are usually needed, but they are not in this library. create_tap_cells
    #compile_boundary_cells

    #loadDefFile ../../apr/outputs/${top_design}.floorplan.def

    # Setting the interactive_constrint mode overwrites constraints applied 
    # for each scenario. 
    set_interactive_constraint_modes [all_constraint_modes -active]
    source ../../constraints/$top_design.sdc

    setDontUse DELLN true

    createBasicPathGroups -expanded

    saveDesign ${top_design}_floorplan.innovus

    #report_power > ../reports/${top_design}.FLRPLN_power_from_innovus_tcl.rpt
    #report_area > ../reports/${top_design}.FLRPLN_area_from_innovus_tcl.rpt

    puts "######## FINISHED INTIIALIZE and FLOORPLAN #################"
}
###############PG#################
add_tracks -honor_pitch

#loadFPlan
clearGlobalNets
globalNetConnect VDD -type pgpin -pin VDD -inst *
globalNetConnect VSS -type pgpin -pin VSS -inst *

checkDesign -powerGround -noHtml -outfile pg.rpt

#######
# Make sure you place the macros before starting the power mesh.  Or maybe remove the -onlyAIO option of the placeAIO -onlyAIO
######

# Power Grid here.  This is ICC2 version:
# M7/8 Mesh
#create_pg_mesh_pattern mesh_pat -layers {  {{vertical_layer: M8} {width: 4} {spacing: interleaving} {pitch: 16}}   \
#    {{horizontal_layer: M7} {width: 2}        {spacing: interleaving} {pitch: 8}}  }
#M2 Lower Mesh
# Orca does 0.350 width VSS two stripes, then 0.7u VDD stripe.  Repeating 16u. for now, do something simpler 
#create_pg_mesh_pattern lmesh_pat -layers {  {{vertical_layer: M2} {width: 0.7} {spacing: interleaving} {pitch: 16}}  } 
#M1 Std Cell grid
#create_pg_std_cell_conn_pattern rail_pat -layers {M1} -rail_width {0.06 0.06}
#   -via_rule {       {{layers: M6} {layers: M7} {via_master: default}}        {{layers: M8} {layers: M7} {via_master: VIA78_3x3}}}
#set_pg_strategy mesh_strat -core -extension {{stop:outermost_ring}} -pattern {{pattern:mesh_pat } { nets:{VDD VSS} } } 
#set_pg_strategy rail_strat -core -pattern {{pattern:rail_pat } { nets:{VDD VSS} } } 
#set_pg_strategy lmesh_strat -core -pattern {{pattern:lmesh_pat } { nets:{VDD VSS} } } 
#compile_pg -strategies {mesh_strat rail_strat lmesh_strat}

# Core power ring
addRing -type core_rings -nets {VDD VSS} -layer {top M8 bottom M8 left M7 right M7} -offset 1 -width 4 -spacing 1.0
# Add Meshes
#addStripe -nets {VDD VSS} -direction vertical   -layer M2 -width 0.060 -set_to_set_distance 20 -spacing 10
#addStripe -nets {VDD VSS} -direction horizontal   -layer M3 -width 0.060 -set_to_set_distance 20 -spacing 10
addStripe -nets {VDD VSS} -direction vertical   -layer M4 -width 0.060 -set_to_set_distance 20 -spacing 10
addStripe -nets {VDD VSS} -direction horizontal   -layer M5 -width 0.120 -set_to_set_distance 20 -spacing 10
addStripe -nets {VDD VSS} -direction vertical   -layer M6 -width 0.120 -set_to_set_distance 20 -spacing 10
addStripe -nets {VDD VSS} -direction horizontal   -layer M7 -width 2 -set_to_set_distance 40 -spacing 20
addStripe -nets {VDD VSS} -direction vertical   -layer M8 -width 4 -set_to_set_distance 80 -spacing 40

# Connect full grid and add M1 VDD/VSS rails. 
sroute -connect {corePin padPin} -crossoverViaLayerRange {1 4}

# Placing pins and spreading pins out. 
#editPin -edge 3 -pin [get_attribute [get_ports *] full_name] -layer 4 -spreadDirection clockwise -spreadType RANGE -offsetStart 100 -fixedPin 1 -fixOverlap 1 

if { [get_db sites unitdouble ] != "" } {
   createRow -area "0.0000 0.0000 [lindex $design_size 0 ] [ lindex $design_size 1 ]" -site unitdouble
}

#deleteInst [get_db [ get_db insts -if ".base_cell.name==*_?VT" ] .name ]
#source -echo -verbose ../../${top_design}.macro_placement_innovus.tcl
#defOut -noStdCells "../outputs/${top_design}.floorplan.innovus.def"


#defOut -noStdCells -noTracks -noSpecialNet -noTracks  "../outputs/${top_design}.floorplan.innovus.macros.def"

deselectAll
#select_obj [ get_ports * ]
#select_obj [ get_db insts -if ".is_black_box==true" ]
#select_obj [ get_db insts -if ".is_pad==true" ]
#defOut -selected "../outputs/${top_design}.floorplan.innovus.macros.def"



puts "Logfile message: writing def file completed ..."

######## PLACE #################
if { [regexp -nocase "p" $flow ] } {
    if { ![regexp -nocase "f" $flow ] } {
       restoreDesign ${top_design}_floorplan.innovus.dat ${top_design}
    }
    puts "######## STARTING PLACE #################"

if { [ regexp 23 [get_db program_version] ] } { set_db opt_enable_podv2_clock_opt_flow false }
set_db design_early_clock_flow false
setOptMode -usefulSkew true
setOptMode -usefulSkewCCOpt standard
setDesignMode -flowEffort standard
setOptMode -usefulSkewPostRoute false
setOptMode -usefulSkewPreCTS false
#createFence occ_int2 10.792 312.664 147.44 351.12
createInstGroup CLOCK_GROUP
#addInstToInstGroup CLOCK_GROUP [get_db insts I_CLOCKING/*]
deselectAll
selectInst I_CLOCKING*
selectInst occ*
addInstToInstGroup CLOCK_GROUP [dbget selected.name]
createRegion CLOCK_GROUP 10.792 312.664 147.44 351.12

   if { [file exists ../scripts/${top_design}.pre.place.tcl ] } { source -echo -verbose ../scripts/${top_design}.pre.place.tcl }
    place_opt_design
   if { [file exists ../scripts/${top_design}.post.place.tcl ] } { source -echo -verbose ../scripts/${top_design}.post.place.tcl }

    set stage place
    innovus_reporting $stage 0 0    
    
    saveDesign ${top_design}_place.innovus

    #report_power > ../reports/${top_design}.$stage.PLACE_power_from_innovus_tcl.rpt
    #report_area > ../reports/${top_design}.$stage.PLACE_area_from_innovus_tcl.rpt

    puts "######## FINISHED PLACE #################"
}

######## STARTING CLOCK_OPT #################

if { [regexp -nocase "c" $flow ] } {
    if { ![regexp -nocase "f" $flow ] && ![regexp -nocase "p" $flow ]  } {
       restoreDesign ${top_design}_place.innovus.dat ${top_design}
    } elseif { [regexp -nocase "f" $flow ] && ![regexp -nocase "p" $flow ] } {
       puts "FLOW ERROR: You are trying to run route and skipping some but not all earlier stages"
       return -level 1 
    }


setDesignMode -process 28
if { [ regexp 23 [get_db program_version] ] } { set_db opt_enable_podv2_clock_opt_flow false }
setOptMode -usefulSkew true
setOptMode -usefulSkewCCOpt none
setDesignMode -flowEffort extreme
setOptMode -usefulSkewPostRoute false
setOptMode -usefulSkewPreCTS false
set_ccopt_property update_io_latency false
# /pkgs/cadence/2020-11/INNOVUS191/doc/innovusUG/CCOpt_Properties.html
# https://support.cadence.com/apex/techpubDocViewerPage?path=innovusUG/innovusUG21.13/CCOpt_Properties.html
# /pkgs/cadence/2020-11/INNOVUS191/doc/innovusUG/Clock_Tree_Synthesis.html
set_ccopt_property target_skew 0.085 
set_ccopt_property use_inverters false
#set_dont_use {INVX32_LVT} true
set_dont_use {*/NBUFX32_LVT} true
#set_ccopt_property inverter_cells {INVX2_LVT INVX4_LVT INVX6_LVT INVX8_LVT INVX16_LVT}
set_ccopt_property buffer_cells {*/NBUF*LVT*}
#set ccopt_property clock_gating_cells { }
set_ccopt_property target_max_trans 0.243
set_ccopt_property target_insertion_delay 0.8
set_ccopt_property max_fanout 30
#set_ccopt_property target_max_capacitance 0.1
set_ccopt_property routing_top_min_fanout 10000
#add_ndr -name CTS_RULE -spacing {M1 0.1 M2:M8 0.112 }
add_ndr -name CTS_RULE -spacing  {M1 0.1 M2:M8 0.112 } -width_multiplier {M3:M8 2 } -generate_via
# Main power grid is currently on M7/M8
create_route_type -name top_type -non_default_rule CTS_RULE -top_preferred_layer M8 -bottom_preferred_layer M7
set_ccopt_property -net_type top route_type top_type
create_route_type -name trunk_type -non_default_rule CTS_RULE -top_preferred_layer M6 -bottom_preferred_layer M5
set_ccopt_property -net_type trunk route_type trunk_type
#create_route_type -name leaf_type -non_default_rule CTS_RULE -top_preferred_layer M7 -bottom_preferred_layer M6
#set_ccopt_property -net_type leaf route_type leaf_type

create_ccopt_clock_tree_spec -file ccopt.spec
source ccopt.spec

#creating H tree with all the switches
create_ccopt_flexible_htree -name flex_HTREE -trunk_cell INVX16_LVT -final_cell INVX8_LVT -no_symmetry_buffers -sink_instance_prefix HJ -pin {sdram_clk sys_clk sys_2x_clk ate_clk pclk} -sink_grid {4 4} -sink_grid_box {82 146 697 397} 

#Synthesizing H tree
synthesize_ccopt_flexible_htrees
set_ccopt_property extract_balance_multi_source_clocks true


set_ccopt_property top_buffer_cells {NBUFFX32_LVT}
set_ccopt_property buffer_cells {NBUFFX4_LVT NBUFFX8_LVT NBUFFX16_LVT}
set_ccopt_property leaf_buffer_cells {NBUFFX4_LVT NBUFFX8_LVT }

foreach i [get_ccopt_clock_tree_cells -node_types clock_gate] {
   set_db inst:$i .dont_touch false
}
#set_ccopt_property top_inverter_cells {CLKINVX36 CLKINVX28 CLKINVX24 CLKINVX20}
#set_ccopt_property inverter_cells {CLKINVX36 CLKINVX28 CLKINVX24 CLKINVX20}
#set_ccopt_property leaf_inverter_cells {CLKINVX28 CLKINVX24 CLKINVX16 CLKINVX12 CLKINVX8 CLKINVX4}

#set_ccopt_property clock_gating_cells {TLATNTSCAX20 TLATNTSCAX16 TLATNTSCAX12 TLATNTSCAX8 TLATNTSCAX6}
#set_ccopt_property clock_logic_cells {CKMUX4 CKMUX8 CKANDX4 CKANDX8 CKNANDX4 CKNANDX8 CKNORX4 CKNORX8 CKORX4 CKORX8 CKXORX4 CKXORX8 OAI221X8 OAI221X4 AOI22VYX1 OAI31X8}

#shielding
create_route_type -name topshieldRoute -top_preferred_layer M8 -bottom_preferred_layer M7 -shield_net VSS
set_ccopt_property -net_type top route_type topshieldRoute
create_route_type -name trunkshieldRoute -top_preferred_layer M6 -bottom_preferred_layer M5 -shield_net VSS
set_ccopt_property -net_type trunk route_type trunkshieldRoute

setNanoRouteMode -droutePostRouteSpreadWire false

   if { [file exists ../scripts/${top_design}.pre.cts.tcl ] } { source -echo -verbose ../scripts/${top_design}.pre.cts.tcl }

# If doing PODV2 flow use clock_opt_design, otherwise ccopt_design
if { [regexp "23" [get_db program_version] ] } { if { [get_db opt_enable_podv2_clock_opt_flow ] } { clock_opt_design } else { ccopt_design }
} else { ccopt_design }

if { [file exists ../scripts/${top_design}.post.cts.tcl ] } { source -echo -verbose ../scripts/${top_design}.post.cts.tcl }
route_ccopt_clock_tree_nets
    setAnalysisMode -analysisType onChipVariation
    setAnalysisMode -cppr both

# IO clock latencies are not adjusted as desired.
#update_io_latency
#May have to change earlier command to ccopt_design -cts
# Or reset to ideal mode first, then update_io_latency, then set_propagated_clock again.
# https://support.cadence.com/apex/ArticleAttachmentPortal?id=a1O0V000007MokSUAS&pageName=ArticleContent
# Or fix the problem with set_ccopt_propert update_io_latency true

   if { [file exists ../scripts/${top_design}.pre.opt.tcl ] } { source -echo -verbose ../scripts/${top_design}.pre.opt.tcl }
    optDesign -postCTS -hold
   if { [file exists ../scripts/${top_design}.post.opt.tcl ] } { source -echo -verbose ../scripts/${top_design}.post.opt.tcl }
    #opt_design -post_cts -hold

    set stage postcts
   
    innovus_reporting $stage 1 0    
    saveDesign ${top_design}_postcts.innovus

    #report_power > ../reports/${top_design}.$stage.CLOCK_power_from_innovus_tcl.rpt
    #report_area > ../reports/${top_design}.$stage.CLOCK_area_from_innovus_tcl.rpt

    puts "######## FINISHING CLOCK_OPT #################"

}

######## STARTING CLOCK_OPT #################
#if { [regexp -nocase "c" $flow ] } {
#    if { ![regexp -nocase "f" $flow ] && ![regexp -nocase "p" $flow ]  } {
#       restoreDesign ${top_design}_place.innovus.dat ${top_design}
#    } elseif { [regexp -nocase "f" $flow ] && ![regexp -nocase "p" $flow ] } {
#       puts "FLOW ERROR: You are trying to run route and skipping some but not all earlier stages"
#       return -level 1 
#    }
#
##set a {I_SDRAM_TOP/I_SDRAM_IF/R_29/CLK I_SDRAM_TOP/I_SDRAM_IF/R_25/CLK I_SDRAM_TOP/I_SDRAM_IF/R_24/CLK I_SDRAM_TOP/I_SDRAM_IF/R_22/CLK I_SDRAM_TOP/I_SDRAM_IF/R_21/CLK I_SDRAM_TOP/I_SDRAM_IF/R_20/CLK I_SDRAM_TOP/I_SDRAM_IF/R_19/CLK I_SDRAM_TOP/I_SDRAM_IF/R_17/CLK I_SDRAM_TOP/I_SDRAM_IF/R_16/CLK I_SDRAM_TOP/I_SDRAM_IF/R_15/CLK I_SDRAM_TOP/I_SDRAM_IF/R_14/CLK I_SDRAM_TOP/I_SDRAM_IF/R_12/CLK I_SDRAM_TOP/I_SDRAM_IF/R_10/CLK I_SDRAM_TOP/I_SDRAM_IF/R_9/CLK I_SDRAM_TOP/I_SDRAM_IF/R_8/CLK I_SDRAM_TOP/I_SDRAM_IF/sync_control_bus_reg_2_/CLK I_SDRAM_TOP/I_SDRAM_IF/sync_control_bus_reg_6_/CLK I_SDRAM_TOP/I_SDRAM_IF/sync_control_bus_reg_7_/CLK I_SDRAM_TOP/I_SDRAM_IF/sync_control_bus_reg_9_/CLK I_SDRAM_TOP/I_SDRAM_IF/sync_control_bus_reg_13_/CLK I_SDRAM_TOP/I_SDRAM_IF/R_26/CLK I_SDRAM_TOP/I_SDRAM_IF/sync_control_bus_reg_12_/CLK I_SDRAM_TOP/I_SDRAM_IF/sync_control_bus_reg_14_/CLK I_SDRAM_TOP/I_SDRAM_IF/DQ_in_0_reg_8_/CLK I_SDRAM_TOP/I_SDRAM_IF/R_18/CLK I_SDRAM_TOP/I_SDRAM_IF/R_28/CLK I_SDRAM_TOP/I_SDRAM_IF/R_13/CLK I_SDRAM_TOP/I_SDRAM_IF/sync_control_bus_reg_0_/CLK I_SDRAM_TOP/I_SDRAM_IF/sync_control_bus_reg_8_/CLK I_SDRAM_TOP/I_SDRAM_IF/R_27/CLK I_SDRAM_TOP/I_SDRAM_IF/sync_control_bus_reg_3_/CLK I_SDRAM_TOP/I_SDRAM_IF/sync_control_bus_reg_1_/CLK I_SDRAM_TOP/I_SDRAM_IF/R_23/CLK I_SDRAM_TOP/I_SDRAM_IF/control_bus_reg_1_/CLK I_SDRAM_TOP/I_SDRAM_IF/control_bus_reg_7_/CLK I_SDRAM_TOP/I_SDRAM_IF/control_bus_reg_2_/CLK I_SDRAM_TOP/I_SDRAM_IF/control_bus_reg_6_/CLK I_SDRAM_TOP/I_SDRAM_IF/out_control_reg_0_/CLK I_SDRAM_TOP/I_SDRAM_IF/out_control_reg_3_/CLK I_SDRAM_TOP/I_SDRAM_IF/sd_DQ_en_reg_0_/CLK I_SDRAM_TOP/I_SDRAM_IF/out_control_reg_1_/CLK I_SDRAM_TOP/I_SDRAM_IF/out_control_reg_2_/CLK I_SDRAM_TOP/I_SDRAM_IF/out_control_reg_4_/CLK I_SDRAM_TOP/I_SDRAM_IF/sync_control_bus_reg_11_/CLK I_SDRAM_TOP/I_SDRAM_IF/sync_control_bus_reg_10_/CLK I_SDRAM_TOP/I_SDRAM_IF/control_bus_reg_8_/CLK I_SDRAM_TOP/I_SDRAM_IF/control_bus_reg_12_/CLK I_SDRAM_TOP/I_SDRAM_IF/control_bus_reg_10_/CLK I_SDRAM_TOP/I_SDRAM_IF/control_bus_reg_11_/CLK I_SDRAM_TOP/I_SDRAM_IF/control_bus_reg_0_/CLK I_SDRAM_TOP/I_SDRAM_IF/control_bus_reg_3_/CLK I_SDRAM_TOP/I_SDRAM_IF/DQ_in_1_reg_8_/CLK I_SDRAM_TOP/I_SDRAM_IF/control_bus_reg_14_/CLK I_SDRAM_TOP/I_SDRAM_IF/control_bus_reg_9_/CLK I_SDRAM_TOP/I_SDRAM_IF/control_bus_reg_13_/CLK}
##create_ccopt_skew_group -name ate_L1 -sinks $a -from_clocks ate_clk -target_insertion_delay 0.2
##set b {snps_clk_chain_1/U_shftreg_0/ff_5/q_reg/CLK snps_clk_chain_1/U_shftreg_0/ff_4/q_reg/CLK snps_clk_chain_1/U_shftreg_0/ff_3/q_reg/CLK snps_clk_chain_1/U_shftreg_0/ff_2/q_reg/CLK snps_clk_chain_1/U_shftreg_0/ff_1/q_reg/CLK snps_clk_chain_1/U_shftreg_0/ff_0/q_reg/CLK}
##create_ccopt_skew_group -name ate_L2 -sinks $b -from_clocks ate_clk -target_insertion_delay 0.2
#setDesignMode -process 28
#if { [ regexp 23 [get_db program_version] ] } { set_db opt_enable_podv2_clock_opt_flow false }
#setOptMode -usefulSkew true
#setOptMode -usefulSkewCCOpt none
#setDesignMode -flowEffort extreme
#setOptMode -usefulSkewPostRoute false
#setOptMode -usefulSkewCTS false
#set_ccopt_property update_io_latency false
#
## /pkgs/cadence/2020-11/INNOVUS191/doc/innovusUG/CCOpt_Properties.html
## https://support.cadence.com/apex/techpubDocViewerPage?path=innovusUG/innovusUG21.13/CCOpt_Properties.html
## /pkgs/cadence/2020-11/INNOVUS191/doc/innovusUG/Clock_Tree_Synthesis.html
##set_ccopt_property target_skew 0.1 
#set_ccopt_property use_inverters true
#set_ccopt_property inverter_cells {INVX2_LVT INVX4_LVT INVX8_LVT INVX16_LVT}
##set_ccopt_property inverter_cells {}
##set_ccopt_property buffer_cells { }
##set ccopt_property clock_gating_cells { }
##set_ccopt_property target_max_trans 0.1
##set_ccopt_property insertion_delay 0.5
##set_ccopt_property max_fanout 50
#set_ccopt_property cts_override_minimum_skew_target true
#set_ccopt_property ccopt_auto_limit_insertion_delay true
#set_ccopt_property target_skew 0.06
##set_ccopt_property -skew_group * target_skew 0.06
#set_ccopt_property target_insertion_delay 0.5
#set_ccopt_property target_max_trans 0.3
##set_ccopt_property target_max_capacitance 0.1
#set_ccopt_property routing_top_min_fanout 10000
##add_ndr -name CTS_RULE -spacing {M1 0.1 M2:M8 0.112 }
##add_ndr -name CTS_RULE -spacing  {M1 0.1 M2:M8 0.112 } -width_multiplier {M3:M8 2 } -generate_via
#add_ndr -name CTS_RULE -spacing  {M1 0.1 M2:M8 0.112 } -width_multiplier {M3:M8 2 } -generate_via
## Main power grid is currently on M7/M8
#create_route_type -name top_type -non_default_rule CTS_RULE -top_preferred_layer M8 -bottom_preferred_layer M7
#set_ccopt_property -net_type top route_type top_type
#create_route_type -name trunk_type -non_default_rule CTS_RULE -top_preferred_layer M6 -bottom_preferred_layer M5
#set_ccopt_property -net_type trunk route_type trunk_type
#setAttribute -net CTS -shield_net VSS
#create_route_type -name leaf_type -non_default_rule CTS_RULE -top_preferred_layer M1 -bottom_preferred_layer M2
#set_ccopt_property -net_type leaf route_type leaf_type
#set_ccopt_property insertion_delay 0ps -pin occ_int2/U_clk_control_i_0/fast_clk_enable_l_reg/CLK
#setNanoRouteMode -droutePostRouteSpreadWire false
#if { [file exists ../scripts/${top_design}.pre.cts.tcl ] } { source -echo -verbose ../scripts/${top_design}.pre.cts.tcl }
#create_ccopt_clock_tree_spec -file ccopt.spec
#source ccopt.spec
#
##set trunk_cell IBUFFX16_LVT 
##set final_cell IBUFFX8_LVT 
##set sink_grid_c 4
##set sink_grid_r 4
##create_ccopt_clock_tree_source_group -name all_clocks_sg -clock_trees {PCI_CLK SYS_2x_CLK ate_clk SDRAM_CLK}
##set source_grp all_clocks_sg 
##assign_clock_tree_source_groups
##source bbox_sg.tcl
##bbox_clock_tree -source_grp $source_grp
##source $source_grp\_bbox.tcl
##
##set fj [open create_flex_h_tree.tcl w]
##
##foreach clk_t [get_ccopt_property source_group_clock_trees -clock_tree_source_group $source_grp ] {
##
##set source_pin [get_ccopt_property source_pin -clock_tree $clk_t]
##
##puts $fj "create_ccopt_flexible_htree -name my_flex_$clk_t -trunk_cell $trunk_cell -final_cell $final_cell -sink_grid { $sink_grid_c $sink_grid_r } -image_directory htree_debug_$clk_t -omit_symmetry false -pin $source_pin -sink_grid_box { $bbox($clk_t) } "
#create_ccopt_flexible_htree -name my_flex_htree -trunk_cell INVX16_LVT -final_cell INVX8_LVT -no_symmetry_buffers -sink_instance_prefix H3 -omit_symmetry false -pin {sdram_clk} -sink_grid {4 4}
##}
##close $fj
##set_ccopt_property top_buffer_cells {NBUFFX32_LVT}
##set_ccopt_property buffer_cells {NBUFFX2_LVT NBUFFX4_LVT NBUFFX8_LVT NBUFFX16_LVT}
##set_ccopt_property leaf_buffer_cells {NBUFFX2_LVT NBUFFX4_LVT NBUFFX8_LVT NBUFFX16_LVT}
#
##set_ccopt_property top_inverter_cells {IBUFFX32_LVT}
##set_ccopt_property inverter_cells {IBUFFX2_LVT IBUFFX4_LVT IBUFFX8_LVT IBUFFX16_LVT}
##set_ccopt_property leaf_inverter_cells {IBUFFX2_LVT IBUFFX4_LVT IBUFFX8_LVT IBUFFX16_LVT}
##set_ccopt_property clock_gating_cell {LSUPX4_LVT}
#
## If doing PODV2 flow use clock_opt_design, otherwise ccopt_design
##if { [regexp "23" [get_db program_version] ] } { if { [get_db opt_enable_podv2_clock_opt_flow ] } { clock_opt_design } else {
##source create_flex_h_tree.tcl
##synthesize_ccopt_flexible_htrees -spec_file flex_clock_tree.spec
#synthesize_ccopt_flexible_htrees
##source flex_clock_tree.spec
#set_ccopt_property extract_balance_multi_source_clocks true
#
##} else {create_ccopt_flexible_htree -name Htree -trunk_cell $trunk_cell  -final_cell $final_cell  -sink_grid {$sink_grid_c $sink_grid_r} -pin {occ_int2/fast_clk[1] I_CLOCKING/sys_clk_in_reg/Q occ_int2/fast_clk[2] occ_int2/fast_clk[0] I_CLOCKING/in occ_int2/slow_clk I_CLOCKING/ate_clk}}
#
##if { [file exists ../scripts/${top_design}.post.cts.tcl ] } { source -echo -verbose ../scripts/${top_design}.post.cts.tcl }
#
#    setAnalysisMode -analysisType onChipVariation
#    setAnalysisMode -cppr both
#
## IO clock latencies are not adjusted as desired.
##update_io_latency
##May have to change earlier command to ccopt_design -cts
## Or reset to ideal mode first, then update_io_latency, then set_propagated_clock again.
## https://support.cadence.com/apex/ArticleAttachmentPortal?id=a1O0V000007MokSUAS&pageName=ArticleContent
## Or fix the problem with set_ccopt_propert update_io_latency true
#
#   if { [file exists ../scripts/${top_design}.pre.opt.tcl ] } { source -echo -verbose ../scripts/${top_design}.pre.opt.tcl }
#    optDesign -postCTS -hold
#   if { [file exists ../scripts/${top_design}.post.opt.tcl ] } { source -echo -verbose ../scripts/${top_design}.post.opt.tcl }
#    #opt_design -post_cts -hold
#    #optDesign -postctS  -hold
#    set stage postcts
#   
#    innovus_reporting $stage 1 0    
#    saveDesign ${top_design}_postcts.innovus
#
#    #report_power > ../reports/${top_design}.$stage.CLOCK_power_from_innovus_tcl.rpt
#    #report_area > ../reports/${top_design}.$stage.CLOCK_area_from_innovus_tcl.rpt
#    report_power > ../reports/${top_design}.innvous.${stage}.power.rpt
#
#    puts "######## FINISHING CLOCK_OPT #################"
##}
#}

######## ROUTE_OPT #################
if { [regexp -nocase "r" $flow ] } {
    if { ![regexp -nocase "f" $flow ] && ![regexp -nocase "p" $flow ] && ![regexp -nocase "c" $flow ] } {
       restoreDesign ${top_design}_postcts.innovus.dat ${top_design}
    } elseif { ([regexp -nocase "f" $flow ] && ! [regexp -nocase "p" $flow ] ) ||
               ([regexp -nocase "f" $flow ] && ! [regexp -nocase "c" $flow ] ) ||
               ([regexp -nocase "p" $flow ] && ! [regexp -nocase "c" $flow ] )  } {
       puts "FLOW ERROR: You are trying to run route and skipping some but not all earlier stages"
       return -level 1 
    }
    puts "######## ROUTE_OPT #################"

setOptMode -usefulSkew false
setOptMode -usefulSkewCCOpt none
setOptMode -usefulSkewPostRoute false
setOptMode -usefulSkewPreCTS false

setNanoRouteMode -droutePostRouteSpreadWire false
#setNanoRouteMode -routeTopRoutingLayer 7
#setNanoRouteMode -routeBottomRoutingLayer 2

   if { [file exists ../scripts/${top_design}.pre.route.tcl ] } { source -echo -verbose ../scripts/${top_design}.pre.route.tcl }
    routeDesign
   if { [file exists ../scripts/${top_design}.post.route.tcl ] } { source -echo -verbose ../scripts/${top_design}.post.route.tcl }
    #route_design

# Should add tie hi/lo
#setTieHiLoMode -maxFanout 20 -maxDistance 50 -cell {TIEH_RVT TIEL_RVT}
#addTieHiLo

    optDesign -postRoute -setup -hold
    #opt_design -post_route -setup -hold

   globalNetConnect VDD -type pgpin -pin VDD -inst *
   globalNetConnect VSS -type pgpin -pin VSS -inst *
   # Should add other power nets if multivoltage

    saveDesign ${top_design}_route.innovus

    ######## FINAL REPORTS/OUTPUTS  #################
    puts "######## FINAL REPORTS/OUTPUTS  #################"

    # output reports
    set stage route
    innovus_reporting $stage 1  1   
    
    #report_power > ../reports/${top_design}.ROUTE_power_from_innovus_tcl.rpt
    #report_area > ../reports/${top_design}.ROUTE_area_from_innovus_tcl.rpt
    report_power > ../reports/${top_design}.innvous.${stage}.power.rpt

    # output netlist.  Look in the Saved Design Directory for the netlist
    #write_hdl $top_design > ../outputs/${top_design}.$stage.vg
    saveNetlist ../outputs/${top_design}.$stage.innovus.vg 
    # there is not a command to just write the spef with a specific name, so use the Innovus command, then copy the file.
    saveModel -spef -dir ${top_design}_route_spef
    foreach i [glob ../outputs/${top_design}innovus.spef.gz] { file delete $i  }
    foreach i [glob ${top_design}_route_spef/*.spef.gz] { 
       set newfile [regsub ${top_design}_ [file tail $i] ${top_design}.route.innovus. ]
       file copy $i  ../outputs/$newfile 
    }

    puts "######## FINISHED ROUTE_OPT + FINAL REPORTS/OUTPUTS #################"
}
