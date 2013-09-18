module Main where

data Answer = Answer Int Int
    deriving (Eq)

instance Ord Answer where
    compare (Answer flow1 cost1) (Answer flow2 cost2) =
        case compare flow1 flow2 of
            LT -> LT
            GT -> GT
            EQ -> compare cost2 cost1

main = do
    print "Hello"
