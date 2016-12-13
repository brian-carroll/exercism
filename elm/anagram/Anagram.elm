module Anagram exposing (..)

import String
import List


sameLetterCount : String -> String -> String -> Bool
sameLetterCount target candidate letter =
    let
        targetCount =
            List.length (String.indices letter target)

        candidateCount =
            List.length (String.indices letter candidate)
    in
        targetCount == candidateCount


isAnagram : String -> String -> Bool
isAnagram targetLower candidate =
    let
        letters =
            String.split "" targetLower

        candidateLower =
            String.toLower candidate
    in
        List.all (sameLetterCount targetLower candidateLower) letters


detect : String -> List String -> List String
detect target candidates =
    let
        targetLower =
            String.toLower target

        targetLen =
            String.length target

        filteredCandidates =
            candidates
                |> List.filter (\s -> (String.length s) == targetLen)
                |> List.filter (\s -> (String.toLower s) /= targetLower)
    in
        List.filter (isAnagram targetLower) filteredCandidates
