module Main where

import Data.Maybe
import Data.Array
import Data.List
import Data.Char

import Data.Time.Calendar

main = interact (unlines . solve . lines)

solve :: [String] -> [String]
solve lines = lines
