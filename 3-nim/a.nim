import std/enumerate
import std/parseutils
import std/sequtils
import std/strformat

var initialized = false
var ones : seq[int] = @[]
var zeros : seq[int] = @[]

for line in lines("data"):
  if not initialized:
    ones  = newSeq[int](len(line))
    zeros = newSeq[int](len(line))
    initialized = true

  for (i, ch) in enumerate(line):
    if ch == '0':
      inc(zeros[i])
    else:
      inc(ones[i])

var gamma = ""
var epsilon = ""

for (z, o) in zip(zeros, ones):
  if z > o:
    gamma.add('0')
    epsilon.add('1')
  else:
    gamma.add('1')
    epsilon.add('0')

var gamma_n : uint
var epsilon_n : uint

discard parseBin(gamma, gamma_n)
discard parseBin(epsilon, epsilon_n)

echo gamma_n * epsilon_n
