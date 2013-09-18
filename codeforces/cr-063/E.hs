module Main where

import qualified Data.Set as DS
import qualified Data.Map as DM
import Data.Maybe

data Elem = Elem Int Int
    deriving (Eq)

instance Ord Elem where
    compare a@(Elem c1 v1) b@(Elem c2 v2) =
        if a == b then EQ else
            if c1 < c2 || (c1 == c2 && v1 > v2) then LT else GT

toElem :: (Int, Int) -> Elem
toElem (a, b) = Elem a b

toTouple :: Elem -> (Int, Int)
toTouple (Elem a b) = (a, b)

process :: DS.Set Elem -> DM.Map Int Int -> [(Int, Int)] -> [Int]
process stElem _ [] = [snd $ toTouple $ DS.findMin stElem]
process stElem mpCount (q:qs) = let
    ans = snd $ toTouple $ DS.findMin stElem
    toAdd = snd q
    toRemove = fst q
    count = fromJust $ DM.lookup toRemove mpCount
    elem = Elem toRemove count
    newStElem = DS.delete elem stElem
    newCount = count - 1
    newMpCount = if newCount == 0 then DM.delete toRemove mpCount else DM.insertWith (+) toRemove (-1) mpCount
    newStElem2 = if newCount == 0 then newStElem else DS.insert (Elem newCount toRemove) newStElem
    --
    count2 = DM.findWithDefault 0 toAdd newMpCount
    elem2 = Elem toAdd count
    newStElem3 = if count2 /= 0 then DS.delete elem2 newStElem2 else newStElem2
    newCount2 = count2 + 1
    newMpCount2 = DM.insertWith (+) toAdd 1 newMpCount
    newStElem4 = DS.insert (Elem newCount2 toAdd) newStElem3 in
        ans:(process newStElem4 newMpCount2 qs)

solve :: [Int] -> [(Int, Int)] -> DM.Map Int Int -> [Int]
solve (x:xs) q mpCount = solve xs q $ DM.insertWith (+) x 1 mpCount
solve [] q mpCount = process stElem mpCount q where
    stElem = DS.fromList lst
    lst = map toElem (DM.toList mpCount)

readLst :: Int -> IO [Int]
readLst 0 = return []
readLst n = do
    s <- getLine
    lst <- readLst (n-1)
    return ((read s):lst)

printLst :: [Int] -> IO ()
printLst [] = return ()
printLst (x:xs) = do
    print x
    printLst xs

main = do
    sNK <- getLine
    let nk = map read $ words sNK
    let n = nk !! 0
    let k = nk !! 1
    lst <- readLst n
    let queries = zip (take (n-k) lst) (drop k lst)
    print queries
    let ans = solve (take k lst) queries DM.empty
    printLst ans
