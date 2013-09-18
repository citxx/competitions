module Main where

import Data.Maybe
import Data.Array
import Data.List
import Data.Char

import Data.Time.Calendar

main = interact (solve . words . head . tail . lines)

solve :: [String] -> String
solve ws = maybe "Error occured" id answer where
    answer = assign [] rws
    rws = reverse ws

assign :: [String] -> [String] -> Maybe String
assign [a] [] = Just a
assign _ [] = Nothing
assign stack (w : ws) = case w of
    "int" -> assign (w : stack) ws
    "pair" -> if not (null stack) && not (null $ tail stack)
        then let a : b : rStack = stack in assign (concat ["pair<", a, ",", b, ">"] : rStack) ws
        else Nothing
    _ -> error "Incorrect term"
