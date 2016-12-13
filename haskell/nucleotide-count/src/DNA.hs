module DNA (count, nucleotideCounts) where

import Data.Map (Map, fromList)
import Data.Either (lefts, rights)

valid :: Char -> Bool
valid x =
    elem x "ACGT"

count :: Char -> String -> Either String Int
count c s =
    if not $ valid c then
        Left "Invalid nucleotide"
    else if not $ all valid s then
        Left "Invalid sequence"
    else
        Right (length $ filter (== c) s)


nucleotideCounts :: String -> Either String (Map Char Int)
nucleotideCounts sequence =
    let
        validChars =
            "ACGT"

        counts =
            map (\c -> count c sequence) validChars

        allRight =
            null $ lefts counts
    in
        if not allRight then
            Left "Invalid input"
        else
            Right $ Data.Map.fromList $ zip validChars $ rights counts
