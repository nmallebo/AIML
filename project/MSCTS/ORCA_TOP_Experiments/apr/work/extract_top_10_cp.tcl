set fid [open "ORCA_TOP.route2.timing.max.rpt" r]
set fid2 [open "top10.rpt" w]
set path_count 0
set capture 0
while {[gets $fid line] >= 0} {
	if {[regexp "Startpoint" $line]} {
		if { $path_count >= 10 } {
			break
		}
		incr path_count
		set capture 1
		puts $fid2 $line
	} elseif {$capture} {
		puts $fid2 $line
		if {[regexp "slack" $line]} {
			set capture 0
		        #puts $fid2 $line
		        puts $fid2 "\n----------------------------------------------\n"
		   }
	}
 }

close $fid
close $fid2
			
