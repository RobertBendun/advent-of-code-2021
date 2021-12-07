# Advent of Code 2021

Each day in different programming language:

## Journal

### Day 1: [Bash](https://www.gnu.org/software/bash/)

### Day 2: [Natalie](https://natalie-lang.org/), Ruby implementation, compiled to C++, by Tim Morgan.

Getting Natalie to work was quite easy, even though I know nothing about Ruby and it's ecosystem. This lead to [making pull request to the compiler](https://github.com/seven1m/natalie/pull/261). Natalie in this moment does not support readlines method so I needed to write quick version myself. Will later contribute less hacky implementation.

[Hacky implementation of `IO#readlines`](https://github.com/RobertBendun/natalie/commit/fab1a3c89424150f29171625bb54214db6cb3955)

### Day 3: [Nim](https://nim-lang.org/), indentation-based systems programming language with rich macro system

The most hilarious requirement that I have seen from "C++ replacement": Filenames have required syntax. Sorry buddy, file `3a.nim` does not match our module syntax, even though you are never going to use is as a module you are required to match!

Documentation is pretty hard for explorational approach, but maybe it's my fault.

My solutions seem horrrible, need to refactor them later.

### Day 4: [F#](https://fsharp.org/)

Decided to use VSCode since it's recommended by most tutorials. A lot of operations that are provided in Haskell are missing, which make poor functional expirience. Maybe it's fault of lack of tools like Hoogle or my own assumptions.
