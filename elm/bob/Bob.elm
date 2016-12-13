module Bob exposing (..)

import String
import Char


hey : String -> String
hey input =
    let
        trimmed =
            String.trim input

        lastchar =
            String.right 1 trimmed

        containsUpperCase =
            String.any Char.isUpper trimmed

        shouting =
            containsUpperCase && (trimmed == String.toUpper trimmed)
    in
        case ( trimmed, lastchar, shouting ) of
            ( "", _, _ ) ->
                "Fine. Be that way!"

            ( _, _, True ) ->
                "Whoa, chill out!"

            ( _, "?", _ ) ->
                "Sure."

            ( _, _, _ ) ->
                "Whatever."
