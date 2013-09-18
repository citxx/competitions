module Main where

import Data.Array
import Data.List
import Data.Char

import Data.Time.Calendar

data Vector = Vector Int Int
    deriving (Show, Eq, Ord)

instance Num Vector where
    (+) (Vector ux uy) (Vector vx vy) = Vector (ux + vx) (uy + vy)
    (-) (Vector ux uy) (Vector vx vy) = Vector (ux - vx) (uy - vy)
    (*) (Vector ux uy) (Vector vx vy) = Vector (ux * vx) (uy * vy)

    negate (Vector x y) = Vector (negate x) (negate y)
    abs (Vector x y) = Vector 0 0
    signum (Vector x y) = 1

    fromInteger x = Vector x  0

main = interact (unlines . solve . (map $ (\l -> Vector(read $ l !! 0) (read $ l !! 1)) . words) . lines)

solve :: [(Int, Int)] -> [String]
solve points = result where
    perms = permutations $ zip points [1..8]

trueSet :: [Vector] -> Bool
