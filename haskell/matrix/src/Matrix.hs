module Matrix
    ( Matrix
    , cols
    , column
    , flatten
    , fromList
    , fromString
    , reshape
    , row
    , rows
    , shape
    , transpose
    ) where

import qualified Data.Vector as Vector (Vector, fromList, (!), length, head, map, toList, concat, null, slice)
import Data.Char (isDigit)


data Matrix a =
    Matrix (Vector.Vector (Vector.Vector a))
    deriving (Eq, Show)


cols :: Matrix a -> Int
cols m =
    case m of
        Matrix vv ->
            if Vector.null vv then
                0
            else
                Vector.length $ Vector.head vv


column :: Int -> Matrix a -> Vector.Vector a
column i m =
    case m of
        Matrix vv ->
            Vector.map (\r -> r Vector.! i) vv


flatten :: Matrix a -> Vector.Vector a
flatten m =
    case m of
        Matrix vv ->
            Vector.concat $ Vector.toList vv


fromList :: [[a]] -> Matrix a
fromList ll =
    Matrix $
    Vector.fromList $
    map Vector.fromList ll


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
    fromList $
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
reshape (r,c) m =
    let
        f =
            flatten m
        lastRowIndex =
            (Vector.length f) - c
        rowIndices =
            [0,c..lastRowIndex]
    in
        Matrix $
            Vector.fromList $
            map (\i -> Vector.slice i c f) rowIndices


row :: Int -> Matrix a -> Vector.Vector a
row i m =
    case m of
        Matrix vv ->
            vv Vector.! i


rows :: Matrix a -> Int
rows m =
    case m of
        Matrix vv ->
            Vector.length vv


shape :: Matrix a -> (Int, Int)
shape m =
    (rows m, cols m)


transpose :: Matrix a -> Matrix a
transpose m =
    let
        lastCol =
            (cols m) -1
        columnIndices =
            [0..lastCol]
    in
        Matrix $
            Vector.fromList $
            map (\i -> column i m) columnIndices
