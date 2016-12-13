module Hamming exposing (..)

import String


distanceHelp : String -> String -> Int
distanceHelp a b =
    let
        aUncons =
            String.uncons a

        bUncons =
            String.uncons b
    in
        case ( aUncons, bUncons ) of
            ( Just ( ha, ta ), Just ( hb, tb ) ) ->
                let
                    inc =
                        if ha == hb then
                            0
                        else
                            1
                in
                    inc + distanceHelp ta tb

            ( _, _ ) ->
                0


distance : String -> String -> Maybe Int
distance a b =
    if String.length a /= String.length b then
        Nothing
    else
        Just (distanceHelp a b)
