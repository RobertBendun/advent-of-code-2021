#load "common.fsx"
open Common

let rec play (boards: Boards) = function
  | [] -> []
  | n::ns ->
    let (winners, loosers) = winnersAndLoosers <| next n boards
    List.map (fun x -> (n, x)) winners @ 
      if List.isEmpty loosers 
      then [] 
      else play loosers ns

let header, boards = parseFile "data"
let result = play boards header
let (n, maxLooser) = List.last result

printfn "Answer is %d" (score n maxLooser)