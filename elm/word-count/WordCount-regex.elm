module WordCount exposing (..)

import Dict exposing (Dict)
import String
import List
import Regex exposing (regex, replace)


updateCountVal : Maybe Int -> Maybe Int
updateCountVal existingValue =
    case existingValue of
        Nothing ->
            Just 1

        Just count ->
            Just (count + 1)


updateWordCount : String -> Dict String Int -> Dict String Int
updateWordCount word dict =
    Dict.update word updateCountVal dict


wordCount : String -> Dict String Int
wordCount sentence =
    let
        listOfWords =
            sentence
                |> String.toLower
                |> replace Regex.All (regex "[^0-9a-z]+") (\_ -> " ")
                |> String.trim
                |> String.split " "
    in
        List.foldl updateWordCount Dict.empty listOfWords
