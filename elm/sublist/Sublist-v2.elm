module Sublist exposing (..)


version : Int
version = 2


type ListComparison
    = Equal
    | Sublist
    | Superlist
    | Unequal


isSublistOf : List a -> List a -> Bool
isSublistOf sub super =
    let
        subLength = List.length sub
        superLength = List.length super
    in
        if superLength < subLength then
            False
        else if (List.take subLength super) == sub then
            True
        else
            sub `isSublistOf` (List.drop 1 super)


sublist : List a -> List a -> ListComparison
sublist sub super =
    let
        isSub = sub `isSublistOf` super
        isSuper = super `isSublistOf` sub
    in
        case (isSub, isSuper) of
            (False, False) ->
                Unequal
            (False, True) ->
                Superlist
            (True, False) ->
                Sublist
            (True, True) ->
                Equal
