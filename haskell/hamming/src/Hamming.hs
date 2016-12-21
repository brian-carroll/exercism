module Hamming (distance) where

helper :: String -> String -> Int -> Maybe Int
helper a b dist =
    case (a, b) of
        ([], []) ->
            Just dist

        (ha:ta, hb:tb) ->
            let
                mismatch =
                    if ha == hb then
                        0
                    else
                        1
            in
                helper ta tb (dist+mismatch)

        (_, _) ->
            Nothing  -- One strand was longer than the other


distance :: String -> String -> Maybe Int
distance a b =
    helper a b 0
