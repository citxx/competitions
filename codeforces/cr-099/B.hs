module Main where

import Data.Array
import Data.List
import Data.Char

import Data.Time.Calendar

main = interact (unlines . solve)

solve :: String -> [String]
solve number = result where
    result =

digits :: String -> [Int]
digits number = [sum $ map (\x -> if x == digit then 1 else 0) number | digit <- ['0'..'9']]

zeroCount :: [Int] -> [Int] -> Int
zeroCount n1 n2 = sum [min (n1 !! d) (n2 !! (9 - d)) | d <- [0..9]]

construct :: [Int] -> [Int] -> (String, String)
construct n1 n2 = [min (n1 !! d) (n2 !! (9 - d)) | d <- [0..9]]
