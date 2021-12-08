program Advent_Of_Code
  implicit none
  integer, dimension(:,:), allocatable :: coords, grid
  integer, dimension(:), allocatable :: line
  integer :: i, j, x, y, coords_count, grid_size
  integer :: x1, y1, x2, y2

  character(100) :: filename

  if (command_argument_count() /= 1) then
    print *, "usage: [a|b] filename"
    stop
  end if

  call get_command_argument(1, filename)

  open(1, file=filename, status="OLD")

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


  grid_size = maxval(coords)
  allocate(grid(grid_size, grid_size))
  grid = 0

  do i = 1, coords_count
    line = coords(i, :)
    call draw_line(grid, grid_size, line)
  end do

  ! call print_grid(grid, grid_size)

  print *, "Answer: ", count(grid >= 2)

  close(1)
end program Advent_Of_Code

subroutine print_grid(grid, grid_count)
  implicit none
  integer :: grid_count, i, j
  integer, dimension(grid_count, grid_count) :: grid

  print "(a)", "------------------------------------"
  do j = 1, grid_count
    do i = 1, grid_count
      write(*, fmt="(i1)", advance="no") grid(i, j)
    end do
    print *, ""
  end do
end subroutine print_grid
