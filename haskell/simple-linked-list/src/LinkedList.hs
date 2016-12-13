module LinkedList
    ( LinkedList
    , datum
    , fromList
    , isNil
    , new
    , next
    , nil
    , reverseLinkedList
    , toList
    ) where

data LinkedList a
    = Node a (LinkedList a)
    | Nil
    deriving Show

datum :: LinkedList a -> a
datum ll =
    case ll of
        Node value _ -> 
            value
        Nil ->
            error "No datum found"

fromList :: [a] -> LinkedList a
fromList list =
    case list of
        [] ->
            Nil
        h:t ->
            Node h (fromList t)

isNil :: LinkedList a -> Bool
isNil ll =
    case ll of
        Node _ _ -> 
            False
        Nil ->
            True

new :: a -> LinkedList a -> LinkedList a
new = Node

next :: LinkedList a -> LinkedList a
next ll =
    case ll of
        Node _ nextList -> 
            nextList
        Nil ->
            Nil

nil :: LinkedList a
nil =
    Nil

reverseLinkedList :: LinkedList a -> LinkedList a
reverseLinkedList ll =
    let
        rev old acc =
            case old of
                Nil ->
                    acc
                Node val oldNext ->
                    rev oldNext (new val acc)
    in
        rev ll nil


toList :: LinkedList a -> [a]
toList ll =
    case ll of
        Node value nextList ->
            value : (toList nextList)
        Nil ->
            []
