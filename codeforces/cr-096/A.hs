module Main where

main = interact (solve)

solve :: String -> String
solve prog = if any (\c -> c == 'H' || c == '9' || c == 'Q') prog then "YES" else "NO"
