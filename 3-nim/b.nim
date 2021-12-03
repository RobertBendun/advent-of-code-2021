import std/sequtils
import std/enumerate
import std/sugar
import std/strformat
import std/parseutils

let input = toSeq(lines("data"))

proc ones_and_zeros(input : seq[string]): (seq[int], seq[int]) =
  var initialized = false
  var ones : seq[int] = @[]
  var zeros : seq[int] = @[]
  for line in input:
    if not initialized:
      ones  = newSeq[int](len(line))
      zeros = newSeq[int](len(line))
      initialized = true

    for (i, ch) in enumerate(line):
      if ch == '0':
        inc(zeros[i])
      else:
        inc(ones[i])
  return (zeros, ones)

var oxygen : seq[string] = input
var co2 : seq[string] = input

for i in 0 .. len(input[0]) - 1:
  block:
    let zo = ones_and_zeros(oxygen)
    let (z, o) = zo
    let d = if z[i] > o[i]: '0' else: '1'
    if len(oxygen) > 1:
      oxygen = filter(oxygen, (s) => s[i] == d)

  block:
    let zo = ones_and_zeros(co2)
    let (z, o) = zo
    let d = if z[i] <= o[i]: '0' else: '1'
    if len(co2) > 1:
      co2 = filter(co2, (s) => s[i] == d)

  if len(co2) + len(oxygen) == 2:
    break

echo fmt"Oxygen: {oxygen[0]}"
echo fmt"CO2:    {co2[0]}"

var oxygen_v : uint
var co2_v : uint
discard parseBin(oxygen[0], oxygen_v)
discard parseBin(co2[0], co2_v)

echo oxygen_v * co2_v
