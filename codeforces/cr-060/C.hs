module Main where

import Data.Maybe

eps :: Double
eps = 1e-7

data Vector = Vector Double Double Double

instance Eq Vector where
    (Vector vx vy vz) == (Vector ux uy uz) = abs (vx - ux) < eps && abs (vy - uy) < eps && abs (vz - uz) < eps

instance Show Vector where
    show (Vector x y z) = show x ++ " " ++ show y ++ " " ++ show z

plus :: Vector -> Vector -> Vector
plus (Vector vx vy vz) (Vector ux uy uz) = Vector (vx + ux) (vy + uy) (vz + uz)

minus :: Vector -> Vector -> Vector
minus (Vector vx vy vz) (Vector ux uy uz) = Vector (vx - ux) (vy - uy) (vz - uz)

divVec :: Vector -> Double -> Vector
divVec (Vector x y z) a = Vector (x/a) (y/a) (z/a)

len :: Vector -> Double
len (Vector x y z) = sqrt $ x*x + y*y + z*z

binSearch :: Vector -> Vector -> Double -> Double -> Double -> Vector -> Vector -> Vector
binSearch gpPos snPos gpVel snVel leftTime l r = if (len $ l `minus` r) < eps then l else
    let binS = binSearch gpPos snPos gpVel snVel leftTime
        m = (l `plus` r) `divVec` 2
        gpTime = (len $ m `minus` gpPos) / gpVel
        snTime = leftTime + (len $ m `minus` snPos) / snVel in
            if gpTime < snTime - eps
                then binS l m
                else binS m r

solve :: [Vector] -> Vector -> Double -> Double -> Double -> Maybe (Double, Vector)
solve [] _ _ _ _ = Nothing
solve [x] _ _ _ _ = Nothing
solve (start:rem) gpPos gpVel snVel leftTime = if gpVel < eps && snVel < eps then (if gpPos == start then Just (leftTime, gpPos) else Nothing) else
    let end = head rem
        gpTime = (len $ end `minus` gpPos) / gpVel
        snTime = leftTime + (len $ end `minus` start) / snVel in
            if gpTime > snTime + eps
                then solve rem gpPos gpVel snVel snTime
                else let t = (len $ v `minus` gpPos) / gpVel
                         v = binSearch gpPos start gpVel snVel leftTime start end in Just (t, v)

readVector :: IO Vector
readVector = do
    v <- getLine
    let coord = map read $ words v
    return $ Vector (coord !! 0) (coord !! 1) (coord !! 2)

readPoints :: Int -> IO [Vector]
readPoints 0 = return []
readPoints n = do
    v <- readVector
    lst <- readPoints $ n-1
    return $ v:lst


main = do
    sn <- getLine
    lst <- readPoints $ read sn + 1
    sV <- getLine
    garryPos <- readVector
    let lV = map read $ words sV
    let ans = solve ((head lst):lst) garryPos (lV !! 0) (lV !! 1) 0.0
    if ans == Nothing then do putStrLn "NO" else do
        putStrLn "YES"
        let a = fromJust ans
        print $ fst a
        print $ snd a
