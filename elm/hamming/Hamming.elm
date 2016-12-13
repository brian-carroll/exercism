module Hamming exposing (..)

import String


distance : String -> String -> Maybe Int
distance a b =
    if String.length a /= String.length b then
        Nothing
    else
        List.map2 (==) (String.toList a) (String.toList b)
            |> List.map (\same -> if same then 0 else 1)
            |> List.sum
            |> Just
