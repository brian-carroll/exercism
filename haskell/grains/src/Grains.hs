module Grains (square, total) where

import Data.Maybe

square :: Integer -> Maybe Integer
square input =
    if input <= 0 then
        Nothing
    else if input > 64 then
        Nothing
    else
        let
            n :: Int
            n =
                fromInteger input
        in
            Just (product $ take (n-1) $ repeat 2)


total :: Integer
total =
    sum $ catMaybes $ map square [1..64] 
