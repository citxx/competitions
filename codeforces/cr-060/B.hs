module Main where

import Data.Maybe

convert :: String -> String -> Maybe String
convert prev y = if acc == [] then Nothing else Just (minimum acc) where
    acc = filter (>= prev) all
    all = concatMap vars [0 .. 3]
    vars n = map (\c -> take n y ++ c:(drop (n+1) y)) ['0' .. '9']

build :: String -> [String] -> [String]
build _ [] = []
build prev (y:ys) = conv : (build conv ys)
    where conv = fromMaybe "9999" $ convert prev y

solve :: [String] -> Maybe [String]
solve years = if last ans <= "2011" then Just ans else Nothing where
    ans = build "1000" years

main = do
    sn <- getLine
    sYear <- getContents
    let lYear = words sYear
    let ans = solve lYear
    putStrLn $ if ans == Nothing
        then "No solution"
        else unlines (fromMaybe [] ans)
