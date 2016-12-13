module Scrabble (scoreLetter, scoreWord) where

import Data.Char (toUpper)

table :: [(String, Integer)]
table =
    [ ("AEIOULNRST", 1)
    , ("DG", 2)
    , ("BCMP", 3)
    , ("FHVWY", 4)
    , ("K", 5)
    , ("JX", 8)
    , ("QZ", 10)
    ]


scoreFromRow :: Char -> Integer -> (String, Integer) -> Integer
scoreFromRow c acc (letters, score) =
    if elem c letters then
        acc + score
    else
        acc


scoreLetter :: Char -> Integer
scoreLetter letter =
    let
        capital =
            toUpper letter

        curriedScore =
            scoreFromRow capital
    in
        foldl curriedScore 0 table


scoreWord :: String -> Integer
scoreWord w =
    sum $ map scoreLetter w
