module Sublist exposing (..)


-- Got tail call optimisation working! :)


version : Int
version = 2


type ListComparison
    = Equal
    | Sublist
    | Superlist
    | Unequal


isSublistOf : List a -> List a -> Maybe Bool -> Bool
isSublistOf sub super result =
    case result of
        Just r ->
            r
        Nothing ->
            let
                subLength = List.length sub
                superLength = List.length super
            in
                if superLength < subLength then
                    False
                else if (List.take subLength super) == sub then
                    True
                else
                    isSublistOf sub (List.drop 1 super) result


sublist : List a -> List a -> ListComparison
sublist sub super =
    let
        isSub = isSublistOf sub super Nothing
        isSuper = isSublistOf super sub Nothing
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
