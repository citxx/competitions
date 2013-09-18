module Main where

import Data.Maybe
import Data.Array
import Data.List
import Data.Char

import Data.Time.Calendar

main = interact (show . solve . map read . words)

solve :: [Int] -> Int
solve [n, k] = maxV (-1) n n k

maxV :: Int -> Int -> Int -> Int -> Int
maxV leftV rightV n k
    | leftV == rightV - 1 = rightV
    | otherwise = let middleV = (leftV + rightV) `div` 2 in
        if solution middleV k >= n
            then maxV leftV middleV n k
            else maxV middleV rightV n k

solution :: Int -> Int -> Int
solution = solution' 0
solution' result 0 _ = result
solution' result v k = solution' (result + v) (v `div` k) k
