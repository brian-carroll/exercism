module ETL (transform) where

import Data.Map (Map, empty, foldlWithKey, insert)
import Data.Char (toLower)
import Data.List (foldl)


transformOneScore :: Map Char Int -> Int -> String -> Map Char Int
transformOneScore accMap score letters =
    let
        accMap' =
            foldl
                (\oldMap letter -> insert (toLower letter) score oldMap)
                accMap
                letters
    in
        accMap'


transform :: Map Int String -> Map Char Int
transform legacy =
    foldlWithKey transformOneScore empty legacy
