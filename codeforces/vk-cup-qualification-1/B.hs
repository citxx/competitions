module Main where

import Data.Maybe
import Data.Array
import Data.List
import Data.Char

import Data.Time.Calendar

main = interact (show . solve . map read . words . (!! 1) . lines)

solve :: [Int] -> Int
solve groups = sum [four, threePlusOne, twoPlusTwo, three', twoPlusOnes, outsiders] where
    outsiders = (one'' + 3) `div` 4
    one'' = if two' == 1 then max 0 (one' - 2) else one'
    twoPlusOnes = if two' == 1 then 1 else 0
    (one', two', three') = (one - threePlusOne, two `mod` 2, three - threePlusOne)
    twoPlusTwo = two `div` 2
    threePlusOne = min three one
    [one, two, three, four] = [length (filter (== x) groups) | x <- [1..4]]
