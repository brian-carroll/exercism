module RNATranscription exposing (..)

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
updateErrAndResult c errAndResult =
    let
        (err, result) = errAndResult
        rnaChar = getComplement c
        newErr =
            case rnaChar of
                Nothing ->
                    Just (Maybe.withDefault c err)
                Just _ ->
                    err
        newResult =
            case rnaChar of
                Nothing ->
                    result
                Just nucleotide ->
                    result ++ (String.fromChar nucleotide)
    in
        (newErr, newResult)


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