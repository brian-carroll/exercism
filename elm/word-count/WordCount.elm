module WordCount exposing (..)

import Dict exposing (Dict)
import String
import List
import Char


updateCountVal : Maybe Int -> Maybe Int
updateCountVal existingValue =
    case existingValue of
        Nothing ->
            Just 1

        Just count ->
            Just (count + 1)


updateWordCount : String -> Dict String Int -> Dict String Int
updateWordCount word dict =
    if word == "" then
        dict
    else
        Dict.update word updateCountVal dict


wordCount : String -> Dict String Int
wordCount sentence =
    let
        listOfWords =
            sentence
                |> String.toLower
                |> String.map (\c -> if (Char.isLower c || Char.isDigit c) then c else ' ')
                |> String.split " "
    in
        List.foldl updateWordCount Dict.empty listOfWords
