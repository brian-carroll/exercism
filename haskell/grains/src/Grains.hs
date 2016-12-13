module Grains (square, total) where

import Data.Maybe

{-
Speed-optimised version
Not actually sure how to benchmark this in Haskell! (...and no Wi-Fi right now to find out)

Notes:
 - Refactor the validity checks out of the 'total' calculation
 - Assume recursive summation is faster than calculating a power

-}


square :: Integer -> Maybe Integer
square input =
    if input <= 0 || input > 64 then
        Nothing
    else
        Just $ quot (1 + accumulateSquares input) 2


accumulateSquares :: Integer -> Integer
accumulateSquares n =
    case n of
        1 ->
            1
        _ ->
            1 + 2*(accumulateSquares (n-1))

total :: Integer
total =
    accumulateSquares 64
