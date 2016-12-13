module ListOps
  ( length
  , reverse
  , map
  , filter
  , foldr
  , foldl'
  , (++)
  , concat
  ) where

import Prelude hiding
  ( length, reverse, map, filter, foldr, (++), concat )

foldl' :: (b -> a -> b) -> b -> [a] -> b
foldl' f acc list =
  case list of
    [] ->
      acc
    h:t ->
      foldl' f (f acc h) t 

foldr :: (a -> b -> b) -> b -> [a] -> b
foldr f acc list =
  case list of
    [] ->
      acc
    h:t ->
      f h (foldr f acc t)

length :: [a] -> Int
length list =
  case list of
    [] ->
      0
    h:t ->
      1 + length t

reverse :: [a] -> [a]
reverse ll =
    let
        rev old acc =
            case old of
                [] ->
                    acc
                h:t ->
                    rev t (h : acc)
    in
        rev ll []

map :: (a -> b) -> [a] -> [b]
map f list =
  case list of
    [] ->
      []
    h:t ->
      (f h) : (map f t)


filter :: (a -> Bool) -> [a] -> [a]
filter f list =
  case list of
    [] ->
      []

    h:t ->
      if f h then
        h : (filter f t)
      else
        filter f t


(++) :: [a] -> [a] -> [a]
xs ++ ys =
  case xs of
    [] ->
      ys
    h:t ->
      h : (t ++ ys)

concat :: [[a]] -> [a]
concat listOfLists =
  foldr (++) [] listOfLists 
