include("common.jl")

grid = getGrid()
lows = findLowestPoints(grid, (x,y) -> grid[x,y]) .+ 1
println(sum(lows))