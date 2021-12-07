program Advent_Of_Code
  implicit none
  integer, dimension(:,:), allocatable :: coords, grid
  integer, dimension(:), allocatable :: line
  integer :: i, j, x, y, coords_count, grid_size
  integer :: x1, y1, x2, y2


  open(1, file="test-data", status="OLD")

  coords_count = 0
  do
    read(1, *, END=200)
    coords_count = coords_count + 1
  end do
  200 continue

  allocate(coords(coords_count, 4))

  rewind(1)
  do i=1,coords_count
    read(1, *, END=201) coords(i, :)
    coords(i, :) = coords(i, :) + 1
  end do
  201 continue

  do i = 1, coords_count
    print *, coords(i, :)
  end do

  grid_size = maxval(coords)+1
  allocate(grid(grid_size, grid_size))
  grid = 0


  call print_grid(grid, grid_size)

  do i = 1, coords_count
    line = coords(i, :)
    if (line(1) == line(3)) then
      x = line(1)
      grid(x, line(2) : line(4)) = grid(x, line(2) : line(4)) + 1
    else if (line(2) == line(4)) then
      y = line(2)
      grid(line(1) : line(3), y) = grid(line(1) : line(3), y) + 1
    else
      print *, "Vertical line", line
    end if
  end do

  call print_grid(grid, grid_size)

  close(1)
end program Advent_Of_Code

subroutine print_grid(grid, grid_count)
  integer :: grid_count
  integer, dimension(grid_count, grid_count) :: grid

  print "(a)", "------------------------------------"
  do j = 1, grid_count
    do i = 1, grid_count
      write(*, fmt="(i1)", advance="no") grid(i, j)
    end do
    print *, ""
  end do
end subroutine print_grid
