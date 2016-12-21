module Triplet (isPythagorean, mkTriplet, pythagoreanTriplets) where

import Data.List

isPythagorean :: (Integer, Integer, Integer) -> Bool
isPythagorean triplet =
    case triplet of
        (a,b,c) ->
            c*c == (a*a + b*b)


mkTriplet a b c =
    case sort [a,b,c] of
        [x,y,z] ->
            (x,y,z)


listToTriplet list =
    case list of
        [a,b,c] ->
            mkTriplet a b c


pythagoreanTriplets :: Integer -> Integer -> [(Integer, Integer, Integer)]
pythagoreanTriplets x y =
    let
        permutations =
            [[a,b,c] | a <- [x..y], b <- [x..y], c <- [x..y]]

        uniqueSortedPerms =
            nub $ map listToTriplet permutations
    in
        filter isPythagorean uniqueSortedPerms
