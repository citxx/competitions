module Main where

import Data.Maybe
import Data.Array
import Data.List
import Data.Char

import Data.Time.Calendar

main = interact (unlines . solve .
    map (\s -> let a = words s in (a !! 0, read $ a !! 1)) .
    tail . lines)

solve :: [(String, Int)] -> [String]
solve humans = result where
    result = case heightOrder of
        Nothing -> ["-1"]
        Just h  -> answer where
            answer = map (\(name, height) -> name ++ (' ' : show height)) que
            que = map (\(x, y, z) -> (y, z)) $ sort $ zipWith (\(name, num) height -> (num, name, height)) (reverse h) [1..]

    heightOrder = getOrder sortedHumans
    sortedHumans = sortBy (\(n1, c1) (n2, c2) -> compare c1 c2) humans

getOrder :: [(String, Int)] -> Maybe [(String, Int)]
getOrder = getOrder' (Just []) 0
getOrder' result _ [] = result
getOrder' result k ((n, c) : humans) = getOrder' (ins (n, k) c result) (k + 1) humans

ins :: a -> Int -> Maybe [a] -> Maybe [a]
ins _ _ Nothing = Nothing
ins x i (Just xs) = if i <= length xs
    then let (b, e) = splitAt i xs in Just (b ++ (x : e))
    else Nothing
