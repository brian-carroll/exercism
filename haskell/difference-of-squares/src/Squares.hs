module Squares (difference, squareOfSums, sumOfSquares) where

difference :: Integral a => a -> a
difference n =
    (squareOfSums n) - (sumOfSquares n)


squareOfSums :: Integral a => a -> a
squareOfSums input =
    let
        n :: Int
        n =
            fromIntegral input :: Int

        s =
            sum $ take n [1..]
    in
        s*s



sumOfSquares :: Integral a => a -> a
sumOfSquares input =
    let
        n :: Int
        n =
            fromIntegral input

        numbers =
            take n [1..]

        f acc x =
            acc + x * x
    in
        foldl f 0 numbers
