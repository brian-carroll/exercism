module RomanNumerals exposing (toRoman)

import String

{-
    Gave up on calculating patterns and just went for a dumb look-up table.
    Otherwise there are just so many exceptions that it's unreadable.
-}

thousands : String -> String
thousands digit =
    case digit of
        "3" -> "MMM"
        "2" -> "MM"
        "1" -> "M"
        _ -> ""


hundreds : String -> String
hundreds digit =
    case digit of
        "9" -> "CM"
        "8" -> "DCCC"
        "7" -> "DCC"
        "6" -> "DC"
        "5" -> "D"
        "4" -> "CD"
        "3" -> "CCC"
        "2" -> "CC"
        "1" -> "C"
        _ -> ""


tens : String -> String
tens digit =
    case digit of
        "9" -> "XC"
        "8" -> "LXXX"
        "7" -> "LXX"
        "6" -> "LX"
        "5" -> "L"
        "4" -> "XL"
        "3" -> "XXX"
        "2" -> "XX"
        "1" -> "X"
        _ -> ""


units : String -> String
units digit =
    case digit of
        "9" -> "IX"
        "8" -> "VIII"
        "7" -> "VII"
        "6" -> "VI"
        "5" -> "V"
        "4" -> "IV"
        "3" -> "III"
        "2" -> "II"
        "1" -> "I"
        _ -> ""


toRoman : Int -> String
toRoman x =
    let
        digits =
            String.padLeft 4 '0' (toString x)
    in
        (
                thousands (String.slice 0 1 digits)
            ++  hundreds (String.slice 1 2 digits)
            ++  tens (String.slice 2 3 digits)
            ++  units (String.slice 3 4 digits)
        )
