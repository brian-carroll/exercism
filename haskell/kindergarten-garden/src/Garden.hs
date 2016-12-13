module Garden
    ( Plant (..)
    , defaultGarden
    , garden
    , lookupPlants
    ) where

import Data.Map (Map, empty, insert, lookup)
import Data.List (sort)


data Plant = Clover
           | Grass
           | Radishes
           | Violets
           deriving (Eq, Show)


defaultChildren =
    [ "Alice"
    , "Bob"
    , "Charlie"
    , "David"
    , "Eve"
    , "Fred"
    , "Ginny"
    , "Harriet"
    , "Ileana"
    , "Joseph"
    , "Kincaid"
    , "Larry"
    ]


letterToPlant :: Char -> Plant
letterToPlant letter =
    case letter of
        'C' -> Clover
        'G' -> Grass
        'R' -> Radishes
        'V' -> Violets


rowLettersToPlants :: String -> [Plant]
rowLettersToPlants row =
    map letterToPlant row


defaultGarden :: String -> Map String [Plant]
defaultGarden =
    garden defaultChildren


{-
output is a map from children to plants

can work on strings, then map to plants afterwards, or the other way round
grab the plants two by two and assign them to the kids


iterate over children
    take 2 plantLetters


-}
iterateChildren :: [String] -> String -> String -> Map String [Plant] -> Map String [Plant]
iterateChildren children row1 row2 prevGarden =
    case (row1, row2) of
        (p1:p2:restRow1, p3:p4:restRow2) ->
            let
                childPlants =
                    map letterToPlant [p1,p2,p3,p4]

                newGarden =
                    insert (head children) childPlants prevGarden
            in
                iterateChildren (tail children) restRow1 restRow2 newGarden

        _ ->
            prevGarden



garden :: [String] -> String -> Map String [Plant]
garden children plantLetters =
    let
        ([firstRow], [secondRow]) =
            splitAt 1 (lines plantLetters)

        sortedChildren =
            sort children
    in
        iterateChildren sortedChildren firstRow secondRow empty


lookupPlants :: String -> Map String [Plant] -> [Plant]
lookupPlants child garden =
    case Data.Map.lookup child garden of
        Just x ->
            x
        Nothing ->
            []
