module Main where

import Data.Maybe
import Data.Array
import Data.List
import Data.Char

import Data.Time.Calendar

main = interact (solve . map (map read . words) . lines)

solve :: [[Int]] -> String
solve [[_, k], nums] = undefined where
