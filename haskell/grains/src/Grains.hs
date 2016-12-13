module Grains (square, total) where

import Data.Maybe

{-
Speed-optimised version
Not actually sure how to benchmark this in Haskell! (...and no Wi-Fi right now to find out)

Notes:
 - Refactor the validity checks out of the 'total' calculation
 - Assume built-in ** is fastest way to do powers
        (**) expects Floating typeclass
 - Avoid type conversions where possible (generate list of square indices as float)
 - Neither Float nor Double have enough accuracy to get the sum correct!
        Makes sense, they only give us 22 or 44 "binary places" and we need 63
        Only Integer can give this precision
        Need to convert to Integer for every square, then sum the integers

-}

sq :: Float -> Integer
sq n =
    round $ 2 ** (n - 1.0)


square :: Integer -> Maybe Integer
square input =
    if input <= 0 || input > 64 then
        Nothing
    else
        Just (sq $ fromInteger input)


total :: Integer
total =
    sum $ map sq [1.0..64.0]
