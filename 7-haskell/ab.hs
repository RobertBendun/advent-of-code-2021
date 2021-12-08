import Data.List.Split (splitOn)

readInput :: String -> IO [Int]
readInput str = do
  file <- readFile str
  return $ map read $ splitOn "," file

partA :: [Int] -> Int
partA input = minimum [sum [abs $ p - h | p <- input] | h <- hpos]
  where
    hpos = [1 .. maximum input]

partB :: [Int] -> Int
partB input = minimum [sum [cost $ abs $ p - h | p <- input] | h <- hpos]
  where
    hpos = [1 .. maximum input]
    cost p = p * (p + 1) `div` 2
