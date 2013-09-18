module Main where

import qualified Data.ByteString.Char8 as BS
import Data.Maybe

isSaw seq seq1 seq2 =
    let num1 = BS.findSubstring seq1 seq in
        if num1 == Nothing then False
            else let num2 = BS.findSubstring seq2 (BS.drop (fromJust num1 + BS.length seq1) seq) in
                num2 /= Nothing

solve route first second =
    let dir = isSaw route first second
        rev = isSaw (BS.reverse route) first second in
        if dir then
            if rev then "both" else "forward"
            else if rev then "backward" else "fantasy"

main = do
    route <- BS.getLine
    first <- BS.getLine
    second <- BS.getLine
    putStrLn (solve route first second)
