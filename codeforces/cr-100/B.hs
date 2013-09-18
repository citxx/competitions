module Main where

import Data.Maybe
import Data.Array
import Data.List
import Data.Char

import Data.Time.Calendar

main = interact (unwords . map show . solve . parse . lines)

parse :: [String] -> ([[Int]], [Int])
parse (x:xs) = let ws = map words xs in
    (map (map read) $ init ws, map read $ last ws)

solve :: ([[Int]], [Int]) -> [Int]
solve (friends, self) = result where
    result = concat actualFriends
    --result = map (bestPosition choice) actualFriends
    actualFriends = cut friends choice

    choice = formChoice self

cut friends choice = cut' 1 [] friends choice
cut' _ xs [] _ = reverse xs
cut' k xs (f : friends) choice = cut' (k + 1) (filter (\y -> y /= k && y `elem` choice) f : xs) friends choice

bestPosition :: [Int] -> [Int] -> Int
bestPosition choice prefered = fromJust $ lookup (head prefered) (zip choice [1..])

formChoice :: [Int] -> [Int]
formChoice prefered = formChoice' 1 [1] [2 .. length prefered] prefered

formChoice' :: Int -> [Int] -> [Int] -> [Int] -> [Int]
formChoice' _ result [] _ = reverse result
formChoice' best result (k : que) prefered = if fromJust (k `elemIndex` prefered) < fromJust (best `elemIndex` prefered)
        then formChoice' k ((k) : result) que prefered
        else formChoice' best ((best) : result) que prefered
