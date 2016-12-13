module RNATranscription exposing (..)

import String
import List


getComplement : Char -> Maybe Char
getComplement nucleotide =
    case nucleotide of
        'G' -> Just 'C'
        'C' -> Just 'G'
        'T' -> Just 'A'
        'A' -> Just 'U'
        _ -> Nothing


invalidDNAchar : Char -> Bool
invalidDNAchar c =
    case (getComplement c) of
        Nothing ->
            True
        Just _ ->
            False


toRNA : String -> Result Char String
toRNA dna =
    let
        dnaList =
            String.toList dna

        firstInvalidChar =
            dnaList
                |> List.filter invalidDNAchar
                |> List.head
    in
        case firstInvalidChar of
            Just c ->
                Err c
            Nothing ->
                dnaList
                    |> List.filterMap getComplement
                    |> String.fromList
                    |> Ok
