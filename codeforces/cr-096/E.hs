module Main where

import Data.Array

main = interact (solve . lines)

solve :: [String] -> String
--solve [prog, n'] = unlines [show [dyn ! (k, l) | l <- [0..len]] | k <- [0..n]] where
solve [prog, n'] = show result where
    result = max (abs $ fst bestTuple) (abs $ snd bestTuple)
    bestTuple = foldl1 best [dyn ! (k, 0) | k <- [0, 2..n]]
    dyn = array cells [(x, distance x) | x <- range cells]
    cells = ((0, 0), (n, len))
    n = read n'
    len = length prog

    distance (k, l)
        | l == len   = if k == n then (0, 0) else (10000, -10000)
        | k == n     = effect (prog !! l) (dyn ! (k, l + 1))
        | otherwise  = best
            (effect (prog !! l) (dyn ! (k, l + 1)))
            (effect (rev $ prog !! l) (dyn ! (k + 1, l + 1)))

effect 'T' (a, b) = (-b, -a)
effect 'F' (a, b) = (a + 1, b + 1)

rev 'F' = 'T'
rev 'T' = 'F'

best :: (Int, Int) -> (Int, Int) -> (Int, Int)
best (a, b) (c, d) = (min a c, max b d)

-- distance :: (Int, Int) -> (Int, Int)
