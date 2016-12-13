module Raindrops exposing (..)

import String


div3str : Int -> String
div3str number =
    if rem number 3 == 0 then
        "Pling"
    else
        ""


div5str : Int -> String
div5str number =
    if rem number 5 == 0 then
        "Plang"
    else
        ""


div7str : Int -> String
div7str number =
    if rem number 7 == 0 then
        "Plong"
    else
        ""


raindrops : Int -> String
raindrops number =
    let
        divstr =
            div3str number ++ div5str number ++ div7str number
    in
        if String.isEmpty divstr then
            toString number
        else
            divstr
