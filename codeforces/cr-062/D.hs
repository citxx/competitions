module Main where

import Data.Maybe
import qualified Data.ByteString.Lazy.Char8 as BS

data Tree = Empty | Node Double Tree Tree
data Dir = TLeft | TRight
    deriving (Eq)

instance Show Tree where
    show tree = getRepresent 0 tree where
        getRepresent n Empty = concat (replicate n "  ") ++ "Empty\n"
        getRepresent n (Node e l r) = concat (replicate n "  ") ++ "Node " ++ show e ++ "\n" ++ getRepresent (n+1) l ++ getRepresent (n+1) r

markQ :: Tree -> Int -> Double -> Tree
markQ tree v e = mark tree (vl v []) e where
    vl 1 l = l
    vl v l = vl (v `div` 2) ((if v `mod` 2 == 0 then TLeft else TRight):l)
    mark Empty [] e = Node e Empty Empty
    mark Empty (d:ds) e = Node e left right where
        left  = if d == TLeft  then ans else Empty
        right = if d == TRight then ans else Empty
        ans = mark Empty ds e
    mark (Node te l r) [] e = Node (te+e) l r
    mark (Node te l r) (d:ds) e = Node (te+e) left right where
        left  = if d == TLeft  then mark l ds e else l
        right = if d == TRight then mark r ds e else r

decay :: Tree -> Double -> Double
decay Empty mx = mx
decay (Node tQ left right) mx = (expectL + expectR) / 2 where
    expectL = decay left (max mx (q + rQ))
    expectR = decay right (max mx (q + lQ))
    q = tQ - (lQ + rQ)
    lQ = getQ left
    rQ = getQ right
    getQ Empty = 0.0
    getQ (Node q _ _) = q

cycleF :: [BS.ByteString] -> Tree -> BS.ByteString
cycleF [] qTree = BS.empty --BS.pack $ show qTree --BS.empty
cycleF (query:qs) qTree =
    let p = BS.split ' ' query
        q = head p in
            if q == BS.pack "add"
                then let
                    v = fst $ fromJust $ BS.readInt $ p !! 1
                    e = fromIntegral $ fst $ fromJust $ BS.readInt $ p !! 2
                    newQTree = markQ qTree v e in
                        cycleF qs newQTree
                else let
                    answer = BS.pack $ show $ decay qTree 0.0 in
                        BS.concat [answer, BS.singleton '\n', cycleF qs qTree]

solve :: BS.ByteString -> BS.ByteString
solve input = cycleF (filter (/= BS.empty) $ tail $ BS.split '\n' input) Empty

main = BS.interact solve
