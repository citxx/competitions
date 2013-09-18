module Main where

import Data.Maybe
import Data.Ix
import Data.Array
import Data.List
import Data.Char

import Data.Time.Calendar

type Graph node = Array node [node]

directedGraph :: (Ix node) => (node, node) -> [(node, node)] -> Graph node
directedGraph bounds edges = accumArray (\xs x -> x : xs) [] bounds edges

undirectedGraph :: (Ix node) => (node, node) -> [(node, node)] -> Graph node
undirectedGraph bounds edges = directedGraph bounds (map (\(u, v) -> (v, u)) edges ++ edges)

adjacent :: (Ix node) => Graph node -> node -> [node]
adjacent graph v = graph ! v

nodes :: (Ix node) => Graph node -> [node]
nodes = range . bounds

inverse :: (Ix node) => Graph node -> Graph node
inverse graph = array (bounds graph) lists where
    lists = map (\v -> (v, invList ns $ sort $ graph ! v)) ns
    ns = sort $ nodes graph

invList :: (Ord a) => [a] -> [a] -> [a]
invList full [] = full
invList [] _ = []
invList (f : full) xxs@(x : xs)
    | f == x     = invList full xs
    | otherwise  = f : invList full xxs

getComponents :: (Ix node) => Graph node -> [[node]]
getComponents graph = getComponents' [] (nodes graph) graph
getComponents' result [] _ = result
getComponents' result (v : vs) graph = let c = dfs graph v in
    getComponents' (c : result) (filter (not . (`elem` c)) vs) graph

dfs :: (Ix node) => Graph node -> node -> [node]
dfs = dfs' [] []
dfs' toVisit visited graph v = let newVisited = v : visited in
    case (toVisit, filter (not . (`elem` newVisited)) $ adjacent graph v) of
        ([], []) -> newVisited
        (u : us, []) -> dfs' us newVisited graph u
        (_, u : ru) -> dfs' (merge ru toVisit) newVisited graph u

merge :: (Eq a) => [a] -> [a] -> [a]
merge a b = filter (not . (`elem` b)) a ++ b

main = interact (unlines . map (unwords . map show) . solve . map (map read . words) . lines)

solve :: [[Int]] -> [[Int]]
solve ([n, _] : edges) = [length regions] : map (\r -> length r : r) regions where
    regions = getComponents actGraph
    actGraph = inverse mapGraph
    mapGraph = undirectedGraph (1, n) $ map (\[a, b] -> (a, b)) edges
