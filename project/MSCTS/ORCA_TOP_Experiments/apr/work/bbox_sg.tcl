proc bbox_clock_tree {args} {
    parse_proc_arguments -args $args opt
set source_grp $opt(-source_grp)
foreach i $source_grp {
set trees [get_ccopt_property source_group_clock_trees -clock_tree_source_group $i ]
set fh [open $source_grp\_bbox.tcl w]
foreach tree $trees {
set sg1_llx 0
set sg1_lly 0
set sg1_urx 0
set sg1_ury 0
foreach_in_collection  c  [get_cells -of_objects  [get_ccopt_clock_tree_sinks -in_clock_trees $tree ] ]  { 
set flop [get_object_name $c ]
append sg1_llx [dbget [dbget top.insts.name $flop -p ].box_llx ] " "
append sg1_lly [dbget [dbget top.insts.name $flop -p ].box_lly ] " "
append sg1_urx [dbget [dbget top.insts.name $flop -p ].box_urx ] " "
append sg1_ury [dbget [dbget top.insts.name $flop -p ].box_ury ] " "
}
set finT_llx [lindex [lsort -real $sg1_llx] 0 ]
set finT_lly [lindex [lsort -real $sg1_lly] 0 ]
set finT_urx [lindex [lsort -real $sg1_urx] end ]
set finT_ury [lindex [lsort -real $sg1_ury] end ]
set bbox($tree) "$finT_llx $finT_lly $finT_urx $finT_ury"
puts "$tree $bbox($tree)"
puts $fh "set bbox($tree) \"$bbox($tree)\" "
}
close $fh
}
   } 
define_proc_arguments bbox_clock_tree -info "Bbox of the sinks for the clock tree"\
-define_args {
    {-source_grp "specify the source group name" "" string required}
}
