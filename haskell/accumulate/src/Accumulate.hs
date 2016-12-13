module Accumulate (accumulate) where

-- Lazy but not tail recursive
accumulate :: (a -> b) -> [a] -> [b]
accumulate f list =
    case list of
        [] ->
            []
        h:t ->
            (f h) : (accumulate f t)



-- -- Tail recursive but not lazy
-- accumulate :: (a -> b) -> [a] -> [b]
-- accumulate f list =
--     let
--         helper f list acc =
--             case list of
--                 [] ->
--                     acc
--                 h:t ->
--                     helper f t (acc ++ [f h])
--     in
--         helper f list []
