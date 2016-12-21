module Series (slices) where

import Data.Char (digitToInt)


helper n xs len result =
    if len < n then
        result
    else
        helper n (tail xs) (len-1) (result ++ [take n xs])


slices :: Int -> String -> [[Int]]
slices n xs =
    if n==0 then
        [[]]
    else
        let
            digits =
                map digitToInt xs
        in
            helper n digits (length xs) []
