module Main where

import Data.Maybe
import Data.Array
import Data.List
import Data.Char

import Data.Time.Calendar

main = interact (show . solve . map (map read . words) . lines)

solve :: [[Int]] -> Int
solve ([_, x] : arr : _) = addition + max 0 (e - b - nx) + max 0 (b + 1 - nx - e) where
    b = length start
    e = length rest
    nx = length xs

    (xs,  rest) = break (/= x) arr'
    (start, arr') = break (== x) sortedArray

    sortedArray = sort correctArray

    (addition, correctArray) = if x `elem` arr then (0, arr) else (1, x : arr)
