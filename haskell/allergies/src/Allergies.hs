module Allergies (Allergen(..), allergies, isAllergicTo) where

import Data.Bits ((.&.))


data Allergen
    = Cats
    | Chocolate
    | Eggs
    | Peanuts
    | Pollen
    | Shellfish
    | Strawberries
    | Tomatoes
    deriving (Show, Eq)

allergenBitmap :: [(Allergen, Int)]
allergenBitmap =
    [ (Eggs, 1)
    , (Peanuts, 2)
    , (Shellfish, 4)
    , (Strawberries, 8)
    , (Tomatoes, 16)
    , (Chocolate, 32)
    , (Pollen, 64)
    , (Cats, 128)
    ]


allergies :: Int -> [Allergen]
allergies score =
    map fst $
        filter (\(a,i) -> isAllergicTo a score) allergenBitmap


isAllergicTo :: Allergen -> Int -> Bool
isAllergicTo allergen score =
    case lookup allergen allergenBitmap of
        Just bits ->
            (bits .&. score) > 0 
        Nothing ->
            False
