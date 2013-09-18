module Main where

import Data.Char

main = interact (unlines . solve . head. lines)

solve :: String -> [String]
solve line = map show $ getArray (0 : (map ord line))

getArray :: [Int] -> [Int]
getArray [_] = []
getArray (x : (t@(y:_))) = (mirror x - mirror y) `trueMod` 256 : getArray t

trueMod :: Int -> Int -> Int
trueMod x y =
    let m = x `mod` y in
        if m < 0 then m + y else m

mirror = bin2num . reverse . num2bin

bin2num = foldl (\x y -> 2 * x + y) 0

num2bin = reverse . (num2bin' 8)

num2bin' 0 x = []
num2bin' n x = x `mod` 2 : num2bin' (n - 1) (x `div` 2)
