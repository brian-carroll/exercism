module Allergies exposing (..)

import Dict exposing (Dict)
import Bitwise
import List


table : Dict String Int
table =
    Dict.fromList [
        ("eggs", 1),
        ("peanuts", 2),
        ("shellfish", 4),
        ("strawberries", 8),
        ("tomatoes", 16),
        ("chocolate", 32),
        ("pollen", 64),
        ("cats", 128)
    ]


isAllergicTo : String -> Int -> Bool
isAllergicTo allergy score =
    case Dict.get allergy table of
        Nothing ->
            False
        Just v ->
            (Bitwise.and v score) /= 0


toList : Int -> List String
toList score =
    List.filter (\a -> isAllergicTo a score) (Dict.keys table)
