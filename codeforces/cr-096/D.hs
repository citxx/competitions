module Main where

import Data.Array

main = interact (unlines . solve . tail. lines)

solve :: [String] -> [String]
solve lines = lines
