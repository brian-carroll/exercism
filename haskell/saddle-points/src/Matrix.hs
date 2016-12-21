module Matrix (saddlePoints) where

import Data.Array (Array, bounds, (!), assocs)

saddlePoints matrix =
    let
        (maxRowIndex, maxColIndex) =
            snd $ bounds matrix
        
        getCol c =
            map (\r -> matrix ! (r,c)) [0..maxRowIndex]
        getRow r =
            map (\c -> matrix ! (r,c)) [0..maxColIndex]

        colMinima =
            map (minimum . getCol) [0..maxColIndex]
        rowMaxima =
            map (maximum . getRow) [0..maxRowIndex]

        isSaddlePoint ((r,c), value) =
            (value == rowMaxima !! r) && (value == colMinima !! c)
    in
        map fst $
            filter isSaddlePoint $
            assocs matrix
