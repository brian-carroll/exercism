module DNA (count, nucleotideCounts) where

import Data.Map (Map, fromList)
import Data.Either (lefts, rights)

validChars :: String
validChars =
    "ACGT"


valid :: Char -> Bool
valid x =
    elem x validChars


countHelper :: Char -> String -> Int -> Either String Int
countHelper c s total =
    case s of
        "" ->
            Right total
        h:t ->
            if not $ valid h then
                Left "Invalid strand" -- terminate recursion early
            else if h==c then
                countHelper c t (total+1)
            else
                countHelper c t total


count :: Char -> String -> Either String Int
count c s =
    if not $ valid c then
        Left "Invalid character"
    else
        countHelper c s 0


nucleotideCounts :: String -> Either String (Map Char Int)
nucleotideCounts sequence =
    let
        counts =
            map (\c -> count c sequence) validChars

        allRight =
            all (\c -> elem c validChars) sequence
    in
        if not allRight then
            Left "Invalid input"
        else
            Right $ Data.Map.fromList $ zip validChars $ rights counts
