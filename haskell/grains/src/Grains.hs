module Grains (square, total) where

import Data.Maybe

{-
Speed-optimised version
Not actually sure how to benchmark this in Haskell! (...and no Wi-Fi right now to find out)

Notes:
 - Refactor the validity checks out of the 'total' calculation
 - Assume recursive summation is faster than calculating a power
     Might not be a great assumption! Depends on CPU and compiled implementation of **
 - Assume tail-call optimisation speeds up the compiled implementation
     No need to spend time creating stack frames & popping back up the call stack

-}


square :: Integer -> Maybe Integer
square input =
    if input <= 0 || input > 64 then
        Nothing
    else
        Just $ quot (1 + accumulateSquares 0 1 input) 2


-- recursive sum with tail call
accumulateSquares :: Integer -> Integer -> Integer -> Integer
accumulateSquares acc current finish =
    let
        newAcc = (2*acc)+1
    in
        case current == finish of
            True ->
                newAcc
            False ->
                accumulateSquares newAcc (current+1) finish


total :: Integer
total =
    accumulateSquares 0 1 64
