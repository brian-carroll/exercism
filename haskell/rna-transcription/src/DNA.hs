module DNA (toRNA) where

import Data.Maybe


toRNA :: String -> Maybe String
toRNA dna =
    let
        complement d =
            case d of
                'G' -> Just 'C'
                'C' -> Just 'G'
                'T' -> Just 'A'
                'A' -> Just 'U'
                _ -> Nothing

        rna =
            catMaybes $ map complement dna
    in
        if (length rna == length dna) then
            Just rna
        else
            Nothing
