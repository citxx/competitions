module Main where

import Data.Array
import Data.List
import Data.Char

import Data.Time.Calendar

main = interact (solve . map read . words)

solve :: [Integer] -> String
solve [n, rTable, rPlate] = result where
    result = if n <= actualN then "YES" else "NO"
--    result = show actualN
    actualN = if rPlate * 2 <= rTable
        then floor $ 1.0e-9 + pi / (asin $ rPlateF / (rTableF - rPlateF))
        else if rPlate <= rTable then 1 else 0
    rPlateF = fromInteger rPlate
    rTableF = fromInteger rTable
