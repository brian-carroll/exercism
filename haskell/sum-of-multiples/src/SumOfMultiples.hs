module SumOfMultiples (sumOfMultiples) where

import Data.List

sumOfMultiples list upToNotIncluding =
    let
        firstNintegers =
            take upToNotIncluding [0..]

        factorMultiples fact =
            [x | x <- firstNintegers, x `mod` fact == 0]

        allFactors =
            concatMap factorMultiples list
        
        unique =
            nub allFactors
    in
        sum unique
