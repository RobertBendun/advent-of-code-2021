#nowarn "40"

let splitBy (s : string) (xs : string) = Seq.toList <| xs.Split s
let trim (s : string) = s.Trim()
let notEmpty (s : string) = s.Length <> 0

type Board = (int * bool) list
type Boards = Board list

let parseRandomNumbers (input : string): int list =
  splitBy "," input
  |> List.map (fun num -> System.Int32.Parse(num))

let parseBoard : string list -> Boards = 
  List.map (
    splitBy " " 
    >> List.map trim 
    >> List.filter notEmpty 
    >> List.map (fun x -> (System.Int32.Parse x, false))
  )

let rec parseBoards (input : string list) : Boards =
  match input with
  | (""::rest) -> 
    let current, remaining = List.splitAt 5 rest
    List.concat (parseBoard current) :: parseBoards remaining
  | _ -> []

let parseFile (filename : string) =
  match System.IO.File.ReadLines(filename) |> Seq.toList with
  | header::boards -> (parseRandomNumbers header, parseBoards boards)
  | _ -> raise <| new System.Exception("Foo")

// calculate next state of the board
let next (n : int) : Boards -> Boards =
  List.map (List.map (
    function
    | (n', _) when n' = n -> (n, true)
    | otherwise -> otherwise
  ))

// check if any of the board win
let winnersAndLoosers : Boards -> (Board list * Board list) =
  let checkWith pred (board : Board) =
    List.indexed board
    |> List.groupBy pred
    |> List.map (snd >> List.map (snd >> snd) >> List.fold (&&) true)
    |> List.fold (||) false

  let checkColumns = checkWith (fun (i, _) -> i % 5)
  let checkRows = checkWith (fun (i, _) -> i / 5)

  List.partition (fun board -> checkColumns board || checkRows board)

let winners = winnersAndLoosers >> fst

let score (n : int) : Board -> int =
  List.filter (snd >> (not))
  >> List.map fst
  >> List.sum
  >> ((*) n)
