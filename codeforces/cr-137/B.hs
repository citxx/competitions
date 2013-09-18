module Main where

import Data.Maybe
import Data.Array
import Data.List
import Data.Char

import Data.Time.Calendar

main = interact (unlines . map show . solve . map words . lines)

solve :: [[String]] -> [Int]
solve (args : input) = answer n m k table queries where
    [n, m, k] = map read args :: [Int]
    table = listArray ((1, 1), (n, m)) $ map read $ concat raw_table
    queries = map (\[s, x, y] -> (head s, read x, read y)) raw_queries -- :: [(Char, Int, Int)]
    raw_queries = take k rest
    (raw_table, rest) = splitAt n input

answer :: Int -> Int -> Int -> Array (Int, Int) Int -> [(Char, Int, Int)] -> [Int]
answer = undefined

{-buildPair = do arr <- newArray (1,10) 37 :: ST s (STArray s Int Int)
    a <- readArray arr 1
    writeArray arr 1 64
    b <- readArray arr 1
    return (a,b)

main = print $ runST buildPair
-}
