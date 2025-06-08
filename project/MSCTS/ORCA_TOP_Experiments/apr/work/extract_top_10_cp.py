def extract_top_10_paths(report_file, output_file):
    with open(report_file, 'r') as infile, open(output_file, 'w') as outfile:
        path_count = 0
        capture = False

        for line in infile:
            if "Startpoint" in line:
                if path_count >= 10:
                    break
                path_count += 1
                capture = True
                outfile.write(line)
            elif capture:
                outfile.write(line)
                if "slack" in line.lower():
                    capture = False
                    outfile.write("\n----------------------------------------------\n")

# Example usage
extract_top_10_paths("ORCA_TOP.route2.timing.max.rpt", "top10_python.rpt")

