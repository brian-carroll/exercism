module PhoneNumber exposing (..)

import String
import Char


getNumber : String -> Maybe String
getNumber str =
    let
        digits = String.filter Char.isDigit str
        len = String.length digits
        head_tail = String.uncons digits
    in
        case (len, head_tail) of
            (10, _) ->
                Just digits
            (11, Just ('1', s)) ->
                Just (String.dropLeft 1 digits)
            _ ->
                Nothing


prettyPrint : String -> Maybe String
prettyPrint str =
    case getNumber str of
        Nothing ->
            Nothing
        Just s ->
            let
                s1 = String.slice 0 3 s
                s2 = String.slice 3 6 s
                s3 = String.slice 6 10 s
            in
                Just ("(" ++ s1 ++ ") " ++ s2 ++ "-" ++ s3)