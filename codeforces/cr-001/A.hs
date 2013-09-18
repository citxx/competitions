module Main where

solve :: Integer -> Integer -> Integer -> Integer
solve n m a = (div (n-1) a + 1) * (div (m-1) a + 1)

main = do
    s <- getLine
    let input = words s
    print (solve (read (input !! 0) :: Integer) (read (input !! 1) :: Integer) (read (input !! 2) :: Integer))
