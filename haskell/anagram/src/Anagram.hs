module Anagram (anagramsFor) where

import Data.List (map, sort, length, head, group)
import Data.Char (toLower)


letterCount :: String -> [(Char, Int)]
letterCount word =
    let
        groupedLetters =
            group $ sort $ map toLower word
        counts =
            map length $ groupedLetters
        letters =
            map head $ groupedLetters
    in
        zip letters counts


anagramsFor :: String -> [String] -> [String]
anagramsFor subject candidates =
    let
        subjectCounts =
            letterCount subject
        match w =
            (letterCount w == subjectCounts)
            && (map toLower w /= map toLower subject)
    in
        filter match candidates
