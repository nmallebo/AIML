#set tool [get_db root: .program_short_name]

if {[info exists synopsys_program_name]} {

	if { $synopsys_program_name == "dc_shell" } {
	
		set auto_insert_level_shifters_on_clocks all
    	}

      	if { ($synopsys_program_name == "icc2_shell") || ($synopsys_program_name == "fc_shell") } {

		####### FLOORPLANNING OPTIONS
		if { [sizeof_collection [get_placement_blockage io_pblockage ] ] ==0 } {
		  #create_placement_blockage -type hard_macro -boundary {{10.0 10.0} {1000 50}} -name io_pblockage
		  #create_placement_blockage -type hard_macro -boundary {{10.0 10.0} {800 30}} -name io_pblockage
		}

		set_individual_pin_constraints -sides 4 -ports [get_attribute [get_ports ] name ] -offset 500 -pin_spacing 1 -allowed_layers [ get_layers { M4 M5 M6 M7 } ]
		set_individual_pin_constraints -sides 4 -ports [get_attribute [get_ports ] name ]
		place_pins -self
		#set_individual_pin_constraints -sides 4 -ports [get_attribute [get_ports ] name ]
	    #load_upf ../../syn/outputs/ORCA_TOP.dc.upf.place_2020

		if { [ sizeof_collection [get_voltage_areas * ] ] < 2 && $FCL==0} {
			create_voltage_area -power_domains {PD_RISC_CORE} -power VDDH -ground VSS -cells [get_cells I_RISC_CORE/*] -region {{11 433} {417 649}} -name RISC_CORE_VA
		#	create_voltage_area  -region {{10.0 433.0480} {418.27 653.72}} -power_domains PD_RISC_CORE
		}

		
		if { [sizeof_collection [ get_placement_blockages pb* ] ] == 0 && $FCL==0 } {
		create_placement_blockage -name pb_PCI -type allow_buffer_only -blocked_percentage 0 -boundary {{12.5400 11.6720} {12.5400 459.1800} {136.7500 459.1800} {136.7500 136.5420} {275.9600 136.5420} {275.9600 11.6720}}
		create_placement_blockage -name pb_SDRAM -type allow_buffer_only -blocked_percentage 0 -boundary {{729.9360 216.8970} {1007.7480 216.8970} {1007.7480 12.0810} {729.9360 12.0810}}
		create_placement_blockage -name pb_CONTEXT -type allow_buffer_only -blocked_percentage 0 -boundary {{829.0800 216.8970} {829.0800 505.3040} {537.9270 505.3040} {537.9270 651.7880} {1008.1820 651.7880} {1008.1820 216.8970}}
		create_placement_blockage -name pb_RISC -type allow_buffer_only -blocked_percentage 0 -boundary {{11.6720 459.1800} {11.6720 650.0060} {303.6600 650.0060} {303.6600 459.1800}}
		
		}
		######PLACE

		set_app_option -name place.coarse.continue_on_missing_scandef -value true

		set_app_option -name place_opt.initial_place.effort -value medium
		set_app_option -name place_opt.final_place.effort -value medium


		#set enable_recovery_removal_arcs true
		set_app_option -name time.disable_recovery_removal_checks -value false
		#set timing_enable_multiple_clocks_per_reg true
		#set timing_remove_clock_reconvergence_pessimism true
		set_app_option -name timer.remove_clock_reconvergence_pessimism -value true

		#set physopt_enable_via_res_support true
		#set physopt_hard_keepout_distance 5
		#set_preferred_routing_direction -direction vertical -l {M2 M4}
		#set_preferred_routing_direction -direction horizontal -l {M3 M5}
		set_ignored_layers  -min_routing_layer M2 -max_routing_layer M7


		# To optimize DW components (I think only adders right now??) - default is false
		#set physopt_dw_opto true

		#set_ahfs_options -remove_effort high
		#set_buffer_opt_strategy -effort medium


		###########################  CTS Related
		create_routing_rule clock_double_spacing -spacings {M1 0.1 M2 0.112 M3 0.112 M4 0.112 M5 0.112 M6 0.112 M7 0.112 M8 0.112}
		#set_clock_routing_rules -clock [ get_clocks * ] -net_type leaf -rule clock_double_spacing -max_routing_layer M6 -min_routing_layer M3
		set_clock_routing_rules -clock [ get_clocks * ] -net_type internal -rule clock_double_spacing -max_routing_layer M6 -min_routing_layer M3
		set_clock_routing_rules -clock [ get_clocks * ] -net_type root -rule clock_double_spacing -max_routing_layer M6 -min_routing_layer M3

		set cts_clks [get_clocks {SDRAM_CLK SYS_2x_CLK SYS_CLK PCI_CLK} ]

		# don't allow X16 or X32.  Maybe just stop X32.  They are extremely high drive and could cause EM problems.
		set_lib_cell_purpose -include none [get_lib_cell {/*X32} ]

		# dont allow INV* for CTS since I think they are unbalanced rise/fall
		set_lib_cell_purpose -exclude cts [ get_lib_cell /INV ]

		# potentially try to disallow IBUF (inverter buffers) or NBUF (non-inverting buffers) to see if all inverters or all buffers makes a difference
		set_lib_cell_purpose -exclude cts [ get_lib_cell /IBUF ]
		#set_lib_cell_purpose -exclude cts [ get_lib_cell /NBUF ]

		# dont allow slower cells on clock trees.  
		set_lib_cell_purpose -exclude cts [ get_lib_cell { */*HVT */*RVT } ]

		set_max_transition 0.15 -clock_path $cts_clks 

		# Other potential options
		# set_max_capacitance cap_value -clock_path $cts_clks
		# set_app_option -name cts.common.max_net_length  -value float
		# set_app_option -name cts.common.max_fanout  -value <2-1000000>
		# set_clock_tree_options -target_skew value -clock $cts_clks 
		# set_clock_tree_options -target_latency value -clock $cts_clks

		#set_host_options -max_cores 1 -num_processes 1 mo.ece.pdx.edu
                set_app_options -name compile.flow.trial_clock_tree -value false
                set_app_options -name place_opt.flow.trial_clock_tree -value false
		set_app_options -name compile.flow.enable_ccd -value false
		set_app_options -name place_opt.flow.enable_ccd -value false
		set_app_options -name clock_opt.flow.enable_ccd -value false
		set_app_options -name route_opt.flow.enable_ccd -value false
		set_app_options -name ccd.max_postpone -value 0
		set_app_options -name ccd.max_prepone -value 0


		# If design blows up, try turning hold fixing off. 
		# set_app_option -name clock_opt.flow.skip_hold -value true

		# Dont use delay buffers
		#set_dont_use [get_lib_cells /DELLN ]
		set_lib_cell_purpose -include none [get_lib_cells /DELLN ]
		set_lib_cell_purpose -include hold [get_lib_cells /DELLN ]

		########################## Route related
		set_app_option -name route_opt.flow.xtalk_reduction -value true
		set_app_option -name time.si_enable_analysis -value true

   	}
} elseif {[get_db root: .program_short_name] == "innovus"} {

	#Read in upf dumped from genus	
	read_power_intent ../../syn/outputs/ORCA_TOP.dct.upf -1801
	commit_power_intent
	#Edit box when you reduce fp size
	#if [is_common_ui_mode ] { update_power_domain PD_RISC_CORE -box 10.032 10.032 360.032 208.032 
        #} else {modifyPowerDomainAttr PD_RISC_CORE -box 10.032 10.032 360.032 208.032}
        if [is_common_ui_mode ] { update_power_domain PD_RISC_CORE -box 10.032 10.032 420.032 185.032 
        } else { modifyPowerDomainAttr PD_RISC_CORE -box 10.032 10.032 420.032 185.032}

	set cts_clks [get_clocks {SDRAM_CLK SYS_2x_CLK SYS_CLK PCI_CLK} ]


        #set_max_transition 0.1 -clock_path $cts_clks
	if [is_common_ui_mode ] { set_db cts_target_max_transition_time 0.3ns
        } else { set_ccopt_property target_max_trans 0.3ns }

        # Try reducing the search and repair iterations for now.
    
        if [is_common_ui_mode ] { set_db route_design_detail_end_iteration 5 
        } else { setNanoRouteMode -drouteEndIteration 5 }
    
        if [is_common_ui_mode ] {
            if { [ regexp 23 [get_db program_version] ] } { set_db opt_enable_podv2_clock_opt_flow false }
            set_db design_early_clock_flow false
            #set_db route_design_with_via_in_pin true
            set_db route_design_with_via_only_for_block_cell_pin false
            set_db route_design_with_via_only_for_stdcell_pin 1:1
            set_db opt_useful_skew false
            set_db opt_useful_skew_ccopt none
            set_db opt_useful_skew_post_route false
            set_db opt_useful_skew_pre_cts false
        } else {
            if { [ regexp 23 [get_db program_version] ] } {  setOptMode -opt_enable_podv2_clock_opt_flow false }
            setDesignMode -earlyClockFlow false
            #setNanoRouteMode -routeWithViaInPin true
            #setNanoRouteMode -routeWithViaInPin 1:1
            setNanoRouteMode -routeWithViaOnlyForMacroCellPin false
            setNanoRouteMode -routeWithViaOnlyForStandardCellPin 1:1
        
            setOptMode -usefulSkew false
            setOptMode -usefulSkewCCOpt none
            setOptMode -usefulSkewPostRoute false
            setOptMode -usefulSkewPreCTS false
        }    
        #Cadence method.  Not floating with these statements
        if [is_common_ui_mode ] { set_db assign_pins_edit_in_batch true 
        } else { setPinAssignMode -pinEditInBatch true }
        set all_ports [ get_ports * ]
        set num_ports [ sizeof_collection $all_ports ]
        # Split the ports into two balanced collections
        set ports1 [ range_collection $all_ports 0 [expr $num_ports / 2 ] ]
        set ports2 [ range_collection $all_ports [expr ($num_ports / 2 ) + 1 ]  [ expr $num_ports - 1 ]  ]
        # put the two collections on to two layers of ports
#        if [is_common_ui_mode ] {
#          edit_pin -edge 0 -pin [get_db $ports1 .name ] -layer M6 -spread_direction counterclockwise -spread_type start -offset_start 250 -spacing 3 -unit micron -fixed_pin 1 
 #         edit_pin -edge 0 -pin [get_db $ports2 .name ] -layer M8 -spread_direction counterclockwise -spread_type start -offset_start 250 -spacing 3 -unit micron -fixed_pin 1 
 #         set_db assign_pins_edit_in_batch false
#        } else {
#          editPin -edge 0 -pin [get_attribute $ports1 full_name ] -layer M6 -spreadDirection counterclockwise -spreadType START -offsetStart 250 -spacing 3 -unit MICRON -fixedPin 1 
 #         editPin -edge 0 -pin [get_attribute $ports2 full_name ] -layer M8 -spreadDirection counterclockwise -spreadType START -offsetStart 250 -spacing 3 -unit MICRON -fixedPin 1 
#        }
 #       if [is_common_ui_mode ] { set_db assign_pins_edit_in_batch false
 #       } else { setPinAssignMode -pinEditInBatch false }
}

