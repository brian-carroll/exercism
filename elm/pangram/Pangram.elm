module Pangram exposing (..)

import String


alphabet : String
alphabet =
    "abcdefghijklmnopqrstuvwxyz"


isPangram : String -> Bool
isPangram sentence =
    let
        sentenceLower =
            String.toLower sentence

        sentenceContainsChar c =
            String.contains (String.fromChar c) sentenceLower
    in
        String.all sentenceContainsChar alphabet
