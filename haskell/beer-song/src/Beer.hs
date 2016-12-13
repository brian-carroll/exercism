module Beer (song) where

import Data.Char (toUpper)
import Data.List (intercalate)

-- song :: String
-- song = "
--        \2 bottles of beer on the wall, 2 bottles of beer.\n\
--        \Take one down and pass it around, 1 bottle of beer on the wall.\n\
--        \\n\
--        \1 bottle of beer on the wall, 1 bottle of beer.\n\
--        \Take it down and pass it around, no more bottles of beer on the wall.\n\
--        \\n\
--        \No more bottles of beer on the wall, no more bottles of beer.\n\
--        \Go to the store and buy some more, 99 bottles of beer on the wall.\n"

nBottles :: Int -> String
nBottles n =
    case n of
        -1 -> "99 bottles"
        0 -> "no more bottles"
        1 -> "1 bottle"
        _ -> (show n) ++ " bottles"


thirdBitOfVerse :: Int -> String
thirdBitOfVerse n =
    if n==0 then
        "Go to the store and buy some more, "
    else
        "Take " ++
        (if n==1 then "it" else "one")
        ++ " down and pass it around, "


capitalize :: String -> String
capitalize s =
    (toUpper $ head s) : (tail s)


generateLine :: Int -> String
generateLine n =
    (capitalize (nBottles n)) ++ " of beer on the wall, " ++
    (nBottles n) ++ " of beer.\n" ++
    (thirdBitOfVerse n) ++
    (nBottles (n-1)) ++ " of beer on the wall.\n"


song :: String
song =
    intercalate "\n" $
        map generateLine [99,98..0]
