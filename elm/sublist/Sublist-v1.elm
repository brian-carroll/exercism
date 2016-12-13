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
    in
        if (List.take subLength super) == sub then
            True
        else
            case super of
                [] ->
                    False
                head :: tail ->
                    if (List.length tail < subLength) then
                        False
                    else
                        sub `isSublistOf` tail


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
