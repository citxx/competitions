module Main where

solve :: [[Int]] -> String
solve l = if x == 0 && y == 0 && z == 0 then "YES" else "NO" where
    x = sum $ map (!! 0) l
    y = sum $ map (!! 1) l
    z = sum $ map (!! 2) l

main = do
    n <- getLine
    forces <- getContents
    putStrLn $ solve $ map ((map read).words) $ lines forces
