module Main where

import Data.Maybe
import Data.Array
import Data.List
import Data.Char

import Data.Time.Calendar

main = interact (unwords . solve . map read . words)

solve :: [Int] -> [String]
solve [0, 0] = ["0 0"]
solve [0, _] = ["Impossible"]
solve [n, m] = map show [max n m, if m == 0 then n else n + m - 1]
