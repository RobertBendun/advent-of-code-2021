x, y = 0, 0

File.readlines("test-data").each do |line|
  dir, val = line.split()
  xmul, ymul = 0, 0

  if dir == "forward" then xmul = 1 end
  if dir == "up" then ymul = -1 end
  if dir == "down" then ymul = 1 end

  x += val.to_i * xmul
  y += val.to_i * ymul
end

puts "X: #{x}, Y: #{y}, Mul: #{x*y}"
