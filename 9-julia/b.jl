include("common.jl")

grid = getGrid()
lows = findLowestPoints(grid, (x,y) -> (x,y))

basins = []

for low in lows
	stack = Vector()
	visited = Vector()
	push!(stack, low)
	push!(visited, low)
	basin_size = 0

	while length(stack) > 0
		top = pop!(stack)
		basin_size += 1
		
		for neigh in neighbours(top..., size(grid)...)
			if grid[neigh...] == 9 continue end
			if findfirst(x -> x == neigh, visited) != nothing continue end
			push!(stack, neigh)
			push!(visited, neigh)
		end
	end
	
	push!(basins, basin_size)
end

println(reduce(*, sort(basins, rev=true)[1:3]))
