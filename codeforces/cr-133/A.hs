module Main where

import Data.Maybe
import Data.Array
import Data.List
import Data.Char

import Data.Time.Calendar

main = interact (show . solve . map read . words . head . lines)

solve :: [Int] -> Int
solve [a, b, c] = (a + b - 1) * c + (a - 1) * (b - 1)
