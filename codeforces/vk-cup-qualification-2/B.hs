module Main where

import Data.Maybe
import Data.Array
import Data.List
import Data.Char

import Data.Time.Calendar

main = interact (unlines . parse . map words . lines)

type Friend = (String, String)

data Message = Message {
    time :: Int,
    sender :: String,
    receiver :: String
} deriving (Eq, Ord, Show)

parse :: [[String]] -> [String]
parse ([_, d] : messages) =  show (length result) : map (\x -> fst x ++ " " ++ snd x) result where
    result = solve (read d) (map convert messages)
    convert [first, second, time] = Message (read time) first second

solve :: Int -> [Message] -> [Friend]
solve d messages = unique friends where
    friends = map (\x -> if fst x <= snd x then x else (snd x, fst x)) $ getResponses [] d (sort messages)
    unique = map head . group . sort

getResponses :: [Friend] -> Int -> [Message] -> [Friend]
getResponses result _ [] = result
getResponses result d (h : messages) = getResponses newResult d messages where
    newResult =  if null answers then result else (receiver h, sender h) : result
    answers = filter (\x -> sender x == receiver h && receiver x == sender h) relevant
    relevant = takeWhile (\x -> time h + d >= time x) messages
