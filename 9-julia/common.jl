function neighbours(x, y, w, h)
	points = Vector{Tuple{Int64,Int64}}()
	for point in [[-1, 0], [1, 0], [0, -1], [0, 1]]
		xn, yn = point + [x,y]
		if xn < 1 || yn < 1 || xn > w || yn > h 
			continue
		end
		push!(points, (xn, yn))
	end
	return points
end

function findLowestPoints(grid, f)
	lows = Vector()

	for idx in map(Tuple, eachindex(grid))
		heigher, neighbours_count = 0, 0
		for (nx, ny) in neighbours(idx..., size(grid)...)
			if grid[idx...] < grid[nx, ny]
				heigher += 1
			end
			neighbours_count += 1
		end
		if heigher == neighbours_count
			push!(lows, f(idx...))
		end
	end
	
	lows
end

getGrid() = open(size(ARGS)[1] == 0 ? "data" : ARGS[1]) do f
	hcat(map(
		row -> map(
			v -> parse(Int64, v), 
			split(row, "")), 
		readlines(f))...)'
end