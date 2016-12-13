module RunLengthEncoding exposing (..)

{-
recursion
    keep track of currentChar, which is a Maybe Char
    check if next char is the same as currentChar
    if so, increment
    if not, switch currentChar, convert count to string and concat it to output string

decoding
    

-}

import String
import Char


version : Int
version = 2


encodeUnit : Char -> Int -> String
encodeUnit char count =
    if count > 1 then
        (toString count) ++ (String.fromChar char)
    else
        String.fromChar char


encodeHelp : String -> Char -> Int -> String -> String
encodeHelp inputString currentChar count outputString =
    case (String.uncons inputString) of
        Nothing ->
            outputString ++ (encodeUnit currentChar count)
        Just (head, tail) ->
            if head == currentChar then
                encodeHelp tail currentChar (count+1) outputString
            else
                encodeHelp tail head 1 (outputString ++ (encodeUnit currentChar count))


encode : String -> String
encode str =
    case (String.uncons str) of
        Nothing ->
            ""
        Just (head, tail) ->
            encodeHelp str head 0 ""


decodeUnit : String -> Char -> String
decodeUnit countString c =
    case String.toInt countString of
        Ok count ->
            String.repeat count (String.fromChar c)
        Err _ ->
            String.fromChar c


decodeHelp : String -> String -> String -> String
decodeHelp inputString countString outputString =
    case (String.uncons inputString) of
        Nothing ->
            outputString
        Just (head, tail) ->
            if Char.isDigit head then
                decodeHelp tail (countString ++ (String.fromChar head)) outputString
            else
                decodeHelp tail "" (outputString ++ (decodeUnit countString head))


decode : String -> String
decode str =
    decodeHelp str "" ""
