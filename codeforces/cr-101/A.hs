module Main where

import Data.Maybe
import Data.Array
import Data.List
import Data.Char

import Data.Time.Calendar

main = interact (solve . lines)

solve :: [String] -> String
solve (first : last : both : _) = if sort (first ++ last) == sort both then "YES" else "NO"
