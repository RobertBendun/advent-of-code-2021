include "program.f90"

subroutine draw_line(grid, grid_count, line)
  implicit none
  integer :: grid_count
  integer, dimension(grid_count, grid_count) :: grid
  integer, dimension(4) :: line
  integer :: vmin, vmax, x, y, p

  if (line(1) == line(3)) then
    x = line(1)
    grid(x, line(2) : line(4)) = grid(x, line(2) : line(4)) + 1
  else if (line(2) == line(4)) then
    y = line(2)
    grid(line(1) : line(3), y) = grid(line(1) : line(3), y) + 1
  else
    print *, line
    do p = 0, line(3) - line(1)
      grid(line(1) + p, line(2) + p) = grid(line(1) + p, line(2) + p) + 1
    end do
  end if
end subroutine draw_line
