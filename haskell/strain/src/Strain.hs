module Strain (keep, discard) where

discard :: (a -> Bool) -> [a] -> [a]
discard predicate list =
    keep (not . predicate) list

keep :: (a -> Bool) -> [a] -> [a]
keep predicate list =
    case list of
        [] ->
            []
        h:t ->
            if predicate h then
                h : keep predicate t
            else
                keep predicate t
