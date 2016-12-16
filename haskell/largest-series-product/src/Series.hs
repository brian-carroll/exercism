module Series (largestProduct) where

import Data.Char


helper n digits largest =
    if length digits < n then
        largest
    else
        helper n (tail digits) $
            max largest $
            product $
            take n digits


largestProduct n str =
    let
        validInputs =
            (n >= 1) && (n <= length str) && (all isDigit str)
        digits =
            map digitToInt str
    in
        if n == 0 then
            Just 1
        else if validInputs then
            Just (helper n digits 0)
        else
            Nothing
