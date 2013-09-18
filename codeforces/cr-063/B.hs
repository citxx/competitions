module Main where

data Skier = Skier Int Int Int Int Int
    deriving (Eq, Show)

instance Ord Skier where
    compare (Skier n1 _ _ t1 _) (Skier n2 _ _ t2 _) =
        if t1 == t2 && n1 == n2 then EQ else
            if t1 < t2 || (t1 == t2 && n1 > n2) then LT
                else GT

isRun :: Int -> Skier -> Bool
isRun num (Skier _ l r _ _) = l <= num && num <= r

solve :: Int -> [Skier] -> Int
solve 0 _ = 0
solve n skiers = current + solve (n-1) skiers where
    current = cost winner
    cost (Just (Skier _ _ _ _ c)) = c
    cost Nothing = 0
    winner = if length rn == 0 then Nothing else Just (minimum rn)
    rn = filter (isRun n) skiers

readSkiers :: Int -> IO [Skier]
readSkiers 0 = return []
readSkiers n = do
    sk <- getLine
    let x = map read $ words sk
    let skier = Skier n (x!!0) (x!!1) (x!!2) (x!!3)
    follow <- readSkiers $ n-1
    return (skier:follow)

main = do
    sNM <- getLine
    let nm = map read $ words sNM
    let n = nm !! 0
    let m = nm !! 1
    lst <- readSkiers m
--    print lst
    print $ solve n lst
