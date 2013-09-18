module Main where

import Data.Maybe
import Data.Array
import Data.List
import Data.Char

import Data.Time.Calendar

main = interact (show . solve . map (\[a, b] -> (a, b)) . map (map read . words) . tail . lines)

solve :: [(Int, Int)] -> Int
solve points = length central where
    central = filter (\p -> haveRight p &&
                            haveLeft p &&
                            haveTop p &&
                            haveBottom p) points


    haveRight (x, y)   = any (\(x', y') -> y == y' && x < x') points
    haveLeft (x, y)    = any (\(x', y') -> y == y' && x' < x) points
    haveTop (x, y)     = any (\(x', y') -> y < y'  && x' == x) points
    haveBottom (x, y)  = any (\(x', y') -> y' < y  && x' == x) points
