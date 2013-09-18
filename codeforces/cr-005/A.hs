module Main where

import qualified Data.Set as Set
import Data.List
import IO

type SetStr = Set.Set String

perform :: String -> (SetStr, Int) -> (SetStr, Int)
perform query@(x:xs) (s, ans)
    | x == '+'  = (Set.insert xs s, ans)
    | x == '-'  = (Set.delete xs s, ans)
    | otherwise = (s, ans + usersCount*msgLength) where
        usersCount =  Set.size s
        msgLength  = length (dropWhile (/= ':') query) - 1

processQuery :: (SetStr, Int) -> IO ()
processQuery state@(s, ans) = do
    stop <- isEOF
    if (not stop) then do
        query <- getLine
        let newState = perform query state
        processQuery newState
        else do
            print ans

main = processQuery (Set.empty, 0)
