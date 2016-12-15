module Roman (numerals) where


unitsNumerals =
    [ ""
    , "I"
    , "II"
    , "III"
    , "IV"
    , "V"
    , "VI"
    , "VII"
    , "VIII"
    , "IX"
    ]

tensNumerals =  
    [ ""
    , "X"
    , "XX"
    , "XXX"
    , "XL"
    , "L"
    , "LX"
    , "LXX"
    , "LXXX"
    , "XC"
    ]

hundredsNumerals =
    [ ""
    , "C"
    , "CC"
    , "CCC"
    , "CD"
    , "D"
    , "DC"
    , "DCC"
    , "DCCC"
    , "CM"
    ]


numerals :: Int -> Maybe String
numerals n =
    let
        units =
            unitsNumerals !! (n `mod` 10)
        tens =
            tensNumerals !! ((n `quot` 10) `mod` 10)
        hundreds =
            hundredsNumerals !! ((n `quot` 100) `mod` 10)
        thousands =
            take (n `quot` 1000) $ repeat 'M'
    in
        Just $ thousands ++ hundreds ++ tens ++ units
