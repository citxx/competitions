module Main where

main = interact (solve)

m = 1000003

solve :: String -> String
solve prog = show $ foldl (\x y -> (2 * x + y) `mod` m) 0 bin where
    bin = concat $ map getRepr prog

getRepr :: Char -> [Int]
getRepr '>'  =  [1, 0, 0, 0]
getRepr '<'  =  [1, 0, 0, 1]
getRepr '+'  =  [1, 0, 1, 0]
getRepr '-'  =  [1, 0, 1, 1]
getRepr '.'  =  [1, 1, 0, 0]
getRepr ','  =  [1, 1, 0, 1]
getRepr '['  =  [1, 1, 1, 0]
getRepr ']'  =  [1, 1, 1, 1]
getRepr _    =  []
