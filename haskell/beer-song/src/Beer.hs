module Beer (song) where

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
        0 -> "no more bottles"
        1 -> "1 bottle"
        _ -> (show n) ++ " bottles"

generateLine :: String -> Int -> String
generateLine lyrics n =
    lyrics ++
        (nBottles n) ++
        " of beer on the wall, " ++
        (nBottles n) ++
        " of beer.\n" ++
        "Take one down and pass it around, " ++
        (nBottles (n-1)) ++
        " of beer on the wall.\n\n"

mostOfTheLines :: String
mostOfTheLines =
    foldl generateLine "" [99,98..2]


song :: String
song =
    mostOfTheLines ++
        "1 bottle of beer on the wall, 1 bottle of beer.\n" ++
        "Take " ++ "it" ++ " down and pass it around, no more bottles of beer on the wall.\n\n" ++
        "No more bottles of beer on the wall, no more bottles of beer.\n" ++
        "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
