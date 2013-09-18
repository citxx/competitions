module Main where

import Data.Maybe
import Data.Array
import Data.List
import Data.Char

import Data.Time.Calendar

main = interact (show . solve . map read . words)

solve :: [Int] -> Int
solve (a : x : y : _) = if got then aim else -1 where
    got = if y `mod` a == 0
        then False
        else if y < a
            then hitOne a x
            else let y' = (y - a) `mod` (2 * a) in
                (y' < a && hitOne a x) || (a < y' && hitTwo a x)

    aim = number a x y

hitOne :: Int -> Int -> Bool
hitOne a x = -a < 2 * x && 2 * x < a

hitTwo :: Int -> Int -> Bool
hitTwo a x = (-a < x && x < 0) || (0 < x && x < a)

number :: Int -> Int -> Int -> Int
number a x y = if y < a
    then 1
    else 1 + number' a x (y - a)
number' a x y = 3 * (y `div` (2 * a)) + amongThree a x (y `mod` (2 * a))

amongThree a x y = if y < a
    then 1
    else if x < 0
        then 2
        else 3
