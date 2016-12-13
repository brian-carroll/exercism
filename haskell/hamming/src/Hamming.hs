module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance a b =
    let
        helper a b dist =
            case (a, b) of
                ([], _) ->
                    dist

                (_, []) ->
                    dist

                (ha:ta, hb:tb) ->
                    let
                        mismatch =
                            if ha == hb then
                                0
                            else
                                1
                    in
                        helper ta tb (dist+mismatch)
    in
        if length a /= length b then
            Nothing
        else
            Just (helper a b 0)
