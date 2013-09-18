module Main where

import Data.Maybe
import Data.Array
import Data.List
import Data.Char

import Data.Time.Calendar

main = interact (show . solve . map (map read . words) . lines)

solve :: [[Int]] -> Int
solve ([n, k] : a : _) = if homogeneousRest then length badHead else -1 where
    badHead = takeWhile (/= key) a
    homogeneousRest = all (== key) rest
    rest = drop (k - 1) a
    key = last a

