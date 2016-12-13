module NucleotideCount exposing (..)


import List
import String


version : Int
version =
    2


nucleotideCounts : String -> { a : Int, c : Int, g : Int, t : Int }
nucleotideCounts sequence =
    let
        count : String -> Int
        count letter =
            List.length ( String.indices letter sequence )
    in
        {
            a = count "A",
            t = count "T",
            c = count "C",
            g = count "G"
        }
