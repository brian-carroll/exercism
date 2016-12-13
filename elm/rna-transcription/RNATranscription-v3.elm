module RNATranscription exposing (toRNA)

{-
Performance improvement: skip some processing once the first error occurs
-}

import String
import List
import Maybe

getComplement : Char -> Maybe Char
getComplement nucleotide =
    case nucleotide of
        'G' -> Just 'C'
        'C' -> Just 'G'
        'T' -> Just 'A'
        'A' -> Just 'U'
        _ -> Nothing


updateErrAndResult : Char -> (Maybe Char, String) -> (Maybe Char, String)
updateErrAndResult dnaChar errAndResult =
    let
        (err, result) = errAndResult
    in
        case err of
            Just _ ->
                (err, result)
            Nothing ->
                let
                    rnaChar = getComplement dnaChar
                in
                    case rnaChar of
                        Nothing ->
                            ( Just dnaChar, result )
                        Just c ->
                            ( Nothing, result ++ (String.fromChar c) )


toRNA : String -> Result Char String
toRNA dna =
    let
        dnaList =
            String.toList dna
        (err, result) =
            List.foldl updateErrAndResult (Nothing, "") dnaList
    in
        case err of
            Just c ->
                Err c
            Nothing ->
                Ok result