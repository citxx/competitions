module Main where

import Data.List
import System.IO

solve :: [Int] -> Int
solve xs = max 0 ((min p (b+1)) - a) where
    a = head ab
    b = head $ tail ab
    ab = snd s
    p = minimum $ fst s
    s = splitAt 4 xs


main :: IO ()
main = do
    s <- getLine
    print (solve ((map read (words s))::[Int]));
