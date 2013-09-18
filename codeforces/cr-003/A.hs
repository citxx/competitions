module Main where

import Data.Char

choose :: Int -> Int -> Char -> Char -> String
choose a b ra rb
    | a < b = [rb]
    | a > b = [ra]
    | otherwise = ""

_solve :: (Int, Int) -> (Int, Int) -> [String]
_solve s t
    | s == t = []
    | otherwise = (choose (fst s) (fst t) 'L' 'R' ++
                   choose (snd s) (snd t) 'D' 'U') : _solve (fst s + signum (fst t - fst s), snd s + signum (snd t - snd s)) t

toCoords :: String -> (Int, Int)
toCoords s = (ord (s !! 0) - ord 'a', digitToInt (s !! 1))

solve :: String -> String -> [String]
solve s t = _solve (toCoords s) (toCoords t)

printAnswer :: [String] -> IO ()
printAnswer [] = return ()
printAnswer (x:xs) = do
    putStrLn x
    printAnswer xs

main = do
    s <- getLine
    t <- getLine
    let answer = solve s t
    print (length answer)
    printAnswer answer
