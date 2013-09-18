module Main where

check :: Double -> [Double] -> Double -> Bool
check k a value = rem*(1 - k/100.0) > nec where
    rem = sum $ map (\x -> max 0.0 (x - value)) a
    nec = sum $ map (\x -> max 0.0 (value - x)) a

eps :: Double
eps = 1e-7

binS :: Double -> [Double] -> Double -> Double -> Double
binS k a left right =
    let binSearch = binS k a
        s = (left + right)/2 in
            if right - left < eps then s
                else if check k a s
                    then binSearch s right
                    else binSearch left s

solve :: String -> String -> Double
solve nk a = binS k al 0.0 (maximum al) where
    nkl = map read (words nk)
    k = head $ tail nkl
    al = map read (words a)

main = do
    nk <- getLine
    a <- getLine
--    print $ map (\x -> max 0.0 (x - 2.0)) a
    print $ solve nk a
