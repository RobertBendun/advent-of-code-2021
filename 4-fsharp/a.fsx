#load "common.fsx"
open Common

let rec play boards = function
  | [] -> None
  | n::ns ->
    let after = next n boards
    match winners after with
    | board::_ -> Some <| score n board
    | [] -> play after ns

let header, boards = parseFile "data"
match play boards header with
| Some n -> printfn "Answer is %d" n
| None -> printfn "Cannot calculate answer"
