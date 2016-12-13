module Say exposing (say, SayError(..))

import String


type SayError
    = Negative
    | TooLarge


under10 : String -> String
under10 digit =
    case digit of
        "1" -> "one"
        "2" -> "two"
        "3" -> "three"
        "4" -> "four"
        "5" -> "five"
        "6" -> "six"
        "7" -> "seven"
        "8" -> "eight"
        "9" -> "nine"
        _ -> ""


teens : String -> String
teens digits =
    case digits of
        "10" -> "ten"
        "11" -> "eleven"
        "12" -> "twelve"
        "13" -> "thirteen"
        "14" -> "fourteen"
        "15" -> "fifteen"
        "16" -> "sixteen"
        "17" -> "seventeen"
        "18" -> "eighteen"
        "19" -> "nineteen"
        _ -> ""


under100 : String -> String
under100 digits =
    let
        lastDigit =
            String.right 1 digits

        lastWord d =
            if d == "0" then
                ""
            else
                "-" ++ under10 d
    in
        case (String.left 1 digits) of
            "0" -> under10 lastDigit
            "1" -> teens digits
            "2" -> "twenty" ++ (lastWord lastDigit)
            "3" -> "thirty" ++ (lastWord lastDigit)
            "4" -> "forty" ++ (lastWord lastDigit)
            "5" -> "fifty" ++ (lastWord lastDigit)
            "6" -> "sixty" ++ (lastWord lastDigit)
            "7" -> "seventy" ++ (lastWord lastDigit)
            "8" -> "eighty" ++ (lastWord lastDigit)
            "9" -> "ninety" ++ (lastWord lastDigit)
            _ -> ""


under1000 : String -> String
under1000 digits =
    let
        hundreds =
            under10 (String.left 1 digits)

        lastTwoDigits =
            under100 (String.right 2 digits)
    in
        case (hundreds, lastTwoDigits) of
            ("", "") ->
                ""
            ("", _) ->
                lastTwoDigits
            (_, "") ->
                hundreds ++ " hundred"
            (_, _) ->
                hundreds ++ " hundred and " ++ lastTwoDigits 


combineScales : String -> String -> String -> String
combineScales factor big small =
    case (big, small) of
        ("", "") ->
            ""
        ("", _) ->
            small
        (_, "") ->
            big ++ " " ++ factor
        (_, _) ->
            big ++ " " ++ factor ++ " " ++ small


say : Int -> Result SayError String
say x =
    if x < 0 then
        Err Negative
    else if x > 999999999999 then
        Err TooLarge
    else if x == 0 then
        Ok "zero"
    else
        let
            digits =
                String.padLeft 12 '0' (toString x)

            last3 =
                x `rem` 1000

            -- ugly exceptional case!!
            extraAnd =
                if (last3 < 100) && (last3 > 0) && (x>999) then
                    "and "
                else
                    "" 

            words =
                (extraAnd ++ under1000 (String.slice 9 12 digits))
                    |> combineScales "thousand" (under1000 (String.slice 6 9 digits))
                    |> combineScales "million"  (under1000 (String.slice 3 6 digits))
                    |> combineScales "billion"  (under1000 (String.slice 0 3 digits))
        in
            Ok words
