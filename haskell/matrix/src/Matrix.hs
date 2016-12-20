{-
Incomplete solution! Will upload proper version soon
-}


module Matrix
    ( Matrix
    , cols
    , column
    , flatten
    , Matrix.fromList
    , fromString
    , reshape
    , row
    , rows
    , shape
    , transpose
    ) where

import Data.Vector (Vector, fromList, (!))
import Data.Char (isDigit)


data Matrix a =
    Matrix (Vector (Vector a))
    deriving (Eq, Show)


cols :: Matrix a -> Int
cols m = undefined
    -- case m of
    --     Matrix c -> length $ m ! 1

column :: Int -> Matrix a -> Vector a
column = undefined

flatten :: Matrix a -> Vector a
flatten = undefined

fromList :: [[a]] -> Matrix a
fromList ll =
    Matrix $
    Data.Vector.fromList $
    map Data.Vector.fromList ll


parseLine :: Bool -> String -> [String] -> String -> [String]
parseLine inQuotes buffer resultList s =
    case (inQuotes, s) of
        (_, "") ->              -- end of input string. Terminate recursion.
            resultList ++ [buffer]

        (True, '"':t) ->        -- exit from quoted section
            parseLine False buffer resultList t

        (True, h:t) ->          -- copy quoted matrix element into buffer
            parseLine True (buffer ++ [h]) resultList t

        (False, '"':t) ->       -- enter quoted section
            parseLine True buffer resultList t

        (False, ' ':t) ->       -- space between matrix elements => copy buffer to resultList
            parseLine False "" (resultList ++ [buffer]) t

        (False, h:t) ->         -- copy unquoted matrix element into buffer
            parseLine False (buffer ++ [h]) resultList t


fromString :: Read a => String -> Matrix a
fromString s =
    Matrix.fromList $
    map (map read) $
    map words $
    lines s
    -- let
    --     strListList :: [[String]]
    --     strListList =
    --         map (parseLine False "" []) $ lines s

    --     listList =
    --         if all (all (all isDigit)) strListList then
    --             map (map read) strListList
    --         else
    --             strListList
    -- in
    --     Matrix.fromList listList

reshape :: (Int, Int) -> Matrix a -> Matrix a
reshape = undefined

row :: Int -> Matrix a -> Vector a
row = undefined

rows :: Matrix a -> Int
rows = undefined

shape :: Matrix a -> (Int, Int)
shape = undefined

transpose :: Matrix a -> Matrix a
transpose = undefined
