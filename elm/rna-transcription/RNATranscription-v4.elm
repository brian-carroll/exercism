module RNATranscription exposing (toRNA)

{-
Performance improvements:
    Custom recursion instead of standard lib foldl/map/whatever
    Tail call optimisation
    Terminate recursion on first error
Yeah perf doesn't matter. Just playing with what's possible.
-}

import String
import Maybe


getComplement : Char -> Maybe Char
getComplement nucleotide =
    case nucleotide of
        'G' -> Just 'C'
        'C' -> Just 'G'
        'T' -> Just 'A'
        'A' -> Just 'U'
        _ -> Nothing


toRNAHelper : (List Char, Maybe Char, String) -> (List Char, Maybe Char, String)
toRNAHelper (dnaList, err, result) =
    case (dnaList, err) of
        ( [], _ ) ->
            ([], err, result)

        ( h :: t, Just _ ) ->
            (t, err, result)

        ( h :: t, Nothing) ->
            let
                rnaChar = getComplement h
            in
                case rnaChar of
                    Nothing ->
                        ( t, Just h, result )
                    Just c ->
                        toRNAHelper ( t, Nothing, result ++ (String.fromChar c) )


toRNA : String -> Result Char String
toRNA dna =
    let
        dnaList =
            String.toList dna
        (_, err, result) =
            toRNAHelper (dnaList, Nothing, "")
    in
        case err of
            Just c ->
                Err c
            Nothing ->
                Ok result