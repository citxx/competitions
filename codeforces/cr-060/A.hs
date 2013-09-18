module Main where

check :: [Int] -> Bool
check l = a*c*e < b*d*f || (a == 0 && b*d /= 0) || (c == 0 && d /= 0) where
    a = l !! 0
    b = l !! 1
    c = l !! 2
    d = l !! 3
    e = l !! 4
    f = l !! 5

main = do
    s <- getLine
    putStrLn (if check $ map read $ words s then "Ron" else "Hermione")
