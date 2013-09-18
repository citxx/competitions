module Main where

import Data.Array
import Data.List
import Data.Char

import Data.Time.Calendar

main = interact (solve . lines)

solve :: [String] -> String
solve lines = result where
    result = case rhyme of
        Nothing -> "NO"
        Just s  -> s
    rhyme = foldl1 (buildType) types
    types = map getType poem
    poem = quads $ tail endings
    endings = map (ending k) lines
    k = (read $ last $ words $ head lines) :: Int

buildType t (Just "aaaa")  = t
buildType (Just "aaaa") t  = t
buildType t1 t2
    | t1 == t2      = t1
    | otherwise     = Nothing

getType :: [Maybe String] -> Maybe String
getType quad@[a, b, c, d]
    | any (== Nothing) quad  = Nothing
    | all (== a) quad        = Just "aaaa"
    | a == b && c == d       = Just "aabb"
    | a == c && b == d       = Just "abab"
    | a == d && b == c       = Just "abba"
    | otherwise              = Nothing

quads :: [a] -> [[a]]
quads [] = []
quads (a : b : c : d : poem) = [a, b, c, d] : quads poem

ending :: Int -> String -> Maybe String
ending k = ending' [] k . reverse

ending' :: String -> Int -> String -> Maybe String
ending' result 0 _   = Just result
ending' result k []  = Nothing
ending' result k (c : str)
    | c `elem` "aeiou"  = ending' (c : result) (k - 1) str
    | otherwise         = ending' (c : result) k str
