module Main where

import Data.Array
import Data.List
import Data.Char

import Data.Time.Calendar

main = interact (unlines . solve . (map read) . words . (!! 1) . lines)

solve :: [Int] -> [String]
solve arr  = result where
    result = [intercalate " " $ map show ansInt]
    ansInt = 1 : init sArr
    sArr = sort arr
