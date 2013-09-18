module Main where

import Data.Maybe
import Data.Array
import Data.List
import Data.Char

import Data.Time.Calendar

main = interact (show . solve . map (map read . words) . lines)

solve :: [[Int]] -> Int
solve [[_, k], scores] = length trueScores where
    trueScores = filter (>= (max 1 (scores !! (k - 1)))) scores
