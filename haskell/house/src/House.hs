module House (rhyme) where
{-
    This is the                        horse and the hound and the horn

    that       belonged to     the     farmer sowing his corn
    that       kept            the     rooster that crowed in the morn
    that       woke            the     priest all shaven and shorn
    that       married         the     man all tattered and torn
    that       kissed          the     maiden all forlorn
    that       milked          the     cow with the crumpled horn
    that       tossed          the     dog
    that       worried         the     cat
    that       killed          the     rat
    that       ate             the     malt
    that       lay in          the     house that Jack built.
-}

import Data.List

items :: [(String, String)]
items =
    [ ("", "horse and the hound and the horn")
    , ("belonged to", "farmer sowing his corn")
    , ("kept", "rooster that crowed in the morn")
    , ("woke", "priest all shaven and shorn")
    , ("married", "man all tattered and torn")
    , ("kissed", "maiden all forlorn")
    , ("milked", "cow with the crumpled horn")
    , ("tossed", "dog")
    , ("worried", "cat")
    , ("killed", "rat")
    , ("ate", "malt")
    , ("lay in", "house that Jack built.")
    ]

nItems :: Int
nItems =
    length items


line :: (String, String) -> String
line (verb, noun) =
    "that " ++ verb ++ " the " ++ noun ++ "\n"


verse :: Int -> String
verse n =
    let
        keptLines =
            drop (nItems - n) items
    in
        "This is the " ++ (snd $ head keptLines) ++ "\n"
            ++ (concatMap line $ tail keptLines)


rhyme :: String
rhyme =
    intercalate "\n" $ map verse [1..nItems]
