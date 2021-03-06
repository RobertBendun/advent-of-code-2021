include "program.f90"

subroutine draw_line(grid, grid_count, line)
  implicit none
  integer :: grid_count
  integer, dimension(grid_count, grid_count) :: grid
  integer, dimension(4) :: line
  integer :: vmin, vmax, x, y

  vmin = min(line(1), line(3))
  vmax = max(line(1), line(3))
  line(1) = vmin
  line(3) = vmax

  vmin = min(line(2), line(4))
  vmax = max(line(2), line(4))
  line(2) = vmin
  line(4) = vmax

  if (line(1) == line(3)) then
    x = line(1)
    grid(x, line(2) : line(4)) = grid(x, line(2) : line(4)) + 1
  else if (line(2) == line(4)) then
    y = line(2)
    grid(line(1) : line(3), y) = grid(line(1) : line(3), y) + 1
  end if
end subroutine draw_line
