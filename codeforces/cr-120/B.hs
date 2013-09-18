module Main where

import Data.Maybe
import Data.Array
import Data.List
import Data.Char

import Data.Time.Calendar

main = interact (show . solve . map (map read . words) . lines)

solve :: [[Int]] -> Double
solve [[x1, y1, r1], [x2, y2, r2]] = let d2 = (x1 - x2) ^ 2 + (y1 - y2) ^ 2 in
    if d2 >= (r1 + r2) ^ 2
        then (sqrt (fromIntegral d2) - fromIntegral (r1 + r2)) / 2.0
        else 0.0
