proc calculatingDepth {skewGroupName} {
set depth ""
set sinks [get_ccopt_property sinks_active -skew_group
$skewGroupName]
foreach i $sinks {
set delay [get_ccopt_skew_group_delay -to $i -skew_group
$skewGroupName -summarize_stage_depth {buffer inverter logic
clock_gate generator}]
lappend depth $delay
}
puts "Min depth is [lindex [lsort -real [join $depth]] 0]"
puts "Max depth is [lindex [lsort -real [join $depth]] end]"
}

