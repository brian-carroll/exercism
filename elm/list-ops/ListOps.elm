module ListOps exposing (..)


length : List a -> number
length x =
    let
        len x acc =
            case x of
                [] ->
                    acc
                head :: tail ->
                    len tail (acc+1)
    in
        len x 0


reverse : List a -> List a
reverse x =
    let
        rev x acc =
            case x of
                [] ->
                    acc
                head :: tail ->
                    rev tail (head :: acc)
    in
        rev x []


map : (a -> b) -> List a -> List b
map f x =
    let
        helper f x acc =
            case x of
                [] ->
                    acc
                head :: tail ->
                    helper f tail (acc ++ [f head])
    in
        helper f x []


filter : (a -> Bool) -> List a -> List a
filter f x =
    let
        helper f x acc =
            case x of
                [] ->
                    acc
                head :: tail ->
                    if f head then
                        helper f tail (acc ++ [head])
                    else
                        helper f tail acc
    in
        helper f x []


foldl : (a -> b -> b) -> b -> List a -> b
foldl f acc x =
    case x of
        [] ->
            acc
        head :: tail ->
            foldl f (f head acc) tail


foldr : (a -> b -> b) -> b -> List a -> b
foldr f acc x =
    foldl f acc (reverse x)


append : List a -> List a -> List a
append a b =
    case b of
        [] ->
            a
        head :: tail ->
            append (a ++ [head]) tail


concat : List (List a) -> List a
concat x =
    let
        helper x acc =
            case x of
                [] ->
                    acc
                head :: tail ->
                    helper tail (append acc head)
    in
        helper x []
