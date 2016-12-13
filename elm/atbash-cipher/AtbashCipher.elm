module AtbashCipher exposing (..)

import Char
import String


codeA : Int
codeA =
    Char.toCode 'a'


codeZ : Int
codeZ =
    Char.toCode 'z'


substitute : Char -> Char
substitute c =
    if Char.isDigit c then
        c
    else
        Char.fromCode (codeZ - (Char.toCode c - codeA))


insertSpaces : String -> String
insertSpaces input =
    let
        helper acc s =
            if (String.length s) > 5 then
                helper (acc ++ (String.left 5 s) ++ " ") (String.dropLeft 5 s)
            else
                acc ++ s
    in
        helper "" input



encode : String -> String
encode plain =
    plain
        |> String.toLower
        |> String.filter (\c -> (Char.isLower c) || (Char.isDigit c))
        |> String.map substitute
        |> insertSpaces


decode : String -> String
decode cipher =
    cipher
        |> String.toLower
        |> String.filter (\c -> (Char.isLower c) || (Char.isDigit c))
        |> String.map substitute
