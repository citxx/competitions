module Main where

import Data.List

ans 8 8 = 8
ans n m = n+m

solve :: [String] -> Int
solve board = ans (rows board) (rows (transpose board)) where
    rows brd = foldl isStroke 0 brd where
        isStroke cnt row
            | all (=='B') row = cnt+1
            | otherwise       = cnt

readBoard 0 = return []
readBoard n = do
    s <- getLine
    b <- readBoard (n-1)
    return (s:b)

main = do
    board <- readBoard 8
    print (solve board)
