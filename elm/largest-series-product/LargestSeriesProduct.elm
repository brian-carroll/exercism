module LargestSeriesProduct exposing (largestProduct)

import String
import Char
import List
import Result


helper : Int -> List Int -> Int -> Int
helper n numbers result =
    case numbers of
        [] ->
            result
        head :: tail ->
            let
                product =
                    List.product (List.take n numbers)

                newResult =
                    if (product > result) && (List.length numbers >= n) then
                        product
                    else
                        result
            in
                helper n tail newResult


largestProduct : Int -> String -> Maybe Int
largestProduct n str =
    if not (String.all Char.isDigit str) then
        Nothing
    else if n < 0 then
        Nothing
    else if n > String.length str then
        Nothing
    else if n == 0 && (String.length str) == 0 then
        -- This is weird but there's a test case for it so... OK whatever!
        Just 1
    else
        let
            numbers =
                str
                    |> String.split ""
                    |> List.map (\s -> Result.withDefault 0 (String.toInt s))
        in
            Just (helper n numbers 0)