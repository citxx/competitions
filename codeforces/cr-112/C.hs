module Main where

import Data.Maybe
import Data.Array
import Data.List
import Data.Char

import Data.Time.Calendar

main = interact (show . solve . lines)

solve :: [String] -> Integer
solve [sK, str] = answer where
    answer = case k of
        0 -> sum $ map (\x -> x * (x - 1) `div` 2) oneGroups
        _ -> sum $ zipWith (*) oneGroups (drop k oneGroups)
    oneGroups = map (fromIntegral . length) $ group sums :: [Integer]
    sums = elems sumArray

    sumArray = array allBounds [(i, sumArrayF i) | i <- range allBounds]
    allBounds = (0, snd $ bounds strArray)

    sumArrayF 0 = 0
    sumArrayF i = strArray ! i + sumArray ! (i - 1)

    strArray = listArray (1, length str) $ map ((\x -> x - ord '0') . ord) str
    k = read sK :: Int

