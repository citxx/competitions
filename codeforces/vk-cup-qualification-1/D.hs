module Main where

import Data.Maybe
import Data.Array
import Data.List
import Data.Char

import Data.Time.Calendar

main = interact (show . solve . map read . words . (!! 1) . lines)

divisors :: Int -> [Int]
divisors n = concat [[x, n `div` x] | x <- [1..((+1) $ ceiling $ sqrt $ fromIntegral n)], n `mod` x == 0]

solve :: [Int] -> Int
solve values = let n = length values in maximum $ map (score values) (filter (<= (n `div` 3)) $ divisors n)

score :: [Int] -> Int -> Int
score values k = maximum $ map sum $ getGroups values k

getGroups :: [Int] -> Int -> [[Int]]
getGroups xs k = transpose $ fixedGroups [] xs k where
    fixedGroups result [] _ = result
    fixedGroups result xs k = let (h, t) = splitAt k xs in fixedGroups (h : result) t k
