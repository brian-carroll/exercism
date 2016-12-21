module DNA (count, nucleotideCounts) where

import Data.Map (Map, fromList)
import Data.Either (lefts, rights)

validChars :: String
validChars =
    "ACGT"


valid :: Char -> Bool
valid x =
    elem x validChars

count :: Char -> String -> Either String Int
count c s =
    let
        foldClosure :: Either String Int -> Char -> Either String Int
        foldClosure acc x =
            if not $ valid x then
                Left "Invalid strand"
            else
                case acc of
                    Left msg ->
                        Left msg
                    Right total ->
                        if x==c then
                            Right (total + 1)
                        else
                            Right total
    in
        if not $ valid c then
            Left "Invalid character"
        else
            foldl foldClosure (Right 0) s


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
