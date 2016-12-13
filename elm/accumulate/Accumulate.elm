module Accumulate exposing (..)


accumulate : (a -> a) -> List a -> List a
accumulate f list =
    case list of
        [] ->
            []

        head :: tail ->
            (f head) :: (accumulate f tail)
