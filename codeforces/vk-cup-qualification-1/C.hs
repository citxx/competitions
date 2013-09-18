module Main where

import Data.Maybe
import Data.Array
import Data.List
import Data.Char

import Data.Time.Calendar

data Path = Relative [String] | Absolute [String]

instance Show Path where
    show (Absolute []) = "/"
    show (Relative path) = intercalate "/" (normalized path) ++ "/"
    show (Absolute path) = '/' : intercalate "/" (normalized path) ++ "/"

instance Read Path where
    readsPrec _ s = if head s == '/' then [(Absolute (parse $ tail s), "")]
                                     else [(Relative (parse s), "")] where
        parse = split "/"
        split seps = words . map (\x -> if elem x seps then ' ' else x)

cd :: Path -> Path -> Path
cd _ p@(Absolute _) = p
cd (Absolute basis) (Relative modifier) = Absolute (reverse $ apply (reverse basis) modifier)

apply :: [String] -> [String] -> [String]
apply basis [] = basis
apply (_ : basis) (".." : modifier) = apply basis modifier
apply basis (directory : modifier) = apply (directory : basis) modifier

normalized :: [String] -> [String]
normalized = normalized' [] where
    normalized' result [] = reverse result
    normalized' result (node : ".." : path) = normalized' result path
    normalized' result (node : path) = normalized' (node : result) path


main = interact (unlines . solve (read "/") . map words . tail . lines)

solve :: Path -> [[String]] -> [String]
solve _ [] = return []
solve currentDir (cmd : commands) = case head cmd of
    "pwd" -> show currentDir : solve currentDir commands
    "cd"  -> solve (cd currentDir (read $ cmd !! 1)) commands
