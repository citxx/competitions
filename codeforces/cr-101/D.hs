module Main where

import Data.Maybe
import Data.Array
import Data.List
import Data.Char

import Data.Time.Calendar

data Point = Begin Int Int | End Int Int deriving (Eq, Show)

pos :: Point -> Int
pos (Begin x _) = x
pos (End x _) = x

num :: Point -> Int
num (Begin _ x) = x
num (End _ x) = x

tp :: Point -> Int
tp (Begin _ _) = 0
tp (End _ _) = 1

instance Ord Point where
    compare p1 p2 = compare (pos p1, tp p1, - num p1) (pos p2, tp p2, - num p2)

type Tramplin = (Int, Int, Int, Int)

main = interact (unlines . solve . parse . lines)

parse :: [String] -> (Int, [(Int, Int, Int, Int)])
parse (h : tramps) = (read $ (words h) !! 1, map (\(a : b : c : d : _) -> (a, b, c, d)) $ map (map read . words) tramps)

solve :: (Int, [(Int, Int, Int, Int)]) -> [String]
solve (fin, tr) = result where
    result = map show dn

    dyn = listArray (0, length dn - 1) [(x)]
    dn = sort points
    points = (Begin 0 0) : (End fin 0) : concatMap (\(b, e, t, n) -> [Begin b n, End e n]) tramps
    tramps = filter (\(x, _, _, _) -> x >= 0) $ map trans $ zip tr [1..]

trans :: ((Int, Int, Int, Int), Int) -> Tramplin
trans ((x, d, t, p), num) = (x - p, x + d, p + t, num)
