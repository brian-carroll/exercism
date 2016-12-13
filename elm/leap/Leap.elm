module Leap exposing (..)


isLeapYear year =
    let
        isDiv400 =
            (rem year 400) == 0

        isDiv100 =
            (rem year 100) == 0

        isDiv4 =
            (rem year 4) == 0
    in
        case ( isDiv400, isDiv100, isDiv4 ) of
            ( True, _, _ ) ->
                True

            ( False, True, _ ) ->
                False

            ( False, False, True ) ->
                True

            ( False, False, False ) ->
                False
