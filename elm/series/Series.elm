module Series exposing (..)


import String
import List
import Char
import Result


slicesHelper : Int -> List Int -> List (List Int) -> List (List Int)
slicesHelper len intList result =
    if List.length intList < len then
        result
    else
        let
            tail = List.drop 1 intList
            newResult = result ++ [List.take len intList]
        in
            slicesHelper len tail newResult


slices : Int -> String -> Result String (List (List Int))
slices len str =
    if len < 1 then
        Err ("Invalid size: " ++ toString len)
    else
        let
            badChars = String.filter (\c -> not (Char.isDigit c)) str
            chars = String.toList str
        in
            case String.left 1 badChars of
                "" ->
                    let
                        charStrings = String.split "" str
                        intList = List.map (\s -> Result.withDefault 0 (String.toInt s)) charStrings
                    in
                        Ok (slicesHelper len intList [])
                s ->
                    Err ("could not convert string '" ++ s ++ "' to an Int")
