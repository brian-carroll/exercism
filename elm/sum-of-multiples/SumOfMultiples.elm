module SumOfMultiples exposing (sumOfMultiples)


import List
import Set


generateMultiples : Int -> Int -> List Int
generateMultiples limit factor =
    let
        maxMultiplier = (limit-1)//factor
    in
        List.map ((*) factor) [1..maxMultiplier]


sumOfMultiples : List Int -> Int -> Int
sumOfMultiples factorList limit =
    factorList
        |> List.map (generateMultiples limit) 
        |> List.concat
        |> Set.fromList
        |> Set.toList
        |> List.sum