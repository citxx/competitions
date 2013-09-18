module Main where

import Data.Array
import Data.List
import Data.Char

import Data.Time.Calendar

main = interact (unwords . map show . solve . map read . words . (!! 1) . lines)

startTime = 10
middleTime = (24 - 18) * 60
endTime = (6 - 18 + 24) * 60

solve :: [Int] -> [Int]
solve times = result where
    result = cutProblems bestOrder
    bestOrder = sort times

cutProblems :: [Int] -> [Int]
cutProblems = cutProblems' startTime 0 0
cutProblems' _ result tasks [] = [tasks, result]
cutProblems' sm result tasks (x : xs) = if sm + x <= endTime
    then cutProblems' (sm + x) (result + if sm + x < middleTime then 0 else sm + x - middleTime) (tasks + 1) xs
    else [tasks, result]

