module load_points;

  parameter MAX_POINTS = 100;
  real points_x [0:MAX_POINTS-1];
  real points_y [0:MAX_POINTS-1];
  integer num_points = 0;

  initial begin
    integer fd, r;
    string line;
    real x, y;

    fd = $fopen("seq_loc.txt", "r");
    if (fd == 0) begin
      $display("ERROR: Could not open file.");
      $finish;
    end

    while (!$feof(fd) && num_points < MAX_POINTS) begin
      line = "";
      void'($fgets(line, fd));
      if ($sscanf(line, "%f %f", x, y) == 2) begin
        points_x[num_points] = x;
        points_y[num_points] = y;
        num_points++;
      end
    end

    $fclose(fd);

    $display("Loaded %0d points:", num_points);
    for (int i = 0; i < num_points; i++) begin
      $display("Point[%0d] = (%f, %f)", i, points_x[i], points_y[i]);
    end

    $finish;
  end

endmodule

