module Raindrops exposing (..)

import String


getSound : Int -> Int -> String -> String
getSound num den str =
    if rem num den == 0 then
        str
    else
        ""


raindrops : Int -> String
raindrops x =
    let
        sound =
            getSound x 3 "Pling" ++ getSound x 5 "Plang" ++ getSound x 7 "Plong"
    in
        if String.isEmpty sound then
            toString x
        else
            sound
