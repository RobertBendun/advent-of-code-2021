x, y = 0, 0
aim = 0

File.new('data').readlines().each do |line|
  dir, val = line.split()

  if dir == "forward" then
    m = val.to_i
    x += m
    y += aim * m
  end
  if dir == "up"      then aim -= val.to_i end
  if dir == "down"    then aim += val.to_i end
end

puts "X: #{x}, Y: #{y}, Mul: #{x*y}"
