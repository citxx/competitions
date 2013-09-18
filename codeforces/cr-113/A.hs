module Main where

import Data.Maybe
import Data.Array
import Data.List
import Data.Char

import Data.Time.Calendar

main = interact (show . solve . map (map read . words) . lines)

solve :: [[Int]] -> Int
solve ([_, k] : raw_results) = length winners where
    winners = filter (== winResult) sortedResults
    winResult = sortedResults !! (k - 1)

    sortedResults = reverse $ sortBy comp results

    results = map (\[a, b] -> (a, b)) raw_results

comp :: (Int, Int) -> (Int, Int) -> Ordering
comp (a, b) (c, d)
    | a == c && b == d = EQ
    | a > c || a == c && b < d = GT
    | otherwise = LT
