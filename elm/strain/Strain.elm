module Strain exposing (..)

{-
check if function returns true
if so, cons value to output list

how to do recursive shit
terminating case: list is empty, return the accumulator
function is true, return head :: keep f tail
recurse and return
-}

keep : (a -> Bool) -> List a -> List a
keep f list =
    case list of
        [] ->
            []
        head :: tail ->
            if (f head) then
                head :: (keep f tail)
            else
                keep f tail

discard : (a -> Bool) -> List a -> List a
discard f list =
    case list of
        [] ->
            []
        head :: tail ->
            if not (f head) then
                head :: (discard f tail)
            else
                discard f tail
