module Main where

import Data.Maybe
import Data.Array
import Data.List
import Data.Char

import Data.Time.Calendar

type Matrix = Array (Int, Int) Integer

modulo = 1000000007
transMatrix = listArray ((1, 1), (4, 4)) [
    0, 1, 1, 1,
    1, 0, 1, 1,
    1, 1, 0, 1,
    1, 1, 1, 0 ] :: Matrix

idMatrix = listArray ((1, 1), (4, 4)) [
    1, 0, 0, 0,
    0, 1, 0, 0,
    0, 0, 1, 0,
    0, 0, 0, 1 ] :: Matrix

main = interact (show . solve . read . head . lines)

solve :: Integer -> Integer
solve k = (binPow modMult transMatrix k) ! (1, 1)

plus' a b = (a + b) `mod` modulo
sum' = foldl' plus' 0
mult' a b = (a * b) `mod` modulo

binPow :: (Integral b) => (Matrix -> Matrix -> Matrix) -> Matrix -> b -> Matrix
binPow _ _ 0 = idMatrix
binPow mul a k
    | k `mod` 2 == 0 = let b = binPow mul a (k `div` 2) in mul b b
    | otherwise      = let b = binPow mul a (k `div` 2) in mul a (mul b b)

row :: Matrix -> Int -> [Integer]
row a i = [a ! (i, k) | k <- [1..4]]

col :: Matrix -> Int -> [Integer]
col a i = [a ! (k, i) | k <- [1..4]]

modMult :: Matrix -> Matrix -> Matrix
modMult a b = listArray ((1, 1), (4, 4)) [
        sum' $ zipWith (*) (row a i) (col b j)
        | (i, j) <- range ((1, 1), (4, 4))
    ]
