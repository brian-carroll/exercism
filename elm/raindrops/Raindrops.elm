module Raindrops exposing (..)

import String


raindrops : Int -> String
raindrops x =
    let
        sound3 = if rem x 3 == 0 then "Pling" else ""
        sound5 = if rem x 5 == 0 then "Plang" else ""
        sound7 = if rem x 7 == 0 then "Plong" else ""
        sound = sound3 ++ sound5 ++ sound7
    in
        if String.isEmpty sound then
            toString x
        else
            sound
